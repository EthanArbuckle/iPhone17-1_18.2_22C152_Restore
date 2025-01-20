@interface VSAppChannelsMapping
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)channelIDs;
- (NSString)appAdamID;
- (VSAppChannelsMapping)init;
- (VSAppChannelsMapping)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppAdamID:(id)a3;
- (void)setChannelIDs:(id)a3;
@end

@implementation VSAppChannelsMapping

- (VSAppChannelsMapping)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAppChannelsMapping;
  v2 = [(VSAppChannelsMapping *)&v5 init];
  if (v2)
  {
    v3 = VSAppChannelsMappingValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSAppChannelsMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAppChannelsMapping;
  objc_super v5 = [(VSAppChannelsMapping *)&v8 init];
  if (v5)
  {
    v6 = VSAppChannelsMappingValueType();
    VSValueTypeInitWithCoder(v6, v5, v4);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSAppChannelsMappingValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAppChannelsMappingValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSAppChannelsMappingValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAppChannelsMappingValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSAppChannelsMappingValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
}

- (NSArray)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelIDs, 0);

  objc_storeStrong((id *)&self->_appAdamID, 0);
}

@end