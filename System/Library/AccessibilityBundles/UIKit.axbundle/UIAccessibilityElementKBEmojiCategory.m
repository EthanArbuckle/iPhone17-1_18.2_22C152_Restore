@interface UIAccessibilityElementKBEmojiCategory
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (uint64_t)category;
- (uint64_t)categoryIndex;
- (uint64_t)categoryView;
- (uint64_t)setCategoryIndex:(uint64_t)result;
- (void)setCategory:(uint64_t)a1;
@end

@implementation UIAccessibilityElementKBEmojiCategory

- (CGRect)accessibilityFrame
{
  v26 = self;
  SEL v25 = a2;
  id v2 = (id)-[UIAccessibilityElementKBEmojiCategory categoryView]((uint64_t)self);
  BOOL v17 = v2 != 0;

  if (v17)
  {
    id v15 = (id)-[UIAccessibilityElementKBEmojiCategory categoryView]((uint64_t)v26);
    [v15 accessibilityFrame];
    double v27 = v7;
    double v28 = v8;
    double v29 = v9;
    double v30 = v10;
  }
  else
  {
    v19[0] = 0;
    v19[1] = v19;
    int v20 = 0x10000000;
    int v21 = 64;
    v22 = &unk_24046C852;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v23 = *MEMORY[0x263F001A0];
    long long v24 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    v18[0] = v26;
    v18[1] = v19;
    AXPerformSafeBlock();
    id v16 = (id)[(UIAccessibilityElementKBEmojiCategory *)v26 accessibilityContainer];
    UIAccessibilityFrameForBounds();
    double v27 = v3;
    double v28 = v4;
    double v29 = v5;
    double v30 = v6;

    objc_storeStrong(v18, 0);
    _Block_object_dispose(v19, 8);
  }
  double v11 = v27;
  double v12 = v28;
  double v13 = v29;
  double v14 = v30;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (uint64_t)categoryView
{
  if (a1) {
    return *(void *)(a1 + 64);
  }
  else {
    return 0;
  }
}

__n128 __59__UIAccessibilityElementKBEmojiCategory_accessibilityFrame__block_invoke(uint64_t a1)
{
  id v11 = (id)[*(id *)(a1 + 32) accessibilityContainer];
  [v11 frameForDivider:-[UIAccessibilityElementKBEmojiCategory categoryIndex](*(void *)(a1 + 32))];
  v17.origin.x = v1;
  v17.origin.y = v2;
  v17.size.width = v3;
  v17.size.height = v4;

  id v12 = (id)[*(id *)(a1 + 32) accessibilityContainer];
  [v12 frameForDivider:-[UIAccessibilityElementKBEmojiCategory categoryIndex](*(void *)(a1 + 32)) + 1];
  r2.origin.x = v5;
  r2.origin.y = v6;
  r2.size.width = v7;
  r2.size.height = v8;

  CGRect v18 = CGRectUnion(v17, r2);
  *(CGFloat *)&long long v14 = v18.origin.x;
  *((void *)&v14 + 1) = *(void *)&v18.origin.y;
  v15.n128_u64[0] = *(void *)&v18.size.width;
  v15.n128_u64[1] = *(void *)&v18.size.height;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v9 + 32) = v14;
  __n128 result = v15;
  *(__n128 *)(v9 + 48) = v15;
  return result;
}

- (uint64_t)categoryIndex
{
  if (a1) {
    return *(void *)(a1 + 72);
  }
  else {
    return 0;
  }
}

- (id)accessibilityLabel
{
  v16[3] = self;
  v16[2] = (id)a2;
  id v5 = (id)-[UIAccessibilityElementKBEmojiCategory category]((uint64_t)self);
  id v4 = (id)[v5 safeValueForKey:@"_categoryType"];
  CGFloat v6 = (void *)(int)[v4 intValue];

  v16[1] = v6;
  CGFloat v7 = NSString;
  id v8 = accessibilityLocalizedString(@"emoji.category");
  uint64_t v10 = 0;
  id v11 = &v10;
  int v12 = 838860800;
  int v13 = 48;
  long long v14 = __Block_byref_object_copy__13;
  __n128 v15 = __Block_byref_object_dispose__13;
  v16[0] = 0;
  AXPerformSafeBlock();
  id v9 = (id)v11[5];
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(v16, 0);
  id v3 = (id)objc_msgSend(v7, "stringWithFormat:", v8, v9);

  return v3;
}

- (uint64_t)category
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0;
  }
}

void __59__UIAccessibilityElementKBEmojiCategory_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v1 = (id)[NSClassFromString(&cfstr_Uikeyboardemoj.isa) displayName:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (void)setCategory:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)setCategoryIndex:(uint64_t)result
{
  if (result) {
    *(void *)(result + 72) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end