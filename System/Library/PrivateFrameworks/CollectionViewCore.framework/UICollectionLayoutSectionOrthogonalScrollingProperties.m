@interface UICollectionLayoutSectionOrthogonalScrollingProperties
- (BOOL)isEqual:(id)a3;
- (UICollectionLayoutSectionOrthogonalScrollingBounce)bounce;
- (UICollectionLayoutSectionOrthogonalScrollingDecelerationRate)decelerationRate;
- (UICollectionLayoutSectionOrthogonalScrollingProperties)init;
- (id)_descriptionProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBounce:(UICollectionLayoutSectionOrthogonalScrollingBounce)bounce;
- (void)setDecelerationRate:(UICollectionLayoutSectionOrthogonalScrollingDecelerationRate)decelerationRate;
@end

@implementation UICollectionLayoutSectionOrthogonalScrollingProperties

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_decelerationRate;
    *((void *)result + 2) = self->_bounce;
  }
  return result;
}

- (UICollectionLayoutSectionOrthogonalScrollingProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionLayoutSectionOrthogonalScrollingProperties;
  id result = [(UICollectionLayoutSectionOrthogonalScrollingProperties *)&v3 init];
  if (result)
  {
    result->_decelerationRate = -1.0;
    result->_bounce = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UICollectionLayoutSectionOrthogonalScrollingProperties *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      double decelerationRate = self->_decelerationRate;
      [(UICollectionLayoutSectionOrthogonalScrollingProperties *)v5 decelerationRate];
      if (decelerationRate == v7)
      {
        int64_t bounce = self->_bounce;
        BOOL v8 = bounce == [(UICollectionLayoutSectionOrthogonalScrollingProperties *)v5 bounce];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (UICollectionLayoutSectionOrthogonalScrollingDecelerationRate)decelerationRate
{
  return self->_decelerationRate;
}

- (UICollectionLayoutSectionOrthogonalScrollingBounce)bounce
{
  return self->_bounce;
}

- (void)setDecelerationRate:(UICollectionLayoutSectionOrthogonalScrollingDecelerationRate)decelerationRate
{
  self->_double decelerationRate = decelerationRate;
}

- (id)_descriptionProperties
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = v3;
  double decelerationRate = self->_decelerationRate;
  if (decelerationRate == -1.0)
  {
    v6 = @"double decelerationRate = automatic";
LABEL_7:
    [v3 addObject:v6];
    goto LABEL_8;
  }
  if (decelerationRate == 0.998)
  {
    v6 = @"double decelerationRate = normal";
    goto LABEL_7;
  }
  if (decelerationRate == 0.99)
  {
    v6 = @"double decelerationRate = fast";
    goto LABEL_7;
  }
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"double decelerationRate = %g", *(void *)&self->_decelerationRate);
  [v4 addObject:v10];

LABEL_8:
  int64_t bounce = self->_bounce;
  if (bounce)
  {
    if (bounce == 1)
    {
      BOOL v8 = @"bounce = always";
    }
    else
    {
      if (self->_decelerationRate != 2.0) {
        goto LABEL_15;
      }
      BOOL v8 = @"bounce = never";
    }
  }
  else
  {
    BOOL v8 = @"bounce = automatic";
  }
  [v4 addObject:v8];
LABEL_15:
  return v4;
}

- (id)description
{
  id v3 = [(UICollectionLayoutSectionOrthogonalScrollingProperties *)self _descriptionProperties];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  double v7 = [v3 componentsJoinedByString:@"; "];
  BOOL v8 = [v4 stringWithFormat:@"<%@: %p; %@>", v6, self, v7];

  return v8;
}

- (void)setBounce:(UICollectionLayoutSectionOrthogonalScrollingBounce)bounce
{
  self->_int64_t bounce = bounce;
}

@end