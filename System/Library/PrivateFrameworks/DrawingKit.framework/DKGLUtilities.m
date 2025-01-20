@interface DKGLUtilities
+ (BOOL)gpuAvailable;
+ (BOOL)setCurrentGLContext:(id)a3;
+ (id)createPlatformGLContext;
+ (id)createSharedGLContext;
+ (id)pathForResource:(id)a3 ofType:(id)a4;
+ (id)snapshotImageOfFrameBufferWithID:(unsigned int)a3 bufferSize:(CGSize)a4 displayScale:(double)a5;
+ (unsigned)compileShader:(id)a3 ofType:(id)a4;
+ (void)_postGLActiveNotification;
+ (void)_postGLInactiveNotification;
+ (void)createFBO:(unsigned int *)a3 depthRB:(unsigned int *)a4 texture:(unsigned int *)a5 width:(int)a6 height:(int)a7 format:(unsigned int)a8;
+ (void)createRepeatableTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5;
+ (void)createSharedRepeatableTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5;
+ (void)createTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5;
+ (void)createVBO:(unsigned int *)a3 size:(int64_t)a4 data:(void *)a5 usage:(unsigned int)a6;
+ (void)deleteFBO:(unsigned int *)a3 depthRB:(unsigned int *)a4 texture:(unsigned int *)a5;
+ (void)deleteTexture:(unsigned int *)a3;
+ (void)deleteVBO:(unsigned int *)a3;
+ (void)drawQuadAtX:(float)a3 Y:(float)a4 width:(float)a5 height:(float)a6;
+ (void)initialize;
+ (void)setCurrentClearColor;
+ (void)setProjectionMatrixForWidth:(float)a3 height:(float)a4 flipped:(BOOL)a5 matrix:(id *)a6;
+ (void)teardownSharedGLContext;
+ (void)translateMatrix:(id *)a3 byX:(float)a4 Y:(float)a5 result:(id *)a6;
@end

@implementation DKGLUtilities

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__DKGLUtilities_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, block);
  }
}

void __27__DKGLUtilities_initialize__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__postGLActiveNotification name:*MEMORY[0x263F1D038] object:0];

  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__postGLInactiveNotification name:*MEMORY[0x263F1D050] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__postGLInactiveNotification name:*MEMORY[0x263F07FD8] object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:sel__postGLActiveNotification name:*MEMORY[0x263F07FC0] object:0];

  v6 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v7 = [v6 applicationState];

  if (v7 == 2) {
    atomic_store(0, DKSafeToUseOpenGL);
  }
}

+ (id)pathForResource:(id)a3 ofType:(id)a4
{
  v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 pathForResource:v7 ofType:v6];

  return v9;
}

+ (unsigned)compileShader:(id)a3 ofType:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[DKGLUtilities pathForResource:v5 ofType:v6];
  uint64_t v8 = [NSString stringWithContentsOfFile:v7 encoding:4 error:0];
  if (!v8)
  {
    NSLog(&cfstr_ErrorLoadingSh.isa, v5, v6);
    goto LABEL_9;
  }
  v9 = (void *)v8;
  if ([v6 isEqualToString:@"vert"]) {
    GLenum v10 = 35633;
  }
  else {
    GLenum v10 = 35632;
  }
  GLuint Shader = glCreateShader(v10);
  id v12 = v9;
  string = (GLchar *)[v12 UTF8String];
  GLint length = [v12 length];
  glShaderSource(Shader, 1, (const GLchar *const *)&string, &length);
  glCompileShader(Shader);
  GLint params = 0;
  glGetShaderiv(Shader, 0x8B81u, &params);
  if (!params)
  {
    glGetShaderInfoLog(Shader, 256, 0, infolog);
    uint64_t v14 = [NSString stringWithUTF8String:infolog];
    NSLog(&cfstr_ErrorOccurred.isa, v14);
LABEL_9:
    exit(1);
  }

  return Shader;
}

