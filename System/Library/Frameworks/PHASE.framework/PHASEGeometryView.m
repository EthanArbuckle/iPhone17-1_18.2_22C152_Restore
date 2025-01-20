@interface PHASEGeometryView
+ (uint64_t)geometryViewWithObject:index:callback:;
+ (void)geometryViewWithObject:(id)a3 index:(unint64_t)a4 callback:(id)a5;
+ (void)geometryViewWithObject:index:callback:;
- (Handle64)geoShapeHandle;
- (PHASEEngine)engine;
- (PHASEGeometryView)init;
- (PHASEGeometryView)initWithEngine:(id)a3 handle:(Handle64)a4;
- (id).cxx_construct;
- (void)setEngine:(id)a3;
- (void)setGeoShapeHandle:(Handle64)a3;
@end

@implementation PHASEGeometryView

- (PHASEGeometryView)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEGeometryView;
  return [(PHASEGeometryView *)&v3 init];
}

- (PHASEGeometryView)initWithEngine:(id)a3 handle:(Handle64)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASEGeometryView;
  v7 = [(PHASEGeometryView *)&v9 init];
  objc_storeWeak((id *)&v7->_engine, v6);
  v7->_geoShapeHandle = a4;

  return v7;
}

+ (void)geometryViewWithObject:(id)a3 index:(unint64_t)a4 callback:(id)a5
{
  v21[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (!v7) {
    __assert_rtn("+[PHASEGeometryView geometryViewWithObject:index:callback:]", "PHASEGeometryView.mm", 298, "object");
  }
  objc_super v9 = [v7 engine];
  if (!v9) {
    __assert_rtn("+[PHASEGeometryView geometryViewWithObject:index:callback:]", "PHASEGeometryView.mm", 299, "object.engine");
  }

  v10 = [v7 geoShapeHandles];
  if ([v10 count] <= a4) {
    __assert_rtn("+[PHASEGeometryView geometryViewWithObject:index:callback:]", "PHASEGeometryView.mm", 301, "index < object.geoShapeHandles.count");
  }

  v11 = [v7 geoShapeHandles];
  v12 = [v11 objectAtIndexedSubscript:a4];
  uint64_t v13 = [v12 unsignedLongLongValue];

  v14 = [v7 engine];
  v15 = _Block_copy(v8);
  v16 = [v7 engine];
  uint64_t v17 = *(void *)([v16 implementation] + 368);
  id v18 = v14;
  v19 = _Block_copy(v15);
  v20 = operator new(0x20uLL);
  void *v20 = &unk_26D478F20;
  v20[1] = v13;
  v20[2] = v18;
  v20[3] = v19;
  v21[3] = v20;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v17 + 376))(v17, v13, v21);
  std::__function::__value_func<void ()(unsigned int,void const*)>::~__value_func[abi:ne180100](v21);
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

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

+ (uint64_t)geometryViewWithObject:index:callback:
{
  return a1;
}

+ (void)geometryViewWithObject:index:callback:
{
  if (!*a3) {
    goto LABEL_5;
  }
  if (*a2 == 2)
  {
    v4 = [[PHASEVoxelTreeView alloc] initWithEngine:a1[2] shapeHandle:a1[1] voxelTreeInfo:*a3];
    goto LABEL_7;
  }
  if (*a2 != 1)
  {
LABEL_5:
    v5 = 0;
    goto LABEL_8;
  }
  v4 = [[PHASEMeshView alloc] initWithEngine:a1[2] handle:a1[1]];
LABEL_7:
  v5 = v4;
LABEL_8:
  id v6 = v5;
  (*(void (**)(void))(a1[3] + 16))();
}

@end