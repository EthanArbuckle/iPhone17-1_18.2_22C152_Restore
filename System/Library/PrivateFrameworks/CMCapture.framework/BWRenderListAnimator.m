@interface BWRenderListAnimator
+ (void)initialize;
- (BOOL)isCompleted;
- (BOOL)isPrepared;
- (BWRenderList)finalRenderList;
- (BWRenderList)initialRenderList;
- (BWRenderList)renderList;
- (BWRenderListAnimator)initWithInitialParameters:(id)a3 initialRenderList:(id)a4 finalParameters:(id)a5 finalRenderList:(id)a6 animation:(int64_t)a7;
- (BWRenderListParameters)finalParameters;
- (BWRenderListParameters)initialParameters;
- (BWRenderListParameters)parameters;
- (id)description;
- (id)interpolateParameters;
- (uint64_t)_configureSpringSimulationWithAnimation:(uint64_t)result;
- (uint64_t)_parametersContainLiveStageRendering:(uint64_t)a1;
- (void)dealloc;
- (void)prepareWithInputVideoFormat:(id)a3 inputMediaPropertiesByAttachedMediaKey:(id)a4;
- (void)setPrepared:(uint64_t)a1;
@end

@implementation BWRenderListAnimator

- (void)setPrepared:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __36__BWRenderListAnimator_setPrepared___block_invoke;
    v3[3] = &unk_1E5C24B78;
    v3[4] = a1;
    char v4 = a2;
    dispatch_sync(v2, v3);
  }
}

- (void)prepareWithInputVideoFormat:(id)a3 inputMediaPropertiesByAttachedMediaKey:(id)a4
{
  if (![(BWRenderListAnimator *)self isPrepared])
  {
    [(BWRenderList *)self->_initialRenderList prepareWithParameters:self->_initialParameters forInputVideoFormat:a3 inputMediaPropertiesByAttachedMediaKey:a4];
    [(BWRenderList *)self->_finalRenderList prepareWithParameters:self->_finalParameters forInputVideoFormat:a3 inputMediaPropertiesByAttachedMediaKey:a4];
    [(BWRenderList *)self->_interpolatingRenderList prepareWithParameters:self->_interpolatingParameters forInputVideoFormat:a3 inputMediaPropertiesByAttachedMediaKey:a4];
    -[BWRenderListAnimator setPrepared:]((uint64_t)self, 1);
  }
}

