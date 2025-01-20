@interface FigBaseCALayerHost
+ (id)defaultActionForKey:(id)a3;
- (BOOL)preventsChangesToSublayerHierarchy;
- (FigBaseCALayerHost)init;
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

@implementation FigBaseCALayerHost

- (FigBaseCALayerHost)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigBaseCALayerHost;
  return [(CALayerHost *)&v3 init];
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
    v3.super_class = (Class)FigBaseCALayerHost;
    [(FigBaseCALayerHost *)&v3 setSublayers:a3];
  }
}

- (void)addSublayer:(id)a3
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v3.receiver = self;
    v3.super_class = (Class)FigBaseCALayerHost;
    [(FigBaseCALayerHost *)&v3 addSublayer:a3];
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    [(FigBaseCALayerHost *)&v4 insertSublayer:a3 atIndex:*(void *)&a4];
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    [(FigBaseCALayerHost *)&v4 insertSublayer:a3 below:a4];
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    [(FigBaseCALayerHost *)&v4 insertSublayer:a3 above:a4];
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  if (!self->_preventsChangesToSublayerHierarchy)
  {
    v4.receiver = self;
    v4.super_class = (Class)FigBaseCALayerHost;
    [(FigBaseCALayerHost *)&v4 replaceSublayer:a3 with:a4];
  }
}

- (void)removeFromSuperlayer
{
  v2.receiver = self;
  v2.super_class = (Class)FigBaseCALayerHost;
  [(FigBaseCALayerHost *)&v2 removeFromSuperlayer];
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