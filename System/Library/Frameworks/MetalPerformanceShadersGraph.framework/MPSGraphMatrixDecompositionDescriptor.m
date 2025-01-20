@interface MPSGraphMatrixDecompositionDescriptor
+ (id)descriptorWithDecompositionType:(unint64_t)a3 dataType:(unsigned int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)decompositionType;
- (unsigned)dataType;
- (void)setDataType:(unsigned int)a3;
- (void)setDecompositionType:(unint64_t)a3;
@end

@implementation MPSGraphMatrixDecompositionDescriptor

+ (id)descriptorWithDecompositionType:(unint64_t)a3 dataType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = objc_alloc_init(MPSGraphMatrixDecompositionDescriptor);
  [(MPSGraphMatrixDecompositionDescriptor *)v6 setDataType:v4];
  [(MPSGraphMatrixDecompositionDescriptor *)v6 setDecompositionType:a3];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [MPSGraphMatrixDecompositionDescriptor alloc];
  [(MPSGraphMatrixDecompositionDescriptor *)v4 setDataType:self->_dataType];
  [(MPSGraphMatrixDecompositionDescriptor *)v4 setDecompositionType:self->_decompositionType];
  return v4;
}

- (unint64_t)decompositionType
{
  return self->_decompositionType;
}

- (void)setDecompositionType:(unint64_t)a3
{
  self->_decompositionType = a3;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned int)a3
{
  self->_dataType = a3;
}

@end