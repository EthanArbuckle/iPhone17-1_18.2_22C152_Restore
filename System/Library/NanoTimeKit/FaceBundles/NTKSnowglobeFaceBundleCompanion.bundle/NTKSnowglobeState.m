@interface NTKSnowglobeState
- (BOOL)editing;
- (BOOL)idealizedState;
- (BOOL)scenePaused;
- (BOOL)shouldBeInIdealizedState;
- (NTKSnowglobeColors)palette;
- (NTKSnowglobeState)init;
- (double)backgroundObjectOpacity;
- (double)parallaxMultiplier;
- (double)tritiumFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)withBackgroundObjectOpacity:(double)a3;
- (id)withIdealizedState:(BOOL)a3 editing:(BOOL)a4;
- (id)withPalette:(id)a3;
- (id)withTritiumState:(unint64_t)a3 fraction:(double)a4;
- (unint64_t)tritiumState;
@end

@implementation NTKSnowglobeState

- (NTKSnowglobeState)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSnowglobeState;
  v2 = [(NTKSnowglobeState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    palette = v2->_palette;
    v2->_palette = 0;

    *(_WORD *)&v3->_idealizedState = 0;
    v3->_tritiumFraction = 0.0;
    v3->_backgroundObjectOpacity = 0.0;
    v3->_tritiumState = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(NTKSnowglobeState);
  if (v4)
  {
    uint64_t v5 = [(NTKSnowglobeState *)self palette];
    palette = v4->_palette;
    v4->_palette = (NTKSnowglobeColors *)v5;

    v4->_tritiumState = [(NTKSnowglobeState *)self tritiumState];
    [(NTKSnowglobeState *)self tritiumFraction];
    v4->_tritiumFraction = v7;
    [(NTKSnowglobeState *)self backgroundObjectOpacity];
    v4->_backgroundObjectOpacity = v8;
    v4->_idealizedState = [(NTKSnowglobeState *)self idealizedState];
    v4->_editing = [(NTKSnowglobeState *)self editing];
  }
  return v4;
}

- (id)withIdealizedState:(BOOL)a3 editing:(BOOL)a4
{
  objc_super v6 = (unsigned char *)[(NTKSnowglobeState *)self copy];
  v6[8] = a3;
  v6[9] = a4;

  return v6;
}

- (id)withPalette:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NTKSnowglobeState *)self copy];
  objc_super v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (id)withTritiumState:(unint64_t)a3 fraction:(double)a4
{
  uint64_t v6 = [(NTKSnowglobeState *)self copy];
  *(void *)(v6 + 24) = a3;
  *(double *)(v6 + 32) = a4;

  return (id)v6;
}

- (id)withBackgroundObjectOpacity:(double)a3
{
  id v4 = (double *)[(NTKSnowglobeState *)self copy];
  v4[5] = a3;

  return v4;
}

- (BOOL)scenePaused
{
  return self->_idealizedState || self->_editing || (self->_tritiumState & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (double)parallaxMultiplier
{
  double result = 0.0;
  if (!self->_idealizedState && !self->_editing && self->_tritiumState != 1) {
    return 1.0 - self->_tritiumFraction;
  }
  return result;
}

- (BOOL)shouldBeInIdealizedState
{
  return self->_idealizedState || self->_editing || self->_tritiumState == 1;
}

- (NTKSnowglobeColors)palette
{
  return self->_palette;
}

- (unint64_t)tritiumState
{
  return self->_tritiumState;
}

- (double)tritiumFraction
{
  return self->_tritiumFraction;
}

- (double)backgroundObjectOpacity
{
  return self->_backgroundObjectOpacity;
}

- (BOOL)idealizedState
{
  return self->_idealizedState;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void).cxx_destruct
{
}

@end