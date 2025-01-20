@interface CIQRCodeFeature
+ (BOOL)supportsSecureCoding;
+ (CIQRCodeFeature)featureWithInternalRepresentation:(id *)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)bounds;
- (CIQRCodeDescriptor)symbolDescriptor;
- (CIQRCodeFeature)initWithCoder:(id)a3;
- (CIQRCodeFeature)initWithInternalRepresentation:(id *)a3;
- (NSString)messageString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CIQRCodeFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIQRCodeFeature)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CIQRCodeFeature;
  v4 = [(CIFeature *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->bounds.origin.x = decodeRectForKey(a3, @"bounds");
    v5->bounds.origin.y = v6;
    v5->bounds.size.width = v7;
    v5->bounds.size.height = v8;
    v5->topLeft.x = decodePointForKey(a3, @"topLeft");
    v5->topLeft.y = v9;
    v5->topRight.x = decodePointForKey(a3, @"topRight");
    v5->topRight.y = v10;
    v5->bottomLeft.x = decodePointForKey(a3, @"bottomLeft");
    v5->bottomLeft.y = v11;
    v5->bottomRight.x = decodePointForKey(a3, @"bottomRight");
    v5->bottomRight.y = v12;
    v5->symbolDescriptor = (CIQRCodeDescriptor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"symbolDescriptor"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encodeRectForKey(a3, @"bounds", self->bounds.origin.x, self->bounds.origin.y, self->bounds.size.width, self->bounds.size.height);
  encodePointForKey(a3, @"topLeft", self->topLeft.x);
  encodePointForKey(a3, @"topRight", self->topRight.x);
  encodePointForKey(a3, @"bottomLeft", self->bottomLeft.x);
  encodePointForKey(a3, @"bottomRight", self->bottomRight.x);
  symbolDescriptor = self->symbolDescriptor;

  [a3 encodeObject:symbolDescriptor forKey:@"symbolDescriptor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[CIQRCodeFeature allocWithZone:](CIQRCodeFeature, "allocWithZone:");
  id v6 = [(CIQRCodeDescriptor *)self->symbolDescriptor copyWithZone:a3];
  CGSize size = self->bounds.size;
  CGPoint topLeft = self->topLeft;
  v13[0] = self->bounds.origin;
  v13[1] = size;
  CGPoint topRight = self->topRight;
  v13[2] = topLeft;
  v13[3] = topRight;
  CGPoint bottomRight = self->bottomRight;
  v13[4] = self->bottomLeft;
  v13[5] = bottomRight;
  id v14 = v6;
  CGFloat v11 = [(CIQRCodeFeature *)v5 initWithInternalRepresentation:v13];

  return v11;
}

- (id)type
{
  return @"QRCode";
}

- (void)dealloc
{
  symbolDescriptor = self->symbolDescriptor;
  if (symbolDescriptor) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CIQRCodeFeature;
  [(CIQRCodeFeature *)&v4 dealloc];
}

- (CIQRCodeFeature)initWithInternalRepresentation:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CIQRCodeFeature;
  objc_super v4 = [(CIFeature *)&v8 init];
  v5 = v4;
  if (v4)
  {
    CGSize size = a3->var0.size;
    v4->bounds.origin = a3->var0.origin;
    v4->bounds.CGSize size = size;
    v4->CGPoint topLeft = a3->var1;
    v4->CGPoint topRight = a3->var2;
    v4->bottomLeft = a3->var3;
    v4->CGPoint bottomRight = a3->var4;
    v4->symbolDescriptor = (CIQRCodeDescriptor *)a3->var5;
  }
  return v5;
}

+ (CIQRCodeFeature)featureWithInternalRepresentation:(id *)a3
{
  v3 = [[CIQRCodeFeature alloc] initWithInternalRepresentation:a3];

  return v3;
}

- (NSString)messageString
{
  v11[3] = *MEMORY[0x1E4F143B8];
  result = (NSString *)loadACBS();
  if (result)
  {
    objc_super v4 = result;
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%c", (char)-[CIQRCodeDescriptor errorCorrectionLevel](self->symbolDescriptor, "errorCorrectionLevel"));
    v11[0] = @"QR";
    v10[0] = @"BarcodeType";
    v10[1] = @"BarcodeRawData";
    v11[1] = [(CIQRCodeDescriptor *)self->symbolDescriptor errorCorrectedPayload];
    v10[2] = @"CodeProperties";
    v9[0] = v5;
    v8[0] = @"ErrorCorrectionLevel";
    v8[1] = @"QRMASK";
    v9[1] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CIQRCodeDescriptor maskPattern](self->symbolDescriptor, "maskPattern"));
    v8[2] = @"SymbolVersion";
    v9[2] = objc_msgSend(NSNumber, "numberWithInteger:", -[CIQRCodeDescriptor symbolVersion](self->symbolDescriptor, "symbolVersion"));
    v11[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
    CFDictionaryRef v6 = (const __CFDictionary *)((uint64_t (*)(uint64_t, void))v4[5])([MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3], 0);
    CGFloat v7 = (id)CFDictionaryGetValue(v6, @"BarcodeString");
    CFRelease(v6);
    return (NSString *)v7;
  }
  return result;
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  objc_copyStruct(v4, &self->topLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  objc_copyStruct(v4, &self->topRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  objc_copyStruct(v4, &self->bottomLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  objc_copyStruct(v4, &self->bottomRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CIQRCodeDescriptor)symbolDescriptor
{
  return self->symbolDescriptor;
}

@end