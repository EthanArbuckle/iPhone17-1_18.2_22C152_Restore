@interface ADEspressoRunnerV2
- (ADEspressoRunnerV2)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5;
- (BOOL)canBindFormat:(unsigned int)a3 e5rtFormat:(int)a4;
- (NSString)networkVersionString;
- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3;
- (e5rt_execution_stream)stream;
- (e5rt_execution_stream_operation)operation;
- (e5rt_io_port)retainPortForDescriptor:(id)a3 usingOperation:(e5rt_execution_stream_operation *)a4;
- (id).cxx_construct;
- (id)registerDescriptor:(id)a3;
- (int64_t)execute;
- (int64_t)prewireSurfaces:(id)a3 toDescriptors:(id)a4;
- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4;
- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4 usingOperation:(e5rt_execution_stream_operation *)a5;
- (int64_t)registerIOSurface:(__IOSurface *)a3 forSurfacePort:(e5rt_io_port *)a4 surfaceDesc:(e5rt_surface_desc *)a5;
- (int64_t)registerIOSurface:(__IOSurface *)a3 forTensorPort:(e5rt_io_port *)a4;
- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4;
- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4;
- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 forSurfacePort:(e5rt_io_port *)a5;
- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 forTensorPort:(e5rt_io_port *)a5;
- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 usingOperation:(e5rt_execution_stream_operation *)a5;
- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6;
- (void)buildBindFormatsMap;
- (void)dealloc;
- (void)setOperation:(e5rt_execution_stream_operation *)a3;
- (void)setStream:(e5rt_execution_stream *)a3;
- (void)unwireAllSurfaces;
@end

@implementation ADEspressoRunnerV2

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 usingOperation:(e5rt_execution_stream_operation *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int v15 = 335679308;
  long long v16 = 0u;
  long long v17 = 0u;
  kdebug_trace();
  v9 = self;
  objc_sync_enter(v9);
  if (v8)
  {
    uint64_t v14 = [(ADEspressoRunnerV2 *)v9 retainPortForDescriptor:v8 usingOperation:a5];
    if (!v14)
    {
LABEL_19:
      int64_t v11 = -22971;
      goto LABEL_20;
    }
    if (e5rt_io_port_is_surface())
    {
      uint64_t last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "e5rt_io_port_is_surface failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = (const char *)last_error_message;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      int64_t v11 = -22971;
    }
    else
    {
      int64_t v11 = [(ADEspressoRunnerV2 *)v9 registerPixelBufferPtr:a3 forDescriptor:v8 forTensorPort:&v14];
    }
    if (v14 && e5rt_io_port_release())
    {
      uint64_t v12 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "e5rt_io_port_release failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = (const char *)v12;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot register buffer for nil descriptor", buf, 2u);
    }
    int64_t v11 = -22953;
  }
LABEL_20:
  objc_sync_exit(v9);

  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v15);
  return v11;
}

- (id)registerDescriptor:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v23 = 335679308;
  long long v24 = 0u;
  long long v25 = 0u;
  kdebug_trace();
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v22 = [(ADEspressoRunnerV2 *)v5 retainPortForDescriptor:v4 usingOperation:v5->_operation];
  if (e5rt_io_port_is_surface())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "e5rt_io_port_is_surface failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)last_error_message;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    v7 = 0;
    id v8 = 0;
    int v9 = 1;
    goto LABEL_8;
  }
  if (!e5rt_io_port_retain_tensor_desc())
  {
    if (e5rt_tensor_desc_get_shape())
    {
      uint64_t v16 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_tensor_desc_get_shape failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = (const char *)v16;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v7 = 0;
      id v8 = 0;
LABEL_39:
      int v9 = 1;
      goto LABEL_8;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    if (e5rt_tensor_desc_get_strides())
    {
      uint64_t v17 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_tensor_desc_get_strides failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = (const char *)v17;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v7 = 0;
      goto LABEL_39;
    }
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
    if (e5rt_tensor_desc_alloc_buffer_object())
    {
      uint64_t v18 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_tensor_desc_alloc_buffer_object failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_56;
      }
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v18;
      v19 = &_os_log_internal;
    }
    else if (e5rt_io_port_bind_buffer_object())
    {
      uint64_t v20 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_io_port_bind_buffer_object failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_56;
      }
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v20;
      v19 = &_os_log_internal;
    }
    else
    {
      if (!e5rt_buffer_object_get_data_ptr())
      {
        int v9 = 0;
        goto LABEL_8;
      }
      uint64_t v21 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "e5rt_buffer_object_get_data_ptr failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_56;
      }
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v21;
      v19 = &_os_log_internal;
    }
    _os_log_error_impl(&dword_247EC4000, v19, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
LABEL_56:
    int v9 = 1;
    goto LABEL_8;
  }
  uint64_t v15 = e5rt_get_last_error_message();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "e5rt_io_port_retain_tensor_desc failed";
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = (const char *)v15;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
  v7 = 0;
  id v8 = 0;
  int v9 = 1;
