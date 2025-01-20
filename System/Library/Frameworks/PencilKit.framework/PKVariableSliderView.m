@interface PKVariableSliderView
- (CGSize)intrinsicContentSize;
- (void)_stringFromNumber:(void *)a1;
- (void)layoutSubviews;
- (void)sendValueChanged;
- (void)setupViewsIfNecessary;
- (void)sliderValueChanged;
@end

@implementation PKVariableSliderView

- (void)_stringFromNumber:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v4 setNumberStyle:1];
    [v4 setMinimumFractionDigits:v2[58]];
    [v4 setMaximumFractionDigits:v2[58]];
    v5 = [NSNumber numberWithDouble:a2];
    v2 = [v4 stringFromNumber:v5];
  }

  return v2;
}

- (void)setupViewsIfNecessary
{
  if (a1)
  {
    if (!*(void *)(a1 + 424))
    {
      v2 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
      v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v2];
      [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v3 _setContinuousCornerRadius:8.0];
      [v3 setClipsToBounds:1];
      id v4 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = v3;
      id v5 = v3;

      [(id)a1 addSubview:*(void *)(a1 + 424)];
    }
    if (!*(void *)(a1 + 408))
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1C38]);
      v7 = *(void **)(a1 + 408);
      *(void *)(a1 + 408) = v6;

      [*(id *)(a1 + 408) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(a1 + 408) addTarget:a1 action:sel_sliderValueChanged forControlEvents:4096];
      [(id)a1 addSubview:*(void *)(a1 + 408)];
      double v8 = *(double *)(a1 + 472);
      if (v8 >= 0.0) {
        double v9 = *(double *)(a1 + 472);
      }
      else {
        double v9 = -v8;
      }
      double v10 = __exp10(1.0);
      if (v9 > v10)
      {
        double v11 = 1.0;
        do
        {
          double v11 = v11 + 1.0;
          double v12 = __exp10(v11);
        }
        while (v9 > v12);
        double v10 = v12;
      }
      double v13 = *(double *)(a1 + 472);
      if (v13 >= 0.0)
      {
        double v17 = fmax(v13 + v10 * -0.5, 0.0);
        *(float *)&double v17 = v17;
        [*(id *)(a1 + 408) setMinimumValue:v17];
        [*(id *)(a1 + 408) minimumValue];
        double v19 = v10 + v18;
        *(float *)&double v19 = v19;
        [*(id *)(a1 + 408) setMaximumValue:v19];
      }
      else
      {
        double v14 = v10 + v13;
        if (v14 > -0.000001) {
          double v14 = -0.000001;
        }
        *(float *)&double v14 = v14;
        [*(id *)(a1 + 408) setMaximumValue:v14];
        [*(id *)(a1 + 408) maximumValue];
        double v16 = v15 - v10;
        *(float *)&double v16 = v16;
        [*(id *)(a1 + 408) setMinimumValue:v16];
      }
      double v20 = *(double *)(a1 + 472);
      *(float *)&double v20 = v20;
      [*(id *)(a1 + 408) setValue:v20];
    }
    if (!*(void *)(a1 + 416))
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      v22 = *(void **)(a1 + 416);
      *(void *)(a1 + 416) = v21;

      [*(id *)(a1 + 416) setTranslatesAutoresizingMaskIntoConstraints:0];
      v23 = -[PKVariableSliderView _stringFromNumber:]((void *)a1, *(double *)(a1 + 472));
      [*(id *)(a1 + 416) setText:v23];

      uint64_t v24 = *(void *)(a1 + 416);
      [(id)a1 addSubview:v24];
    }
  }
}

- (void)layoutSubviews
{
  -[PKVariableSliderView setupViewsIfNecessary]((uint64_t)self);
  [(PKVariableSliderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  [(UISlider *)self->_slider intrinsicContentSize];
  double v12 = v11;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  double MaxY = CGRectGetMaxY(v21);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double MidX = CGRectGetMidX(v22);
  -[UISlider setFrame:](self->_slider, "setFrame:", 8.0, MaxY - (v12 + 8.0), v8 + -16.0, v12);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v8, v10);
  double v17 = v16;
  label = self->_label;
  double v19 = MidX + v16 * -0.5;

  -[UILabel setFrame:](label, "setFrame:", v19, 8.0, v17, v15);
}

- (CGSize)intrinsicContentSize
{
  -[PKVariableSliderView setupViewsIfNecessary]((uint64_t)self);
  [(UISlider *)self->_slider intrinsicContentSize];
  double v4 = v3;
  [(UILabel *)self->_label intrinsicContentSize];
  double v6 = v4 + v5 + 24.0;
  double v7 = 216.0;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)sliderValueChanged
{
  [(UISlider *)self->_slider value];
  double v4 = v3;
  -[PKVariableSliderView _stringFromNumber:](self, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = [(UILabel *)self->_label text];
  char v6 = [v7 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    self->_valueToSend = v4;
    [(UILabel *)self->_label setText:v7];
    [(PKVariableSliderView *)self setNeedsLayout];
    if (CACurrentMediaTime() - self->_lastSentTimestamp >= 0.05) {
      [(PKVariableSliderView *)self sendValueChanged];
    }
    else {
      -[PKVariableSliderView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_sendValueChanged, 0);
    }
  }
}

- (void)sendValueChanged
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_sendValueChanged object:0];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained variableSliderView:self valueDidChange:self->_valueToSend];

  self->_lastSentTimestamp = CACurrentMediaTime();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_slider, 0);
}

@end