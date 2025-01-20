@interface ABPKMLNetworkBufferV2
- (ABPKMLNetworkBufferV2)initWithName:(id)a3 operation:(e5rt_execution_stream_operation *)a4 bindMode:(int64_t)a5 useSurface:(BOOL)a6;
- (BOOL)_readSurfaceDescriptor;
- (BOOL)_readTensorDescriptor;
- (NSString)name;
- (__CVBuffer)pixelBuffer;
- (int)surfaceFormat;
- (unint64_t)batchNumber;
- (unint64_t)channels;
- (unint64_t)height;
- (unint64_t)sequenceLength;
- (unint64_t)size;
- (unint64_t)strideBatchNumber;
- (unint64_t)strideChannels;
- (unint64_t)strideHeight;
- (unint64_t)strideSequenceLength;
- (unint64_t)strideWidth;
- (unint64_t)width;
- (void)bytes;
- (void)dealloc;
- (void)setInput:(id)a3 FromIOSurface:(__IOSurface *)a4;
@end

@implementation ABPKMLNetworkBufferV2

- (ABPKMLNetworkBufferV2)initWithName:(id)a3 operation:(e5rt_execution_stream_operation *)a4 bindMode:(int64_t)a5 useSurface:(BOOL)a6
{
  v22[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ABPKMLNetworkBufferV2;
  v11 = [(ABPKMLNetworkBufferV2 *)&v20 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v11->_name, a3);
  v12->_useSurface = a6;
  if (a5)
  {
    [v10 UTF8String];
    if (e5rt_execution_stream_operation_retain_output_port()) {
      goto LABEL_28;
    }
  }
  else
  {
    [(NSString *)v12->_name UTF8String];
    if (e5rt_execution_stream_operation_retain_input_port()) {
      goto LABEL_28;
    }
  }
  if (v12->_useSurface)
  {
    if (e5rt_io_port_retain_surface_desc()) {
      goto LABEL_28;
    }
    if ([(ABPKMLNetworkBufferV2 *)v12 _readSurfaceDescriptor])
    {
      if (!e5rt_surface_object_alloc() && !e5rt_io_port_bind_surface_object()) {
        goto LABEL_11;
      }
LABEL_28:
      last_error_message = (const char *)e5rt_get_last_error_message();
      printf("E5RT operation failed with message = %s", last_error_message);
      exit(1);
    }
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  if (e5rt_io_port_retain_tensor_desc()) {
    goto LABEL_28;
  }
  if (![(ABPKMLNetworkBufferV2 *)v12 _readTensorDescriptor])
  {
    v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, " Reading tensor descriptor failed ", buf, 2u);
    }

    goto LABEL_21;
  }
  uint64_t v21 = *MEMORY[0x263F04130];
  v22[0] = MEMORY[0x263EFFA78];
  v14 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v12->_width, v12->_channels * v12->_height * v12->_batchNumber, 0x4C303068u, (CFDictionaryRef)v14, &v12->_pixelBuffer))
  {
    v15 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_ERROR, " Could not create espresso v2 output buffer ", buf, 2u);
    }

    goto LABEL_21;
  }
  CVPixelBufferLockBaseAddress(v12->_pixelBuffer, 0);
  CVPixelBufferGetIOSurface(v12->_pixelBuffer);
  if (e5rt_buffer_object_create_from_iosurface()
    || e5rt_io_port_bind_buffer_object()
    || e5rt_buffer_object_get_data_ptr()
    || e5rt_buffer_object_get_size())
  {
    goto LABEL_28;
  }
  CVPixelBufferUnlockBaseAddress(v12->_pixelBuffer, 0);

LABEL_11:
  v13 = v12;
LABEL_22:

  return v13;
}

- (BOOL)_readSurfaceDescriptor
{
  if (e5rt_surface_desc_get_format()
    || e5rt_surface_desc_get_width()
    || e5rt_surface_desc_get_height())
  {
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
  return 1;
}

- (BOOL)_readTensorDescriptor
{
  if (e5rt_tensor_desc_retain_dtype()
    || e5rt_tensor_desc_dtype_get_num_components()
    || e5rt_tensor_desc_dtype_get_component_dtype()
    || e5rt_tensor_desc_dtype_get_element_size()
    || e5rt_tensor_desc_get_shape()
    || (self->_width = 1,
        self->_height = 1,
        self->_channels = 1,
        self->_batchNumber = 1,
        self->_sequenceLength = 1,
        e5rt_tensor_desc_get_strides()))
  {
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
  unint64_t bytesPerElement = self->_bytesPerElement;
  self->_strideWidth = MEMORY[0] / bytesPerElement;
  self->_strideHeight = MEMORY[0] / bytesPerElement;
  self->_strideChannels = MEMORY[0] / bytesPerElement;
  self->_strideBatchNumber = MEMORY[0] / bytesPerElement;
  self->_strideSequenceLength = MEMORY[0] / bytesPerElement;
  e5rt_tensor_desc_dtype_release();
  return 1;
}

- (void)setInput:(id)a3 FromIOSurface:(__IOSurface *)a4
{
  id v6 = a3;
  if (self->_surfaceObject && e5rt_surface_object_release()
    || e5rt_surface_object_create_from_iosurface()
    || e5rt_io_port_bind_surface_object())
  {
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
}

- (void)dealloc
{
  if (self->_memory) {
    e5rt_buffer_object_release();
  }
  if (self->_surfaceObject) {
    e5rt_surface_object_release();
  }
  if (self->_tensorDesc) {
    e5rt_tensor_desc_release();
  }
  if (self->_surfaceDesc) {
    e5rt_surface_desc_release();
  }
  if (self->_port) {
    e5rt_io_port_release();
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CVPixelBufferRelease(pixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPKMLNetworkBufferV2;
  [(ABPKMLNetworkBufferV2 *)&v4 dealloc];
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (unint64_t)batchNumber
{
  return self->_batchNumber;
}

- (unint64_t)sequenceLength
{
  return self->_sequenceLength;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)strideWidth
{
  return self->_strideWidth;
}

- (unint64_t)strideHeight
{
  return self->_strideHeight;
}

- (unint64_t)strideChannels
{
  return self->_strideChannels;
}

- (unint64_t)strideBatchNumber
{
  return self->_strideBatchNumber;
}

- (unint64_t)strideSequenceLength
{
  return self->_strideSequenceLength;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int)surfaceFormat
{
  return self->_surfaceFormat;
}

- (void)bytes
{
  return self->_bytes;
}

- (void).cxx_destruct
{
}

@end