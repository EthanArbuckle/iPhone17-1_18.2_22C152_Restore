@interface _CPUIOutsetHighlightButton
- (CPUIFocusRingView)focusRingView;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFocusRingView:(id)a3;
@end

@implementation _CPUIOutsetHighlightButton

- (void)didMoveToWindow
{
  v23[4] = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)_CPUIOutsetHighlightButton;
  [(_CPUIOutsetHighlightButton *)&v22 didMoveToWindow];
  v3 = [(_CPUIOutsetHighlightButton *)self window];
  v4 = [v3 windowScene];
  v5 = [v4 focusSystem];
  if (v5)
  {
    focusRingView = self->_focusRingView;

    if (focusRingView) {
      return;
    }
    [(_CPUIOutsetHighlightButton *)self setClipsToBounds:0];
    v7 = [CPUIFocusRingView alloc];
    v8 = -[CPUIFocusRingView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v9 = self->_focusRingView;
    self->_focusRingView = v8;

    [(CPUIFocusRingView *)self->_focusRingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIFocusRingView *)self->_focusRingView setCornerRadius:6.0];
    [(CPUIFocusRingView *)self->_focusRingView setRingWidth:3.0];
    [(CPUIFocusRingView *)self->_focusRingView setHidden:1];
    [(_CPUIOutsetHighlightButton *)self addSubview:self->_focusRingView];
    v19 = (void *)MEMORY[0x263F08938];
    v3 = [(CPUIFocusRingView *)self->_focusRingView leadingAnchor];
    v4 = [(_CPUIOutsetHighlightButton *)self leadingAnchor];
    v21 = [v3 constraintEqualToAnchor:v4 constant:-3.0];
    v23[0] = v21;
    v20 = [(CPUIFocusRingView *)self->_focusRingView trailingAnchor];
    v18 = [(_CPUIOutsetHighlightButton *)self trailingAnchor];
    v10 = [v20 constraintEqualToAnchor:v18 constant:3.0];
    v23[1] = v10;
    v11 = [(CPUIFocusRingView *)self->_focusRingView topAnchor];
    v12 = [(_CPUIOutsetHighlightButton *)self topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:-3.0];
    v23[2] = v13;
    v14 = [(CPUIFocusRingView *)self->_focusRingView bottomAnchor];
    v15 = [(_CPUIOutsetHighlightButton *)self bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:3.0];
    v23[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
    [v19 activateConstraints:v17];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];
  [(CPUIFocusRingView *)self->_focusRingView setHidden:v5 != self];
}

- (CPUIFocusRingView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end