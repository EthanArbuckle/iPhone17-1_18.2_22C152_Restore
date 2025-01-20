@interface CDRichComplicationCurvedMeteredView
- (NSArray)meterLayers;
- (double)rotationAngleAtProgress:(float)a3;
- (id)_shapeStrokeColor;
- (id)customizeMeterLayerBlock;
- (void)_setupShapeLayer:(id)a3;
- (void)_updateGradient;
- (void)colorMetersWithProgress:(double)a3;
- (void)setMeterLayers:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation CDRichComplicationCurvedMeteredView

- (id)customizeMeterLayerBlock
{
  id v3 = [MEMORY[0x263EFD180] currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_2);
    if (v6 == v3)
    {
      uint64_t v7 = [v3 version];
      uint64_t v8 = _LayoutConstants___previousCLKDeviceVersion_2;

      if (v7 == v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_2, v3);
  _LayoutConstants___previousCLKDeviceVersion_2 = [v3 version];

  ___LayoutConstants_block_invoke_2(v10, v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_2);
  uint64_t v11 = _LayoutConstants___constants_0_1;
  uint64_t v12 = _LayoutConstants___constants_1_1;
  uint64_t v13 = _LayoutConstants___constants_2;
  uint64_t v14 = _LayoutConstants___constants_3;

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CDRichComplicationCurvedMeteredView_customizeMeterLayerBlock__block_invoke;
  aBlock[3] = &unk_2644A5208;
  aBlock[4] = self;
  aBlock[5] = v11;
  aBlock[6] = v12;
  aBlock[7] = v13;
  aBlock[8] = v14;
  v15 = _Block_copy(aBlock);
  v16 = _Block_copy(v15);

  return v16;
}

void __63__CDRichComplicationCurvedMeteredView_customizeMeterLayerBlock__block_invoke(uint64_t a1, void *a2, double a3, uint64_t a4, int a5)
{
  uint64_t v7 = *(void **)(a1 + 32);
  float v8 = a3;
  id v9 = a2;
  *(float *)&double v10 = v8;
  [v7 pointAtProgress:v10];
  double v13 = v11;
  double v14 = v12;
  double v15 = *(double *)(a1 + 40);
  double v16 = *(double *)(a1 + 48);
  if (a5) {
    double v16 = v16 + *(double *)(a1 + 56);
  }
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", v11, v12, *(double *)(a1 + 40), v16, *(double *)(a1 + 64));
  id v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", objc_msgSend(v17, "CGPath"));
  objc_msgSend(v9, "setBounds:", v13, v14, v15, v16);
  objc_msgSend(v9, "setPosition:", v13, v14);
  *(float *)&double v18 = v8;
  [*(id *)(a1 + 32) rotationAngleAtProgress:v18];
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformRotate(&v23, &v22, v20);
  CGAffineTransform v21 = v23;
  [v9 setAffineTransform:&v21];
}

- (void)_setupShapeLayer:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationCurvedMeteredView *)self customizeMeterLayerBlock];
  id v6 = CDGenerateMeterLayersOnLayer(v4, v5);

  [(CDRichComplicationCurvedMeteredView *)self setMeterLayers:v6];
  [(CDRichComplicationShapeView *)self progress];
  -[CDRichComplicationCurvedMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");
}

- (id)_shapeStrokeColor
{
  return 0;
}

- (void)setProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDRichComplicationCurvedMeteredView;
  -[CDRichComplicationShapeView setProgress:](&v5, sel_setProgress_);
  [(CDRichComplicationCurvedMeteredView *)self colorMetersWithProgress:a3];
}

- (void)_updateGradient
{
  v3.receiver = self;
  v3.super_class = (Class)CDRichComplicationCurvedMeteredView;
  [(CDRichComplicationShapeView *)&v3 _updateGradient];
  [(CDRichComplicationShapeView *)self progress];
  -[CDRichComplicationCurvedMeteredView colorMetersWithProgress:](self, "colorMetersWithProgress:");
}

- (void)colorMetersWithProgress:(double)a3
{
  objc_super v5 = [(CDRichComplicationCurvedMeteredView *)self meterLayers];

  if (v5)
  {
    id v7 = [(CDRichComplicationCurvedMeteredView *)self meterLayers];
    id v6 = [(CDRichComplicationShapeView *)self gradientColors];
    CDColorizeMeterProgress(v7, v6, 0, a3);
  }
}

- (double)rotationAngleAtProgress:(float)a3
{
  -[CDRichComplicationCurveView _angleAtProgress:](self, "_angleAtProgress:");
  return v3 + 1.57079633;
}

- (NSArray)meterLayers
{
  return self->_meterLayers;
}

- (void)setMeterLayers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end