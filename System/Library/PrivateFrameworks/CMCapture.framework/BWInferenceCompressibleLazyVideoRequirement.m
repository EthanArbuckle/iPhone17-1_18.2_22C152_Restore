@interface BWInferenceCompressibleLazyVideoRequirement
- (BWInferenceCompressibleLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 count:(unint64_t)a5 videoFormatProvider:(id)a6;
- (BWInferenceCompressibleLazyVideoRequirement)initWithLazyVideoRequirement:(id)a3;
- (int)prepareForInputInferenceVideoFormat:(id)a3;
- (void)dealloc;
@end

@implementation BWInferenceCompressibleLazyVideoRequirement

- (int)prepareForInputInferenceVideoFormat:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = -[BWInferenceLazyVideoRequirement prepareForInputInferenceVideoFormat:](self->_underlyingLazyVideoRequirement, "prepareForInputInferenceVideoFormat:");
  if (![(BWInferenceVideoRequirement *)self->_underlyingLazyVideoRequirement videoFormat]) {
    return -31711;
  }
  unsigned int v6 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_underlyingLazyVideoRequirement videoFormat] pixelFormat];
  if (v6 == [a3 uncompressedEquivalent])
  {
    v7 = [[BWInferenceVideoFormatRequirements alloc] initWithFormat:[(BWInferenceVideoRequirement *)self->_underlyingLazyVideoRequirement videoFormat]];
    v11[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
    v10 = v7;
    id v8 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1]);
    if (v8)
    {
      self->super.super._videoFormat = (BWInferenceVideoFormat *)v8;
      return v5;
    }
    return -31711;
  }
  return v5;
}

- (BWInferenceCompressibleLazyVideoRequirement)initWithLazyVideoRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceCompressibleLazyVideoRequirement;
  v4 = -[BWInferenceLazyVideoRequirement initWithLazyVideoRequirement:](&v6, sel_initWithLazyVideoRequirement_);
  if (v4) {
    v4->_underlyingLazyVideoRequirement = (BWInferenceLazyVideoRequirement *)a3;
  }
  return v4;
}

- (BWInferenceCompressibleLazyVideoRequirement)initWithAttachedMediaKey:(id)a3 preparedByAttachedMediaKey:(id)a4 count:(unint64_t)a5 videoFormatProvider:(id)a6
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceCompressibleLazyVideoRequirement;
  [(BWInferenceLazyVideoRequirement *)&v3 dealloc];
}

@end