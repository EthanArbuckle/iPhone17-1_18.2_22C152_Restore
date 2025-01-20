@interface NTKMagmaMesh
- (NTKMagmaMeshIndices)indices;
- (NTKMagmaMeshVertices)vertices;
- (void)setIndices:(id)a3;
- (void)setVertices:(id)a3;
@end

@implementation NTKMagmaMesh

- (NTKMagmaMeshIndices)indices
{
  return self->_indices;
}

- (void)setIndices:(id)a3
{
}

- (NTKMagmaMeshVertices)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertices, 0);

  objc_storeStrong((id *)&self->_indices, 0);
}

@end