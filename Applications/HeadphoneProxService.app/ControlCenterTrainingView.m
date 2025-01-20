@interface ControlCenterTrainingView
- (CGSize)intrinsicContentSize;
- (float)duration;
- (id)makeCAPackage;
@end

@implementation ControlCenterTrainingView

- (id)makeCAPackage
{
  UIUserInterfaceLayoutDirection v2 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(ControlCenterTrainingView *)self semanticContentAttribute]];
  v3 = &stru_1000C6948;
  if (v2 == UIUserInterfaceLayoutDirectionRightToLeft) {
    v3 = @"-RTL";
  }
  v4 = v3;
  v5 = +[UIDevice currentDevice];
  unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    v7 = "ipad";
  }
  else {
    v7 = "iphone";
  }
  v8 = +[NSString stringWithFormat:@"ControlCenter-PressToExpand%@~%s", v4, v7];

  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 URLForResource:v8 withExtension:@"ca"];
  v11 = +[CAPackage packageWithContentsOfURL:v10 type:kCAPackageTypeCAMLBundle options:0 error:0];

  return v11;
}

- (float)duration
{
  return 8.0;
}

- (CGSize)intrinsicContentSize
{
  UIUserInterfaceLayoutDirection v2 = +[UIDevice currentDevice];
  unint64_t v3 = (unint64_t)[v2 userInterfaceIdiom];

  double v4 = dbl_1000A19A0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  double v5 = dbl_1000A19B0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  result.height = v5;
  result.width = v4;
  return result;
}

@end