@interface SCNAVPlayerSource
- (AVPlayer)player;
- (SCNAVPlayerSource)init;
- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6;
- (void)connectToProxy:(__C3DImageProxy *)a3;
- (void)dealloc;
- (void)registerPlayerIfNeeded:(id)a3;
- (void)setPlayer:(id)a3;
- (void)unregisterPlayer:(id)a3;
@end

@implementation SCNAVPlayerSource

- (SCNAVPlayerSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAVPlayerSource;
  return [(SCNAVPlayerSource *)&v3 init];
}

- (void)registerPlayerIfNeeded:(id)a3
{
  v13[5] = *MEMORY[0x263EF8340];
  if (!self->_data.videoOutput)
  {
    uint64_t v5 = *MEMORY[0x263F03F08];
    uint64_t v6 = *MEMORY[0x263F04050];
    uint64_t v7 = *MEMORY[0x263F03FD8];
    uint64_t v8 = *MEMORY[0x263F04020];
    v12[0] = *MEMORY[0x263F03ED8];
    v12[1] = v8;
    v13[0] = v5;
    v13[1] = v6;
    uint64_t v9 = *MEMORY[0x263F04158];
    v12[2] = *MEMORY[0x263F03FC0];
    v12[3] = v9;
    v13[2] = v7;
    v13[3] = MEMORY[0x263EFFA88];
    v12[4] = *MEMORY[0x263F04180];
    v13[4] = &unk_26BFC17E0;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:5];
    v11 = (pixelBuffer *)[objc_alloc(MEMORY[0x263EFA830]) initWithPixelBufferAttributes:v10];
    self->_data.videoOutput = v11;
    objc_msgSend((id)objc_msgSend(a3, "currentItem"), "addOutput:", v11);
  }
}

- (void)unregisterPlayer:(id)a3
{
  v4 = (void *)[a3 currentItem];
  videoOutput = self->_data.videoOutput;

  [v4 removeOutput:videoOutput];
}

- (void)dealloc
{
  [(SCNAVPlayerSource *)self unregisterPlayer:self->_player];

  SCNVideoTextureSourceRelease((uint64_t)&self->_data);
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNAVPlayerSource;
  [(SCNTextureSource *)&v4 dealloc];
}

- (void)setPlayer:(id)a3
{
  if (self->_player != a3)
  {
    -[SCNAVPlayerSource unregisterPlayer:](self, "unregisterPlayer:");

    self->_player = (AVPlayer *)a3;
  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  C3DImageProxySetSource((uint64_t)a3, self, 1);
  v4[0] = xmmword_26BF72338;
  v4[1] = *(_OWORD *)&off_26BF72348;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  [(SCNAVPlayerSource *)self registerPlayerIfNeeded:self->_player];
  p_data = &self->_data;
  videoOutput = self->_data.videoOutput;
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  double SystemTime = C3DEngineContextGetSystemTime((uint64_t)a3);
  if (videoOutput)
  {
    [(pixelBuffer *)videoOutput itemTimeForHostTime:SystemTime];
  }
  else
  {
    long long v22 = 0uLL;
    uint64_t v23 = 0;
  }
  long long v20 = v22;
  uint64_t v21 = v23;
  if ([(pixelBuffer *)videoOutput hasNewPixelBufferForItemTime:&v20])
  {
    long long v20 = v22;
    uint64_t v21 = v23;
    uint64_t v13 = [(pixelBuffer *)videoOutput copyPixelBufferForItemTime:&v20 itemTimeForDisplay:0];
    if (v13)
    {
      v14 = (__CVBuffer *)v13;
      SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
      self->_data.var0 = v14;
      self->_width = CVPixelBufferGetWidth(v14);
      self->_height = CVPixelBufferGetHeight(v14);
    }
  }
  if (self->_data.var0)
  {
    id result = self->_data.mtlTextureForRenderer;
    if (result)
    {
      *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
    }
    else
    {
      p_textureCache = &self->_textureCache;
      v18 = *p_textureCache;
      if (!*p_textureCache)
      {
        v19 = (void *)-[SCNMTLRenderContext device](RenderContext);
        uint64_t v24 = *MEMORY[0x263F04070];
        v25[0] = &unk_26BFC14E0;
        CVMetalTextureCacheCreate(0, 0, v19, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1], p_textureCache);
        v18 = *p_textureCache;
      }
      SCNVideoTextureSourceCreateMetalTexture((uint64_t)p_data, RenderContext, v18);
      *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
      return p_data->mtlTextureForRenderer;
    }
  }
  else
  {
    v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:]();
    }
    return 0;
  }
  return result;
}

- (void)metalTextureWithEngineContext:textureSampler:nextFrameTime:status:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not get pixel buffer (CVPixelBufferRef)", v2, v3, v4, v5, v6);
}

@end