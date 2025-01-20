@interface EKPersistentAttendee
+ (Class)meltedClass;
+ (id)attendeeWithEmailAddress:(id)a3 name:(id)a4;
+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4 address:(id)a5;
+ (id)defaultPropertiesToLoad;
+ (id)propertiesToUnloadOnCommit;
+ (id)relations;
- (BOOL)isCurrentUser;
- (EKPersistentAttendee)initWithAddress:(id)a3 name:(id)a4;
- (EKPersistentAttendee)initWithEmailAddress:(id)a3 name:(id)a4;
- (EKPersistentAttendee)initWithName:(id)a3 emailAddress:(id)a4 address:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)lastModifiedParticipationStatus;
- (int)entityType;
- (int)pendingStatusRaw;
- (int)statusRaw;
- (int64_t)participantRole;
- (int64_t)participantType;
- (unsigned)flags;
- (void)setFlags:(unsigned int)a3;
- (void)setLastModifiedParticipationStatus:(id)a3;
- (void)setParticipantRole:(int64_t)a3;
- (void)setParticipantType:(int64_t)a3;
- (void)setPendingStatusRaw:(int)a3;
- (void)setStatusRaw:(int)a3;
@end

@implementation EKPersistentAttendee

+ (id)defaultPropertiesToLoad
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__EKPersistentAttendee_defaultPropertiesToLoad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultPropertiesToLoad_onceToken_4 != -1) {
    dispatch_once(&defaultPropertiesToLoad_onceToken_4, block);
  }
  v2 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_4;

  return v2;
}

+ (id)relations
{
  if (relations_onceToken_7 != -1) {
    dispatch_once(&relations_onceToken_7, &__block_literal_global_32);
  }
  v2 = (void *)relations_relations_7;

  return v2;
}

- (int)entityType
{
  return 7;
}

void __33__EKPersistentAttendee_relations__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F56BA8]];
  v1 = +[EKRelation relationWithEntityName:@"CalendarItem" toMany:0 inversePropertyNames:v4 ownsRelated:0];
  uint64_t v2 = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, *MEMORY[0x1E4F57160], 0);
  v3 = (void *)relations_relations_7;
  relations_relations_7 = v2;
}

- (int)statusRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56B78]];
}

void __47__EKPersistentAttendee_defaultPropertiesToLoad__block_invoke(uint64_t a1)
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentAttendee;
  v1 = objc_msgSendSuper2(&v7, sel_defaultPropertiesToLoad);
  uint64_t v2 = *MEMORY[0x1E4F56B68];
  v8[0] = *MEMORY[0x1E4F56B60];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F571C8];
  v8[2] = *MEMORY[0x1E4F56B78];
  v8[3] = v3;
  v8[4] = *MEMORY[0x1E4F56B50];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  uint64_t v5 = [v1 arrayByAddingObjectsFromArray:v4];
  v6 = (void *)defaultPropertiesToLoad_defaultPropertiesToLoad_4;
  defaultPropertiesToLoad_defaultPropertiesToLoad_4 = v5;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(EKPersistentAttendee);
  if (v4)
  {
    uint64_t v5 = [(EKPersistentParticipant *)self UUID];
    v6 = (void *)[v5 copy];
    [(EKPersistentParticipant *)v4 setUUID:v6];

    objc_super v7 = [(EKPersistentParticipant *)self displayNameRaw];
    [(EKPersistentParticipant *)v4 setDisplayNameRaw:v7];

    [(EKPersistentAttendee *)v4 setStatusRaw:[(EKPersistentAttendee *)self statusRaw]];
    [(EKPersistentAttendee *)v4 setParticipantRole:[(EKPersistentAttendee *)self participantRole]];
    [(EKPersistentAttendee *)v4 setPendingStatusRaw:[(EKPersistentAttendee *)self pendingStatusRaw]];
    v8 = [(EKPersistentAttendee *)self lastModifiedParticipationStatus];
    [(EKPersistentAttendee *)v4 setLastModifiedParticipationStatus:v8];

    v9 = [(EKPersistentParticipant *)self proposedStartDate];
    [(EKPersistentParticipant *)v4 setProposedStartDate:v9];

    [(EKPersistentParticipant *)v4 setProposedStartDateStatus:[(EKPersistentParticipant *)self proposedStartDateStatus]];
    [(EKPersistentAttendee *)v4 setParticipantType:[(EKPersistentAttendee *)self participantType]];
    [(EKPersistentParticipant *)v4 setScheduleForceSend:[(EKPersistentParticipant *)self scheduleForceSend]];
    v10 = [(EKPersistentParticipant *)self comment];
    [(EKPersistentParticipant *)v4 setComment:v10];

    v11 = [(EKPersistentParticipant *)self commentLastModifiedDate];
    [(EKPersistentParticipant *)v4 setCommentLastModifiedDate:v11];

    v12 = [(EKPersistentObject *)self eventStore];
    LODWORD(v6) = [v12 eventAccessLevel];

    if (v6 == 2)
    {
      v13 = [(EKPersistentParticipant *)self emailAddress];
      [(EKPersistentParticipant *)v4 setEmailAddress:v13];

      v14 = [(EKPersistentParticipant *)self phoneNumber];
      [(EKPersistentParticipant *)v4 setPhoneNumber:v14];

      v15 = [(EKPersistentParticipant *)self URLString];
      [(EKPersistentParticipant *)v4 setURLString:v15];
    }
  }
  return v4;
}

