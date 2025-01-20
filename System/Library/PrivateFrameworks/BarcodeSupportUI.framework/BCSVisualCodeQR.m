@interface BCSVisualCodeQR
+ (BOOL)supportsSecureCoding;
- (BCSVisualCodeQR)initWithBarcodeObservation:(id)a3;
- (BCSVisualCodeQR)initWithCoder:(id)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (id)payloadString;
- (int64_t)codeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSVisualCodeQR

- (BCSVisualCodeQR)initWithBarcodeObservation:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSVisualCodeQR;
  v6 = [(BCSVisualCodeQR *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_barcodeObservation, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)codeType
{
  return 0;
}

- (CGPoint)topLeft
{
  [(VNBarcodeObservation *)self->_barcodeObservation topLeft];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  [(VNBarcodeObservation *)self->_barcodeObservation topRight];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  [(VNBarcodeObservation *)self->_barcodeObservation bottomRight];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  [(VNBarcodeObservation *)self->_barcodeObservation bottomLeft];
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)payloadString
{
  return [(VNBarcodeObservation *)self->_barcodeObservation payloadStringValue];
}

- (CGRect)boundingBox
{
  [(VNBarcodeObservation *)self->_barcodeObservation boundingBox];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BCSVisualCodeQR)initWithCoder:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F1EE00];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithCoder:v5];

  v7 = [(BCSVisualCodeQR *)self initWithBarcodeObservation:v6];
  return v7;
}

- (void).cxx_destruct
{
}

@end