+ (void)createFBO:(unsigned int *)a3 depthRB:(unsigned int *)a4 texture:(unsigned int *)a5 width:(int)a6 height:(int)a7 format:(unsigned int)a8
{
  if (a3 && a5)
  {
    glGenTextures(1, a5);
    glBindTexture(0xDE1u, *a5);
    glTexImage2D(0xDE1u, 0, 6408, a6, a7, 0, 0x1908u, 0x1401u, 0);
    glTexParameteri(0xDE1u, 0x2801u, 9728);
    glTexParameteri(0xDE1u, 0x2800u, 9728);
    glTexParameteri(0xDE1u, 0x2802u, 33071);
    glTexParameteri(0xDE1u, 0x2803u, 33071);
    glGenFramebuffers(1, a3);
    glBindFramebuffer(0x8D40u, *a3);
    glFramebufferTexture2D(0x8D40u, 0x8CE0u, 0xDE1u, *a5, 0);
  }
  if (a4)
  {
    glGenRenderbuffers(1, a4);
    glBindRenderbuffer(0x8D41u, *a4);
    glRenderbufferStorage(0x8D41u, 0x81A6u, a6, a7);
    glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, *a4);
  }
  glDisable(0xB71u);
  glDepthMask(0);
  glEnable(0xBE2u);
  glBlendFunc(0x302u, 0x303u);
  glClearColor(0.0, 0.0, 0.0, 0.0);
  glClear(0x4000u);
  glViewport(0, 0, a6, a7);
}

+ (void)deleteFBO:(unsigned int *)a3 depthRB:(unsigned int *)a4 texture:(unsigned int *)a5
{
  if (a3)
  {
    glDeleteFramebuffers(1, a3);
    *a3 = 0;
  }
  if (a4)
  {
    glDeleteRenderbuffers(1, a4);
    *a4 = 0;
  }
  if (a5)
  {
    glDeleteTextures(1, a5);
    *a5 = 0;
  }
}

+ (void)createVBO:(unsigned int *)a3 size:(int64_t)a4 data:(void *)a5 usage:(unsigned int)a6
{
  glGenBuffers(1, a3);
  glBindBuffer(0x8892u, *a3);
  glBufferData(0x8892u, a4, a5, a6);
}

+ (void)deleteVBO:(unsigned int *)a3
{
  if (a3)
  {
    glDeleteVertexArraysOES();
    *a3 = 0;
  }
}

+ (void)createTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5
{
  pixels[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  GLenum Error = glGetError();
  if (Error) {
    printf("glError: %04x caught at %s:%u\n", Error, "/Library/Caches/com.apple.xbs/Sources/DrawingKit/DrawingKit/Source/Shared/GLUtilities/DKGLUtilities.m", 175);
  }
  GLenum v10 = +[DKGLUtilities pathForResource:v7 ofType:v8];
  id v16 = 0;
  v11 = [MEMORY[0x263F08DF0] textureWithContentsOfFile:v10 options:0 error:&v16];
  id v12 = v16;
  v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    if (a3) {
      *a3 = [v11 name];
    }
  }
  else
  {
    v15 = [v12 localizedDescription];
    NSLog(&cfstr_SFailedToLoadT.isa, "+[DKGLUtilities createTexture:withImageName:ofType:]", v15);

    if (a3)
    {
      pixels[0] = -1;
      pixels[1] = -1;
      glGenTextures(1, a3);
      glBindTexture(0xDE1u, *a3);
      glTexImage2D(0xDE1u, 0, 6408, 2, 2, 0, 0x1908u, 0x1401u, pixels);
    }
  }
}

+ (void)createRepeatableTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(id)objc_opt_class() createTexture:a3 withImageName:v8 ofType:v7];

  if (a3)
  {
    glBindTexture(0xDE1u, *a3);
    glTexParameteri(0xDE1u, 0x2800u, 9729);
    glTexParameteri(0xDE1u, 0x2801u, 9729);
    glTexParameteri(0xDE1u, 0x2802u, 10497);
    glTexParameteri(0xDE1u, 0x2803u, 10497);
  }
}

+ (void)deleteTexture:(unsigned int *)a3
{
  if (a3)
  {
    glDeleteTextures(1, a3);
    *a3 = 0;
  }
}

