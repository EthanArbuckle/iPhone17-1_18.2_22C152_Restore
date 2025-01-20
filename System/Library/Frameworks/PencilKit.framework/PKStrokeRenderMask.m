@interface PKStrokeRenderMask
- (PKStroke)stroke;
- (PKStrokeRenderCache)renderCache;
- (PKStrokeRenderMask)initWithStroke:(id)a3 renderCache:(id)a4 maskPaths:(const void *)a5;
- (const)maskPaths;
- (id).cxx_construct;
@end

@implementation PKStrokeRenderMask

- (PKStrokeRenderMask)initWithStroke:(id)a3 renderCache:(id)a4 maskPaths:(const void *)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKStrokeRenderMask;
  v11 = [(PKStrokeRenderMask *)&v15 init];
  v12 = v11;
  if (v11)
  {
    uint64_t p_maskPaths = (uint64_t)&v11->_maskPaths;
    if (&v12->_maskPaths != a5) {
      std::vector<std::vector<ClipperLib::IntPoint>>::__assign_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(p_maskPaths, *(void *)a5, *((void *)a5 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3));
    }
    objc_storeStrong((id *)&v12->_stroke, a3);
    objc_storeStrong((id *)&v12->_renderCache, a4);
  }

  return v12;
}

- (const)maskPaths
{
  return &self->_maskPaths;
}

- (PKStroke)stroke
{
  return self->_stroke;
}

- (PKStrokeRenderCache)renderCache
{
  return self->_renderCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderCache, 0);
  objc_storeStrong((id *)&self->_stroke, 0);
  uint64_t p_maskPaths = &self->_maskPaths;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_maskPaths);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end