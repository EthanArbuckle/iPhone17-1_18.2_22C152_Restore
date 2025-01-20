@interface HKAxisConfiguration
- (BOOL)axisAnnotationsExcludeInterstitialAxisLabels;
- (BOOL)overrideNoTopBaseline;
- (HKAxisConfiguration)init;
- (HKAxisLabelDataSource)labelDataSource;
- (HKAxisStyle)preferredStyle;
- (HKCoordinateTransform)transform;
- (HKZoomScale)zoomScaleEngine;
- (NSNumber)horizontalAxisLabelSpacePadding;
- (NSNumber)maxLabelWidth;
- (int64_t)maxLabels;
- (int64_t)minLabels;
- (void)applyOverridesFromAxisConfiguration:(id)a3;
- (void)setAxisAnnotationsExcludeInterstitialAxisLabels:(BOOL)a3;
- (void)setHorizontalAxisLabelSpacePadding:(id)a3;
- (void)setLabelDataSource:(id)a3;
- (void)setMaxLabelWidth:(id)a3;
- (void)setMaxLabels:(int64_t)a3;
- (void)setMinLabels:(int64_t)a3;
- (void)setOverrideNoTopBaseline:(BOOL)a3;
- (void)setPreferredStyle:(id)a3;
- (void)setTransform:(id)a3;
- (void)setZoomScaleEngine:(id)a3;
@end

@implementation HKAxisConfiguration

- (void)setPreferredStyle:(id)a3
{
}

- (HKAxisConfiguration)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKAxisConfiguration;
  v2 = [(HKAxisConfiguration *)&v10 init];
  v3 = v2;
  if (v2)
  {
    preferredStyle = v2->_preferredStyle;
    v2->_preferredStyle = 0;

    *(_OWORD *)&v3->_maxLabels = xmmword_1E0F060B0;
    maxLabelWidth = v3->_maxLabelWidth;
    v3->_maxLabelWidth = 0;

    v3->_horizontalAxisLabelSpacePadding = (NSNumber *)&unk_1F3C22BB0;
    uint64_t v6 = objc_opt_new();
    transform = v3->_transform;
    v3->_transform = (HKCoordinateTransform *)v6;

    zoomScaleEngine = v3->_zoomScaleEngine;
    v3->_zoomScaleEngine = 0;

    objc_storeWeak((id *)&v3->_labelDataSource, 0);
    *(_WORD *)&v3->_overrideNoTopBaseline = 0;
  }
  return v3;
}

- (HKZoomScale)zoomScaleEngine
{
  return self->_zoomScaleEngine;
}

- (HKCoordinateTransform)transform
{
  return self->_transform;
}

- (void)setZoomScaleEngine:(id)a3
{
}

- (HKAxisStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (BOOL)overrideNoTopBaseline
{
  return self->_overrideNoTopBaseline;
}

- (int64_t)minLabels
{
  return self->_minLabels;
}

- (int64_t)maxLabels
{
  return self->_maxLabels;
}

- (NSNumber)maxLabelWidth
{
  return self->_maxLabelWidth;
}

- (HKAxisLabelDataSource)labelDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelDataSource);
  return (HKAxisLabelDataSource *)WeakRetained;
}

- (NSNumber)horizontalAxisLabelSpacePadding
{
  return self->_horizontalAxisLabelSpacePadding;
}

- (BOOL)axisAnnotationsExcludeInterstitialAxisLabels
{
  return self->_axisAnnotationsExcludeInterstitialAxisLabels;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_labelDataSource);
  objc_storeStrong((id *)&self->_zoomScaleEngine, 0);
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_maxLabelWidth, 0);
  objc_storeStrong((id *)&self->_preferredStyle, 0);
}

