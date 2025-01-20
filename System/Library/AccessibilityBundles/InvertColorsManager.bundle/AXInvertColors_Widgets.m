@interface AXInvertColors_Widgets
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Widgets

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WGWidgetListEditViewTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WGWidgetListEditViewTableViewCell", @"layoutSubviews", "v", 0);
}

+ (void)installCategories:(id)a3
{
}

+ (int64_t)helperType
{
  return 1;
}

@end