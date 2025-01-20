@interface LACUIPackagedView
- (BOOL)_isRendered;
- (BOOL)setInitialStateWhenMovedToWindow;
- (CALayer)rootLayer;
- (CGPoint)convertPointToSublayerCoordinates:(CGPoint)a3;
- (CGRect)convertRectFromSublayerCoordinates:(CGRect)a3;
- (LACUIPackagedView)initWithURL:(id)a3 error:(id *)a4;
- (id)description;
- (void)_setState:(int)a3 animated:(int)a4 allowRetry:(void *)a5 completion:;
- (void)_updateRootLayer;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setRootLayer:(id)a3;
- (void)setSetInitialStateWhenMovedToWindow:(BOOL)a3;
- (void)setState:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setStateNamed:(id)a3 animated:(BOOL)a4;
- (void)setStateNamed:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation LACUIPackagedView

- (LACUIPackagedView)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LACUIPackagedView;
  v7 = -[LACUIPackagedView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = *MEMORY[0x263F15EE8];
  id v21 = 0;
  v9 = [MEMORY[0x263F15838] packageWithContentsOfURL:v6 type:v8 options:0 error:&v21];
  id v10 = v21;
  v11 = v10;
  if (a4) {
    *a4 = v10;
  }
  if (v9)
  {
    uint64_t v12 = [v9 rootLayer];
    rootLayer = v7->_rootLayer;
    v7->_rootLayer = (CALayer *)v12;

    -[CALayer setGeometryFlipped:](v7->_rootLayer, "setGeometryFlipped:", [v9 isGeometryFlipped]);
    v14 = [(LACUIPackagedView *)v7 layer];
    [v14 setMasksToBounds:0];

    v15 = [(LACUIPackagedView *)v7 layer];
    [v15 addSublayer:v7->_rootLayer];

    v16 = [[LACUIPackagedViewStateController alloc] initWithLayer:v7->_rootLayer];
    stateController = v7->_stateController;
    v7->_stateController = v16;

LABEL_6:
    v18 = v7;
    goto LABEL_10;
  }
  v19 = LA_LOG_LACUIPackagedView();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[LACUIPackagedView initWithURL:error:]((uint64_t)v6, (uint64_t)v11, v19);
  }

  v18 = 0;
LABEL_10:

  return v18;
}

- (void)setStateNamed:(id)a3 animated:(BOOL)a4
{
}

- (void)setStateNamed:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[LACUIPackagedViewState alloc] initWithName:v9];

  [(LACUIPackagedView *)self setState:v10 animated:v5 completion:v8];
}

- (void)setState:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)_setState:(int)a3 animated:(int)a4 allowRetry:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a5;
  if (a1)
  {
    if (a3)
    {
      v11 = [a1 window];

      if (!v11)
      {
        if (a4)
        {
          objc_initWeak(&location, a1);
          dispatch_time_t v12 = dispatch_time(0, 10000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __62__LACUIPackagedView__setState_animated_allowRetry_completion___block_invoke;
          block[3] = &unk_2653BCDA8;
          objc_copyWeak(&v21, &location);
          id v19 = v9;
          char v22 = a3;
          id v20 = v10;
          dispatch_after(v12, MEMORY[0x263EF83A0], block);

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
          goto LABEL_15;
        }
        v15 = LA_LOG_LACUIPackagedView();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[LACUIPackagedView _setState:animated:allowRetry:completion:]((uint64_t)a1, (uint64_t)v9, v15);
        }
      }
      v14 = (void *)a1[51];
      v16 = [a1 window];
      BOOL v13 = v16 != 0;
    }
    else
    {
      BOOL v13 = 0;
      v14 = (void *)a1[51];
    }
    if (v10) {
      v17 = v10;
    }
    else {
      v17 = &__block_literal_global_12;
    }
    [v14 setState:v9 animated:v13 completion:v17];
  }
LABEL_15:
}

- (CGRect)convertRectFromSublayerCoordinates:(CGRect)a3
{
  rootLayer = self->_rootLayer;
  if (rootLayer) {
    [(CALayer *)rootLayer transform];
  }
  CA_CGRectApplyTransform();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGPoint)convertPointToSublayerCoordinates:(CGPoint)a3
{
  rootLayer = self->_rootLayer;
  if (rootLayer) {
    [(CALayer *)rootLayer transform];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  CATransform3DInvert(&v7, &v6);
  CA_CGPointApplyTransform();
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@; %p>", objc_opt_class(), self];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LACUIPackagedView;
  [(LACUIPackagedView *)&v3 layoutSubviews];
  -[LACUIPackagedView _updateRootLayer](self);
}

- (void)_updateRootLayer
{
  if (a1)
  {
    v1 = (void *)a1[53];
    [a1 bounds];
    LACUILayerScaleToFitInRect(v1, v2, v3, v4, v5);
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)LACUIPackagedView;
  [(LACUIPackagedView *)&v3 didMoveToWindow];
  if (self->_setInitialStateWhenMovedToWindow) {
    [(LACUIPackagedViewStateController *)self->_stateController setInitialState];
  }
}

- (BOOL)_isRendered
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 window];
  BOOL v2 = v1 != 0;

  return v2;
}

void __62__LACUIPackagedView__setState_animated_allowRetry_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[LACUIPackagedView _setState:animated:allowRetry:completion:](WeakRetained, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), 0, *(void *)(a1 + 40));
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (BOOL)setInitialStateWhenMovedToWindow
{
  return self->_setInitialStateWhenMovedToWindow;
}

- (void)setSetInitialStateWhenMovedToWindow:(BOOL)a3
{
  self->_setInitialStateWhenMovedToWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)initWithURL:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_255001000, a2, a3, "Failed to load %{public}@: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_setState:(NSObject *)a3 animated:allowRetry:completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_255001000, a2, a3, "%@ animated transition to '%@' state will be skipped because view is not rendered", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end