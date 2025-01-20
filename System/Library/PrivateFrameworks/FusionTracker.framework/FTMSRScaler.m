@interface FTMSRScaler
- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6;
- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6 mean:;
- (FTMSRScaler)init;
- (id).cxx_construct;
@end

@implementation FTMSRScaler

- (FTMSRScaler)init
{
  v5.receiver = self;
  v5.super_class = (Class)FTMSRScaler;
  if ([(FTMSRScaler *)&v5 init])
  {
    char v3 = 1;
    uint64_t v4 = 4;
    operator new();
  }

  return 0;
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6
{
  return -[FTMSRScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:](self, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (BOOL)scaleSourceBuffer:(__CVBuffer *)a3 toDestinationBuffer:(__CVBuffer *)a4 sourceROI:(CGRect)a5 destinationROI:(CGRect)a6 mean:
{
  v7 = v6;
  double height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double v13 = a5.size.height;
  double v14 = a5.size.width;
  CGFloat v15 = a5.origin.y;
  CGFloat v16 = a5.origin.x;
  v48 = &unk_26C78E610;
  CVPixelBufferRef v49 = a3;
  CVPixelBufferLockFlags v50 = 0;
  if (CVPixelBufferLockBaseAddress(a3, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_24;
  }
  CVPixelBufferLockFlags v47 = 0;
  v48 = &unk_26C78E538;
  v45 = &unk_26C78E610;
  CVPixelBufferRef v46 = a4;
  if (CVPixelBufferLockBaseAddress(a4, 0))
  {
    v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "Failed to lock pixel buffer.");
    goto LABEL_22;
  }
  v45 = &unk_26C78E538;
  v51.origin.CGFloat x = v16;
  v51.origin.CGFloat y = v15;
  v51.size.double width = v14;
  v51.size.double height = v13;
  if (CGRectIsEmpty(v51))
  {
    double v14 = (double)CVPixelBufferGetWidth(a3);
    double v13 = (double)CVPixelBufferGetHeight(a3);
    CGFloat v16 = 0.0;
    CGFloat v15 = 0.0;
  }
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.double width = width;
  v52.size.double height = height;
  if (CGRectIsEmpty(v52))
  {
    double width = (double)CVPixelBufferGetWidth(a4);
    double height = (double)CVPixelBufferGetHeight(a4);
    CGFloat y = 0.0;
    CGFloat x = 0.0;
  }
  bzero(v44, 0x620uLL);
  value = (unint64_t **)self->_resampler.__ptr_.__value_;
  if (v7) {
    v20 = v44;
  }
  else {
    v20 = 0;
  }
  *(CGFloat *)v27 = v16;
  *(CGFloat *)&v27[1] = v15;
  *(double *)&v27[2] = v14;
  *(double *)&v27[3] = v13;
  char v28 = 1;
  CGFloat v29 = x;
  CGFloat v30 = y;
  double v31 = width;
  double v32 = height;
  char v33 = 1;
  char v34 = 0;
  char v35 = 0;
  char v36 = 1;
  uint64_t v37 = 0;
  v38 = v20;
  CGFloat v39 = x;
  CGFloat v40 = y;
  double v41 = width;
  double v42 = height;
  BOOL v43 = v7 != 0;
  ik::core::msr::MSR::Resample(*value, a3, a4, (uint64_t)v27);
  if (v7 && (v21 = (ft *)FTComputeMeanColor((ft *)v44, (unint64_t)(width * height), v7), v21))
  {
    v22 = ft::GetOsLog(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[FTMSRScaler scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:]();
    }

    BOOL v23 = 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  v45 = &unk_26C78E610;
  if (CVPixelBufferUnlockBaseAddress(v46, v47))
  {
    v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "Failed to unlock pixel buffer.");
LABEL_22:
    __cxa_throw(v26, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v48 = &unk_26C78E610;
  if (CVPixelBufferUnlockBaseAddress(v49, v50))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_24:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return v23;
}

- (void).cxx_destruct
{
  value = self->_resampler.__ptr_.__value_;
  self->_resampler.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v3 = *(void *)value;
    *(void *)value = 0;
    if (v3)
    {
      uint64_t v4 = *(const void **)(v3 + 16);
      if (v4) {
        CFRelease(v4);
      }
      std::__tree<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::__map_value_compare<std::pair<CGSize,unsigned int>,std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>,std::less<std::pair<CGSize,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<CGSize,unsigned int>,ik::PixelBufferTensor>>>::destroy(v3 + 24, *(void **)(v3 + 32));
      MEMORY[0x21D449420](v3, 0x1020C40F15AEE48);
    }
    JUMPOUT(0x21D449420);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Failed to compute image mean.", v2, v3, v4, v5, v6);
}

- (void)scaleSourceBuffer:(uint64_t)a1 toDestinationBuffer:(NSObject *)a2 sourceROI:destinationROI:mean:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21762A000, a2, OS_LOG_TYPE_ERROR, "Scaler encountered an error: %s", (uint8_t *)&v4, 0xCu);
}

@end