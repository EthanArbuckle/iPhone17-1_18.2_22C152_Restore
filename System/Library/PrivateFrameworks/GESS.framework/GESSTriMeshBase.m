@interface GESSTriMeshBase
- (GESSTriMeshBase)init;
@end

@implementation GESSTriMeshBase

- (GESSTriMeshBase)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSTriMeshBase;
  v2 = [(GESSPolyMesh *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GESSPolyMesh *)v2 setMeshType:0];
  }
  return v3;
}

@end