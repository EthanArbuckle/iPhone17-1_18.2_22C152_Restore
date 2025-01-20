@interface JFXVideoDecoderInterface
- (JFXVideoDecoderInterface)init;
- (JFXVideoDecoderInterface)initWithFormatDescription:(opaqueCMFormatDescription *)a3;
- (OS_dispatch_semaphore)frameSemaphore;
- (__CVBuffer)decodeFrame:(opaqueCMSampleBuffer *)a3;
- (__CVBuffer)imageBuffer;
- (void)dealloc;
- (void)init;
- (void)setFrameSemaphore:(id)a3;
- (void)setImageBuffer:(__CVBuffer *)a3;
@end

@implementation JFXVideoDecoderInterface

- (JFXVideoDecoderInterface)init
{
  v5.receiver = self;
  v5.super_class = (Class)JFXVideoDecoderInterface;
  v2 = [(JFXVideoDecoderInterface *)&v5 init];
  if (v2)
  {
    v3 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[JFXVideoDecoderInterface init](v3);
    }
  }
  return v2;
}

- (JFXVideoDecoderInterface)initWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)JFXVideoDecoderInterface;
  v4 = [(JFXVideoDecoderInterface *)&v10 init];
  objc_super v5 = v4;
  if (v4)
  {
    outputCallback.decompressionOutputCallback = (VTDecompressionOutputCallback)VTDecompressionOutputCallbackImpl;
    outputCallback.decompressionOutputRefCon = v4;
    v11[0] = @"EnableHardwareAcceleratedVideoDecoder";
    v11[1] = @"RequireHardwareAcceleratedVideoDecoder";
    v12[0] = MEMORY[0x263EFFA88];
    v12[1] = MEMORY[0x263EFFA80];
    CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    if (!VTDecompressionSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, v6, 0, &outputCallback, &v5->_session))
    {
      v7 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[JFXVideoDecoderInterface initWithFormatDescription:]((uint64_t)v5, v7);
      }
    }
  }
  return v5;
}

- (__CVBuffer)decodeFrame:(opaqueCMSampleBuffer *)a3
{
  VTDecodeInfoFlags infoFlagsOut = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(JFXVideoDecoderInterface *)self setFrameSemaphore:v5];

  OSStatus v6 = VTDecompressionSessionDecodeFrame(self->_session, a3, 0, self, &infoFlagsOut);
  v7 = JFXLog_DebugDepthCodec();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      [(JFXVideoDecoderInterface *)(uint64_t)self decodeFrame:v7];
    }
  }
  else if (v8)
  {
    -[JFXVideoDecoderInterface decodeFrame:]((uint64_t)self, v7);
  }

  v9 = [(JFXVideoDecoderInterface *)self frameSemaphore];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  return [(JFXVideoDecoderInterface *)self imageBuffer];
}

- (void)dealloc
{
  session = self->_session;
  if (session)
  {
    VTDecompressionSessionFinishDelayedFrames(session);
    v4 = self->_session;
    if (v4) {
      CFRelease(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)JFXVideoDecoderInterface;
  [(JFXVideoDecoderInterface *)&v5 dealloc];
}

- (OS_dispatch_semaphore)frameSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFrameSemaphore:(id)a3
{
}

- (__CVBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (void)setImageBuffer:(__CVBuffer *)a3
{
  self->_imageBuffer = a3;
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "Error: JFXVideoDecoderInterface: don't use this init method", v1, 2u);
}

- (void)initWithFormatDescription:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "JFXVideoDecoderInterface[%p]: A new session is created for the new format description.\n", (uint8_t *)&v2, 0xCu);
}

- (void)decodeFrame:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "JFXVideoDecoderInterface[%p]: Decoding succeeds with the new session!\n", (uint8_t *)&v2, 0xCu);
}

- (void)decodeFrame:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "JFXVideoDecoderInterface[%p]: Decoding fails with the new session: %d!\n", (uint8_t *)&v3, 0x12u);
}

@end