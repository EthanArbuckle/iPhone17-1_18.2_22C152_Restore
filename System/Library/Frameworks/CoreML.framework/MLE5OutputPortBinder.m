@interface MLE5OutputPortBinder
- (BOOL)_copyOutputFromPort:(e5rt_io_port *)a3 toOutputBacking:(id)a4 featureDescription:(id)a5 error:(id *)a6;
- (BOOL)_directlyBindOutputBacking:(id)a3 error:(id *)a4;
- (BOOL)_reusableForCopyBoundOutputBacking;
- (BOOL)_reusableForDirectlyBoundOutputBacking:(id)a3;
- (BOOL)bindAndReturnError:(id *)a3;
- (BOOL)boundFeatureDirectly;
- (BOOL)outputBackingWasDirectlyBound;
- (BOOL)reusableForOutputBacking:(id)a3 willBindDirectly:(BOOL *)a4;
- (MLE5OutputPortBinder)initWithPort:(e5rt_io_port *)a3 featureDescription:(id)a4;
- (MLFeatureDescription)featureDescription;
- (MLFeatureValue)featureValue;
- (MLPixelBufferPool)pixelBufferPool;
- (OS_dispatch_queue)serialQueue;
- (e5rt_io_port)portHandle;
- (id)_makeFeatureValueAndReturnError:(id *)a3;
- (id)_makeFeatureValueFromOutputBacking:(id)a3 error:(id *)a4;
- (id)_makeFeatureValueFromPort:(e5rt_io_port *)a3 featureDescription:(id)a4 error:(id *)a5;
- (id)outputBacking;
- (int64_t)_outputModeForOutputBacking:(id)a3 error:(id *)a4;
- (unsigned)_directModeForOutputBacking:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)reset;
- (void)setBoundFeatureDirectly:(BOOL)a3;
- (void)setOutputBacking:(id)a3;
- (void)setOutputBackingWasDirectlyBound:(BOOL)a3;
- (void)setPixelBufferPool:(id)a3;
@end