LABEL_8:
  if (v22 && e5rt_io_port_release())
  {
    uint64_t v10 = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "e5rt_io_port_release failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = (const char *)v10;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (v9)
  {
LABEL_15:
    int64_t v11 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = [ADEspressoBufferHandle alloc];
  v13 = [v4 name];
  int64_t v11 = [(ADEspressoBufferHandle *)v12 initWithName:v13 rawData:0 dimensions:v8 strides:v7];

LABEL_17:
  objc_sync_exit(v5);

  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v23);

  return v11;
}

- (e5rt_io_port)retainPortForDescriptor:(id)a3 usingOperation:(e5rt_execution_stream_operation *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isInput])
  {
    id v5 = [v4 name];
    [v5 UTF8String];
    BOOL v6 = e5rt_execution_stream_operation_retain_input_port() == 0;

    if (!v6)
    {
      uint64_t last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        v13 = NSString;
        uint64_t v14 = [v4 name];
        id v15 = [v13 stringWithFormat:@"e5rt_execution_stream_operation_retain_input_port failed on input %@", v14];
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = [v15 UTF8String];
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = last_error_message;
        id v8 = &_os_log_internal;
LABEL_13:
        _os_log_error_impl(&dword_247EC4000, v8, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
    }
  }
  else
  {
    id v9 = [v4 name];
    [v9 UTF8String];
    BOOL v10 = e5rt_execution_stream_operation_retain_output_port() == 0;

    if (!v10)
    {
      uint64_t v11 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = NSString;
        uint64_t v17 = [v4 name];
        id v18 = [v16 stringWithFormat:@"e5rt_execution_stream_operation_retain_output_port failed on output %@", v17];
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = [v18 UTF8String];
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = v11;
        id v8 = &_os_log_internal;
        goto LABEL_13;
      }
    }
  }

  return 0;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 forTensorPort:(e5rt_io_port *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = *a3;
  if (!*a3)
  {
    if (e5rt_io_port_retain_tensor_desc())
    {
      uint64_t last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "e5rt_io_port_retain_tensor_desc failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = (const char *)last_error_message;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      int v13 = 1;
    }
    else if (e5rt_tensor_desc_get_shape())
    {
      uint64_t v14 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "e5rt_tensor_desc_get_shape failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = (const char *)v14;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      int v13 = 1;
    }
    else
    {
      size_t v15 = MEMORY[0xFFFFFFFFFFFFFFF0];
      uint64_t v16 = objc_msgSend(v8, "imageDescriptor", 0);
      if (PixelBufferUtils::componentsPerPixelForPixelFormat((PixelBufferUtils *)[v16 pixelFormat], 0) == 1)
      {
        uint64_t v17 = [v8 imageDescriptor];
        BOOL v18 = PixelBufferUtils::planeCountForPixelFormat((PixelBufferUtils *)[v17 pixelFormat]) == 0;

        uint64_t v19 = v30;
        if (v18 && v30 != 2)
        {
          uint64_t v20 = 0;
          do
            v15 *= *(void *)(8 * v20++);
          while (v30 - 2 != v20);
        }
      }
      else
      {

        uint64_t v19 = v30;
      }
      size_t v21 = *(void *)(8 * v19 - 8);
      uint64_t v22 = [v8 imageDescriptor];
      OSType v23 = [v22 pixelFormat];
      CVPixelBufferRef pixelBufferOut = 0;
      CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
      CVReturn v25 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v21, v15, v23, BufferAttributes, &pixelBufferOut);
      v26 = pixelBufferOut;
      if (v25) {
        v26 = 0;
      }
      *a3 = v26;

      int v13 = 0;
    }
    if (!v13)
    {
      id v9 = *a3;
      if (*a3) {
        goto LABEL_2;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v8 name];
        uint64_t v29 = [v28 UTF8String];
        *(_DWORD *)buf = 136315138;
        v33 = (const char *)v29;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed allocating CVPixelBuffer for \"%s\"", buf, 0xCu);
      }
    }
    int64_t v11 = -22971;
    goto LABEL_31;
  }
LABEL_2:
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v9);
  if (IOSurface)
  {
    int64_t v11 = [(ADEspressoRunnerV2 *)self registerIOSurface:IOSurface forTensorPort:a5];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Provided pixelbuffer is not io-surface backed", buf, 2u);
    }
    int64_t v11 = -22953;
  }
