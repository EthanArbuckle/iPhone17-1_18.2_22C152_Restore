@interface CAMSmartStylePreviewView
- (BOOL)_hasUpdatedZoomForComposition;
- (CAMSmartStylePreviewView)initWithFrame:(CGRect)a3;
- (CAMSmartStyleSettingsResourceLoadResult)resourceLoadResult;
- (CEKSmartStyle)style;
- (NSString)logIdentifier;
- (NUComposition)_composition;
- (NUMediaView)_mediaView;
- (PEAsset)_asset;
- (PICompositionController)_compositionController;
- (void)_addConstraints;
- (void)_setComposition:(id)a3;
- (void)_updateMediaViewZoomIfNecessary;
- (void)_updatePreviewAdjustments;
- (void)mediaViewDidFinishRendering:(id)a3 withStatistics:(id)a4;
- (void)setLogIdentifier:(id)a3;
- (void)setResourceLoadResult:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation CAMSmartStylePreviewView

- (CAMSmartStylePreviewView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMSmartStylePreviewView;
  v3 = -[CAMSmartStylePreviewView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NUMediaView *)objc_alloc_init(MEMORY[0x263F58708]);
    mediaView = v3->__mediaView;
    v3->__mediaView = v4;

    [(NUMediaView *)v3->__mediaView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NUMediaView *)v3->__mediaView setUserInteractionEnabled:0];
    [(NUMediaView *)v3->__mediaView setClipsToBounds:1];
    [(NUMediaView *)v3->__mediaView setDelegate:v3];
    [(CAMSmartStylePreviewView *)v3 addSubview:v3->__mediaView];
    [(CAMSmartStylePreviewView *)v3 _addConstraints];
  }
  return v3;
}

- (void)setLogIdentifier:(id)a3
{
  id v5 = a3;
  p_logIdentifier = (id *)&self->_logIdentifier;
  uint64_t v7 = (uint64_t)*p_logIdentifier;
  if (*p_logIdentifier != v5)
  {
    id v8 = v5;
    uint64_t v7 = [(id)v7 isEqualToString:v5];
    id v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong(p_logIdentifier, a3);
      id v5 = v8;
    }
  }
  MEMORY[0x270F9A758](v7, v5);
}

- (void)setResourceLoadResult:(id)a3
{
  v9 = (CAMSmartStyleSettingsResourceLoadResult *)a3;
  if (self->_resourceLoadResult != v9)
  {
    objc_storeStrong((id *)&self->_resourceLoadResult, a3);
    id v5 = [(CAMSmartStyleSettingsResourceLoadResult *)v9 resourceLoadResult];
    v6 = [v5 compositionController];
    uint64_t v7 = (PICompositionController *)[v6 copy];
    compositionController = self->__compositionController;
    self->__compositionController = v7;

    [(CAMSmartStylePreviewView *)self _updatePreviewAdjustments];
  }
}

- (PEAsset)_asset
{
  v2 = [(CAMSmartStylePreviewView *)self resourceLoadResult];
  v3 = [v2 resourceLoadResult];
  v4 = [v3 asset];

  return (PEAsset *)v4;
}

- (void)setStyle:(id)a3
{
  id v5 = a3;
  uint64_t style = (uint64_t)self->_style;
  if ((id)style != v5)
  {
    id v7 = v5;
    uint64_t style = [(id)style isEqualToSmartStyle:v5];
    id v5 = v7;
    if ((style & 1) == 0)
    {
      objc_storeStrong((id *)&self->_style, a3);
      uint64_t style = [(CAMSmartStylePreviewView *)self _updatePreviewAdjustments];
      id v5 = v7;
    }
  }
  MEMORY[0x270F9A758](style, v5);
}

- (void)mediaViewDidFinishRendering:(id)a3 withStatistics:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (self->__mediaView == a3)
  {
    id v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(CAMSmartStylePreviewView *)self logIdentifier];
      v9 = [(CAMSmartStylePreviewView *)self resourceLoadResult];
      v10 = [v9 logIdentifier];
      [v6 totalDuration];
      uint64_t v12 = v11;
      [v6 duration];
      uint64_t v14 = v13;
      [v6 latency];
      int v16 = 138544386;
      v17 = v8;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@: didFinishRendering totalDuration=%.3f (duration=%.3f latency=%.3f)", (uint8_t *)&v16, 0x34u);
    }
    [(CAMSmartStylePreviewView *)self _updateMediaViewZoomIfNecessary];
  }
}

