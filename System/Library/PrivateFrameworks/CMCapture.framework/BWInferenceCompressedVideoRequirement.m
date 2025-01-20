@interface BWInferenceCompressedVideoRequirement
+ (id)newRequirementWithUncompressedRequirement:(id)a3 supportedCompressionType:(int)a4 supportedLossyCompressionLevel:(int)a5;
- (BOOL)isSatisfiedByRequirement:(id)a3;
- (BWInferenceVideoRequirement)uncompressedRequirement;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)satisfactionHash;
- (void)dealloc;
- (void)initWithUncompressedRequirement:(uint64_t)a3 compressedVideoFormat:;
@end

@implementation BWInferenceCompressedVideoRequirement

- (BOOL)isSatisfiedByRequirement:(id)a3
{
  unsigned int v5 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self videoFormat] pixelFormat];
  if (v5 != objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "pixelFormat")) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceCompressedVideoRequirement;
  return [(BWInferenceVideoRequirement *)&v7 isSatisfiedByRequirement:a3];
}

- (unint64_t)satisfactionHash
{
  return [(BWInferenceVideoRequirement *)self->_uncompressedRequirement satisfactionHash];
}

+ (id)newRequirementWithUncompressedRequirement:(id)a3 supportedCompressionType:(int)a4 supportedLossyCompressionLevel:(int)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "underlyingVideoFormat"), "pixelFormat");
  if (objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "height")) {
    signed int v9 = 0;
  }
  else {
    signed int v9 = a5;
  }
  uint64_t v10 = FigCaptureCompressedPixelFormatForPixelFormat(v8, a4, v9);
  if (v8 == v10) {
    return 0;
  }
  uint64_t v12 = v10;
  v13 = -[BWInferenceVideoFormatRequirements initWithFormat:]([BWInferenceVideoFormatRequirements alloc], "initWithFormat:", [a3 videoFormat]);
  v15[0] = [NSNumber numberWithUnsignedInt:v12];
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1]);
  v14 = v13;
  id result = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1]);
  if (result) {
    return -[BWInferenceCompressedVideoRequirement initWithUncompressedRequirement:compressedVideoFormat:]([BWInferenceCompressedVideoRequirement alloc], a3, (uint64_t)result);
  }
  return result;
}

- (void)initWithUncompressedRequirement:(uint64_t)a3 compressedVideoFormat:
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)BWInferenceCompressedVideoRequirement;
  v4 = objc_msgSendSuper2(&v6, sel_initWithAttachedMediaKey_videoFormat_, [a2 attachedMediaKey], a3);
  if (v4) {
    v4[6] = a2;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVideoRequirement:", self);
  v4[6] = [(BWInferenceVideoRequirement *)self->_uncompressedRequirement copy];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceCompressedVideoRequirement;
  [(BWInferenceVideoRequirement *)&v3 dealloc];
}

- (BWInferenceVideoRequirement)uncompressedRequirement
{
  return self->_uncompressedRequirement;
}

@end