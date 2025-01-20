@interface ParticipantVideoViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation ParticipantVideoViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantVideoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end