@interface FigCDSCALayer
- (FigCDSCALayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)clear:(CGRect)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)layoutSublayers;
- (void)setCallbacks:(id)a3 userEvent:(void *)a4 viewportChanged:(void *)a5 drawInContext:(void *)a6;
- (void)setVideoBounds:(CGRect)a3;
@end

@implementation FigCDSCALayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4);
}

- (FigCDSCALayer)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)FigCDSCALayer;
  v2 = [(FigBaseCALayer *)&v6 init];
  if (v2)
  {
    v3 = (OpaqueFigCDSCALayerInternal *)malloc_type_calloc(1uLL, 0x58uLL, 0x10C00400FC91BB4uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
    snprintf(__str, 0x100uLL, "com.apple.coremedia.figcdscalayer.messagequeue<%p>", v2);
    dispatch_queue_t v4 = dispatch_queue_create(__str, 0);
    v2->layerInternal->var7 = v4;
    if (!v4)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  layerInternal = (dispatch_object_t *)self->layerInternal;
  if (layerInternal)
  {
    if (layerInternal[10])
    {
      dispatch_release(layerInternal[10]);
      layerInternal = (dispatch_object_t *)self->layerInternal;
      layerInternal[10] = 0;
    }
    free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigCDSCALayer;
  [(FigCDSCALayer *)&v4 dealloc];
}

- (void)setVideoBounds:(CGRect)a3
{
  self->layerInternal->var1 = a3;
}

- (void)clear:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->layerInternal->var2 = 1;
  if (CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB20]))
  {
    [(FigCDSCALayer *)self bounds];
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }

  -[FigCDSCALayer setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", x, y, width, height);
}

- (void)setCallbacks:(id)a3 userEvent:(void *)a4 viewportChanged:(void *)a5 drawInContext:(void *)a6
{
  self->layerInternal->var3 = a3;
  self->layerInternal->var4 = a4;
  self->layerInternal->var5 = a5;
  self->layerInternal->var6 = a6;
}

- (void)drawInContext:(CGContext *)a3
{
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  if ([(FigCDSCALayer *)self contentsAreFlipped])
  {
    [(FigCDSCALayer *)self frame];
    v7.b = 0.0;
    v7.c = 0.0;
    v7.a = 1.0;
    *(_OWORD *)&v7.d = xmmword_1949965D0;
    v7.tdouble y = v5;
    CGContextConcatCTM(a3, &v7);
  }
  layerInternal = self->layerInternal;
  if (layerInternal->var2)
  {
    layerInternal->var2 = 0;
    [(FigCDSCALayer *)self bounds];
    CGContextClearRect(a3, v9);
  }
  else
  {
    ((void (*)(CGContext *, void *))layerInternal->var6)(a3, layerInternal->var3);
  }
  CGContextFlush(a3);
}

- (void)layoutSublayers
{
  [(FigCDSCALayer *)self bounds];
  ((void (*)(void *))self->layerInternal->var5)(self->layerInternal->var3);

  [(FigBaseCALayer *)self setNeedsDisplay];
}

@end