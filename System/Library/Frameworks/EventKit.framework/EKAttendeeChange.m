@interface EKAttendeeChange
+ (int)entityType;
- (BOOL)attendeeRole;
- (BOOL)attendeeStatus;
- (EKAttendeeChange)initWithChangeProperties:(id)a3;
- (EKObjectID)ownerID;
- (NSString)attendeeEmailAddress;
@end

@implementation EKAttendeeChange

+ (int)entityType
{
  return 7;
}

- (EKAttendeeChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKAttendeeChange;
  v5 = [(EKObjectChange *)&v15 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"owner_id"];
    v7 = [(EKObjectChange *)v5 changedObjectID];
    uint64_t v8 = +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](EKObjectChangeOwnerIDHelper, "createOwnerIDWithRowID:objectType:databaseID:", v6, 2, [v7 databaseID]);
    ownerID = v5->_ownerID;
    v5->_ownerID = (EKObjectID *)v8;

    v10 = [v4 objectForKeyedSubscript:@"role"];
    v5->_attendeeRole = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:@"status"];
    v5->_attendeeStatus = [v11 BOOLValue];

    uint64_t v12 = [v4 objectForKeyedSubscript:@"email"];
    attendeeEmailAddress = v5->_attendeeEmailAddress;
    v5->_attendeeEmailAddress = (NSString *)v12;
  }
  return v5;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (BOOL)attendeeRole
{
  return self->_attendeeRole;
}

- (BOOL)attendeeStatus
{
  return self->_attendeeStatus;
}

- (NSString)attendeeEmailAddress
{
  return self->_attendeeEmailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeeEmailAddress, 0);

  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end