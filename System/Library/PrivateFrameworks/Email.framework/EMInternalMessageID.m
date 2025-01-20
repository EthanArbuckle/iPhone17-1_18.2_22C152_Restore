@interface EMInternalMessageID
- (EMInternalMessageID)initWithDatabaseID:(int64_t)a3 externalID:(id)a4;
- (NSString)externalID;
- (int64_t)databaseID;
@end

@implementation EMInternalMessageID

- (EMInternalMessageID)initWithDatabaseID:(int64_t)a3 externalID:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMInternalMessageID;
  v7 = [(EMInternalMessageID *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_databaseID = a3;
    uint64_t v9 = [v6 copy];
    externalID = v8->_externalID;
    v8->_externalID = (NSString *)v9;
  }
  return v8;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void).cxx_destruct
{
}

@end