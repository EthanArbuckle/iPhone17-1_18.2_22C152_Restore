id sub_5500(float32x2_t *a1)
{
  void *v2;
  uint64_t vars8;

  objc_msgSend(*(id *)&a1[4], "convertPointFromView:", vmulq_f64(vcvtq_f64_f32(a1[5]), (float64x2_t)xmmword_A5D0));
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "launchFireworkAt:type:scale:color:", 1, 0);
}

id sub_5564(float32x2_t *a1)
{
  objc_msgSend(*(id *)&a1[4], "convertPointFromView:", vmulq_f64(vcvtq_f64_f32(a1[5]), (float64x2_t)xmmword_A5E0));
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "launchFireworkAt:type:scale:color:", 2, 1);
}

id sub_55C8(float32x2_t *a1)
{
  objc_msgSend(*(id *)&a1[4], "convertPointFromView:", vmulq_f64(vcvtq_f64_f32(a1[5]), (float64x2_t)xmmword_A5F0));
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "launchFireworkAt:type:scale:color:", 2, 3);
}

id sub_562C(float32x2_t *a1)
{
  objc_msgSend(*(id *)&a1[4], "convertPointFromView:", vmulq_f64(vcvtq_f64_f32(a1[5]), (float64x2_t)xmmword_A600));
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "launchFireworkAt:type:scale:color:", 2, 2);
}

id sub_56A4(float32x2_t *a1)
{
  objc_msgSend(*(id *)&a1[4], "convertPointFromView:", vmulq_f64(vcvtq_f64_f32(a1[5]), (float64x2_t)xmmword_A610));
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "launchFireworkAt:type:scale:color:", 2, 1);
}

id sub_5708(float32x2_t *a1)
{
  objc_msgSend(*(id *)&a1[4], "convertPointFromView:", vmulq_f64(vcvtq_f64_f32(a1[5]), (float64x2_t)xmmword_A620));
  v2 = (void *)a1[4];

  return objc_msgSend(v2, "launchFireworkAt:type:scale:color:", 1, 0);
}

void sub_576C(id *a1, double a2)
{
  float v3 = a2 / 0.819999993;
  [a1[4] red];
  double v5 = v4;
  double v6 = v3;
  [a1[5] red];
  double v8 = v7;
  [a1[4] red];
  float v10 = v5 + v6 * (v8 - v9);
  [a1[4] green];
  double v12 = v11;
  [a1[5] green];
  double v14 = v13;
  [a1[4] green];
  float v16 = v12 + v6 * (v14 - v15);
  [a1[4] blue];
  double v18 = v17;
  [a1[5] blue];
  double v20 = v19;
  [a1[4] blue];
  float v22 = v18 + v6 * (v20 - v21);
  [a1[4] alpha];
  double v24 = v23;
  [a1[5] alpha];
  double v26 = v25;
  [a1[4] alpha];
  float v28 = v24 + v6 * (v26 - v27);
  id v30 = +[UIColor colorWithRed:v10 * 255.0 / 255.0 green:v16 * 255.0 / 255.0 blue:v22 * 255.0 / 255.0 alpha:v28];
  v29 = [a1[6] scene];
  [v29 setBackgroundColor:v30];
}

void sub_58E4(id *a1, double a2)
{
  float v3 = a2 / 1.73000002;
  [a1[4] red];
  double v5 = v4;
  double v6 = v3;
  [a1[5] red];
  double v8 = v7;
  [a1[4] red];
  float v10 = v5 + v6 * (v8 - v9);
  [a1[4] green];
  double v12 = v11;
  [a1[5] green];
  double v14 = v13;
  [a1[4] green];
  float v16 = v12 + v6 * (v14 - v15);
  [a1[4] blue];
  double v18 = v17;
  [a1[5] blue];
  double v20 = v19;
  [a1[4] blue];
  float v22 = v18 + v6 * (v20 - v21);
  [a1[4] alpha];
  double v24 = v23;
  [a1[5] alpha];
  double v26 = v25;
  [a1[4] alpha];
  float v28 = v24 + v6 * (v26 - v27);
  id v30 = +[UIColor colorWithRed:v10 * 255.0 / 255.0 green:v16 * 255.0 / 255.0 blue:v22 * 255.0 / 255.0 alpha:v28];
  v29 = [a1[6] scene];
  [v29 setBackgroundColor:v30];
}

