@interface FigPluginViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
- (void)setAllowPlayback:(BOOL)a3;
- (void)webPlugInStart;
@end

@implementation FigPluginViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FigPluginView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (void)setAllowPlayback:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigPluginViewAccessibility;
  [(FigPluginViewAccessibility *)&v6 setAllowPlayback:a3];
  v4 = [(FigPluginViewAccessibility *)self safeValueForKey:@"_playButton"];
  v5 = accessibilityLocalizedString(@"quicktime.play.button");
  [v4 setAccessibilityLabel:v5];
}

- (void)webPlugInStart
{
  v5.receiver = self;
  v5.super_class = (Class)FigPluginViewAccessibility;
  [(FigPluginViewAccessibility *)&v5 webPlugInStart];
  UIAccessibilityNotifications v2 = *MEMORY[0x263F81458];
  LODWORD(v3) = 1.0;
  v4 = [NSNumber numberWithFloat:v3];
  UIAccessibilityPostNotification(v2, v4);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end