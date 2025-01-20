@interface HNDBubbleCursorController
- (CALayer)cursorContainerLayer;
- (HNDBubbleCursorController)init;
- (HNDBubbleCursorLayer)cursorBackgroundLayer;
- (HNDBubbleCursorLayer)cursorCompositingLayer;
- (HNDBubbleCursorLayer)cursorForegroundLayer;
- (id)description;
- (void)hide:(BOOL)a3 animate:(BOOL)a4;
- (void)setCursorBackgroundLayer:(id)a3;
- (void)setCursorCompositingLayer:(id)a3;
- (void)setCursorContainerLayer:(id)a3;
- (void)setCursorForegroundLayer:(id)a3;
- (void)updateLevel:(int)a3 animated:(BOOL)a4;
- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6;
- (void)updateTheme:(int)a3 animated:(BOOL)a4;
- (void)updateTheme:(int)a3 level:(int)a4 path:(id)a5 frame:(CGRect)a6 isSimpleRect:(BOOL)a7 animated:(BOOL)a8;
@end

@implementation HNDBubbleCursorController

- (HNDBubbleCursorController)init
{
  v18.receiver = self;
  v18.super_class = (Class)HNDBubbleCursorController;
  v2 = [(HNDBubbleCursorController *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(HNDForegroundBubbleCursorLayer);
    uint64_t v4 = kCAFilterPlusD;
    v5 = +[CAFilter filterWithType:kCAFilterPlusD];
    [(HNDForegroundBubbleCursorLayer *)v3 setCompositingFilter:v5];

    [(HNDBubbleCursorController *)v2 setCursorForegroundLayer:v3];
    v6 = objc_alloc_init(HNDBackgroundBubbleCursorLayer);

    v7 = +[CAFilter filterWithType:v4];
    [(HNDBackgroundBubbleCursorLayer *)v6 setCompositingFilter:v7];

    [(HNDBubbleCursorController *)v2 setCursorBackgroundLayer:v6];
    v8 = objc_alloc_init(HNDBackgroundBubbleCursorLayer);

    v9 = +[CAFilter filterWithType:kCAFilterPlusL];
    [(HNDBackgroundBubbleCursorLayer *)v8 setCompositingFilter:v9];

    [(HNDBubbleCursorController *)v2 setCursorCompositingLayer:v8];
    id v10 = objc_alloc_init((Class)CALayer);
    [(HNDBubbleCursorController *)v2 setCursorContainerLayer:v10];
    v11 = [(HNDBubbleCursorController *)v2 cursorContainerLayer];
    v12 = [(HNDBubbleCursorController *)v2 cursorForegroundLayer];
    [v11 addSublayer:v12];

    v13 = [(HNDBubbleCursorController *)v2 cursorContainerLayer];
    v14 = [(HNDBubbleCursorController *)v2 cursorBackgroundLayer];
    [v13 addSublayer:v14];

    v15 = [(HNDBubbleCursorController *)v2 cursorContainerLayer];
    v16 = [(HNDBubbleCursorController *)v2 cursorCompositingLayer];
    [v15 addSublayer:v16];
  }
  return v2;
}

- (id)description
{
  v3 = [(HNDBubbleCursorController *)self cursorForegroundLayer];
  uint64_t v4 = [(HNDBubbleCursorController *)self cursorBackgroundLayer];
  v5 = +[NSString stringWithFormat:@"HNDBubbleCursorController:<%p>. %@. %@", self, v3, v4];

  return v5;
}

- (void)updateTheme:(int)a3 level:(int)a4 path:(id)a5 frame:(CGRect)a6 isSimpleRect:(BOOL)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  id v17 = a5;
  [(HNDBubbleCursorController *)self updateTheme:v15 animated:v8];
  [(HNDBubbleCursorController *)self updateLevel:v14 animated:v8];
  -[HNDBubbleCursorController updatePath:frame:isSimpleRect:animated:](self, "updatePath:frame:isSimpleRect:animated:", v17, v9, v8, x, y, width, height);
}

- (void)updateTheme:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = [(HNDBubbleCursorController *)self cursorBackgroundLayer];
  [v7 updateTheme:v5 animated:v4];

  BOOL v8 = [(HNDBubbleCursorController *)self cursorForegroundLayer];
  [v8 updateTheme:v5 animated:v4];

  id v9 = [(HNDBubbleCursorController *)self cursorCompositingLayer];
  [v9 updateTheme:v5 animated:v4];
}

- (void)updateLevel:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = [(HNDBubbleCursorController *)self cursorBackgroundLayer];
  [v7 updateLevel:v5 animated:v4];

  BOOL v8 = [(HNDBubbleCursorController *)self cursorForegroundLayer];
  [v8 updateLevel:v5 animated:v4];

  id v9 = [(HNDBubbleCursorController *)self cursorCompositingLayer];
  [v9 updateLevel:v5 animated:v4];
}

- (void)updatePath:(id)a3 frame:(CGRect)a4 isSimpleRect:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (v13)
  {
    uint64_t v14 = [(HNDBubbleCursorController *)self cursorContainerLayer];
    objc_msgSend(v14, "setFrame:", x, y, width, height);
  }
  +[CATransaction commit];
  double v15 = CGPointZero.y;
  v16 = [(HNDBubbleCursorController *)self cursorBackgroundLayer];
  objc_msgSend(v16, "updatePath:frame:isSimpleRect:animated:", v13, v7, v6, CGPointZero.x, v15, width, height);

  id v17 = [(HNDBubbleCursorController *)self cursorForegroundLayer];
  objc_msgSend(v17, "updatePath:frame:isSimpleRect:animated:", v13, v7, v6, CGPointZero.x, v15, width, height);

  id v18 = [(HNDBubbleCursorController *)self cursorCompositingLayer];
  objc_msgSend(v18, "updatePath:frame:isSimpleRect:animated:", v13, v7, v6, CGPointZero.x, v15, width, height);
}

- (void)hide:(BOOL)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(HNDBubbleCursorController *)self cursorForegroundLayer];
  [v7 ensureHidden:v5 animated:v4];

  BOOL v8 = [(HNDBubbleCursorController *)self cursorBackgroundLayer];
  [v8 ensureHidden:v5 animated:v4];

  id v9 = [(HNDBubbleCursorController *)self cursorCompositingLayer];
  [v9 ensureHidden:v5 animated:v4];
}

- (CALayer)cursorContainerLayer
{
  return self->_cursorContainerLayer;
}

- (void)setCursorContainerLayer:(id)a3
{
}

- (HNDBubbleCursorLayer)cursorBackgroundLayer
{
  return self->_cursorBackgroundLayer;
}

- (void)setCursorBackgroundLayer:(id)a3
{
}

- (HNDBubbleCursorLayer)cursorForegroundLayer
{
  return self->_cursorForegroundLayer;
}

- (void)setCursorForegroundLayer:(id)a3
{
}

- (HNDBubbleCursorLayer)cursorCompositingLayer
{
  return self->_cursorCompositingLayer;
}

- (void)setCursorCompositingLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursorCompositingLayer, 0);
  objc_storeStrong((id *)&self->_cursorForegroundLayer, 0);
  objc_storeStrong((id *)&self->_cursorBackgroundLayer, 0);

  objc_storeStrong((id *)&self->_cursorContainerLayer, 0);
}

@end