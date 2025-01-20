@interface INExtensionContextSlotResolutionResult
+ (BOOL)supportsSecureCoding;
- (INExtensionContextSlotResolutionResult)initWithCoder:(id)a3;
- (INExtensionContextSlotResolutionResult)initWithResult:(int64_t)a3 data:(id)a4;
- (NSData)data;
- (int64_t)result;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INExtensionContextSlotResolutionResult

- (void).cxx_destruct
{
}

- (NSData)data
{
  return self->_data;
}

- (int64_t)result
{
  return self->_result;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t result = self->_result;
  id v5 = a3;
  [v5 encodeInteger:result forKey:@"result"];
  [v5 encodeObject:self->_data forKey:@"data"];
}

- (INExtensionContextSlotResolutionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INExtensionContextSlotResolutionResult;
  id v5 = [(INExtensionContextSlotResolutionResult *)&v9 init];
  if (v5)
  {
    v5->_int64_t result = [v4 decodeIntegerForKey:@"result"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (INExtensionContextSlotResolutionResult)initWithResult:(int64_t)a3 data:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INExtensionContextSlotResolutionResult;
  v8 = [(INExtensionContextSlotResolutionResult *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_int64_t result = a3;
    objc_storeStrong((id *)&v8->_data, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end