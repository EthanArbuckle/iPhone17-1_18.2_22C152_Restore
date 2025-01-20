@interface IKPlayerTimedMetadataEventUserInfo
- (IKPlayerTimedMetadataEventUserInfo)initWithKey:(id)a3 value:(id)a4;
- (NSDictionary)properties;
- (NSDictionary)value;
- (NSString)key;
@end

@implementation IKPlayerTimedMetadataEventUserInfo

- (IKPlayerTimedMetadataEventUserInfo)initWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKPlayerTimedMetadataEventUserInfo;
  v8 = [(IKPlayerTimedMetadataEventUserInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    key = v8->_key;
    v8->_key = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSDictionary *)v11;
  }
  return v8;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v3 setObject:self->_key forKeyedSubscript:@"key"];
  if (self->_value) {
    value = self->_value;
  }
  else {
    value = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  [v3 setObject:value forKeyedSubscript:@"metadata"];
  v5 = (void *)[v3 copy];

  return (NSDictionary *)v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end