@implementation MLE5OutputPortBinder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong(&self->_outputBacking, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);

  objc_storeStrong((id *)&self->_featureValue, 0);
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (MLFeatureDescription)featureDescription
{
  return (MLFeatureDescription *)objc_getProperty(self, a2, 56, 1);
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (void)setBoundFeatureDirectly:(BOOL)a3
{
  self->_boundFeatureDirectly = a3;
}

- (BOOL)boundFeatureDirectly
{
  return self->_boundFeatureDirectly;
}

- (void)setOutputBackingWasDirectlyBound:(BOOL)a3
{
  self->_outputBackingWasDirectlyBound = a3;
}

- (BOOL)outputBackingWasDirectlyBound
{
  return self->_outputBackingWasDirectlyBound;
}

- (void)setOutputBacking:(id)a3
{
}

- (id)outputBacking
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setPixelBufferPool:(id)a3
{
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)reset
{
  featureValue = self->_featureValue;
  self->_featureValue = 0;

  id outputBacking = self->_outputBacking;
  self->_id outputBacking = 0;

  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
  [(MLE5OutputPortBinder *)self setOutputBackingWasDirectlyBound:0];

  [(MLE5OutputPortBinder *)self setBoundFeatureDirectly:1];
}

- (id)_makeFeatureValueFromPort:(e5rt_io_port *)a3 featureDescription:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unsigned int v8 = MLE5PortTraitOf();
  uint64_t v9 = [v7 type];
  {
    directOutputModeFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EB4DCD20 = 0u;
    dword_1EB4DCD30 = 1065353216;
  }
  if (directOutputModeFunctionTable(void)::onceToken != -1) {
    dispatch_once(&directOutputModeFunctionTable(void)::onceToken, &__block_literal_global_60);
  }
  uint64_t v10 = v8;
  if (!*((void *)&directOutputModeFunctionTable(void)::table + 1)) {
    goto LABEL_23;
  }
  unint64_t v11 = v9 | ((unint64_t)v8 << 24);
  uint8x8_t v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&directOutputModeFunctionTable(void)::table + 8));
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    unint64_t v13 = v9 | ((unint64_t)v8 << 24);
    if (v11 >= *((void *)&directOutputModeFunctionTable(void)::table + 1)) {
      unint64_t v13 = v11 % *((void *)&directOutputModeFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v13 = v11 & (*((void *)&directOutputModeFunctionTable(void)::table + 1) - 1);
  }
  v14 = *(uint64_t ***)(directOutputModeFunctionTable(void)::table + 8 * v13);
  if (!v14 || (v15 = *v14) == 0)
  {
LABEL_23:
    v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v27 = off_1E59A4930[v8];
      v28 = +[MLFeatureTypeUtils descriptionForType:v9];
      *(_DWORD *)buf = 138412546;
      v54 = v27;
      __int16 v55 = 2112;
      v56 = v28;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "The output feature type is not supported. (Port trait %@, Feature type %@.)", buf, 0x16u);
    }
    if (a5)
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v20 = NSString;
      v21 = off_1E59A4930[v10];
      v22 = +[MLFeatureTypeUtils descriptionForType:v9];
      v23 = [v20 stringWithFormat:@"The output feature type is not supported. (Port trait %@, Feature type %@.)", v21, v22, v51];
      v52 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      *a5 = [v19 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v24];
    }
    goto LABEL_27;
  }
  while (1)
  {
    unint64_t v17 = v15[1];
    if (v11 == v17) {
      break;
    }
    if (v12.u32[0] > 1uLL)
    {
      if (v17 >= *((void *)&directOutputModeFunctionTable(void)::table + 1)) {
        v17 %= *((void *)&directOutputModeFunctionTable(void)::table + 1);
      }
    }
    else
    {
      v17 &= *((void *)&directOutputModeFunctionTable(void)::table + 1) - 1;
    }
    if (v17 != v13) {
      goto LABEL_23;
    }
LABEL_22:
    v15 = (uint64_t *)*v15;
    if (!v15) {
      goto LABEL_23;
    }
  }
  if (*((unsigned __int8 *)v15 + 16) != v8 || *((unsigned char *)v15 + 17) || *((unsigned char *)v15 + 18) || v15[3] != v9) {
    goto LABEL_22;
  }
  v29 = (uint64_t (*)(e5rt_io_port *, void *, id *))v15[4];
  if (!v29) {
    goto LABEL_27;
  }
  v30 = [(MLE5OutputPortBinder *)self portHandle];
  v31 = [(MLE5OutputPortBinder *)self featureDescription];
  unsigned int v32 = v29(v30, v31, a5);

  if (!v32) {
    goto LABEL_27;
  }
  [(MLE5OutputPortBinder *)self setBoundFeatureDirectly:v32 == 1];
  {
    outputFeatureValueFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1EB4DCD50 = 0u;
    dword_1EB4DCD60 = 1065353216;
  }
  if (outputFeatureValueFunctionTable(void)::onceToken != -1) {
    dispatch_once(&outputFeatureValueFunctionTable(void)::onceToken, &__block_literal_global_71);
  }
  if (!*((void *)&outputFeatureValueFunctionTable(void)::table + 1)) {
    goto LABEL_55;
  }
  unint64_t v16 = (unint64_t)v8 << 24;
  unint64_t v33 = v16 | ((unint64_t)v32 << 8) | v9;
  uint8x8_t v34 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputFeatureValueFunctionTable(void)::table + 8));
  v34.i16[0] = vaddlv_u8(v34);
  if (v34.u32[0] > 1uLL)
  {
    unint64_t v35 = v16 | ((unint64_t)v32 << 8) | v9;
    if (v33 >= *((void *)&outputFeatureValueFunctionTable(void)::table + 1)) {
      unint64_t v35 = v33 % *((void *)&outputFeatureValueFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v35 = v33 & (*((void *)&outputFeatureValueFunctionTable(void)::table + 1) - 1);
  }
  v36 = *(uint64_t ***)(outputFeatureValueFunctionTable(void)::table + 8 * v35);
  if (!v36 || (v37 = *v36) == 0)
  {
LABEL_55:
    v39 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v46 = off_1E59A4930[v8];
      v47 = +[MLFeatureTypeUtils descriptionForType:v9];
      *(_DWORD *)buf = 138412546;
      v54 = v46;
      __int16 v55 = 2112;
      v56 = v47;
      _os_log_error_impl(&dword_19E58B000, v39, OS_LOG_TYPE_ERROR, "The output feature value is not supported. (Port trait %@, feature type %@.)", buf, 0x16u);
    }
    if (a5)
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v41 = NSString;
      v42 = off_1E59A4930[v10];
      v43 = +[MLFeatureTypeUtils descriptionForType:v9];
      v44 = [v41 stringWithFormat:@"The output feature value is not supported. (Port trait %@, feature type %@.)", v42, v43, v51];
      v52 = v44;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      *a5 = [v40 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v45];
    }
    goto LABEL_27;
  }
  while (2)
  {
    unint64_t v38 = v37[1];
    if (v33 != v38)
    {
      if (v34.u32[0] > 1uLL)
      {
        if (v38 >= *((void *)&outputFeatureValueFunctionTable(void)::table + 1)) {
          v38 %= *((void *)&outputFeatureValueFunctionTable(void)::table + 1);
        }
      }
      else
      {
        v38 &= *((void *)&outputFeatureValueFunctionTable(void)::table + 1) - 1;
      }
      if (v38 != v35) {
        goto LABEL_55;
      }
      goto LABEL_54;
    }
    if (*((unsigned __int8 *)v37 + 16) != v8
      || *((unsigned char *)v37 + 17)
      || *((unsigned __int8 *)v37 + 18) != v32
      || v37[3] != v9)
    {
LABEL_54:
      v37 = (uint64_t *)*v37;
      if (!v37) {
        goto LABEL_55;
      }
      continue;
    }
    break;
  }
  v48 = (void (*)(e5rt_io_port *, void *, id *))v37[4];
  if (!v48)
  {
LABEL_27:
    v25 = 0;
    goto LABEL_28;
  }
  v49 = [(MLE5OutputPortBinder *)self portHandle];
  v50 = [(MLE5OutputPortBinder *)self featureDescription];
  v25 = v48(v49, v50, a5);

  if (v32 == 1)
  {
    CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
    self->_temporarilyBoundPixelBuffer = 0;
  }
