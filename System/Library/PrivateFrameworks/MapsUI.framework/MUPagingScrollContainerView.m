@interface MUPagingScrollContainerView
- (BOOL)automaticallyFlipsForRTL;
- (MUPagingScrollContainerView)initWithHorizontalScrollView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)cornerStyle;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateCorner;
- (void)setAutomaticallyFlipsForRTL:(BOOL)a3;
- (void)setCornerStyle:(int64_t)a3;
@end

@implementation MUPagingScrollContainerView

- (MUPagingScrollContainerView)initWithHorizontalScrollView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPagingScrollContainerView;
  v6 = -[MUPagingScrollContainerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containedScrollView, a3);
    [(MUPagingScrollContainerView *)v7 setCornerStyle:1];
    [(MUPagingScrollContainerView *)v7 _setupSubviews];
    [(MUPagingScrollContainerView *)v7 _setupConstraints];
  }

  return v7;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  containedView = self->_containedView;
  self->_containedView = v4;

  [(UIView *)self->_containedView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containedView setClipsToBounds:1];
  [(UIView *)self->_containedView _mapsui_setCardCorner];
  [(MUPagingScrollContainerView *)self addSubview:self->_containedView];
  [(MUScrollViewProtocol *)self->_containedScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containedView addSubview:self->_containedScrollView];
  v6 = [[MUPagingScrollControlsView alloc] initWithHorizontalScrollView:self->_containedScrollView];
  controlsView = self->_controlsView;
  self->_controlsView = v6;

  [(MUPagingScrollControlsView *)self->_controlsView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPagingScrollContainerView *)self addSubview:self->_controlsView];
  v8 = self->_controlsView;
  [(MUPagingScrollContainerView *)self sendSubviewToBack:v8];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)MUPagingScrollContainerView;
  id v7 = a4;
  -[MUPagingScrollContainerView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (MUPagingScrollControlsView *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend(v7, "type", v13.receiver, v13.super_class);

  controlsView = v8;
  if (v9 == 11) {
    controlsView = self->_controlsView;
  }
  v11 = controlsView;

  return v11;
}

- (void)_setupConstraints
{
  v49[14] = *MEMORY[0x1E4F143B8];
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v47 = [(MUScrollViewProtocol *)self->_containedScrollView leadingAnchor];
  v46 = [(UIView *)self->_containedView leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v49[0] = v45;
  v44 = [(MUScrollViewProtocol *)self->_containedScrollView trailingAnchor];
  v43 = [(UIView *)self->_containedView trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v49[1] = v42;
  v41 = [(MUScrollViewProtocol *)self->_containedScrollView topAnchor];
  v40 = [(UIView *)self->_containedView topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v49[2] = v39;
  v38 = [(MUScrollViewProtocol *)self->_containedScrollView bottomAnchor];
  v37 = [(UIView *)self->_containedView bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v49[3] = v36;
  v35 = [(UIView *)self->_containedView topAnchor];
  v34 = [(MUPagingScrollContainerView *)self topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v49[4] = v33;
  v32 = [(UIView *)self->_containedView bottomAnchor];
  v31 = [(MUPagingScrollContainerView *)self bottomAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v49[5] = v30;
  v29 = [(UIView *)self->_containedView leadingAnchor];
  v28 = [(MUPagingScrollContainerView *)self leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:16.0];
  v49[6] = v27;
  v26 = [(UIView *)self->_containedView trailingAnchor];
  v25 = [(MUPagingScrollContainerView *)self trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:-16.0];
  v49[7] = v24;
  v23 = [(MUPagingScrollControlsView *)self->_controlsView topAnchor];
  v22 = [(UIView *)self->_containedView topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v49[8] = v21;
  v20 = [(MUPagingScrollControlsView *)self->_controlsView bottomAnchor];
  v19 = [(UIView *)self->_containedView bottomAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v49[9] = v18;
  v17 = [(MUPagingScrollControlsView *)self->_controlsView leadingAnchor];
  v16 = [(UIView *)self->_containedView leadingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 constant:-16.0];
  v49[10] = v15;
  id v3 = [(MUPagingScrollControlsView *)self->_controlsView leadingAnchor];
  v4 = [(MUPagingScrollContainerView *)self leadingAnchor];
  id v5 = [v3 constraintGreaterThanOrEqualToAnchor:v4];
  v49[11] = v5;
  v6 = [(MUPagingScrollControlsView *)self->_controlsView trailingAnchor];
  id v7 = [(UIView *)self->_containedView trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:16.0];
  v49[12] = v8;
  uint64_t v9 = [(MUPagingScrollControlsView *)self->_controlsView trailingAnchor];
  v10 = [(MUPagingScrollContainerView *)self trailingAnchor];
  v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
  v49[13] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:14];
  [v48 addObjectsFromArray:v12];

  objc_super v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = (void *)[v48 copy];
  [v13 activateConstraints:v14];
}

- (void)setCornerStyle:(int64_t)a3
{
  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    [(MUPagingScrollContainerView *)self _updateCorner];
  }
}

- (void)_updateCorner
{
  int64_t cornerStyle = self->_cornerStyle;
  if (cornerStyle == 1)
  {
    [(UIView *)self->_containedView _mapsui_setCardCorner];
  }
  else if (!cornerStyle)
  {
    [(UIView *)self->_containedView _setContinuousCornerRadius:0.0];
  }
}

- (void)setAutomaticallyFlipsForRTL:(BOOL)a3
{
}

- (BOOL)automaticallyFlipsForRTL
{
  return [(MUPagingScrollControlsView *)self->_controlsView automaticallyFlipsForRTL];
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_containedScrollView, 0);
  objc_storeStrong((id *)&self->_containedView, 0);
}

@end