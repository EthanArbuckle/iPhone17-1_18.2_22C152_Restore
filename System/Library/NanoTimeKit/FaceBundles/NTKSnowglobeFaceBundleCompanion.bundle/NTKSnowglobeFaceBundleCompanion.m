uint64_t sub_1DAFE1344()
{
  uint64_t vars8;

  qword_1EA8FCEB0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFE156C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAFE15A0(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    if (*((unsigned char *)v8 + 16))
    {
      [v15 userAcceleration];
      *((void *)v8 + 4) = v9;
      *((void *)v8 + 5) = v10;
      *((void *)v8 + 6) = v11;
      [v15 rotationRate];
      *((void *)v8 + 7) = v12;
      *((void *)v8 + 8) = v13;
      *((void *)v8 + 9) = v14;
    }
    objc_sync_exit(v8);
  }
}

void sub_1DAFE1650(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAFE174C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DAFE17CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAFE1848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DAFE19C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DAFE24A0(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 912));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1DAFE2548;
  v3[3] = &unk_1E6BE4D48;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void sub_1DAFE2548(uint64_t a1)
{
  v2 = dispatch_group_create();
  [*(id *)(*(void *)(a1 + 32) + 856) renderSynchronouslyWithImageQueueDiscard:1 inGroup:v2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DAFE2604;
  block[3] = &unk_1E6BE4D20;
  id v4 = *(id *)(a1 + 40);
  dispatch_group_notify(v2, MEMORY[0x1E4F14428], block);
}

uint64_t sub_1DAFE2604(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1DAFE2B68()
{
  qword_1EA8FCEC8 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

void sub_1DAFE31F8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v9 = [v5 objectAtIndexedSubscript:a3];
  v7 = *(void **)(a1 + 40);
  id v8 = MEMORY[0x1E0186B00](v6, v9, *(double *)(a1 + 48));

  [v7 addObject:v8];
}

void sub_1DAFE390C(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 488);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  [*(id *)(a1 + 32) _setupWithNode:v4 configureNode:*(void *)(a1 + 40)];
}

void sub_1DAFE3BB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAFE3DA0(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  if (*(void *)(a1 + 32))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
          id v8 = objc_msgSend(*(id *)(a1 + 48), "physicsWorld", (void)v11);
          [v8 removeBehavior:v7];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v4);
    }

    [*(id *)(a1 + 40) removeAllObjects];
    [*(id *)(a1 + 32) removeFromParentNode];
  }
  objc_msgSend(MEMORY[0x1E4F3B280], "commit", (void)v11);
  if (*(void *)(a1 + 56))
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1DAFDF000, v9, OS_LOG_TYPE_DEFAULT, "Snowglobe destroyed digit while loading %@", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

uint64_t sub_1DAFE41DC(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = [a2 name];
  uint64_t v5 = [v4 hasPrefix:@"Leg_1"];

  if (v5) {
    *a3 = 1;
  }
  return v5;
}

uint64_t sub_1DAFE4238(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = [a2 name];
  uint64_t v5 = [v4 hasPrefix:@"Leg_2"];

  if (v5) {
    *a3 = 1;
  }
  return v5;
}

void sub_1DAFE4558(uint64_t a1, void *a2)
{
  id v6 = [a2 geometry];
  uint64_t v3 = [v6 firstMaterial];
  LODWORD(v4) = *(_DWORD *)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithFloat:v4];
  [v3 setValue:v5 forKeyPath:@"grainIntensity"];
}

id sub_1DAFE5694(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 376) transitionToState:0 withDuration:0.25];
  id v2 = (id *)(*(void *)(a1 + 32) + 384);

  return objc_storeWeak(v2, 0);
}

void sub_1DAFE5B38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 120));
  _Unwind_Resume(a1);
}

void sub_1DAFE5B70(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  double v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained _loadDigitNumber:*(void *)(a1 + 40)];
  v4[2](v4, v5);
}

void sub_1DAFE5BF8(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained _loadBackgroundObjects];
  v3[2](v3, v4);
}

void sub_1DAFE5C70(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained _loadDainty];
  v3[2](v3, v4);
}

