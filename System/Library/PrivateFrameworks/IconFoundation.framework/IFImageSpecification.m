@interface IFImageSpecification
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImageSpecification:(id)a3;
- (CGSize)minimumSize;
- (CGSize)pixelSize;
- (CGSize)pixelsSize;
- (CGSize)size;
- (IFImageSpecification)initWithSize:(CGSize)a3 scale:(double)a4 tags:(id)a5;
- (IFImageSpecification)largerSpecification;
- (IFImageSpecification)smallerSpecification;
- (NSSet)tags;
- (double)dimension;
- (double)scale;
- (id)description;
- (unint64_t)hash;
- (void)setLargerSpecification:(id)a3;
- (void)setSmallerSpecification:(id)a3;
@end

@implementation IFImageSpecification

- (IFImageSpecification)initWithSize:(CGSize)a3 scale:(double)a4 tags:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IFImageSpecification;
  v10 = [(IFImageSpecification *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_scale = a4;
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    tags = v11->_tags;
    v11->_tags = (NSSet *)v12;
  }
  return v11;
}

- (double)scale
{
  return self->_scale;
}

- (double)dimension
{
  [(IFImageSpecification *)self size];
  double v4 = v3;
  [(IFImageSpecification *)self size];
  double v6 = v5;
  [(IFImageSpecification *)self size];
  if (v4 >= v6) {
    return v8;
  }
  return result;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)setLargerSpecification:(id)a3
{
}

- (void)setSmallerSpecification:(id)a3
{
}

- (IFImageSpecification)largerSpecification
{
  return self->_largerSpecification;
}

- (IFImageSpecification)smallerSpecification
{
  return self->_smallerSpecification;
}

- (BOOL)isEqualToImageSpecification:(id)a3
{
  id v4 = a3;
  [(IFImageSpecification *)self size];
  double v6 = v5;
  double v8 = v7;
  [v4 size];
  if (v6 == v10 && v8 == v9)
  {
    [(IFImageSpecification *)self scale];
    double v14 = v13;
    [v4 scale];
    BOOL v12 = v14 == v15;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IFImageSpecification *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)IFImageSpecification;
    BOOL v5 = [(IFImageSpecification *)&v7 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IFImageSpecification *)self isEqualToImageSpecification:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  double v3 = [NSNumber numberWithDouble:self->_size.width];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [NSNumber numberWithDouble:self->_size.height];
  uint64_t v6 = [v5 hash] ^ v4;
  objc_super v7 = [NSNumber numberWithDouble:self->_scale];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  smallerSpecification = self->_smallerSpecification;
  if (smallerSpecification)
  {
    uint64_t v4 = NSString;
    [(IFImageSpecification *)smallerSpecification dimension];
    uint64_t v6 = v5;
    [(IFImageSpecification *)self->_smallerSpecification scale];
    objc_msgSend(v4, "stringWithFormat:", @"smaller: %.1lf@%.0lfx", v6, v7);
    unint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v8 = &stru_1F37B9820;
  }
  largerSpecification = self->_largerSpecification;
  if (largerSpecification)
  {
    double v10 = NSString;
    [(IFImageSpecification *)largerSpecification dimension];
    uint64_t v12 = v11;
    [(IFImageSpecification *)self->_largerSpecification scale];
    objc_msgSend(v10, "stringWithFormat:", @"larger: %.1lf@%.0lfx", v12, v13);
    double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v14 = &stru_1F37B9820;
  }
  double v15 = [NSString stringWithFormat:@"Image {%.1lf,%.1lf} @%.0lfx %@ %@", *(void *)&self->_size.width, *(void *)&self->_size.height, *(void *)&self->_scale, v8, v14];

  return v15;
}

- (CGSize)pixelSize
{
  [(IFImageSpecification *)self size];
  double v4 = v3;
  double v6 = v5;
  [(IFImageSpecification *)self scale];
  double v8 = v6 * v7;
  double v9 = v4 * v7;
  result.CGFloat height = v8;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)pixelsSize
{
  objc_copyStruct(v4, &self->_pixelsSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (NSSet)tags
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largerSpecification, 0);
  objc_storeStrong((id *)&self->_smallerSpecification, 0);

  objc_storeStrong((id *)&self->_tags, 0);
}

- (CGSize)minimumSize
{
  double v3 = [(IFImageSpecification *)self smallerSpecification];
  [v3 scale];
  double v5 = v4;
  [(IFImageSpecification *)self scale];
  double v7 = v6;

  if (v5 == v7)
  {
    double v8 = [(IFImageSpecification *)self smallerSpecification];
    [v8 size];
    double v10 = v9;
    double v12 = v11;

    double v13 = v10 + 1.0;
    double v14 = v12 + 1.0;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

@end