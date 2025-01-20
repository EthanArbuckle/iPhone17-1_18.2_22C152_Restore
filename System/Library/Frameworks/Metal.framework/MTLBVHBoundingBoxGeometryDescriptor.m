@interface MTLBVHBoundingBoxGeometryDescriptor
- (NSArray)boundingBoxBuffers;
- (unint64_t)boundingBoxStride;
- (unint64_t)primitiveType;
- (void)setBoundingBoxBuffers:(id)a3;
- (void)setBoundingBoxStride:(unint64_t)a3;
@end

@implementation MTLBVHBoundingBoxGeometryDescriptor

- (unint64_t)primitiveType
{
  return 1;
}

- (NSArray)boundingBoxBuffers
{
  return (NSArray *)objc_loadWeak((id *)&self->_boundingBoxBuffers);
}

- (void)setBoundingBoxBuffers:(id)a3
{
}

- (unint64_t)boundingBoxStride
{
  return self->_boundingBoxStride;
}

- (void)setBoundingBoxStride:(unint64_t)a3
{
  self->_boundingBoxStride = a3;
}

- (void).cxx_destruct
{
}

@end