void sub_1DAFE5DD0(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE5E8C;
  v7[3] = &unk_1E6BE4EA0;
  double v4 = a1[4];
  v7[4] = a1[5];
  id v8 = v3;
  uint64_t v5 = (void *)a1[6];
  uint64_t v10 = a1[7];
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_1DAFE5E8C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  id v2 = (void *)[*(id *)(a1 + 32) _copyAndConfigureDigitNode:*(void *)(a1 + 40)];
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1DAFDF000, v3, OS_LOG_TYPE_DEFAULT, "Snowglobe: created a copy of digit %lu", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [MEMORY[0x1E4F3B280] commit];
}

id sub_1DAFE6140()
{
  if (qword_1EA8FCEF0 != -1) {
    dispatch_once(&qword_1EA8FCEF0, &unk_1F3527F38);
  }
  v0 = (void *)qword_1EA8FCEE8;

  return v0;
}

void sub_1DAFE624C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DAFE6310;
  v10[3] = &unk_1E6BE4EF0;
  uint64_t v7 = *(void **)(a1 + 32);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 enumerateHierarchyUsingBlock:v10];
}

void sub_1DAFE6310(id *a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 geometry];
  uint64_t v4 = (void *)[v3 copy];

  id v5 = [v4 firstMaterial];
  id v6 = (void *)[v5 copy];

  [v4 setFirstMaterial:v6];
  [v9 setGeometry:v4];
  [a1[4] _applyCustomShadingToMaterial:v6];
  if (a1[5] == v9 || a1[6] == v9)
  {
    uint64_t v7 = [v9 morpher];
    id v8 = (void *)[v7 copy];
    [v9 setMorpher:v8];
  }
  [v9 setCategoryBitMask:2];
}

id sub_1DAFE66B4(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F3B230];
  id v3 = a2;
  uint64_t v4 = [v2 dynamicBody];
  id v5 = (void *)MEMORY[0x1E4F3B248];
  id v6 = [v3 geometry];

  uint64_t v10 = *MEMORY[0x1E4F3B390];
  v11[0] = *MEMORY[0x1E4F3B378];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v5 shapeWithGeometry:v6 options:v7];
  [v4 setPhysicsShape:v8];

  [v4 setMass:1.0];
  [v4 setAngularDamping:0.6];
  [v4 setLinearRestingThreshold:0.000001];
  [v4 setAngularRestingThreshold:0.000001];
  [v4 setContactTestBitMask:-1];

  return v4;
}

void sub_1DAFE6AC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v11 = [v5 childNodeWithName:@"ScreenLeft_Eye" recursively:1];
  id v8 = [*(id *)(a1 + 32) childNodeWithName:@"ScreenRight_Eye" recursively:1];
  id v9 = [v7 clone];

  uint64_t v10 = [v6 clone];

  [v11 position];
  objc_msgSend(v9, "setPosition:");
  [v8 position];
  objc_msgSend(v10, "setPosition:");
  [*(id *)(a1 + 32) replaceChildNode:v11 with:v9];
  [*(id *)(a1 + 32) replaceChildNode:v8 with:v10];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DAFE6CB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DAFE6D64;
  v6[3] = &unk_1E6BE4D48;
  id v7 = v3;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void sub_1DAFE6D64(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(*(id *)(a1 + 32), "count")));
  id v3 = [v2 clone];

  id v4 = objc_alloc_init(MEMORY[0x1E4F3B218]);
  [v4 setLightingModelName:*MEMORY[0x1E4F3B348]];
  id v5 = [v4 roughness];
  [v5 setContents:&unk_1F352BFC0];

  [v4 setWritesToDepthBuffer:0];
  [v4 setReadsFromDepthBuffer:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE6EC4;
  v7[3] = &unk_1E6BE4F68;
  id v8 = v4;
  id v6 = v4;
  [v3 enumerateHierarchyUsingBlock:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [MEMORY[0x1E4F3B280] commit];
}

void sub_1DAFE6EC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 geometry];
  id v7 = (id)[v4 copy];

  [v3 setGeometry:v7];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 geometry];
  [v6 setFirstMaterial:v5];

  [v3 setRenderingOrder:-1];
}

void sub_1DAFE72FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAFE73DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFE748C;
  v7[3] = &unk_1E6BE4FB8;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_1DAFE748C(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) clone];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id v4 = (void *)MEMORY[0x1E4F3B280];

  return [v4 commit];
}

