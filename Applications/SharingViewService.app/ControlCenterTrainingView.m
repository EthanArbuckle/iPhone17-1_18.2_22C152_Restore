@interface ControlCenterTrainingView
- (CGSize)intrinsicContentSize;
- (float)duration;
- (id)makeCAPackage;
@end

@implementation ControlCenterTrainingView

- (CGSize)intrinsicContentSize
{
  v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  double v4 = dbl_10017FA50[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  double v5 = dbl_10017FA60[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  result.height = v5;
  result.width = v4;
  return result;
}

- (float)duration
{
  return 8.0;
}

- (id)makeCAPackage
{
  UIUserInterfaceLayoutDirection v2 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(ControlCenterTrainingView *)self semanticContentAttribute]];
  unint64_t v3 = &stru_1001A1DC0;
  if (v2 == UIUserInterfaceLayoutDirectionRightToLeft) {
    unint64_t v3 = @"-RTL";
  }
  double v4 = v3;
  double v5 = +[UIDevice currentDevice];
  unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    v7 = "ipad";
  }
  else {
    v7 = "iphone";
  }
  v8 = +[NSString stringWithFormat:@"ControlCenter-PressToExpand%@~%s", v4, v7];

  v9 = +[UIDevice currentDevice];
  unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%@-D73", v8];

    v8 = (void *)v11;
  }
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 URLForResource:v8 withExtension:@"ca"];
  v14 = +[CAPackage packageWithContentsOfURL:v13 type:kCAPackageTypeCAMLBundle options:0 error:0];

  return v14;
}

@end