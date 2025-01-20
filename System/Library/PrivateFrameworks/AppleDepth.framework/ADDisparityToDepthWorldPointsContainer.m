@interface ADDisparityToDepthWorldPointsContainer
- (ADDisparityToDepthFitWorldPoint)getPointFromContainer:(int)a3;
- (ADDisparityToDepthWorldPointsContainer)initWithParameters:(id)a3;
- (id).cxx_construct;
- (unint64_t)size;
- (void)push:(ADDisparityToDepthFitWorldPoint *)a3 pointCount:(unint64_t)a4;
@end

@implementation ADDisparityToDepthWorldPointsContainer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_worldPoints.__ptr_.__value_;
  self->_worldPoints.__ptr_.__value_ = 0;
  if (value)
  {
    v3 = (void *)*((void *)value + 4);
    if (v3)
    {
      *((void *)value + 5) = v3;
      operator delete(v3);
    }
    v4 = *(void **)value;
    if (*(void *)value)
    {
      *((void *)value + 1) = v4;
      operator delete(v4);
    }
    JUMPOUT(0x2166C5D90);
  }
}

- (ADDisparityToDepthFitWorldPoint)getPointFromContainer:(int)a3
{
  uint64_t v5 = v3;
  DisparityToDepth::WorldPointsContainer::vector((DisparityToDepth::WorldPointsContainer *)self->_worldPoints.__ptr_.__value_, &v10);
  v6 = v10;
  v7 = v11;
  if (v10 == v11)
  {
LABEL_5:
    *(void *)uint64_t v5 = 0;
    *(void *)(v5 + 8) = 0;
    *(void *)(v5 + 16) = 0xFFFFFFFF00000000;
  }
  else
  {
    v8 = v10;
    while (1)
    {
      long long v9 = *((_OWORD *)v8 + 1);
      *(_OWORD *)uint64_t v5 = *(_OWORD *)v8;
      *(_OWORD *)(v5 + 16) = v9;
      if (*(_DWORD *)(v5 + 20) == a3) {
        break;
      }
      v8 += 32;
      if (v8 == v7) {
        goto LABEL_5;
      }
    }
  }
  if (v6)
  {
    operator delete(v6);
  }
  return (ADDisparityToDepthFitWorldPoint)v6;
}

- (void)push:(ADDisparityToDepthFitWorldPoint *)a3 pointCount:(unint64_t)a4
{
}

- (unint64_t)size
{
  DisparityToDepth::WorldPointsContainer::vector((DisparityToDepth::WorldPointsContainer *)self->_worldPoints.__ptr_.__value_, v5);
  v2 = v5[0];
  uint64_t v3 = v5[1];
  if (v5[0]) {
    operator delete(v5[0]);
  }
  return (v3 - v2) >> 5;
}

- (ADDisparityToDepthWorldPointsContainer)initWithParameters:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ADDisparityToDepthWorldPointsContainer;
  if ([(ADDisparityToDepthWorldPointsContainer *)&v6 init]) {
    operator new();
  }

  return 0;
}

@end