uint64_t sub_1DAFE79D0()
{
  qword_1EA8FCEE8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DAFE7FF4()
{
  qword_1EA8FCEF8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

uint64_t NTKSnowglobeDebugGetTapAction()
{
  return 0;
}

uint64_t NTKSnowglobeDebugGetCameraMode()
{
  return 0;
}

void sub_1DAFE8180()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F352BEE8;
  v2[1] = &unk_1F352BF00;
  v3[0] = @"on";
  v3[1] = @"off";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)qword_1EA8FCF08;
  qword_1EA8FCF08 = v0;
}

uint64_t sub_1DAFE8944(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_setupScene");
  uint64_t v2 = (void *)MEMORY[0x1E4F3B280];

  return [v2 commit];
}

void sub_1DAFE8ADC(uint64_t a1)
{
}

void sub_1DAFE8B7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 256);
  id v3 = *(NSObject **)(v1 + 264);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DAFE8C10;
  block[3] = &unk_1E6BE4D20;
  id v5 = *(id *)(a1 + 40);
  dispatch_group_notify(v2, v3, block);
}

uint64_t sub_1DAFE8C10(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = (void *)MEMORY[0x1E4F3B280];

  return [v2 commit];
}

uint64_t sub_1DAFE8DD0(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__queue_applyState);
}

void sub_1DAFE9990(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DAFE9A20;
  v5[3] = &unk_1E6BE5018;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a3;
  [a2 fetchWithCompletion:v5];
}

uint64_t sub_1DAFE9A20(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F3B280];
  id v4 = a2;
  [v3 begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 40)];
  id v6 = [v4 childNodes];

  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v7 geometry];
  id v9 = [v8 firstMaterial];
  uint64_t v10 = [v9 diffuse];
  [v10 setContents:v5];

  id v11 = (void *)MEMORY[0x1E4F3B280];

  return [v11 commit];
}

void sub_1DAFEADC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAFEAE04(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[33]);
    [(dispatch_queue_t *)v4 _queue_configureController:v5 digit:*(void *)(a1 + 40)];
    [v5 resetToOrigin];
  }
}

