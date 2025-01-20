@interface UIView
@end

@implementation UIView

uint64_t __67__UIView__CRKCardViewVisibility___crk_otherSubviewsOccludeSubview___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = v7;
  if (*(void *)(a1 + 48) < a3)
  {
    v22 = (void *)v7;
    [(id)v7 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [*(id *)(a1 + 32) frame];
    v25.origin.x = v17;
    v25.origin.y = v18;
    v25.size.width = v19;
    v25.size.height = v20;
    v24.origin.x = v10;
    v24.origin.y = v12;
    v24.size.width = v14;
    v24.size.height = v16;
    uint64_t v7 = CGRectContainsRect(v24, v25);
    uint64_t v8 = (uint64_t)v22;
    if (v7)
    {
      uint64_t v7 = [v22 isHidden];
      uint64_t v8 = (uint64_t)v22;
      if ((v7 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

  return MEMORY[0x270F9A758](v7, v8);
}

@end