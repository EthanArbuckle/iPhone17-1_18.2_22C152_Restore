@interface NTKCollieQuad
- (AVTAvatar)avatar;
- (AVTRenderer)renderer;
- (BOOL)paused;
- (BOOL)prepareForTime:(double)a3;
- (NTKCollieQuad)init;
- (void)ensureRenderer;
- (void)prewarmAvatar:(id)a3;
- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4;
- (void)setAvatar:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPaused:(BOOL)a3 completion:(id)a4;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKCollieQuad

- (NTKCollieQuad)init
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCollieQuad;
  v2 = [(NTKCollieQuad *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[CLKUIMetalResourceManager sharedDevice];
    device = v2->_device;
    v2->_device = (MTLDevice *)v3;

    uint64_t v5 = +[AVTRenderer rendererWithDevice:v2->_device options:0];
    renderer = v2->_renderer;
    v2->_renderer = (AVTRenderer *)v5;

    v7 = +[UIColor clearColor];
    [(AVTRenderer *)v2->_renderer setBackgroundColor:v7];

    LODWORD(v8) = 1023969417;
    [(AVTRenderer *)v2->_renderer deprecated_ntk_setPhysicsWorldTimeStep:v8];
    dispatch_queue_t v9 = dispatch_queue_create("Collie Renderer Queue", 0);
    rendererQueue = v2->_rendererQueue;
    v2->_rendererQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)setPaused:(BOOL)a3
{
  rendererQueue = self->_rendererQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9D14;
  v4[3] = &unk_28A38;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(rendererQueue, v4);
}

- (void)setPaused:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  rendererQueue = self->_rendererQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9DE0;
  block[3] = &unk_28A60;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(rendererQueue, block);
}

- (BOOL)paused
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  rendererQueue = self->_rendererQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9EE8;
  v5[3] = &unk_28A88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (void)ensureRenderer
{
  if (!self->_renderer)
  {
    char v3 = +[AVTRenderer rendererWithDevice:self->_device options:0];
    renderer = self->_renderer;
    self->_renderer = v3;

    BOOL v5 = +[UIColor clearColor];
    [(AVTRenderer *)self->_renderer setBackgroundColor:v5];

    uint64_t v6 = self->_renderer;
    LODWORD(v7) = 1023969417;
    [(AVTRenderer *)v6 deprecated_ntk_setPhysicsWorldTimeStep:v7];
  }
}

- (AVTRenderer)renderer
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_A0E4;
  id v10 = sub_A0F4;
  id v11 = 0;
  rendererQueue = self->_rendererQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A0FC;
  v5[3] = &unk_28A88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVTRenderer *)v3;
}

- (void)prewarmAvatar:(id)a3
{
  id v4 = a3;
  rendererQueue = self->_rendererQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A1B8;
  v7[3] = &unk_28AB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(rendererQueue, v7);
}

- (void)setAvatar:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_avatar, a3);
  rendererQueue = self->_rendererQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_A2DC;
  v8[3] = &unk_28AB0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(rendererQueue, v8);
}

- (void)setupForQuadView:(id)a3
{
  id v12 = a3;
  id v4 = +[CLKDevice currentDevice];
  [v4 screenBounds];
  double v6 = v5;
  double v8 = v7;

  id v9 = +[CLKDevice currentDevice];
  [v9 screenScale];
  double v11 = v10;

  self->_size.width = v6 * v11;
  self->_size.height = v8 * v11;
  [v12 setOpaque:0];
}

- (BOOL)prepareForTime:(double)a3
{
  rendererQueue = self->_rendererQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A504;
  v5[3] = &unk_28720;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_sync(rendererQueue, v5);
  return 1;
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_A67C;
  v18[3] = &unk_28AD8;
  id v9 = v8;
  v19 = v9;
  [v6 addCompletedHandler:v18];
  rendererQueue = self->_rendererQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A684;
  block[3] = &unk_28B00;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  v17 = v9;
  double v11 = v9;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(rendererQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rendererQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_avatar, 0);
}

@end