- (void)applyOverridesFromAxisConfiguration:(id)a3
{
  id v33 = a3;
  v4 = objc_alloc_init(HKAxisConfiguration);
  v5 = [v33 preferredStyle];
  uint64_t v6 = [(HKAxisConfiguration *)v4 preferredStyle];

  if (v5 != v6)
  {
    v7 = [v33 preferredStyle];
    [(HKAxisConfiguration *)self setPreferredStyle:v7];
  }
  uint64_t v8 = [v33 maxLabels];
  if (v8 != [(HKAxisConfiguration *)v4 maxLabels]) {
    -[HKAxisConfiguration setMaxLabels:](self, "setMaxLabels:", [v33 maxLabels]);
  }
  uint64_t v9 = [v33 minLabels];
  if (v9 != [(HKAxisConfiguration *)v4 minLabels]) {
    -[HKAxisConfiguration setMinLabels:](self, "setMinLabels:", [v33 minLabels]);
  }
  objc_super v10 = [v33 maxLabelWidth];
  uint64_t v11 = [(HKAxisConfiguration *)v4 maxLabelWidth];
  if (v10 == (void *)v11)
  {

LABEL_14:
    goto LABEL_15;
  }
  v12 = (void *)v11;
  uint64_t v13 = [(HKAxisConfiguration *)v4 maxLabelWidth];
  if (!v13)
  {

    goto LABEL_13;
  }
  v14 = (void *)v13;
  v15 = [v33 maxLabelWidth];
  v16 = [(HKAxisConfiguration *)v4 maxLabelWidth];
  char v17 = [v15 isEqual:v16];

  if ((v17 & 1) == 0)
  {
LABEL_13:
    objc_super v10 = [v33 maxLabelWidth];
    [(HKAxisConfiguration *)self setMaxLabelWidth:v10];
    goto LABEL_14;
  }
LABEL_15:
  v18 = [v33 horizontalAxisLabelSpacePadding];
  v19 = [(HKAxisConfiguration *)v4 horizontalAxisLabelSpacePadding];

  if (v18 != v19)
  {
    v20 = [v33 horizontalAxisLabelSpacePadding];
    [(HKAxisConfiguration *)self setHorizontalAxisLabelSpacePadding:v20];
  }
  v21 = [v33 transform];
  v22 = [(HKAxisConfiguration *)v4 transform];
  char v23 = [v21 isEqual:v22];

  if ((v23 & 1) == 0)
  {
    v24 = [v33 transform];
    [(HKAxisConfiguration *)self setTransform:v24];
  }
  v25 = [v33 zoomScaleEngine];
  v26 = [(HKAxisConfiguration *)v4 zoomScaleEngine];

  if (v25 != v26)
  {
    v27 = [v33 zoomScaleEngine];
    [(HKAxisConfiguration *)self setZoomScaleEngine:v27];
  }
  v28 = [v33 labelDataSource];
  v29 = [(HKAxisConfiguration *)v4 labelDataSource];

  if (v28 != v29)
  {
    v30 = [v33 labelDataSource];
    [(HKAxisConfiguration *)self setLabelDataSource:v30];
  }
  int v31 = [v33 overrideNoTopBaseline];
  if (v31 != [(HKAxisConfiguration *)v4 overrideNoTopBaseline]) {
    -[HKAxisConfiguration setOverrideNoTopBaseline:](self, "setOverrideNoTopBaseline:", [v33 overrideNoTopBaseline]);
  }
  int v32 = [v33 axisAnnotationsExcludeInterstitialAxisLabels];
  if (v32 != -[HKAxisConfiguration axisAnnotationsExcludeInterstitialAxisLabels](v4, "axisAnnotationsExcludeInterstitialAxisLabels"))-[HKAxisConfiguration setAxisAnnotationsExcludeInterstitialAxisLabels:](self, "setAxisAnnotationsExcludeInterstitialAxisLabels:", [v33 axisAnnotationsExcludeInterstitialAxisLabels]); {
}
  }

- (void)setMaxLabels:(int64_t)a3
{
  self->_maxLabels = a3;
}

- (void)setMinLabels:(int64_t)a3
{
  self->_minLabels = a3;
}

- (void)setHorizontalAxisLabelSpacePadding:(id)a3
{
  self->_horizontalAxisLabelSpacePadding = (NSNumber *)a3;
}

- (void)setMaxLabelWidth:(id)a3
{
}

- (void)setTransform:(id)a3
{
}

- (void)setLabelDataSource:(id)a3
{
}

- (void)setOverrideNoTopBaseline:(BOOL)a3
{
  self->_overrideNoTopBaseline = a3;
}

- (void)setAxisAnnotationsExcludeInterstitialAxisLabels:(BOOL)a3
{
  self->_axisAnnotationsExcludeInterstitialAxisLabels = a3;
}

@end