@interface FigVideoContainerLayer
+ (id)defaultActionForKey:(id)a3;
- (BOOL)isForScrubbingOnly;
- (BOOL)shouldResizeVideoLayer;
- (CALayer)videoLayer;
- (FigVideoContainerLayer)init;
- (NSString)STSLabel;
- (id)actionForKey:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setForScrubbingOnly:(BOOL)a3;
- (void)setSTSLabel:(id)a3;
- (void)setShouldResizeVideoLayer:(BOOL)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setVideoLayer:(id)a3;
@end

@implementation FigVideoContainerLayer

- (FigVideoContainerLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigVideoContainerLayer;
  return [(FigBaseCALayer *)&v3 init];
}

+ (id)defaultActionForKey:(id)a3
{
  return 0;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigVideoContainerLayer;
  [(FigVideoContainerLayer *)&v3 dealloc];
}

- (void)layoutSublayers
{
  if (self->_shouldResizeVideoLayer)
  {
    videoLayer = self->_videoLayer;
    [(FigVideoContainerLayer *)self bounds];
    -[CALayer setFrame:](videoLayer, "setFrame:");
  }
  STSLayer = self->_STSLayer;
  [(FigVideoContainerLayer *)self bounds];

  -[CALayer setFrame:](STSLayer, "setFrame:");
}

- (void)setSTSLabel:(id)a3
{
  STSLabel = self->_STSLabel;
  if (STSLabel != a3)
  {
    v6 = STSLabel;
    self->_STSLabel = (NSString *)a3;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__FigVideoContainerLayer_setSTSLabel___block_invoke;
    block[3] = &unk_1E5794738;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __38__FigVideoContainerLayer_setSTSLabel___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  v4 = *(void **)(v2 + 64);
  if (v3)
  {
    if (!v4)
    {
      *(void *)(*(void *)(a1 + 32) + 64) = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      v5 = *(void **)(a1 + 32);
      v6 = (void *)v5[8];
      [v5 bounds];
      objc_msgSend(v6, "setFrame:");
      [*(id *)(a1 + 32) addSublayer:*(void *)(*(void *)(a1 + 32) + 64)];
      uint64_t v7 = *(void *)(a1 + 32);
      v4 = *(void **)(v7 + 64);
      uint64_t v3 = *(void *)(v7 + 48);
    }
    [v4 setValue:v3 forKeyPath:@"separatedOptions.STSLabel"];
  }
  else if (v4)
  {
    [v4 removeFromSuperlayer];

    *(void *)(*(void *)(a1 + 32) + 64) = 0;
  }
  v8 = (void *)MEMORY[0x1E4F39CF8];

  return [v8 commit];
}

- (void)setVideoLayer:(id)a3
{
  videoLayer = self->_videoLayer;
  if (videoLayer != a3)
  {

    self->_videoLayer = (CALayer *)a3;
    if (objc_opt_respondsToSelector())
    {
      v6 = self->_videoLayer;
      uint64_t v7 = [(FigVideoContainerLayer *)self toneMapToStandardDynamicRange];
      [(CALayer *)v6 setToneMapToStandardDynamicRange:v7];
    }
  }
}

- (CALayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  -[CALayer setToneMapToStandardDynamicRange:](self->_videoLayer, "setToneMapToStandardDynamicRange:");
  v5.receiver = self;
  v5.super_class = (Class)FigVideoContainerLayer;
  [(FigVideoContainerLayer *)&v5 setToneMapToStandardDynamicRange:v3];
}

- (BOOL)shouldResizeVideoLayer
{
  return self->_shouldResizeVideoLayer;
}

- (void)setShouldResizeVideoLayer:(BOOL)a3
{
  self->_shouldResizeVideoLayer = a3;
}

- (BOOL)isForScrubbingOnly
{
  return self->_isForScrubbingOnly;
}

- (void)setForScrubbingOnly:(BOOL)a3
{
  self->_isForScrubbingOnly = a3;
}

- (NSString)STSLabel
{
  return self->_STSLabel;
}

@end