+ (id)propertiesToUnloadOnCommit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EKPersistentAttendee_propertiesToUnloadOnCommit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesToUnloadOnCommit_onceToken_0 != -1) {
    dispatch_once(&propertiesToUnloadOnCommit_onceToken_0, block);
  }
  uint64_t v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;

  return v2;
}

void __50__EKPersistentAttendee_propertiesToUnloadOnCommit__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___EKPersistentAttendee;
  uint64_t v1 = objc_msgSendSuper2(&v7, sel_propertiesToUnloadOnCommit);
  uint64_t v2 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0 = v1;

  uint64_t v3 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
  v8[0] = *MEMORY[0x1E4F56B50];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];
  v6 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_0 = v5;
}

- (id)description
{
  v12 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(EKPersistentParticipant *)self UUID];
  uint64_t v5 = [(EKPersistentParticipant *)self displayNameRaw];
  v6 = [(EKPersistentParticipant *)self emailAddress];
  objc_super v7 = [(EKPersistentParticipant *)self phoneNumber];
  v8 = [(EKPersistentParticipant *)self firstName];
  v9 = [(EKPersistentParticipant *)self lastName];
  objc_msgSend(v12, "stringWithFormat:", @"%@ <%p> {UUID = %@; displayName = %@; email = %@; phoneNumber = %@; firstName = %@, lastName = %@, status = %ld; role = %ld; type = %ld}",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    [(EKPersistentAttendee *)self statusRaw],
    [(EKPersistentAttendee *)self participantRole],
  v10 = [(EKPersistentAttendee *)self participantType]);

  return v10;
}

- (void)setStatusRaw:(int)a3
{
}

- (int64_t)participantRole
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56B60]];
}

- (void)setParticipantRole:(int64_t)a3
{
}

- (int64_t)participantType
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56B68]];
}

- (void)setParticipantType:(int64_t)a3
{
}

- (int)pendingStatusRaw
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56B70]];
}

- (void)setPendingStatusRaw:(int)a3
{
}

- (void)setLastModifiedParticipationStatus:(id)a3
{
}

- (id)lastModifiedParticipationStatus
{
  return [(EKPersistentObject *)self primitiveDateValueForKey:*MEMORY[0x1E4F56B58]];
}

- (unsigned)flags
{
  return [(EKPersistentObject *)self primitiveIntValueForKey:*MEMORY[0x1E4F56B48]];
}

- (void)setFlags:(unsigned int)a3
{
}

- (BOOL)isCurrentUser
{
  return [(EKPersistentObject *)self primitiveBoolValueForKey:*MEMORY[0x1E4F56B50]];
}

+ (id)attendeeWithName:(id)a3 emailAddress:(id)a4 address:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 emailAddress:v9 address:v8];

  return v11;
}

+ (id)attendeeWithEmailAddress:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithEmailAddress:v7 name:v6];

  return v8;
}

- (EKPersistentAttendee)initWithEmailAddress:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EKPersistentObject *)self init];
  id v9 = v8;
  if (v8)
  {
    [(EKPersistentParticipant *)v8 setEmailAddress:v6];
    [(EKPersistentParticipant *)v9 setDisplayNameRaw:v7];
  }

  return v9;
}

- (EKPersistentAttendee)initWithName:(id)a3 emailAddress:(id)a4 address:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EKPersistentObject *)self init];
  if (v11)
  {
    v12 = [v10 absoluteString];
    [(EKPersistentParticipant *)v11 setURLString:v12];

    [(EKPersistentParticipant *)v11 setEmailAddress:v9];
    [(EKPersistentParticipant *)v11 setDisplayNameRaw:v8];
  }

  return v11;
}

- (EKPersistentAttendee)initWithAddress:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(EKPersistentObject *)self init];
  if (v8)
  {
    id v9 = [v6 absoluteString];
    [(EKPersistentParticipant *)v8 setURLString:v9];

    [(EKPersistentParticipant *)v8 setDisplayNameRaw:v7];
  }

  return v8;
}

@end