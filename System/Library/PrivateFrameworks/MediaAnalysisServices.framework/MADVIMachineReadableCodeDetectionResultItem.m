@interface MADVIMachineReadableCodeDetectionResultItem
+ (BOOL)supportsSecureCoding;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)normalizedBoundingBox;
- (CIBarcodeDescriptor)descriptor;
- (MADVIMachineReadableCodeDetectionResultItem)initWithCoder:(id)a3;
- (MADVIMachineReadableCodeDetectionResultItem)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6 symbology:(id)a7 payload:(id)a8 andDescriptor:(id)a9;
- (NSString)payload;
- (NSString)symbology;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVIMachineReadableCodeDetectionResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVIMachineReadableCodeDetectionResultItem)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6 symbology:(id)a7 payload:(id)a8 andDescriptor:(id)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v14 = a5.y;
  CGFloat v15 = a5.x;
  CGFloat v16 = a4.y;
  CGFloat v17 = a4.x;
  CGFloat v18 = a3.y;
  CGFloat v19 = a3.x;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MADVIMachineReadableCodeDetectionResultItem;
  v24 = [(MADVIMachineReadableCodeDetectionResultItem *)&v27 init];
  v25 = v24;
  if (v24)
  {
    v24->_topLeft.CGFloat x = v19;
    v24->_topLeft.CGFloat y = v18;
    v24->_topRight.CGFloat x = v17;
    v24->_topRight.CGFloat y = v16;
    v24->_bottomLeft.CGFloat x = v15;
    v24->_bottomLeft.CGFloat y = v14;
    v24->_bottomRight.CGFloat x = x;
    v24->_bottomRight.CGFloat y = y;
    objc_storeStrong((id *)&v24->_symbology, a7);
    objc_storeStrong((id *)&v25->_payload, a8);
    objc_storeStrong((id *)&v25->_descriptor, a9);
  }

  return v25;
}

- (MADVIMachineReadableCodeDetectionResultItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADVIMachineReadableCodeDetectionResultItem;
  v5 = [(MADVIMachineReadableCodeDetectionResultItem *)&v23 init];
  if (v5)
  {
    [v4 decodePointForKey:@"TopLeft"];
    v5->_topLeft.CGFloat x = v6;
    v5->_topLeft.CGFloat y = v7;
    [v4 decodePointForKey:@"TopRight"];
    v5->_topRight.CGFloat x = v8;
    v5->_topRight.CGFloat y = v9;
    [v4 decodePointForKey:@"BottomLeft"];
    v5->_bottomLeft.CGFloat x = v10;
    v5->_bottomLeft.CGFloat y = v11;
    [v4 decodePointForKey:@"BottomRight"];
    v5->_bottomRight.CGFloat x = v12;
    v5->_bottomRight.CGFloat y = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Symbology"];
    symbologCGFloat y = v5->_symbology;
    v5->_symbologCGFloat y = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Payload"];
    payload = v5->_payload;
    v5->_payload = (NSString *)v16;

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    CGFloat v18 = (void *)getCIBarcodeDescriptorClass_softClass;
    uint64_t v28 = getCIBarcodeDescriptorClass_softClass;
    if (!getCIBarcodeDescriptorClass_softClass)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getCIBarcodeDescriptorClass_block_invoke;
      v24[3] = &unk_1E6CAD0C8;
      v24[4] = &v25;
      __getCIBarcodeDescriptorClass_block_invoke((uint64_t)v24);
      CGFloat v18 = (void *)v26[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v25, 8);
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (CIBarcodeDescriptor *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  id v6 = a3;
  objc_msgSend(v6, "encodePoint:forKey:", @"TopLeft", x, y);
  objc_msgSend(v6, "encodePoint:forKey:", @"TopRight", self->_topRight.x, self->_topRight.y);
  objc_msgSend(v6, "encodePoint:forKey:", @"BottomLeft", self->_bottomLeft.x, self->_bottomLeft.y);
  objc_msgSend(v6, "encodePoint:forKey:", @"BottomRight", self->_bottomRight.x, self->_bottomRight.y);
  [v6 encodeObject:self->_symbology forKey:@"Symbology"];
  [v6 encodeObject:self->_payload forKey:@"Payload"];
  [v6 encodeObject:self->_descriptor forKey:@"Descriptor"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"topLeft: (%0.2f, %0.2f), ", *(void *)&self->_topLeft.x, *(void *)&self->_topLeft.y];
  [v3 appendFormat:@"topRight: (%0.2f, %0.2f), ", *(void *)&self->_topRight.x, *(void *)&self->_topRight.y];
  [v3 appendFormat:@"bottomLeft: (%0.2f, %0.2f), ", *(void *)&self->_bottomLeft.x, *(void *)&self->_bottomLeft.y];
  [v3 appendFormat:@"bottomRight: (%0.2f, %0.2f), ", *(void *)&self->_bottomRight.x, *(void *)&self->_bottomRight.y];
  [v3 appendFormat:@"symbology: '%@', ", self->_symbology];
  [v3 appendFormat:@"payload: %@, ", self->_payload];
  [v3 appendFormat:@"descriptor: %@>", self->_descriptor];
  return v3;
}

- (CGRect)normalizedBoundingBox
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  double v4 = self->_topRight.x;
  double v5 = self->_topRight.y;
  double v6 = self->_bottomLeft.x;
  double v7 = self->_bottomLeft.y;
  double v8 = self->_bottomRight.x;
  double v9 = self->_bottomRight.y;
  if (v7 >= v9) {
    double v10 = self->_bottomRight.y;
  }
  else {
    double v10 = self->_bottomLeft.y;
  }
  if (v7 < v9) {
    double v7 = self->_bottomRight.y;
  }
  if (y >= v5) {
    double v11 = self->_topRight.y;
  }
  else {
    double v11 = self->_topLeft.y;
  }
  if (y >= v5) {
    double v5 = self->_topLeft.y;
  }
  if (v6 >= v8) {
    double v12 = self->_bottomRight.x;
  }
  else {
    double v12 = self->_bottomLeft.x;
  }
  if (v6 < v8) {
    double v6 = self->_bottomRight.x;
  }
  if (x >= v4) {
    double v13 = self->_topRight.x;
  }
  else {
    double v13 = self->_topLeft.x;
  }
  if (x >= v4) {
    double v4 = self->_topLeft.x;
  }
  if (v13 >= v12) {
    double v14 = v12;
  }
  else {
    double v14 = v13;
  }
  if (v11 >= v10) {
    double v15 = v10;
  }
  else {
    double v15 = v11;
  }
  if (v4 < v6) {
    double v4 = v6;
  }
  double v16 = v4 - v14;
  if (v5 < v7) {
    double v5 = v7;
  }
  double v17 = v5 - v15;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)symbology
{
  return self->_symbology;
}

- (NSString)payload
{
  return self->_payload;
}

- (CIBarcodeDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_symbology, 0);
}

@end