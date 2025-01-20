@interface EKAttachmentChange
+ (int)entityType;
- (EKAttachmentChange)initWithChangeProperties:(id)a3;
- (EKObjectID)ownerID;
- (NSString)externalID;
- (NSString)uuid;
@end

@implementation EKAttachmentChange

+ (int)entityType
{
  return 11;
}

- (EKAttachmentChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKAttachmentChange;
  v5 = [(EKObjectChange *)&v15 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"owner_id"];
    v7 = [(EKObjectChange *)v5 changedObjectID];
    uint64_t v8 = +[EKObjectChangeOwnerIDHelper createOwnerIDWithRowID:objectType:databaseID:](EKObjectChangeOwnerIDHelper, "createOwnerIDWithRowID:objectType:databaseID:", v6, 2, [v7 databaseID]);
    ownerID = v5->_ownerID;
    v5->_ownerID = (EKObjectID *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"external_id"];
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v12;
  }
  return v5;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end