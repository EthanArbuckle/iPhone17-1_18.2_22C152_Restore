@interface NTKParmesanPreviewSimpleValidator
- (CGSize)photoSize;
- (NTKParmesanPreviewSimpleValidator)initWithPhotoSize:(CGSize)a3 maskOffsetTop:(double)a4 timeLabelInsetTop:(double)a5;
- (double)maskOffsetTop;
- (double)timeLabelInsetTop;
- (void)validateTimeLabel:(CGRect)a3 completion:(id)a4;
@end

@implementation NTKParmesanPreviewSimpleValidator

- (NTKParmesanPreviewSimpleValidator)initWithPhotoSize:(CGSize)a3 maskOffsetTop:(double)a4 timeLabelInsetTop:(double)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)NTKParmesanPreviewSimpleValidator;
  result = [(NTKParmesanPreviewSimpleValidator *)&v10 init];
  if (result)
  {
    result->_photoSize.CGFloat width = width;
    result->_photoSize.CGFloat height = height;
    result->_maskOffsetTop = a4;
    result->_timeLabelInsetTop = a5;
  }
  return result;
}

- (void)validateTimeLabel:(CGRect)a3 completion:(id)a4
{
  (*((void (**)(id, BOOL))a4 + 2))(a4, self->_maskOffsetTop >= a3.origin.y + a3.size.height * self->_timeLabelInsetTop);
}

- (CGSize)photoSize
{
  double width = self->_photoSize.width;
  double height = self->_photoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)maskOffsetTop
{
  return self->_maskOffsetTop;
}

- (double)timeLabelInsetTop
{
  return self->_timeLabelInsetTop;
}

@end