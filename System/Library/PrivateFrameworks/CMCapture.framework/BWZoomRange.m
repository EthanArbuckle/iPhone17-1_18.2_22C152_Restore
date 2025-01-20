@interface BWZoomRange
+ (id)fudgedZoomRangeWithLower:(float)a3 upperBound:(float)a4 fudgedLowerBound:(float)a5 fudgedUpperBound:(float)a6;
+ (id)zoomRangeWithLower:(float)a3 upperBound:(float)a4;
- (BOOL)isEqual:(id)a3;
- (BWZoomRange)initWithLowerBound:(float)a3 upperBound:(float)a4;
- (BWZoomRange)initWithLowerBound:(float)a3 upperBound:(float)a4 fudgedLowerBound:(float)a5 fudgedUpperBound:(float)a6;
- (float)applyFudgeToZoomFactor:(float)a3;
- (float)fudgedLowerBound;
- (float)fudgedUpperBound;
- (float)lowerBound;
- (float)removeFudgeFromZoomFactor:(float)a3;
- (float)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation BWZoomRange

- (float)upperBound
{
  return self->_upperBound;
}

- (float)lowerBound
{
  return self->_lowerBound;
}

- (float)applyFudgeToZoomFactor:(float)a3
{
  float lowerBound = self->_lowerBound;
  if (lowerBound > a3) {
    return self->_fudgedLowerBound;
  }
  float upperBound = self->_upperBound;
  if (upperBound >= a3) {
    return self->_fudgedLowerBound
  }
         + (float)((float)(self->_fudgedUpperBound - self->_fudgedLowerBound)
                 * (float)((float)(a3 - lowerBound) / (float)(upperBound - lowerBound)));
  else {
    return self->_fudgedUpperBound;
  }
}

- (float)fudgedUpperBound
{
  return self->_fudgedUpperBound;
}

- (float)fudgedLowerBound
{
  return self->_fudgedLowerBound;
}

+ (id)fudgedZoomRangeWithLower:(float)a3 upperBound:(float)a4 fudgedLowerBound:(float)a5 fudgedUpperBound:(float)a6
{
  v10 = [BWZoomRange alloc];
  *(float *)&double v11 = a3;
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  *(float *)&double v14 = a6;
  v15 = [(BWZoomRange *)v10 initWithLowerBound:v11 upperBound:v12 fudgedLowerBound:v13 fudgedUpperBound:v14];
  return v15;
}

- (BWZoomRange)initWithLowerBound:(float)a3 upperBound:(float)a4 fudgedLowerBound:(float)a5 fudgedUpperBound:(float)a6
{
  v23.receiver = self;
  v23.super_class = (Class)BWZoomRange;
  result = [(BWZoomRange *)&v23 init];
  if (result)
  {
    if (a3 < a4 && a5 < a6)
    {
      result->_float lowerBound = a3;
      result->_float upperBound = a4;
      result->_fudgedLowerBound = a5;
      result->_fudgedUpperBound = a6;
      float v12 = a3 * 1024.0;
      if (a3 >= 1024.0) {
        float v12 = a3;
      }
      int v13 = (int)v12;
      float v14 = a4 * 1024.0;
      if (a4 >= 1024.0) {
        float v14 = a4;
      }
      int v15 = (int)v14;
      if (a6 >= 1024.0) {
        float v16 = 2.0;
      }
      else {
        float v16 = 2048.0;
      }
      int v17 = (int)(float)(v16 * a6);
      if (a5 >= 1024.0) {
        float v18 = 2.0;
      }
      else {
        float v18 = 2048.0;
      }
      int v19 = (int)(float)(v18 * a5);
      int v20 = v15 ^ v13;
      if (v13 == v19 || v15 == v17) {
        unint64_t v22 = v20;
      }
      else {
        unint64_t v22 = v20 ^ v19 ^ v17;
      }
      result->_hash = v22;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

+ (id)zoomRangeWithLower:(float)a3 upperBound:(float)a4
{
  v6 = [BWZoomRange alloc];
  *(float *)&double v7 = a3;
  *(float *)&double v8 = a4;
  v9 = [(BWZoomRange *)v6 initWithLowerBound:v7 upperBound:v8];
  return v9;
}

- (BWZoomRange)initWithLowerBound:(float)a3 upperBound:(float)a4
{
  *(float *)&double v4 = a3;
  *(float *)&double v5 = a4;
  return [(BWZoomRange *)self initWithLowerBound:*(double *)&a3 upperBound:*(double *)&a4 fudgedLowerBound:v4 fudgedUpperBound:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = +[BWZoomRange allocWithZone:a3];
  *(float *)&double v5 = self->_lowerBound;
  *(float *)&double v6 = self->_upperBound;
  *(float *)&double v7 = self->_fudgedLowerBound;
  *(float *)&double v8 = self->_fudgedUpperBound;
  return [(BWZoomRange *)v4 initWithLowerBound:v5 upperBound:v6 fudgedLowerBound:v7 fudgedUpperBound:v8];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [a3 lowerBound];
  if (v5 != self->_lowerBound) {
    return 0;
  }
  [a3 upperBound];
  if (v6 != self->_upperBound) {
    return 0;
  }
  [a3 fudgedLowerBound];
  if (v7 != self->_fudgedLowerBound) {
    return 0;
  }
  [a3 fudgedUpperBound];
  return v9 == self->_fudgedUpperBound;
}

- (float)removeFudgeFromZoomFactor:(float)a3
{
  float fudgedLowerBound = self->_fudgedLowerBound;
  if (fudgedLowerBound > a3) {
    return self->_lowerBound;
  }
  float fudgedUpperBound = self->_fudgedUpperBound;
  if (fudgedUpperBound >= a3) {
    return self->_lowerBound
  }
         + (float)((float)(self->_upperBound - self->_lowerBound)
                 * (float)((float)(a3 - fudgedLowerBound) / (float)(fudgedUpperBound - fudgedLowerBound)));
  else {
    return self->_upperBound;
  }
}

- (id)description
{
  float lowerBound = self->_lowerBound;
  float upperBound = self->_upperBound;
  float fudgedLowerBound = self->_fudgedLowerBound;
  float fudgedUpperBound = self->_fudgedUpperBound;
  double v6 = lowerBound;
  double v7 = upperBound;
  if (lowerBound == fudgedLowerBound && upperBound == fudgedUpperBound) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%f..%f]", v6, v7, lowerBound, upperBound, v10, v11);
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%f..%f] -> [%f..%f]", v6, v7, lowerBound, upperBound, fudgedLowerBound, fudgedUpperBound);
  }
}

- (unint64_t)hash
{
  return self->_hash;
}

@end