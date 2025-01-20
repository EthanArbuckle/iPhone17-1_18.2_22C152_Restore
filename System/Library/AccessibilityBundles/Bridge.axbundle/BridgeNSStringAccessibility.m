@interface BridgeNSStringAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)drawInRect:(CGRect)a3 withAttributes:(id)a4;
@end

@implementation BridgeNSStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)drawInRect:(CGRect)a3 withAttributes:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BridgeNSStringAccessibility;
  -[BridgeNSStringAccessibility drawInRect:withAttributes:](&v5, sel_drawInRect_withAttributes_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [NSString _accessibilitySetLastDrawnString:self];
}

@end