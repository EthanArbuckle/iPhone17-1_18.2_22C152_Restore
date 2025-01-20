@interface NSObject(AXBrailleMapProvider)
- (double)accessibilityBrailleMapRenderRegion;
- (id)accessibilityBrailleMapRenderer;
- (void)setAccessibilityBrailleMapRenderRegion:()AXBrailleMapProvider;
- (void)setAccessibilityBrailleMapRenderer:()AXBrailleMapProvider;
@end

@implementation NSObject(AXBrailleMapProvider)

- (void)setAccessibilityBrailleMapRenderer:()AXBrailleMapProvider
{
  v4 = _Block_copy(aBlock);

  objc_setAssociatedObject(a1, &AXBrailleRegion, v4, (void *)3);
}

- (id)accessibilityBrailleMapRenderer
{
  v1 = objc_getAssociatedObject(a1, &AXBrailleRegion);
  v2 = _Block_copy(v1);

  return v2;
}

- (double)accessibilityBrailleMapRenderRegion
{
  v1 = objc_getAssociatedObject(a1, &AXBrailleRegion);
  v2 = v1;
  if (v1)
  {
    [v1 rectValue];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x263F001A8];
  }

  return v4;
}

- (void)setAccessibilityBrailleMapRenderRegion:()AXBrailleMapProvider
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AXBrailleRegion, v2, (void *)3);
}

@end