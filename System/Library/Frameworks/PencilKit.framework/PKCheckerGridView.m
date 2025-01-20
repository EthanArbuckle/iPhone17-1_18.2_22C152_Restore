@interface PKCheckerGridView
@end

@implementation PKCheckerGridView

void __42___PKCheckerGridView__createGridTileImage__block_invoke(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  id v4 = [*(id *)(a1 + 32) colorB];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  v13.size.width = *(CGFloat *)(a1 + 40);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.height = v13.size.width;
  CGContextFillRect(v3, v13);
  id v5 = [*(id *)(a1 + 32) colorA];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v5 CGColor]);

  v14.origin.x = *(CGFloat *)(a1 + 40);
  v14.origin.y = 0.0;
  v14.size.width = v14.origin.x;
  v14.size.height = v14.origin.x;
  CGContextFillRect(v3, v14);
  id v6 = [*(id *)(a1 + 32) colorB];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v6 CGColor]);

  v15.origin.x = *(CGFloat *)(a1 + 40);
  v15.origin.y = v15.origin.x;
  v15.size.width = v15.origin.x;
  v15.size.height = v15.origin.x;
  CGContextFillRect(v3, v15);
  id v7 = [*(id *)(a1 + 32) colorA];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v7 CGColor]);

  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = 0;
  uint64_t v10 = v8;
  uint64_t v11 = v8;

  CGContextFillRect(v3, *(CGRect *)&v9);
}

@end