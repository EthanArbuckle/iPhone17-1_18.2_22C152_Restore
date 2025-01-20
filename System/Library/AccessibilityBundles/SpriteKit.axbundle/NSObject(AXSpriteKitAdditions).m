@interface NSObject(AXSpriteKitAdditions)
- (id)accessibilitySpriteKitChildElements;
- (uint64_t)accessibilityMakeSpriteKitChildElementsIfNeeded;
- (void)setAccessibilitySpriteKitChildElements:()AXSpriteKitAdditions;
@end

@implementation NSObject(AXSpriteKitAdditions)

- (id)accessibilitySpriteKitChildElements
{
  v2 = objc_getAssociatedObject(a1, &_axChildElementsStorageKey);
  if (!v2)
  {
    v2 = [a1 accessibilityMakeSpriteKitChildElementsIfNeeded];
    [a1 setAccessibilitySpriteKitChildElements:v2];
  }

  return v2;
}

- (void)setAccessibilitySpriteKitChildElements:()AXSpriteKitAdditions
{
}

- (uint64_t)accessibilityMakeSpriteKitChildElementsIfNeeded
{
  return 0;
}

@end