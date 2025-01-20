@interface FigBaseCABackdropLayer
+ (id)defaultActionForKey:(id)a3;
- (BOOL)preventsChangesToSublayerHierarchy;
- (FigBaseCABackdropLayer)init;
- (id)actionForKey:(id)a3;
- (void)addSublayer:(id)a3;
- (void)insertSublayer:(id)a3 above:(id)a4;
- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4;
- (void)insertSublayer:(id)a3 below:(id)a4;
- (void)removeFromSuperlayer;
- (void)replaceSublayer:(id)a3 with:(id)a4;
- (void)setPreventsChangesToSublayerHierarchy:(BOOL)a3;
- (void)setSublayers:(id)a3;
@end

@implementation FigBaseCABackdropLayer

- (FigBaseCABackdropLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigBaseCABackdropLayer;
  return [(FigBaseCABackdropLayer *)&v3 init];
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
  if (!*(&self->super._disablesOccludedBackdropBlurs + 1))
  {
    v3.receiver = self;
    v3.super_class = (Class)FigBaseCABackdropLayer;
    [(FigBaseCABackdropLayer *)&v3 setSublayers:a3];
  }
}

- (void)addSublayer:(id)a3
{
  if (!*(&self->super._disablesOccludedBackdropBlurs + 1))
  {
    v3.receiver = self;
    v3.super_class = (Class)FigBaseCABackdropLayer;
    [(FigBaseCABackdropLayer *)&v3 addSublayer:a3];
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  if (!*(&self->super._disablesOccludedBackdropBlurs + 1))
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCABackdropLayer;
    [(FigBaseCABackdropLayer *)&v4 insertSublayer:a3 atIndex:*(void *)&a4];
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  if (!*(&self->super._disablesOccludedBackdropBlurs + 1))
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCABackdropLayer;
    [(FigBaseCABackdropLayer *)&v4 insertSublayer:a3 below:a4];
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  if (!*(&self->super._disablesOccludedBackdropBlurs + 1))
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCABackdropLayer;
    [(FigBaseCABackdropLayer *)&v4 insertSublayer:a3 above:a4];
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  if (!*(&self->super._disablesOccludedBackdropBlurs + 1))
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCABackdropLayer;
    [(FigBaseCABackdropLayer *)&v4 replaceSublayer:a3 with:a4];
  }
}

- (void)removeFromSuperlayer
{
  v2.receiver = self;
  v2.super_class = (Class)FigBaseCABackdropLayer;
  [(FigBaseCABackdropLayer *)&v2 removeFromSuperlayer];
}

- (BOOL)preventsChangesToSublayerHierarchy
{
  return *(&self->super._disablesOccludedBackdropBlurs + 1);
}

- (void)setPreventsChangesToSublayerHierarchy:(BOOL)a3
{
  *(&self->super._disablesOccludedBackdropBlurs + 1) = a3;
}

@end