@interface MDLScene
- (BOOL)castRayFrom:(MDLScene *)self withDirection:(SEL)a2 usingCamera:(RTCamera *)a3 result:(RTIntersectionResult *)a4;
- (MDLScene)init;
- (NSArray)objects;
- (__n128)hitTestRayFrom:(uint64_t)a1 withDirection:(uint64_t)a2 usingCamera:(void *)a3;
- (id).cxx_construct;
- (id)raytraceSceneWithCamera:(const RTCamera *)a3 reflection:(id)a4 irradiance:(id)a5 size:;
- (int)acquireLockGuard;
- (void)addObject:(id)a3;
- (void)clear;
- (void)dealloc;
- (void)releaseLockGuard:(int)a3;
@end

@implementation MDLScene

- (MDLScene)init
{
  v4.receiver = self;
  v4.super_class = (Class)MDLScene;
  v2 = [(MDLScene *)&v4 init];
  if (v2)
  {
    v2->_signature = 0;
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  sceneMutex = self->_sceneMutex;
  std::mutex::lock((std::mutex *)sceneMutex);
  begin = self->_sceneObjects.__begin_;
  end = self->_sceneObjects.__end_;
  while (begin != end)
  {
    if (*begin) {
      (*(void (**)(RTRenderable *))(*(void *)*begin + 24))(*begin);
    }
    ++begin;
  }
  std::mutex::unlock((std::mutex *)sceneMutex);
  v6.receiver = self;
  v6.super_class = (Class)MDLScene;
  [(MDLScene *)&v6 dealloc];
}

- (int)acquireLockGuard
{
  std::mutex::lock((std::mutex *)self->_sceneMutex);
  int result = self->_signature + 1;
  self->_signature = result;
  return result;
}

- (void)releaseLockGuard:(int)a3
{
}

- (__n128)hitTestRayFrom:(uint64_t)a1 withDirection:(uint64_t)a2 usingCamera:(void *)a3
{
  id v4 = a3;
  __asm { FMOV            V0.2S, #1.0 }
  v11 = *(uint64_t **)(a1 + 16);
  v12 = *(uint64_t **)(a1 + 24);
  if (v11 == v12)
  {
    int8x16_t v16 = (int8x16_t)vdupq_n_s32(0x7F7FFFFFu);
  }
  else
  {
    int8x16_t v16 = (int8x16_t)vdupq_n_s32(0x7F7FFFFFu);
    v5.i32[0] = 2139095039;
    do
    {
      float32x4_t v15 = v5;
      sub_20B06C6F8(*v11);
      v13.i32[0] = 2139095039;
      float32x4_t v5 = v15;
      int8x16_t v16 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v15, v13), 0), (int8x16_t)0, v16);
      if (v15.f32[0] > 3.4028e38) {
        v5.f32[0] = 3.4028e38;
      }
      ++v11;
    }
    while (v11 != v12);
  }

  return (__n128)v16;
}

- (BOOL)castRayFrom:(MDLScene *)self withDirection:(SEL)a2 usingCamera:(RTCamera *)a3 result:(RTIntersectionResult *)a4
{
  return sub_20B19A3F4((uint64_t)self);
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  objc_msgSend_addObject_(self->_objects, v5, (uint64_t)v4);
  sceneMutex = self->_sceneMutex;
  std::mutex::lock((std::mutex *)sceneMutex);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v4;
      objc_msgSend_vertexCount(v7, v8, v9);
      objc_msgSend_vertexCount(v7, v10, v11);
      objc_msgSend_vertexCount(v7, v12, v13);
      objc_msgSend_vertexCount(v7, v14, v15);
      objc_msgSend_vertexCount(v7, v16, v17);
      objc_msgSend_vertexCount(v7, v18, v19);
      objc_msgSend_vertexCount(v7, v20, v21);
    }
    operator new();
  }
  id v22 = v4;
  sub_20B19A84C((char **)&self->_sceneLights, &v22);

  std::mutex::unlock((std::mutex *)sceneMutex);
}

