@interface FigCaptureStillImageSinkPipelineConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FigCaptureStillImageSinkPipelineConfiguration)initWithCoder:(id)a3;
- (uint64_t)setClientPID:(uint64_t)result;
- (uint64_t)setGnrHDRSupported:(uint64_t)result;
- (uint64_t)setHdrSupported:(uint64_t)result;
- (uint64_t)setIsIrisSupported:(uint64_t)result;
- (uint64_t)setStereoFusionSupported:(uint64_t)result;
- (uint64_t)setStillImageISPChromaNoiseReductionEnabled:(uint64_t)result;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setStillImageColorInfoForFramesOriginatingFromVideoStream:(void *)a1;
@end

@implementation FigCaptureStillImageSinkPipelineConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureStillImageSinkPipelineConfiguration)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkPipelineConfiguration;
  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_clientPID = [a3 decodeInt32ForKey:@"clientPID"];
    v4->_stillImageColorInfoForFramesOriginatingFromVideoStream = (NSDictionary *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"stillImageColorInfoForFramesOriginatingFromVideoStream"];
    v4->_stillImageISPChromaNoiseReductionEnabled = [a3 decodeBoolForKey:@"stillImageISPChromaNoiseReductionEnabled"];
    v4->_stereoFusionSupported = [a3 decodeBoolForKey:@"stereoFusionSupported"];
    v4->_isIrisSupported = [a3 decodeBoolForKey:@"isIrisSupported"];
    v4->_hdrSupported = [a3 decodeBoolForKey:@"hdrSupported"];
    v4->_gnrHDRSupported = [a3 decodeBoolForKey:@"gnrHDRSupported"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureStillImageSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInt32:self->_clientPID forKey:@"clientPID"];
  [a3 encodeObject:self->_stillImageColorInfoForFramesOriginatingFromVideoStream forKey:@"stillImageColorInfoForFramesOriginatingFromVideoStream"];
  [a3 encodeBool:self->_stillImageISPChromaNoiseReductionEnabled forKey:@"stillImageISPChromaNoiseReductionEnabled"];
  [a3 encodeBool:self->_stereoFusionSupported forKey:@"stereoFusionSupported"];
  [a3 encodeBool:self->_isIrisSupported forKey:@"isIrisSupported"];
  [a3 encodeBool:self->_hdrSupported forKey:@"hdrSupported"];
  [a3 encodeBool:self->_gnrHDRSupported forKey:@"gnrHDRSupported"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    uint64_t v19 = v4;
    uint64_t v20 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    if (self)
    {
      int clientPID = self->_clientPID;
      if (a3)
      {
LABEL_5:
        int v10 = *((_DWORD *)a3 + 22);
        goto LABEL_6;
      }
    }
    else
    {
      int clientPID = 0;
      if (a3) {
        goto LABEL_5;
      }
    }
    int v10 = 0;
LABEL_6:
    if (clientPID == v10)
    {
      if (self)
      {
        stillImageColorInfoForFramesOriginatingFromVideoStream = self->_stillImageColorInfoForFramesOriginatingFromVideoStream;
        if (a3)
        {
LABEL_9:
          v12 = (NSDictionary *)*((void *)a3 + 12);
          goto LABEL_10;
        }
      }
      else
      {
        stillImageColorInfoForFramesOriginatingFromVideoStream = 0;
        if (a3) {
          goto LABEL_9;
        }
      }
      v12 = 0;
LABEL_10:
      if (stillImageColorInfoForFramesOriginatingFromVideoStream == v12) {
        goto LABEL_15;
      }
      if (self)
      {
        v13 = self->_stillImageColorInfoForFramesOriginatingFromVideoStream;
        if (a3)
        {
LABEL_13:
          uint64_t v14 = *((void *)a3 + 12);
          goto LABEL_14;
        }
      }
      else
      {
        v13 = 0;
        if (a3) {
          goto LABEL_13;
        }
      }
      uint64_t v14 = 0;
LABEL_14:
      int v15 = -[NSDictionary isEqual:](v13, "isEqual:", v14, v19, v20, v5, v6);
      if (!v15) {
        return v15;
      }
LABEL_15:
      if (self)
      {
        if (!a3)
        {
          if (self->_stillImageISPChromaNoiseReductionEnabled
            || self->_stereoFusionSupported
            || self->_isIrisSupported
            || self->_hdrSupported)
          {
            goto LABEL_21;
          }
          BOOL v17 = 0;
          char gnrHDRSupported = self->_gnrHDRSupported;
          goto LABEL_26;
        }
        if (self->_stillImageISPChromaNoiseReductionEnabled != (*((unsigned char *)a3 + 104) != 0)
          || self->_stereoFusionSupported != (*((unsigned char *)a3 + 105) != 0)
          || self->_isIrisSupported != (*((unsigned char *)a3 + 106) != 0)
          || self->_hdrSupported != (*((unsigned char *)a3 + 107) != 0))
        {
          goto LABEL_21;
        }
        char gnrHDRSupported = self->_gnrHDRSupported;
      }
      else
      {
        if (!a3)
        {
          char gnrHDRSupported = 0;
          BOOL v17 = 0;
          goto LABEL_26;
        }
        if (*((unsigned char *)a3 + 104)) {
          goto LABEL_21;
        }
        if (*((unsigned char *)a3 + 105)) {
          goto LABEL_21;
        }
        if (*((unsigned char *)a3 + 106)) {
          goto LABEL_21;
        }
        char gnrHDRSupported = *((unsigned char *)a3 + 107);
        if (gnrHDRSupported) {
          goto LABEL_21;
        }
      }
      BOOL v17 = *((unsigned char *)a3 + 108) != 0;
LABEL_26:
      LOBYTE(v15) = gnrHDRSupported ^ v17 ^ 1;
      return v15;
    }
LABEL_21:
    LOBYTE(v15) = 0;
    return v15;
  }
  LOBYTE(v15) = 1;
  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSinkPipelineConfiguration;
  [(FigCaptureBaseStillImageSinkPipelineConfiguration *)&v3 dealloc];
}

- (uint64_t)setClientPID:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 88) = a2;
  }
  return result;
}

- (void)setStillImageColorInfoForFramesOriginatingFromVideoStream:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 96);
  }
}

- (uint64_t)setStillImageISPChromaNoiseReductionEnabled:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 104) = a2;
  }
  return result;
}

- (uint64_t)setStereoFusionSupported:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 105) = a2;
  }
  return result;
}

- (uint64_t)setIsIrisSupported:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 106) = a2;
  }
  return result;
}

- (uint64_t)setHdrSupported:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 107) = a2;
  }
  return result;
}

- (uint64_t)setGnrHDRSupported:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 108) = a2;
  }
  return result;
}

@end