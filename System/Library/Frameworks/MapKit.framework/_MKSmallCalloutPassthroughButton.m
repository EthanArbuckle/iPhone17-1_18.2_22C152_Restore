@interface _MKSmallCalloutPassthroughButton
- (UIControl)targetControl;
- (_MKSmallCalloutPassthroughButton)initWithFrame:(CGRect)a3;
- (void)handleTap:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTargetControl:(id)a3;
@end

@implementation _MKSmallCalloutPassthroughButton

- (_MKSmallCalloutPassthroughButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKSmallCalloutPassthroughButton;
  v3 = -[_MKSmallCalloutPassthroughButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_MKSmallCalloutPassthroughButton *)v3 addTarget:v3 action:sel_handleTap_ forControlEvents:64];
    v5 = v4;
  }

  return v4;
}

- (void)handleTap:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MKSmallCalloutPassthroughButton;
  -[_MKSmallCalloutPassthroughButton setHighlighted:](&v16, sel_setHighlighted_);
  if (v3 && self->_targetControl)
  {
    highlightView = self->_highlightView;
    if (!highlightView)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
      objc_super v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v8 = self->_highlightView;
      self->_highlightView = v7;

      v9 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.150000006];
      [(UIView *)self->_highlightView setBackgroundColor:v9];

      [(UIView *)self->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
      highlightView = self->_highlightView;
    }
    [(_MKSmallCalloutPassthroughButton *)self insertSubview:highlightView atIndex:0];
    v10 = (void *)MEMORY[0x1E4F28DC8];
    v11 = _NSDictionaryOfVariableBindings(&cfstr_Highlightview.isa, self->_highlightView, 0);
    v12 = [v10 constraintsWithVisualFormat:@"H:|[_highlightView]|" options:0 metrics:0 views:v11];
    [(_MKSmallCalloutPassthroughButton *)self addConstraints:v12];

    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = _NSDictionaryOfVariableBindings(&cfstr_Highlightview.isa, self->_highlightView, 0);
    v15 = [v13 constraintsWithVisualFormat:@"V:|[_highlightView]|" options:0 metrics:0 views:v14];
    [(_MKSmallCalloutPassthroughButton *)self addConstraints:v15];
  }
  else
  {
    [(UIView *)self->_highlightView removeFromSuperview];
  }
}

- (UIControl)targetControl
{
  return self->_targetControl;
}

- (void)setTargetControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);

  objc_storeStrong((id *)&self->_targetControl, 0);
}

@end