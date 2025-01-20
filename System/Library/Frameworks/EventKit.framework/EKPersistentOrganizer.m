@interface EKPersistentOrganizer
+ (Class)meltedClass;
+ (id)defaultPropertiesToLoad;
+ (id)organizerWithName:(id)a3 emailAddress:(id)a4 address:(id)a5 isCurrentUser:(BOOL)a6;
+ (id)relations;
- (BOOL)isCurrentUser;
- (EKPersistentOrganizer)initWithName:(id)a3 emailAddress:(id)a4 address:(id)a5 isCurrentUser:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)owner;
- (int)entityType;
- (int64_t)scheduleAgent;
- (void)setIsCurrentUser:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setScheduleAgent:(int64_t)a3;
@end

@implementation EKPersistentOrganizer

+ (id)defaultPropertiesToLoad
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EKPersistentOrganizer_defaultPropertiesToLoad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPropertiesToLoad_onceToken_7 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_7, block);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_6;

  return v2;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

+ (id)relations
{
  if (relations_onceToken_11 != -1) {
    dispatch_once(&relations_onceToken_11, &__block_literal_global_49);
  }
  v2 = (void *)relations_relations_11;

  return v2;
}

- (int)entityType
{
  return 8;
}

void __34__EKPersistentOrganizer_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56C60]];
  v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations_11;
  relations_relations_11 = v2;
}

- (BOOL)isCurrentUser
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F57170]];
}

void __48__EKPersistentOrganizer_defaultPropertiesToLoad__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___EKPersistentOrganizer;
  v1 = objc_msgSendSuper2(&v6, sel_defaultPropertiesToLoad);
  uint64_t v2 = *MEMORY[0x1E4F57178];
  v7[0] = *MEMORY[0x1E4F57170];
  v7[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v4 = [v1 arrayByAddingObjectsFromArray:v3];
  v5 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_6;
  defaultPropertiesToLoad_defaultPropertiesToLoad_6 = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(EKPersistentOrganizer);
  if (v4)
  {
    v5 = [(EKPersistentParticipant *)self UUID];
    objc_super v6 = (void *)[v5 copy];
    [(EKPersistentParticipant *)v4 setUUID:v6];

    v7 = [(EKPersistentParticipant *)self displayNameRaw];
    [(EKPersistentParticipant *)v4 setDisplayNameRaw:v7];

    [(EKPersistentOrganizer *)v4 setIsCurrentUser:[(EKPersistentOrganizer *)self isCurrentUser]];
    [(EKPersistentOrganizer *)v4 setScheduleAgent:[(EKPersistentOrganizer *)self scheduleAgent]];
    v8 = [(EKPersistentObject *)self eventStore];
    LODWORD(v6) = [v8 eventAccessLevel];

    if (v6 == 2)
    {
      v9 = [(EKPersistentParticipant *)self emailAddress];
      [(EKPersistentParticipant *)v4 setEmailAddress:v9];

      v10 = [(EKPersistentParticipant *)self phoneNumber];
      [(EKPersistentParticipant *)v4 setPhoneNumber:v10];

      v11 = [(EKPersistentParticipant *)self URLString];
      [(EKPersistentParticipant *)v4 setURLString:v11];
    }
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKPersistentParticipant *)self UUID];
  objc_super v6 = [(EKPersistentParticipant *)self displayNameRaw];
  v7 = [(EKPersistentParticipant *)self emailAddress];
  v8 = [(EKPersistentParticipant *)self phoneNumber];
  v9 = [(EKPersistentParticipant *)self firstName];
  v10 = [(EKPersistentParticipant *)self lastName];
  objc_msgSend(v3, "stringWithFormat:", @"%@ <%p> {UUID = %@; displayName = %@; email = %@; phoneNumber = %@; firstName = %@; lastName = %@; isSelf = %d}",
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  v11 = [(EKPersistentOrganizer *)self isCurrentUser]);

  return v11;
}

- (void)setIsCurrentUser:(BOOL)a3
{
}

- (void)setOwner:(id)a3
{
}

- (id)owner
{
  return [(EKPersistentObject *)self primitiveRelationValueForKey:*MEMORY[0x1E4F57160]];
}

- (int64_t)scheduleAgent
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F57178]];
}

- (void)setScheduleAgent:(int64_t)a3
{
}

+ (id)organizerWithName:(id)a3 emailAddress:(id)a4 address:(id)a5 isCurrentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithName:v12 emailAddress:v11 address:v10 isCurrentUser:v6];

  return v13;
}

- (EKPersistentOrganizer)initWithName:(id)a3 emailAddress:(id)a4 address:(id)a5 isCurrentUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(EKPersistentObject *)self init];
  v14 = v13;
  if (v13)
  {
    [(EKPersistentParticipant *)v13 setDisplayNameRaw:v10];
    [(EKPersistentParticipant *)v14 setEmailAddress:v11];
    [(EKPersistentParticipant *)v14 setURLString:v12];
    [(EKPersistentOrganizer *)v14 setIsCurrentUser:v6];
  }

  return v14;
}

@end