LABEL_31:

  return v11;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4 forSurfacePort:(e5rt_io_port *)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (v8)
  {
    if (e5rt_io_port_retain_surface_desc())
    {
      uint64_t last_error_message = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        CVReturn v25 = "e5rt_io_port_retain_surface_desc failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136315138;
      CVReturn v25 = (const char *)last_error_message;
      BOOL v10 = &_os_log_internal;
LABEL_32:
      _os_log_error_impl(&dword_247EC4000, v10, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
LABEL_33:
      int64_t v11 = -22971;
      goto LABEL_34;
    }
    if (e5rt_surface_desc_get_width())
    {
      uint64_t v12 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        CVReturn v25 = "e5rt_surface_desc_get_width failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136315138;
      CVReturn v25 = (const char *)v12;
      BOOL v10 = &_os_log_internal;
      goto LABEL_32;
    }
    if (e5rt_surface_desc_get_height())
    {
      uint64_t v13 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        CVReturn v25 = "e5rt_surface_desc_get_height failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136315138;
      CVReturn v25 = (const char *)v13;
      BOOL v10 = &_os_log_internal;
      goto LABEL_32;
    }
    if (e5rt_surface_desc_get_format())
    {
      uint64_t v14 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        CVReturn v25 = "e5rt_surface_desc_get_format failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136315138;
      CVReturn v25 = (const char *)v14;
      BOOL v10 = &_os_log_internal;
      goto LABEL_32;
    }
    if (e5rt_surface_desc_get_custom_row_strides())
    {
      uint64_t v17 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        CVReturn v25 = "e5rt_surface_desc_get_custom_row_strides failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136315138;
      CVReturn v25 = (const char *)v17;
      BOOL v10 = &_os_log_internal;
      goto LABEL_32;
    }
    uint64_t v19 = *a3;
    if (!*a3)
    {
      uint64_t v20 = [v8 imageDescriptor];
      *a3 = PixelBufferUtils::createPixelBuffer(0, 0, [v20 pixelFormat], 1);

      uint64_t v19 = *a3;
      if (!*a3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v8 name];
          uint64_t v23 = [v22 UTF8String];
          *(_DWORD *)buf = 136315138;
          CVReturn v25 = (const char *)v23;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed allocating CVPixelBuffer for \"%s\"", buf, 0xCu);
        }
        goto LABEL_33;
      }
    }
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v19);
    if (IOSurface)
    {
      int64_t v11 = [(ADEspressoRunnerV2 *)self registerIOSurface:IOSurface forSurfacePort:a5 surfaceDesc:0];
      goto LABEL_34;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    size_t v15 = &_os_log_internal;
    uint64_t v16 = "Provided pixelbuffer is not io-surface backed";
LABEL_25:
    _os_log_error_impl(&dword_247EC4000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
LABEL_26:
    int64_t v11 = -22953;
    goto LABEL_34;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    size_t v15 = &_os_log_internal;
    uint64_t v16 = "cannot register buffer for nil descriptor";
    goto LABEL_25;
  }
  int64_t v11 = -22953;
LABEL_34:

  return v11;
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  return [(ADEspressoRunnerV2 *)self registerPixelBufferPtr:a3 forDescriptor:a4 usingOperation:self->_operation];
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forTensorPort:(e5rt_io_port *)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (e5rt_buffer_object_create_from_iosurface())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v10 = "e5rt_buffer_object_create_from_iosurface failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return -22971;
    }
    *(_DWORD *)buf = 136315138;
    BOOL v10 = (const char *)last_error_message;
    id v5 = &_os_log_internal;
    goto LABEL_14;
  }
  if (!e5rt_io_port_bind_buffer_object()) {
    return 0;
  }
  uint64_t v6 = e5rt_get_last_error_message();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v10 = "e5rt_io_port_bind_buffer_object failed";
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v10 = (const char *)v6;
    id v5 = &_os_log_internal;
LABEL_14:
    _os_log_error_impl(&dword_247EC4000, v5, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
  return -22971;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forSurfacePort:(e5rt_io_port *)a4 surfaceDesc:(e5rt_surface_desc *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  PixelFormat = (PixelBufferUtils *)IOSurfaceGetPixelFormat(a3);
  if (e5rt_surface_desc_get_format())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "e5rt_surface_desc_get_format failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return -22971;
    }
    goto LABEL_5;
  }
  if (![(ADEspressoRunnerV2 *)self canBindFormat:PixelFormat e5rtFormat:0])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      PixelBufferUtils::pixelFormatAsString(PixelFormat, buf);
      uint64_t v13 = v15 >= 0 ? buf : *(unsigned char **)buf;
      *(_DWORD *)uint64_t v16 = 67109378;
      *(_DWORD *)&v16[4] = 0;
      __int16 v17 = 2080;
      BOOL v18 = v13;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unable to bind surface. mismatch in pixel formats. expecting e5rt format %d but got ostype %s", v16, 0x12u);
      if (v15 < 0) {
        operator delete(*(void **)buf);
      }
    }
    return -22971;
  }
  *(void *)uint64_t v16 = 0;
  if (e5rt_surface_object_create_from_iosurface())
  {
    uint64_t v8 = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "e5rt_surface_object_create_from_iosurface failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v8;
    id v9 = &_os_log_internal;
    goto LABEL_35;
  }
  if (!e5rt_io_port_bind_surface_object())
  {
    int64_t v10 = 0;
    goto LABEL_20;
  }
  uint64_t v12 = e5rt_get_last_error_message();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "e5rt_io_port_bind_surface_object failed";
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v12;
    id v9 = &_os_log_internal;