void sub_65D0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) children];
  [v1 enumerateObjectsUsingBlock:&stru_C2B8];
}

void sub_661C(id a1, SKNode *a2, unint64_t a3, BOOL *a4)
{
}

id sub_6838(uint64_t a1, double a2)
{
  float v2 = a2 / *(float *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(float)((float)((float)(v2 * v2) * 0.5) + 0.0)];
}

id sub_6C70(uint64_t a1, double a2)
{
  float v3 = a2 / 1.10000002;
  double v4 = (float)(*(float *)(a1 + 48) + (float)((float)(v3 * v3) * (float)(*(float *)(a1 + 52) - *(float *)(a1 + 48))));
  [*(id *)(a1 + 32) setParticleScale:v4];
  [*(id *)(a1 + 32) particleScale];
  [*(id *)(a1 + 32) setParticleScaleRange:v5 * 3.5];
  [*(id *)(a1 + 40) setParticleScale:v4];
  [*(id *)(a1 + 40) particleScale];
  [*(id *)(a1 + 40) setParticleScaleRange:v6 * 3.5];
  *(float *)&double v4 = (float)((float)(1.0 - powf(1.0 - v3, 4.0)) * 1.4) + 0.0;
  [*(id *)(a1 + 32) setEmissionDistance:(float)(*(float *)&v4 * *(float *)(a1 + 56))];
  [*(id *)(a1 + 32) emissionDistance];
  [*(id *)(a1 + 32) setEmissionDistanceRange:v7 * 0.25];
  [*(id *)(a1 + 40) setEmissionDistance:(float)(*(float *)&v4 * *(float *)(a1 + 56)) * 0.5];
  [*(id *)(a1 + 40) emissionDistance];
  [*(id *)(a1 + 40) setEmissionDistanceRange:v8 + v8];
  double v9 = (float)(*(float *)&v4 * *(float *)(a1 + 60));
  float v10 = *(void **)(a1 + 32);

  return [v10 setParticleBirthRate:v9];
}

id sub_6DA8(uint64_t a1)
{
  [*(id *)(a1 + 32) setParticleBirthRate:0.0];
  float v2 = *(void **)(a1 + 40);

  return [v2 setParticleBirthRate:0.0];
}

id sub_71E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setParticleBirthRate:*(float *)(a1 + 40)];
}

id sub_71F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setParticleBirthRate:0.0];
}

