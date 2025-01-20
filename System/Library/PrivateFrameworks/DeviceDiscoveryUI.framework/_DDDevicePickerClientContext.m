@interface _DDDevicePickerClientContext
+ (BOOL)supportsBSXPCSecureCoding;
- (NSString)sessionIdentifier;
- (_DDDevicePickerClientContext)initWithBSXPCCoder:(id)a3;
- (_DDDevicePickerClientContext)initWithSessionIdentifier:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation _DDDevicePickerClientContext

- (_DDDevicePickerClientContext)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DDDevicePickerClientContext;
  v5 = [(_DDDevicePickerClientContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_DDDevicePickerClientContext *)self sessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sessionIdentifier"];
}

- (_DDDevicePickerClientContext)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];

  uint64_t v6 = [(_DDDevicePickerClientContext *)self initWithSessionIdentifier:v5];
  return v6;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
}

@end