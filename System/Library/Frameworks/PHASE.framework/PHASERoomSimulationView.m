@interface PHASERoomSimulationView
- (PHASEEngine)engine;
- (PHASERoomSimulationView)initWithEngine:(id)a3;
- (id).cxx_construct;
- (uint64_t)beginTrackingEnergyHistogram:callback:;
- (uint64_t)beginTrackingImageSourceLocations:callback:;
- (uint64_t)beginTrackingListenerEarlyResponseMetadata:callback:;
- (uint64_t)beginTrackingListenerLateReverbMetadata:callback:;
- (uint64_t)beginTrackingRayTraceIntersections:callback:;
- (uint64_t)beginTrackingRoomData:callback:;
- (void)beginTrackingEnergyHistogram:(id)a3 callback:(id)a4;
- (void)beginTrackingEnergyHistogram:callback:;
- (void)beginTrackingImageSourceLocations:(id)a3 callback:(id)a4;
- (void)beginTrackingImageSourceLocations:callback:;
- (void)beginTrackingListenerEarlyResponseMetadata:(id)a3 callback:(id)a4;
- (void)beginTrackingListenerEarlyResponseMetadata:callback:;
- (void)beginTrackingListenerLateReverbMetadata:(id)a3 callback:(id)a4;
- (void)beginTrackingListenerLateReverbMetadata:callback:;
- (void)beginTrackingRayTraceIntersections:(id)a3 callback:(id)a4;
- (void)beginTrackingRayTraceIntersections:callback:;
- (void)beginTrackingRoomData:(id)a3 callback:(id)a4;
- (void)beginTrackingRoomData:callback:;
- (void)endTrackingEnergyHistogram:(id)a3;
- (void)endTrackingImageSourceLocations:(id)a3;
- (void)endTrackingListenerEarlyResponseMetadata:(id)a3;
- (void)endTrackingListenerLateReverbMetadata:(id)a3;
- (void)endTrackingRayTraceIntersections:(id)a3;
- (void)endTrackingRoomData:(id)a3;
- (void)setEarlyReflectionsAggregationCoef:(float)a3;
- (void)setEarlyReflectionsRayTraceComputeTimeLimit:(float)a3;
- (void)setEarlyScatteringAggregationCoef:(float)a3;
- (void)setEarlyScatteringEnabled:(unint64_t)a3;
- (void)setEngine:(id)a3;
- (void)setImageSourceOrder:(unint64_t)a3;
- (void)setLateReverbAggregationCoef:(float)a3;
- (void)setLateReverbRayTraceComputeTimeLimit:(float)a3;
- (void)setRayTraceIntersectionHandleCountLimit:(unint64_t)a3;
- (void)setTailcorrectionEnabled:(unint64_t)a3;
@end

@implementation PHASERoomSimulationView

- (PHASERoomSimulationView)initWithEngine:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[PHASERoomSimulationView initWithEngine:]", "PHASERoomSimulationView.mm", 318, "engine");
  }
  v7.receiver = self;
  v7.super_class = (Class)PHASERoomSimulationView;
  v5 = [(PHASERoomSimulationView *)&v7 init];
  objc_storeWeak((id *)&v5->_engine, v4);

  return v5;
}

- (void)beginTrackingRayTraceIntersections:(id)a3 callback:(id)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 geoEntityHandle];
  v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v6 geoEntityHandle];
  v13[0] = &unk_26D4791E8;
  v13[1] = v8;
  v13[2] = _Block_copy(v9);
  v13[3] = v13;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 408))(v11, v12, v13);
  std::__function::__value_func<void ()(Phase::SpatialModeler::RoomSimulationDebugger::RoomSimulationDebugView *)>::~__value_func[abi:ne180100](v13);
}

- (void)endTrackingRayTraceIntersections:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingRayTraceIntersections:]", "PHASERoomSimulationView.mm", 342, "listener");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingRayTraceIntersections:]", "PHASERoomSimulationView.mm", 343, "listener.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 416))(v8, [v9 geoEntityHandle]);
}

- (void)beginTrackingEnergyHistogram:(id)a3 callback:(id)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 geoEntityHandle];
  id v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v6 geoEntityHandle];
  v13[0] = &unk_26D479230;
  v13[1] = v8;
  v13[2] = _Block_copy(v9);
  v13[3] = v13;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 432))(v11, v12, v13);
  std::__function::__value_func<void ()(Phase::SpatialModeler::RoomSimulationDebugger::RoomSimulationDebugView *)>::~__value_func[abi:ne180100](v13);
}

