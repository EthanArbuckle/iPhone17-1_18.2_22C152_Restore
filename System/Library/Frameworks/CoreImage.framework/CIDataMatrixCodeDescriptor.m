@interface CIDataMatrixCodeDescriptor
+ (BOOL)supportsSecureCoding;
+ (CIDataMatrixCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount eccVersion:(CIDataMatrixCodeECCVersion)eccVersion;
- (CIDataMatrixCodeDescriptor)initWithCoder:(id)a3;
- (CIDataMatrixCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount eccVersion:(CIDataMatrixCodeECCVersion)eccVersion;
- (CIDataMatrixCodeECCVersion)eccVersion;
- (NSData)errorCorrectedPayload;
- (NSInteger)columnCount;
- (NSInteger)rowCount;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CIDataMatrixCodeDescriptor

- (CIDataMatrixCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount eccVersion:(CIDataMatrixCodeECCVersion)eccVersion
{
  v12.receiver = self;
  v12.super_class = (Class)CIDataMatrixCodeDescriptor;
  v10 = [(CIBarcodeDescriptor *)&v12 init];
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->rowCount = rowCount;
    v10->columnCount = columnCount;
    v10->eccVersion = eccVersion;
  }
  return v10;
}

+ (CIDataMatrixCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount eccVersion:(CIDataMatrixCodeECCVersion)eccVersion
{
  v6 = [[CIDataMatrixCodeDescriptor alloc] initWithPayload:errorCorrectedPayload rowCount:rowCount columnCount:columnCount eccVersion:eccVersion];

  return v6;
}

- (void)dealloc
{
  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIDataMatrixCodeDescriptor;
  [(CIDataMatrixCodeDescriptor *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIDataMatrixCodeDescriptor)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CIDataMatrixCodeDescriptor;
  objc_super v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"errorCorrectedPayload"];
    v4->rowCount = [a3 decodeIntegerForKey:@"rowCount"];
    v4->columnCount = [a3 decodeIntegerForKey:@"columnCount"];
    v4->eccVersion = [a3 decodeIntegerForKey:@"eccVersion"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CIDataMatrixCodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->errorCorrectedPayload forKey:@"errorCorrectedPayload"];
  [a3 encodeInteger:self->rowCount forKey:@"rowCount"];
  [a3 encodeInteger:self->columnCount forKey:@"columnCount"];
  [a3 encodeInteger:self->eccVersion forKey:@"eccVersion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[CIDataMatrixCodeDescriptor allocWithZone:a3];
  objc_super v5 = (void *)[(NSData *)self->errorCorrectedPayload copy];
  objc_super v6 = [(CIDataMatrixCodeDescriptor *)v4 initWithPayload:v5 rowCount:self->rowCount columnCount:self->columnCount eccVersion:self->eccVersion];

  return v6;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (NSInteger)rowCount
{
  return self->rowCount;
}

- (NSInteger)columnCount
{
  return self->columnCount;
}

- (CIDataMatrixCodeECCVersion)eccVersion
{
  return self->eccVersion;
}

@end