@interface CKDeviceCapabilityCheckResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (CKDeviceCapabilityCheckResult)init;
- (CKDeviceCapabilityCheckResult)initWithCoder:(id)a3;
- (CKDeviceCapabilityCheckResult)initWithIsSupported:(BOOL)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKDeviceCapabilityCheckResult

- (CKDeviceCapabilityCheckResult)init
{
  return (CKDeviceCapabilityCheckResult *)sub_18AF59EA8();
}

- (CKDeviceCapabilityCheckResult)initWithIsSupported:(BOOL)a3
{
  return (CKDeviceCapabilityCheckResult *)CKDeviceCapabilityCheckResult.init(isSupported:)(a3);
}

- (BOOL)isSupported
{
  return CKDeviceCapabilityCheckResult.isSupported.getter() & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CKDeviceCapabilityCheckResult.encode(with:)((NSCoder)v4);
}

- (CKDeviceCapabilityCheckResult)initWithCoder:(id)a3
{
  return (CKDeviceCapabilityCheckResult *)CKDeviceCapabilityCheckResult.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return sub_18AF59CC4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CKDeviceCapabilityCheckResult.isEqual(_:));
}

- (NSString)description
{
  return (NSString *)sub_18AF5A360(self, (uint64_t)a2, CKDeviceCapabilityCheckResult.description.getter);
}

@end