LABEL_35:
    _os_log_error_impl(&dword_247EC4000, v9, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
LABEL_19:
  int64_t v10 = -22971;
LABEL_20:
  if (*(void *)v16 && e5rt_surface_object_release())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "e5rt_surface_object_release failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return -22971;
    }
LABEL_5:
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = last_error_message;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    return -22971;
  }
  return v10;
}

- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3
{
  id v4 = a3;
  CVPixelBufferRef texture = 0;
  int64_t v5 = [(ADEspressoRunnerV2 *)self registerPixelBufferPtr:&texture forDescriptor:v4];
  uint64_t v6 = texture;
  if (v5)
  {
    CVPixelBufferRelease(texture);
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)canBindFormat:(unsigned int)a3 e5rtFormat:(int)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (e5rt_cvpb_4cc_to_surface_format())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "e5rt_cvpb_4cc_to_surface_format failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      id v9 = (const char *)last_error_message;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = a4 == 0;
  }
  return v6;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_DWORD *)self + 28) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkVersionString, 0);
  std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::~__hash_table((uint64_t)&self->_alternateBindFormats);
  std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::~__hash_table((uint64_t)&self->_acceptedBindFormats);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_dummyOperations, 0);
}

- (void)setStream:(e5rt_execution_stream *)a3
{
  self->_stream = a3;
}

- (e5rt_execution_stream)stream
{
  return self->_stream;
}

- (void)setOperation:(e5rt_execution_stream_operation *)a3
{
  self->_operation = a3;
}

- (e5rt_execution_stream_operation)operation
{
  return self->_operation;
}

- (NSString)networkVersionString
{
  return self->_networkVersionString;
}

- (void)dealloc
{
  if (self->_operation) {
    e5rt_execution_stream_operation_release();
  }
  if (self->_stream) {
    e5rt_execution_stream_release();
  }
  if (self->_dummyStream) {
    e5rt_execution_stream_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)ADEspressoRunnerV2;
  [(ADEspressoRunnerV2 *)&v3 dealloc];
}

- (int64_t)execute
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int v9 = 335678456;
  long long v10 = 0u;
  long long v11 = 0u;
  kdebug_trace();
  if (e5rt_execution_stream_encode_operation())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "e5rt_execution_stream_encode_operation failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = (const char *)last_error_message;
    id v4 = &_os_log_internal;
    goto LABEL_16;
  }
  if (e5rt_execution_stream_execute_sync())
  {
    uint64_t v5 = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "e5rt_execution_stream_execute_sync failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = (const char *)v5;
    id v4 = &_os_log_internal;
    goto LABEL_16;
  }
  if (!e5rt_execution_stream_reset())
  {
    int64_t v7 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = e5rt_get_last_error_message();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "e5rt_execution_stream_reset failed";
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = (const char *)v6;
    id v4 = &_os_log_internal;
LABEL_16:
    _os_log_error_impl(&dword_247EC4000, v4, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
  }
LABEL_17:
  int64_t v7 = -22968;
LABEL_18:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v9);
  objc_sync_exit(v2);

  return v7;
}

- (int64_t)prewireSurfaces:(id)a3 toDescriptors:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v40 = v6;
  id v41 = a4;
  if (self->_dummyOperations)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int64_t v7 = &_os_log_internal;
      uint64_t v8 = "buffers already prewired. cannot prewire a second time";
      uint32_t v9 = 2;
LABEL_36:
      _os_log_error_impl(&dword_247EC4000, v7, OS_LOG_TYPE_ERROR, v8, buf, v9);
    }
LABEL_37:
    int64_t v21 = -22967;
    goto LABEL_38;
  }
  if (!v6 || !v41)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 134218240;
    v48 = (const char *)v6;
    __int16 v49 = 2048;
    uint64_t v50 = (uint64_t)v41;
    int64_t v7 = &_os_log_internal;
    uint64_t v8 = "nil inputs in prewire method: %p, %p";