double sub_1DAFEAF10(float32x4_t a1, float32x4_t a2)
{
  float32x4_t v2 = vmulq_f32(a1, a2);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1))).f32[0] >= 0.0)
  {
    float32x4_t v33 = vaddq_f32(a1, a2);
    int32x4_t v34 = (int32x4_t)vmulq_f32(v33, v33);
    v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
    float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    float32x4_t v37 = vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
    int32x4_t v38 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL), vnegq_f32(a1)), v37, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
    unint64_t v32 = vextq_s8((int8x16_t)vuzp1q_s32(v38, v38), (int8x16_t)v38, 0xCuLL).u64[0];
  }
  else
  {
    int32x4_t v3 = (int32x4_t)vmulq_f32(a1, a1);
    v3.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v3, 2), vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v3.i8, 1))).u32[0];
    float32x2_t v4 = vrsqrte_f32((float32x2_t)v3.u32[0]);
    float32x2_t v5 = vmul_f32(v4, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v4, v4)));
    v3.i32[0] = vmul_f32(v5, vrsqrts_f32((float32x2_t)v3.u32[0], vmul_f32(v5, v5))).u32[0];
    int32x4_t v6 = (int32x4_t)vmulq_f32(a2, a2);
    v6.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v6, 2), vadd_f32(*(float32x2_t *)v6.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v6.i8, 1))).u32[0];
    float32x2_t v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
    float32x2_t v8 = vmul_f32(v7, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)));
    float32x4_t v9 = vaddq_f32(vmulq_n_f32(a1, *(float *)v3.i32), vmulq_n_f32(a2, vmul_f32(v8, vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v8, v8))).f32[0]));
    float32x4_t v10 = vmulq_f32(v9, v9);
    float v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0];
    if (v11 <= 1.4211e-14)
    {
      float32x4_t v39 = vabsq_f32(a1);
      float v40 = v39.f32[1];
      float v41 = v39.f32[2];
      if (v39.f32[0] > v39.f32[1] || v39.f32[0] > v39.f32[2])
      {
        float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
        if (v40 <= v41)
        {
          float32x4_t v43 = vmulq_f32(a1, (float32x4_t)xmmword_1DAFF0B00);
          float32x4_t v44 = (float32x4_t)xmmword_1DAFF0A90;
        }
        else
        {
          float32x4_t v43 = vmulq_f32(a1, (float32x4_t)xmmword_1DAFF0B10);
          float32x4_t v44 = (float32x4_t)xmmword_1DAFF0AE0;
        }
      }
      else
      {
        float32x4_t v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL);
        float32x4_t v43 = vmulq_f32(a1, (float32x4_t)xmmword_1DAFF0AF0);
        float32x4_t v44 = (float32x4_t)xmmword_1DAFF0AA0;
      }
      float32x4_t v45 = vmlaq_f32(v43, v44, v42);
      float32x4_t v46 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v45, (int32x4_t)v45), (int8x16_t)v45, 0xCuLL);
      int32x4_t v47 = (int32x4_t)vmulq_f32(v45, v45);
      v47.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v47.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v47, 2), *(float32x2_t *)v47.i8)).u32[0];
      float32x2_t v48 = vrsqrte_f32((float32x2_t)v47.u32[0]);
      float32x2_t v49 = vmul_f32(v48, vrsqrts_f32((float32x2_t)v47.u32[0], vmul_f32(v48, v48)));
      unint64_t v32 = vmulq_n_f32(v46, vmul_f32(v49, vrsqrts_f32((float32x2_t)v47.u32[0], vmul_f32(v49, v49))).f32[0]).u64[0];
    }
    else
    {
      float v12 = v11;
      float32x2_t v13 = vrsqrte_f32((float32x2_t)LODWORD(v11));
      float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)LODWORD(v12), vmul_f32(v13, v13)));
      float32x4_t v15 = vmulq_n_f32(v9, vmul_f32(v14, vrsqrts_f32((float32x2_t)LODWORD(v12), vmul_f32(v14, v14))).f32[0]);
      float32x4_t v16 = vaddq_f32(a1, v15);
      int32x4_t v17 = (int32x4_t)vmulq_f32(v16, v16);
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
      float32x2_t v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
      float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
      float32x4_t v20 = vmulq_n_f32(v16, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
      float32x4_t v21 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL), vnegq_f32(a1)), v20, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)a1, (int32x4_t)a1), (int8x16_t)a1, 0xCuLL));
      float32x4_t v22 = vmulq_f32(v20, a1);
      float32x4_t v23 = vaddq_f32(a2, v15);
      int32x4_t v24 = (int32x4_t)vmulq_f32(v23, v23);
      v24.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v24, 2), vadd_f32(*(float32x2_t *)v24.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v24.i8, 1))).u32[0];
      *(float32x2_t *)v20.f32 = vrsqrte_f32((float32x2_t)v24.u32[0]);
      *(float32x2_t *)v20.f32 = vmul_f32(*(float32x2_t *)v20.f32, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v20.f32)));
      float32x4_t v25 = vmulq_n_f32(v23, vmul_f32(*(float32x2_t *)v20.f32, vrsqrts_f32((float32x2_t)v24.u32[0], vmul_f32(*(float32x2_t *)v20.f32, *(float32x2_t *)v20.f32))).f32[0]);
      int32x4_t v26 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL), vnegq_f32(v15)), v25, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v15, (int32x4_t)v15), (int8x16_t)v15, 0xCuLL));
      float32x4_t v27 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL);
      float32x4_t v28 = vmulq_f32(v15, v25);
      v27.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).u32[0];
      int32x4_t v29 = (int32x4_t)vnegq_f32(v27);
      int8x16_t v30 = (int8x16_t)vtrn2q_s32((int32x4_t)v27, vtrn1q_s32((int32x4_t)v27, v29));
      float32x4_t v31 = (float32x4_t)vrev64q_s32((int32x4_t)v27);
      v31.i32[0] = v29.i32[1];
      v31.i32[3] = v29.i32[2];
      unint64_t v32 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]), v31, *(float32x2_t *)v21.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v27, (int8x16_t)v29, 8uLL), v21.f32[0]), (float32x4_t)vextq_s8(v30, v30, 8uLL), v21, 2)).u64[0];
    }
  }
  return *(double *)&v32;
}