void sub_7A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose((const void *)(v48 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_7A2C(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    float v2 = [*(id *)(a1 + 32) physicsBody];
    objc_msgSend(v2, "applyImpulse:", *(double *)(a1 + 48) * *(float *)(a1 + 64), *(double *)(a1 + 56) * *(float *)(a1 + 64));

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_7A98(uint64_t a1, void *a2, double a3)
{
  id v19 = a2;
  float v5 = *(float *)(a1 + 56);
  float v6 = a3 / v5;
  if (a3 >= 0.100000001)
  {
    float v9 = fmin((a3 + -0.100000001) / (float)(v5 + -0.1) * 1.2, 1.0);
    float v8 = *(float *)(a1 + 60) + (float)((float)(v9 * v9) * (float)(*(float *)(a1 + 64) - *(float *)(a1 + 60)));
  }
  else
  {
    float v7 = fmin(a3 / 0.100000001 * 1.2, 1.0);
    float v8 = (float)((float)(v7 * v7) * (float)(*(float *)(a1 + 60) + -0.01)) + 0.01;
  }
  [*(id *)(a1 + 32) setParticleScale:v8];
  [*(id *)(a1 + 32) setParticleBirthRate:(float)(*(float *)(a1 + 68) + (float)(v6 * (float)(*(float *)(a1 + 72) - *(float *)(a1 + 68))))];
  if (v6 >= 0.6)
  {
    if (v6 >= 0.61 && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0)
    {
      double v11 = [*(id *)(a1 + 40) physicsBody];
      [v11 setFieldBitMask:4];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    double v12 = [*(id *)(a1 + 40) physicsBody];
    [v12 velocity];
    double v14 = v13 * 0.92;
    double v15 = [*(id *)(a1 + 40) physicsBody];
    [v15 velocity];
    double v17 = v16 * 0.92;
    double v18 = [*(id *)(a1 + 40) physicsBody];
    objc_msgSend(v18, "setVelocity:", v14, v17);
  }
}

id sub_7C78(uint64_t a1, double a2)
{
  float v2 = a2 / *(float *)(a1 + 40);
  return [*(id *)(a1 + 32) setParticleScale:(float)(*(float *)(a1 + 44) + (float)((float)(v2 * v2) * (float)(0.0 - *(float *)(a1 + 44))))];
}

id sub_7CA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setParticleBirthRate:0.0];
}

void sub_85A4()
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v0 = [v2 URLForResource:@"FireworksSoundEffect" withExtension:@"m4r"];
  id v1 = (void *)qword_11330;
  qword_11330 = v0;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

double drand48(void)
{
  return _drand48();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bigEmojiFilter(void *a1, const char *a2, ...)
{
  return [a1 bigEmojiFilter];
}

id objc_msgSend_blue(void *a1, const char *a2, ...)
{
  return [a1 blue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_dragField(void *a1, const char *a2, ...)
{
  return [a1 dragField];
}

id objc_msgSend_emissionDistance(void *a1, const char *a2, ...)
{
  return [a1 emissionDistance];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_green(void *a1, const char *a2, ...)
{
  return [a1 green];
}

id objc_msgSend_node(void *a1, const char *a2, ...)
{
  return [a1 node];
}

id objc_msgSend_numParticlesToEmit(void *a1, const char *a2, ...)
{
  return [a1 numParticlesToEmit];
}

id objc_msgSend_particleBirthRate(void *a1, const char *a2, ...)
{
  return [a1 particleBirthRate];
}

id objc_msgSend_particleColor(void *a1, const char *a2, ...)
{
  return [a1 particleColor];
}

id objc_msgSend_particleLifetime(void *a1, const char *a2, ...)
{
  return [a1 particleLifetime];
}

id objc_msgSend_particleLifetimeRange(void *a1, const char *a2, ...)
{
  return [a1 particleLifetimeRange];
}

id objc_msgSend_particleScale(void *a1, const char *a2, ...)
{
  return [a1 particleScale];
}

id objc_msgSend_particleScaleRange(void *a1, const char *a2, ...)
{
  return [a1 particleScaleRange];
}

id objc_msgSend_particleSpeed(void *a1, const char *a2, ...)
{
  return [a1 particleSpeed];
}

id objc_msgSend_particleSpeedRange(void *a1, const char *a2, ...)
{
  return [a1 particleSpeedRange];
}

id objc_msgSend_physicsBody(void *a1, const char *a2, ...)
{
  return [a1 physicsBody];
}

id objc_msgSend_physicsWorld(void *a1, const char *a2, ...)
{
  return [a1 physicsWorld];
}

id objc_msgSend_red(void *a1, const char *a2, ...)
{
  return [a1 red];
}

id objc_msgSend_removeAllActions(void *a1, const char *a2, ...)
{
  return [a1 removeAllActions];
}

id objc_msgSend_removeFromParent(void *a1, const char *a2, ...)
{
  return [a1 removeFromParent];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_shouldReduceParticles(void *a1, const char *a2, ...)
{
  return [a1 shouldReduceParticles];
}

id objc_msgSend_stickerFilter(void *a1, const char *a2, ...)
{
  return [a1 stickerFilter];
}

id objc_msgSend_subEmitterNode(void *a1, const char *a2, ...)
{
  return [a1 subEmitterNode];
}

id objc_msgSend_tapBackFilter(void *a1, const char *a2, ...)
{
  return [a1 tapBackFilter];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_velocity(void *a1, const char *a2, ...)
{
  return [a1 velocity];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_xScale(void *a1, const char *a2, ...)
{
  return [a1 xScale];
}