LABEL_35:
    uint32_t v9 = 22;
    goto LABEL_36;
  }
  uint64_t v10 = [v6 count];
  if (v10 != [v41 count])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 134218240;
    v48 = (const char *)[v41 count];
    __int16 v49 = 2048;
    uint64_t v50 = [v6 count];
    int64_t v7 = &_os_log_internal;
    uint64_t v8 = "cannot prewire buffers: number of descriptors %lu does not match number of surface arrays %lu.";
    goto LABEL_35;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v6;
  uint64_t v12 = 0;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = [*(id *)(*((void *)&v43 + 1) + 8 * i) count];
        if ((unint64_t)v12 <= v16) {
          uint64_t v12 = (const char *)v16;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v13);
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = v12;
    _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "creating %lu dummy stream operations for prewiring", buf, 0xCu);
  }
  v39 = [MEMORY[0x263F08A90] pointerFunctionsWithOptions:514];
  [v39 setRelinquishFunction:dummyOpRelinquishFunction];
  [v39 setSizeFunction:dummyOpSizeFunction];
  id obj = [MEMORY[0x263F08A88] pointerArrayWithPointerFunctions:v39];
  if (v12)
  {
    uint64_t v17 = 0;
    BOOL v18 = &_os_log_internal;
    while (1)
    {
      uint64_t v19 = [NSString stringWithFormat:@"%@__op%lu", self->_path, v17];
      if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v19;
        _os_log_impl(&dword_247EC4000, v18, OS_LOG_TYPE_DEFAULT, "creating dummey operation %@.", buf, 0xCu);
      }
      uint64_t v20 = v19;
      [v20 UTF8String];
      [(NSString *)self->_path UTF8String];
      [(NSString *)self->_functionName UTF8String];
      if (e5rt_execution_stream_operation_create_precompiled_compute_operation()) {
        break;
      }
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v48 = 0;
          _os_log_impl(&dword_247EC4000, v18, OS_LOG_TYPE_DEFAULT, "registered dummy op %p", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v48 = 0;
        _os_log_debug_impl(&dword_247EC4000, v18, OS_LOG_TYPE_DEBUG, "registered dummy op %p", buf, 0xCu);
      }
      [obj addPointer:0];

      if (v12 == (const char *)++v17) {
        goto LABEL_39;
      }
    }
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "failed creating dummy stream operation";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = (const char *)last_error_message;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
  }
  else
  {
LABEL_39:
    unint64_t v23 = 0;
    long long v24 = &_os_log_internal;
    while (v23 < [v41 count])
    {
      CVReturn v25 = [v41 objectAtIndexedSubscript:v23];
      uint64_t v26 = [v11 objectAtIndexedSubscript:v23];
      if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v26 count];
        id v28 = [v25 name];
        *(_DWORD *)buf = 134218242;
        v48 = (const char *)v27;
        __int16 v49 = 2112;
        uint64_t v50 = (uint64_t)v28;
        _os_log_impl(&dword_247EC4000, v24, OS_LOG_TYPE_DEFAULT, "prewiring %lu surfaces to input %@", buf, 0x16u);
      }
      if (v12)
      {
        uint64_t v29 = 0;
        while (1)
        {
          uint64_t v30 = objc_msgSend(v26, "objectAtIndexedSubscript:", (unint64_t)v29 % objc_msgSend(v26, "count"));

          int64_t v21 = -[ADEspressoRunnerV2 registerIOSurface:forDescriptor:usingOperation:](self, "registerIOSurface:forDescriptor:usingOperation:", v30, v25, [obj pointerAtIndex:v29]);
          if (v21) {
            break;
          }
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v31 = [v25 name];
            *(_DWORD *)buf = 134218498;
            v48 = v29;
            __int16 v49 = 2112;
            uint64_t v50 = (uint64_t)v31;
            __int16 v51 = 2048;
            unint64_t v52 = v23;
            _os_log_impl(&dword_247EC4000, v24, OS_LOG_TYPE_DEFAULT, "registered surface idx %lu from descriptor %@ to dummy op %lu", buf, 0x20u);
          }
          if (v12 == ++v29) {
            goto LABEL_51;
          }
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          v36 = [v25 name];
          *(_DWORD *)buf = 138412546;
          v48 = v36;
          __int16 v49 = 2048;
          uint64_t v50 = (uint64_t)v30;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to prewire %@: unable to bind iosurface %p", buf, 0x16u);
        }
        goto LABEL_61;
      }
LABEL_51:

      ++v23;
    }
    if (self->_dummyStream) {
      goto LABEL_63;
    }
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "creating dummy stream for prewiring", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "creating dummy stream for prewiring", buf, 2u);
    }
    if (!e5rt_execution_stream_create())
    {
LABEL_63:
      unint64_t v33 = 0;
      while (v33 < [obj count])
      {
        [obj pointerAtIndex:v33++];
        if (e5rt_execution_stream_encode_operation())
        {
          uint64_t v34 = e5rt_get_last_error_message();
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "failed encoding dummy operation to stream";
            _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = (const char *)v34;
            v35 = &_os_log_internal;
            goto LABEL_86;
          }
          goto LABEL_60;
        }
      }
      if (!e5rt_execution_stream_prewire_in_use_allocations())
      {
        objc_storeStrong((id *)&self->_dummyOperations, obj);
        int64_t v21 = 0;
        goto LABEL_61;
      }
      uint64_t v37 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "failed prewiring stream";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = (const char *)v37;
        v35 = &_os_log_internal;
        goto LABEL_86;
      }
    }
    else
    {
      uint64_t v38 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "failed creating dummy stream";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = (const char *)v38;
        v35 = &_os_log_internal;
LABEL_86:
        _os_log_error_impl(&dword_247EC4000, v35, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
    }
  }
LABEL_60:
  int64_t v21 = -22967;
LABEL_61:

LABEL_38:
  return v21;
}

- (void)unwireAllSurfaces
{
  if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "resetting dummy operations for espressoV2 runner", v4, 2u);
  }
  dummyOperations = self->_dummyOperations;
  self->_dummyOperations = 0;
}

- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  size_t Width = CVPixelBufferGetWidth(*a3);
  if (Width != CVPixelBufferGetWidth(*a5) || (size_t v13 = CVPixelBufferGetHeight(*a3), v13 != CVPixelBufferGetHeight(*a5)))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      size_t v24 = CVPixelBufferGetWidth(*a3);
      size_t Height = CVPixelBufferGetHeight(*a3);
      size_t v26 = CVPixelBufferGetWidth(*a5);
      size_t v27 = CVPixelBufferGetHeight(*a5);
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = v24;
      __int16 v35 = 2048;
      size_t v36 = Height;
      __int16 v37 = 2048;
      size_t v38 = v26;
      __int16 v39 = 2048;
      size_t v40 = v27;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different dimensions (%zux%zu) vs (%zux%zu)", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(*a5))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a3);
      uint64_t v20 = buf;
      PixelBufferUtils::pixelFormatAsString(v19, buf);
      if (v37 < 0) {
        uint64_t v20 = *(unsigned char **)buf;
      }
      int64_t v21 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a5);
      PixelBufferUtils::pixelFormatAsString(v21, (char *)__p);
      if (v29 >= 0) {
        id v22 = __p;
      }
      else {
        id v22 = (void **)__p[0];
      }
      *(_DWORD *)uint64_t v30 = 136315394;
      v31 = v20;
      __int16 v32 = 2080;
      unint64_t v33 = v22;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different formats (%s) vs (%s)", v30, 0x16u);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v37) < 0) {
        operator delete(*(void **)buf);
      }
    }
LABEL_9:
    int64_t v16 = -22953;
    goto LABEL_10;
  }
  char v15 = *a3;
  *a3 = *a5;
  *a5 = v15;
  int64_t v16 = [(ADEspressoRunnerV2 *)self registerPixelBuffer:*a3 forDescriptor:v10];
  if (v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v10 name];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = [v17 UTF8String];
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);
    }
  }
  else
  {
    int64_t v16 = [(ADEspressoRunnerV2 *)self registerPixelBuffer:*a5 forDescriptor:v11];
    if (v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v11 name];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = [v23 UTF8String];
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);
    }
  }
LABEL_10:

  return v16;
}

- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  uint64_t v5 = a3;
  return [(ADEspressoRunnerV2 *)self registerPixelBufferPtr:&v5 forDescriptor:a4];
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4 usingOperation:(e5rt_execution_stream_operation *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int v16 = 335679308;
  long long v17 = 0u;
  long long v18 = 0u;
  kdebug_trace();
  if (a3)
  {
    uint32_t v9 = self;
    objc_sync_enter(v9);
    uint64_t v15 = [(ADEspressoRunnerV2 *)v9 retainPortForDescriptor:v8 usingOperation:a5];
    if (v15)
    {
      if (e5rt_io_port_is_surface())
      {
        uint64_t last_error_message = e5rt_get_last_error_message();
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v20 = "e5rt_io_port_is_surface failed";
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v20 = (const char *)last_error_message;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
        }
        int64_t v11 = -22971;
      }
      else
      {
        int64_t v11 = [(ADEspressoRunnerV2 *)v9 registerIOSurface:a3 forTensorPort:&v15];
      }
      if (!v15 || !e5rt_io_port_release()) {
        goto LABEL_19;
      }
      uint64_t v12 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = "e5rt_io_port_release failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v20 = (const char *)v12;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
    }
    int64_t v11 = -22971;
LABEL_19:
    objc_sync_exit(v9);

    goto LABEL_20;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [v8 name];
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "espresso runner failed registering %@: null surface", buf, 0xCu);
  }
  int64_t v11 = -22971;
LABEL_20:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v16);

  return v11;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4
{
  return [(ADEspressoRunnerV2 *)self registerIOSurface:a3 forDescriptor:a4 usingOperation:self->_operation];
}

