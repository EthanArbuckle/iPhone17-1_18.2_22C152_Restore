@interface BWStillImageProcessingSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)processIntelligentDistortionCorrection;
- (BOOL)provideDemosaicedRaw;
- (BWPhotoManifest)photoManifest;
- (BWStillImageProcessingSettings)initWithCoder:(id)a3;
- (BWStillImageProcessingSettings)initWithPhotoManifest:(id)a3 processIntelligentDistortionCorrection:(BOOL)a4;
- (id)description;
- (int)expectedClientImageCount;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWStillImageProcessingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageProcessingSettings)initWithPhotoManifest:(id)a3 processIntelligentDistortionCorrection:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)BWStillImageProcessingSettings;
  v6 = [(BWStillImageProcessingSettings *)&v18 init];
  if (v6)
  {
    v6->_photoManifest = (BWPhotoManifest *)a3;
    v6->_processIntelligentDistortionCorrection = a4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = objc_msgSend(a3, "photoDescriptors", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) processingFlags];
        v6->_provideDemosaicedRaw = BYTE2(v12) & 1;
        if ((v12 & 0x10000) != 0) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            goto LABEL_4;
          }
          return v6;
        }
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessingSettings;
  [(BWStillImageProcessingSettings *)&v3 dealloc];
}

- (BWStillImageProcessingSettings)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"photoManifest"];
  uint64_t v6 = [a3 decodeBoolForKey:@"processIntelligentDistortionCorrection"];
  return [(BWStillImageProcessingSettings *)self initWithPhotoManifest:v5 processIntelligentDistortionCorrection:v6];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_photoManifest forKey:@"photoManifest"];
  BOOL processIntelligentDistortionCorrection = self->_processIntelligentDistortionCorrection;
  [a3 encodeBool:processIntelligentDistortionCorrection forKey:@"processIntelligentDistortionCorrection"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v16 = v5;
    uint64_t v17 = v4;
    uint64_t v18 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      LOBYTE(v12) = 0;
      return v12;
    }
    uint64_t v11 = [(BWStillImageProcessingSettings *)self photoManifest];
    if (v11 == (BWPhotoManifest *)[a3 photoManifest]
      || (int v12 = -[BWPhotoManifest isEqual:](-[BWStillImageProcessingSettings photoManifest](self, "photoManifest"), "isEqual:", [a3 photoManifest])) != 0)
    {
      int v13 = [(BWStillImageProcessingSettings *)self processIntelligentDistortionCorrection];
      if (v13 != [a3 processIntelligentDistortionCorrection]) {
        goto LABEL_6;
      }
      BOOL v14 = [(BWStillImageProcessingSettings *)self provideDemosaicedRaw];
      LOBYTE(v12) = v14 ^ [a3 provideDemosaicedRaw] ^ 1;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return [(BWPhotoManifest *)self->_photoManifest hash] ^ self->_processIntelligentDistortionCorrection ^ (unint64_t)self->_provideDemosaicedRaw;
}

- (int)expectedClientImageCount
{
  return [(NSArray *)[(BWPhotoManifest *)self->_photoManifest photoDescriptors] count];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: idc: %d, demRaw: %d, clientImageCount: %d, manifest: %@", objc_opt_class(), self, -[BWStillImageProcessingSettings processIntelligentDistortionCorrection](self, "processIntelligentDistortionCorrection"), -[BWStillImageProcessingSettings provideDemosaicedRaw](self, "provideDemosaicedRaw"), -[BWStillImageProcessingSettings expectedClientImageCount](self, "expectedClientImageCount"), -[BWStillImageProcessingSettings photoManifest](self, "photoManifest")];
}

- (BWPhotoManifest)photoManifest
{
  return self->_photoManifest;
}

- (BOOL)processIntelligentDistortionCorrection
{
  return self->_processIntelligentDistortionCorrection;
}

- (BOOL)provideDemosaicedRaw
{
  return self->_provideDemosaicedRaw;
}

@end