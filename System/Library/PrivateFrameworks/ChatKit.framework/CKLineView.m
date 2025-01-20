@interface CKLineView
- (BOOL)shouldUseDarkFSMStrokeColor;
- (CABackdropLayer)backdropFilterLayer;
- (CAShapeLayer)lineShapeLayer;
- (CKLineView)initWithFrame:(CGRect)a3;
- (void)_updateReplyLineColor;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)setBackdropFilterLayer:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLineShapeLayer:(id)a3;
- (void)setShouldUseDarkFSMStrokeColor:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKLineView

- (void)setShouldUseDarkFSMStrokeColor:(BOOL)a3
{
  self->_shouldUseDarkFSMStrokeColor = a3;
  [(CKLineView *)self _updateReplyLineColor];
}

- (CKLineView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKLineView;
  v3 = -[CKLineView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F39C88] layer];
    [(CKLineView *)v3 setLineShapeLayer:v4];
    v5 = [(CKLineView *)v3 layer];
    [v5 addSublayer:v4];

    v6 = [(CKLineView *)v3 layer];
    [v6 setMasksToBounds:0];
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKLineView;
  -[CKLineView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_lineShapeLayer)
  {
    [(CKLineView *)self bounds];
    -[CAShapeLayer setFrame:](self->_lineShapeLayer, "setFrame:");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKLineView;
  id v4 = a3;
  [(CKLineView *)&v7 traitCollectionDidChange:v4];
  v5 = [(CKLineView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(CKLineView *)self _updateReplyLineColor];
  }
}

- (void)_updateReplyLineColor
{
  if ([(CKLineView *)self shouldUseDarkFSMStrokeColor])
  {
    v3 = [MEMORY[0x1E4F428B8] blackColor];
  }
  else
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    v3 = [v5 replyLineColor];
  }
  id v8 = v3;
  uint64_t v6 = [v8 CGColor];
  objc_super v7 = [(CKLineView *)self lineShapeLayer];
  [v7 setStrokeColor:v6];
}

- (void)addFilter:(id)a3
{
  id v17 = a3;
  id v4 = [v17 balloonBackdropFilters];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(CKLineView *)self layer];
    [v6 setAllowsGroupBlending:0];

    id v7 = [(CKLineView *)self backdropFilterLayer];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F39B40]);
      objc_msgSend(v7, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [v7 setGroupName:@"FSMBackdropGroup"];
      [v7 setScale:0.25];
      id v8 = [(CKLineView *)self lineShapeLayer];
      [v7 setMask:v8];

      [(CKLineView *)self bounds];
      objc_msgSend(v7, "setFrame:");
      [(CKLineView *)self setBackdropFilterLayer:v7];
      v9 = [(CKLineView *)self layer];
      [v9 insertSublayer:v7 atIndex:0];
    }
    v10 = [v17 balloonBackdropFilters];
    [v7 setFilters:v10];

    v11 = [(CKLineView *)self lineShapeLayer];
    v12 = [(CKLineView *)self layer];
    [v12 setMask:v11];
  }
  v13 = [(CKLineView *)self layer];
  v14 = [v17 balloonFilters];
  [v13 setFilters:v14];

  v15 = [(CKLineView *)self layer];
  v16 = [v17 balloonCompositingFilter];
  [v15 setCompositingFilter:v16];

  [(CKLineView *)self setShouldUseDarkFSMStrokeColor:1];
}

- (void)clearFilters
{
  v3 = [(CKLineView *)self layer];
  [v3 setFilters:0];

  id v4 = [(CKLineView *)self layer];
  [v4 setCompositingFilter:0];

  [(CKLineView *)self setShouldUseDarkFSMStrokeColor:0];
  uint64_t v5 = [(CKLineView *)self layer];
  [v5 setMask:0];

  [(CKLineView *)self setBackdropFilterLayer:0];
  id v6 = [(CKLineView *)self layer];
  [v6 setAllowsGroupBlending:1];
}

- (CABackdropLayer)backdropFilterLayer
{
  return self->_backdropFilterLayer;
}

- (void)setBackdropFilterLayer:(id)a3
{
}

- (CAShapeLayer)lineShapeLayer
{
  return self->_lineShapeLayer;
}

- (void)setLineShapeLayer:(id)a3
{
}

- (BOOL)shouldUseDarkFSMStrokeColor
{
  return self->_shouldUseDarkFSMStrokeColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineShapeLayer, 0);

  objc_storeStrong((id *)&self->_backdropFilterLayer, 0);
}

@end