@interface CVAFilterAlphaBlend
- (CVAFilterAlphaBlend)initWithMetalContext:(void *)a3;
- (pair<id<MTLTexture>,)getTexturePlanesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4;
- (void)alphaBlendPixelBuffer:(RetainPtr<__CVBuffer *>)a3 inPixelBufferSecond:(RetainPtr<__CVBuffer *>)a4 outPixelBuffer:(RetainPtr<__CVBuffer *>)a5 alpha:(float)a6 callbackQueue:(id)a7 callback:(id)a8;
- (void)encodeAlphaBlendToCommandBuffer:(id)a3 inTexFirst:(id)a4 inTexSecond:(id)a5 outTex:(id)a6 alpha:(float)a7;
@end

@implementation CVAFilterAlphaBlend

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousRenderingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_alphaBlend_Kernel, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)alphaBlendPixelBuffer:(RetainPtr<__CVBuffer *>)a3 inPixelBufferSecond:(RetainPtr<__CVBuffer *>)a4 outPixelBuffer:(RetainPtr<__CVBuffer *>)a5 alpha:(float)a6 callbackQueue:(id)a7 callback:(id)a8
{
  id v30 = a7;
  id v29 = a8;
  [(CVAFilterAlphaBlend *)self getTexturePlanesFromPixelBuffer:*(void *)a3.m_ptr usage:1];
  v31 = v45;
  v32 = v44;
  v44 = 0;
  v45 = 0;

  [(CVAFilterAlphaBlend *)self getTexturePlanesFromPixelBuffer:*(void *)a4.m_ptr usage:1];
  v14 = v44;
  v15 = v45;
  v44 = 0;
  v45 = 0;

  [(CVAFilterAlphaBlend *)self getTexturePlanesFromPixelBuffer:*(void *)a5.m_ptr usage:2];
  v16 = v44;
  v17 = v45;
  v44 = 0;
  v45 = 0;

  v18 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  v19 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v18];

  [v19 setLabel:@"alpha blend"];
  *(float *)&double v20 = a6;
  [(CVAFilterAlphaBlend *)self encodeAlphaBlendToCommandBuffer:v19 inTexFirst:v32 inTexSecond:v14 outTex:v16 alpha:v20];
  *(float *)&double v21 = a6;
  [(CVAFilterAlphaBlend *)self encodeAlphaBlendToCommandBuffer:v19 inTexFirst:v31 inTexSecond:v15 outTex:v17 alpha:v21];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3812000000;
  v47 = sub_1BA83660C;
  v48 = sub_1BA83661C;
  v49 = &unk_1BA876737;
  CFTypeRef v50 = *(CFTypeRef *)a3.m_ptr;
  if (v50) {
    CFRetain(v50);
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3812000000;
  v42[3] = sub_1BA83660C;
  v42[4] = sub_1BA83661C;
  v42[5] = &unk_1BA876737;
  v22 = *(const void **)a4.m_ptr;
  CFTypeRef v43 = v22;
  if (v22) {
    CFRetain(v22);
  }
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3812000000;
  v40[3] = sub_1BA83660C;
  v40[4] = sub_1BA83661C;
  v40[5] = &unk_1BA876737;
  v23 = *(const void **)a5.m_ptr;
  CFTypeRef cf = v23;
  if (v23) {
    CFRetain(v23);
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1BA836634;
  v33[3] = &unk_1E6228550;
  v37 = &v44;
  v38 = v42;
  id v24 = v30;
  id v34 = v24;
  v35 = self;
  id v25 = v29;
  id v36 = v25;
  v39 = v40;
  [v19 addCompletedHandler:v33];
  [v19 commit];

  _Block_object_dispose(v40, 8);
  CFTypeRef v26 = cf;
  CFTypeRef cf = 0;
  if (v26) {
    CFRelease(v26);
  }
  _Block_object_dispose(v42, 8);
  CFTypeRef v27 = v43;
  CFTypeRef v43 = 0;
  if (v27) {
    CFRelease(v27);
  }
  _Block_object_dispose(&v44, 8);
  CFTypeRef v28 = v50;
  CFTypeRef v50 = 0;
  if (v28) {
    CFRelease(v28);
  }
}

- (pair<id<MTLTexture>,)getTexturePlanesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  v8 = v4;
  size_t Width = CVPixelBufferGetWidth(a3);
  v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:Width height:CVPixelBufferGetHeight(a3) mipmapped:0];
  id v21 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v10];

  [v21 setUsage:a4];
  v11 = (void *)MEMORY[0x1E4F35330];
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  v13 = objc_msgSend(v11, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a3, 1uLL), 0);
  v14 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v13];

  [v14 setUsage:a4];
  v15 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v21 iosurface:CVPixelBufferGetIOSurface(a3) plane:0];
  uint64_t v16 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v15];

  v17 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v14 iosurface:CVPixelBufferGetIOSurface(a3) plane:1];
  uint64_t v18 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v17];

  uint64_t *v8 = v16;
  v8[1] = v18;

  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (void)encodeAlphaBlendToCommandBuffer:(id)a3 inTexFirst:(id)a4 inTexSecond:(id)a5 outTex:(id)a6 alpha:(float)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  float v21 = a7;
  v15 = [a3 computeCommandEncoder];
  uint64_t v16 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v15];

  unint64_t v17 = [(MTLComputePipelineState *)self->_alphaBlend_Kernel threadExecutionWidth];
  unint64_t v18 = [(MTLComputePipelineState *)self->_alphaBlend_Kernel maxTotalThreadsPerThreadgroup];
  [v16 setLabel:@"_alphaBlend_Kernel"];
  [v16 setComputePipelineState:self->_alphaBlend_Kernel];
  [v16 setTexture:v12 atIndex:0];
  [v16 setTexture:v13 atIndex:1];
  [v16 setTexture:v14 atIndex:2];
  [v16 setBytes:&v21 length:4 atIndex:0];
  v20[0] = [v14 width];
  v20[1] = [v14 height];
  v20[2] = 1;
  v19[0] = v17;
  v19[1] = v18 / v17;
  v19[2] = 1;
  [v16 dispatchThreads:v20 threadsPerThreadgroup:v19];
  [v16 endEncoding];
}

- (CVAFilterAlphaBlend)initWithMetalContext:(void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CVAFilterAlphaBlend;
  v4 = [(ImageSaverAndFileConfigRegistrator *)&v12 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_device, *(id *)a3);
    objc_storeStrong((id *)&v5->_commandQueue, *((id *)a3 + 1));
    objc_storeStrong((id *)&v5->_library, *((id *)a3 + 2));
    objc_storeStrong((id *)&v5->_pipelineLibrary, *((id *)a3 + 3));
    sub_1BA8328CC((void **)&v5->_alphaBlend_Kernel, v5->_library, v5->_pipelineLibrary, v5->_device, @"alphaBlendRG", 0, 0);
    +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v5->_alphaBlend_Kernel];

    dispatch_semaphore_t v6 = dispatch_semaphore_create(5);
    renderingCallbackSemaphore = v5->_renderingCallbackSemaphore;
    v5->_renderingCallbackSemaphore = (OS_dispatch_semaphore *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("_synchronousAlphaBlendCallbackQueue", 0);
    synchronousRenderingCallbackQueue = v5->_synchronousRenderingCallbackQueue;
    v5->_synchronousRenderingCallbackQueue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

@end