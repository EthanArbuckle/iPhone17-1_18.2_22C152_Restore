@interface ANSTVideoFoundationModel
- (ANSTPixelBufferDescriptor)inputImageDescriptor;
- (ANSTTensorDescriptor)outputFeatureDescriptor;
- (ANSTVideoFoundationModel)initWithConfiguration:(id)a3;
- (BOOL)bindInputFrameBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (BOOL)executeInferenceWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (__IOSurface)outputFeatureSurfaceRef;
- (void)dealloc;
@end

@implementation ANSTVideoFoundationModel

- (ANSTVideoFoundationModel)initWithConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ANSTVideoFoundationModel;
  v6 = [(ANSTAlgorithm *)&v17 initWithConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = [ANSTPixelBufferDescriptor alloc];
    uint64_t v10 = objc_msgSend_initWithName_width_height_pixelFormatType_pixelBufferAttributes_error_(v8, v9, @"input_image", 256, 256, 1111970369, 0, 0);
    inputImageDescriptor = v7->_inputImageDescriptor;
    v7->_inputImageDescriptor = (ANSTPixelBufferDescriptor *)v10;

    long long v18 = xmmword_246D9EE80;
    v12 = [ANSTTensorDescriptor alloc];
    uint64_t v14 = objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_alignment_error_(v12, v13, @"image_feature", 102, 2, &v18, 64, 0);
    outputFeatureDescriptor = v7->_outputFeatureDescriptor;
    v7->_outputFeatureDescriptor = (ANSTTensorDescriptor *)v14;

    v7->_prepared = 0;
  }

  return v7;
}

- (BOOL)prepareWithError:(id *)a3
{
  v76[1] = *MEMORY[0x263EF8340];
  if (self->_prepared) {
    return 1;
  }
  if (!self->_stream)
  {
    uint64_t v22 = e5rt_execution_stream_create();
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t last_error_message = e5rt_get_last_error_message();
      v25 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_246D994E0();
      }

      if (!a3) {
        return 0;
      }
      v27 = objc_msgSend_stringWithFormat_(NSString, v26, @"%s failed with error code %d (%s)", "e5rt_execution_stream_create(&_stream)", v23, last_error_message);
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v75 = *MEMORY[0x263F07F80];
      v76[0] = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v76, &v75, 1);
      goto LABEL_52;
    }
  }
  if (!self->_operation)
  {
    v6 = objc_msgSend_fileURLWithPath_(NSURL, a2, @"/AppleInternal/Library/Application Support/com.apple.ANSTKit/vfm.mlmodelc");
    v8 = objc_msgSend_URLByAppendingPathComponent_(v6, v7, @"model.mil");

    if (!e5rt_e5_compiler_create() && !e5rt_e5_compiler_options_create())
    {
      objc_msgSend_relativePath(v8, v9, v10);
      id v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v11, v12, v13);
      if (e5rt_e5_compiler_compile()
        || e5rt_program_library_retain_program_function()
        || e5rt_precompiled_compute_op_create_options_create_with_program_function())
      {
      }
      else
      {
        int precompiled_compute_operation_with_options = e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options();

        if (!precompiled_compute_operation_with_options)
        {
LABEL_15:
          if (a3 && *a3)
          {

            return 0;
          }

          goto LABEL_24;
        }
      }
    }
    uint64_t v14 = e5rt_get_last_error_message();
    v15 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_246D99454(v14, v15);
    }

    if (a3)
    {
      objc_super v17 = objc_msgSend_stringWithFormat_(NSString, v16, @"MIL compilation failed due to E5 error (%s)", v14);
      long long v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v73 = *MEMORY[0x263F07F80];
      v74 = v17;
      v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)&v74, &v73, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v21, @"ANSTErrorDomain", 5, v20);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
