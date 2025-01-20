@interface SCNMTLShadableKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation SCNMTLShadableKey

- (unint64_t)hash
{
  unint64_t v2 = ((uint64_t)&self->_geometry[12289054].var6
      + 64 * ((uint64_t)self->_material + 2654435769)
      + (((unint64_t)self->_material + 2654435769u) >> 2)
      + 1) ^ ((uint64_t)self->_material + 2654435769);
  return ((unint64_t)&self->_pipeline[12289054]._renderPassDesc.stencilFormat + 64 * v2 + (v2 >> 2) + 1) ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  return self->_material == (__C3DMaterial *)*((void *)a3 + 1)
      && self->_geometry == (__C3DGeometry *)*((void *)a3 + 2)
      && self->_pipeline == (SCNMTLRenderPipeline *)*((void *)a3 + 3);
}

@end