@interface _CKVideoMessageRecordingWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityWindowVisible;
@end

@implementation _CKVideoMessageRecordingWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_CKVideoMessageRecordingWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  return 1;
}

@end