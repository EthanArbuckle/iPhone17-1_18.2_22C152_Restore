@interface JFXVideoEncoderInterface
- (JFXVideoEncoderInterface)init;
- (JFXVideoEncoderInterface)initWithExpectedFrameRate:(double)a3;
- (id).cxx_construct;
- (opaqueCMSampleBuffer)currentBuffer;
- (opaqueCMSampleBuffer)encodeFrame:(__CVBuffer *)a3 presentationTime:(id *)a4 frameProperties:(__CFDictionary *)a5;
- (void)closeEncoder;
- (void)dealloc;
- (void)setCurrentBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setupEncoderWithWidth:(int)a3 andHeight:(int)a4 imageFormat:(int)a5 andFramerate:(double)a6;
- (void)skipFrame;
- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation JFXVideoEncoderInterface

- (JFXVideoEncoderInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXVideoEncoderInterface;
  if ([(JFXVideoEncoderInterface *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (JFXVideoEncoderInterface)initWithExpectedFrameRate:(double)a3
{
  result = [(JFXVideoEncoderInterface *)self init];
  if (result) {
    result->m_expectedFrameRate = a3;
  }
  return result;
}

- (void)setupEncoderWithWidth:(int)a3 andHeight:(int)a4 imageFormat:(int)a5 andFramerate:(double)a6
{
  self->m_encoderInitialized = 1;
}

- (opaqueCMSampleBuffer)encodeFrame:(__CVBuffer *)a3 presentationTime:(id *)a4 frameProperties:(__CFDictionary *)a5
{
}

- (void)closeEncoder
{
  self->m_encoderInitialized = 0;
  HEVCLosslessEncoder::Close(self->m_encoder);
}

- (void)skipFrame
{
  uint64_t v2 = 0;
  std::promise<opaqueCMSampleBuffer *>::set_value((uint64_t *)&self->m_sampleBufferPromise, &v2);
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v4 = a3;
  CFRetain(a3);
  std::promise<opaqueCMSampleBuffer *>::set_value((uint64_t *)&self->m_sampleBufferPromise, &v4);
}

- (void)dealloc
{
  m_encoder = self->m_encoder;
  if (m_encoder)
  {
    HEVCLosslessEncoder::~HEVCLosslessEncoder(m_encoder);
    MEMORY[0x237DD0F30]();
  }
  v4.receiver = self;
  v4.super_class = (Class)JFXVideoEncoderInterface;
  [(JFXVideoEncoderInterface *)&v4 dealloc];
}

- (opaqueCMSampleBuffer)currentBuffer
{
  return self->_currentBuffer;
}

- (void)setCurrentBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_currentBuffer = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
}

@end