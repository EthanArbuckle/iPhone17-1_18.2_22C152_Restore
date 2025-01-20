@interface PHASETransmissionModelerView
- (PHASEEngine)engine;
- (PHASETransmissionModelerView)initWithEngine:(id)a3;
- (__n128)overrideGeometrySubdivisionForSource:subdivideGeometry:;
- (__n128)overrideMaximumSampleCountForSource:count:;
- (__n128)overrideSampleHistoryLengthForSource:length:;
- (__n128)overrideSampleSubdivisionIndexForSource:index:;
- (uint64_t)beginTrackingAudibleGeometryForSource:callback:;
- (uint64_t)beginTrackingSource:callback:;
- (uint64_t)overrideGeometrySubdivisionForSource:subdivideGeometry:;
- (uint64_t)overrideMaximumSampleCountForSource:count:;
- (uint64_t)overrideSampleHistoryLengthForSource:length:;
- (uint64_t)overrideSampleSubdivisionIndexForSource:index:;
- (void)beginTrackingAudibleGeometryForSource:(id)a3 callback:(id)a4;
- (void)beginTrackingAudibleGeometryForSource:callback:;
- (void)beginTrackingSource:(id)a3 callback:(id)a4;
- (void)beginTrackingSource:callback:;
- (void)endTrackingAudibleGeometryForSource:(id)a3;
- (void)endTrackingSource:(id)a3;
- (void)overrideGeometrySubdivisionForSource:(id)a3 subdivideGeometry:(BOOL)a4;
- (void)overrideGeometrySubdivisionForSource:subdivideGeometry:;
- (void)overrideMaximumSampleCountForSource:(id)a3 count:(int64_t)a4;
- (void)overrideMaximumSampleCountForSource:count:;
- (void)overrideSampleHistoryLengthForSource:(id)a3 length:(int64_t)a4;
- (void)overrideSampleHistoryLengthForSource:length:;
- (void)overrideSampleSubdivisionIndexForSource:(id)a3 index:(int64_t)a4;
- (void)overrideSampleSubdivisionIndexForSource:index:;
- (void)setEngine:(id)a3;
@end

@implementation PHASETransmissionModelerView

- (PHASETransmissionModelerView)initWithEngine:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[PHASETransmissionModelerView initWithEngine:]", "PHASETransmissionModelerView.mm", 130, "engine");
  }
  v7.receiver = self;
  v7.super_class = (Class)PHASETransmissionModelerView;
  v5 = [(PHASETransmissionModelerView *)&v7 init];
  objc_storeWeak((id *)&v5->_engine, v4);

  return v5;
}

- (void)beginTrackingSource:(id)a3 callback:(id)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 geoEntityHandle];
  v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v6 geoEntityHandle];
  v13[0] = &unk_26D479578;
  v13[1] = v8;
  v13[2] = _Block_copy(v9);
  v13[3] = v13;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 328))(v11, v12, v13);
  std::__function::__value_func<void ()(Phase::SpatialModeler::DirectPathTransmissionDebugger::RenderSourceView const*)>::~__value_func[abi:ne180100](v13);
}

- (void)endTrackingSource:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASETransmissionModelerView endTrackingSource:]", "PHASETransmissionModelerView.mm", 153, "source");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASETransmissionModelerView endTrackingSource:]", "PHASETransmissionModelerView.mm", 154, "source.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 344))(v8, [v9 geoEntityHandle]);
}

- (void)beginTrackingAudibleGeometryForSource:(id)a3 callback:(id)a4
{
  v15[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[PHASETransmissionModelerView beginTrackingAudibleGeometryForSource:callback:]", "PHASETransmissionModelerView.mm", 161, "source");
  }
  id v8 = [v6 engine];
  p_engine = &self->_engine;
  if (v8 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASETransmissionModelerView beginTrackingAudibleGeometryForSource:callback:]", "PHASETransmissionModelerView.mm", 162, "source.engine == _engine");
  }

  uint64_t v10 = [v6 geoEntityHandle];
  uint64_t v11 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v13 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v14 = [v6 geoEntityHandle];
  v15[0] = &unk_26D4795C0;
  v15[1] = v10;
  v15[2] = _Block_copy(v11);
  v15[3] = v15;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v13 + 352))(v13, v14, v15);
  std::__function::__value_func<void ()(Phase::SpatialModeler::DirectPathTransmissionDebugger::AudibleTriangleView const*)>::~__value_func[abi:ne180100](v15);
}

