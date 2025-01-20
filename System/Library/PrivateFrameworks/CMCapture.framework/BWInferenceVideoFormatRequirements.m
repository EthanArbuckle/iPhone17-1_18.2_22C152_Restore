@interface BWInferenceVideoFormatRequirements
+ (id)defaultEspressoFormatRequirementsWithWidth:(int64_t)a3 height:(int64_t)a4;
- (BOOL)deviceOriented;
- (BOOL)includesInvalidContent;
- (BWInferenceCropDescriptor)cropDescriptor;
- (BWInferenceVideoFormatRequirements)initWithFormat:(id)a3;
- (id)histogramRequest;
- (int)rotationDegrees;
- (int64_t)videoContentMode;
- (void)dealloc;
- (void)setCropDescriptor:(id)a3;
- (void)setDeviceOriented:(BOOL)a3;
- (void)setHistogramRequest:(id)a3;
- (void)setIncludesInvalidContent:(BOOL)a3;
- (void)setRotationDegrees:(int)a3;
- (void)setVideoContentMode:(int64_t)a3;
@end

@implementation BWInferenceVideoFormatRequirements

- (BWInferenceVideoFormatRequirements)initWithFormat:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceVideoFormatRequirements;
  v4 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:](&v6, sel_initWithPixelBufferAttributes_, [a3 pixelBufferAttributes]);
  if (v4)
  {
    v7[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v4, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
    v4->_deviceOriented = [a3 deviceOriented];
    v4->_videoContentMode = [a3 videoContentMode];
    v4->_includesInvalidContent = [a3 includesInvalidContent];
    v4->_cropDescriptor = (BWInferenceCropDescriptor *)(id)[a3 cropDescriptor];
    v4->_histogramRequest = (id)objc_msgSend((id)objc_msgSend(a3, "histogramRequest"), "copy");
    v4->_rotationDegrees = [a3 rotationDegrees];
  }
  return v4;
}

- (int64_t)videoContentMode
{
  return self->_videoContentMode;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BOOL)includesInvalidContent
{
  return self->_includesInvalidContent;
}

- (BOOL)deviceOriented
{
  return self->_deviceOriented;
}

- (BWInferenceCropDescriptor)cropDescriptor
{
  return self->_cropDescriptor;
}

- (id)histogramRequest
{
  return self->_histogramRequest;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoFormatRequirements;
  [(BWVideoFormatRequirements *)&v3 dealloc];
}

- (void)setDeviceOriented:(BOOL)a3
{
  self->_deviceOriented = a3;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setHistogramRequest:(id)a3
{
}

- (void)setCropDescriptor:(id)a3
{
}

- (void)setIncludesInvalidContent:(BOOL)a3
{
  self->_includesInvalidContent = a3;
}

- (void)setVideoContentMode:(int64_t)a3
{
  self->_videoContentMode = a3;
}

+ (id)defaultEspressoFormatRequirementsWithWidth:(int64_t)a3 height:(int64_t)a4
{
  objc_super v6 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v6 setWidth:a3];
  [(BWVideoFormatRequirements *)v6 setHeight:a4];
  [(BWVideoFormatRequirements *)v6 setSupportedPixelFormats:&unk_1EFB03C98];
  [(BWVideoFormatRequirements *)v6 setSupportedColorSpaceProperties:&unk_1EFB03CB0];
  [(BWVideoFormatRequirements *)v6 setBytesPerRowAlignment:64];
  [(BWInferenceVideoFormatRequirements *)v6 setDeviceOriented:1];
  return v6;
}

@end