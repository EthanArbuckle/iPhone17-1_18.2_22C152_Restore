@interface FigBaseCALayer
+ (id)defaultActionForKey:(id)a3;
- (BOOL)preventsChangesToSublayerHierarchy;
- (FigBaseCALayer)init;
- (FigBaseCALayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3;
- (float)getDisplayScale;
- (id)actionForKey:(id)a3;
- (id)getLayerDisplay;
- (void)addSublayer:(id)a3;
- (void)insertSublayer:(id)a3 above:(id)a4;
- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4;
- (void)insertSublayer:(id)a3 below:(id)a4;
- (void)removeFromSuperlayer;
- (void)replaceSublayer:(id)a3 with:(id)a4;
- (void)setNeedsDisplay;
- (void)setPreventsChangesToSublayerHierarchy:(BOOL)a3;
- (void)setSublayers:(id)a3;
@end

@implementation FigBaseCALayer

- (FigBaseCALayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)FigBaseCALayer;
  v2 = [(FigBaseCALayer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(FigBaseCALayer *)v2 getDisplayScale];
    [(FigBaseCALayer *)v3 setContentsScale:v4];
  }
  return v3;
}

- (FigBaseCALayer)initWithDeferredTransaction:(OpaqueFigDeferredTransaction *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigBaseCALayer;
  CFTypeRef cf = 0;
  float v4 = [(FigBaseCALayer *)&v7 init];
  if (!v4) {
    return v4;
  }
  if (!a3)
  {
    if (FigDeferredTransactionCreate(*MEMORY[0x1E4F1CF80], (uint64_t *)&cf))
    {
LABEL_6:

      if (cf) {
        CFRelease(cf);
      }
      return 0;
    }
    a3 = (OpaqueFigDeferredTransaction *)cf;
  }
  [(FigBaseCALayer *)v4 getDisplayScale];
  if (FBLSupportAppendDeferredTransactionChangeToSetContentsScaleForFigCALayer(a3, v4, (uint64_t)"-[FigBaseCALayer initWithDeferredTransaction:]", v5))goto LABEL_6; {
  if (cf)
  }
  {
    FigDeferredTransactionCommit((uint64_t)cf);
    CFRelease(cf);
  }
  return v4;
}

+ (id)defaultActionForKey:(id)a3
{
  return 0;
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)setSublayers:(id)a3
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v3.receiver = self;
    v3.super_class = (Class)FigBaseCALayer;
    [(FigBaseCALayer *)&v3 setSublayers:a3];
  }
}

- (void)addSublayer:(id)a3
{
  if (!self->_preventsChangesToSublayerHierarchy
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)FigBaseCALayer;
    [(FigBaseCALayer *)&v5 addSublayer:a3];
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayer;
    [(FigBaseCALayer *)&v4 insertSublayer:a3 atIndex:*(void *)&a4];
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  if (!self->_preventsChangesToSublayerHierarchy
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)FigBaseCALayer;
    [(FigBaseCALayer *)&v7 insertSublayer:a3 below:a4];
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayer;
    [(FigBaseCALayer *)&v4 insertSublayer:a3 above:a4];
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayer;
    [(FigBaseCALayer *)&v4 replaceSublayer:a3 with:a4];
  }
}

- (void)removeFromSuperlayer
{
  v2.receiver = self;
  v2.super_class = (Class)FigBaseCALayer;
  [(FigBaseCALayer *)&v2 removeFromSuperlayer];
}

- (id)getLayerDisplay
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v2 = objc_msgSend((id)-[FigBaseCALayer context](self, "context"), "options");
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F39E60]];
  if (v3)
  {
    uint64_t v4 = v3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v5 = objc_msgSend(MEMORY[0x1E4F39B60], "displays", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v11, "deviceName"), "isEqualToString:", v4)) {
            v8 = v11;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
      return v8;
    }
    return 0;
  }
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39B60], "displays"), "count")) {
    return 0;
  }
  v12 = (void *)[MEMORY[0x1E4F39B60] displays];

  return (id)[v12 objectAtIndex:0];
}

- (float)getDisplayScale
{
  if (registerOnce != -1) {
    dispatch_once(&registerOnce, &__block_literal_global_55);
  }
  return *(double *)&sMaxDisplayScale_0;
}

- (void)setNeedsDisplay
{
  if (registerOnce != -1) {
    dispatch_once(&registerOnce, &__block_literal_global_55);
  }
  float v3 = *(double *)&sMaxDisplayScale_0;
  [(FigBaseCALayer *)self contentsScale];
  if (v4 != v3) {
    -[FigBaseCALayer setContentsScale:](self, "setContentsScale:");
  }
  v5.receiver = self;
  v5.super_class = (Class)FigBaseCALayer;
  [(FigBaseCALayer *)&v5 setNeedsDisplay];
}

- (BOOL)preventsChangesToSublayerHierarchy
{
  return self->_preventsChangesToSublayerHierarchy;
}

- (void)setPreventsChangesToSublayerHierarchy:(BOOL)a3
{
  self->_preventsChangesToSublayerHierarchy = a3;
}

@end