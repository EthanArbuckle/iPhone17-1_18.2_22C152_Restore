@interface CIBarcodeDescriptor
+ (BOOL)supportsSecureCoding;
- (CIBarcodeDescriptor)init;
- (CIBarcodeDescriptor)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)init;
@end

@implementation CIBarcodeDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIBarcodeDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CIBarcodeDescriptor;
  v2 = [(CIBarcodeDescriptor *)&v6 init];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CIBarcodeDescriptor init]();
    }

    return 0;
  }
  return v2;
}

- (CIBarcodeDescriptor)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v4 = ci_logger_api();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CIBarcodeDescriptor initWithCoder:]();
    }
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)init
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_193671000, v0, v1, "%{public}s %{public}@: instantiating abstract barcode descriptor objects is prohibited", v2, v3, v4, v5, 2u);
}

- (void)initWithCoder:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_193671000, v0, v1, "%{public}s %{public}@: requires coder that supports keyed coding of objects", v2, v3, v4, v5, 2u);
}

@end