- (ADEspressoRunnerV2)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  __int16 v37 = (char *)a3;
  id v38 = a5;
  int v48 = 335679304;
  long long v49 = 0u;
  long long v50 = 0u;
  kdebug_trace();
  v47.receiver = self;
  v47.super_class = (Class)ADEspressoRunnerV2;
  uint32_t v9 = [(ADEspressoRunnerV2 *)&v47 init];
  if (!v9) {
    goto LABEL_65;
  }
  if (v38) {
    id v10 = (__CFString *)v38;
  }
  else {
    id v10 = @"main";
  }
  functionName = v9->_functionName;
  v9->_functionName = &v10->isa;

  objc_storeStrong((id *)&v9->_path, a3);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v52 = v37;
    _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "loading network from: %@", buf, 0xCu);
  }
  uint64_t v46 = 0;
  dummyOperations = v9->_dummyOperations;
  v9->_dummyOperations = 0;

  v9->_dummyStream = 0;
  [(NSString *)v9->_path UTF8String];
  if (e5rt_program_library_create())
  {
    uint64_t last_error_message = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v52 = "e5rt_program_library_create failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v52 = (const char *)last_error_message;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    int v14 = 1;
  }
  else
  {
    CFDictionaryRef theDict = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v9->_functionName;
      *(_DWORD *)buf = 138412290;
      unint64_t v52 = (const char *)v15;
      _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Espresso runner requested function: %@", buf, 0xCu);
    }
    [(NSString *)v9->_functionName UTF8String];
    if (e5rt_program_library_get_function_metadata())
    {
      uint64_t v16 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v52 = "e5rt_program_library_get_function_metadata failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v52 = (const char *)v16;
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      int v14 = 1;
    }
    else
    {
      uint64_t v17 = CFDictionaryGetValue(theDict, @"UserVersion");
      networkVersionString = v9->_networkVersionString;
      v9->_networkVersionString = (NSString *)v17;

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(NSString *)v9->_networkVersionString UTF8String];
        *(_DWORD *)buf = 136315138;
        unint64_t v52 = (const char *)v19;
        _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network version: %s", buf, 0xCu);
      }
      CFDictionaryGetValue(theDict, @"Ops");
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = 0;
      uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v42;
        BOOL v24 = ((0x1Du >> a4) & 1) == 0 || a4 > 4;
        while (2)
        {
          uint64_t v25 = 0;
          size_t v26 = v20;
          do
          {
            if (*(void *)v42 != v22) {
              objc_enumerationMutation(obj);
            }
            size_t v27 = *(void **)(*((void *)&v41 + 1) + 8 * v25);
            uint64_t v20 = [v27 objectForKeyedSubscript:@"ComputeBackend"];

            if (v24 || ([v20 isEqualToString:off_265232A78[a4]] & 1) == 0)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                uint64_t v34 = [v27 objectForKeyedSubscript:@"OpName"];
                ADCommonUtils::espressoEngineAsString(a4, __p);
                if (v40 >= 0) {
                  __int16 v35 = __p;
                }
                else {
                  __int16 v35 = (void **)__p[0];
                }
                *(_DWORD *)buf = 138412802;
                unint64_t v52 = v34;
                __int16 v53 = 2112;
                uint64_t v54 = v20;
                __int16 v55 = 2080;
                v56 = v35;
                _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "op '%@' backend (%@) does not match requested engine (%s)", buf, 0x20u);
                if (v40 < 0) {
                  operator delete(__p[0]);
                }
              }
              int v14 = 1;
              goto LABEL_42;
            }
            ++v25;
            size_t v26 = v20;
          }
          while (v21 != v25);
          uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v52 = (const char *)v20;
        _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network backend is: %@", buf, 0xCu);
      }
      int v14 = 0;
LABEL_42:
    }
    if (theDict) {
      CFRelease(theDict);
    }
  }
  if (v46 && e5rt_program_library_release())
  {
    uint64_t v28 = e5rt_get_last_error_message();
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v52 = "e5rt_program_library_release failed";
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v52 = (const char *)v28;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    goto LABEL_64;
  }
  if (!v14)
  {
    [(NSString *)v9->_path UTF8String];
    [(NSString *)v9->_path UTF8String];
    [(NSString *)v9->_functionName UTF8String];
    if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
    {
      uint64_t v29 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v52 = "e5rt_execution_stream_operation_create_precompiled_compute_operation failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v52 = (const char *)v29;
      uint64_t v30 = &_os_log_internal;
      goto LABEL_75;
    }
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      createOperationInputsOutputsDescription(v9->_operation);
    }
    if (e5rt_execution_stream_create())
    {
      uint64_t v31 = e5rt_get_last_error_message();
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unint64_t v52 = "e5rt_execution_stream_create failed";
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v52 = (const char *)v31;
      uint64_t v30 = &_os_log_internal;
LABEL_75:
      _os_log_error_impl(&dword_247EC4000, v30, OS_LOG_TYPE_ERROR, "E5RT operation failed with message = %s", buf, 0xCu);
      goto LABEL_64;
    }
LABEL_65:
    __int16 v32 = v9;
    goto LABEL_66;
  }
LABEL_64:
  __int16 v32 = 0;
LABEL_66:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v48);

  return v32;
}