- (BOOL)isPrepared
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  preparationMutexQueue = self->_preparationMutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__BWRenderListAnimator_isPrepared__block_invoke;
  v5[3] = &unk_1E5C246B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(preparationMutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BWRenderListAnimator)initWithInitialParameters:(id)a3 initialRenderList:(id)a4 finalParameters:(id)a5 finalRenderList:(id)a6 animation:(int64_t)a7
{
  v59.receiver = self;
  v59.super_class = (Class)BWRenderListAnimator;
  v12 = [(BWRenderListAnimator *)&v59 init];
  if (!v12) {
    return 0;
  }
  int64_t v13 = (int64_t)v12;
  if (a7)
  {
    v12->_preparationMutexQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.render-list-animator.preparation", 0);
    *(void *)(v13 + 56) = a3;
    *(void *)(v13 + 48) = a4;
    *(void *)(v13 + 72) = a5;
    *(void *)(v13 + 64) = a6;
    int64_t v53 = a7;
    if ([*(id *)(v13 + 48) affectsMetadata]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = [*(id *)(v13 + 64) affectsMetadata];
    }
    v52 = [[BWRenderList alloc] initWithAnimationSupported:1 affectsMetadata:v14];
    v15 = [(BWRenderList *)v52 rendererList];
    v16 = (unint64_t *)[*(id *)(v13 + 48) rendererList];
    v17 = (unint64_t *)[*(id *)(v13 + 64) rendererList];
    v51 = objc_alloc_init(BWRenderListParameters);
    v55 = [(BWRenderListParameters *)v51 parameterList];
    if (a3) {
      id v18 = a3;
    }
    else {
      id v18 = a4;
    }
    v19 = (void *)[v18 parameterList];
    if (a5) {
      id v20 = a5;
    }
    else {
      id v20 = a6;
    }
    v21 = (void *)[v20 parameterList];
    if (v16)
    {
      unint64_t v22 = *v16;
      if (v17)
      {
LABEL_16:
        unint64_t v23 = *v17;
        goto LABEL_19;
      }
    }
    else
    {
      unint64_t v22 = 0;
      if (v17) {
        goto LABEL_16;
      }
    }
    unint64_t v23 = 0;
LABEL_19:
    v54 = v15;
    if (v15)
    {
      slh_first = v15->slh_first;
      if (v19) {
        goto LABEL_21;
      }
    }
    else
    {
      slh_first = 0;
      if (v19)
      {
LABEL_21:
        v24 = (void *)*v19;
        if (v21)
        {
LABEL_22:
          v25 = (void *)*v21;
          goto LABEL_26;
        }
LABEL_25:
        v25 = 0;
LABEL_26:
        if (v55) {
          v57 = v55->slh_first;
        }
        else {
          v57 = 0;
        }
        while (1)
        {
          if (!(v22 | v23))
          {
            a7 = v13;
            *(void *)(v13 + 24) = v52;
            *(void *)(v13 + 32) = v51;
            -[BWRenderListAnimator _configureSpringSimulationWithAnimation:](v13, v53);
            return (BWRenderListAnimator *)a7;
          }
          if (v22)
          {
            v26 = *(void **)(v22 + 8);
            if (!v23) {
              goto LABEL_31;
            }
          }
          else
          {
            v26 = 0;
            if (!v23)
            {
LABEL_31:
              v27 = 0;
              if (!v24) {
                goto LABEL_35;
              }
              goto LABEL_32;
            }
          }
          v27 = *(void **)(v23 + 8);
          if (!v24)
          {
LABEL_35:
            v28 = 0;
            goto LABEL_36;
          }
LABEL_32:
          v28 = (void *)v24[1];
LABEL_36:
          v58 = v25;
          if (v25)
          {
            v29 = (void *)v25[1];
            if (!v26) {
              goto LABEL_50;
            }
LABEL_40:
            if (!v27) {
              goto LABEL_50;
            }
            int v30 = [v26 type];
            if (v30 != [v27 type]) {
              goto LABEL_50;
            }
            v31 = (BWRenderListRendererNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
            id v32 = v27;
            p_slh_first = &v54->slh_first;
            if (slh_first) {
              p_slh_first = &slh_first->var0.var0;
            }
            v31->var0.var0 = *p_slh_first;
            v31->var1 = v32;
            *p_slh_first = v31;
            if (v28) {
              v34 = v28;
            }
            else {
              v34 = v29;
            }
            v35 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
            uint64_t v36 = [v34 copyWithZone:0];
            v37 = v55;
            if (v57) {
              v37 = (BWRenderListParameterList *)v57;
            }
            *(void *)v35 = v37->slh_first;
            *((void *)v35 + 1) = v36;
            v37->slh_first = v35;
            unint64_t v22 = *(void *)v22;
            v24 = (void *)*v24;
            unint64_t v23 = *(void *)v23;
            v25 = (void *)*v58;
            slh_first = v31;
            v57 = v35;
          }
          else
          {
            v29 = 0;
            if (v26) {
              goto LABEL_40;
            }
LABEL_50:
            if (v22)
            {
              v38 = (BWRenderListRendererNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              id v39 = v26;
              p_var0 = &v54->slh_first;
              if (slh_first) {
                p_var0 = &slh_first->var0.var0;
              }
              v38->var0.var0 = *p_var0;
              v38->var1 = v39;
              *p_var0 = v38;
              v41 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              uint64_t v42 = [v28 copyWithZone:0];
              v43 = v55;
              if (v57) {
                v43 = (BWRenderListParameterList *)v57;
              }
              *(void *)v41 = v43->slh_first;
              *((void *)v41 + 1) = v42;
              v43->slh_first = v41;
              unint64_t v22 = *(void *)v22;
              v24 = (void *)*v24;
              slh_first = v38;
              v57 = v41;
              v25 = v58;
            }
            else if (v23)
            {
              v44 = (BWRenderListRendererNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              id v45 = v27;
              v46 = &v54->slh_first;
              if (slh_first) {
                v46 = &slh_first->var0.var0;
              }
              v44->var0.var0 = *v46;
              v44->var1 = v45;
              *v46 = v44;
              v47 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              uint64_t v48 = [v29 copyWithZone:0];
              unint64_t v22 = 0;
              v49 = v55;
              if (v57) {
                v49 = (BWRenderListParameterList *)v57;
              }
              *(void *)v47 = v49->slh_first;
              *((void *)v47 + 1) = v48;
              v49->slh_first = v47;
              unint64_t v23 = *(void *)v23;
              v25 = (void *)*v58;
              slh_first = v44;
              v57 = v47;
            }
            else
            {
              unint64_t v22 = 0;
              unint64_t v23 = 0;
              v25 = v58;
            }
          }
        }
      }
    }
    v24 = 0;
    if (v21) {
      goto LABEL_22;
    }
    goto LABEL_25;
  }

  return (BWRenderListAnimator *)a7;
}

- (id)interpolateParameters
{
  if (![(BWRenderListAnimator *)self isCompleted])
  {
    [(BWSpringSimulation *)self->_springSimulation update];
    [(BWSpringSimulation *)self->_springSimulation output];
    if (v4 >= 1.0 || ([(BWSpringSimulation *)self->_springSimulation output], float v5 = 0.0, v6 > 0.0))
    {
      [(BWSpringSimulation *)self->_springSimulation output];
      float v5 = 1.0;
      if (v7 < 1.0)
      {
        [(BWSpringSimulation *)self->_springSimulation output];
        float v5 = v8;
      }
    }
    initialParameters = self->_initialParameters;
    if (!initialParameters) {
      initialParameters = self->_initialRenderList;
    }
    v10 = (unint64_t *)[initialParameters parameterList];
    finalParameters = self->_finalParameters;
    if (!finalParameters) {
      finalParameters = self->_finalRenderList;
    }
    v12 = (unint64_t *)[finalParameters parameterList];
    interpolatingParameters = self->_interpolatingParameters;
    p_interpolatingParameters = &self->_interpolatingParameters;
    uint64_t v14 = [(BWRenderListParameters *)interpolatingParameters parameterList];
    if (v10)
    {
      unint64_t v15 = *v10;
      if (v12) {
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v15 = 0;
      if (v12)
      {
LABEL_13:
        unint64_t v16 = *v12;
        if (v14)
        {
LABEL_14:
          slh_first = v14->slh_first;
          goto LABEL_42;
        }
        goto LABEL_17;
      }
    }
    unint64_t v16 = 0;
    if (v14) {
      goto LABEL_14;
    }
LABEL_17:
    slh_first = 0;
    while (1)
    {
LABEL_42:
      if (!(v15 | v16)) {
        return *p_interpolatingParameters;
      }
      if (v15)
      {
        id v18 = *(void **)(v15 + 8);
        if (!v16) {
          goto LABEL_20;
        }
      }
      else
      {
        id v18 = 0;
        if (!v16)
        {
LABEL_20:
          v19 = 0;
          if (!slh_first) {
            goto LABEL_40;
          }
          goto LABEL_24;
        }
      }
      v19 = *(void **)(v16 + 8);
      if (!slh_first) {
        goto LABEL_40;
      }
LABEL_24:
      id v20 = (void *)*((void *)slh_first + 1);
      if (v18
        && v19
        && v20
        && (int v21 = [v18 type], v21 == objc_msgSend(v19, "type"))
        && (int v22 = [v18 type], v22 == objc_msgSend(v20, "type")))
      {
        *(float *)&double v23 = v5;
        [v20 updateByInterpolatingFromParameters:v18 toParameters:v19 withFractionComplete:v23];
        unint64_t v15 = *(void *)v15;
LABEL_38:
        unint64_t v16 = *(void *)v16;
LABEL_39:
        slh_first = *(BWRenderListParameterNode **)slh_first;
      }
      else
      {
        if (v18)
        {
          if (v20)
          {
            int v24 = [v18 type];
            if (v24 == [v20 type])
            {
              *(float *)&double v25 = v5;
              [v20 updateByInterpolatingFromParameters:v18 toParameters:0 withFractionComplete:v25];
              unint64_t v15 = *(void *)v15;
              goto LABEL_39;
            }
          }
        }
        if (v19)
        {
          if (v20)
          {
            int v26 = [v19 type];
            if (v26 == [v20 type])
            {
              *(float *)&double v27 = v5;
              [v20 updateByInterpolatingFromParameters:0 toParameters:v19 withFractionComplete:v27];
              goto LABEL_38;
            }
          }
        }
LABEL_40:
        if (v15 != 0 || v16 != 0) {
          return *p_interpolatingParameters;
        }
        unint64_t v15 = 0;
        unint64_t v16 = 0;
      }
    }
  }
  p_interpolatingParameters = &self->_interpolatingParameters;
  return *p_interpolatingParameters;
}

- (BOOL)isCompleted
{
  if ([(BWSpringSimulation *)self->_springSimulation isCompleted]) {
    return 1;
  }
  [(BWSpringSimulation *)self->_springSimulation output];
  return v4 > 0.998;
}

- (BWRenderList)finalRenderList
{
  return self->_finalRenderList;
}

- (BWRenderList)renderList
{
  return self->_interpolatingRenderList;
}

uint64_t __36__BWRenderListAnimator_setPrepared___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __34__BWRenderListAnimator_isPrepared__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (uint64_t)_configureSpringSimulationWithAnimation:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    double v4 = objc_alloc_init(BWSpringSimulation);
    *(void *)(v3 + 40) = v4;
    [(BWSpringSimulation *)v4 resetWithInput:1.0 initialOutput:0.0 initialVelocity:0.0];
    float v5 = *(void **)(v3 + 56);
    if (!v5) {
      float v5 = *(void **)(v3 + 48);
    }
    double v6 = (void *)[v5 parameterList];
    double v7 = *(void **)(v3 + 72);
    if (!v7) {
      double v7 = *(void **)(v3 + 64);
    }
    double v8 = (void *)[v7 parameterList];
    int v9 = -[BWRenderListAnimator _parametersContainLiveStageRendering:](v3, v6);
    result = -[BWRenderListAnimator _parametersContainLiveStageRendering:](v3, v8);
    if (v9 == result)
    {
      uint64_t v12 = a2 - 1;
      if ((unint64_t)(a2 - 1) > 2) {
        return result;
      }
      double v11 = dbl_1A5EFD5A8[v12];
      double v10 = dbl_1A5EFD5C0[v12];
    }
    else
    {
      double v10 = 15.0;
      double v11 = 100.0;
    }
    [*(id *)(v3 + 40) setTension:v11];
    int64_t v13 = *(void **)(v3 + 40);
    return [v13 setFriction:v10];
  }
  return result;
}

- (uint64_t)_parametersContainLiveStageRendering:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    double v4 = (void *)*a2;
    if (*a2)
    {
      while (1)
      {
        float v5 = (void *)v4[1];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v5 renderingStrategy] == 5 || objc_msgSend(v5, "renderingStrategy") == 7))
        {
          break;
        }
        double v4 = (void *)*v4;
        if (!v4) {
          return 0;
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWRenderListAnimator;
  [(BWRenderListAnimator *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p> prepared:%d completed:%d, inputInitialRenderListParameters:%@ inputInitialRenderList:%@, inputFinalRenderListParameters:%@, inputFinalRenderList:%@", objc_opt_class(), self, -[BWRenderListAnimator isPrepared](self, "isPrepared"), -[BWRenderListAnimator isCompleted](self, "isCompleted"), self->_initialParameters, self->_initialRenderList, self->_finalParameters, self->_finalRenderList];
}

- (BWRenderListParameters)parameters
{
  return self->_interpolatingParameters;
}

- (BWRenderList)initialRenderList
{
  return self->_initialRenderList;
}

- (BWRenderListParameters)initialParameters
{
  return self->_initialParameters;
}

- (BWRenderListParameters)finalParameters
{
  return self->_finalParameters;
}

@end