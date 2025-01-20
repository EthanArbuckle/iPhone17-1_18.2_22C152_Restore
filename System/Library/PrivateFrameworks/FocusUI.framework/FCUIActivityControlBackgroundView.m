@interface FCUIActivityControlBackgroundView
@end

@implementation FCUIActivityControlBackgroundView

uint64_t __72___FCUIActivityControlBackgroundView__configureHighlightViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F82E00]);
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 416);
  *(void *)(v4 + 416) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 416);
  if (*(void *)(v6 + 408)) {
    [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  else {
  v8 = [MEMORY[0x263F825C8] labelColor];
  }
  [v7 setBackgroundColor:v8];

  v9 = [*(id *)(a1 + 32) layer];
  v10 = [v9 cornerCurve];
  v11 = (void *)*MEMORY[0x263F15A20];

  v12 = *(void **)(a1 + 32);
  v13 = (void *)v12[52];
  if (v10 == v11)
  {
    [v12 _continuousCornerRadius];
    objc_msgSend(v13, "_setContinuousCornerRadius:");
  }
  else
  {
    [v12 _cornerRadius];
    objc_msgSend(v13, "_setCornerRadius:");
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (*(void *)(v14 + 408) == 2)
  {
    v15 = [*(id *)(v14 + 416) layer];
    [v15 setShadowPathIsBounds:1];
    LODWORD(v16) = 1036831949;
    [v15 setShadowOpacity:v16];
    objc_msgSend(v15, "setShadowOffset:", 0.0, 4.0);
    [v15 setShadowRadius:15.0];

    uint64_t v14 = *(void *)(a1 + 32);
  }
  [*(id *)(v14 + 416) setAlpha:0.0];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 416)];
  v17 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v17 setAutoresizingMask:18];
}

@end