- (void)clear
{
  sceneMutex = self->_sceneMutex;
  std::mutex::lock((std::mutex *)sceneMutex);
  begin = self->_sceneObjects.__begin_;
  end = self->_sceneObjects.__end_;
  if (begin != end)
  {
    do
    {
      if (*begin) {
        (*(void (**)(RTRenderable *))(*(void *)*begin + 24))(*begin);
      }
      ++begin;
    }
    while (begin != end);
    begin = self->_sceneObjects.__begin_;
  }
  self->_sceneObjects.__end_ = begin;

  std::mutex::unlock((std::mutex *)sceneMutex);
}

- (id)raytraceSceneWithCamera:(const RTCamera *)a3 reflection:(id)a4 irradiance:(id)a5 size:
{
  int32x2_t v46 = v5;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x263EFF990]);
  id v44 = objc_msgSend_initWithLength_(v11, v12, 4 * v46.i32[1] * v46.i32[0]);
  uint64_t v15 = objc_msgSend_mutableBytes(v44, v13, v14);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_267691130, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_267691130))
  {
    operator new();
  }
  int8x16_t v16 = (void *)MEMORY[0x210532AA0]();
  uint64_t v19 = objc_msgSend_acquireLockGuard(self, v17, v18);
  clock_t v20 = clock();
  objc_msgSend_translation(a3->var10, v21, v22);
  long long v42 = v23;
  dispatch_queue_t v43 = dispatch_queue_create("trace", 0);
  dispatch_group_t v24 = dispatch_group_create();
  v25 = dispatch_get_global_queue(33, 0);
  double v45 = COERCE_DOUBLE(vcvt_f32_s32(v46));
  *(double *)&long long v26 = sub_20B149090((float32x4_t *)a3, 0.0, v45);
  long long v41 = v26;
  *(double *)&long long v27 = sub_20B149090((float32x4_t *)a3, COERCE_DOUBLE((unint64_t)LODWORD(v45)), v45);
  long long v40 = v27;
  DWORD1(v27) = HIDWORD(v45);
  LODWORD(v27) = 0;
  *(double *)&long long v28 = sub_20B149090((float32x4_t *)a3, *(double *)&v27, v45);
  long long v39 = v28;
  *(double *)&long long v29 = sub_20B149090((float32x4_t *)a3, v45, v45);
  float32x2_t v30 = vrsqrte_f32((float32x2_t)1062333316);
  float32x2_t v31 = vmul_f32(vrsqrts_f32((float32x2_t)1062333316, vmul_f32(v30, v30)), v30);
  block[1] = 3221225472;
  block[0] = MEMORY[0x263EF8330];
  block[2] = sub_20B19ADE0;
  block[3] = &unk_263FFDD28;
  int32x2_t v59 = v46;
  long long v48 = v41;
  long long v49 = v39;
  long long v50 = v40;
  long long v51 = v29;
  v54 = self;
  uint64_t v60 = v15;
  v61 = a3;
  long long v52 = v42;
  float32x4_t v53 = vmulq_n_f32((float32x4_t)xmmword_20B1E9F00, vmul_f32(v31, vrsqrts_f32((float32x2_t)1062333316, vmul_f32(v31, v31))).f32[0]);
  id v32 = v9;
  id v55 = v32;
  id v33 = v10;
  id v56 = v33;
  v34 = v24;
  v57 = v34;
  v35 = v43;
  v58 = v35;
  dispatch_apply(0x20uLL, v25, block);
  dispatch_group_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  clock_t v36 = clock();
  NSLog(&cfstr_FrameTime2fms.isa, (double)(v36 - v20) * 0.0001);
  objc_msgSend_releaseLockGuard_(self, v37, v19);

  return v44;
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  p_sceneLights = &self->_sceneLights;
  sub_20B19B1D0((void ***)&p_sceneLights);
  begin = self->_sceneObjects.__begin_;
  if (begin)
  {
    self->_sceneObjects.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end