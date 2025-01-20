@interface ListeningAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation ListeningAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicRecognition.ListeningAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"ACCESSIBILITY_RECOGNIZE_MUSIC_LISTENING_VIEW");
}

@end