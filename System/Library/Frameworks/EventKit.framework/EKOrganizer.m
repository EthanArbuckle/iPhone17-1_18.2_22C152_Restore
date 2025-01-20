@interface EKOrganizer
+ (Class)frozenClass;
+ (id)organizerWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 address:(id)a6 isCurrentUser:(BOOL)a7;
- (BOOL)isCurrentUser;
- (EKOrganizer)initWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 address:(id)a6 isCurrentUser:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)owner;
- (int64_t)participantRole;
- (int64_t)participantStatus;
- (int64_t)participantType;
- (int64_t)scheduleAgent;
- (void)setCurrentUser:(BOOL)a3;
- (void)setScheduleAgent:(int64_t)a3;
@end

@implementation EKOrganizer

- (int64_t)participantType
{
  return 1;
}

- (int64_t)participantStatus
{
  return 2;
}

- (BOOL)isCurrentUser
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57170]];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)organizerWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 address:(id)a6 isCurrentUser:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithName:v15 emailAddress:v14 phoneNumber:v13 address:v12 isCurrentUser:v7];

  return v16;
}

- (EKOrganizer)initWithName:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 address:(id)a6 isCurrentUser:(BOOL)a7
{
  BOOL v7 = a7;
  v8 = [(EKParticipant *)self initWithName:a3 emailAddress:a4 phoneNumber:a5 url:a6];
  v9 = v8;
  if (v8) {
    [(EKOrganizer *)v8 setCurrentUser:v7];
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([MEMORY[0x1E4F57690] isProgramSDKAtLeast:0x7E30901FFFFFFFFLL])
  {
    v11.receiver = self;
    v11.super_class = (Class)EKOrganizer;
    return [(EKObject *)&v11 copyWithZone:a3];
  }
  else
  {
    v6 = [(EKParticipant *)self name];
    BOOL v7 = [(EKParticipant *)self emailAddress];
    v8 = [(EKParticipant *)self phoneNumber];
    v9 = [(EKParticipant *)self URL];
    v5 = +[EKOrganizer organizerWithName:v6 emailAddress:v7 phoneNumber:v8 address:v9 isCurrentUser:[(EKOrganizer *)self isCurrentUser]];
  }
  return v5;
}

- (int64_t)participantRole
{
  return 3;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKParticipant *)self UUID];
  v6 = [(EKParticipant *)self name];
  BOOL v7 = [(EKParticipant *)self emailAddress];
  v8 = [(EKParticipant *)self phoneNumber];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; name = %@; email = %@; phone = %@; isSelf = %d}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
  v9 = [(EKOrganizer *)self isCurrentUser]);

  return v9;
}

- (id)owner
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57160]];
}

- (void)setCurrentUser:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57170]];
}

- (int64_t)scheduleAgent
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57178]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setScheduleAgent:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57178]];
}

@end