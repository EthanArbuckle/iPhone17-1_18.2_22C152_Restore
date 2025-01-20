@interface HMCollectionSettingItem
+ (BOOL)supportsSecureCoding;
- (HMCollectionSettingItem)initWithCoder:(id)a3;
- (NSObject)value;
- (NSUUID)identifier;
@end

@implementation HMCollectionSettingItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSObject)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMCollectionSettingItem)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMCollectionSettingItem;
  return [(HMCollectionSettingItem *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end