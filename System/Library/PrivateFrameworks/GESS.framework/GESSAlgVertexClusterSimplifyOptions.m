@interface GESSAlgVertexClusterSimplifyOptions
- (GESSAlgVertexClusterSimplifyOptions)init;
- (float)voxelSize;
- (void)setVoxelSize:(float)a3;
@end

@implementation GESSAlgVertexClusterSimplifyOptions

- (GESSAlgVertexClusterSimplifyOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)GESSAlgVertexClusterSimplifyOptions;
  v2 = [(GESSAlgVertexClusterSimplifyOptions *)&v6 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1.0;
    [(GESSAlgVertexClusterSimplifyOptions *)v2 setVoxelSize:v3];
  }
  return v4;
}

- (float)voxelSize
{
  return self->voxelSize;
}

- (void)setVoxelSize:(float)a3
{
  self->voxelSize = a3;
}

@end