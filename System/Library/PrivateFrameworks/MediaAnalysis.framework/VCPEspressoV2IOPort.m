@interface VCPEspressoV2IOPort
- (e5rt_buffer_object)bufferHandle;
- (e5rt_io_port)portHandle;
- (int)prepareInput:(void *)a3;
- (int)retainAndBindToPort:(e5rt_execution_stream_operation *)a3 name:(id)a4 isInput:(BOOL)a5;
- (int64_t)getTensorType:(e5rt_tensor_desc *)a3;
- (int64_t)tensorType;
- (unint64_t)getOutput:(void *)a3;
- (unint64_t)getTensorShape;
- (void)dealloc;
@end

@implementation VCPEspressoV2IOPort

- (int)retainAndBindToPort:(e5rt_execution_stream_operation *)a3 name:(id)a4 isInput:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (v5)
  {
    [v7 UTF8String];
    if (e5rt_execution_stream_operation_retain_input_port())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  else
  {
    [v7 UTF8String];
    if (e5rt_execution_stream_operation_retain_output_port())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  if (e5rt_io_port_retain_tensor_desc())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
  }
  else if (e5rt_tensor_desc_alloc_buffer_object())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        v10 = "E5RT op failed: %s";
        v11 = v9;
        uint32_t v12 = 12;
LABEL_18:
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
      }
LABEL_19:
    }
  }
  else
  {
    int64_t v15 = [(VCPEspressoV2IOPort *)self getTensorType:0];
    self->_tensorType = v15;
    if (v15 == 3)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_20;
      }
      v9 = VCPLogInstance();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      v10 = "UnSupported Tensor Type - (only Int32, FP16, FP32 are supported)";
      v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_18;
    }
    if (e5rt_io_port_bind_buffer_object())
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_20;
      }
      v9 = VCPLogInstance();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (!e5rt_tensor_desc_release())
    {
      int v13 = 0;
      goto LABEL_21;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
LABEL_20:
  int v13 = -18;
LABEL_21:

  return v13;
}

- (int64_t)getTensorType:(e5rt_tensor_desc *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  e5rt_tensor_desc_retain_dtype();
  if (e5rt_tensor_desc_dtype_get_component_dtype())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
      }
LABEL_15:

      return 3;
    }
    return 3;
  }
  if (e5rt_tensor_desc_dtype_get_element_size())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
      }
      goto LABEL_15;
    }
    return 3;
  }
  if (e5rt_tensor_desc_dtype_release())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
      }
      goto LABEL_15;
    }
    return 3;
  }
  return 3;
}

- (int)prepareInput:(void *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(VCPEspressoV2IOPort *)self getTensorShape];
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "Invalid input size", buf, 2u);
      }
      goto LABEL_10;
    }
    return -18;
  }
  unint64_t v6 = v5;
  if (e5rt_buffer_object_get_data_ptr())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
      }
LABEL_10:

      return -18;
    }
    return -18;
  }
  int64_t tensorType = self->_tensorType;
  switch(tensorType)
  {
    case 2:
      goto LABEL_15;
    case 1:
      size_t v10 = 2 * v6;
      goto LABEL_17;
    case 0:
LABEL_15:
      size_t v10 = 4 * v6;
LABEL_17:
      memcpy(0, a3, v10);
      break;
  }
  return 0;
}

- (unint64_t)getOutput:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(VCPEspressoV2IOPort *)self getTensorShape];
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unint64_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        unint64_t v6 = "Invalid output size";
        uint64_t v7 = v5;
        uint32_t v8 = 2;
        goto LABEL_9;
      }
LABEL_10:
    }
    return 0;
  }
  unint64_t v4 = v3;
  if (e5rt_buffer_object_get_data_ptr())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      unint64_t v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        unint64_t v6 = "E5RT op failed: %s";
        uint64_t v7 = v5;
        uint32_t v8 = 12;
LABEL_9:
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v10, v8);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return 0;
  }
  return v4;
}

- (unint64_t)getTensorShape
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (e5rt_io_port_retain_tensor_desc())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    return 0;
  }
  if (e5rt_tensor_desc_get_shape())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    return 0;
  }
  unint64_t v3 = 1;
  if (e5rt_tensor_desc_release())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
      }
LABEL_13:
    }
    return 0;
  }
  return v3;
}

- (void)dealloc
{
  e5rt_io_port_release();
  e5rt_buffer_object_release();
  v3.receiver = self;
  v3.super_class = (Class)VCPEspressoV2IOPort;
  [(VCPEspressoV2IOPort *)&v3 dealloc];
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (e5rt_buffer_object)bufferHandle
{
  return self->_bufferHandle;
}

- (int64_t)tensorType
{
  return self->_tensorType;
}

@end