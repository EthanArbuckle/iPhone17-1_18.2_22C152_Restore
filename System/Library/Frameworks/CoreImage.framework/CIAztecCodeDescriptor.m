@interface CIAztecCodeDescriptor
+ (BOOL)supportsSecureCoding;
+ (CIAztecCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact layerCount:(NSInteger)layerCount dataCodewordCount:(NSInteger)dataCodewordCount;
- (BOOL)isCompact;
- (BOOL)isValid;
- (CIAztecCodeDescriptor)initWithCoder:(id)a3;
- (CIAztecCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact layerCount:(NSInteger)layerCount dataCodewordCount:(NSInteger)dataCodewordCount;
- (NSData)errorCorrectedPayload;
- (NSInteger)dataCodewordCount;
- (NSInteger)layerCount;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)isValid;
@end

@implementation CIAztecCodeDescriptor

- (BOOL)isValid
{
  if ((unint64_t)(self->layerCount - 33) > 0xFFFFFFFFFFFFFFDFLL)
  {
    if ((unint64_t)(self->dataCodewordCount - 2049) > 0xFFFFFFFFFFFFF7FFLL)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    v4 = ci_logger_api();
    BOOL v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIAztecCodeDescriptor isValid]();
      goto LABEL_7;
    }
  }
  else
  {
    v2 = ci_logger_api();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIAztecCodeDescriptor isValid]();
LABEL_7:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (CIAztecCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact layerCount:(NSInteger)layerCount dataCodewordCount:(NSInteger)dataCodewordCount
{
  v12.receiver = self;
  v12.super_class = (Class)CIAztecCodeDescriptor;
  v10 = [(CIBarcodeDescriptor *)&v12 init];
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->isCompact = isCompact;
    v10->layerCount = layerCount;
    v10->dataCodewordCount = dataCodewordCount;
  }
  if (![(CIAztecCodeDescriptor *)v10 isValid])
  {

    return 0;
  }
  return v10;
}

+ (CIAztecCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact layerCount:(NSInteger)layerCount dataCodewordCount:(NSInteger)dataCodewordCount
{
  v6 = [[CIAztecCodeDescriptor alloc] initWithPayload:errorCorrectedPayload isCompact:isCompact layerCount:layerCount dataCodewordCount:dataCodewordCount];

  return v6;
}

- (void)dealloc
{
  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIAztecCodeDescriptor;
  [(CIAztecCodeDescriptor *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIAztecCodeDescriptor)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIAztecCodeDescriptor;
  objc_super v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"errorCorrectedPayload"];
    v4->isCompact = [a3 decodeBoolForKey:@"isCompact"];
    v4->layerCount = [a3 decodeIntegerForKey:@"layerCount"];
    v4->dataCodewordCount = [a3 decodeIntegerForKey:@"dataCodewordCount"];
  }
  if (![(CIAztecCodeDescriptor *)v4 isValid])
  {

    return 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CIAztecCodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->errorCorrectedPayload forKey:@"errorCorrectedPayload"];
  [a3 encodeBool:self->isCompact forKey:@"isCompact"];
  [a3 encodeInteger:self->layerCount forKey:@"layerCount"];
  [a3 encodeInteger:self->dataCodewordCount forKey:@"dataCodewordCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = +[CIAztecCodeDescriptor allocWithZone:](CIAztecCodeDescriptor, "allocWithZone:");
  objc_super v6 = (void *)[(NSData *)self->errorCorrectedPayload copyWithZone:a3];
  v7 = [(CIAztecCodeDescriptor *)v5 initWithPayload:v6 isCompact:self->isCompact layerCount:self->layerCount dataCodewordCount:self->dataCodewordCount];

  return v7;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (BOOL)isCompact
{
  return self->isCompact;
}

- (NSInteger)layerCount
{
  return self->layerCount;
}

- (NSInteger)dataCodewordCount
{
  return self->dataCodewordCount;
}

- (void)isValid
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}s %{public}@: dataCodewordCount must be in the range of [1,2048]", v2, v3, v4, v5, 2u);
}

@end