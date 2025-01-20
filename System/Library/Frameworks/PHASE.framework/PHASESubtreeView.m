@interface PHASESubtreeView
- (Handle64)geoShapeHandle;
- (NSArray)levels;
- (PHASEEngine)engine;
- (PHASESubtreeView)init;
- (PHASESubtreeView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5 subtreeIndex:(int64_t)a6;
- (id).cxx_construct;
- (int64_t)subtreeIndex;
- (void)setEngine:(id)a3;
- (void)setGeoShapeHandle:(Handle64)a3;
- (void)setSubtreeIndex:(int64_t)a3;
@end

@implementation PHASESubtreeView

- (PHASESubtreeView)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASESubtreeView;
  return [(PHASESubtreeView *)&v3 init];
}

- (PHASESubtreeView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5 subtreeIndex:(int64_t)a6
{
  id v10 = a3;
  if (!v10) {
    __assert_rtn("-[PHASESubtreeView initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:]", "PHASEGeometryView.mm", 200, "engine");
  }
  uint64_t v11 = *(void *)(*(void *)a5 + 48 * a6 + 40);
  v12 = [MEMORY[0x263EFF980] arrayWithCapacity:v11];
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      v14 = [[PHASEVoxelLevelView alloc] initWithEngine:v10 shapeHandle:a4.mData voxelTreeInfo:a5 subtreeIndex:a6 levelIndex:i];
      [v12 setObject:v14 atIndexedSubscript:i];
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PHASESubtreeView;
  v15 = [(PHASESubtreeView *)&v19 init];
  objc_storeWeak((id *)&v15->_engine, v10);
  v15->_geoShapeHandle = a4;
  v15->_subtreeIndex = a6;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v12];
  levels = v15->_levels;
  v15->_levels = (NSArray *)v16;

  return v15;
}

- (NSArray)levels
{
  return self->_levels;
}

- (PHASEEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (PHASEEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (Handle64)geoShapeHandle
{
  return self->_geoShapeHandle;
}

- (void)setGeoShapeHandle:(Handle64)a3
{
  self->_geoShapeHandle = a3;
}

- (int64_t)subtreeIndex
{
  return self->_subtreeIndex;
}

- (void)setSubtreeIndex:(int64_t)a3
{
  self->_subtreeIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);

  objc_storeStrong((id *)&self->_levels, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end