LABEL_28:

  return v25;
}

- (BOOL)_copyOutputFromPort:(e5rt_io_port *)a3 toOutputBacking:(id)a4 featureDescription:(id)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = MLE5PortTraitOf();
  unsigned int v12 = MLE5FeatureTraitOfBackingObject(v9);
  {
    outputCopyFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1E946A400 = 0u;
    dword_1E946A410 = 1065353216;
  }
  if (outputCopyFunctionTable(void)::onceToken != -1) {
    dispatch_once(&outputCopyFunctionTable(void)::onceToken, &__block_literal_global_64);
  }
  uint64_t v13 = v12;
  if (*((void *)&outputCopyFunctionTable(void)::table + 1))
  {
    unint64_t v14 = ((unint64_t)v11 << 24) | ((unint64_t)v12 << 16);
    uint8x8_t v15 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputCopyFunctionTable(void)::table + 8));
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v16 = ((unint64_t)v11 << 24) | ((unint64_t)v12 << 16);
      if (v14 >= *((void *)&outputCopyFunctionTable(void)::table + 1)) {
        unint64_t v16 = v14 % *((void *)&outputCopyFunctionTable(void)::table + 1);
      }
    }
    else
    {
      unint64_t v16 = v14 & (*((void *)&outputCopyFunctionTable(void)::table + 1) - 1);
    }
    unint64_t v17 = *(uint64_t ***)(outputCopyFunctionTable(void)::table + 8 * v16);
    if (v17)
    {
      for (i = *v17; i; i = (uint64_t *)*i)
      {
        unint64_t v19 = i[1];
        if (v14 == v19)
        {
          if (*((unsigned __int8 *)i + 16) == v11
            && *((unsigned __int8 *)i + 17) == v12
            && !*((unsigned char *)i + 18)
            && !i[3])
          {
            goto LABEL_26;
          }
        }
        else
        {
          if (v15.u32[0] > 1uLL)
          {
            if (v19 >= *((void *)&outputCopyFunctionTable(void)::table + 1)) {
              v19 %= *((void *)&outputCopyFunctionTable(void)::table + 1);
            }
          }
          else
          {
            v19 &= *((void *)&outputCopyFunctionTable(void)::table + 1) - 1;
          }
          if (v19 != v16) {
            break;
          }
        }
      }
    }
  }
  v20 = +[MLLogging coreChannel];
  uint64_t v21 = v11;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v22 = off_1E59A4930[v11];
    v23 = off_1E59A4948[v12];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v22;
    __int16 v33 = 2112;
    uint8x8_t v34 = v23;
    _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)", buf, 0x16u);
  }
  a3 = (e5rt_io_port *)MEMORY[0x1E4F28C58];
  uint64_t v31 = *MEMORY[0x1E4F28568];
  v24 = NSString;
  v25 = off_1E59A4930[v21];
  v26 = off_1E59A4948[v13];
  v27 = [v24 stringWithFormat:@"The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)", v25, v26];
  *(void *)buf = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v31 count:1];
  *a6 = [(e5rt_io_port *)a3 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v28];

  __break(1u);