- (void)endTrackingEnergyHistogram:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingEnergyHistogram:]", "PHASERoomSimulationView.mm", 365, "listener");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingEnergyHistogram:]", "PHASERoomSimulationView.mm", 366, "listener.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 440))(v8, [v9 geoEntityHandle]);
}

- (void)beginTrackingImageSourceLocations:(id)a3 callback:(id)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 geoEntityHandle];
  id v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v6 geoEntityHandle];
  v13[0] = &unk_26D479278;
  v13[1] = v8;
  v13[2] = _Block_copy(v9);
  v13[3] = v13;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 456))(v11, v12, v13);
  std::__function::__value_func<void ()(Phase::SpatialModeler::RoomSimulationDebugger::RoomSimulationDebugView *)>::~__value_func[abi:ne180100](v13);
}

- (void)endTrackingImageSourceLocations:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingImageSourceLocations:]", "PHASERoomSimulationView.mm", 388, "source");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingImageSourceLocations:]", "PHASERoomSimulationView.mm", 389, "source.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 464))(v8, [v9 geoEntityHandle]);
}

- (void)beginTrackingListenerEarlyResponseMetadata:(id)a3 callback:(id)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 geoEntityHandle];
  id v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v6 geoEntityHandle];
  v13[0] = &unk_26D4792C0;
  v13[1] = v8;
  v13[2] = _Block_copy(v9);
  v13[3] = v13;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 480))(v11, v12, v13);
  std::__function::__value_func<void ()(Phase::SpatialModeler::RoomSimulationDebugger::RoomSimulationDebugView *)>::~__value_func[abi:ne180100](v13);
}

- (void)endTrackingListenerEarlyResponseMetadata:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerEarlyResponseMetadata:]", "PHASERoomSimulationView.mm", 411, "entity");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerEarlyResponseMetadata:]", "PHASERoomSimulationView.mm", 412, "entity.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 488))(v8, [v9 geoEntityHandle]);
}

- (void)beginTrackingListenerLateReverbMetadata:(id)a3 callback:(id)a4
{
  v13[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 geoEntityHandle];
  id v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v6 geoEntityHandle];
  v13[0] = &unk_26D479308;
  v13[1] = v8;
  v13[2] = _Block_copy(v9);
  v13[3] = v13;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 504))(v11, v12, v13);
  std::__function::__value_func<void ()(Phase::SpatialModeler::RoomSimulationDebugger::RoomSimulationDebugView *)>::~__value_func[abi:ne180100](v13);
}

- (void)endTrackingListenerLateReverbMetadata:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!v4) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerLateReverbMetadata:]", "PHASERoomSimulationView.mm", 434, "entity");
  }
  id v5 = [v4 engine];
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine)) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingListenerLateReverbMetadata:]", "PHASERoomSimulationView.mm", 435, "entity.engine == _engine");
  }

  id WeakRetained = objc_loadWeakRetained((id *)p_engine);
  uint64_t v8 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v8 + 512))(v8, [v9 geoEntityHandle]);
}

- (void)beginTrackingRoomData:(id)a3 callback:(id)a4
{
  v14[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = _Block_copy(v7);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v11 = *(void *)([WeakRetained implementation] + 368);
  uint64_t v12 = [v8 geoEntityHandle];
  id v13 = v8;
  v14[0] = &unk_26D479350;
  v14[1] = v13;
  v14[2] = _Block_copy(v9);
  v14[3] = v14;
  (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v11 + 528))(v11, v12, v14);
  std::__function::__value_func<void ()(Phase::SpatialModeler::RoomSimulationDebugger::RoomSimulationDebugView *)>::~__value_func[abi:ne180100](v14);
}

- (void)endTrackingRoomData:(id)a3
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[PHASERoomSimulationView endTrackingRoomData:]", "PHASERoomSimulationView.mm", 455, "nullptr != entity");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  (*(void (**)(uint64_t, uint64_t))(*(void *)v5 + 536))(v5, [v6 geoEntityHandle]);
}