+ (void)drawQuadAtX:(float)a3 Y:(float)a4 width:(float)a5 height:(float)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  buffers[1] = 0;
  *(float *)data = a3;
  *(float *)&data[1] = a4;
  float v9 = a3 + a5;
  float v10 = a4;
  float v12 = a3;
  float v13 = a4 + a6;
  float v15 = a3 + a5;
  float v16 = a4 + a6;
  long long v8 = xmmword_22AF747A0;
  long long v11 = xmmword_22AF747B0;
  long long v14 = xmmword_22AF747C0;
  long long v17 = xmmword_22AF747D0;
  glGenBuffers(1, &buffers[1]);
  glBindBuffer(0x8892u, buffers[1]);
  glBufferData(0x8892u, 96, data, 0x88E4u);
  glGenVertexArraysOES();
  glBindVertexArrayOES();
  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1u);
  glVertexAttribPointer(0, 4, 0x1406u, 0, 24, 0);
  glVertexAttribPointer(1u, 2, 0x1406u, 0, 24, (const GLvoid *)0x10);
  glDrawArrays(5u, 0, 4);
  glBindBuffer(0x8892u, 0);
  glDeleteBuffers(1, &buffers[1]);
  glDeleteVertexArraysOES();
}

+ (void)setProjectionMatrixForWidth:(float)a3 height:(float)a4 flipped:(BOOL)a5 matrix:(id *)a6
{
  uint64_t v6 = 0;
  v7.i32[0] = -1.0;
  if (a5) {
    float v8 = 1.0;
  }
  else {
    float v8 = -1.0;
  }
  v7.f32[1] = v8;
  v7.i32[2] = 0;
  v7.i32[3] = 1.0;
  v12[2] = xmmword_22AF747E0;
  v12[3] = xmmword_22AF74780;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  do
  {
    *(long long *)((char *)&v13 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_22AF747F0, COERCE_FLOAT(v12[v6])), (float32x4_t)xmmword_22AF747A0, *(float32x2_t *)&v12[v6], 1), (float32x4_t)xmmword_22AF747E0, (float32x4_t)v12[v6], 2), v7, (float32x4_t)v12[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  long long v9 = v14;
  long long v10 = v15;
  long long v11 = v16;
  *(_OWORD *)a6 = v13;
  *((_OWORD *)a6 + 1) = v9;
  *((_OWORD *)a6 + 2) = v10;
  *((_OWORD *)a6 + 3) = v11;
}

+ (void)translateMatrix:(id *)a3 byX:(float)a4 Y:(float)a5 result:(id *)a6
{
  uint64_t v6 = 0;
  int v8 = 0;
  float v9 = 1.0;
  float32x4_t v10 = *(float32x4_t *)a3;
  float32x4_t v11 = *((float32x4_t *)a3 + 1);
  float32x4_t v12 = *((float32x4_t *)a3 + 2);
  float32x4_t v13 = *((float32x4_t *)a3 + 3);
  v17[2] = xmmword_22AF747E0;
  v17[3] = *(_OWORD *)&a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  do
  {
    *(long long *)((char *)&v18 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v10, COERCE_FLOAT(v17[v6])), v11, *(float32x2_t *)&v17[v6], 1), v12, (float32x4_t)v17[v6], 2), v13, (float32x4_t)v17[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  long long v14 = v19;
  long long v15 = v20;
  long long v16 = v21;
  *(_OWORD *)a6 = v18;
  *((_OWORD *)a6 + 1) = v14;
  *((_OWORD *)a6 + 2) = v15;
  *((_OWORD *)a6 + 3) = v16;
}