void sub_1DAFEB4C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAFEB96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAFEB9C0(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  [*(id *)(a1 + 32) destroy];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int32x4_t v3 = WeakRetained;
    [WeakRetained[8] removeObject:*(void *)(a1 + 32)];
    [MEMORY[0x1E4F3B280] commit];
    id WeakRetained = v3;
  }
}

void sub_1DAFEBA40(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  float32x2_t v7 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[33]);
    LODWORD(v8) = *(_DWORD *)(a1 + 48);
    LODWORD(v9) = *(_DWORD *)(a1 + 52);
    LODWORD(v10) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v5, "setPosition:", v8, v9, v10);
    [v5 position];
    int v12 = v11;
    int v14 = v13;
    int v16 = v15;
    int32x4_t v17 = [v5 presentationNode];
    LODWORD(v18) = v12;
    LODWORD(v19) = v14;
    LODWORD(v20) = v16;
    objc_msgSend(v17, "setPosition:", v18, v19, v20);

    float32x4_t v21 = [v5 physicsBody];
    [v21 setCollisionBitMask:1];

    float32x4_t v22 = [v5 physicsBody];
    [v22 setContactTestBitMask:1];

    [(dispatch_queue_t *)v7 _queue_configureController:v23 digit:*(void *)(a1 + 40)];
  }
}

uint64_t sub_1DAFEC0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int32x4_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2 + *(void *)(a1 + 40) * a3];
  uint64_t v4 = [v3 integerValue];

  return v4;
}

id sub_1DAFEC0EC(uint64_t a1, double a2, double a3)
{
  int32x4_t v6 = objc_opt_new();
  double v7 = *(double *)(a1 + 48);
  uint64_t v8 = (uint64_t)(a2 / v7);
  uint64_t v9 = (uint64_t)(a3 / v7);
  uint64_t v10 = *(void *)(a1 + 56);
  unint64_t v11 = (v8 - v10) & ~((v8 - v10) >> 63);
  unint64_t v12 = v10 + v8;
  if (*(void *)(a1 + 64) - 1 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = *(void *)(a1 + 64) - 1;
  }
  if (*(void *)(a1 + 72) - 1 >= (unint64_t)(v10 + v9)) {
    unint64_t v14 = v10 + v9;
  }
  else {
    unint64_t v14 = *(void *)(a1 + 72) - 1;
  }
  if (v11 <= v13)
  {
    uint64_t v15 = (v9 - v10) & ~((v9 - v10) >> 63);
    do
    {
      for (unint64_t i = v15; i <= v14; ++i)
      {
        uint64_t v17 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        if (v17 != -1)
        {
          double v18 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v17];
          [v6 addObject:v18];
        }
      }
      ++v11;
    }
    while (v11 <= v13);
  }

  return v6;
}

void sub_1DAFEC228(uint64_t a1, uint64_t a2, double a3, double a4)
{
  double v5 = *(double *)(a1 + 40);
  unint64_t v6 = (unint64_t)(a3 / v5);
  unint64_t v7 = (unint64_t)(a4 / v5);
  id v8 = [NSNumber numberWithUnsignedInteger:a2];
  [*(id *)(a1 + 32) setObject:v8 atIndexedSubscript:v6 + *(void *)(a1 + 48) * v7];
}

double sub_1DAFEC2AC(double a1)
{
  float v2 = (float)arc4random() * 2.3283e-10;
  uint32_t v3 = arc4random();
  return a1
       + (float)(v2 + 1.0)
       * 0.16
       * __sincos_stret((float)((float)v3 * 2.3283e-10) * 3.14159265 + (float)((float)v3 * 2.3283e-10) * 3.14159265).__sinval;
}

void sub_1DAFEC8E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NTKSnowglobeAssetLibrary sharedInstance];
  double v5 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DAFEC9C8;
  v8[3] = &unk_1E6BE5158;
  id v6 = v5;
  uint64_t v12 = *(void *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 32);
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  [v4 loadRandomBackgroundShapeOnQueue:v6 withCompletion:v8];
}

