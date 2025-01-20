@interface MPPadFullScreenTransportControlsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation MPPadFullScreenTransportControlsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPPadFullScreenTransportControls";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end