@interface VCImageRotationConverterBase
- (VCImageRotationConverterBase)initWithRotationAngle:(unsigned int)a3 formatType:(unsigned int)a4;
- (void)dealloc;
@end

@implementation VCImageRotationConverterBase

- (VCImageRotationConverterBase)initWithRotationAngle:(unsigned int)a3 formatType:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCImageRotationConverterBase;
  v5 = [(VCImageConverterBase *)&v8 initWithFormatType:*(void *)&a4];
  v6 = v5;
  if (v5)
  {
    v5->_rotationAngle = a3;
    VTImageRotationSessionCreate();
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E576F0](self->_rotationSession, a2);
  VTImageRotationSessionRelease();
  v3.receiver = self;
  v3.super_class = (Class)VCImageRotationConverterBase;
  [(VCImageConverterBase *)&v3 dealloc];
}

@end