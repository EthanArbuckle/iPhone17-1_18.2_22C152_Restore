@interface AVMetadataMachineReadableCodeObjectInternal
- (BOOL)decoded;
- (CIBarcodeDescriptor)descriptor;
- (NSArray)corners;
- (NSDictionary)basicDescriptor;
- (NSString)stringValue;
- (void)dealloc;
- (void)setBasicDescriptor:(id)a3;
- (void)setCorners:(id)a3;
- (void)setDecoded:(BOOL)a3;
- (void)setDescriptor:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation AVMetadataMachineReadableCodeObjectInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataMachineReadableCodeObjectInternal;
  [(AVMetadataMachineReadableCodeObjectInternal *)&v3 dealloc];
}

- (NSArray)corners
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCorners:(id)a3
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStringValue:(id)a3
{
}

- (NSDictionary)basicDescriptor
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBasicDescriptor:(id)a3
{
}

- (BOOL)decoded
{
  return self->decoded;
}

- (void)setDecoded:(BOOL)a3
{
  self->decoded = a3;
}

- (CIBarcodeDescriptor)descriptor
{
  return (CIBarcodeDescriptor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDescriptor:(id)a3
{
}

@end