LABEL_24:
  if (!self->_outputPort_imageFeature)
  {
    uint64_t v36 = e5rt_execution_stream_operation_retain_output_port();
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = e5rt_get_last_error_message();
      v39 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_246D993D8();
      }

      if (!a3) {
        return 0;
      }
      v27 = objc_msgSend_stringWithFormat_(NSString, v40, @"%s failed with error code %d (%s)", "e5rt_execution_stream_operation_retain_output_port(_operation, \"image_feature\", &_outputPort_imageFeature)", v37, v38);
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v71 = *MEMORY[0x263F07F80];
      v72 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)&v72, &v71, 1);
      goto LABEL_52;
    }
  }
  if (!self->_outputTensorDesc_imageFeature)
  {
    uint64_t v42 = e5rt_io_port_retain_tensor_desc();
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = e5rt_get_last_error_message();
      v45 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_246D9935C();
      }

      if (!a3) {
        return 0;
      }
      v27 = objc_msgSend_stringWithFormat_(NSString, v46, @"%s failed with error code %d (%s)", "e5rt_io_port_retain_tensor_desc(_outputPort_imageFeature, &_outputTensorDesc_imageFeature)", v43, v44);
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v69 = *MEMORY[0x263F07F80];
      v70 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v47, (uint64_t)&v70, &v69, 1);
      goto LABEL_52;
    }
  }
  if (!self->_outputBufferObject_imageFeature)
  {
    uint64_t v48 = e5rt_tensor_desc_alloc_buffer_object();
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = e5rt_get_last_error_message();
      v51 = _ANSTLoggingGetOSLogForCategoryANSTKit();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_246D992E0();
      }

      if (!a3) {
        return 0;
      }
      v27 = objc_msgSend_stringWithFormat_(NSString, v52, @"%s failed with error code %d (%s)", "e5rt_tensor_desc_alloc_buffer_object(_outputTensorDesc_imageFeature, E5RT_BUFFER_OBJECT_TYPE_IOSURFACE, 64, &_outputBufferObject_imageFeature)", v49, v50);
      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v67 = *MEMORY[0x263F07F80];
      v68 = v27;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v53, (uint64_t)&v68, &v67, 1);
      goto LABEL_52;
    }
  }
  uint64_t v30 = e5rt_io_port_bind_buffer_object();
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = e5rt_get_last_error_message();
    v33 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_246D99264();
    }

    if (!a3) {
      return 0;
    }
    v27 = objc_msgSend_stringWithFormat_(NSString, v34, @"%s failed with error code %d (%s)", "e5rt_io_port_bind_buffer_object(_outputPort_imageFeature, _outputBufferObject_imageFeature)", v31, v32);
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v65 = *MEMORY[0x263F07F80];
    v66 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)&v66, &v65, 1);
    goto LABEL_52;
  }
  uint64_t iosurface = e5rt_buffer_object_get_iosurface();
  if (iosurface)
  {
    uint64_t v55 = iosurface;
    uint64_t v56 = e5rt_get_last_error_message();
    v57 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_246D991E8();
    }

    if (!a3) {
      return 0;
    }
    v27 = objc_msgSend_stringWithFormat_(NSString, v58, @"%s failed with error code %d (%s)", "e5rt_buffer_object_get_iosurface(_outputBufferObject_imageFeature, &_outputFeatureSurface)", v55, v56);
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F07F80];
    v64 = v27;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)&v64, &v63, 1);
    v60 = LABEL_52:;
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v61, @"ANSTErrorDomain", 5, v60);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  BOOL result = 1;
  self->_prepared = 1;
  return result;
}

- (void)dealloc
{
  v3 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_246D997C8((uint64_t)self, v3);
  }

  if (self->_outputBufferObject_imageFeature && e5rt_buffer_object_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_246D9974C();
    }
  }
  if (self->_outputTensorDesc_imageFeature && e5rt_tensor_desc_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_246D996D0();
    }
  }
  if (self->_outputPort_imageFeature && e5rt_io_port_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_246D99654();
    }
  }
  if (self->_operation && e5rt_execution_stream_operation_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_246D995D8();
    }
  }
  if (self->_stream && e5rt_execution_stream_release())
  {
    e5rt_get_last_error_message();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_246D9955C();
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFoundationModel;
  [(ANSTVideoFoundationModel *)&v4 dealloc];
}