void sub_1DAFEC9C8(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 48);
  id v5 = a2;
  dispatch_assert_queue_V2(v3);
  double v4 = *(double *)(a1 + 64);
  *(float *)&double v4 = v4;
  objc_msgSend(v5, "setSimdScale:", *(double *)vdupq_lane_s32(*(int32x2_t *)&v4, 0).i64);
  [v5 setSimdPosition:*(double *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1DAFECA4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = +[NTKSnowglobeAssetLibrary sharedInstance];
  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DAFECB1C;
  v7[3] = &unk_1E6BE4D98;
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  [v4 loadDaintyOnQueue:v8 withCompletion:v7];
}

void sub_1DAFECB1C(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1DAFECC68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAFECC84(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F3B280] begin];
    [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
    [WeakRetained[12] addChildNode:v7];
    double v4 = (double)arc4random() / 4294967300.0;
    id v5 = objc_opt_new();
    [v5 setNode:v7];
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, "setRotationAxis:", 0.0, 0.0, v6);
    [v5 setRotationSpeed:v4 * 2.0 + -1.0 + v4 * 2.0 + -1.0];
    [WeakRetained[9] addObject:v5];
    [MEMORY[0x1E4F3B280] commit];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_1DAFECF58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_1DAFECF7C(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F3B280];
  id v3 = a2;
  [v2 begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  [v3 setOpacity:1.0];

  double v4 = (void *)MEMORY[0x1E4F3B280];

  return [v4 commit];
}

void sub_1DAFECFE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v3 setOpacity:0.0];
    id v5 = (void *)WeakRetained[15];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1DAFED0C8;
    v6[3] = &unk_1E6BE5218;
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    [v5 fetchWithCompletion:v6];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_1DAFED0C8(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) simdPosition];
    double v6 = v5;
    [*(id *)(a1 + 32) simdPosition];
    double v8 = v7;
    [*(id *)(a1 + 32) simdPosition];
    int v11 = 134218496;
    double v12 = v6;
    __int16 v13 = 2048;
    double v14 = v8;
    __int16 v15 = 2048;
    double v16 = v9;
    _os_log_impl(&dword_1DAFDF000, v4, OS_LOG_TYPE_DEFAULT, "Placed Dainty at %f %f %f", (uint8_t *)&v11, 0x20u);
  }

  [*(id *)(a1 + 32) position];
  objc_msgSend(v3, "setPosition:");
  [*(id *)(a1 + 32) simdScale];
  objc_msgSend(v3, "setSimdScale:", *(double *)vmulq_f32(v10, (float32x4_t)vdupq_n_s32(0x3BB60B61u)).i64);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_1DAFED388(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(a1 + 32) + 304);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained currentRotation];
  objc_msgSend(v3, "setRotation:");
}

uint64_t sub_1DAFED3EC(uint64_t a1, void *a2)
{
  return [a2 updateAtTime:*(double *)(a1 + 32)];
}

void sub_1DAFED6EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1DAFED708(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    do
    {
      double v4 = v3;
      float v5 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKey:v3];
      id v3 = [v3 parentNode];

      if (v5) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = v3 == 0;
      }
    }
    while (!v6);
  }
  else
  {
    float v5 = 0;
  }

  return v5;
}

void sub_1DAFEDBD0(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  uint64_t v2 = [*(id *)(a1 + 32) appliedSnowglobeState];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(v3 + 249);
  *(unsigned char *)(v3 + 249) = *(unsigned char *)(a1 + 48);
  BOOL v5 = [v2 tritiumState] == 1 || objc_msgSend(v2, "tritiumState") == 3;
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  float32x4_t v10 = sub_1DAFEDCF4;
  int v11 = &unk_1E6BE52B0;
  BOOL v15 = v5;
  char v16 = v4;
  id v12 = v2;
  __int16 v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v7 = v2;
  objc_msgSend(v6, "_queue_enumerateDigitsWithBlock:", &v8);
  objc_msgSend(MEMORY[0x1E4F3B280], "commit", v8, v9, v10, v11);
}

void sub_1DAFEDCF4(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) idealizedState] & 1) != 0 || *(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57))
  {
    char v4 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
    objc_msgSend(v4, "_queue_replaceDigit:withCharacter:", a2, objc_msgSend(v6, "unsignedIntegerValue"));
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
    objc_msgSend(v5, "_queue_animatedReplaceDigit:withCharacter:", a2, objc_msgSend(v6, "unsignedIntegerValue"));
  }
}