- (void)endTrackingAudibleGeometryForSource:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASETransmissionModelerView endTrackingAudibleGeometryForSource:]", "PHASETransmissionModelerView.mm", 197, "source");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASETransmissionModelerView endTrackingAudibleGeometryForSource:]", "PHASETransmissionModelerView.mm", 198, "source.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 368))(v8, [v9 geoEntityHandle]);
}

- (void)overrideMaximumSampleCountForSource:(id)a3 count:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v9 = [WeakRetained engineMode];

  if (v9)
  {
    uint64_t v11 = **(id **)(Phase::Logger::GetInstance(v10) + 432);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)&v14[4] = "PHASETransmissionModelerView.mm";
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 208;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideMaximumSampleCountForSource: Cannot be called when running Client/Server mode.", v14, 0x12u);
    }
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)([v12 implementation] + 48), 2);

    if (!v13) {
      __assert_rtn("-[PHASETransmissionModelerView overrideMaximumSampleCountForSource:count:]", "PHASETransmissionModelerView.mm", 213, "nullptr != geoSystem");
    }
    *(void *)uint64_t v14 = &unk_26D479608;
    *(void *)&v14[8] = [v6 geoEntityHandle];
    *(void *)&v14[16] = a4;
    v15 = v14;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, (uint64_t)v14);
    std::__function::__value_func<void ()(Phase::Geometry::SystemDebugger *)>::~__value_func[abi:ne180100](v14);
  }
}

- (void)overrideSampleHistoryLengthForSource:(id)a3 length:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v9 = [WeakRetained engineMode];

  if (v9)
  {
    uint64_t v11 = **(id **)(Phase::Logger::GetInstance(v10) + 432);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)&v14[4] = "PHASETransmissionModelerView.mm";
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 227;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideSampleHistoryLengthForSource: Cannot be called when running Client/Server mode.", v14, 0x12u);
    }
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)([v12 implementation] + 48), 2);

    if (!v13) {
      __assert_rtn("-[PHASETransmissionModelerView overrideSampleHistoryLengthForSource:length:]", "PHASETransmissionModelerView.mm", 232, "nullptr != geoSystem");
    }
    *(void *)uint64_t v14 = &unk_26D479650;
    *(void *)&v14[8] = [v6 geoEntityHandle];
    *(void *)&v14[16] = a4;
    v15 = v14;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, (uint64_t)v14);
    std::__function::__value_func<void ()(Phase::Geometry::SystemDebugger *)>::~__value_func[abi:ne180100](v14);
  }
}

- (void)overrideSampleSubdivisionIndexForSource:(id)a3 index:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v9 = [WeakRetained engineMode];

  if (v9)
  {
    uint64_t v11 = **(id **)(Phase::Logger::GetInstance(v10) + 432);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)&v14[4] = "PHASETransmissionModelerView.mm";
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 247;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideSampleSubdivisionIndexForSource: Cannot be called when running Client/Server mode.", v14, 0x12u);
    }
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)([v12 implementation] + 48), 2);

    if (!v13) {
      __assert_rtn("-[PHASETransmissionModelerView overrideSampleSubdivisionIndexForSource:index:]", "PHASETransmissionModelerView.mm", 252, "nullptr != geoSystem");
    }
    *(void *)uint64_t v14 = &unk_26D479698;
    *(void *)&v14[8] = [v6 geoEntityHandle];
    *(void *)&v14[16] = a4;
    v15 = v14;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, (uint64_t)v14);
    std::__function::__value_func<void ()(Phase::Geometry::SystemDebugger *)>::~__value_func[abi:ne180100](v14);
  }
}

