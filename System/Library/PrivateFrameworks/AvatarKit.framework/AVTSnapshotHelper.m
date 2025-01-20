@interface AVTSnapshotHelper
- (BOOL)_isRenderPassDescriptorValid;
- (uint64_t)newCGImageWithRenderer:(uint64_t)a3 antialiasingMode:(uint64_t)a4 pixelWidth:(uint64_t)a5 pixelHeight:(void *)a6 error:;
- (uint64_t)newImageWithRenderer:(uint64_t)a3 antialiasingMode:(uint64_t)a4 pixelWidth:(uint64_t)a5 pixelHeight:(void *)a6 imagePointSize:(double)a7 contentScaleFactor:(double)a8 error:(float)a9;
- (void)_rebuildBitmapContextIfNeeded;
- (void)_rebuildRenderPassDescriptorIfNeeded;
- (void)dealloc;
@end

@implementation AVTSnapshotHelper

- (uint64_t)newCGImageWithRenderer:(uint64_t)a3 antialiasingMode:(uint64_t)a4 pixelWidth:(uint64_t)a5 pixelHeight:(void *)a6 error:
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v11 = a2;
  v12 = v11;
  if (!Image) {
    goto LABEL_54;
  }
  if (!a4 || !a5)
  {
    v16 = avt_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v66 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v66);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v67;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = a5;
      _os_log_error_impl(&dword_20B819000, v16, OS_LOG_TYPE_ERROR, "Error: %@ Can't create a snapshot of size %d×%d", buf, 0x18u);
    }
    Image = 0;
    goto LABEL_53;
  }
  uint64_t v13 = [v11 device];
  v14 = (void *)*((void *)Image + 1);
  *((void *)Image + 1) = v13;

  if (!*((void *)Image + 1))
  {
    v15 = avt_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:](v15);
    }
  }
  *((void *)Image + 9) = a4;
  *((void *)Image + 10) = a5;
  *((void *)Image + 11) = a3;
  v16 = [v12 backgroundColor];
  if (*((NSObject **)Image + 12) != v16)
  {
    objc_storeStrong((id *)Image + 12, v16);
    __n128 v17 = AVTColor4WithCGColor((CGColor *)[*((id *)Image + 12) CGColor]);
    float v18 = v17.n128_f32[3];
    float32x4_t v19 = vmulq_laneq_f32((float32x4_t)v17, (float32x4_t)v17, 3);
    double v20 = v19.f32[2];
    double v21 = v18;
    float64x2_t v88 = vcvtq_f64_f32(*(float32x2_t *)v19.f32);
    *(float64x2_t *)((char *)Image + 104) = v88;
    *((double *)Image + 15) = v19.f32[2];
    *((double *)Image + 16) = v18;
    v22 = [*((id *)Image + 3) colorAttachments];
    v23 = [v22 objectAtIndexedSubscript:0];
    objc_msgSend(v23, "setClearColor:", *(_OWORD *)&v88, v20, v21);
  }
  v24 = (id *)((char *)Image + 16);
  v25 = [*((id *)Image + 2) device];
  v26 = (void *)*((void *)Image + 1);

  if (v25 != v26)
  {
    v27 = (void *)*((void *)Image + 3);
    *((void *)Image + 3) = 0;

    uint64_t v28 = [*((id *)Image + 1) newCommandQueue];
    v29 = (void *)*((void *)Image + 2);
    *((void *)Image + 2) = v28;

    [*((id *)Image + 2) setBackgroundGPUPriority:2];
    int v30 = AVTMTLDeviceSupportsReadWritePixelFormat();
    v31 = @"avt_convert_linear_premultiplied_to_gamma_premultiplied_copy";
    *((unsigned char *)Image + 32) = v30;
    if (v30) {
      v31 = @"avt_convert_linear_premultiplied_to_gamma_premultiplied_in_place";
    }
    v32 = (void *)*((void *)Image + 1);
    v33 = v31;
    v34 = +[AVTMetalHelper helperForDevice:]((uint64_t)AVTMetalHelper, v32);
    uint64_t v35 = -[AVTMetalHelper computePipelineStateWithFunctionName:](v34, v33);

    v36 = (void *)*((void *)Image + 8);
    *((void *)Image + 8) = v35;
  }
  [(CGImage *)Image _rebuildRenderPassDescriptorIfNeeded];
  [(CGImage *)Image _rebuildBitmapContextIfNeeded];
  if (os_variant_has_internal_diagnostics())
  {
    id v37 = objc_alloc_init(MEMORY[0x263F12808]);
    [v37 setErrorOptions:1];
    v38 = [*v24 commandBufferWithDescriptor:v37];

    if (v38) {
      goto LABEL_16;
    }
LABEL_24:
    v39 = avt_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]((uint64_t *)Image + 2, v39);
    }
    Image = 0;
    goto LABEL_52;
  }
  v38 = [*v24 commandBuffer];
  if (!v38) {
    goto LABEL_24;
  }