LABEL_26:
  char v29 = ((uint64_t (*)(e5rt_io_port *, id, id, id *))i[4])(a3, v9, v10, a6);

  return v29;
}

- (id)_makeFeatureValueFromOutputBacking:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = MLE5FeatureTraitOfBackingObject(v5);
  if ((v6 - 1) < 2)
  {
    uint64_t v7 = +[MLFeatureValue featureValueWithMultiArray:v5];
LABEL_5:
    unsigned int v8 = (void *)v7;
    if (v7) {
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  if ((v6 - 3) < 2)
  {
    uint64_t v7 = +[MLFeatureValue featureValueWithPixelBuffer:v5];
    goto LABEL_5;
  }
LABEL_6:
  id v9 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v5;
    _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Failed to create MLFeatureValue from the specified output backing object %@", buf, 0xCu);
  }

  if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    unsigned int v11 = [NSString stringWithFormat:@"Failed to create MLFeatureValue from the specified output backing object %@", v5];
    uint8x8_t v15 = v11;
    unsigned int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v12];
  }
  unsigned int v8 = 0;
LABEL_11:

  return v8;
}

- (id)_makeFeatureValueAndReturnError:(id *)a3
{
  kdebug_trace();
  id v5 = [(MLE5OutputPortBinder *)self portHandle];
  int v6 = [(MLE5OutputPortBinder *)self outputBacking];
  uint64_t v7 = [(MLE5OutputPortBinder *)self featureDescription];
  if ([(MLE5OutputPortBinder *)self outputBackingWasDirectlyBound])
  {
    unsigned int v8 = [(MLE5OutputPortBinder *)self _makeFeatureValueFromOutputBacking:v6 error:a3];
    [(MLE5OutputPortBinder *)self setBoundFeatureDirectly:1];
  }
  else if (v6)
  {
    if ([(MLE5OutputPortBinder *)self _copyOutputFromPort:v5 toOutputBacking:v6 featureDescription:v7 error:a3])
    {
      unsigned int v8 = [(MLE5OutputPortBinder *)self _makeFeatureValueFromOutputBacking:v6 error:a3];
      [(MLE5OutputPortBinder *)self setBoundFeatureDirectly:0];
    }
    else
    {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = [(MLE5OutputPortBinder *)self _makeFeatureValueFromPort:v5 featureDescription:v7 error:a3];
  }

  kdebug_trace();

  return v8;
}

- (MLFeatureValue)featureValue
{
  v3 = [(MLE5OutputPortBinder *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MLE5OutputPortBinder_featureValue__block_invoke;
  block[3] = &unk_1E59A5328;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_featureValue;
}

void __36__MLE5OutputPortBinder_featureValue__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    uint64_t v3 = [v2 _makeFeatureValueAndReturnError:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;
  }
}

- (BOOL)bindAndReturnError:(id *)a3
{
  featureValue = self->_featureValue;
  self->_featureValue = 0;

  int v6 = [(MLE5OutputPortBinder *)self outputBacking];
  int64_t v7 = [(MLE5OutputPortBinder *)self _outputModeForOutputBacking:v6 error:a3];
  if (v7 == 1)
  {
    if ([(MLE5OutputPortBinder *)self _reusableForDirectlyBoundOutputBacking:v6]|| (CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer), self->_temporarilyBoundPixelBuffer = 0, [(MLE5OutputPortBinder *)self _directlyBindOutputBacking:v6 error:a3]))
    {
      BOOL v11 = 1;
      [(MLE5OutputPortBinder *)self setOutputBackingWasDirectlyBound:1];
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v7 == 2)
  {
    if ([(MLE5OutputPortBinder *)self _reusableForCopyBoundOutputBacking]) {
      goto LABEL_7;
    }
    CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
    self->_temporarilyBoundPixelBuffer = 0;
    unsigned int v8 = [(MLE5OutputPortBinder *)self portHandle];
    id v9 = [(MLE5OutputPortBinder *)self pixelBufferPool];
    BOOL v10 = MLE5BindEmptyMemoryObjectToPort((uint64_t)v8, v9, &self->_temporarilyBoundPixelBuffer, a3);

    if (v10) {
      goto LABEL_7;
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  if (v7 != 3) {
    goto LABEL_11;
  }
LABEL_7:
  [(MLE5OutputPortBinder *)self setOutputBackingWasDirectlyBound:0];
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)_directlyBindOutputBacking:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(MLE5OutputPortBinder *)self portHandle];
  [(MLE5OutputPortBinder *)self portHandle];
  unsigned int v8 = MLE5PortTraitOf();
  unsigned int v9 = MLE5FeatureTraitOfBackingObject(v6);
  {
    outputBackingBindFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1E945FCE8 = 0u;
    dword_1E945FCF8 = 1065353216;
  }
  if (outputBackingBindFunctionTable(void)::onceToken != -1) {
    dispatch_once(&outputBackingBindFunctionTable(void)::onceToken, &__block_literal_global_20);
  }
  if (!*((void *)&outputBackingBindFunctionTable(void)::table + 1)) {
    goto LABEL_23;
  }
  unint64_t v10 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputBackingBindFunctionTable(void)::table + 8));
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v12 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
    if (v10 >= *((void *)&outputBackingBindFunctionTable(void)::table + 1)) {
      unint64_t v12 = v10 % *((void *)&outputBackingBindFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v12 = v10 & (*((void *)&outputBackingBindFunctionTable(void)::table + 1) - 1);
  }
  uint64_t v13 = *(uint64_t ***)(outputBackingBindFunctionTable(void)::table + 8 * v12);
  if (!v13 || (uint64_t v14 = *v13) == 0)
  {
LABEL_23:
    unint64_t v16 = +[MLLogging coreChannel];
    uint64_t v17 = v8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v25 = off_1E59A4930[v8];
      *(_DWORD *)buf = 138412290;
      v30 = v25;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "The output feature type is not supported. (Port trait %@.)", buf, 0xCu);
    }
    if (a4)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      unint64_t v19 = NSString;
      v20 = off_1E59A4930[v17];
      uint64_t v21 = [v19 stringWithFormat:@"The output feature type is not supported. (Port trait %@.)", v20];
      v28 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a4 = [v18 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v22];
    }
    goto LABEL_27;
  }
  while (1)
  {
    unint64_t v15 = v14[1];
    if (v10 == v15) {
      break;
    }
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= *((void *)&outputBackingBindFunctionTable(void)::table + 1)) {
        v15 %= *((void *)&outputBackingBindFunctionTable(void)::table + 1);
      }
    }
    else
    {
      v15 &= *((void *)&outputBackingBindFunctionTable(void)::table + 1) - 1;
    }
    if (v15 != v12) {
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v14 = (uint64_t *)*v14;
    if (!v14) {
      goto LABEL_23;
    }
  }
  if (*((unsigned __int8 *)v14 + 16) != v8 || *((unsigned __int8 *)v14 + 17) != v9 || *((unsigned char *)v14 + 18) || v14[3]) {
    goto LABEL_22;
  }
  v26 = (uint64_t (*)(e5rt_io_port *, id, id *))v14[4];
  if (v26)
  {
    char v23 = v26(v7, v6, a4);
    goto LABEL_28;
  }
