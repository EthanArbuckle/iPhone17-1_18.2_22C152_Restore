@interface FigCDSCALayerOutputNodeLayer
- (FigCDSCALayerOutputNodeLayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setContents:(id)a3;
- (void)setPosition:(CGPoint)a3;
@end

@implementation FigCDSCALayerOutputNodeLayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4);
}

- (FigCDSCALayerOutputNodeLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  v2 = [(FigBaseCALayer *)&v8 init];
  if (v2)
  {
    v3 = (OpaqueFigCDSCALayerOutputNodeLayerInternal *)malloc_type_calloc(1uLL, 0x18uLL, 0x80040D6874129uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
    v4 = objc_alloc_init(FigCDSCALayerOutputNodeContentLayer);
    v2->layerInternal->var1 = v4;
    [(FigBaseCALayer *)v2 addSublayer:v4];
    v2->layerInternal->var2 = 0;
    if (!+[FigCaptionBackdropLayer isSupported])
    {
      layerInternal = v2->layerInternal;
      var2 = (FigCaptionBackdropLayer *)layerInternal->var2;
      if (!var2) {
        return v2;
      }
      goto LABEL_4;
    }
    var2 = objc_alloc_init(FigCaptionBackdropLayer);
    layerInternal = v2->layerInternal;
    layerInternal->var2 = var2;
    if (var2) {
LABEL_4:
    }
      [(FigBaseCALayer *)v2 insertSublayer:var2 below:layerInternal->var1];
  }
  return v2;
}

- (void)dealloc
{
  layerInternal = self->layerInternal;
  if (layerInternal)
  {

    v4 = self->layerInternal;
    if (v4) {
      free(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  [(FigCDSCALayerOutputNodeLayer *)&v5 dealloc];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(self->layerInternal->var1, "setBounds:", x, y, width, height);
  objc_msgSend(self->layerInternal->var1, "setPosition:", width * 0.5, height * 0.5);
  id var2 = self->layerInternal->var2;
  if (var2)
  {
    objc_msgSend(var2, "setBounds:", x, y, width, height);
    objc_msgSend(self->layerInternal->var2, "setPosition:", width * 0.5, height * 0.5);
    [self->layerInternal->var2 setHidden:0];
  }
  [MEMORY[0x1E4F39CF8] commit];
  v9.receiver = self;
  v9.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  -[FigCDSCALayerOutputNodeLayer setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (void)setPosition:(CGPoint)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FigCDSCALayerOutputNodeLayer;
  -[FigCDSCALayerOutputNodeLayer setPosition:](&v3, sel_setPosition_, a3.x, a3.y);
}

- (void)setContents:(id)a3
{
}

@end