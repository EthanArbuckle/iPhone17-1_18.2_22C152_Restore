@interface SCNCaptureDeviceOutputConsumerSource
- (BOOL)automaticallyAdjustsVideoMirroring;
- (BOOL)containsAlpha;
- (BOOL)isVideoMirrored;
- (SCNCaptureDeviceOutputConsumerSource)init;
- (SCNCaptureDeviceOutputConsumerSource)initWithOptions:(id)a3;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)_setPixelBuffer:(__CVBuffer *)a3;
- (void)_setSampleBuffer:(opaqueCMSampleBuffer *)ImageBuffer;
- (void)connectToProxy:(__C3DImageProxy *)a3;
- (void)dealloc;
- (void)setAutomaticallyAdjustsVideoMirroring:(BOOL)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3 fromDevice:(id)a4;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3 fromDevice:(id)a4;
- (void)setVideoMirrored:(BOOL)a3;
@end

@implementation SCNCaptureDeviceOutputConsumerSource

- (SCNCaptureDeviceOutputConsumerSource)init
{
  return [(SCNCaptureDeviceOutputConsumerSource *)self initWithOptions:0];
}

- (SCNCaptureDeviceOutputConsumerSource)initWithOptions:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNCaptureDeviceOutputConsumerSource;
  v4 = [(SCNCaptureDeviceOutputConsumerSource *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_videoMirrored = 0;
    v4->_automaticallyAdjustsVideoMirroring = 1;
    v4->_containsAlpha = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SCNCaptureDeviceOutputConsumerOptionContainsAlpha"), "BOOLValue");
  }
  return v5;
}

- (BOOL)containsAlpha
{
  return self->_containsAlpha;
}

- (void)dealloc
{
  SCNVideoTextureSourceRelease((uint64_t)&self->_data);
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNCaptureDeviceOutputConsumerSource;
  [(SCNTextureSource *)&v4 dealloc];
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  C3DImageProxySetSource((uint64_t)a3, self, 3);
  v4[0] = xmmword_26BF72378;
  v4[1] = *(_OWORD *)&off_26BF72388;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
  if (mtlTextureForRenderer)
  {
    *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
  }
  else if (self->_data.var0)
  {
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
    uint64_t v11 = RenderContext;
    textureCache = self->_textureCache;
    if (!textureCache)
    {
      v13 = (void *)-[SCNMTLRenderContext device](RenderContext);
      uint64_t v15 = *MEMORY[0x263F04070];
      v16[0] = &unk_26BFC14E0;
      CVMetalTextureCacheCreate(0, 0, v13, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1], &self->_textureCache);
      textureCache = self->_textureCache;
    }
    SCNVideoTextureSourceCreateMetalTexture((uint64_t)&self->_data, v11, textureCache);
    *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
    mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
  }
  else
  {
    mtlTextureForRenderer = 0;
  }
  objc_sync_exit(self);
  return mtlTextureForRenderer;
}

- (BOOL)automaticallyAdjustsVideoMirroring
{
  return self->_automaticallyAdjustsVideoMirroring;
}

- (void)setAutomaticallyAdjustsVideoMirroring:(BOOL)a3
{
  self->_automaticallyAdjustsVideoMirroring = a3;
}

- (BOOL)isVideoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3 fromDevice:(id)a4
{
  if (a4 && self->_automaticallyAdjustsVideoMirroring) {
    self->_videoMirrored = [a4 position] == 2;
  }

  [(SCNCaptureDeviceOutputConsumerSource *)self _setSampleBuffer:a3];
}

- (void)_setSampleBuffer:(opaqueCMSampleBuffer *)ImageBuffer
{
  objc_sync_enter(self);
  if (ImageBuffer) {
    ImageBuffer = CMSampleBufferGetImageBuffer(ImageBuffer);
  }
  if (self->_data.var0 != ImageBuffer)
  {
    SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
    var0 = self->_data.var0;
    if (var0 != ImageBuffer)
    {
      if (var0)
      {
        CFRelease(var0);
        self->_data.var0 = 0;
      }
      if (ImageBuffer) {
        v6 = (__CVBuffer *)CFRetain(ImageBuffer);
      }
      else {
        v6 = 0;
      }
      self->_data.var0 = v6;
    }
  }
  if (ImageBuffer)
  {
    self->_width = CVPixelBufferGetWidth(ImageBuffer);
    self->_height = CVPixelBufferGetHeight(ImageBuffer);
  }
  else
  {
    objc_super v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:]();
    }
  }
  objc_sync_exit(self);
}

- (void)setPixelBuffer:(__CVBuffer *)a3 fromDevice:(id)a4
{
  if (a4 && self->_automaticallyAdjustsVideoMirroring) {
    self->_videoMirrored = [a4 position] == 2;
  }

  [(SCNCaptureDeviceOutputConsumerSource *)self _setPixelBuffer:a3];
}

- (void)_setPixelBuffer:(__CVBuffer *)a3
{
  objc_sync_enter(self);
  if (self->_data.var0 != a3)
  {
    SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
    var0 = self->_data.var0;
    if (var0 != a3)
    {
      if (var0)
      {
        CFRelease(var0);
        self->_data.var0 = 0;
      }
      if (a3) {
        v6 = (__CVBuffer *)CFRetain(a3);
      }
      else {
        v6 = 0;
      }
      self->_data.var0 = v6;
    }
  }
  if (a3)
  {
    self->_width = CVPixelBufferGetWidth(a3);
    self->_height = CVPixelBufferGetHeight(a3);
    if (!CVPixelBufferGetIOSurface(a3))
    {
      objc_super v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SCNCaptureDeviceOutputConsumerSource _setPixelBuffer:]();
      }
    }
  }
  objc_sync_exit(self);
}

- (void)_setPixelBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Pixel buffer (CVPixelBufferRef) must be IOSurface-backed", v2, v3, v4, v5, v6);
}

@end