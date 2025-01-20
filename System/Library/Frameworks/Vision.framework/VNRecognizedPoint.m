@interface VNRecognizedPoint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNRecognizedPoint)initWithCoder:(id)a3;
- (VNRecognizedPoint)initWithLocation:(CGPoint)a3 confidence:(float)a4 identifier:(id)a5;
- (VNRecognizedPointKey)identifier;
- (id)transformedWith:(CGAffineTransform *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRecognizedPoint

- (void).cxx_destruct
{
}

- (VNRecognizedPointKey)identifier
{
  return (VNRecognizedPointKey)objc_getProperty(self, a2, 32, 1);
}

- (id)transformedWith:(CGAffineTransform *)a3
{
  [(VNPoint *)self location];
  CGFloat v7 = a3->tx + v5 * a3->c + a3->a * v6;
  CGFloat v8 = a3->ty + v5 * a3->d + a3->b * v6;
  id v9 = objc_alloc((Class)objc_opt_class());
  [(VNDetectedPoint *)self confidence];
  int v11 = v10;
  v12 = [(VNRecognizedPoint *)self identifier];
  LODWORD(v13) = v11;
  v14 = objc_msgSend(v9, "initWithLocation:confidence:identifier:", v12, v7, v8, v13);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedPoint;
  if ([(VNDetectedPoint *)&v8 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v5 = self->_identifier;
    char v6 = VisionCoreEqualOrNilObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedPoint;
  [(VNDetectedPoint *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_identifier forKey:@"Iden"];
}

- (VNRecognizedPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedPoint;
  objc_super v5 = [(VNDetectedPoint *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Iden"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedPoint;
  return [(NSString *)self->_identifier hash] ^ __ROR8__([(VNDetectedPoint *)&v3 hash], 51);
}

- (VNRecognizedPoint)initWithLocation:(CGPoint)a3 confidence:(float)a4 identifier:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VNRecognizedPoint;
  *(float *)&double v10 = a4;
  int v11 = -[VNDetectedPoint initWithLocation:confidence:](&v16, sel_initWithLocation_confidence_, x, y, v10);
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end