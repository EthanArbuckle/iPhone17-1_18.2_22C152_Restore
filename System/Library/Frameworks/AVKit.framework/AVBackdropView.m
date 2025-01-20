@interface AVBackdropView
+ (id)secondaryGlyphTintColor;
+ (id)secondaryMaterialOverlayView;
+ (void)applyBaseTrackTintToView:(id)a3;
+ (void)applyCompletedTrackTintToView:(id)a3;
+ (void)applyGlyphTintColor:(id)a3 toView:(id)a4;
+ (void)applyLoadedTrackTintToView:(id)a3;
+ (void)applyPrimaryGlyphTintToView:(id)a3;
+ (void)applySecondaryGlyphTintToView:(id)a3;
+ (void)configureSlider:(id)a3 thumbView:(id)a4 loadedTrackView:(id)a5;
+ (void)configureSlider:(id)a3 thumbView:(id)a4 loadedTrackView:(id)a5 withTimelineMarkers:(id)a6;
+ (void)configureView:(id)a3 forTintEffectWithColor:(id)a4 filterType:(id)a5;
+ (void)configureView:(id)a3 withBackgroundFillOfColor:(id)a4 opacity:(double)a5 filter:(id)a6;
+ (void)removeAllFiltersFromView:(id)a3;
@end

@implementation AVBackdropView

+ (id)secondaryGlyphTintColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.55];
}

+ (id)secondaryMaterialOverlayView
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
  [v2 setUserInteractionEnabled:0];
  v3 = (void *)MEMORY[0x1E4FB1EF8];
  v4 = [MEMORY[0x1E4FB1618] blackColor];
  v5 = [v3 effectCompositingColor:v4 withMode:23 alpha:0.06];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v2 setBackgroundEffects:v6];

  return v2;
}

+ (void)configureView:(id)a3 withBackgroundFillOfColor:(id)a4 opacity:(double)a5 filter:(id)a6
{
  v9 = (void *)MEMORY[0x1E4FB2400];
  id v10 = a3;
  id v13 = [v9 layerWithFillColor:a4 opacity:a6 filterType:a5];
  v11 = [MEMORY[0x1E4FB23F8] configWithContentConfig:v13];
  v12 = [v11 contentConfig];
  [v12 configureLayerView:v10];
}

+ (void)configureView:(id)a3 forTintEffectWithColor:(id)a4 filterType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v8;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 _setTextColorFollowsTintColor:1];
    [v8 setTintColor:v9];
    id v13 = [v8 layer];
    v14 = [MEMORY[0x1E4F39BC0] filterWithType:v10];
    [v13 setCompositingFilter:v14];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v12 titleForState:0], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v16 = (void *)v15,
          [v12 imageForState:0],
          v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          !v17))
    {
      id v18 = v9;
      id v19 = v10;
      v20 = [v12 titleForState:0];

      if (v20)
      {
        double v29 = 0.0;
        [v18 getRed:0 green:0 blue:0 alpha:&v29];
        v21 = (void *)*MEMORY[0x1E4F3A2B8];
        if (v29 < 1.0) {
          v21 = v19;
        }
        id v22 = v21;

        v23 = [v12 titleLabel];
        [a1 configureView:v23 forTintEffectWithColor:v18 filterType:v19];

        id v18 = 0;
        id v19 = v22;
      }
      else
      {
        v24 = [v12 titleLabel];

        if (v24)
        {
          v25 = [v12 titleLabel];
          [a1 configureView:v25 forTintEffectWithColor:0 filterType:*MEMORY[0x1E4F3A2B8]];
        }
      }
      v26 = [MEMORY[0x1E4FB2408] layerWithTintColor:v18 filterType:v19];
      v27 = [MEMORY[0x1E4FB23F8] configWithContentConfig:v26];
      v28 = [v27 contentConfig];
      [v28 configureLayerView:v8];
    }
  }
}

+ (void)applyLoadedTrackTintToView:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v5 = [v3 colorWithWhite:1.0 alpha:0.08];
  +[AVBackdropView configureView:v4 forTintEffectWithColor:v5 filterType:*MEMORY[0x1E4F3A2E8]];
}

+ (void)applyCompletedTrackTintToView:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v5 = [v3 colorWithWhite:1.0 alpha:0.35];
  +[AVBackdropView configureView:v4 forTintEffectWithColor:v5 filterType:*MEMORY[0x1E4F3A2E8]];
}

+ (void)applyBaseTrackTintToView:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  id v5 = [v3 colorWithWhite:1.0 alpha:0.1];
  +[AVBackdropView configureView:v4 forTintEffectWithColor:v5 filterType:*MEMORY[0x1E4F3A2E8]];
}

+ (void)configureSlider:(id)a3 thumbView:(id)a4 loadedTrackView:(id)a5
{
}

+ (void)configureSlider:(id)a3 thumbView:(id)a4 loadedTrackView:(id)a5 withTimelineMarkers:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  v11 = [v8 layer];
  [v11 setAllowsGroupBlending:0];

  id v12 = [v8 _minTrackView];
  id v13 = [v12 layer];
  uint64_t v14 = *MEMORY[0x1E4F3A2E8];
  [v13 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

  uint64_t v15 = [v8 _minTrackView];
  [v15 setAlpha:0.35];

  v16 = [v8 _maxTrackView];
  v17 = [v16 layer];
  [v17 setCompositingFilter:v14];

  id v18 = [v8 _maxTrackView];
  [v18 setAlpha:0.1];

  [v9 setAlpha:0.08];
  double v29 = v9;
  id v19 = [v9 layer];
  [v19 setCompositingFilter:v14];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v25 setAlpha:1.0];
        v26 = [MEMORY[0x1E4FB1618] whiteColor];
        v27 = [v26 colorWithAlphaComponent:0.5];
        [v25 setBackgroundColor:v27];

        v28 = [v25 layer];
        [v28 setCompositingFilter:v14];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }
}

+ (void)applyGlyphTintColor:(id)a3 toView:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F3A2E8];
  if (!a3) {
    id v4 = (void *)MEMORY[0x1E4F3A2B8];
  }
  [a1 configureView:a4 forTintEffectWithColor:a3 filterType:*v4];
}

+ (void)applySecondaryGlyphTintToView:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() secondaryGlyphTintColor];
  [a1 configureView:v4 forTintEffectWithColor:v5 filterType:*MEMORY[0x1E4F3A2E8]];
}

+ (void)applyPrimaryGlyphTintToView:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  id v6 = [v4 colorWithWhite:1.0 alpha:0.75];
  [a1 configureView:v5 forTintEffectWithColor:v6 filterType:*MEMORY[0x1E4F3A2E8]];
}

+ (void)removeAllFiltersFromView:(id)a3
{
  id v3 = [a3 layer];
  [v3 setCompositingFilter:0];
}

@end