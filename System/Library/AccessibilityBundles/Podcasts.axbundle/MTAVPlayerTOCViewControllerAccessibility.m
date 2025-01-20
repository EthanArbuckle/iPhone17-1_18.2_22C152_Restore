@interface MTAVPlayerTOCViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
@end

@implementation MTAVPlayerTOCViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAVPlayerTOCViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MTAVPlayerTOCViewControllerAccessibility;
  id v7 = a4;
  id v8 = a3;
  [(MTAVPlayerTOCViewControllerAccessibility *)&v12 configureCell:v8 withObject:v7 atIndexPath:a5];
  v9 = objc_msgSend(v8, "safeValueForKey:", @"durationLabel", v12.receiver, v12.super_class);

  v10 = [v7 safeValueForKey:@"duration"];

  [v10 doubleValue];
  v11 = AXDurationStringForDuration();
  [v9 setAccessibilityLabel:v11];
}

@end