@interface CSUObjectDetectionResult
- (CGRect)box;
- (CSUObjectDetectionResult)initWithCGRect:(CGRect)a3 score:(float)a4 label:(id)a5;
- (NSString)label;
- (float)score;
@end

@implementation CSUObjectDetectionResult

- (CSUObjectDetectionResult)initWithCGRect:(CGRect)a3 score:(float)a4 label:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSUObjectDetectionResult;
  v13 = [(CSUObjectDetectionResult *)&v17 init];
  v14 = v13;
  if (v13)
  {
    v13->_box.origin.CGFloat x = x;
    v13->_box.origin.CGFloat y = y;
    v13->_box.size.CGFloat width = width;
    v13->_box.size.CGFloat height = height;
    v13->_score = a4;
    objc_storeStrong((id *)&v13->_label, a5);
    v15 = v14;
  }

  return v14;
}

- (CGRect)box
{
  double x = self->_box.origin.x;
  double y = self->_box.origin.y;
  double width = self->_box.size.width;
  double height = self->_box.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)score
{
  return self->_score;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end