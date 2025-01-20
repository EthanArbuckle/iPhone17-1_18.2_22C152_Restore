@interface ABHitTestPassthroughView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ABHitTestPassthroughView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v8 = [(ABHitTestPassthroughView *)self subviews];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__ABHitTestPassthroughView_pointInside_withEvent___block_invoke;
  v11[3] = &unk_265212FF8;
  CGFloat v14 = x;
  CGFloat v15 = y;
  v11[4] = self;
  id v9 = v7;
  id v12 = v9;
  v13 = &v16;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v11];

  LOBYTE(v8) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

void __50__ABHitTestPassthroughView_pointInside_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isHidden] & 1) == 0)
  {
    if ([v7 isUserInteractionEnabled])
    {
      [v7 alpha];
      if (v6 >= 0.01)
      {
        objc_msgSend(v7, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
        if (objc_msgSend(v7, "pointInside:withEvent:", *(void *)(a1 + 40)))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a4 = 1;
        }
      }
    }
  }
}

@end