LABEL_27:
  char v23 = 0;
LABEL_28:

  return v23;
}

- (int64_t)_outputModeForOutputBacking:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MLE5OutputPortBinder *)self portHandle];
  uint64_t is_dynamic = e5rt_io_port_is_dynamic();
  if (is_dynamic)
  {
    unsigned int v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v15 = [(MLE5OutputPortBinder *)self featureDescription];
      unint64_t v16 = [v15 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v16;
      __int16 v19 = 2080;
      uint64_t last_error_message = e5rt_get_last_error_message();
      __int16 v21 = 1024;
      int v22 = is_dynamic;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Unable to query if output feature %@'s output shape is data dependent or not. E5RT: %s (%d)", buf, 0x1Cu);
    }
    unsigned int v9 = (void *)MEMORY[0x1E4F1CA00];
    unint64_t v10 = [(MLE5OutputPortBinder *)self featureDescription];
    uint8x8_t v11 = [v10 name];
    [v9 raise:*MEMORY[0x1E4F1C3A8], @"Unable to query if output feature %@'s output shape is data dependent or not. E5RT: %s (%d)", v11, e5rt_get_last_error_message(), is_dynamic format];
  }
  if (v6)
  {
    int v12 = [(MLE5OutputPortBinder *)self _directModeForOutputBacking:v6 error:a4];
    if (v12 == 1) {
      int64_t v13 = 1;
    }
    else {
      int64_t v13 = 2 * (v12 == 2);
    }
  }
  else
  {
    int64_t v13 = 2;
  }

  return v13;
}

