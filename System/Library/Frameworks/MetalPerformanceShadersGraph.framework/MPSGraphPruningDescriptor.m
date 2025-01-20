@interface MPSGraphPruningDescriptor
+ (id)descriptorWithPruningMetric:(int64_t)a3 sparsityFormat:(int64_t)a4 sparsity:(float)a5;
- (float)sparsity;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pruningMetric;
- (int64_t)pruningStructure;
- (void)setPruningMetric:(int64_t)a3;
- (void)setPruningStructure:(int64_t)a3;
- (void)setSparsity:(float)a3;
@end

@implementation MPSGraphPruningDescriptor

+ (id)descriptorWithPruningMetric:(int64_t)a3 sparsityFormat:(int64_t)a4 sparsity:(float)a5
{
  v8 = objc_alloc_init(MPSGraphPruningDescriptor);
  [(MPSGraphPruningDescriptor *)v8 setPruningMetric:a3];
  [(MPSGraphPruningDescriptor *)v8 setPruningStructure:a4];
  *(float *)&double v9 = a5;
  [(MPSGraphPruningDescriptor *)v8 setSparsity:v9];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MPSGraphPruningDescriptor);
  [(MPSGraphPruningDescriptor *)v4 setPruningMetric:self->_pruningMetric];
  [(MPSGraphPruningDescriptor *)v4 setPruningStructure:self->_pruningStructure];
  *(float *)&double v5 = self->_sparsity;
  [(MPSGraphPruningDescriptor *)v4 setSparsity:v5];
  return v4;
}

- (float)sparsity
{
  return self->_sparsity;
}

- (void)setSparsity:(float)a3
{
  self->_sparsity = a3;
}

- (int64_t)pruningMetric
{
  return self->_pruningMetric;
}

- (void)setPruningMetric:(int64_t)a3
{
  self->_pruningMetric = a3;
}

- (int64_t)pruningStructure
{
  return self->_pruningStructure;
}

- (void)setPruningStructure:(int64_t)a3
{
  self->_pruningStructure = a3;
}

@end