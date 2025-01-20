@interface MediaControlsContainerView
- (BOOL)isEmpty;
- (BOOL)isTimeControlOnScreen;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPCPlayerResponse)response;
- (MediaControlsContainerView)initWithFrame:(CGRect)a3;
- (MediaControlsTimeControl)timeControl;
- (MediaControlsTransportStackView)transportStackView;
- (UIVisualEffectView)primaryVisualEffectView;
- (int64_t)style;
- (void)_updateStyle;
- (void)layoutSubviews;
- (void)setEmpty:(BOOL)a3;
- (void)setPrimaryVisualEffectView:(id)a3;
- (void)setRatingActionSheetDelegate:(id)a3;
- (void)setResponse:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTimeControl:(id)a3;
- (void)setTimeControlOnScreen:(BOOL)a3;
- (void)setTransportStackView:(id)a3;
@end

@implementation MediaControlsContainerView

- (MediaControlsContainerView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MediaControlsContainerView;
  v3 = -[MediaControlsContainerView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MediaControlsTimeControl alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[MediaControlsTimeControl initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    timeControl = v3->_timeControl;
    v3->_timeControl = (MediaControlsTimeControl *)v9;

    v11 = -[MediaControlsTransportStackView initWithFrame:]([MediaControlsTransportStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    transportStackView = v3->_transportStackView;
    v3->_transportStackView = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
    primaryVisualEffectView = v3->_primaryVisualEffectView;
    v3->_primaryVisualEffectView = (UIVisualEffectView *)v13;

    v15 = [(MediaControlsContainerView *)v3 primaryVisualEffectView];
    [(MediaControlsContainerView *)v3 addSubview:v15];

    v16 = [(MediaControlsContainerView *)v3 primaryVisualEffectView];
    v17 = [v16 contentView];
    v18 = [(MediaControlsContainerView *)v3 timeControl];
    [v17 addSubview:v18];

    v19 = [(MediaControlsContainerView *)v3 transportStackView];
    [(MediaControlsContainerView *)v3 addSubview:v19];

    [(MediaControlsContainerView *)v3 _updateStyle];
  }
  return v3;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)MediaControlsContainerView;
  [(MediaControlsContainerView *)&v35 layoutSubviews];
  v3 = [(MediaControlsContainerView *)self traitCollection];
  [v3 displayScale];

  [(MediaControlsContainerView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  UIRoundToScale();
  v12 = [(MediaControlsContainerView *)self primaryVisualEffectView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  if (self->_style == 1)
  {
    UIRectIntegralWithScale();
    double v14 = v13;
    double v34 = v15;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    UIRectIntegralWithScale();
    double v34 = v20;
    double v17 = v21;
    double v19 = v22;
    double v14 = v23;
  }
  UIRectIntegralWithScale();
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [(MediaControlsContainerView *)self transportStackView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  v33 = [(MediaControlsContainerView *)self timeControl];
  objc_msgSend(v33, "setFrame:", v14, v34, v17, v19);
}

- (void)setEmpty:(BOOL)a3
{
  BOOL empty = self->_empty;
  if (empty != a3)
  {
    self->_BOOL empty = a3;
    BOOL empty = a3;
  }
  BOOL v5 = empty;
  double v6 = [(MediaControlsContainerView *)self timeControl];
  [v6 setEmpty:v5];

  BOOL v7 = self->_empty;
  double v8 = [(MediaControlsContainerView *)self transportStackView];
  [v8 setEmpty:v7];

  [(MediaControlsContainerView *)self setNeedsLayout];
}

- (void)setStyle:(int64_t)a3
{
  BOOL v5 = [(MediaControlsContainerView *)self timeControl];
  [v5 setStyle:a3];

  double v6 = [(MediaControlsContainerView *)self transportStackView];
  [v6 setStyle:a3];

  if (self->_style != a3)
  {
    self->_style = a3;
    [(MediaControlsContainerView *)self _updateStyle];
    [(MediaControlsContainerView *)self setNeedsLayout];
  }
}

- (void)setRatingActionSheetDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(MediaControlsContainerView *)self transportStackView];
  [v5 setActionsDelegate:v4];
}

- (void)setTimeControlOnScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MediaControlsContainerView *)self timeControl];
  [v4 setTimeControlOnScreen:v3];
}

- (BOOL)isTimeControlOnScreen
{
  v2 = [(MediaControlsContainerView *)self timeControl];
  char v3 = [v2 isTimeControlOnScreen];

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(MediaControlsContainerView *)self transportStackView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(MediaControlsContainerView *)self timeControl];
  [v5 setResponse:v4];

  id v6 = [(MediaControlsContainerView *)self transportStackView];
  [v6 setResponse:v4];
}

- (MPCPlayerResponse)response
{
  v2 = [(MediaControlsContainerView *)self transportStackView];
  char v3 = [v2 response];

  return (MPCPlayerResponse *)v3;
}

- (void)_updateStyle
{
  int64_t style = self->_style;
  if (style == 2)
  {
    double v7 = [(MediaControlsContainerView *)self timeControl];
    [v7 setAlpha:0.0];

    double v8 = [(MediaControlsContainerView *)self transportStackView];
    double v9 = 0.0;
  }
  else
  {
    if (style == 1)
    {
      id v4 = [(MediaControlsContainerView *)self timeControl];
      id v5 = v4;
      double v6 = 0.0;
    }
    else
    {
      id v4 = [(MediaControlsContainerView *)self timeControl];
      id v5 = v4;
      double v6 = 1.0;
    }
    [v4 setAlpha:v6];

    double v8 = [(MediaControlsContainerView *)self transportStackView];
    double v9 = 1.0;
  }
  id v10 = v8;
  [v8 setAlpha:v9];
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (MediaControlsTransportStackView)transportStackView
{
  return self->_transportStackView;
}

- (void)setTransportStackView:(id)a3
{
}

- (MediaControlsTimeControl)timeControl
{
  return self->_timeControl;
}

- (void)setTimeControl:(id)a3
{
}

- (UIVisualEffectView)primaryVisualEffectView
{
  return self->_primaryVisualEffectView;
}

- (void)setPrimaryVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryVisualEffectView, 0);
  objc_storeStrong((id *)&self->_timeControl, 0);

  objc_storeStrong((id *)&self->_transportStackView, 0);
}

@end