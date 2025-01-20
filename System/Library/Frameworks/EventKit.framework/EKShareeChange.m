@interface EKShareeChange
+ (int)entityType;
- (EKObjectID)ownerID;
- (EKShareeChange)initWithChangeProperties:(id)a3;
@end

@implementation EKShareeChange

+ (int)entityType
{
  return 15;
}

- (EKShareeChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKShareeChange;
  v5 = [(EKObjectChange *)&v11 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"owner_id"];
    v7 = [(EKObjectChange *)v5 changedObjectID];
    uint64_t v8 = +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](EKObjectChangeOwnerIDHelper, "createOwnerIDWithRowID:objectType:databaseID:", v6, 1, [v7 databaseID]);
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