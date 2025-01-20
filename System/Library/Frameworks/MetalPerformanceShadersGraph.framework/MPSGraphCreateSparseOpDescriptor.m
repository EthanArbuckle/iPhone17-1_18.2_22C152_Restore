@interface MPSGraphCreateSparseOpDescriptor
+ (MPSGraphCreateSparseOpDescriptor)descriptorWithStorageType:(MPSGraphSparseStorageType)sparseStorageType dataType:(MPSDataType)dataType;
- (MPSDataType)dataType;
- (MPSGraphSparseStorageType)sparseStorageType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDataType:(MPSDataType)dataType;
- (void)setSparseStorageType:(MPSGraphSparseStorageType)sparseStorageType;
@end

@implementation MPSGraphCreateSparseOpDescriptor

+ (MPSGraphCreateSparseOpDescriptor)descriptorWithStorageType:(MPSGraphSparseStorageType)sparseStorageType dataType:(MPSDataType)dataType
{
  uint64_t v4 = *(void *)&dataType;
  v6 = objc_alloc_init(MPSGraphCreateSparseOpDescriptor);
  [(MPSGraphCreateSparseOpDescriptor *)v6 setSparseStorageType:sparseStorageType];
  [(MPSGraphCreateSparseOpDescriptor *)v6 setDataType:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [MPSGraphCreateSparseOpDescriptor alloc];
  [(MPSGraphCreateSparseOpDescriptor *)v4 setSparseStorageType:self->_sparseStorageType];
  [(MPSGraphCreateSparseOpDescriptor *)v4 setDataType:self->_dataType];
  return v4;
}

- (MPSGraphSparseStorageType)sparseStorageType
{
  return self->_sparseStorageType;
}

- (void)setSparseStorageType:(MPSGraphSparseStorageType)sparseStorageType
{
  self->_sparseStorageType = sparseStorageType;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (void)setDataType:(MPSDataType)dataType
{
  self->_dataType = dataType;
}

@end