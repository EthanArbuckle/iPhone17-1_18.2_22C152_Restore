@interface EQKitCompoundBox
- (BOOL)canContainBoxes;
- (BOOL)isEqual:(id)a3;
- (CGRect)erasableBounds;
- (CGRect)p_cacheErasableBounds;
- (EQKitCompoundBox)initWithChildBoxes:(id)a3;
- (NSArray)childBoxes;
- (double)depth;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
- (void)p_ensureDimensionsAreValid;
@end

@implementation EQKitCompoundBox

- (EQKitCompoundBox)initWithChildBoxes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EQKitCompoundBox;
  v5 = [(EQKitCompoundBox *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    childBoxes = v5->_childBoxes;
    v5->_childBoxes = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitCompoundBox *)self childBoxes];
  uint64_t v6 = (void *)[v4 initWithChildBoxes:v5];

  return v6;
}

- (BOOL)canContainBoxes
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EQKitCompoundBox *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(EQKitCompoundBox *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    uint64_t v6 = [(EQKitCompoundBox *)self childBoxes];
    v7 = [(EQKitCompoundBox *)v5 childBoxes];
    if (v6 == v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)p_ensureDimensionsAreValid
{
  if (!self->_dimensionsValid)
  {
    [(EQKitCompoundBox *)self p_cacheDimensionsForHeight:&self->_height depth:&self->_depth width:&self->_width];
    self->_dimensionsValid = 1;
  }
}

- (double)height
{
  return self->_height;
}

- (double)depth
{
  return self->_depth;
}

- (double)width
{
  return self->_width;
}

- (CGRect)erasableBounds
{
  if (self->_erasableBoundsValid)
  {
    double x = self->_erasableBounds.origin.x;
    double y = self->_erasableBounds.origin.y;
    double width = self->_erasableBounds.size.width;
    double height = self->_erasableBounds.size.height;
  }
  else
  {
    [(EQKitCompoundBox *)self p_cacheErasableBounds];
    self->_erasableBounds.origin.double x = x;
    self->_erasableBounds.origin.double y = y;
    self->_erasableBounds.size.double width = width;
    self->_erasableBounds.size.double height = height;
    self->_erasableBoundsValid = 1;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitCompoundBox *)self height];
  uint64_t v6 = v5;
  [(EQKitCompoundBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitCompoundBox *)self width];
  uint64_t v10 = v9;
  v11 = [(EQKitCompoundBox *)self childBoxes];
  v12 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f childBoxes=%@", v4, self, v6, v8, v10, v11];

  return v12;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  *a3 = 0.0;
  *a4 = 0.0;
  *a5 = 0.0;
}

- (CGRect)p_cacheErasableBounds
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (NSArray)childBoxes
{
  return self->_childBoxes;
}

- (void).cxx_destruct
{
}

@end