LABEL_16:
  v89 = a6;
  objc_msgSend(v12, "renderWithViewport:commandBuffer:passDescriptor:", v38, *((void *)Image + 3), 0.0, 0.0, (double)*((unint64_t *)Image + 9), (double)*((unint64_t *)Image + 10));
  v39 = *((id *)Image + 5);
  unint64_t v40 = [*((id *)Image + 8) threadExecutionWidth];
  unint64_t v41 = [*((id *)Image + 8) maxTotalThreadsPerThreadgroup];
  v42 = [v38 computeCommandEncoder];
  [v42 setComputePipelineState:*((void *)Image + 8)];
  [v42 setTexture:*((void *)Image + 6) atIndex:0];
  if (!*((unsigned char *)Image + 32))
  {
    v43 = *((id *)Image + 7);

    [v42 setTexture:*((void *)Image + 7) atIndex:1];
    v39 = v43;
  }
  v44 = [v42 device];
  int v46 = AVTMTLDeviceSupportsNonUniformThreadgroupSize(v44, v45);

  if (v46)
  {
    uint64_t v47 = [*((id *)Image + 5) width];
    uint64_t v48 = [*((id *)Image + 5) height];
    *(void *)buf = v47;
    *(void *)&buf[8] = v48;
    *(void *)&buf[16] = 1;
    *(void *)v90 = v40;
    *(void *)&v90[8] = v41 / v40;
    *(void *)&v90[16] = 1;
    [v42 dispatchThreads:buf threadsPerThreadgroup:v90];
  }
  else
  {
    unint64_t v49 = [*((id *)Image + 5) width];
    if (v40 >= v49) {
      unint64_t v50 = v49;
    }
    else {
      unint64_t v50 = v40;
    }
    unint64_t v51 = [*((id *)Image + 5) height];
    if (v40 >= v51) {
      unint64_t v52 = v51;
    }
    else {
      unint64_t v52 = v40;
    }
    do
    {
      unint64_t v53 = v52;
      unint64_t v54 = v52 * v50;
      v52 >>= 1;
    }
    while (v54 > v41);
    unint64_t v55 = (v50 + [*((id *)Image + 5) width] - 1) / v50;
    uint64_t v56 = [*((id *)Image + 5) height];
    *(void *)buf = v55;
    *(void *)&buf[8] = (v53 + v56 - 1) / v53;
    *(void *)&buf[16] = 1;
    *(void *)v90 = v50;
    *(void *)&v90[8] = v53;
    *(void *)&v90[16] = 1;
    [v42 dispatchThreadgroups:buf threadsPerThreadgroup:v90];
  }
  [v42 endEncoding];
  [v38 commit];
  [v38 waitUntilCompleted];
  if ([v38 status] == 4)
  {
    Data = CGBitmapContextGetData(*((CGContextRef *)Image + 17));
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(*((CGContextRef *)Image + 17));
    memset(buf, 0, 24);
    *(_OWORD *)&buf[24] = *(_OWORD *)((char *)Image + 72);
    *(void *)&buf[40] = 1;
    [v39 getBytes:Data bytesPerRow:BytesPerRow fromRegion:buf mipmapLevel:0];
    Image = CGBitmapContextCreateImage(*((CGContextRef *)Image + 17));
LABEL_51:

LABEL_52:
LABEL_53:

LABEL_54:
    return (uint64_t)Image;
  }
  v59 = [v38 error];
  v60 = v59;
  if (v89 && v59) {
    void *v89 = v59;
  }
  if (AVTIsRunningInAppExtensionOrViewService())
  {
    v76 = avt_default_log();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
      v77 = (objc_class *)objc_opt_class();
      v78 = NSStringFromClass(v77);
      int v79 = [v38 status];
      v80 = [v38 logs];
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v78;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v79;
      *(_WORD *)&buf[38] = 2112;
      *(void *)&buf[40] = v60;
      LOWORD(v99) = 2112;
      *(void *)((char *)&v99 + 2) = v80;
      _os_log_fault_impl(&dword_20B819000, v76, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);
    }
    long long v100 = 0u;
    long long v99 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    v81 = (objc_class *)objc_opt_class();
    v82 = NSStringFromClass(v81);
    int v83 = [v38 status];
    v38 = [v38 logs];
    *(_DWORD *)v90 = 136316418;
    *(void *)&v90[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
    *(_WORD *)&v90[12] = 2112;
    *(void *)&v90[14] = v82;
    *(_WORD *)&v90[22] = 2048;
    v91 = v12;
    __int16 v92 = 1024;
    int v93 = v83;
    __int16 v94 = 2112;
    v95 = v60;
    __int16 v96 = 2112;
    v97 = v38;
    v12 = (void *)_os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  else
  {
    if (v60)
    {
      v61 = [v60 domain];
      v62 = (void *)*MEMORY[0x263F125F0];

      if (v61 == v62 && [v60 code] == 7)
      {
        v63 = avt_default_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v72 = (objc_class *)objc_opt_class();
          v73 = NSStringFromClass(v72);
          int v74 = [v38 status];
          v75 = [v38 logs];
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v73;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v12;
          *(_WORD *)&buf[32] = 1024;
          *(_DWORD *)&buf[34] = v74;
          *(_WORD *)&buf[38] = 2112;
          *(void *)&buf[40] = v60;
          LOWORD(v99) = 2112;
          *(void *)((char *)&v99 + 2) = v75;
          _os_log_error_impl(&dword_20B819000, v63, OS_LOG_TYPE_ERROR, "Error: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);
        }
LABEL_50:

        Image = 0;
        goto LABEL_51;
      }
    }
    v64 = avt_default_log();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      v68 = (objc_class *)objc_opt_class();
      v69 = NSStringFromClass(v68);
      int v70 = [v38 status];
      v71 = [v38 logs];
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v69;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v12;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v70;
      *(_WORD *)&buf[38] = 2112;
      *(void *)&buf[40] = v60;
      LOWORD(v99) = 2112;
      *(void *)((char *)&v99 + 2) = v71;
      _os_log_fault_impl(&dword_20B819000, v64, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);
    }
    if (!AVTLogAllowsInternalCrash()) {
      goto LABEL_50;
    }
  }
  long long v100 = 0u;
  long long v99 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  v84 = (objc_class *)objc_opt_class();
  v85 = NSStringFromClass(v84);
  int v86 = [v38 status];
  v87 = [v38 logs];
  *(_DWORD *)v90 = 136316418;
  *(void *)&v90[4] = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
  *(_WORD *)&v90[12] = 2112;
  *(void *)&v90[14] = v85;
  *(_WORD *)&v90[22] = 2048;
  v91 = v12;
  __int16 v92 = 1024;
  int v93 = v86;
  __int16 v94 = 2112;
  v95 = v60;
  __int16 v96 = 2112;
  v97 = v87;
  _os_log_send_and_compose_impl();

  uint64_t result = _os_crash_msg();
  __break(1u);
  return result;
}

