@interface ISiOSAppOverhangingBadgeRecipe
- (id)hintedBadgeRect;
- (id)hintedMainIconBadgeRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISiOSAppOverhangingBadgeRecipe

- (id)hintedMainIconBadgeRect
{
  if (hintedMainIconBadgeRect_onceToken != -1) {
    dispatch_once(&hintedMainIconBadgeRect_onceToken, &__block_literal_global_246);
  }
  v2 = (void *)hintedMainIconBadgeRect_rect;
  return v2;
}

void __57__ISiOSAppOverhangingBadgeRecipe_hintedMainIconBadgeRect__block_invoke()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:5];
  v1 = (void *)hintedMainIconBadgeRect_rect;
  hintedMainIconBadgeRect_rect = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F6F1E0] iosAppIconSpecification];
  memset(&rect2[1], 0, 32);
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [v2 allImageSpecifications];
  uint64_t v4 = [v3 countByEnumeratingWithState:&rect2[1] objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)rect2[3];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    rect2[0] = *MEMORY[0x1E4F1DB28];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)rect2[3] != v6) {
          objc_enumerationMutation(v3);
        }
        v11 = *(void **)(rect2[2] + 8 * i);
        [v11 size];
        double v13 = v12;
        [v11 size];
        double v15 = v14;
        double v16 = round(v13 * 1.18);
        double v17 = round(v14 * 1.18);
        objc_msgSend((id)hintedMainIconBadgeRect_rect, "hintedRectForSize:", v16, v17);
        *(void *)&v24.origin.x = rect2[0];
        v24.origin.y = v7;
        v24.size.width = v8;
        v24.size.height = v9;
        if (CGRectEqualToRect(v23, v24)) {
          objc_msgSend((id)hintedMainIconBadgeRect_rect, "addHintedRect:forSize:", (v16 - v13) * 0.5, (v17 - v15) * 0.5, v13, v15, v16, v17);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&rect2[1] objects:v21 count:16];
    }
    while (v5);
  }
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken != -1) {
    dispatch_once(&hintedBadgeRect_onceToken, &__block_literal_global_248);
  }
  v2 = (void *)hintedBadgeRect_rect;
  return v2;
}

void __49__ISiOSAppOverhangingBadgeRecipe_hintedBadgeRect__block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:5];
  v1 = (void *)hintedBadgeRect_rect;
  hintedBadgeRect_rect = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F6F1E0] iosAppIconSpecification];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [v2 allImageSpecifications];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v18 = *MEMORY[0x1E4F1DB28];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "size", *(void *)&v17, *(void *)&v18);
        double v12 = v11;
        [v10 size];
        double v14 = v13;
        double v15 = round(v12 * 1.18);
        double v16 = round(v13 * 1.18);
        objc_msgSend((id)hintedBadgeRect_rect, "hintedRectForSize:", v15, v16);
        v26.origin.y = v17;
        v26.origin.x = v18;
        v26.size.width = v7;
        v26.size.height = v8;
        if (CGRectEqualToRect(v25, v26)) {
          objc_msgSend((id)hintedBadgeRect_rect, "addHintedRect:forSize:", v15 - v12 * 0.35, 0.0, v12 * 0.35, v14 * 0.35, v15, v16);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v7 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  [(ISLayer *)v7 setName:@"layer"];
  CGFloat v8 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v8 setName:@"transparent background layer"];
  -[ISLayer setSize:](v8, "setSize:", width, height);
  [(ISContentLayer *)v8 setContent:0];
  CGFloat v9 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v9 setName:@"icon"];
  [(ISContentLayer *)v9 setContent:@"kISPrimaryResourceKey"];
  v10 = [(ISiOSAppOverhangingBadgeRecipe *)self hintedMainIconBadgeRect];
  objc_msgSend(v10, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v9, "setFrame:");

  double v11 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v9 size];
  -[ISLayer setSize:](v11, "setSize:");
  [(ISLayer *)v11 setName:@"mask layer"];
  double v12 = +[ISShapeCompositorResource continuousRoundedRectShape];
  [(ISContentLayer *)v11 setContent:v12];

  [(ISLayer *)v9 setMask:v11];
  [(ISLayer *)v8 addSublayer:v9];
  double v13 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v13 setName:@"badge layer"];
  double v14 = [(ISiOSAppOverhangingBadgeRecipe *)self hintedBadgeRect];
  objc_msgSend(v14, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v13, "setFrame:");

  [(ISContentLayer *)v13 setContent:@"kISBadgeResourceKey"];
  [(ISLayer *)v8 addSublayer:v13];

  [(ISLayer *)v7 addSublayer:v8];
  return v7;
}

@end