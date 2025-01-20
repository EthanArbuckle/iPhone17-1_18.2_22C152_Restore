@interface NTKPoodleWorldClockComplicationView
- (CGRect)padContentFrame:(CGRect)a3;
- (NTKPoodleWorldClockComplicationView)initWithBackgroundView:(id)a3;
@end

@implementation NTKPoodleWorldClockComplicationView

- (NTKPoodleWorldClockComplicationView)initWithBackgroundView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPoodleWorldClockComplicationView;
  return [(NTKZeusWorldClockComplicationView *)&v4 initWithBackgroundView:a3];
}

- (CGRect)padContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = [(NTKZeusComplicationView *)self device];
  CGFloat v8 = -sub_1BE50(v7);
  CGFloat v10 = -v9;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGRect v20 = CGRectInset(v19, v8, v10);
  CGFloat v11 = v20.origin.x;
  CGFloat v12 = v20.origin.y;
  CGFloat v13 = v20.size.width;
  CGFloat v14 = v20.size.height;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

@end