- (uint64_t)newImageWithRenderer:(uint64_t)a3 antialiasingMode:(uint64_t)a4 pixelWidth:(uint64_t)a5 pixelHeight:(void *)a6 imagePointSize:(double)a7 contentScaleFactor:(double)a8 error:(float)a9
{
  id v15 = a2;
  if (a1
    && (uint64_t v16 = -[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:](a1, v15, a3, a4, a5, a6)) != 0)
  {
    __n128 v17 = (const void *)v16;
    uint64_t v18 = [MEMORY[0x263F1C6B0] imageWithCGImage:v16 scale:0 orientation:a9];
    CFRelease(v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)_isRenderPassDescriptorValid
{
  renderPassDescriptor = self->_renderPassDescriptor;
  if (!renderPassDescriptor) {
    return 0;
  }
  v4 = [(MTLRenderPassDescriptor *)renderPassDescriptor colorAttachments];
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = [v5 texture];

  v7 = [v6 device];
  device = self->_device;

  if (v7 == device
    && [v6 width] == self->_pixelWidth
    && [v6 height] == self->_pixelHeight)
  {
    unint64_t antialiasingMode = self->_antialiasingMode;
    unint64_t v10 = antialiasingMode - 1;
    uint64_t v11 = 1;
    if (antialiasingMode == 1) {
      uint64_t v11 = 2;
    }
    if (antialiasingMode == 2) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    v14 = [v13 objectAtIndexedSubscript:0];
    id v15 = [v14 resolveTexture];

    if (v10 > 1)
    {
      if (!v15)
      {
LABEL_13:
        BOOL v16 = 1;
LABEL_20:

        goto LABEL_15;
      }
    }
    else if (v15 && [v6 sampleCount] == v12)
    {
      goto LABEL_13;
    }
    BOOL v16 = 0;
    goto LABEL_20;
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (void)_rebuildRenderPassDescriptorIfNeeded
{
  if (![(AVTSnapshotHelper *)self _isRenderPassDescriptorValid])
  {
    id v44 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:71 width:self->_pixelWidth height:self->_pixelHeight mipmapped:0];
    [v44 setStorageMode:0];
    [v44 setUsage:4];
    BOOL supportsReadWriteTexture = self->_supportsReadWriteTexture;
    uint64_t v4 = [v44 usage];
    uint64_t v5 = 3;
    if (!supportsReadWriteTexture) {
      uint64_t v5 = 1;
    }
    [v44 setUsage:v4 | v5];
    v6 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v44];
    objc_storeStrong((id *)&self->_convertPremultipliedAlphaTexture, v6);
    v7 = (MTLTexture *)[v6 newTextureViewWithPixelFormat:70];
    convertPremultipliedAlphaTextureView = self->_convertPremultipliedAlphaTextureView;
    self->_convertPremultipliedAlphaTextureView = v7;

    if (self->_supportsReadWriteTexture)
    {
      convertPremultipliedAlphaExtraTexture = self->_convertPremultipliedAlphaExtraTexture;
      self->_convertPremultipliedAlphaExtraTexture = 0;
    }
    else
    {
      convertPremultipliedAlphaExtraTexture = (MTLTexture *)[v44 copy];
      [(MTLTexture *)convertPremultipliedAlphaExtraTexture setPixelFormat:70];
      [(MTLTexture *)convertPremultipliedAlphaExtraTexture usage];
      [(MTLTexture *)convertPremultipliedAlphaExtraTexture setUsage:0];
      [(MTLTexture *)convertPremultipliedAlphaExtraTexture setUsage:[(MTLTexture *)convertPremultipliedAlphaExtraTexture usage] | 2];
      unint64_t v10 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:convertPremultipliedAlphaExtraTexture];
      uint64_t v11 = self->_convertPremultipliedAlphaExtraTexture;
      self->_convertPremultipliedAlphaExtraTexture = v10;
    }
    int v12 = AVTMTLDeviceSupportsMemorylessStorage(self->_device);
    unint64_t antialiasingMode = self->_antialiasingMode;
    uint64_t v14 = 1;
    if (antialiasingMode == 1) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    if (antialiasingMode == 2) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v15;
    }
    uint64_t v17 = 2;
    if (v12) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 2;
    }
    if (antialiasingMode - 1 > 1)
    {
      double v20 = 0;
      double v21 = 0;
      uint64_t v19 = (uint64_t)v6;
    }
    else
    {
      [v44 setStorageMode:v18];
      uint64_t v17 = 4;
      [v44 setUsage:4];
      [v44 setTextureType:4];
      [v44 setSampleCount:v16];
      uint64_t v19 = [(MTLDevice *)self->_device newTextureWithDescriptor:v44];
      uint64_t v14 = 2;
      double v20 = v6;
      double v21 = (void *)v19;
    }
    v22 = [MEMORY[0x263F12A58] texture2DDescriptorWithPixelFormat:252 width:self->_pixelWidth height:self->_pixelHeight mipmapped:0];
    [v22 setStorageMode:v18];
    [v22 setUsage:4];
    [v22 setTextureType:v17];
    [v22 setSampleCount:v16];
    v23 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v22];
    v24 = [MEMORY[0x263F12998] renderPassDescriptor];
    renderPassDescriptor = self->_renderPassDescriptor;
    self->_renderPassDescriptor = v24;

    v26 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    v27 = [v26 objectAtIndexedSubscript:0];
    [v27 setTexture:v19];

    uint64_t v28 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setResolveTexture:v20];

    int v30 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setLoadAction:2];

    double red = self->_backgroundColorForMetal.red;
    double green = self->_backgroundColorForMetal.green;
    double blue = self->_backgroundColorForMetal.blue;
    double alpha = self->_backgroundColorForMetal.alpha;
    v36 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    id v37 = [v36 objectAtIndexedSubscript:0];
    objc_msgSend(v37, "setClearColor:", red, green, blue, alpha);

    v38 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    v39 = [v38 objectAtIndexedSubscript:0];
    [v39 setStoreAction:v14];

    unint64_t v40 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor depthAttachment];
    [v40 setTexture:v23];

    unint64_t v41 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor depthAttachment];
    [v41 setClearDepth:1.0];

    v42 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor depthAttachment];
    [v42 setLoadAction:2];

    v43 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor depthAttachment];
    [v43 setStoreAction:0];
  }
}

