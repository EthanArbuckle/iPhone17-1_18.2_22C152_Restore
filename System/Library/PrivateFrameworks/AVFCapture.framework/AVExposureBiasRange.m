@interface AVExposureBiasRange
+ (AVExposureBiasRange)exposureBiasRangeWithMinExposureBias:(float)a3 maxExposureBias:(float)a4;
- (AVExposureBiasRange)initWithMinExposureBias:(float)a3 maxExposureBias:(float)a4;
- (BOOL)containsExposureBias:(float)a3;
- (float)maxExposureBias;
- (float)minExposureBias;
- (id)description;
@end

@implementation AVExposureBiasRange

+ (AVExposureBiasRange)exposureBiasRangeWithMinExposureBias:(float)a3 maxExposureBias:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v7 = a3;
  *(float *)&double v8 = a4;
  v9 = (void *)[v6 initWithMinExposureBias:v7 maxExposureBias:v8];

  return (AVExposureBiasRange *)v9;
}

- (AVExposureBiasRange)initWithMinExposureBias:(float)a3 maxExposureBias:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVExposureBiasRange;
  result = [(AVExposureBiasRange *)&v7 init];
  if (result)
  {
    result->_minExposureBias = a3;
    result->_maxExposureBias = a4;
  }
  return result;
}

- (float)minExposureBias
{
  return self->_minExposureBias;
}

- (float)maxExposureBias
{
  return self->_maxExposureBias;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %.2f - %.2f>", NSStringFromClass(v4), self, self->_minExposureBias, self->_maxExposureBias];
}

- (BOOL)containsExposureBias:(float)a3
{
  return self->_minExposureBias <= a3 && self->_maxExposureBias >= a3;
}

@end