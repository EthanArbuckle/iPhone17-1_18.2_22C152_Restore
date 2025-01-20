@interface NTKMagmaMeshVertices
- (MTLBuffer)vertices;
- (int)vertexCount;
- (void)setVertexCount:(int)a3;
- (void)setVertices:(id)a3;
@end

@implementation NTKMagmaMeshVertices

- (MTLBuffer)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
}

- (int)vertexCount
{
  return self->_vertexCount;
}

- (void)setVertexCount:(int)a3
{
  self->_vertexCount = a3;
}

- (void).cxx_destruct
{
}

@end