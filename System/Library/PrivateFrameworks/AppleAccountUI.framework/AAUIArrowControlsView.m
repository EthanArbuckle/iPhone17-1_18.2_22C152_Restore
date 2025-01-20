@interface AAUIArrowControlsView
+ (double)defaultHeightForOrientation:(int64_t)a3;
+ (double)defaultWidthForOrientation:(int64_t)a3;
- (AAUIArrowControlsView)initWithFrame:(CGRect)a3;
- (AAUIArrowControlsViewDelegate)delegate;
- (UIButton)downButton;
- (UIButton)upButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)interfaceOrientation;
- (void)_arrowButtonWasTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
@end

@implementation AAUIArrowControlsView

+ (double)defaultHeightForOrientation:(int64_t)a3
{
  v3 = _AAUIImageForButtonDirection(-1, a3 != 0);
  [v3 size];
  double v5 = v4;

  return v5;
}

+ (double)defaultWidthForOrientation:(int64_t)a3
{
  v3 = _AAUIImageForButtonDirection(1, a3 != 0);
  [v3 size];
  double v5 = v4 + v4;

  return v5;
}

- (AAUIArrowControlsView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AAUIArrowControlsView;
  v3 = -[AAUIArrowControlsView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    upButton = v3->_upButton;
    v3->_upButton = (UIButton *)v4;

    [(UIButton *)v3->_upButton setContentMode:4];
    [(UIButton *)v3->_upButton addTarget:v3 action:sel__arrowButtonWasTapped_ forControlEvents:1];
    [(AAUIArrowControlsView *)v3 addSubview:v3->_upButton];
    uint64_t v6 = [MEMORY[0x263F824E8] buttonWithType:1];
    downButton = v3->_downButton;
    v3->_downButton = (UIButton *)v6;

    [(UIButton *)v3->_downButton setContentMode:4];
    [(UIButton *)v3->_downButton addTarget:v3 action:sel__arrowButtonWasTapped_ forControlEvents:1];
    [(AAUIArrowControlsView *)v3 addSubview:v3->_downButton];
    v3->_interfaceOrientation = -1;
    [(AAUIArrowControlsView *)v3 setInterfaceOrientation:1];
  }
  return v3;
}

- (void)_arrowButtonWasTapped:(id)a3
{
  uint64_t v4 = (UIButton *)a3;
  if (self->_upButton == v4)
  {
    if (objc_opt_respondsToSelector()) {
      [(AAUIArrowControlsViewDelegate *)self->_delegate arrowControlsView:self didTapUpButton:self->_upButton];
    }
  }
  else if (self->_downButton == v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(AAUIArrowControlsViewDelegate *)self->_delegate arrowControlsView:self didTapDownButton:self->_upButton];
  }
  MEMORY[0x270F9A758]();
}

- (void)layoutSubviews
{
  [(UIButton *)self->_upButton frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(UIButton *)self->_upButton imageView];
  v8 = [v7 image];
  [v8 size];
  double v10 = v9 + 16.0;

  v11 = [(UIButton *)self->_upButton imageView];
  v12 = [v11 image];
  [v12 size];
  double v14 = v13 + 24.0;

  -[UIButton setFrame:](self->_upButton, "setFrame:", v4, v6, v10, v14);
  [(UIButton *)self->_downButton frame];
  double v16 = v15;
  v17 = [(UIButton *)self->_downButton imageView];
  v18 = [v17 image];
  [v18 size];
  double v20 = v19 + 16.0;

  v21 = [(UIButton *)self->_downButton imageView];
  v22 = [v21 image];
  [v22 size];
  double v24 = v23 + 24.0;

  [(UIButton *)self->_upButton frame];
  double MaxX = CGRectGetMaxX(v45);
  v26 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];

  if ((v27 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v28 = 18.0;
  }
  else {
    double v28 = 20.0;
  }
  -[UIButton setFrame:](self->_downButton, "setFrame:", MaxX + v28 + -16.0, v16, v20, v24);
  [(AAUIArrowControlsView *)self frame];
  double v30 = v29;
  double v32 = v31;
  [(UIButton *)self->_upButton frame];
  double v34 = v33;
  v35 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v36 = [v35 userInterfaceIdiom];

  if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v37 = 18.0;
  }
  else {
    double v37 = 20.0;
  }
  double v38 = v34 + v37;
  [(UIButton *)self->_downButton frame];
  double v40 = v38 + v39 + -24.0;
  [(UIButton *)self->_upButton frame];
  double v42 = v41;
  [(UIButton *)self->_downButton frame];
  if (v42 >= v43) {
    double v43 = v42;
  }
  -[AAUIArrowControlsView setFrame:](self, "setFrame:", v30, v32, v40, v43);
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  if (self->_interfaceOrientation != a3)
  {
    double v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    BOOL v8 = (unint64_t)(a3 - 3) < 2 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1;
    upButton = self->_upButton;
    double v10 = _AAUIImageForButtonDirection(1, v8);
    [(UIButton *)upButton setImage:v10 forState:0];

    [(UIButton *)self->_upButton sizeToFit];
    downButton = self->_downButton;
    v12 = _AAUIImageForButtonDirection(-1, v8);
    [(UIButton *)downButton setImage:v12 forState:0];

    [(UIButton *)self->_downButton sizeToFit];
    self->_interfaceOrientation = a3;
  }
  [(AAUIArrowControlsView *)self layoutSubviews];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIButton *)self->_downButton frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  [(UIButton *)self->_upButton frame];
  double v15 = v12 + 10.0;
  v24.origin.CGFloat x = v16 + -10.0;
  v24.size.width = v17 + 10.0;
  v22.CGFloat x = x;
  v22.CGFloat y = y;
  if (CGRectContainsPoint(v24, v22)) {
    v18 = self->_upButton;
  }
  else {
    v18 = 0;
  }
  v25.origin.CGFloat x = v8;
  v25.origin.CGFloat y = v10;
  v25.size.width = v15;
  v25.size.height = v14;
  v23.CGFloat x = x;
  v23.CGFloat y = y;
  if (CGRectContainsPoint(v25, v23))
  {
    double v19 = self->_downButton;

    v18 = v19;
  }
  return v18;
}

- (AAUIArrowControlsViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (AAUIArrowControlsViewDelegate *)a3;
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_storeStrong((id *)&self->_upButton, 0);
}

@end