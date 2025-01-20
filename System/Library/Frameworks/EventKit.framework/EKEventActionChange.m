@interface EKEventActionChange
+ (int)entityType;
- (EKEventActionChange)initWithChangeProperties:(id)a3;
- (EKObjectID)ownerID;
@end

@implementation EKEventActionChange

+ (int)entityType
{
  return 9;
}

- (EKEventActionChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKEventActionChange;
  v5 = [(EKObjectChange *)&v11 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"event_id"];
    v7 = [(EKObjectChange *)v5 changedObjectID];
    uint64_t v8 = +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](EKObjectChangeOwnerIDHelper, "createOwnerIDWithRowID:objectType:databaseID:", v6, 2, [v7 databaseID]);
    ownerID = v5->_ownerID;
    v5->_ownerID = (EKObjectID *)v8;
  }
  return v5;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (void).cxx_destruct
{
}

@end