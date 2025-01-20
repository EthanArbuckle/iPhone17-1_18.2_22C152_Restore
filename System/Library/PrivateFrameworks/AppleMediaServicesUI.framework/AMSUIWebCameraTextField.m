@interface AMSUIWebCameraTextField
- (AMSUIWebCameraTextField)initWithFrame:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
@end

@implementation AMSUIWebCameraTextField

- (AMSUIWebCameraTextField)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebCameraTextField;
  v3 = -[AMSUIWebCameraTextField initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(AMSUIWebCameraTextField *)v3 setBackgroundColor:v4];

    [(AMSUIWebCameraTextField *)v3 setOpaque:1];
  }
  return v3;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebCameraTextField;
  -[AMSUIWebCameraTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.height = v5;
  result.size.double width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebCameraTextField;
  -[AMSUIWebCameraTextField placeholderRectForBounds:](&v8, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.height = v5;
  result.size.double width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebCameraTextField;
  -[AMSUIWebCameraTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = width + -30.0;
  double v7 = 15.0;
  result.size.height = v5;
  result.size.double width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

@end