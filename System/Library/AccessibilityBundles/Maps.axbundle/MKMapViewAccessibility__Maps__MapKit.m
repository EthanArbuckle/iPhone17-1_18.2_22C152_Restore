@interface MKMapViewAccessibility__Maps__MapKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)snapshotImageWithScale:(double)a3;
@end

@implementation MKMapViewAccessibility__Maps__MapKit

+ (id)safeCategoryTargetClassName
{
  return @"MKMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)snapshotImageWithScale:(double)a3
{
  _UIAccessibilityBlockPostingOfNotification();
  v7.receiver = self;
  v7.super_class = (Class)MKMapViewAccessibility__Maps__MapKit;
  v5 = [(MKMapViewAccessibility__Maps__MapKit *)&v7 snapshotImageWithScale:a3];
  _UIAccessibilityUnblockPostingOfNotification();

  return v5;
}

@end