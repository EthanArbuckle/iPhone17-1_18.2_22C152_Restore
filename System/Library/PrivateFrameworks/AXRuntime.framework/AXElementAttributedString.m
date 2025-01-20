@interface AXElementAttributedString
+ (BOOL)_isSerializableAccessibilityElement;
- (void)dealloc;
@end

@implementation AXElementAttributedString

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(AXElementAttributedString *)self _accessibilityUnregister];
  }
  v3.receiver = self;
  v3.super_class = (Class)AXElementAttributedString;
  [(AXAttributedString *)&v3 dealloc];
}

@end