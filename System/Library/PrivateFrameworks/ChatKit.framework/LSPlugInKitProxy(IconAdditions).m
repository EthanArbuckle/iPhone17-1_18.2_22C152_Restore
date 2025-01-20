@interface LSPlugInKitProxy(IconAdditions)
- (id)iconDataForInterfaceStyle:()IconAdditions;
- (id)iconForInterfaceStyle:()IconAdditions;
@end

@implementation LSPlugInKitProxy(IconAdditions)

- (id)iconDataForInterfaceStyle:()IconAdditions
{
  int v4 = a3 == 2;
  v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 scale];
  uint64_t v7 = v6;

  uint64_t v10 = v7;
  v8 = objc_msgSend(a1, "iconDataForVariant:withOptions:", objc_msgSend(MEMORY[0x1E4F42A80], "_iconVariantForUIApplicationIconFormat:scale:", 14, &v10), (v4 << 16));

  return v8;
}

- (id)iconForInterfaceStyle:()IconAdditions
{
  v1 = objc_msgSend(a1, "iconDataForInterfaceStyle:");
  if (v1 && (uint64_t v2 = LICreateIconFromCachedBitmap()) != 0)
  {
    v3 = (const void *)v2;
    int v4 = [MEMORY[0x1E4F42A80] imageWithCGImage:v2];
    CFRelease(v3);
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end