uint64_t sub_1DAFEDE5C(uint64_t a1)
{
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  objc_msgSend(*(id *)(a1 + 32), "_queue_tapAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v2 = (void *)MEMORY[0x1E4F3B280];

  return [v2 commit];
}

uint64_t sub_1DAFEE488()
{
  qword_1EA8FCF18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1DAFEE4E4(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  [MEMORY[0x1E4F3B280] begin];
  [MEMORY[0x1E4F3B280] setAnimationDuration:0.0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = (void *)MEMORY[0x1E4F3B280];

  return [v2 commit];
}

void sub_1DAFEE754(id *a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 identifier];
  BOOL v5 = [a1[4] pigmentEditOption];
  id v6 = [v5 identifier];
  if ([v4 isEqualToString:v6])
  {
  }
  else
  {
    id v7 = [v3 identifier];
    char v8 = [v7 isEqualToString:@"snowglobe.black"];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [a1[4] pigmentEditOption];
      float32x4_t v10 = [v9 identifier];
      char v11 = [v10 isEqualToString:@"snowglobe.black"];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1DAFEE8D0;
      v13[3] = &unk_1E6BE5328;
      char v16 = v11;
      id v12 = a1[4];
      id v14 = a1[5];
      id v15 = a1[6];
      [v12 executeWithOption:v3 block:v13];
    }
  }
}

void sub_1DAFEE8D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (*(unsigned char *)(a1 + 48)
    || ([v3 primaryColor],
        char v4 = objc_claimAutoreleasedReturnValue(),
        CLKContrastRatioForColors(),
        double v6 = v5,
        v4,
        id v7 = v10,
        v6 > 1.4))
  {
    char v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v10 primaryColor];
    [v8 addObject:v9];

    id v7 = v10;
  }
}

uint64_t sub_1DAFEE98C()
{
  qword_1EA8FCF28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

double NTKMakeAxisAngleFromEulerAngles(float32x4_t a1)
{
  __float2 v1 = __sincosf_stret(0.5 * a1.f32[0]);
  __float2 v2 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)a1.f32, 1));
  __float2 v3 = __sincosf_stret(vmuls_lane_f32(0.5, a1, 2));
  v4.f32[0] = (float)(v3.__cosval * (float)(v1.__sinval * v2.__sinval))
            + (float)((float)(v1.__cosval * v2.__cosval) * v3.__sinval);
  v4.f32[1] = (float)(v3.__sinval * (float)(v1.__cosval * v2.__sinval))
            + (float)((float)(v1.__sinval * v2.__cosval) * v3.__cosval);
  v4.f32[2] = (float)((float)(v1.__cosval * v2.__sinval) * v3.__cosval)
            - (float)((float)(v1.__sinval * v2.__cosval) * v3.__sinval);
  float32x4_t v10 = v4;
  acosf((float)((float)(v1.__cosval * v2.__cosval) * v3.__cosval)- (float)((float)(v1.__sinval * v2.__sinval) * v3.__sinval));
  int32x4_t v5 = (int32x4_t)vmulq_f32(v10, v10);
  v5.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v5, 2), vadd_f32(*(float32x2_t *)v5.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v5.i8, 1))).u32[0];
  float32x2_t v6 = vrsqrte_f32((float32x2_t)v5.u32[0]);
  float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v6, v6)));
  *(void *)&double result = vmulq_n_f32(v10, vmul_f32(v7, vrsqrts_f32((float32x2_t)v5.u32[0], vmul_f32(v7, v7))).f32[0]).u64[0];
  return result;
}

