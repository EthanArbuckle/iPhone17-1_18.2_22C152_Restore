@interface CDRichComplicationCornerBaseCircularView
- (CDRichComplicationCornerBaseCircularView)initWithFontFallback:(int64_t)a3;
- (id)_circularView;
- (void)layoutSubviews;
@end

@implementation CDRichComplicationCornerBaseCircularView

- (CDRichComplicationCornerBaseCircularView)initWithFontFallback:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CDRichComplicationCornerBaseCircularView;
  v3 = [(CDRichComplicationCornerView *)&v8 initWithFontFallback:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(CDRichComplicationCornerBaseCircularView *)v3 _circularView];
    circularView = v4->_circularView;
    v4->_circularView = (UIView *)v5;

    [(CDRichComplicationCornerBaseCircularView *)v4 addSubview:v4->_circularView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CDRichComplicationCornerBaseCircularView;
  [(CDRichComplicationCornerBaseCircularView *)&v23 layoutSubviews];
  v3 = [(CDRichComplicationView *)self device];
  double v4 = _LayoutConstants_4(v3);
  double v6 = v5;
  double v8 = v7;

  v9 = [(CDRichComplicationView *)self device];
  double v10 = CDRichComplicationCornerBaseCircularViewRect(v9, [(CDRichComplicationCornerView *)self cornerComplicationPosition]);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  circularView = self->_circularView;
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v22[0] = *MEMORY[0x263F000D0];
  v22[1] = v18;
  v22[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UIView *)circularView setTransform:v22];
  -[UIView setFrame:](self->_circularView, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v14, v16);
  v19 = [(UIView *)self->_circularView layer];
  [v19 setCornerRadius:v4 * 0.5];

  v20 = self->_circularView;
  [(CDRichComplicationCornerView *)self outerComponentRotationInDegree];
  -[CDRichComplicationCornerView _layoutView:origin:editingTranslation:editingRotationInDegree:](self, "_layoutView:origin:editingTranslation:editingRotationInDegree:", v20, v10, v12, v6, v8, v21);
}

- (void).cxx_destruct
{
}

- (id)_circularView
{
  return 0;
}

@end