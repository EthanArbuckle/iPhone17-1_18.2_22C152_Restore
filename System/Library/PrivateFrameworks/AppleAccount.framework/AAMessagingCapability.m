@interface AAMessagingCapability
+ (BOOL)supportsSecureCoding;
- (AAMessagingCapability)initWithCapabilityType:(int64_t)a3;
- (AAMessagingCapability)initWithCoder:(id)a3;
- (NSString)capabilityString;
- (int64_t)capability;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAMessagingCapability

- (AAMessagingCapability)initWithCapabilityType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAMessagingCapability;
  result = [(AAMessagingCapability *)&v5 init];
  if (result) {
    result->_capability = a3;
  }
  return result;
}

- (NSString)capabilityString
{
  unint64_t capability = self->_capability;
  if (capability > 3) {
    return (NSString *)@"IDSRegistrationPropertyUnknown";
  }
  else {
    return &off_1E5A48268[capability]->isa;
  }
}

- (AAMessagingCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AAMessagingCapability *)self init];
  if (v5) {
    v5->_unint64_t capability = [v4 decodeIntegerForKey:@"capability"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)capability
{
  return self->_capability;
}

@end