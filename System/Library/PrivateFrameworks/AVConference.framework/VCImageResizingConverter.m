@interface VCImageResizingConverter
- (VCImageResizingConverter)initWithOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4 formatType:(unsigned int)a5;
- (void)dealloc;
@end

@implementation VCImageResizingConverter

- (VCImageResizingConverter)initWithOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4 formatType:(unsigned int)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCImageResizingConverter;
  v7 = [(VCImageConverterBase *)&v11 initWithFormatType:*(void *)&a5];
  if (v7)
  {
    VTPixelTransferSessionCreate(0, &v7->_transferSession);
    VTSessionSetProperty(v7->_transferSession, (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45468]);
    if ([(VCImageConverterBase *)v7 setUpBufferPoolForOutputWidth:a3 outputHeight:a4])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          v15 = "-[VCImageResizingConverter initWithOutputWidth:outputHeight:formatType:]";
          __int16 v16 = 1024;
          int v17 = 36;
          __int16 v18 = 2048;
          v19 = v7;
          __int16 v20 = 2048;
          unint64_t v21 = a3;
          __int16 v22 = 2048;
          unint64_t v23 = a4;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame Transform resize, %p outputSize %zux%zu", buf, 0x3Au);
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  VTPixelTransferSessionInvalidate(self->_transferSession);
  transferSession = self->_transferSession;
  if (transferSession)
  {
    CFRelease(transferSession);
    self->_transferSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCImageResizingConverter;
  [(VCImageConverterBase *)&v4 dealloc];
}

CVPixelBufferRef __VCImageResizingConverter_CreateResizedSampleBuffer_block_invoke(uint64_t a1, __CVBuffer *a2)
{
  return VCImageResizingConverter_CreateResizedPixelBuffer(*(void *)(a1 + 32), a2);
}

@end