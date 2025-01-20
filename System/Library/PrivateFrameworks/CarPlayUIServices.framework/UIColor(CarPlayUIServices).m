@interface UIColor(CarPlayUIServices)
+ (id)crsui_consoleTurnCardETATrayBackgroundColor;
+ (id)crsui_dashboardWidgetBackgroundColor;
@end

@implementation UIColor(CarPlayUIServices)

+ (id)crsui_dashboardWidgetBackgroundColor
{
  if (crsui_dashboardWidgetBackgroundColor_onceToken != -1) {
    dispatch_once(&crsui_dashboardWidgetBackgroundColor_onceToken, &__block_literal_global);
  }
  v0 = (void *)crsui_dashboardWidgetBackgroundColor_dashboardWidgetBackgroundColor;
  return v0;
}

+ (id)crsui_consoleTurnCardETATrayBackgroundColor
{
  if (crsui_consoleTurnCardETATrayBackgroundColor_onceToken != -1) {
    dispatch_once(&crsui_consoleTurnCardETATrayBackgroundColor_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)crsui_consoleTurnCardETATrayBackgroundColor_consoleTurnCardBackgroundColor;
  return v0;
}

@end