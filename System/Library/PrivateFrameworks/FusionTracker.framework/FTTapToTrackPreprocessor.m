@interface FTTapToTrackPreprocessor
- (BOOL)preprocessBuffer:(__CVBuffer *)a3;
- (FTTapToTrackPreprocessor)initWithScaler:(id)a3;
- (__CVBuffer)bgraPixelBuffer;
- (double)meanPixel;
- (id).cxx_construct;
@end

@implementation FTTapToTrackPreprocessor

- (FTTapToTrackPreprocessor)initWithScaler:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTTapToTrackPreprocessor;
  v6 = [(FTTapToTrackPreprocessor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scaler, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)preprocessBuffer:(__CVBuffer *)a3
{
  ptr = self->_intermediateBuffer.__ptr_;
  if (!ptr)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (Width <= Height) {
      size_t v7 = Height;
    }
    else {
      size_t v7 = Width;
    }
    unint64_t v8 = (unint64_t)(double)(v7 / 0x280);
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    if (v8 >= 4) {
      unint64_t v9 = 4;
    }
    else {
      unint64_t v9 = v8;
    }
    size_t v10 = CVPixelBufferGetWidth(a3) / v9;
    size_t v11 = CVPixelBufferGetHeight(a3);
    ft::CreateIOSurfaceBackedPixelBuffer((ft *)v10, v11 / v9, 0x42475241u, &v16);
  }
  v12 = (ft *)-[FTScaling scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:](self->_scaler, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:mean:", a3, ptr, self->_meanPixel, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24), *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24), (void)v16);
  BOOL v13 = (char)v12;
  if ((v12 & 1) == 0)
  {
    v14 = ft::GetOsLog(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[FTTapToTrackPreprocessor preprocessBuffer:](v14);
    }
  }
  return v13;
}

- (__CVBuffer)bgraPixelBuffer
{
  return self->_intermediateBuffer.__ptr_;
}

- (double)meanPixel
{
  a2.i32[0] = *(_DWORD *)(a1 + 24);
  *(void *)&double result = vmovl_u8(a2).u64[0];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaler, 0);
  cntrl = self->_intermediateBuffer.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)preprocessBuffer:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21762A000, log, OS_LOG_TYPE_ERROR, "MSR preprocessing failed.", v1, 2u);
}

@end