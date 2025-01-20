@interface FigSubtitleBackdropCALayerContentLayer
- (FigSubtitleBackdropCALayerContentLayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)dealloc;
@end

@implementation FigSubtitleBackdropCALayerContentLayer

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4);
}

- (FigSubtitleBackdropCALayerContentLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)FigSubtitleBackdropCALayerContentLayer;
  v2 = [(FigBaseCALayer *)&v5 init];
  if (v2)
  {
    v3 = (OpaqueFigSubtitleBackdropCALayerContentLayerInternal *)malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
    v2->layerInternal = v3;
    v3->var0 = v2;
  }
  return v2;
}

- (void)dealloc
{
  layerInternal = self->layerInternal;
  if (layerInternal) {
    free(layerInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)FigSubtitleBackdropCALayerContentLayer;
  [(FigSubtitleBackdropCALayerContentLayer *)&v4 dealloc];
}

@end