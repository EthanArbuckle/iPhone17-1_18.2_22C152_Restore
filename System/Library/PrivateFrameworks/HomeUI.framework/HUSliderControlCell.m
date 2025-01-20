@interface HUSliderControlCell
- (HUSimpleSliderControlView)sliderView;
- (NSArray)sliderConstraints;
- (id)allControlViews;
- (void)_updateSliderConstraints;
- (void)prepareForReuse;
- (void)setSliderConstraints:(id)a3;
- (void)setSliderView:(id)a3;
@end

@implementation HUSliderControlCell

- (id)allControlViews
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUSliderControlCell *)self sliderView];
  v4 = objc_msgSend(v2, "na_setWithSafeObject:", v3);

  return v4;
}

- (void)setSliderView:(id)a3
{
  v5 = (HUSimpleSliderControlView *)a3;
  p_sliderView = &self->_sliderView;
  sliderView = self->_sliderView;
  if (sliderView != v5)
  {
    v9 = v5;
    [(HUSimpleSliderControlView *)sliderView removeFromSuperview];
    objc_storeStrong((id *)&self->_sliderView, a3);
    [(HUSimpleSliderControlView *)*p_sliderView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(HUSliderControlCell *)self contentView];
    [v8 addSubview:*p_sliderView];

    [(HUSliderControlCell *)self _updateSliderConstraints];
    v5 = v9;
  }
}

- (void)_updateSliderConstraints
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(HUSliderControlCell *)self sliderConstraints];
  [v3 deactivateConstraints:v4];

  [(HUSliderControlCell *)self setSliderConstraints:0];
  v5 = [(HUSliderControlCell *)self sliderView];

  if (v5)
  {
    v28 = [(HUSliderControlCell *)self sliderView];
    v26 = [v28 topAnchor];
    v27 = [(HUSliderControlCell *)self contentView];
    v25 = [v27 topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:7.0];
    v29[0] = v24;
    v23 = [(HUSliderControlCell *)self sliderView];
    v21 = [v23 bottomAnchor];
    v22 = [(HUSliderControlCell *)self contentView];
    v20 = [v22 bottomAnchor];
    v19 = [v21 constraintEqualToAnchor:v20 constant:-7.0];
    v29[1] = v19;
    v18 = [(HUSliderControlCell *)self sliderView];
    v17 = [v18 leadingAnchor];
    v6 = [(HUSliderControlCell *)self contentView];
    v7 = [v6 leadingAnchor];
    v8 = [v17 constraintEqualToAnchor:v7 constant:10.0];
    v29[2] = v8;
    v9 = [(HUSliderControlCell *)self sliderView];
    v10 = [v9 trailingAnchor];
    v11 = [(HUSliderControlCell *)self contentView];
    v12 = [v11 trailingAnchor];
    v13 = [v10 constraintEqualToAnchor:v12 constant:-10.0];
    v29[3] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    [(HUSliderControlCell *)self setSliderConstraints:v14];

    v15 = (void *)MEMORY[0x1E4F28DC8];
    v16 = [(HUSliderControlCell *)self sliderConstraints];
    [v15 activateConstraints:v16];
  }
}

- (void)prepareForReuse
{
  [(HUSliderControlCell *)self setSliderView:0];
  v3.receiver = self;
  v3.super_class = (Class)HUSliderControlCell;
  [(HUSliderControlCell *)&v3 prepareForReuse];
}

- (HUSimpleSliderControlView)sliderView
{
  return self->_sliderView;
}

- (NSArray)sliderConstraints
{
  return self->_sliderConstraints;
}

- (void)setSliderConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderConstraints, 0);

  objc_storeStrong((id *)&self->_sliderView, 0);
}

@end