@interface _ClientRenderer
- (_ClientRenderer)init;
- (void)_handleRenderStatsTime:(double)a3 cost:(double)a4;
- (void)renderWithViewData:(id)a3 scale:(double)a4 handler:(id)a5;
@end

@implementation _ClientRenderer

- (_ClientRenderer)init
{
  v19.receiver = self;
  v19.super_class = (Class)_ClientRenderer;
  v2 = [(_ClientRenderer *)&v19 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = +[CDComplicationHostingView async];
    host = v2->_host;
    v2->_host = (CDComplicationHostingView *)v5;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v2->_renderTime = _Q0;
    objc_initWeak(&location, v2);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __23___ClientRenderer_init__block_invoke;
    v16 = &unk_2644A5198;
    objc_copyWeak(&v17, &location);
    [(CDComplicationHostingView *)v2->_host setRenderStatsHandler:&v13];
    -[CDComplicationHostingView setShouldCallRenderStatsHandlerOnMainQueue:](v2->_host, "setShouldCallRenderStatsHandlerOnMainQueue:", 0, v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)renderWithViewData:(id)a3 scale:(double)a4 handler:(id)a5
{
  id v16 = a3;
  v8 = (void (**)(void, double, double))a5;
  v9 = (void *)MEMORY[0x223C269E0]([(CDComplicationHostingView *)self->_host setViewData:v16]);
  v10 = objc_alloc_init(_ClientRendererWindow);
  [(_ClientRendererWindow *)v10 setHidden:0];
  [(_ClientRendererWindow *)v10 setContentScaleFactor:a4];
  id v11 = objc_alloc_init(MEMORY[0x263F82E10]);
  [(_ClientRendererWindow *)v10 setRootViewController:v11];
  v12 = [v11 view];
  [v12 addSubview:self->_host];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CDComplicationHostingView *)self->_host sizeToFit];
  [(CDComplicationHostingView *)self->_host setNeedsLayout];
  [(CDComplicationHostingView *)self->_host layoutIfNeeded];
  [(CDComplicationHostingView *)self->_host frame];
  -[_ClientRendererWindow setFrame:](v10, "setFrame:");
  uint64_t v13 = [v11 view];
  [(CDComplicationHostingView *)self->_host frame];
  objc_msgSend(v13, "setFrame:");

  [(_ClientRendererWindow *)v10 setNeedsLayout];
  [(_ClientRendererWindow *)v10 layoutIfNeeded];
  [(_ClientRendererWindow *)v10 setNeedsDisplay];
  [MEMORY[0x263F158F8] commit];
  [MEMORY[0x263F158F8] flush];
  [(CDComplicationHostingView *)self->_host waitForAsyncRendering];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  [(CDComplicationHostingView *)self->_host removeFromSuperview];
  [(_ClientRendererWindow *)v10 setHidden:1];
  [(_ClientRendererWindow *)v10 setRootViewController:0];

  os_unfair_lock_lock(&self->_lock);
  double renderTime = self->_renderTime;
  double renderCost = self->_renderCost;
  os_unfair_lock_unlock(&self->_lock);
  v8[2](v8, renderTime, renderCost);
}

- (void)_handleRenderStatsTime:(double)a3 cost:(double)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_double renderTime = a3;
  self->_double renderCost = a4;
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end