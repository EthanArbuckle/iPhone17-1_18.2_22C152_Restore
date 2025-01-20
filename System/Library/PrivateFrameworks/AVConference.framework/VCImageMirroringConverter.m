@interface VCImageMirroringConverter
- (VCImageMirroringConverter)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 formatType:(unsigned int)a5;
@end

@implementation VCImageMirroringConverter

- (VCImageMirroringConverter)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 formatType:(unsigned int)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCImageMirroringConverter;
  v7 = [(VCImageRotationConverterBase *)&v10 initWithRotationAngle:0 formatType:*(void *)&a5];
  v8 = v7;
  if (v7
    && ![(VCImageConverterBase *)v7 setUpBufferPoolForOutputWidth:a3 outputHeight:a4])
  {

    return 0;
  }
  return v8;
}

CVPixelBufferRef __VCImageMirroringConverter_CreateMirroredSampleBuffer_block_invoke(uint64_t a1, __CVBuffer *a2)
{
  return VCImageMirroringConverter_CreateMirroredPixelBuffer(*(void *)(a1 + 32), a2);
}

@end