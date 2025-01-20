@interface TVLatencyColorimeterTrainingView
- (id)makeCAPackage;
- (void)layoutSubviews;
@end

@implementation TVLatencyColorimeterTrainingView

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)TVLatencyColorimeterTrainingView;
  [(TVLatencyColorimeterTrainingView *)&v13 layoutSubviews];
  v3 = [(TVLatencyColorimeterTrainingView *)self superview];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(TVLatencyColorimeterTrainingView *)self layer];
  [v12 setFrame:v5, v7, v9, v11];
}

- (id)makeCAPackage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"TVLatencyColorimeter" withExtension:@"ca"];
  double v4 = +[CAPackage packageWithContentsOfURL:v3 type:kCAPackageTypeCAMLBundle options:0 error:0];

  return v4;
}

@end