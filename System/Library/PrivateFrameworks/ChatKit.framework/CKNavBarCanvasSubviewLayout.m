@interface CKNavBarCanvasSubviewLayout
+ (CKNavBarCanvasSubviewLayout)layoutWithTitleFrame:(double)a3 subtitleFrame:(double)a4 leftItemFrame:(double)a5 rightItemFrame:(double)a6 statusIndicatorFrame:(double)a7;
- (CGRect)leftItemFrame;
- (CGRect)rightItemFrame;
- (CGRect)statusIndicatorFrame;
- (CGRect)subtitleFrame;
- (CGRect)titleFrame;
- (double)initWithTitleFrame:(double)a3 subtitleFrame:(double)a4 leftItemFrame:(double)a5 rightItemFrame:(double)a6 statusIndicatorFrame:(double)a7;
@end

@implementation CKNavBarCanvasSubviewLayout

+ (CKNavBarCanvasSubviewLayout)layoutWithTitleFrame:(double)a3 subtitleFrame:(double)a4 leftItemFrame:(double)a5 rightItemFrame:(double)a6 statusIndicatorFrame:(double)a7
{
  v25 = -[CKNavBarCanvasSubviewLayout initWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:]([CKNavBarCanvasSubviewLayout alloc], "initWithTitleFrame:subtitleFrame:leftItemFrame:rightItemFrame:statusIndicatorFrame:", a1, a2, a3, a4, a5, a6, a7, a8, a17, a18, a19, a20, a21, a22, a23, a24, a25);

  return v25;
}

- (double)initWithTitleFrame:(double)a3 subtitleFrame:(double)a4 leftItemFrame:(double)a5 rightItemFrame:(double)a6 statusIndicatorFrame:(double)a7
{
  v37.receiver = a1;
  v37.super_class = (Class)CKNavBarCanvasSubviewLayout;
  result = (double *)objc_msgSendSuper2(&v37, sel_init);
  if (result)
  {
    result[9] = a2;
    result[10] = a3;
    result[11] = a4;
    result[12] = a5;
    result[13] = a6;
    result[14] = a7;
    result[15] = a8;
    result[16] = a9;
    *((void *)result + 1) = a17;
    *((void *)result + 2) = a18;
    *((void *)result + 3) = a19;
    *((void *)result + 4) = a20;
    *((void *)result + 5) = a21;
    *((void *)result + 6) = a22;
    *((void *)result + 7) = a23;
    *((void *)result + 8) = a24;
    *((void *)result + 17) = a25;
    *((void *)result + 18) = a26;
    *((void *)result + 19) = a27;
    *((void *)result + 20) = a28;
  }
  return result;
}

- (CGRect)leftItemFrame
{
  double x = self->_leftItemFrame.origin.x;
  double y = self->_leftItemFrame.origin.y;
  double width = self->_leftItemFrame.size.width;
  double height = self->_leftItemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)rightItemFrame
{
  double x = self->_rightItemFrame.origin.x;
  double y = self->_rightItemFrame.origin.y;
  double width = self->_rightItemFrame.size.width;
  double height = self->_rightItemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)titleFrame
{
  double x = self->_titleFrame.origin.x;
  double y = self->_titleFrame.origin.y;
  double width = self->_titleFrame.size.width;
  double height = self->_titleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)subtitleFrame
{
  double x = self->_subtitleFrame.origin.x;
  double y = self->_subtitleFrame.origin.y;
  double width = self->_subtitleFrame.size.width;
  double height = self->_subtitleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)statusIndicatorFrame
{
  double x = self->_statusIndicatorFrame.origin.x;
  double y = self->_statusIndicatorFrame.origin.y;
  double width = self->_statusIndicatorFrame.size.width;
  double height = self->_statusIndicatorFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end