- (void)setTailcorrectionEnabled:(unint64_t)a3
{
  self->_runtimeDebugParameters.mTailcorrectionEnabled = a3 != 0;
  p_runtimeDebugParameters = &self->_runtimeDebugParameters;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&p_runtimeDebugParameters->mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&p_runtimeDebugParameters->mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&p_runtimeDebugParameters->mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&p_runtimeDebugParameters->mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setImageSourceOrder:(unint64_t)a3
{
  self->_runtimeDebugParameters.mImageSourceOrder = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setEarlyReflectionsRayTraceComputeTimeLimit:(float)a3
{
  self->_runtimeDebugParameters.mEarlyReflectionsRayTraceComputeTimeLimit = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setLateReverbRayTraceComputeTimeLimit:(float)a3
{
  self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setEarlyScatteringEnabled:(unint64_t)a3
{
  self->_runtimeDebugParameters.mEarlyScatteringEnabled = a3 != 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setEarlyReflectionsAggregationCoef:(float)a3
{
  self->_runtimeDebugParameters.mEarlyReflectionsAggregationCoef = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setEarlyScatteringAggregationCoef:(float)a3
{
  self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setLateReverbAggregationCoef:(float)a3
{
  self->_runtimeDebugParameters.mLateReverbAggregationCoef = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
}

- (void)setRayTraceIntersectionHandleCountLimit:(unint64_t)a3
{
  self->_runtimeDebugParameters.mRayTraceIntersectionHandleCountLimit = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
  long long v6 = *(_OWORD *)&self->_runtimeDebugParameters.mLateReverbRayTraceComputeTimeLimit;
  v12[0] = *(_OWORD *)&self->_runtimeDebugParameters.mTailcorrectionEnabled;
  v12[1] = v6;
  v12[2] = *(_OWORD *)&self->_runtimeDebugParameters.mRayTraceIntersectionHandleCounter;
  uint64_t v13 = *(void *)&self->_runtimeDebugParameters.mEarlyScatteringAggregationCoef;
  (*(void (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v5 + 544))(v5, v12, v7, v8, v9, v10, v11);
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

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 1;
  *((void *)self + 2) = 2;
  *((void *)self + 3) = 0x3C03126F3C23D70ALL;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((unsigned char *)self + 48) = 0;
  *(int32x2_t *)((char *)self + 52) = vdup_n_s32(0x3F51EB85u);
  *((_DWORD *)self + 15) = 1049918178;
  return self;
}

- (uint64_t)beginTrackingRayTraceIntersections:callback:
{
  return a1;
}

- (void)beginTrackingRayTraceIntersections:callback:
{
  uint64_t v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 329, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *(void *)(v2 + 16)) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 330, "handle == inView->mListener");
  }
  id v4 = [[PHASERoomSimulationDataSet alloc] initWithRoomSimulationDebugView:v2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (uint64_t)beginTrackingEnergyHistogram:callback:
{
  return a1;
}

- (void)beginTrackingEnergyHistogram:callback:
{
  uint64_t v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 352, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *(void *)(v2 + 16)) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 353, "handle == inView->mListener");
  }
  id v4 = [[PHASERoomSimulationDataSet alloc] initWithRoomSimulationDebugView:v2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (uint64_t)beginTrackingImageSourceLocations:callback:
{
  return a1;
}

- (void)beginTrackingImageSourceLocations:callback:
{
  uint64_t v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 375, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *(void *)(v2 + 8)) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 376, "handle == inView->mSource");
  }
  id v4 = [[PHASERoomSimulationDataSet alloc] initWithRoomSimulationDebugView:v2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (uint64_t)beginTrackingListenerEarlyResponseMetadata:callback:
{
  return a1;
}

- (void)beginTrackingListenerEarlyResponseMetadata:callback:
{
  uint64_t v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 398, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *(void *)(v2 + 16)) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 399, "handle == inView->mListener");
  }
  id v4 = [[PHASERoomSimulationDataSet alloc] initWithRoomSimulationDebugView:v2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (uint64_t)beginTrackingListenerLateReverbMetadata:callback:
{
  return a1;
}

- (void)beginTrackingListenerLateReverbMetadata:callback:
{
  uint64_t v2 = *a2;
  if (!*a2) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 421, "nullptr != inView");
  }
  if (*(void *)(a1 + 8) != *(void *)(v2 + 16)) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 422, "handle == inView->mListener");
  }
  id v4 = [[PHASERoomSimulationDataSet alloc] initWithRoomSimulationDebugView:v2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

- (uint64_t)beginTrackingRoomData:callback:
{
  return a1;
}

- (void)beginTrackingRoomData:callback:
{
  if (!*a2) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 443, "nullptr != inView");
  }
  if (!*(void *)(a1 + 8)) {
    __assert_rtn("operator()", "PHASERoomSimulationView.mm", 444, "nullptr != entity");
  }
  v3 = [[PHASERoomSimulationDataSet alloc] initWithRoomSimulationDebugView:*a2];
  (*(void (**)(void))(*(void *)(a1 + 16) + 16))();
}

@end