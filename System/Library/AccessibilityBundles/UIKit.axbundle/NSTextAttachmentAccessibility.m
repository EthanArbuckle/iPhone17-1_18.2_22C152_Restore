@interface NSTextAttachmentAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)dealloc;
@end

@implementation NSTextAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSTextAttachment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(NSTextAttachmentAccessibility *)self _accessibilityUnregister];
  v2.receiver = v4;
  v2.super_class = (Class)NSTextAttachmentAccessibility;
  [(NSTextAttachmentAccessibility *)&v2 dealloc];
}

@end