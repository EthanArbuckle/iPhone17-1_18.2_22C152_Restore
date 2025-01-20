@interface SCNCaptureDeviceSource
- (AVCaptureDevice)captureDevice;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)connectToProxy:(__C3DImageProxy *)a3;
- (void)dealloc;
- (void)setCaptureDevice:(id)a3;
@end

@implementation SCNCaptureDeviceSource

- (void)dealloc
{
  [(AVCaptureSession *)self->_captureSession stopRunning];

  SCNVideoTextureSourceRelease((uint64_t)&self->_data);
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNCaptureDeviceSource;
  [(SCNTextureSource *)&v4 dealloc];
}

- (void)setCaptureDevice:(id)a3
{
  if (self->_captureDevice != a3)
  {
    [(AVCaptureSession *)self->_captureSession stopRunning];

    self->_captureSession = 0;
    self->_captureDevice = (AVCaptureDevice *)a3;
  }
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  C3DImageProxySetSource((uint64_t)a3, self, 2);
  v4[0] = xmmword_26BF72358;
  v4[1] = *(_OWORD *)&off_26BF72368;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  v24[2] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (!self->_captureSession)
  {
    uint64_t v20 = 0;
    v13 = (void *)[objc_alloc(MEMORY[0x263EFA5B8]) initWithDevice:self->_captureDevice error:&v20];
    if (v20)
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SCNCaptureDeviceSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:](&v20, v14);
      }

      goto LABEL_10;
    }
    v18 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x263EFA638]);
    self->_captureSession = v18;
    [(AVCaptureSession *)v18 addInput:v13];

    [(AVCaptureSession *)self->_captureSession commitConfiguration];
    [(AVCaptureSession *)self->_captureSession startRunning];
  }
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  if (!self->_data.videoOutput)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFA6A0]);
    uint64_t v11 = *MEMORY[0x263F04180];
    v23[0] = *MEMORY[0x263F04158];
    v23[1] = v11;
    v24[0] = MEMORY[0x263EFFA88];
    v24[1] = &unk_26BFC17E0;
    objc_msgSend(v10, "setVideoSettings:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    [v10 setSampleBufferDelegate:self queue:-[SCNMTLRenderContext resourceQueue](RenderContext)];
    [(AVCaptureSession *)self->_captureSession addOutput:v10];
    self->_data.videoOutput = (pixelBuffer *)v10;
  }
  mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
  if (mtlTextureForRenderer)
  {
    *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
    goto LABEL_15;
  }
  if (!self->_data.var0)
  {
    v19 = scn_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:]();
    }
LABEL_10:
    mtlTextureForRenderer = 0;
    goto LABEL_15;
  }
  textureCache = self->_textureCache;
  if (!textureCache)
  {
    v16 = (void *)-[SCNMTLRenderContext device](RenderContext);
    uint64_t v21 = *MEMORY[0x263F04070];
    v22 = &unk_26BFC14E0;
    CVMetalTextureCacheCreate(0, 0, v16, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1], &self->_textureCache);
    textureCache = self->_textureCache;
  }
  SCNVideoTextureSourceCreateMetalTexture((uint64_t)&self->_data, RenderContext, textureCache);
  *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
  mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
LABEL_15:
  objc_sync_exit(self);
  return mtlTextureForRenderer;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  objc_sync_enter(self);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
    self->_data.var0 = CVPixelBufferRetain(ImageBuffer);
    self->_videoMirrored = [a5 isVideoMirrored];
    self->_width = CVPixelBufferGetWidth(ImageBuffer);
    self->_height = CVPixelBufferGetHeight(ImageBuffer);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:]();
    }
  }
  objc_sync_exit(self);
}

- (void)metalTextureWithEngineContext:(uint64_t *)a1 textureSampler:(NSObject *)a2 nextFrameTime:status:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Could not create AVCaptureInput with error: %@", (uint8_t *)&v3, 0xCu);
}

@end