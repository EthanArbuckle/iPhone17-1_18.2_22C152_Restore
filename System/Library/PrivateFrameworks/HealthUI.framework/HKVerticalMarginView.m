@interface HKVerticalMarginView
- (HKVerticalMarginDelegate)marginDelegate;
- (HKVerticalMarginView)initWithSubview:(id)a3 offsetOptions:(unint64_t)a4;
- (double)_bottomOffsetWithController:(id)a3;
- (double)_findTabBarHeightWithController:(id)a3;
- (double)_topOffsetWithController:(id)a3;
- (double)currentKeyboardHeight;
- (id)_findViewController;
- (unint64_t)offsetOptions;
- (void)dealloc;
- (void)keyboardWasShown:(id)a3;
- (void)keyboardWillBeHidden:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentKeyboardHeight:(double)a3;
- (void)setMarginDelegate:(id)a3;
- (void)setOffsetOptions:(unint64_t)a3;
@end

@implementation HKVerticalMarginView

- (HKVerticalMarginView)initWithSubview:(id)a3 offsetOptions:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKVerticalMarginView;
  v7 = -[HKVerticalMarginView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_offsetOptions = a4;
    marginDelegate = v7->_marginDelegate;
    v7->_marginDelegate = 0;

    v8->_currentKeyboardHeight = 0.0;
    v10 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(HKVerticalMarginView *)v8 setBackgroundColor:v10];

    [(HKVerticalMarginView *)v8 addSubview:v6];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel_keyboardWasShown_ name:*MEMORY[0x1E4FB2BC8] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v8 selector:sel_keyboardWillBeHidden_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2BC8] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];

  v5.receiver = self;
  v5.super_class = (Class)HKVerticalMarginView;
  [(HKVerticalMarginView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)HKVerticalMarginView;
  [(HKVerticalMarginView *)&v17 layoutSubviews];
  v3 = [(HKVerticalMarginView *)self subviews];
  v4 = [v3 objectAtIndex:0];

  [(HKVerticalMarginView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(HKVerticalMarginView *)self _findViewController];
  [(HKVerticalMarginView *)self _topOffsetWithController:v13];
  double v15 = v14;
  [(HKVerticalMarginView *)self _bottomOffsetWithController:v13];
  objc_msgSend(v4, "setFrame:", v6, v8 + v15, v10, v12 - (v15 + v16));
}

- (void)keyboardWasShown:(id)a3
{
  id v7 = [a3 userInfo];
  v4 = [v7 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  double v6 = v5;

  self->_currentKeyboardHeight = v6;
  [(HKVerticalMarginView *)self setNeedsLayout];
}

- (void)keyboardWillBeHidden:(id)a3
{
  self->_currentKeyboardHeight = 0.0;
  [(HKVerticalMarginView *)self setNeedsLayout];
}

- (double)_topOffsetWithController:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  unint64_t offsetOptions = self->_offsetOptions;
  if (offsetOptions)
  {
    double v8 = [v4 view];
    double v9 = [v8 window];
    double v10 = [v9 windowScene];
    double v11 = [v10 statusBarManager];
    [v11 statusBarFrame];
    double v13 = v12;

    double v7 = v13 + 0.0;
    if ((self->_offsetOptions & 2) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    double v7 = 0.0;
    if ((offsetOptions & 2) == 0) {
      goto LABEL_9;
    }
  }
  double v14 = [v5 navigationController];
  double v15 = v14;
  if (v14 && ([v14 isNavigationBarHidden] & 1) == 0)
  {
    double v16 = [v15 navigationBar];
    [v16 frame];
    double v7 = v7 + v17;
  }
LABEL_9:
  marginDelegate = self->_marginDelegate;
  if (marginDelegate)
  {
    [(HKVerticalMarginDelegate *)marginDelegate verticalMarginTopOffset];
    double v7 = v7 + v19;
  }

  return v7;
}

- (double)_bottomOffsetWithController:(id)a3
{
  id v4 = a3;
  unint64_t offsetOptions = self->_offsetOptions;
  if ((offsetOptions & 8) != 0)
  {
    double currentKeyboardHeight = self->_currentKeyboardHeight;
    if (currentKeyboardHeight > 0.0) {
      goto LABEL_5;
    }
  }
  double v7 = 0.0;
  if ((offsetOptions & 4) != 0)
  {
    [(HKVerticalMarginView *)self _findTabBarHeightWithController:v4];
LABEL_5:
    double v7 = currentKeyboardHeight + 0.0;
  }

  return v7;
}

- (double)_findTabBarHeightWithController:(id)a3
{
  v3 = [a3 tabBarController];
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 tabBar];
    double v6 = 0.0;
    if (([v5 isHidden] & 1) == 0)
    {
      [v5 frame];
      double v6 = v7;
    }
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (id)_findViewController
{
  v2 = self;
  if (v2)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [(HKVerticalMarginView *)v2 nextResponder];

      v2 = (HKVerticalMarginView *)v3;
      if (!v3) {
        goto LABEL_6;
      }
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (unint64_t)offsetOptions
{
  return self->_offsetOptions;
}

- (void)setOffsetOptions:(unint64_t)a3
{
  self->_unint64_t offsetOptions = a3;
}

- (HKVerticalMarginDelegate)marginDelegate
{
  return self->_marginDelegate;
}

- (void)setMarginDelegate:(id)a3
{
}

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_double currentKeyboardHeight = a3;
}

- (void).cxx_destruct
{
}

@end