- (unsigned)_directModeForOutputBacking:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(MLE5OutputPortBinder *)self portHandle];
  unsigned int v8 = MLE5PortTraitOf();
  unsigned int v9 = MLE5FeatureTraitOfBackingObject(v6);
  {
    directOutputBackingModeFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1E945FD48 = 0u;
    dword_1E945FD58 = 1065353216;
  }
  if (directOutputBackingModeFunctionTable(void)::onceToken != -1) {
    dispatch_once(&directOutputBackingModeFunctionTable(void)::onceToken, &__block_literal_global_19581);
  }
  uint64_t v10 = v9;
  if (!*((void *)&directOutputBackingModeFunctionTable(void)::table + 1)) {
    goto LABEL_23;
  }
  unint64_t v11 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
  uint8x8_t v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&directOutputBackingModeFunctionTable(void)::table + 8));
  v12.i16[0] = vaddlv_u8(v12);
  if (v12.u32[0] > 1uLL)
  {
    unint64_t v13 = ((unint64_t)v8 << 24) | ((unint64_t)v9 << 16);
    if (v11 >= *((void *)&directOutputBackingModeFunctionTable(void)::table + 1)) {
      unint64_t v13 = v11 % *((void *)&directOutputBackingModeFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v13 = v11 & (*((void *)&directOutputBackingModeFunctionTable(void)::table + 1) - 1);
  }
  uint64_t v14 = *(uint64_t ***)(directOutputBackingModeFunctionTable(void)::table + 8 * v13);
  if (!v14 || (unint64_t v15 = *v14) == 0)
  {
LABEL_23:
    uint64_t v17 = +[MLLogging coreChannel];
    uint64_t v18 = v8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = off_1E59A4930[v8];
      v28 = off_1E59A4948[v9];
      *(_DWORD *)buf = 138412546;
      __int16 v33 = v27;
      __int16 v34 = 2112;
      uint64_t v35 = v28;
      _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "The output feature is not supported. (Port trait %@, output backing feature trait %@.)", buf, 0x16u);
    }
    if (a4)
    {
      __int16 v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v20 = NSString;
      __int16 v21 = off_1E59A4930[v18];
      int v22 = off_1E59A4948[v10];
      uint64_t v23 = [v20 stringWithFormat:@"The output feature is not supported. (Port trait %@, output backing feature trait %@.)", v21, v22, v30];
      uint64_t v31 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a4 = [v19 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v24];
    }
    goto LABEL_27;
  }
  while (1)
  {
    unint64_t v16 = v15[1];
    if (v11 == v16) {
      break;
    }
    if (v12.u32[0] > 1uLL)
    {
      if (v16 >= *((void *)&directOutputBackingModeFunctionTable(void)::table + 1)) {
        v16 %= *((void *)&directOutputBackingModeFunctionTable(void)::table + 1);
      }
    }
    else
    {
      v16 &= *((void *)&directOutputBackingModeFunctionTable(void)::table + 1) - 1;
    }
    if (v16 != v13) {
      goto LABEL_23;
    }
LABEL_22:
    unint64_t v15 = (uint64_t *)*v15;
    if (!v15) {
      goto LABEL_23;
    }
  }
  if (*((unsigned __int8 *)v15 + 16) != v8 || *((unsigned __int8 *)v15 + 17) != v9 || *((unsigned char *)v15 + 18) || v15[3]) {
    goto LABEL_22;
  }
  char v29 = (uint64_t (*)(e5rt_io_port *, id, id *))v15[4];
  if (v29)
  {
    unsigned __int8 v25 = v29(v7, v6, a4);
    goto LABEL_28;
  }
