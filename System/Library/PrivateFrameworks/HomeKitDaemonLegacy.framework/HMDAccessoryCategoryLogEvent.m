@interface HMDAccessoryCategoryLogEvent
+ (id)denominatorSpecifyingEvent;
- (BOOL)enableEventFilterSpecifying;
- (BOOL)isDenominatorSpecifying;
- (HMDAccessoryCategoryLogEvent)initWithAccessoryDetailsType:(unint64_t)a3 accessoryCategoryIdentifier:(id)a4 homeUUID:(id)a5;
- (NSData)sampledData;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryCategoryIdentifier;
- (NSString)coreAnalyticsEventName;
- (NSString)sampledCategory;
- (unint64_t)accessoryDetailsType;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAccessoryCategoryLogEvent

- (void).cxx_destruct
{
}

- (BOOL)isDenominatorSpecifying
{
  return self->_isDenominatorSpecifying;
}

- (NSString)accessoryCategoryIdentifier
{
  return self->_accessoryCategoryIdentifier;
}

- (unint64_t)accessoryDetailsType
{
  return self->_accessoryDetailsType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryCategoryLogEvent accessoryDetailsType](self, "accessoryDetailsType"));
  [v3 setObject:v4 forKeyedSubscript:@"accessoryDetailsType"];

  v5 = [(HMDAccessoryCategoryLogEvent *)self accessoryCategoryIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"accessoryCategoryUUID"];

  [v3 setObject:&unk_1F2DC7420 forKeyedSubscript:@"accessoryCategoryCount"];
  v6 = (void *)[v3 copy];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.homeConfiguration.accessoryCategories";
}

- (NSData)sampledData
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  v4 = [(HMDAccessoryCategoryLogEvent *)self accessoryCategoryIdentifier];
  v5 = [v4 dataUsingEncoding:4];
  v6 = [v3 dataWithData:v5];

  unint64_t v9 = [(HMDAccessoryCategoryLogEvent *)self accessoryDetailsType];
  [v6 appendBytes:&v9 length:8];
  v7 = (void *)[v6 copy];

  return (NSData *)v7;
}

- (NSString)sampledCategory
{
  return (NSString *)@"HMDAccessoryCategoryLogEvent";
}

- (BOOL)enableEventFilterSpecifying
{
  return ![(HMDAccessoryCategoryLogEvent *)self isDenominatorSpecifying];
}

- (HMDAccessoryCategoryLogEvent)initWithAccessoryDetailsType:(unint64_t)a3 accessoryCategoryIdentifier:(id)a4 homeUUID:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryCategoryLogEvent;
  v10 = [(HMMHomeLogEvent *)&v13 initWithHomeUUID:a5];
  v11 = v10;
  if (v10)
  {
    v10->_accessoryDetailsType = a3;
    objc_storeStrong((id *)&v10->_accessoryCategoryIdentifier, a4);
    v11->_isDenominatorSpecifying = a3 == 0;
  }

  return v11;
}

+ (id)denominatorSpecifyingEvent
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = (void *)[v2 initWithAccessoryDetailsType:0 accessoryCategoryIdentifier:0 homeUUID:v3];

  return v4;
}

@end