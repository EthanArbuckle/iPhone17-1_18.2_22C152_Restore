@interface CVNLPCaptionEncoderLSTM
- (CVNLPCaptionEncoderLSTM)initWithOptions:(id)a3 runTimeParams:(id)a4;
- (void)_run:(vImage_Buffer *)a3 meanFeatures:(id *)a4 attnFeatures:(id *)a5 projectedAttnFeatures:(id *)a6;
- (void)computeCaptionForImage:(vImage_Buffer *)a3 outputs:(id *)a4;
- (void)dealloc;
@end

@implementation CVNLPCaptionEncoderLSTM

- (CVNLPCaptionEncoderLSTM)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CVNLPCaptionEncoderLSTM;
  v8 = [(CVNLPCaptionModelBase *)&v39 initWithOptions:v6 runTimeParams:v7];
  v11 = v8;
  if (v8)
  {
    v8->meanFeaturesPresent = 0;
    v12 = objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CVNLPCaptionModelPath, v10);
    v15 = objc_msgSend_URLByAppendingPathComponent_(v12, v13, @"encoder_opt.espresso.net", v14);
    v11->encoderCtx = (void *)espresso_create_context();
    v11->encoderPlan = (void *)espresso_create_plan();
    objc_msgSend_path(v15, v16, v17, v18);
    id v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v19, v20, v21, v22);
    int v23 = espresso_plan_add_network();

    if (v23)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(exception, v26);
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_plan_build())
    {
      v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v27, v28);
      __cxa_throw(v27, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_query_blob_dimensions())
    {
      v29 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v29, v30);
      __cxa_throw(v29, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (c_network_get_output_names())
    {
      v31 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v31, v32);
      __cxa_throw(v31, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (v11->meanFeaturesPresent && espresso_network_bind_buffer())
    {
      v37 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v37, v38);
      __cxa_throw(v37, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v33 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v33, v34);
      __cxa_throw(v33, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v35 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v35, v36);
      __cxa_throw(v35, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  return v11;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionEncoderLSTM;
  [(CVNLPCaptionEncoderLSTM *)&v3 dealloc];
}

- (void)computeCaptionForImage:(vImage_Buffer *)a3 outputs:(id *)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  objc_msgSend__run_meanFeatures_attnFeatures_projectedAttnFeatures_(self, a2, (uint64_t)a3, (uint64_t)&v12, &v11, &v10);
  id v6 = v12;
  id v7 = v11;
  id v9 = v10;
  if (a3->data) {
    MEMORY[0x1BA992990](a3->data, 0x1000C8077774924);
  }
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v9;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v13, 3);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)_run:(vImage_Buffer *)a3 meanFeatures:(id *)a4 attnFeatures:(id *)a5 projectedAttnFeatures:(id *)a6
{
  char v51 = 0;
  long long v10 = *(_OWORD *)&a3->width;
  long long v48 = *(_OWORD *)&a3->data;
  long long v49 = v10;
  long long v50 = xmmword_1B4C9AE30;
  if (espresso_network_bind_input_vimagebuffer_rgba8() || espresso_plan_execute_sync())
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v35);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (self->meanFeaturesPresent)
  {
    v45 = 0;
    v46 = 0;
    uint64_t v47 = 0;
    long long v14 = *(_OWORD *)&self->meanFeatsBlob.stride_batch_number;
    v43[8] = *(_OWORD *)&self->meanFeatsBlob.stride_height;
    v43[9] = v14;
    uint64_t v44 = *(void *)&self->meanFeatsBlob.storage_type;
    long long v15 = *(_OWORD *)&self->meanFeatsBlob.width;
    v43[4] = *(_OWORD *)&self->meanFeatsBlob.stride[2];
    v43[5] = v15;
    long long v16 = *(_OWORD *)&self->meanFeatsBlob.sequence_length;
    v43[6] = *(_OWORD *)&self->meanFeatsBlob.channels;
    v43[7] = v16;
    long long v17 = *(_OWORD *)self->meanFeatsBlob.dim;
    v43[0] = *(_OWORD *)&self->meanFeatsBlob.data;
    v43[1] = v17;
    long long v18 = *(_OWORD *)self->meanFeatsBlob.stride;
    v43[2] = *(_OWORD *)&self->meanFeatsBlob.dim[2];
    v43[3] = v18;
    objc_msgSend__copy_data_from_blob_to_(self, v11, (uint64_t)v43, (uint64_t)&v45);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v19, (uint64_t)v45, v46 - v45);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }
  }
  else
  {
    objc_msgSend_data(MEMORY[0x1E4F1C9B8], v11, v12, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v45 = 0;
  v46 = 0;
  uint64_t v47 = 0;
  long long v21 = *(_OWORD *)&self->attFeatsBlob.stride_batch_number;
  v41[8] = *(_OWORD *)&self->attFeatsBlob.stride_height;
  v41[9] = v21;
  uint64_t v42 = *(void *)&self->attFeatsBlob.storage_type;
  long long v22 = *(_OWORD *)&self->attFeatsBlob.width;
  v41[4] = *(_OWORD *)&self->attFeatsBlob.stride[2];
  v41[5] = v22;
  long long v23 = *(_OWORD *)&self->attFeatsBlob.sequence_length;
  v41[6] = *(_OWORD *)&self->attFeatsBlob.channels;
  v41[7] = v23;
  long long v24 = *(_OWORD *)self->attFeatsBlob.dim;
  v41[0] = *(_OWORD *)&self->attFeatsBlob.data;
  v41[1] = v24;
  long long v25 = *(_OWORD *)self->attFeatsBlob.stride;
  v41[2] = *(_OWORD *)&self->attFeatsBlob.dim[2];
  v41[3] = v25;
  objc_msgSend__copy_data_from_blob_to_(self, v20, (uint64_t)v41, (uint64_t)&v45);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v26, (uint64_t)v45, v46 - v45);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  __p = 0;
  objc_super v39 = 0;
  uint64_t v40 = 0;
  long long v27 = *(_OWORD *)&self->pAttFeatsBlob.stride_batch_number;
  v36[8] = *(_OWORD *)&self->pAttFeatsBlob.stride_height;
  v36[9] = v27;
  uint64_t v37 = *(void *)&self->pAttFeatsBlob.storage_type;
  long long v28 = *(_OWORD *)&self->pAttFeatsBlob.width;
  v36[4] = *(_OWORD *)&self->pAttFeatsBlob.stride[2];
  v36[5] = v28;
  long long v29 = *(_OWORD *)&self->pAttFeatsBlob.sequence_length;
  v36[6] = *(_OWORD *)&self->pAttFeatsBlob.channels;
  v36[7] = v29;
  long long v30 = *(_OWORD *)self->pAttFeatsBlob.dim;
  v36[0] = *(_OWORD *)&self->pAttFeatsBlob.data;
  v36[1] = v30;
  long long v31 = *(_OWORD *)self->pAttFeatsBlob.stride;
  v36[2] = *(_OWORD *)&self->pAttFeatsBlob.dim[2];
  v36[3] = v31;
  objc_msgSend__copy_data_from_blob_to_(self, v32, (uint64_t)v36, (uint64_t)&__p);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v33, (uint64_t)__p, v39 - (unsigned char *)__p);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    objc_super v39 = __p;
    operator delete(__p);
  }
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
}

@end