@interface PHASEVoxelLevelView
- (Handle64)geoShapeHandle;
- (PHASEEngine)engine;
- (PHASEVoxelLevelView)init;
- (PHASEVoxelLevelView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5 subtreeIndex:(int64_t)a6 levelIndex:(int64_t)a7;
- (__n128)dimensions;
- (__n128)offset;
- (__n128)voxelSize;
- (id).cxx_construct;
- (int64_t)levelIndex;
- (int64_t)subtreeIndex;
- (uint64_t)getVoxelsWithCallback:;
- (void)getVoxelsWithCallback:;
- (void)getVoxelsWithCallback:(id)a3;
- (void)setEngine:(id)a3;
- (void)setGeoShapeHandle:(Handle64)a3;
- (void)setLevelIndex:(int64_t)a3;
- (void)setSubtreeIndex:(int64_t)a3;
@end

@implementation PHASEVoxelLevelView

- (PHASEVoxelLevelView)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEVoxelLevelView;
  return [(PHASEVoxelLevelView *)&v3 init];
}

- (PHASEVoxelLevelView)initWithEngine:(id)a3 shapeHandle:(Handle64)a4 voxelTreeInfo:(const void *)a5 subtreeIndex:(int64_t)a6 levelIndex:(int64_t)a7
{
  id v12 = a3;
  if (!v12) {
    __assert_rtn("-[PHASEVoxelLevelView initWithEngine:shapeHandle:voxelTreeInfo:subtreeIndex:levelIndex:]", "PHASEGeometryView.mm", 154, "engine");
  }
  uint64_t v13 = *(void *)(*(void *)a5 + 48 * a6);
  v17.receiver = self;
  v17.super_class = (Class)PHASEVoxelLevelView;
  v14 = [(PHASEVoxelLevelView *)&v17 init];
  v15 = (_OWORD *)(v13 + 48 * a7);
  objc_storeWeak((id *)&v14->_engine, v12);
  v14->_geoShapeHandle = a4;
  v14->_subtreeIndex = a6;
  v14->_levelIndex = a7;
  *(_OWORD *)v14->_dimensions = v15[2];
  *(_OWORD *)v14->_offset = *v15;
  *(_OWORD *)v14->_voxelSize = v15[1];

  return v14;
}

- (void)getVoxelsWithCallback:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _Block_copy(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v7 = *(void *)([WeakRetained implementation] + 368);
  v8.mData = (unint64_t)[(PHASEVoxelLevelView *)self geoShapeHandle];
  int64_t v9 = [(PHASEVoxelLevelView *)self subtreeIndex];
  int64_t v10 = [(PHASEVoxelLevelView *)self levelIndex];
  v11[0] = &unk_26D478ED8;
  v11[1] = _Block_copy(v5);
  v11[3] = v11;
  (*(void (**)(uint64_t, Handle64, int64_t, int64_t, void *))(*(void *)v7 + 392))(v7, v8, v9, v10, v11);
  std::__function::__value_func<void ()(unsigned long,Phase::Vector<unsigned short,3ul> *)>::~__value_func[abi:ne180100](v11);
}

- (__n128)dimensions
{
  return a1[3];
}

- (__n128)offset
{
  return a1[4];
}

- (__n128)voxelSize
{
  return a1[5];
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

- (int64_t)levelIndex
{
  return self->_levelIndex;
}

- (void)setLevelIndex:(int64_t)a3
{
  self->_levelIndex = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (uint64_t)getVoxelsWithCallback:
{
  return a1;
}

- (void)getVoxelsWithCallback:
{
  id v4 = [[PHASEVoxelSet3D alloc] initWithPoints:*a3 count:*a2];
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
}

@end