- (BOOL)bindInputFrameBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v55[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = e5rt_execution_stream_reset();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t last_error_message = e5rt_get_last_error_message();
    v9 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_246D99B28();
    }

    if (!a4) {
      return 0;
    }
    id v11 = objc_msgSend_stringWithFormat_(NSString, v10, @"%s failed with error code %d (%s)", "e5rt_execution_stream_reset(_stream)", v7, last_error_message);
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v54 = *MEMORY[0x263F07F80];
    v55[0] = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v55, &v54, 1);
    goto LABEL_11;
  }
  CVPixelBufferGetIOSurface(a3);
  uint64_t v14 = e5rt_surface_object_create_from_iosurface();
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = e5rt_get_last_error_message();
    objc_super v17 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_246D99AAC();
    }

    if (!a4) {
      return 0;
    }
    id v11 = objc_msgSend_stringWithFormat_(NSString, v18, @"%s failed with error code %d (%s)", "e5rt_surface_object_create_from_iosurface(&input_image_surface_object, input_surface)", v15, v16);
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v52 = *MEMORY[0x263F07F80];
    v53 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)&v53, &v52, 1);
    v20 = LABEL_11:;
    objc_msgSend_errorWithDomain_code_userInfo_(v12, v21, @"ANSTErrorDomain", 5, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    return 0;
  }
  uint64_t v23 = e5rt_execution_stream_operation_retain_input_port();
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = e5rt_get_last_error_message();
    v26 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_246D99A30();
    }

    if (!a4) {
      return 0;
    }
    id v11 = objc_msgSend_stringWithFormat_(NSString, v27, @"%s failed with error code %d (%s)", "e5rt_execution_stream_operation_retain_input_port(_operation, \"input_image\", &input_port)", v24, v25, 0, 0);
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v50 = *MEMORY[0x263F07F80];
    v51 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)&v51, &v50, 1);
    goto LABEL_37;
  }
  uint64_t v30 = e5rt_io_port_bind_surface_object();
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = e5rt_get_last_error_message();
    v33 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_246D999B4();
    }

    if (!a4) {
      return 0;
    }
    id v11 = objc_msgSend_stringWithFormat_(NSString, v34, @"%s failed with error code %d (%s)", "e5rt_io_port_bind_surface_object(input_port, input_image_surface_object)", v31, v32, 0, 0);
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F07F80];
    uint64_t v49 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)&v49, &v48, 1);
    goto LABEL_37;
  }
  if (e5rt_io_port_release())
  {
    e5rt_get_last_error_message();
    uint64_t v36 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_246D99938();
    }
  }
  if (e5rt_surface_object_release())
  {
    e5rt_get_last_error_message();
    uint64_t v37 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_246D998BC();
    }
  }
  uint64_t v38 = e5rt_execution_stream_encode_operation();
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = e5rt_get_last_error_message();
    v41 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_246D99840();
    }

    if (!a4) {
      return 0;
    }
    id v11 = objc_msgSend_stringWithFormat_(NSString, v42, @"%s failed with error code %d (%s)", "e5rt_execution_stream_encode_operation(_stream, _operation)", v39, v40, 0, 0);
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v46 = *MEMORY[0x263F07F80];
    v47 = v11;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v43, (uint64_t)&v47, &v46, 1);
    uint64_t v44 = LABEL_37:;
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v45, @"ANSTErrorDomain", 5, v44);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  return 1;
}

- (BOOL)executeInferenceWithError:(id *)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  if (!self->_prepared)
  {
    if (!a3) {
      return 0;
    }
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F07F80];
    v20[0] = @"Model was not prepared.";
    v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v20, &v19, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v15, @"ANSTErrorDomain", 3, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return 0;
  }
  uint64_t v4 = e5rt_execution_stream_execute_sync();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t last_error_message = e5rt_get_last_error_message();
    uint64_t v7 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_246D99BA4();
    }

    if (!a3) {
      return 0;
    }
    v9 = objc_msgSend_stringWithFormat_(NSString, v8, @"%s failed with error code %d (%s)", "e5rt_execution_stream_execute_sync(_stream)", v5, last_error_message);
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F07F80];
    long long v18 = v9;
    v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)&v18, &v17, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v13, @"ANSTErrorDomain", 5, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  return 1;
}

- (ANSTPixelBufferDescriptor)inputImageDescriptor
{
  return self->_inputImageDescriptor;
}

- (ANSTTensorDescriptor)outputFeatureDescriptor
{
  return self->_outputFeatureDescriptor;
}

- (__IOSurface)outputFeatureSurfaceRef
{
  return self->_outputFeatureSurface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFeatureDescriptor, 0);
  objc_storeStrong((id *)&self->_inputImageDescriptor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end