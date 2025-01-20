@interface PBFPosterRackCollectionViewController_InvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)viewDidLayoutSubviews;
@end

@implementation PBFPosterRackCollectionViewController_InvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBFPosterRackCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  if (!_AXSInvertColorsEnabled()) {
    goto LABEL_4;
  }
  v3 = [(PBFPosterRackCollectionViewController_InvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [v3 window];
  v5 = [v4 traitCollection];
  v6 = (char *)[v5 userInterfaceStyle];

  if (v6 == (unsigned char *)&dword_0 + 2)
  {
    id v9 = [(PBFPosterRackCollectionViewController_InvertColorsAccessibility *)self safeUIViewForKey:@"view"];
    v7 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    id v8 = +[AXInvertColorsAppHelper insertBackgroundView:v9 color:v7];
  }
  else
  {
LABEL_4:
    id v9 = [(PBFPosterRackCollectionViewController_InvertColorsAccessibility *)self safeUIViewForKey:@"view"];
    +[AXInvertColorsAppHelper removeBackgroundView:](AXInvertColorsAppHelper, "removeBackgroundView:");
  }
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PBFPosterRackCollectionViewController_InvertColorsAccessibility;
  [(PBFPosterRackCollectionViewController_InvertColorsAccessibility *)&v10 viewDidLayoutSubviews];
  v3 = [(PBFPosterRackCollectionViewController_InvertColorsAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [v3 window];

  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_17C38;
  v7[3] = &unk_44950;
  objc_copyWeak(&v8, &location);
  [v4 _accessibilitySetInvertColorsSupportsDarkWindowInvertBlock:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_17C78;
  v5[3] = &unk_44950;
  objc_copyWeak(&v6, &location);
  [v4 _accessibilitySetInvertColorsActsAsDarkWindowBlock:v5];
  [(PBFPosterRackCollectionViewController_InvertColorsAccessibility *)self _accessibilityLoadInvertColors];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

@end