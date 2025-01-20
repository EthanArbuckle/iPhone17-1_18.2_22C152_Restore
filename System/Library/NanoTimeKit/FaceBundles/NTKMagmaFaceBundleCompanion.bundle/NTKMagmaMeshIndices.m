@interface NTKMagmaMeshIndices
- (MTLBuffer)indices;
- (int)indexCt;
- (void)setIndexCt:(int)a3;
- (void)setIndices:(id)a3;
@end

@implementation NTKMagmaMeshIndices

- (MTLBuffer)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
}

- (int)indexCt
{
  return self->_indexCt;
}

- (void)setIndexCt:(int)a3
{
  self->_indexCt = a3;
}

- (void).cxx_destruct
{
}

@end