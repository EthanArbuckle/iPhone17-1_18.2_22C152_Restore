@interface NCALRichComplicationPillView
- (NCALRichComplicationPillView)initWithFrame:(CGRect)a3;
- (NSArray)pillColors;
- (void)drawRect:(CGRect)a3;
- (void)setPillColors:(id)a3;
@end

@implementation NCALRichComplicationPillView

- (NCALRichComplicationPillView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCALRichComplicationPillView;
  v3 = -[NCALRichComplicationPillView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NCALRichComplicationPillView *)v3 setNeedsDisplayOnBoundsChange:1];
    v5 = [(NCALRichComplicationPillView *)v4 layer];
    [v5 setMasksToBounds:1];
  }
  return v4;
}

- (void)setPillColors:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if ((unint64_t)v5 >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  objc_super v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  pillColors = self->_pillColors;
  self->_pillColors = v7;

  [(NCALRichComplicationPillView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  NSUInteger v8 = [(NSArray *)self->_pillColors count];
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRectGetHeight(v31);
  v9 = +[CLKRenderingContext sharedRenderingContext];
  v10 = [v9 device];

  CLKRoundForDevice();
  CGFloat v12 = v11;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = v12;
  double MaxY = CGRectGetMaxY(v32);
  if (v8)
  {
    CGFloat v14 = MaxY;
    for (uint64_t i = 0; i != v8; ++i)
    {
      v16 = [(NSArray *)self->_pillColors objectAtIndexedSubscript:i];
      [v16 setFill];

      CurrentContext = UIGraphicsGetCurrentContext();
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = v12;
      CGContextFillRect(CurrentContext, v33);
      v18 = +[UIColor blackColor];
      [v18 setFill];

      v19 = UIGraphicsGetCurrentContext();
      v34.size.CGFloat height = 1.0;
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = v14;
      v34.size.CGFloat width = width;
      CGContextFillRect(v19, v34);
      v35.size.CGFloat height = 1.0;
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = v14;
      v35.size.CGFloat width = width;
      CGFloat y = CGRectGetMaxY(v35);
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = v12;
      CGFloat v14 = CGRectGetMaxY(v36);
    }
  }
  else
  {
    v20 = ncs_log_complication();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = height;
      v21 = NSStringFromCGRect(v37);
      pillColors = self->_pillColors;
      int v23 = 138544130;
      v24 = self;
      __int16 v25 = 2114;
      v26 = v21;
      __int16 v27 = 2048;
      CGFloat v28 = v12;
      __int16 v29 = 2114;
      v30 = pillColors;
      _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@ Zero slices (zero _pillColors) in drawRect: %{public}@, %0.2f heightPer, _pillColors %{public}@", (uint8_t *)&v23, 0x2Au);
    }
  }
}

- (NSArray)pillColors
{
  return self->_pillColors;
}

- (void).cxx_destruct
{
}

@end