LABEL_27:
  unsigned __int8 v25 = 0;
LABEL_28:

  return v25;
}

- (BOOL)reusableForOutputBacking:(id)a3 willBindDirectly:(BOOL *)a4
{
  id v6 = a3;
  int64_t v7 = [(MLE5OutputPortBinder *)self _outputModeForOutputBacking:v6 error:0];
  if (v7 == 1)
  {
    BOOL v8 = [(MLE5OutputPortBinder *)self _reusableForDirectlyBoundOutputBacking:v6];
    BOOL v9 = 1;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v8 = v7 == 2 && [(MLE5OutputPortBinder *)self _reusableForCopyBoundOutputBacking];
  BOOL v9 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v9;
LABEL_9:

  return v8;
}

- (BOOL)_reusableForDirectlyBoundOutputBacking:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "outputBacking should not be nil here.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"outputBacking should not be nil here."];
  }
  id v6 = [(MLE5OutputPortBinder *)self portHandle];
  unsigned int v7 = MLE5PortTraitOf();
  unsigned int v8 = MLE5FeatureTraitOfBackingObject(v4);
  {
    outputReusabilityFunctionTable(void)::table = 0u;
    *(_OWORD *)&qword_1E945FD18 = 0u;
    dword_1E945FD28 = 1065353216;
  }
  if (outputReusabilityFunctionTable(void)::onceToken != -1) {
    dispatch_once(&outputReusabilityFunctionTable(void)::onceToken, &__block_literal_global_62);
  }
  uint64_t v9 = v8;
  if (!*((void *)&outputReusabilityFunctionTable(void)::table + 1)) {
    goto LABEL_27;
  }
  unint64_t v10 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&outputReusabilityFunctionTable(void)::table + 8));
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v12 = ((unint64_t)v7 << 24) | ((unint64_t)v8 << 16);
    if (v10 >= *((void *)&outputReusabilityFunctionTable(void)::table + 1)) {
      unint64_t v12 = v10 % *((void *)&outputReusabilityFunctionTable(void)::table + 1);
    }
  }
  else
  {
    unint64_t v12 = v10 & (*((void *)&outputReusabilityFunctionTable(void)::table + 1) - 1);
  }
  unint64_t v13 = *(uint64_t ***)(outputReusabilityFunctionTable(void)::table + 8 * v12);
  if (!v13 || (uint64_t v14 = *v13) == 0)
  {
LABEL_27:
    unint64_t v16 = +[MLLogging coreChannel];
    uint64_t v17 = v7;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = off_1E59A4930[v7];
      __int16 v19 = off_1E59A4948[v8];
      *(_DWORD *)buf = 138412546;
      v37 = v18;
      __int16 v38 = 2112;
      v39 = v19;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)", buf, 0x16u);
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    __int16 v21 = NSString;
    int v22 = off_1E59A4930[v17];
    uint64_t v23 = off_1E59A4948[v9];
    v24 = [v21 stringWithFormat:@"The output feature backing type is not supported. (Port trait %@, Output backing feature trait %@.)", v22, v23, v34];
    uint64_t v35 = v24;
    unsigned __int8 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v26 = [v20 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v25];

    id v27 = v26;
    goto LABEL_30;
  }
  while (1)
  {
    unint64_t v15 = v14[1];
    if (v10 == v15) {
      break;
    }
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= *((void *)&outputReusabilityFunctionTable(void)::table + 1)) {
        v15 %= *((void *)&outputReusabilityFunctionTable(void)::table + 1);
      }
    }
    else
    {
      v15 &= *((void *)&outputReusabilityFunctionTable(void)::table + 1) - 1;
    }
    if (v15 != v12) {
      goto LABEL_27;
    }
