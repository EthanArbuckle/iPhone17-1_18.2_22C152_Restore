@interface ACTPanoGPUDownscaler
- (ACTPanoGPUDownscaler)init;
- (ACTPanoGPUDownscaler)initWithContext:(id)a3;
- (int)downsample:(__CVBuffer *)a3 to:(__CVBuffer *)a4;
- (void)dealloc;
@end

@implementation ACTPanoGPUDownscaler

- (ACTPanoGPUDownscaler)initWithContext:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ACTPanoGPUDownscaler;
  v8 = [(ACTPanoGPUDownscaler *)&v22 init];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = objc_msgSend_device(v4, v5, v6, v7);
  device = v8->_device;
  v8->_device = (MTLDevice *)v9;

  v14 = v8->_device;
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = objc_msgSend_newCommandQueue(v14, v11, v12, v13);
  queue = v8->_queue;
  v8->_queue = (MTLCommandQueue *)v15;

  if (v8->_queue)
  {
    uint64_t v18 = objc_msgSend_computePipelineStateFor_constants_(v4, v17, @"downsampleYUV", 0);
    downsampleState = v8->_downsampleState;
    v8->_downsampleState = (MTLComputePipelineState *)v18;

    v20 = v8;
  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  return v20;
}

- (ACTPanoGPUDownscaler)init
{
  v27.receiver = self;
  v27.super_class = (Class)ACTPanoGPUDownscaler;
  v2 = [(ACTPanoGPUDownscaler *)&v27 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F2EE30]);
    id v4 = (void *)MEMORY[0x263F086E0];
    uint64_t v5 = objc_opt_class();
    v8 = objc_msgSend_bundleForClass_(v4, v6, v5, v7);
    inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v3, v9, (uint64_t)v8, 0);

    uint64_t v14 = objc_msgSend_device(inited, v11, v12, v13);
    device = v2->_device;
    v2->_device = (MTLDevice *)v14;

    v19 = v2->_device;
    if (v19
      && (uint64_t v20 = objc_msgSend_newCommandQueue(v19, v16, v17, v18),
          queue = v2->_queue,
          v2->_queue = (MTLCommandQueue *)v20,
          queue,
          v2->_queue))
    {
      uint64_t v23 = objc_msgSend_computePipelineStateFor_constants_(inited, v22, @"downsampleYUV", 0);
      downsampleState = v2->_downsampleState;
      v2->_downsampleState = (MTLComputePipelineState *)v23;

      v25 = v2;
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    inited = 0;
  }

  return v25;
}

- (void)dealloc
{
  downsampleState = self->_downsampleState;
  self->_downsampleState = 0;

  queue = self->_queue;
  self->_queue = 0;

  device = self->_device;
  self->_device = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACTPanoGPUDownscaler;
  [(ACTPanoGPUDownscaler *)&v6 dealloc];
}

- (int)downsample:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceRef v8 = CVPixelBufferGetIOSurface(a4);
  uint64_t v9 = (void *)MEMORY[0x263F12A50];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v13 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v9, v12, 10, Width, Height, 0);
  objc_msgSend_setUsage_(v13, v14, 1, v15);
  uint64_t v17 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v16, (uint64_t)v13, (uint64_t)IOSurface, 0);
  uint64_t v18 = (void *)MEMORY[0x263F12A50];
  size_t v19 = CVPixelBufferGetWidth(a3) >> 1;
  size_t v20 = CVPixelBufferGetHeight(a3);
  objc_super v22 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v18, v21, 30, v19, v20 >> 1, 0);

  objc_msgSend_setUsage_(v22, v23, 1, v24);
  v26 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v25, (uint64_t)v22, (uint64_t)IOSurface, 1);
  objc_super v27 = (void *)MEMORY[0x263F12A50];
  size_t v28 = CVPixelBufferGetWidth(a4);
  size_t v29 = CVPixelBufferGetHeight(a4);
  v31 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v27, v30, 10, v28, v29, 0);

  objc_msgSend_setUsage_(v31, v32, 2, v33);
  v35 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v34, (uint64_t)v31, (uint64_t)v8, 0);
  v36 = (void *)MEMORY[0x263F12A50];
  size_t v37 = CVPixelBufferGetWidth(a4) >> 1;
  size_t v38 = CVPixelBufferGetHeight(a4);
  v40 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v36, v39, 30, v37, v38 >> 1, 0);

  objc_msgSend_setUsage_(v40, v41, 2, v42);
  v44 = objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v43, (uint64_t)v40, (uint64_t)v8, 1);
  unint64_t v48 = objc_msgSend_threadExecutionWidth(self->_downsampleState, v45, v46, v47);
  unint64_t v52 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_downsampleState, v49, v50, v51) / v48;
  v56 = objc_msgSend_commandBuffer(self->_queue, v53, v54, v55);
  objc_msgSend_setLabel_(v56, v57, @"Panorama:GPUDownscaler", v58);
  v62 = objc_msgSend_computeCommandEncoder(v56, v59, v60, v61);
  objc_msgSend_setComputePipelineState_(v62, v63, (uint64_t)self->_downsampleState, v64);
  objc_msgSend_setTexture_atIndex_(v62, v65, (uint64_t)v17, 0);
  objc_msgSend_setTexture_atIndex_(v62, v66, (uint64_t)v26, 1);
  objc_msgSend_setTexture_atIndex_(v62, v67, (uint64_t)v35, 2);
  objc_msgSend_setTexture_atIndex_(v62, v68, (uint64_t)v44, 3);
  v87[0] = objc_msgSend_width(v44, v69, v70, v71);
  v87[1] = objc_msgSend_height(v44, v72, v73, v74);
  v87[2] = 1;
  v86[0] = v48;
  v86[1] = v52;
  v86[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v62, v75, (uint64_t)v87, (uint64_t)v86);
  objc_msgSend_endEncoding(v62, v76, v77, v78);
  objc_msgSend_commit(v56, v79, v80, v81);
  objc_msgSend_waitUntilCompleted(v56, v82, v83, v84);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end