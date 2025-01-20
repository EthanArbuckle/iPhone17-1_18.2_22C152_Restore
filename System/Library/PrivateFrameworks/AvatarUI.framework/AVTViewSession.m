@interface AVTViewSession
- (AVTView)avtView;
- (AVTViewSession)initWithBecomeActiveHandler:(id)a3 tearDownHandler:(id)a4 aspectRatio:(CGSize)a5;
- (AVTViewSessionDelegate)delegate;
- (AVTViewUpdater)avtViewUpdater;
- (BOOL)isActive;
- (CGSize)aspectRatio;
- (UIView)avtViewContainer;
- (id)becomeActiveHandler;
- (id)tearDownHandler;
- (void)activateWithAVTView:(id)a3 container:(id)a4 updater:(id)a5;
- (void)setActive:(BOOL)a3;
- (void)setAvtView:(id)a3;
- (void)setAvtViewContainer:(id)a3;
- (void)setAvtViewUpdater:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tearDownWithCompletionHandler:(id)a3;
@end

@implementation AVTViewSession

- (AVTViewSession)initWithBecomeActiveHandler:(id)a3 tearDownHandler:(id)a4 aspectRatio:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AVTViewSession;
  v11 = [(AVTViewSession *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    id becomeActiveHandler = v11->_becomeActiveHandler;
    v11->_id becomeActiveHandler = (id)v12;

    uint64_t v14 = [v10 copy];
    id tearDownHandler = v11->_tearDownHandler;
    v11->_id tearDownHandler = (id)v14;

    v11->_active = 0;
    v11->_aspectRatio.CGFloat width = width;
    v11->_aspectRatio.CGFloat height = height;
  }

  return v11;
}

- (void)activateWithAVTView:(id)a3 container:(id)a4 updater:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(AVTViewSession *)self isActive])
  {
    [(AVTViewSession *)self setActive:1];
    [(AVTViewSession *)self setAvtView:v11];
    [(AVTViewSession *)self setAvtViewContainer:v8];
    [(AVTViewSession *)self setAvtViewUpdater:v9];
    id v10 = [(AVTViewSession *)self becomeActiveHandler];
    ((void (**)(void, AVTViewSession *))v10)[2](v10, self);
  }
}

- (void)tearDownWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __48__AVTViewSession_tearDownWithCompletionHandler___block_invoke;
  uint64_t v12 = &unk_263FF06C0;
  v13 = self;
  id v14 = v4;
  id v5 = v4;
  v6 = (void (**)(void))MEMORY[0x210530210](&v9);
  if ([(AVTViewSession *)self isActive]
    && ([(AVTViewSession *)self setActive:0],
        [(AVTViewSession *)self tearDownHandler],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [(AVTViewSession *)self tearDownHandler];
    ((void (**)(void, AVTViewSession *, void (**)(void)))v8)[2](v8, self, v6);
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __48__AVTViewSession_tearDownWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 sessionDidTearDown:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (UIView)avtViewContainer
{
  return self->_avtViewContainer;
}

- (void)setAvtViewContainer:(id)a3
{
  self->_avtViewContainer = (UIView *)a3;
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
  self->_avtView = (AVTView *)a3;
}

- (AVTViewUpdater)avtViewUpdater
{
  return self->_avtViewUpdater;
}

- (void)setAvtViewUpdater:(id)a3
{
  self->_avtViewUpdater = (AVTViewUpdater *)a3;
}

- (CGSize)aspectRatio
{
  double width = self->_aspectRatio.width;
  double height = self->_aspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)becomeActiveHandler
{
  return self->_becomeActiveHandler;
}

- (id)tearDownHandler
{
  return self->_tearDownHandler;
}

- (AVTViewSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTViewSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_tearDownHandler, 0);
  objc_storeStrong(&self->_becomeActiveHandler, 0);
}

@end