- (void)_addConstraints
{
  v17[4] = *MEMORY[0x263EF8340];
  uint64_t v13 = (void *)MEMORY[0x263F08938];
  int v16 = [(NUMediaView *)self->__mediaView topAnchor];
  uint64_t v15 = [(CAMSmartStylePreviewView *)self topAnchor];
  uint64_t v14 = [v16 constraintEqualToAnchor:v15];
  v17[0] = v14;
  v3 = [(NUMediaView *)self->__mediaView bottomAnchor];
  v4 = [(CAMSmartStylePreviewView *)self bottomAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v17[1] = v5;
  id v6 = [(NUMediaView *)self->__mediaView leadingAnchor];
  id v7 = [(CAMSmartStylePreviewView *)self leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];
  v17[2] = v8;
  v9 = [(NUMediaView *)self->__mediaView trailingAnchor];
  v10 = [(CAMSmartStylePreviewView *)self trailingAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v17[3] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  [v13 activateConstraints:v12];
}

- (void)_updatePreviewAdjustments
{
  uint64_t v3 = [(CAMSmartStylePreviewView *)self _compositionController];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(CAMSmartStylePreviewView *)self style];

    if (v5)
    {
      id v6 = [(CAMSmartStylePreviewView *)self style];
      id v7 = [(CAMSmartStylePreviewView *)self _compositionController];
      id v8 = [(CAMSmartStylePreviewView *)self _asset];
      id v9 = +[CAMSmartStyleSettingsRenderUtilities compositionForStyle:v6 compositionController:v7 originalAsset:v8 aspectRatio:1.0];

      [(CAMSmartStylePreviewView *)self _setComposition:v9];
    }
  }
}

- (void)_setComposition:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (NUComposition *)a3;
  if (self->__composition != v5)
  {
    id v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(CAMSmartStylePreviewView *)self logIdentifier];
      id v8 = [(CAMSmartStylePreviewView *)self style];
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2114;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: updating composition for %{public}@", (uint8_t *)&v9, 0x16u);
    }
    objc_storeStrong((id *)&self->__composition, a3);
    self->__hasUpdatedZoomForComposition = 0;
    [(NUMediaView *)self->__mediaView setComposition:v5];
    [(CAMSmartStylePreviewView *)self _updateMediaViewZoomIfNecessary];
  }
}

- (void)_updateMediaViewZoomIfNecessary
{
  mediaView = self->__mediaView;
  if (mediaView)
  {
    if (!self->__hasUpdatedZoomForComposition)
    {
      [(NUMediaView *)mediaView setZoomScaleToFit];
      [(NUMediaView *)self->__mediaView zoomScale];
      double v5 = v4;
      [(NUMediaView *)self->__mediaView imageFrame];
      CGFloat x = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
      double v10 = CGRectGetHeight(v21);
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      double v11 = CGRectGetWidth(v22);
      if (v10 != 0.0)
      {
        double v12 = v11;
        if (v11 != 0.0)
        {
          double v13 = v10 / v11;
          +[CAMSmartStylePreviewViewController desiredCarouselRatio];
          if (v13 != v14)
          {
            double v15 = v14;
            [(NUMediaView *)self->__mediaView frame];
            if (v13 <= v15) {
              double v20 = CGRectGetHeight(*(CGRect *)&v16) / v10;
            }
            else {
              double v20 = CGRectGetWidth(*(CGRect *)&v16) / v12;
            }
            [(NUMediaView *)self->__mediaView setZoomScale:v5 * v20];
          }
          self->__hasUpdatedZoomForComposition = 1;
        }
      }
    }
  }
}

- (CAMSmartStyleSettingsResourceLoadResult)resourceLoadResult
{
  return self->_resourceLoadResult;
}

- (CEKSmartStyle)style
{
  return self->_style;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (NUMediaView)_mediaView
{
  return self->__mediaView;
}

- (NUComposition)_composition
{
  return self->__composition;
}

- (BOOL)_hasUpdatedZoomForComposition
{
  return self->__hasUpdatedZoomForComposition;
}

- (PICompositionController)_compositionController
{
  return self->__compositionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__compositionController, 0);
  objc_storeStrong((id *)&self->__composition, 0);
  objc_storeStrong((id *)&self->__mediaView, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_resourceLoadResult, 0);
}

@end