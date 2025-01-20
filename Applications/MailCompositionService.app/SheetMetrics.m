@interface SheetMetrics
+ (CGRect)frameForPresentedSheetIn:(id)a3;
+ (double)cornerRadius;
@end

@implementation SheetMetrics

+ (CGRect)frameForPresentedSheetIn:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  _UISheetPageSize();
  double v9 = v8;
  double v11 = v10;
  double v12 = v5 - v8;
  double v13 = v7 - v10;

  double v14 = v12;
  double v15 = v13;
  double v16 = v9;
  double v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (double)cornerRadius
{
  return _UISheetCornerRadius;
}

@end