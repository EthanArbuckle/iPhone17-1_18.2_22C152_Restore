@interface DBHelloView
- (CADisplayLink)displayLink;
- (DBCursiveTextView)cursiveTextView;
- (DBHelloView)initWithFrame:(CGRect)a3;
- (double)desiredDuration;
- (double)startTime;
- (id)currentCompletion;
- (void)_animateCursiveForTimePassed;
- (void)_completeAsFinished:(BOOL)a3;
- (void)_createDisplayLink;
- (void)_onDisplayLink:(id)a3;
- (void)_removeDisplayLink;
- (void)setCurrentCompletion:(id)a3;
- (void)setDesiredDuration:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setStartTime:(double)a3;
- (void)startAnimatingWithCompletion:(id)a3;
- (void)stopAnimating;
- (void)updateStrokeColor;
@end

@implementation DBHelloView

- (DBHelloView)initWithFrame:(CGRect)a3
{
  v25[4] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)DBHelloView;
  v3 = -[DBHelloView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v4 URLForResource:@"CursiveHello" withExtension:@"plist"];

    v5 = [[DBCursiveTextView alloc] initWithTextURL:v22 pointSize:64.0];
    [(DBCursiveTextView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBHelloView *)v3 addSubview:v5];
    v21 = [(DBCursiveTextView *)v5 centerXAnchor];
    v20 = [(DBHelloView *)v3 centerXAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v25[0] = v19;
    v18 = [(DBCursiveTextView *)v5 centerYAnchor];
    v17 = [(DBHelloView *)v3 centerYAnchor];
    v6 = [v18 constraintEqualToAnchor:v17];
    v25[1] = v6;
    v7 = [(DBCursiveTextView *)v5 widthAnchor];
    v8 = [(DBHelloView *)v3 widthAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v25[2] = v9;
    v10 = [(DBCursiveTextView *)v5 heightAnchor];
    v11 = [(DBHelloView *)v3 heightAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v25[3] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];
    [(DBHelloView *)v3 addConstraints:v13];

    objc_storeStrong((id *)&v3->_cursiveTextView, v5);
    uint64_t v24 = objc_opt_class();
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
    id v15 = (id)[(DBHelloView *)v3 registerForTraitChanges:v14 withAction:sel_updateStrokeColor];
  }
  return v3;
}

- (void)startAnimatingWithCompletion:(id)a3
{
  [(DBHelloView *)self setCurrentCompletion:a3];
  v4 = [(DBHelloView *)self cursiveTextView];
  [v4 duration];
  -[DBHelloView setDesiredDuration:](self, "setDesiredDuration:");

  v5 = [(DBHelloView *)self cursiveTextView];
  [v5 setTime:0.0];

  v6 = [(DBHelloView *)self cursiveTextView];
  [v6 setAlpha:1.0];

  [(DBHelloView *)self updateStrokeColor];
  [(DBHelloView *)self _createDisplayLink];
  double Current = CFAbsoluteTimeGetCurrent();
  [(DBHelloView *)self setStartTime:Current];
}

- (void)stopAnimating
{
  [(DBHelloView *)self _removeDisplayLink];
  [(DBHelloView *)self _completeAsFinished:0];
}

- (void)_completeAsFinished:(BOOL)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__DBHelloView__completeAsFinished___block_invoke;
  v5[3] = &unk_2649B3E90;
  v5[4] = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__DBHelloView__completeAsFinished___block_invoke_2;
  v3[3] = &unk_2649B5F58;
  v3[4] = self;
  BOOL v4 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v5 animations:v3 completion:0.25];
}

void __35__DBHelloView__completeAsFinished___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cursiveTextView];
  [v1 setAlpha:0.0];
}

void __35__DBHelloView__completeAsFinished___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentCompletion];
  if (v2) {
    v2[2](v2, *(unsigned __int8 *)(a1 + 40));
  }
  [*(id *)(a1 + 32) setCurrentCompletion:0];
}

- (void)updateStrokeColor
{
  v3 = [(DBHelloView *)self traitCollection];
  if ([v3 userInterfaceStyle] == 1) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  }

  BOOL v4 = [(DBHelloView *)self cursiveTextView];
  [v4 setFillColor:v5];
}

- (void)_createDisplayLink
{
  v3 = [(DBHelloView *)self displayLink];

  if (v3) {
    [(DBHelloView *)self _removeDisplayLink];
  }
  BOOL v4 = [(DBHelloView *)self window];
  id v8 = [v4 screen];

  id v5 = [v8 displayLinkWithTarget:self selector:sel__onDisplayLink_];
  [(DBHelloView *)self setDisplayLink:v5];

  v6 = [(DBHelloView *)self displayLink];
  v7 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [v6 addToRunLoop:v7 forMode:*MEMORY[0x263EFF588]];
}

- (void)_removeDisplayLink
{
  v3 = [(DBHelloView *)self displayLink];
  [v3 invalidate];

  [(DBHelloView *)self setDisplayLink:0];
}

- (void)_onDisplayLink:(id)a3
{
  id v4 = a3;
  id v5 = [(DBHelloView *)self displayLink];

  if (v5 == v4)
  {
    [(DBHelloView *)self _animateCursiveForTimePassed];
  }
}

- (void)_animateCursiveForTimePassed
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(DBHelloView *)self startTime];
  double v5 = Current - v4;
  v6 = [(DBHelloView *)self cursiveTextView];
  *(float *)&double v7 = v5;
  [v6 setTime:v7];

  [(DBHelloView *)self desiredDuration];
  if (BSFloatGreaterThanFloat())
  {
    [(DBHelloView *)self _removeDisplayLink];
    [(DBHelloView *)self _completeAsFinished:1];
  }
}

- (DBCursiveTextView)cursiveTextView
{
  return self->_cursiveTextView;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)desiredDuration
{
  return self->_desiredDuration;
}

- (void)setDesiredDuration:(double)a3
{
  self->_desiredDuration = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (id)currentCompletion
{
  return self->_currentCompletion;
}

- (void)setCurrentCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentCompletion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_cursiveTextView, 0);
}

@end