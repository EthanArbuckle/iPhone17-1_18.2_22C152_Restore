@interface HUCCFakeMosaicGridView
- (CGRect)contentBounds;
- (HUCCFakeMosaicGridView)initWithFrame:(CGRect)a3;
- (HUMosaicLayoutGeometry)mosaicLayoutGeometry;
- (HUProvidesMosaicFrames)frameDelegate;
- (NSMutableArray)fakeCellLayers;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setFakeCellLayers:(id)a3;
- (void)setFrameDelegate:(id)a3;
- (void)setMosaicLayoutGeometry:(id)a3;
@end

@implementation HUCCFakeMosaicGridView

- (HUCCFakeMosaicGridView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUCCFakeMosaicGridView;
  v3 = -[HUCCFakeMosaicGridView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    fakeCellLayers = v3->_fakeCellLayers;
    v3->_fakeCellLayers = (NSMutableArray *)v4;

    [(HUCCFakeMosaicGridView *)v3 setNeedsDisplayOnBoundsChange:1];
  }
  return v3;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(HUCCFakeMosaicGridView *)self contentBounds];
  v58.origin.x = v13;
  v58.origin.y = v14;
  v58.size.width = v15;
  v58.size.height = v16;
  v57.origin.x = v6;
  v57.origin.y = v8;
  v57.size.width = v10;
  v57.size.height = v12;
  if (CGRectEqualToRect(v57, v58)) {
    goto LABEL_23;
  }
  [v4 bounds];
  -[HUCCFakeMosaicGridView setContentBounds:](self, "setContentBounds:");
  v17 = [(HUCCFakeMosaicGridView *)self frameDelegate];

  if (v17)
  {
    v18 = [(HUCCFakeMosaicGridView *)self frameDelegate];
    v19 = [v18 currentMosaicFrames];

    if (v19)
    {
      v20 = v19;
      if ((unint64_t)[v19 count] > 1) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    v19 = 0;
  }
  v21 = [(HUCCFakeMosaicGridView *)self mosaicLayoutGeometry];
  [(HUCCFakeMosaicGridView *)self contentBounds];
  v20 = +[HUMosaicLayoutHelper fakeFramesForGeometry:inBounds:](HUMosaicLayoutHelper, "fakeFramesForGeometry:inBounds:", v21);

LABEL_8:
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v22 = [(HUCCFakeMosaicGridView *)self fakeCellLayers];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v51;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * v26++) removeFromSuperlayer];
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v24);
  }

  v27 = [(HUCCFakeMosaicGridView *)self fakeCellLayers];
  [v27 removeAllObjects];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v28 = v20;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v47;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * v32), "CGRectValue", (void)v46);
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        v41 = [MEMORY[0x1E4F39BE8] layer];
        id v42 = [MEMORY[0x1E4F428B8] systemWhiteColor];
        objc_msgSend(v41, "setBackgroundColor:", objc_msgSend(v42, "CGColor"));

        CCUICompactModuleContinuousCornerRadius();
        objc_msgSend(v41, "setCornerRadius:");
        LODWORD(v43) = 1025758986;
        [v41 setOpacity:v43];
        objc_msgSend(v41, "setFrame:", v34, v36, v38, v40);
        v44 = [(HUCCFakeMosaicGridView *)self layer];
        [v44 addSublayer:v41];

        v45 = [(HUCCFakeMosaicGridView *)self fakeCellLayers];
        [v45 addObject:v41];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v30);
  }

LABEL_23:
}

- (HUProvidesMosaicFrames)frameDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_frameDelegate);

  return (HUProvidesMosaicFrames *)WeakRetained;
}

- (void)setFrameDelegate:(id)a3
{
}

- (HUMosaicLayoutGeometry)mosaicLayoutGeometry
{
  return self->_mosaicLayoutGeometry;
}

- (void)setMosaicLayoutGeometry:(id)a3
{
}

- (NSMutableArray)fakeCellLayers
{
  return self->_fakeCellLayers;
}

- (void)setFakeCellLayers:(id)a3
{
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeCellLayers, 0);
  objc_storeStrong((id *)&self->_mosaicLayoutGeometry, 0);

  objc_destroyWeak((id *)&self->_frameDelegate);
}

@end