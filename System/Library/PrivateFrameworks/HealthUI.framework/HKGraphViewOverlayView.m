@interface HKGraphViewOverlayView
@end

@implementation HKGraphViewOverlayView

uint64_t __49___HKGraphViewOverlayView_drawContentUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 bounds];
  unint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = [v4 CGContext];

  v11 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128))(v9 + 16);
  v12.n128_u64[0] = v6;
  v13.n128_u64[0] = v8;
  return v11(v9, v10, v12, v13);
}

@end