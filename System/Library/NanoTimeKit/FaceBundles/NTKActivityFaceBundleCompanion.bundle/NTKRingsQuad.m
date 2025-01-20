@interface NTKRingsQuad
- (ARUIRenderer)renderer;
- (BOOL)animating;
- (BOOL)prepareForTime:(double)a3;
- (NSArray)ringGroups;
- (NTKRingsQuad)initWithRingGroups:(id)a3 renderer:(id)a4;
- (NTKRingsQuadDelegate)delegate;
- (id)_allRings;
- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4;
- (void)ringGroupHasUpdated:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKRingsQuad

- (NTKRingsQuad)initWithRingGroups:(id)a3 renderer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NTKRingsQuad;
  v9 = [(NTKRingsQuad *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ringGroups, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = v10->_ringGroups;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v15), "setDelegate:", v10, (void)v19);
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }

    uint64_t v16 = +[CLKUIMetalResourceManager sharedDevice];
    device = v10->_device;
    v10->_device = (MTLDevice *)v16;
  }
  return v10;
}

- (NSArray)ringGroups
{
  return self->_ringGroups;
}

- (ARUIRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setupForQuadView:(id)a3
{
}

- (BOOL)prepareForTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quadView);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained drawableSize];
    self->_size.width = v6;
    self->_size.height = v7;
    id v8 = (ARUIRenderContext *)[objc_alloc((Class)ARUIRenderContext) initWithDrawableSize:COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)self->_size))];
    context = self->_context;
    self->_context = v8;
  }
  return v5 != 0;
}

- (id)_allRings
{
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_ringGroups;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "rings", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  renderer = self->_renderer;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NTKRingsQuad *)self _allRings];
  [(ARUIRenderer *)renderer _renderRings:v9 passDescriptor:v7 commandBuffer:v8 withContext:self->_context];
}

- (void)ringGroupHasUpdated:(id)a3
{
  id v4 = a3;
  if (!self->_animating)
  {
    self->_animating = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "ntkRingsQuadDelegate_willStartAnimating");
  }
  objc_initWeak(&location, self);
  [(NSTimer *)self->_animationTimer invalidate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3334;
  v8[3] = &unk_20708;
  objc_copyWeak(&v9, &location);
  id v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v8 block:0.0666666667];
  animationTimer = self->_animationTimer;
  self->_animationTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NTKRingsQuadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKRingsQuadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_destroyWeak((id *)&self->_quadView);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_ringGroups, 0);
}

@end