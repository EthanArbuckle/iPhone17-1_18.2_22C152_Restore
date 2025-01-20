@interface HUCCFillerMosaicCell
- (CALayer)fakeCellLayer;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setFakeCellLayer:(id)a3;
@end

@implementation HUCCFillerMosaicCell

- (void)layoutSublayersOfLayer:(id)a3
{
  v4 = [(HUCCFillerMosaicCell *)self fakeCellLayer];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F39BE8] layer];
    [(HUCCFillerMosaicCell *)self setFakeCellLayer:v5];

    id v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(HUCCFillerMosaicCell *)self fakeCellLayer];
    [v8 setBackgroundColor:v7];

    v9 = [(HUCCFillerMosaicCell *)self fakeCellLayer];
    LODWORD(v10) = 1025758986;
    [v9 setOpacity:v10];

    CCUICompactModuleContinuousCornerRadius();
    double v12 = v11;
    v13 = [(HUCCFillerMosaicCell *)self fakeCellLayer];
    [v13 setCornerRadius:v12];

    v14 = [(HUCCFillerMosaicCell *)self layer];
    v15 = [(HUCCFillerMosaicCell *)self fakeCellLayer];
    [v14 addSublayer:v15];
  }
  id v25 = [(HUCCFillerMosaicCell *)self layer];
  [v25 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(HUCCFillerMosaicCell *)self fakeCellLayer];
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
}

- (CALayer)fakeCellLayer
{
  return self->_fakeCellLayer;
}

- (void)setFakeCellLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end