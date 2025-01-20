@interface CDRichComplicationCornerTextCustomView
- (CDRichComplicationCornerTextCustomView)initWithFontFallback:(int64_t)a3;
- (double)_outerViewDiameter;
- (id)_outerView;
- (void)layoutSubviews;
@end

@implementation CDRichComplicationCornerTextCustomView

- (CDRichComplicationCornerTextCustomView)initWithFontFallback:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerTextCustomView;
  v3 = [(CDRichComplicationCornerBaseTextView *)&v8 initWithFontFallback:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(CDRichComplicationCornerTextCustomView *)v3 _outerView];
    outerView = v4->_outerView;
    v4->_outerView = (UIView *)v5;

    [(CDRichComplicationCornerTextCustomView *)v4 addSubview:v4->_outerView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CDRichComplicationCornerTextCustomView;
  [(CDRichComplicationCornerBaseTextView *)&v27 layoutSubviews];
  v3 = [(CDRichComplicationView *)self device];
  +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:[(CDRichComplicationCornerView *)self cornerComplicationPosition] forDevice:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CDRichComplicationView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v14 = WeakRetained;
  id v15 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice);
  if (v15 != v12)
  {

LABEL_5:
    id v18 = objc_storeWeak(&_LayoutConstants___cachedDevice, v12);
    _LayoutConstants___previousCLKDeviceVersion = [v12 version];

    ___LayoutConstants_block_invoke(v19, (uint64_t)v12);
    goto LABEL_6;
  }
  uint64_t v16 = [v12 version];
  uint64_t v17 = _LayoutConstants___previousCLKDeviceVersion;

  if (v16 != v17) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock);
  double v20 = *(double *)&_LayoutConstants___constants_0;
  double v21 = *(double *)&_LayoutConstants___constants_1;

  outerView = self->_outerView;
  long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v26[0] = *MEMORY[0x263F000D0];
  v26[1] = v23;
  v26[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UIView *)outerView setTransform:v26];
  -[UIView setFrame:](self->_outerView, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v9, v11);
  v24 = self->_outerView;
  [(CDRichComplicationCornerView *)self outerComponentRotationInDegree];
  -[CDRichComplicationCornerView _layoutView:origin:editingTranslation:editingRotationInDegree:](self, "_layoutView:origin:editingTranslation:editingRotationInDegree:", v24, v5, v7, v20, v21, v25);
}

- (double)_outerViewDiameter
{
  v3 = [(CDRichComplicationView *)self device];
  +[CDRichComplicationCornerUtilities cornerGaugeCustomViewRectWithPosition:[(CDRichComplicationCornerView *)self cornerComplicationPosition] forDevice:v3];
  double v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

- (id)_outerView
{
  return 0;
}

@end