@interface CVNLPCaptionEncoderTransformer
- (CVNLPCaptionEncoderTransformer)initWithOptions:(id)a3 runTimeParams:(id)a4;
- (id).cxx_construct;
- (void)computeCaptionForImage:(vImage_Buffer *)a3 outputs:(id *)a4;
- (void)computeCaptionForImageImpl:(vImage_Buffer *)a3 outputs:(id *)a4;
- (void)computeCaptionForPixelBuffer:(__CVBuffer *)a3 outputs:(id *)a4;
- (void)computeCaptionForPixelBufferImpl:(__CVBuffer *)a3 outputs:(id *)a4;
- (void)computeCaptionForVideoPixelBuffer:(void *)a3 outputs:(id *)a4;
- (void)computeCaptionForVideoPixelBufferImpl:(void *)a3 outputs:(id *)a4;
- (void)dealloc;
@end

@implementation CVNLPCaptionEncoderTransformer

- (CVNLPCaptionEncoderTransformer)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CVNLPCaptionEncoderTransformer;
  v10 = [(CVNLPCaptionModelBase *)&v39 initWithOptions:v6 runTimeParams:v7];
  if (v10)
  {
    v38 = objc_msgSend_objectForKeyedSubscript_(v6, v8, (uint64_t)CVNLPCaptionModelPath, v9);
    v13 = objc_msgSend_URLByAppendingPathComponent_(v38, v11, @"encoder_opt.espresso.net", v12);
    v14 = operator new(0x18uLL);
    *(_OWORD *)v14 = xmmword_1B4C9AF90;
    v14[2] = 0x1002000000000;
    uint64_t context = espresso_create_context();
    v10->encoderCtx = (void *)context;
    if (context
      || (uint64_t v16 = espresso_create_context(), (v10->encoderCtx = (void *)v16) != 0)
      || (uint64_t v17 = espresso_create_context(), (v10->encoderCtx = (void *)v17) != 0))
    {
      v10->encoderPlan = (void *)espresso_create_plan();
      objc_msgSend_path(v13, v18, v19, v20);
      id v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v21, v22, v23, v24);
      int v25 = espresso_plan_add_network();

      if (v25)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        espresso_plan_get_error_info();
        std::runtime_error::runtime_error(exception, v37);
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
    }
    if (espresso_plan_build())
    {
      v27 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v27, v28);
      __cxa_throw(v27, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (c_network_get_input_names())
    {
      v29 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v29, v30);
      __cxa_throw(v29, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (v10->encoderInputNames.__end_ == v10->encoderInputNames.__begin_)
    {
      v31 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v31, "c_network_get_input_names returned null for encoder");
      __cxa_throw(v31, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_query_blob_dimensions())
    {
      v32 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v32, v33);
      __cxa_throw(v32, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (espresso_network_bind_buffer())
    {
      v34 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      espresso_plan_get_error_info();
      std::runtime_error::runtime_error(v34, v35);
      __cxa_throw(v34, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    operator delete(v14);
  }
  return v10;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)CVNLPCaptionEncoderTransformer;
  [(CVNLPCaptionEncoderTransformer *)&v3 dealloc];
}

- (void)computeCaptionForImage:(vImage_Buffer *)a3 outputs:(id *)a4
{
  id v7 = objc_msgSend_perfResults(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4C3CCE4;
  v9[3] = &unk_1E60A3940;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  objc_msgSend_run_block_(v7, v8, @"Encode", (uint64_t)v9);
}

- (void)computeCaptionForImageImpl:(vImage_Buffer *)a3 outputs:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)&a3->width;
  long long v26 = *(_OWORD *)&a3->data;
  long long v27 = v6;
  if (espresso_network_bind_input_vimagebuffer_rgba8())
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v21);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (espresso_plan_execute_sync())
  {
    v22 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(v22, v23);
    __cxa_throw(v22, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9B8];
  data = self->attFeatsBlob.data;
  long long v11 = *(_OWORD *)&self->attFeatsBlob.stride_batch_number;
  v24[8] = *(_OWORD *)&self->attFeatsBlob.stride_height;
  v24[9] = v11;
  uint64_t v25 = *(void *)&self->attFeatsBlob.storage_type;
  long long v12 = *(_OWORD *)&self->attFeatsBlob.width;
  v24[4] = *(_OWORD *)&self->attFeatsBlob.stride[2];
  v24[5] = v12;
  long long v13 = *(_OWORD *)&self->attFeatsBlob.sequence_length;
  v24[6] = *(_OWORD *)&self->attFeatsBlob.channels;
  v24[7] = v13;
  long long v14 = *(_OWORD *)self->attFeatsBlob.dim;
  v24[0] = *(_OWORD *)&self->attFeatsBlob.data;
  v24[1] = v14;
  long long v15 = *(_OWORD *)self->attFeatsBlob.stride;
  v24[2] = *(_OWORD *)&self->attFeatsBlob.dim[2];
  v24[3] = v15;
  uint64_t v16 = objc_msgSend__blob_size_(self, v7, (uint64_t)v24, v8);
  v18 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v9, v17, (uint64_t)data, 4 * v16, 0);
  v28[0] = v18;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v28, 1);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)computeCaptionForPixelBuffer:(__CVBuffer *)a3 outputs:(id *)a4
{
  id v7 = objc_msgSend_perfResults(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4C3CFC8;
  v9[3] = &unk_1E60A3940;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  objc_msgSend_run_block_(v7, v8, @"EncodePx", (uint64_t)v9);
}

- (void)computeCaptionForPixelBufferImpl:(__CVBuffer *)a3 outputs:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (espresso_network_bind_cvpixelbuffer() || espresso_plan_execute_sync())
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v20);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9B8];
  data = self->attFeatsBlob.data;
  long long v10 = *(_OWORD *)&self->attFeatsBlob.stride_batch_number;
  v21[8] = *(_OWORD *)&self->attFeatsBlob.stride_height;
  v21[9] = v10;
  uint64_t v22 = *(void *)&self->attFeatsBlob.storage_type;
  long long v11 = *(_OWORD *)&self->attFeatsBlob.width;
  v21[4] = *(_OWORD *)&self->attFeatsBlob.stride[2];
  v21[5] = v11;
  long long v12 = *(_OWORD *)&self->attFeatsBlob.sequence_length;
  v21[6] = *(_OWORD *)&self->attFeatsBlob.channels;
  v21[7] = v12;
  long long v13 = *(_OWORD *)self->attFeatsBlob.dim;
  v21[0] = *(_OWORD *)&self->attFeatsBlob.data;
  v21[1] = v13;
  long long v14 = *(_OWORD *)self->attFeatsBlob.stride;
  v21[2] = *(_OWORD *)&self->attFeatsBlob.dim[2];
  v21[3] = v14;
  uint64_t v15 = objc_msgSend__blob_size_(self, v6, (uint64_t)v21, v7);
  uint64_t v17 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v8, v16, (uint64_t)data, 4 * v15, 0);
  v23[0] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v18, (uint64_t)v23, 1);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)computeCaptionForVideoPixelBuffer:(void *)a3 outputs:(id *)a4
{
  uint64_t v7 = objc_msgSend_perfResults(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4C3D270;
  v9[3] = &unk_1E60A3940;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  objc_msgSend_run_block_(v7, v8, @"EncodePx", (uint64_t)v9);
}

- (void)computeCaptionForVideoPixelBufferImpl:(void *)a3 outputs:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    while (!espresso_network_bind_cvpixelbuffer())
    {
      ++v8;
      v7 += 24;
      if (v8 >= (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) {
        goto LABEL_5;
      }
    }
LABEL_7:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    espresso_plan_get_error_info();
    std::runtime_error::runtime_error(exception, v23);
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
LABEL_5:
  if (espresso_plan_execute_sync()) {
    goto LABEL_7;
  }
  long long v11 = (void *)MEMORY[0x1E4F1C9B8];
  data = self->attFeatsBlob.data;
  long long v13 = *(_OWORD *)&self->attFeatsBlob.stride_batch_number;
  v24[8] = *(_OWORD *)&self->attFeatsBlob.stride_height;
  v24[9] = v13;
  uint64_t v25 = *(void *)&self->attFeatsBlob.storage_type;
  long long v14 = *(_OWORD *)&self->attFeatsBlob.width;
  v24[4] = *(_OWORD *)&self->attFeatsBlob.stride[2];
  v24[5] = v14;
  long long v15 = *(_OWORD *)&self->attFeatsBlob.sequence_length;
  v24[6] = *(_OWORD *)&self->attFeatsBlob.channels;
  v24[7] = v15;
  long long v16 = *(_OWORD *)self->attFeatsBlob.dim;
  v24[0] = *(_OWORD *)&self->attFeatsBlob.data;
  v24[1] = v16;
  long long v17 = *(_OWORD *)self->attFeatsBlob.stride;
  v24[2] = *(_OWORD *)&self->attFeatsBlob.dim[2];
  v24[3] = v17;
  uint64_t v18 = objc_msgSend__blob_size_(self, v9, (uint64_t)v24, v10);
  uint64_t v20 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v11, v19, (uint64_t)data, 4 * v18, 0);
  v26[0] = v20;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v26, 1);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  p_encoderInputNames = &self->encoderInputNames;
  begin = (void **)self->encoderInputNames.__begin_;
  if (begin)
  {
    end = (void **)self->encoderInputNames.__end_;
    v5 = self->encoderInputNames.__begin_;
    if (end == begin)
    {
      p_encoderInputNames->__end_ = begin;
    }
    else
    {
      do
      {
        if (*((char *)end - 1) < 0) {
          operator delete(*(end - 3));
        }
        end -= 3;
      }
      while (end != begin);
      v5 = p_encoderInputNames->__begin_;
      p_encoderInputNames->__end_ = begin;
    }
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  return self;
}

@end