@interface EMOrderedMessageIDData
- (EMOrderedMessageIDData)initWithObjectIDs:(id)a3 objectIDByPersistentID:(id)a4;
- (NSArray)objectIDs;
- (NSDictionary)objectIDByPersistentID;
- (void)setObjectIDByPersistentID:(id)a3;
- (void)setObjectIDs:(id)a3;
@end

@implementation EMOrderedMessageIDData

- (EMOrderedMessageIDData)initWithObjectIDs:(id)a3 objectIDByPersistentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMOrderedMessageIDData;
  v8 = [(EMOrderedMessageIDData *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    objectIDs = v8->_objectIDs;
    v8->_objectIDs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    objectIDByPersistentID = v8->_objectIDByPersistentID;
    v8->_objectIDByPersistentID = (NSDictionary *)v11;
  }
  return v8;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
}

- (NSDictionary)objectIDByPersistentID
{
  return self->_objectIDByPersistentID;
}

- (void)setObjectIDByPersistentID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDByPersistentID, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end