void NTKMakeEulerAnglesFromAxisAngle(float32x4_t a1)
{
  float v1 = a1.f32[3];
  __float2 v2 = __sincosf_stret(a1.f32[3]);
  float v3 = 1.0 - v2.__cosval;
  float32x4_t v4 = vmulq_f32(a1, a1);
  v4.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).u64[0];
  float32x4_t v5 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 0);
  float32x4_t v6 = vrsqrteq_f32(v5);
  float32x4_t v7 = vmulq_f32(v6, vrsqrtsq_f32(v5, vmulq_f32(v6, v6)));
  int32x4_t v8 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v4.f32[0] != 0.0)), 0x1FuLL));
  v8.i32[3] = 0;
  int8x16_t v9 = (int8x16_t)vmulq_f32(v7, vrsqrtsq_f32(v5, vmulq_f32(v7, v7)));
  __asm { FMOV            V2.4S, #1.0 }
  float32x4_t v15 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v8), v9, _Q2), a1);
  float v16 = vmuls_lane_f32(v2.__sinval, v15, 2)
      + (float)(vmuls_lane_f32(v15.f32[0], *(float32x2_t *)v15.f32, 1) * (float)(1.0 - v2.__cosval));
  float v22 = v15.f32[0];
  if (v16 <= 0.998)
  {
    if (v16 >= -0.998)
    {
      float v19 = v15.f32[1];
      float v20 = v15.f32[2];
      atan2f((float)(v3 * (float)-(float)(v15.f32[0] * v15.f32[2])) + (float)(v15.f32[1] * v2.__sinval), 1.0 - (float)((float)((float)(v20 * v20) + (float)(v19 * v19)) * v3));
      asinf(v16);
      atan2f((float)(v3 * (float)-(float)(v19 * v20)) + (float)(v22 * v2.__sinval), 1.0 - (float)((float)((float)(v20 * v20) + (float)(v22 * v22)) * v3));
    }
    else
    {
      __float2 v18 = __sincosf_stret(v1 * 0.5);
      atan2f(v18.__sinval * v22, v18.__cosval);
    }
  }
  else
  {
    __float2 v17 = __sincosf_stret(v1 * 0.5);
    atan2f(v17.__sinval * v22, v17.__cosval);
  }
}

__n128 NTKMakeAxisAngleFromQuat(float32x4_t a1, double a2)
{
  _Q4 = a1;
  if (a1.f32[3] > 1.0)
  {
    int8x16_t v3 = (int8x16_t)vmulq_f32(a1, a1);
    float32x2_t v4 = vadd_f32(*(float32x2_t *)v3.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
    if (vaddv_f32(v4) == 0.0)
    {
      _Q4 = (float32x4_t)xmmword_1DAFF0950;
    }
    else
    {
      unsigned __int32 v5 = vadd_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v4, 1)).u32[0];
      float32x2_t v6 = vrsqrte_f32((float32x2_t)v5);
      float32x2_t v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)v5, vmul_f32(v6, v6)));
      _Q4 = vmulq_n_f32(_Q4, vmul_f32(v7, vrsqrts_f32((float32x2_t)v5, vmul_f32(v7, v7))).f32[0]);
    }
  }
  _S0 = _Q4.f32[3];
  __asm { FMLS            S1, S0, V4.S[3] }
  *(float *)&a2 = sqrtf(_S1);
  if (*(float *)&a2 >= 0.001) {
    _Q4 = vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0));
  }
  float32x4_t v15 = _Q4;
  acosf(_S0);
  return (__n128)v15;
}

void sub_1DAFEF0F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DAFEF110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  float32x2_t v6 = sub_1DAFEF18C;
  float32x2_t v7 = &unk_1E6BE5378;
  uint64_t v8 = v1;
  return (*(uint64_t (**)(void))(v2 + 16))();
}

uint64_t sub_1DAFEF18C(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__blockCompletedWithObject_);
}

void -[NTKSnowglobePromise _blockCompletedWithObject:](NTKSnowglobePromise *self, SEL a2, id a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  float32x2_t v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong(&v6->_object, a3);
  v6->_state = 2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  float32x2_t v7 = v6->_completions;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)v6->_completions removeAllObjects];
  objc_sync_exit(v6);
}

void sub_1DAFEF2E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAFEF358(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFDF000, a2, OS_LOG_TYPE_ERROR, "Error loading Snowglobe background objects: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1DAFEF3D0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFDF000, a2, OS_LOG_TYPE_ERROR, "Snowglobe: Error loading lighting scene: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1DAFEF448(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1DAFDF000, a2, OS_LOG_TYPE_FAULT, "Snowglobe synchronous flush timed out %i", (uint8_t *)v2, 8u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CLKContrastRatioForColors()
{
  return MEMORY[0x1F40D5DF0]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x1F40D5E60]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

uint64_t NTKInterpolateBetweenColors()
{
  return MEMORY[0x1F4130748]();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return MEMORY[0x1F4130770]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}