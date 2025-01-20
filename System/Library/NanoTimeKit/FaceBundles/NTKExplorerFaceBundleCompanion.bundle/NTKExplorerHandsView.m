@interface NTKExplorerHandsView
- (CGPoint)secondHandCenter;
- (UIColor)secondHandDotColor;
- (id)initForDevice:(id)a3;
- (id)secondHandConfiguration;
- (void)applyColorPalette:(id)a3;
- (void)layoutSubviews;
- (void)setInlayColor:(id)a3;
- (void)setSecondHandCenter:(CGPoint)a3;
- (void)setSecondHandDotColor:(id)a3;
@end

@implementation NTKExplorerHandsView

- (id)initForDevice:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKExplorerHandsView;
  id v3 = [(NTKExplorerHandsView *)&v9 initForDevice:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 secondHandView];
    [v4 insertSubview:v5 atIndex:0];

    v6 = [v4 secondHandView];
    v7 = +[UIColor whiteColor];
    [v6 setHandDotColor:v7];
  }
  return v4;
}

- (id)secondHandConfiguration
{
  id v3 = [(NTKExplorerHandsView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16490);
  id WeakRetained = objc_loadWeakRetained(&qword_16498);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&qword_16498);
    if (v6 == v3)
    {
      id v7 = [v3 version];
      uint64_t v8 = qword_164A0;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_16498, v3);
  qword_164A0 = (uint64_t)[v3 version];

  sub_6E68(v10, (uint64_t)v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16490);
  double v11 = *(double *)&qword_16470;
  double v12 = *(double *)&qword_16478;
  double v13 = *(double *)&qword_16480;
  double v14 = *(double *)&qword_16488;

  v15 = [(NTKExplorerHandsView *)self device];
  v16 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v15];

  [v16 setHandWidth:v11];
  [v16 setHandLength:v12];
  [v16 setTailLength:v13];
  [v16 setPegStrokeWidth:v14];
  [v16 setPegRadius:0.0];
  [v16 setRoundedSecondHand:1];

  return v16;
}

- (void)setInlayColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKExplorerHandsView;
  id v4 = a3;
  [(NTKExplorerHandsView *)&v6 setInlayColor:v4];
  v5 = [(NTKExplorerHandsView *)self secondHandView];
  [v5 setHandDotColor:v4];
}

- (void)setSecondHandDotColor:(id)a3
{
  objc_super v6 = (UIColor *)a3;
  if (self->_secondHandDotColor != v6)
  {
    objc_storeStrong((id *)&self->_secondHandDotColor, a3);
    v5 = [(NTKExplorerHandsView *)self secondHandView];
    [v5 setHandDotColor:v6];
  }
}

- (void)setSecondHandCenter:(CGPoint)a3
{
  self->_secondHandCenter = a3;
  [(NTKExplorerHandsView *)self setNeedsLayout];
}

- (void)applyColorPalette:(id)a3
{
  id v4 = a3;
  v5 = [(NTKExplorerHandsView *)self minuteHandView];
  objc_super v6 = [v4 hands];
  [v5 setColor:v6];

  id v7 = [(NTKExplorerHandsView *)self hourHandView];
  uint64_t v8 = [v4 hands];
  [v7 setColor:v8];

  id v9 = [(NTKExplorerHandsView *)self hourHandView];
  uint64_t v10 = [v4 handsInlay];
  [v9 setInlayColor:v10];

  double v11 = [(NTKExplorerHandsView *)self minuteHandView];
  double v12 = [v4 handsInlay];
  [v11 setInlayColor:v12];

  double v13 = [(NTKExplorerHandsView *)self secondHandView];
  double v14 = [v4 secondHand];
  [v13 setColor:v14];

  id v15 = [v4 secondHandInlay];

  [(NTKExplorerHandsView *)self setSecondHandDotColor:v15];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKExplorerHandsView;
  [(NTKExplorerHandsView *)&v4 layoutSubviews];
  id v3 = [(NTKExplorerHandsView *)self secondHandView];
  objc_msgSend(v3, "setCenter:", self->_secondHandCenter.x, self->_secondHandCenter.y);
}

- (UIColor)secondHandDotColor
{
  return self->_secondHandDotColor;
}

- (CGPoint)secondHandCenter
{
  double x = self->_secondHandCenter.x;
  double y = self->_secondHandCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end