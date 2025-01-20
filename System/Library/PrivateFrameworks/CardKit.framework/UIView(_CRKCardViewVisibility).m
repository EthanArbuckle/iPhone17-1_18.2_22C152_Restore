@interface UIView(_CRKCardViewVisibility)
- (uint64_t)_crk_otherSubviewsOccludeSubview:()_CRKCardViewVisibility;
- (uint64_t)_crk_subviewIsVisible:()_CRKCardViewVisibility;
@end

@implementation UIView(_CRKCardViewVisibility)

- (uint64_t)_crk_otherSubviewsOccludeSubview:()_CRKCardViewVisibility
{
  id v4 = a3;
  v5 = [a1 subviews];
  uint64_t v6 = [v5 indexOfObject:v4];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__UIView__CRKCardViewVisibility___crk_otherSubviewsOccludeSubview___block_invoke;
  v10[3] = &unk_26470ED98;
  uint64_t v13 = v6;
  id v7 = v4;
  id v11 = v7;
  v12 = &v14;
  [v5 enumerateObjectsUsingBlock:v10];
  uint64_t v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (uint64_t)_crk_subviewIsVisible:()_CRKCardViewVisibility
{
  id v4 = a3;
  [a1 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 frame];
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  if (CGRectIntersectsRect(v19, v20)) {
    uint64_t v17 = objc_msgSend(a1, "_crk_otherSubviewsOccludeSubview:", v4) ^ 1;
  }
  else {
    uint64_t v17 = 0;
  }

  return v17;
}

@end