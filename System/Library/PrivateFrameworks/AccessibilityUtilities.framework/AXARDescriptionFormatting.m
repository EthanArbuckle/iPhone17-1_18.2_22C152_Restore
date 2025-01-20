@interface AXARDescriptionFormatting
+ (double)_valueForPercentageFromRawValue:(double)a3;
+ (id)_descriptionForDistance:(float)a3;
+ (id)_visibilityDescriptionForObjectFrame:(CGRect)a3 viewBounds:(CGRect)a4;
+ (id)descriptionForDistance:(float)a3 objectFrame:(CGRect)a4 viewBounds:(CGRect)a5;
@end

@implementation AXARDescriptionFormatting

+ (id)descriptionForDistance:(float)a3 objectFrame:(CGRect)a4 viewBounds:(CGRect)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v10 = objc_msgSend(a1, "_descriptionForDistance:");
  v13 = objc_msgSend(a1, "_visibilityDescriptionForObjectFrame:viewBounds:", x, y, width, height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v11 = __AXStringForVariables();

  return v11;
}

+ (id)_descriptionForDistance:(float)a3
{
  if (a3 == 0.0)
  {
    v3 = 0;
  }
  else
  {
    double v4 = a3;
    if (_descriptionForDistance__onceToken != -1) {
      dispatch_once(&_descriptionForDistance__onceToken, &__block_literal_global_29);
    }
    id v5 = objc_alloc(MEMORY[0x1E4F28E28]);
    v6 = [MEMORY[0x1E4F291E0] meters];
    v7 = (void *)[v5 initWithDoubleValue:v6 unit:v4];

    v8 = [(id)_descriptionForDistance__formatter stringFromMeasurement:v7];
    v9 = NSString;
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"DISTANCE_DESCRIPTION" value:&stru_1EDC3DEF8 table:@"ARDescriptionFormatting"];
    v3 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);
  }

  return v3;
}

void __53__AXARDescriptionFormatting__descriptionForDistance___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_descriptionForDistance__formatter;
  _descriptionForDistance__formatter = v0;

  [(id)_descriptionForDistance__formatter setUnitStyle:3];
  [(id)_descriptionForDistance__formatter setUnitOptions:2];
  id v2 = [(id)_descriptionForDistance__formatter numberFormatter];
  [v2 setMaximumFractionDigits:0];
}

+ (double)_valueForPercentageFromRawValue:(double)a3
{
  double v4 = round(a3 * 10.0) / 10.0;
  if (fabs(v4 + -1.0) < 2.22044605e-16 && fabs(a3 + -1.0) > 2.22044605e-16) {
    return 0.9;
  }
  if (fabs(v4) < 2.22044605e-16)
  {
    double v4 = 0.1;
    if (fabs(a3) <= 2.22044605e-16)
    {
      id v5 = AXLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        +[AXARDescriptionFormatting _valueForPercentageFromRawValue:](v5, a3);
      }
    }
  }
  return v4;
}

+ (id)_visibilityDescriptionForObjectFrame:(CGRect)a3 viewBounds:(CGRect)a4
{
  double x = a4.origin.x;
  double height = a4.size.height;
  CGFloat v37 = a3.origin.x;
  CGFloat y = a3.origin.y;
  CGFloat width = a3.size.width;
  CGFloat v34 = a3.size.height;
  double v35 = a4.size.width;
  double v8 = a4.origin.y;
  CGRect v39 = CGRectIntersection(a3, a4);
  CGFloat v9 = v39.origin.x;
  CGFloat v10 = v39.origin.y;
  CGFloat v11 = v39.size.width;
  CGFloat v12 = v39.size.height;
  if (!CGRectIsNull(v39))
  {
    v40.origin.double x = v9;
    v40.origin.CGFloat y = v10;
    v40.size.CGFloat width = v11;
    v40.size.double height = v12;
    double v32 = CGRectGetWidth(v40);
    v41.origin.double x = v9;
    v41.origin.CGFloat y = v10;
    v41.size.CGFloat width = v11;
    v41.size.double height = v12;
    double v31 = CGRectGetHeight(v41);
    v42.origin.double x = x;
    v42.origin.CGFloat y = v8;
    v42.size.CGFloat width = v35;
    v42.size.double height = height;
    double v13 = CGRectGetWidth(v42);
    v43.origin.double x = x;
    v43.origin.CGFloat y = v8;
    v43.size.CGFloat width = v35;
    v43.size.double height = height;
    double v14 = v13 * CGRectGetHeight(v43);
    v44.origin.double x = v37;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.double height = v34;
    double v33 = CGRectGetWidth(v44);
    v45.origin.double x = v37;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.double height = v34;
    double v15 = CGRectGetHeight(v45);
    if (v14 > 0.0)
    {
      double v16 = v33 * v15;
      if (v16 > 0.0)
      {
        double v17 = v32 * v31 / v16;
        v18 = NSString;
        v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v20 = [v19 localizedStringForKey:@"VISIBILITY_PERCENTAGE" value:&stru_1EDC3DEF8 table:@"ARDescriptionFormatting"];
        [a1 _valueForPercentageFromRawValue:v17];
        v21 = AXFormatFloatWithPercentage();
        v22 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v21);
        v23 = NSString;
        v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v25 = [v24 localizedStringForKey:@"COVERAGE_PERCENTAGE" value:&stru_1EDC3DEF8 table:@"ARDescriptionFormatting"];
        [a1 _valueForPercentageFromRawValue:v32 * v31 / v14];
        v26 = AXFormatFloatWithPercentage();
        v30 = objc_msgSend(v23, "localizedStringWithFormat:", v25, v26);
        v27 = __AXStringForVariables();

        goto LABEL_9;
      }
    }
    v28 = AXLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      +[AXARDescriptionFormatting _visibilityDescriptionForObjectFrame:viewBounds:](v28, x, v8, v35, height, v37, y, width, v34);
    }
  }
  v27 = 0;
LABEL_9:

  return v27;
}

+ (void)_valueForPercentageFromRawValue:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_fault_impl(&dword_18D308000, log, OS_LOG_TYPE_FAULT, "Had raw value %f, but should not have gotten here if the asset was not on screen at all", (uint8_t *)&v2, 0xCu);
}

+ (void)_visibilityDescriptionForObjectFrame:(double)a3 viewBounds:(double)a4 .cold.1(NSObject *a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v14 = NSStringFromRect(*(NSRect *)&a2);
  v21.origin.double x = a6;
  v21.origin.CGFloat y = a7;
  v21.size.CGFloat width = a8;
  v21.size.double height = a9;
  double v15 = NSStringFromRect(v21);
  int v16 = 138412546;
  double v17 = v14;
  __int16 v18 = 2112;
  v19 = v15;
  _os_log_fault_impl(&dword_18D308000, a1, OS_LOG_TYPE_FAULT, "Unable to get view bounds: %@ or object frame: %@", (uint8_t *)&v16, 0x16u);
}

@end