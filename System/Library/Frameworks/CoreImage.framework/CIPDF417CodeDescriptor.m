@interface CIPDF417CodeDescriptor
+ (BOOL)supportsSecureCoding;
+ (CIPDF417CodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount;
- (BOOL)isCompact;
- (BOOL)isValid;
- (CIPDF417CodeDescriptor)initWithCoder:(id)a3;
- (CIPDF417CodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount;
- (NSData)errorCorrectedPayload;
- (NSInteger)columnCount;
- (NSInteger)rowCount;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)isValid;
@end

@implementation CIPDF417CodeDescriptor

- (BOOL)isValid
{
  if ((unint64_t)(self->rowCount - 91) > 0xFFFFFFFFFFFFFFA7)
  {
    if ((unint64_t)(self->columnCount - 31) > 0xFFFFFFFFFFFFFFE1)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    v4 = ci_logger_api();
    BOOL v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIPDF417CodeDescriptor isValid]();
      goto LABEL_7;
    }
  }
  else
  {
    v2 = ci_logger_api();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIPDF417CodeDescriptor isValid]();
LABEL_7:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (CIPDF417CodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount
{
  v12.receiver = self;
  v12.super_class = (Class)CIPDF417CodeDescriptor;
  v10 = [(CIBarcodeDescriptor *)&v12 init];
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->isCompact = isCompact;
    v10->rowCount = rowCount;
    v10->columnCount = columnCount;
  }
  if (![(CIPDF417CodeDescriptor *)v10 isValid])
  {

    return 0;
  }
  return v10;
}

+ (CIPDF417CodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount
{
  v6 = [[CIPDF417CodeDescriptor alloc] initWithPayload:errorCorrectedPayload isCompact:isCompact rowCount:rowCount columnCount:columnCount];

  return v6;
}

- (void)dealloc
{
  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIPDF417CodeDescriptor;
  [(CIPDF417CodeDescriptor *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIPDF417CodeDescriptor)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIPDF417CodeDescriptor;
  objc_super v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"errorCorrectedPayload"];
    v4->isCompact = [a3 decodeBoolForKey:@"isCompact"];
    v4->rowCount = [a3 decodeIntegerForKey:@"rowCount"];
    v4->columnCount = [a3 decodeIntegerForKey:@"columnCount"];
  }
  if (![(CIPDF417CodeDescriptor *)v4 isValid])
  {

    return 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CIPDF417CodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->errorCorrectedPayload forKey:@"errorCorrectedPayload"];
  [a3 encodeBool:self->isCompact forKey:@"isCompact"];
  [a3 encodeInteger:self->rowCount forKey:@"rowCount"];
  [a3 encodeInteger:self->columnCount forKey:@"columnCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[CIPDF417CodeDescriptor allocWithZone:a3];
  objc_super v5 = (void *)[(NSData *)self->errorCorrectedPayload copy];
  objc_super v6 = [(CIPDF417CodeDescriptor *)v4 initWithPayload:v5 isCompact:self->isCompact rowCount:self->rowCount columnCount:self->columnCount];

  return v6;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (BOOL)isCompact
{
  return self->isCompact;
}

- (NSInteger)rowCount
{
  return self->rowCount;
}

- (NSInteger)columnCount
{
  return self->columnCount;
}

- (void)isValid
{
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_193671000, v0, v1, "%{public}s %{public}@: columnCount must be in the range of [1,30]", v2, v3, v4, v5, 2u);
}

@end