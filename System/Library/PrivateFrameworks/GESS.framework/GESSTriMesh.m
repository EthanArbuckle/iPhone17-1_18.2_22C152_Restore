@interface GESSTriMesh
- (BOOL)getFaces:(unsigned int *)a3 size:(unint64_t)a4;
- (BOOL)getPositions:(float *)a3 size:(unint64_t)a4;
- (BOOL)getTexCoordFaces:(unsigned int *)a3 size:(unint64_t)a4;
- (BOOL)getTexCoords:(float *)a3 size:(unint64_t)a4;
- (BOOL)getVertexColors:(float *)a3 size:(unint64_t)a4;
- (BOOL)getVertexNormalFaces:(unsigned int *)a3 size:(unint64_t)a4;
- (BOOL)getVertexNormals:(float *)a3 size:(unint64_t)a4;
- (GESSTriMesh)init;
- (void)meshImpl;
- (void)setMeshImpl:(const void *)a3;
@end

@implementation GESSTriMesh

- (GESSTriMesh)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSTriMesh;
  v2 = [(GESSTriMeshBase *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GESSPolyMesh *)v2 setMeshType:1];
  }
  return v3;
}

- (void)meshImpl
{
  v3.receiver = self;
  v3.super_class = (Class)GESSTriMesh;
  return [(GESSPolyMesh *)&v3 meshImpl];
}

- (void)setMeshImpl:(const void *)a3
{
  objc_super v3 = (std::__shared_weak_count *)*((void *)a3 + 1);
  uint64_t v5 = *(void *)a3;
  v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v4.receiver = self;
  v4.super_class = (Class)GESSTriMesh;
  [(GESSPolyMesh *)&v4 setMeshImpl:&v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (BOOL)getPositions:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self vertexSize];
  uint64_t v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:12 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getPositionData:v9];
  }
  return v8 == a4;
}

- (BOOL)getFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self faceSize];
  uint64_t v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:12 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getFaceData:v9];
  }
  return v8 == a4;
}

- (BOOL)getTexCoords:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self texCoordSize];
  uint64_t v8 = 2 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:8 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getTexCoordData:v9];
  }
  return v8 == a4;
}

- (BOOL)getTexCoordFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self faceSize];
  uint64_t v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:12 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getTexCoordFaceData:v9];
  }
  return v8 == a4;
}

- (BOOL)getVertexNormals:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self vertexNormalSize];
  uint64_t v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:12 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getVertexNormalData:v9];
  }
  return v8 == a4;
}

- (BOOL)getVertexNormalFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self faceSize];
  uint64_t v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:12 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getVertexNormalFaceData:v9];
  }
  return v8 == a4;
}

- (BOOL)getVertexColors:(float *)a3 size:(unint64_t)a4
{
  unsigned int v7 = [(GESSPolyMesh *)self vertexSize];
  uint64_t v8 = 3 * v7;
  if (v8 == a4)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:12 * v7 freeWhenDone:0];
    [(GESSPolyMesh *)self getVertexColorData:v9];
  }
  return v8 == a4;
}

@end