- (void)_rebuildBitmapContextIfNeeded
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    size_t Width = CGBitmapContextGetWidth(bitmapContext);
    pixelsize_t Width = self->_pixelWidth;
    size_t Height = CGBitmapContextGetHeight(self->_bitmapContext);
    if (Width == pixelWidth && Height == self->_pixelHeight)
    {
      if (self->_bitmapContext) {
        return;
      }
    }
    else
    {
      Data = CGBitmapContextGetData(self->_bitmapContext);
      free(Data);
      CFRelease(self->_bitmapContext);
      self->_bitmapContext = 0;
    }
  }
  size_t v8 = (4 * LODWORD(self->_pixelWidth));
  v9 = malloc_type_malloc(v8 * self->_pixelHeight, 0x2158E833uLL);
  unint64_t v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  self->_bitmapContext = CGBitmapContextCreate(v9, self->_pixelWidth, self->_pixelHeight, 8uLL, v8, v10, 0x4001u);
  CFRelease(v10);
}

- (void)dealloc
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    Data = CGBitmapContextGetData(bitmapContext);
    free(Data);
    CFRelease(self->_bitmapContext);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVTSnapshotHelper;
  [(AVTSnapshotHelper *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaPipelineState, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaExtraTexture, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaTextureView, 0);
  objc_storeStrong((id *)&self->_convertPremultipliedAlphaTexture, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)newCGImageWithRenderer:(uint64_t *)a1 antialiasingMode:(NSObject *)a2 pixelWidth:pixelHeight:error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_20B819000, a2, OS_LOG_TYPE_ERROR, "Error: %s Failed to create a command buffer from command queue %p", (uint8_t *)&v3, 0x16u);
}

- (void)newCGImageWithRenderer:(os_log_t)log antialiasingMode:pixelWidth:pixelHeight:error:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_device";
}

@end