LABEL_26:
    uint64_t v14 = (uint64_t *)*v14;
    if (!v14) {
      goto LABEL_27;
    }
  }
  if (*((unsigned __int8 *)v14 + 16) != v7 || *((unsigned __int8 *)v14 + 17) != v8 || *((unsigned char *)v14 + 18) || v14[3]) {
    goto LABEL_26;
  }
  while (1)
  {
    uint64_t v31 = (uint64_t (*)(id, e5rt_io_port *))v14[4];
    if (v31) {
      break;
    }
    id v27 = 0;
LABEL_30:
    v28 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      char v29 = [v27 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v37 = v29;
      _os_log_error_impl(&dword_19E58B000, v28, OS_LOG_TYPE_ERROR, "Could not check the output port reusability. This is a missing handling of a certain condition (CoreML.framework's logic error). Error: %@.", buf, 0xCu);
    }
    uint64_t v30 = (void *)MEMORY[0x1E4F1CA00];
    id v6 = [v27 localizedDescription];
    [v30 raise:*MEMORY[0x1E4F1C3B8], @"Could not check the output port reusability. This is a missing handling of a certain condition (CoreML.framework's logic error). Error: %@.", v6 format];

    __break(1u);
  }
  char v32 = v31(v4, v6);

  return v32;
}

- (BOOL)_reusableForCopyBoundOutputBacking
{
  return ![(MLE5OutputPortBinder *)self boundFeatureDirectly];
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_temporarilyBoundPixelBuffer);
  self->_temporarilyBoundPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)MLE5OutputPortBinder;
  [(MLE5OutputPortBinder *)&v3 dealloc];
}

- (MLE5OutputPortBinder)initWithPort:(e5rt_io_port *)a3 featureDescription:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLE5OutputPortBinder;
  unsigned int v8 = [(MLE5OutputPortBinder *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_portHandle = a3;
    objc_storeStrong((id *)&v8->_featureDescription, a4);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.coreml.MLE5Engine.outputPortBinder", 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v10;

    *(_WORD *)&v9->_outputBackingWasDirectlyBound = 256;
  }

  return v9;
}

@end