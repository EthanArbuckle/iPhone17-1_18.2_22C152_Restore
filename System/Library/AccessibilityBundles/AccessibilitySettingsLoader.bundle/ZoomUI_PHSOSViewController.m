@interface ZoomUI_PHSOSViewController
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)presentMedicalID;
@end

@implementation ZoomUI_PHSOSViewController

+ (id)safeCategoryTargetClassName
{
  return @"PHSOSViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)presentMedicalID
{
  v3.receiver = self;
  v3.super_class = (Class)ZoomUI_PHSOSViewController;
  [(ZoomUI_PHSOSViewController *)&v3 presentMedicalID];
  v2 = [getZoomServicesClass() sharedInstance];
  [v2 notifyZoomSOSMedicalIDShown];
}

@end