- (void)buildBindFormatsMap
{
  v2 = (uint64_t *)self;
  uint64_t v42 = *MEMORY[0x263EF8340];
  *(void *)__src = 0x3432306634323076;
  p_acceptedBindFormats = (uint64_t *)&self->_acceptedBindFormats;
  int v39 = 0;
  id v4 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>((uint64_t *)&self->_acceptedBindFormats, 0, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v4 + 3, __src, &__src[8], 2uLL);
  int v39 = 1;
  *(_DWORD *)__src = 1278226488;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 1u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v5 + 3, __src, &__src[4], 1uLL);
  int v39 = 2;
  *(_DWORD *)__src = 1111970369;
  id v6 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 2u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v6 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 1380401729;
  int v39 = 3;
  int64_t v7 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 3u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v7 + 3, __src, &__src[4], 1uLL);
  int v39 = 4;
  *(_DWORD *)__src = 843264056;
  id v8 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 4u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v8 + 3, __src, &__src[4], 1uLL);
  *(void *)__src = 0x3434346634343476;
  int v39 = 5;
  uint32_t v9 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 5u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v9 + 3, __src, &__src[8], 2uLL);
  int v39 = 6;
  *(_DWORD *)__src = 843264102;
  id v10 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 6u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v10 + 3, __src, &__src[4], 1uLL);
  int v39 = 7;
  *(_DWORD *)__src = 1278226536;
  int64_t v11 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 7u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v11 + 3, __src, &__src[4], 1uLL);
  *(void *)__src = 0x6864657068646973;
  v2 += 10;
  int v39 = 7;
  uint64_t v12 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 7u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v12 + 3, __src, &__src[8], 2uLL);
  int v39 = 8;
  *(_DWORD *)__src = 32;
  size_t v13 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 8u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v13 + 3, __src, &__src[4], 1uLL);
  int v39 = 9;
  *(_DWORD *)__src = 1751410032;
  int v14 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 9u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v14 + 3, __src, &__src[4], 1uLL);
  *(void *)__src = 0x686469734C303068;
  int v39 = 9;
  uint64_t v15 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 9u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v15 + 3, __src, &__src[8], 2uLL);
  int v39 = 10;
  *(_DWORD *)__src = 1751411059;
  uint64_t v16 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xAu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v16 + 3, __src, &__src[4], 1uLL);
  *(void *)__src = 0x686465704C303068;
  int v39 = 10;
  uint64_t v17 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 0xAu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v17 + 3, __src, &__src[8], 2uLL);
  int v39 = 11;
  *(_DWORD *)__src = 1380411457;
  long long v18 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xBu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v18 + 3, __src, &__src[4], 1uLL);
  int v39 = 12;
  *(_DWORD *)__src = 1380410945;
  uint64_t v19 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xCu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v19 + 3, __src, &__src[4], 1uLL);
  int v39 = 13;
  *(_DWORD *)__src = 1278226534;
  uint64_t v20 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xDu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v20 + 3, __src, &__src[4], 1uLL);
  *(void *)__src = 0x6664657066646973;
  int v39 = 13;
  uint64_t v21 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(v2, 0xDu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v21 + 3, __src, &__src[8], 2uLL);
  qmemcpy(__src, "024x02fx02wx", sizeof(__src));
  int v39 = 14;
  uint64_t v22 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xEu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v22 + 3, __src, v41, 3uLL);
  qmemcpy(__src, "024p02fp02wp", sizeof(__src));
  int v39 = 15;
  id v23 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0xFu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v23 + 3, __src, v41, 3uLL);
  int v39 = 16;
  *(_DWORD *)__src = 1278226742;
  BOOL v24 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x10u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v24 + 3, __src, &__src[4], 1uLL);
  int v39 = 17;
  *(_DWORD *)__src = 642527542;
  uint64_t v25 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x11u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v25 + 3, __src, &__src[4], 1uLL);
  int v39 = 18;
  *(_DWORD *)__src = 642527336;
  size_t v26 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x12u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v26 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 759967848;
  int v39 = 19;
  size_t v27 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x13u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v27 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 793522280;
  int v39 = 20;
  uint64_t v28 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x14u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v28 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 2085367912;
  int v39 = 21;
  uint64_t v29 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x15u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v29 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 641877825;
  int v39 = 22;
  uint64_t v30 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x16u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v30 + 3, __src, &__src[4], 1uLL);
  int v39 = 23;
  *(_DWORD *)__src = 2084718401;
  uint64_t v31 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x17u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v31 + 3, __src, &__src[4], 1uLL);
  int v39 = 24;
  *(_DWORD *)__src = 2084718401;
  __int16 v32 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x18u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v32 + 3, __src, &__src[4], 1uLL);
  int v39 = 25;
  *(_DWORD *)__src = 2084718401;
  unint64_t v33 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x19u, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v33 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 642934849;
  int v39 = 26;
  uint64_t v34 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Au, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v34 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 760375361;
  int v39 = 27;
  __int16 v35 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Bu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v35 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 793929793;
  int v39 = 28;
  size_t v36 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Cu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v36 + 3, __src, &__src[4], 1uLL);
  *(_DWORD *)__src = 2085775425;
  int v39 = 29;
  __int16 v37 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Du, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v37 + 3, __src, &__src[4], 1uLL);
  *(void *)__src = 0x2638663026387630;
  int v39 = 30;
  id v38 = std::__hash_table<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::__unordered_map_hasher<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::hash<e5rt_surface_format_t>,std::equal_to<e5rt_surface_format_t>,true>,std::__unordered_map_equal<e5rt_surface_format_t,std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>,std::equal_to<e5rt_surface_format_t>,std::hash<e5rt_surface_format_t>,true>,std::allocator<std::__hash_value_type<e5rt_surface_format_t,std::vector<unsigned int>>>>::__emplace_unique_key_args<e5rt_surface_format_t,std::piecewise_construct_t const&,std::tuple<e5rt_surface_format_t&&>,std::tuple<>>(p_acceptedBindFormats, 0x1Eu, &v39);
  std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(v38 + 3, __src, &__src[8], 2uLL);
}

@end