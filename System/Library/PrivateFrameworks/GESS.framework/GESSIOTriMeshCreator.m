@interface GESSIOTriMeshCreator
- (BOOL)create:(id)a3;
- (BOOL)setFaceGroupIDs:(unsigned __int16 *)a3 size:(unint64_t)a4;
- (BOOL)setFaces:(unsigned int *)a3 size:(unint64_t)a4;
- (BOOL)setPositions:(float *)a3 size:(unint64_t)a4;
- (BOOL)setTexCoordFaces:(unsigned int *)a3 size:(unint64_t)a4;
- (BOOL)setTexCoords:(float *)a3 size:(unint64_t)a4;
- (BOOL)setVertexColors:(float *)a3 size:(unint64_t)a4;
- (BOOL)setVertexNormalFaces:(unsigned int *)a3 size:(unint64_t)a4;
- (BOOL)setVertexNormals:(float *)a3 size:(unint64_t)a4;
@end

@implementation GESSIOTriMeshCreator

- (BOOL)setPositions:(float *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setPositionData:v5];

  return v6;
}

- (BOOL)setFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setFaceData:v5];

  return v6;
}

- (BOOL)setVertexNormals:(float *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setVertexNormalData:v5];

  return v6;
}

- (BOOL)setVertexNormalFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setVertexNormalFaceData:v5];

  return v6;
}

- (BOOL)setVertexColors:(float *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setVertexColorData:v5];

  return v6;
}

- (BOOL)setTexCoords:(float *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setTexCoordData:v5];

  return v6;
}

- (BOOL)setTexCoordFaces:(unsigned int *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:4 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setTexCoordFaceData:v5];

  return v6;
}

- (BOOL)setFaceGroupIDs:(unsigned __int16 *)a3 size:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:2 * a4 freeWhenDone:0];
  BOOL v6 = [(GESSIOPolyMeshCreator *)self setFaceGroupIDData:v5];

  return v6;
}

- (BOOL)create:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GESSIOTriMeshCreator;
  return [(GESSIOPolyMeshCreator *)&v4 create:a3];
}

@end