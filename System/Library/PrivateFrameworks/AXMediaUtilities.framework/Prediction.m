@interface Prediction
- (CGRect)boundingBox;
- (NSString)label;
- (double)confidence;
- (id)debugDescription;
- (unint64_t)uiClass;
- (void)setBoundingBox:(CGRect)a3;
- (void)setConfidence:(double)a3;
- (void)setLabel:(id)a3;
- (void)setUiClass:(unint64_t)a3;
@end

@implementation Prediction

- (id)debugDescription
{
  v9.receiver = self;
  v9.super_class = (Class)Prediction;
  v3 = [(Prediction *)&v9 debugDescription];
  v4 = NSString;
  v5 = [(Prediction *)self label];
  v6 = [v4 stringWithFormat:@" - [%@]", v5];
  v7 = [v3 stringByAppendingString:v6];

  return v7;
}

- (unint64_t)uiClass
{
  return self->_uiClass;
}

- (void)setUiClass:(unint64_t)a3
{
  self->_uiClass = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end