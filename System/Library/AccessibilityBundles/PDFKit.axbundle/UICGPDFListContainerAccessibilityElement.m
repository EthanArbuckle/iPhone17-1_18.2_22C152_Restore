@interface UICGPDFListContainerAccessibilityElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (int64_t)accessibilityContainerType;
@end

@implementation UICGPDFListContainerAccessibilityElement

- (int64_t)accessibilityContainerType
{
  return 2;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CGFloat v2 = *MEMORY[0x263F001A0];
  CGFloat v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = [(UICGPDFListContainerAccessibilityElement *)self accessibilityElements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    CGFloat v10 = v5;
    CGFloat v11 = v4;
    CGFloat v12 = v3;
    CGFloat v13 = v2;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v35.origin.x = v13;
        v35.origin.y = v12;
        v35.size.width = v11;
        v35.size.height = v10;
        v38.origin.x = v2;
        v38.origin.y = v3;
        v38.size.width = v4;
        v38.size.height = v5;
        BOOL v16 = CGRectEqualToRect(v35, v38);
        [v15 accessibilityFrame];
        CGFloat v21 = v17;
        double v22 = v18;
        double v23 = v19;
        double v24 = v20;
        if (!v16)
        {
          v36.origin.x = v13;
          v36.origin.y = v12;
          v36.size.width = v11;
          v36.size.height = v10;
          *(CGRect *)&CGFloat v17 = CGRectUnion(v36, *(CGRect *)&v21);
        }
        CGFloat v13 = v17;
        CGFloat v12 = v18;
        CGFloat v11 = v19;
        CGFloat v10 = v20;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }
  else
  {
    CGFloat v10 = v5;
    CGFloat v11 = v4;
    CGFloat v12 = v3;
    CGFloat v13 = v2;
  }

  double v25 = v13;
  double v26 = v12;
  double v27 = v11;
  double v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

@end