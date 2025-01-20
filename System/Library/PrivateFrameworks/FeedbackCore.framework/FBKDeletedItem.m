@interface FBKDeletedItem
- (FBKDeletedItem)initWithData:(id)a3;
- (NSNumber)remoteID;
- (id)description;
- (unint64_t)type;
- (void)setRemoteID:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation FBKDeletedItem

- (FBKDeletedItem)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBKDeletedItem;
  v5 = [(FBKDeletedItem *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    remoteID = v5->_remoteID;
    v5->_remoteID = (NSNumber *)v6;

    v8 = [v4 objectForKeyedSubscript:@"type"];
    v5->_type = FBKContentItemTypeFromString(v8);
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = FBKContentItemTypeToString([(FBKDeletedItem *)self type]);
  v5 = [(FBKDeletedItem *)self remoteID];
  uint64_t v6 = [v5 stringValue];
  v7 = [v3 stringWithFormat:@"DeletedItem type:%@ ID:%@", v4, v6];

  return v7;
}

- (NSNumber)remoteID
{
  return self->_remoteID;
}

- (void)setRemoteID:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end