+ (id)snapshotImageOfFrameBufferWithID:(unsigned int)a3 bufferSize:(CGSize)a4 displayScale:(double)a5
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    GLint params = 0;
    glGetIntegerv(0x8CA6u, &params);
    glPushGroupMarkerEXT(0, "Take Snapshot");
    glBindFramebuffer(0x8D40u, a3);
    unint64_t v9 = (unint64_t)(width * a5);
    unint64_t v10 = (unint64_t)(height * a5);
    GLint param = 0;
    float32x4_t v11 = malloc_type_malloc(4 * v9 * v10, 0xCB0DC8F5uLL);
    if (v11)
    {
      float32x4_t v12 = v11;
      glGetIntegerv(0xD05u, &param);
      glPixelStorei(0xD05u, 1);
      glReadPixels(0, 0, (unint64_t)(width * a5), (unint64_t)(height * a5), 0x1908u, 0x1401u, v12);
      glPixelStorei(0xD05u, param);
      CFDataRef v13 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v12, 4 * v9 * v10);
      if (v13)
      {
        CFDataRef v14 = v13;
        CGDataProviderRef v15 = CGDataProviderCreateWithCFData(v13);
        if (v15)
        {
          long long v16 = v15;
          DeviceRGB = CGColorSpaceCreateDeviceRGB();
          long long v18 = CGImageCreate((unint64_t)(width * a5), (unint64_t)(height * a5), 8uLL, 0x20uLL, 4 * v9, DeviceRGB, 3u, v16, 0, 0, kCGRenderingIntentDefault);
          if (v18) {
            long long v19 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v18 scale:0 orientation:a5];
          }
          else {
            long long v19 = 0;
          }
          CGColorSpaceRelease(DeviceRGB);
          CGDataProviderRelease(v16);
          CGImageRelease(v18);
        }
        else
        {
          long long v19 = 0;
        }
        CFRelease(v14);
      }
      else
      {
        long long v19 = 0;
      }
      free(v12);
    }
    else
    {
      long long v19 = 0;
    }
    glPopGroupMarkerEXT();
    glBindFramebuffer(0x8D40u, params);
  }
  else
  {
    long long v19 = 0;
  }
  return v19;
}

+ (id)createPlatformGLContext
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2];
  return v2;
}

+ (id)createSharedGLContext
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (sSharegroupContext)
  {
    id v3 = objc_alloc(MEMORY[0x263F146E8]);
    v4 = [(id)sSharegroupContext sharegroup];
    id v5 = (void *)[v3 initWithAPI:2 sharegroup:v4];
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2];
    objc_storeStrong((id *)&sSharegroupContext, v5);
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = (void *)sTextureCache;
    sTextureCache = v6;
  }

  objc_sync_exit(v2);
  return v5;
}

+ (void)teardownSharedGLContext
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)sSharegroupContext;
  sSharegroupContext = 0;

  id v3 = (void *)sTextureCache;
  sTextureCache = 0;

  objc_sync_exit(obj);
}

+ (void)createSharedRepeatableTexture:(unsigned int *)a3 withImageName:(id)a4 ofType:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  id v9 = a1;
  objc_sync_enter(v9);
  if (!sTextureCache) {
    goto LABEL_3;
  }
  unint64_t v10 = [MEMORY[0x263F146E8] currentContext];
  float32x4_t v11 = [v10 sharegroup];
  float32x4_t v12 = [(id)sSharegroupContext sharegroup];

  if (v11 == v12)
  {
    CFDataRef v13 = [(id)sTextureCache objectForKeyedSubscript:v16];
    CFDataRef v14 = v13;
    if (v13)
    {
      *a3 = [v13 unsignedIntegerValue];
    }
    else
    {
      [v9 createRepeatableTexture:a3 withImageName:v16 ofType:v8];
      CGDataProviderRef v15 = [NSNumber numberWithUnsignedInt:*a3];
      [(id)sTextureCache setObject:v15 forKeyedSubscript:v16];
    }
  }
  else
  {
LABEL_3:
    *a3 = 0;
  }
  objc_sync_exit(v9);
}

+ (BOOL)setCurrentGLContext:(id)a3
{
  return [MEMORY[0x263F146E8] setCurrentContext:a3];
}

+ (void)_postGLActiveNotification
{
}

+ (void)_postGLInactiveNotification
{
  if ([a1 gpuAvailable]) {
    [a1 teardownSharedGLContext];
  }
  atomic_store(0, DKSafeToUseOpenGL);
}

+ (BOOL)gpuAvailable
{
  unsigned __int8 v2 = atomic_load(DKSafeToUseOpenGL);
  return v2 & 1;
}

+ (void)setCurrentClearColor
{
  if (DKIsDarkMode())
  {
    GLfloat v2 = 0.0;
    GLfloat v3 = 0.0;
    GLfloat v4 = 0.0;
  }
  else
  {
    GLfloat v2 = 1.0;
    GLfloat v3 = 1.0;
    GLfloat v4 = 1.0;
  }
  glClearColor(v2, v3, v4, 1.0);
}

@end