- (void)overrideGeometrySubdivisionForSource:(id)a3 subdivideGeometry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v9 = [WeakRetained engineMode];

  if (v9)
  {
    uint64_t v11 = **(id **)(Phase::Logger::GetInstance(v10) + 432);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)&v14[4] = "PHASETransmissionModelerView.mm";
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = 266;
      _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideGeometrySubdivisionForSource: Cannot be called when running Client/Server mode.", v14, 0x12u);
    }
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)([v12 implementation] + 48), 2);

    if (!v13) {
      __assert_rtn("-[PHASETransmissionModelerView overrideGeometrySubdivisionForSource:subdivideGeometry:]", "PHASETransmissionModelerView.mm", 271, "nullptr != geoSystem");
    }
    *(void *)uint64_t v14 = &unk_26D4796E0;
    *(void *)&v14[8] = [v6 geoEntityHandle];
    *(void *)&v14[16] = v4;
    v15 = v14;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, (uint64_t)v14);
    std::__function::__value_func<void ()(Phase::Geometry::SystemDebugger *)>::~__value_func[abi:ne180100](v14);
  }
}

- (PHASEEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (PHASEEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
}

- (uint64_t)beginTrackingSource:callback:
{
  return a1;
}

- (void)beginTrackingSource:callback:
{
  v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 141, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *v2) {
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 142, "handle == inView->mSource");
  }
  BOOL v4 = [[PHASETransmissionModelerSourcePointSet alloc] initWithRenderSourceView:v2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (uint64_t)beginTrackingAudibleGeometryForSource:callback:
{
  return a1;
}

- (void)beginTrackingAudibleGeometryForSource:callback:
{
  v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 166, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *v2) {
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 167, "handle == inView->mSource");
  }
  id v16 = [MEMORY[0x263EFF980] arrayWithCapacity:v2[7]];
  unint64_t v3 = v2[7];
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0x7ABA4977B4617663;
    unint64_t v7 = 0x5BC180D1366118D2;
    do
    {
      uint64_t v8 = v2[2];
      uint64_t v9 = *(void *)(v8 + v4 + 40);
      if (v9)
      {
        uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(v8 + v4) length:36 * v9];
        uint64_t v11 = [PHASETriangleSet alloc];
        unint64_t v12 = (v6 >> 26) ^ ((v7 ^ (v7 << 23)) >> 17) ^ v6 ^ v7 ^ (v7 << 23);
        *(float *)&double v13 = (float)((float)(v12 + v6) * 5.421e-20) + 0.0;
        unint64_t v7 = ((v6 ^ (v6 << 23)) >> 17) ^ (v12 >> 26) ^ v6 ^ (v6 << 23) ^ v12;
        unint64_t v6 = ((v12 ^ (v12 << 23)) >> 17) ^ (v7 >> 26) ^ v12 ^ (v12 << 23) ^ v7;
        *((float *)&v13 + 1) = (float)((float)(v7 + v12) * 5.421e-20) + 0.0;
        uint64_t v14 = [(PHASETriangleSet *)v11 initWithTriangleData:v10 color:v13];
        [v16 addObject:v14];

        unint64_t v3 = v2[7];
      }
      ++v5;
      v4 += 48;
    }
    while (v3 > v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (void)overrideMaximumSampleCountForSource:count:
{
}

- (__n128)overrideMaximumSampleCountForSource:count:
{
  *(void *)a2 = &unk_26D479608;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideMaximumSampleCountForSource:count:
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = &v5;
  __n128 result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_DWORD *)result + 10) = v3;
  return result;
}

- (void)overrideSampleHistoryLengthForSource:length:
{
}

- (__n128)overrideSampleHistoryLengthForSource:length:
{
  *(void *)a2 = &unk_26D479650;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideSampleHistoryLengthForSource:length:
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = &v5;
  __n128 result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_DWORD *)result + 11) = v3;
  return result;
}

- (void)overrideSampleSubdivisionIndexForSource:index:
{
}

- (__n128)overrideSampleSubdivisionIndexForSource:index:
{
  *(void *)a2 = &unk_26D479698;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideSampleSubdivisionIndexForSource:index:
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = &v5;
  __n128 result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_DWORD *)result + 12) = v3;
  return result;
}

- (void)overrideGeometrySubdivisionForSource:subdivideGeometry:
{
}

- (__n128)overrideGeometrySubdivisionForSource:subdivideGeometry:
{
  *(void *)a2 = &unk_26D4796E0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideGeometrySubdivisionForSource:subdivideGeometry:
{
  uint64_t v2 = *a2;
  char v3 = *(unsigned char *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = &v5;
  __n128 result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((unsigned char *)result + 52) = v3;
  return result;
}

@end