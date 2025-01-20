@interface EKContactChange
+ (int)entityType;
- (EKContactChange)initWithChangeProperties:(id)a3;
- (EKObjectID)ownerID;
@end

@implementation EKContactChange

+ (int)entityType
{
  return 21;
}

- (EKContactChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EKContactChange;
  v5 = [(EKObjectChange *)&v11 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"owner_id"];
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