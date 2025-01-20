@interface VCImageRotationConverter
- (VCImageRotationConverter)initWithRotationAngle:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 formatType:(unsigned int)a6;
@end

@implementation VCImageRotationConverter

CVPixelBufferRef __VCImageRotationConverter_CreateRotatedSampleBuffer_block_invoke(uint64_t a1, __CVBuffer *a2)
{
  return VCImageRotationConverter_CreateRotatedPixelBuffer(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

- (VCImageRotationConverter)initWithRotationAngle:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5 formatType:(unsigned int)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCImageRotationConverter;
  v9 = [(VCImageRotationConverterBase *)&v14 initWithRotationAngle:*(void *)&a3 formatType:*(void *)&a6];
  v10 = v9;
  if (v9)
  {
    if (a3 == 90 || a3 == 270)
    {
      [(VCImageConverterBase *)v9 setUpBufferPoolForOutputWidth:a5 outputHeight:a4];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCImageRotationConverter initWithRotationAngle:width:height:formatType:](v11, a3, v12);
        }
      }

      return 0;
    }
  }
  return v10;
}

- (void)initWithRotationAngle:(os_log_t)log width:height:formatType:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  v6 = "-[VCImageRotationConverter initWithRotationAngle:width:height:formatType:]";
  __int16 v7 = 1024;
  int v8 = 19;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Rotation angle %d is not supported (Only 90 and 270 are valid).", (uint8_t *)&v3, 0x22u);
}

@end