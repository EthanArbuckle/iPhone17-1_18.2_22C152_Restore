@interface HMIVideoAnnotationParserRecord
- (CGRect)boundingBox;
- (HMIVideoAnnotationParserRecord)initWithBoundingBox:(CGRect)a3 timeStamp:(double)a4;
- (double)timeStamp;
@end

@implementation HMIVideoAnnotationParserRecord

- (HMIVideoAnnotationParserRecord)initWithBoundingBox:(CGRect)a3 timeStamp:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)HMIVideoAnnotationParserRecord;
  result = [(HMIVideoAnnotationParserRecord *)&v10 init];
  if (result)
  {
    result->_boundingBox.origin.CGFloat y = y;
    result->_boundingBox.size.CGFloat width = width;
    result->_boundingBox.size.CGFloat height = height;
    result->_timeStamp = a4;
    result->_boundingBox.origin.CGFloat x = x;
  }
  return result;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

@end