@interface BWDeferredInferenceBufferIntermediate
+ (BOOL)supportsSecureCoding;
- (BWDeferredInferenceBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 metadataTag:(id)a5 inferenceAttachedMediaKey:(id)a6 portType:(id)a7 compressionProfile:(int)a8 URL:(id)a9;
- (BWDeferredInferenceBufferIntermediate)initWithCoder:(id)a3;
- (NSString)inferenceAttachedMediaKey;
- (id)_shortString;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWDeferredInferenceBufferIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredInferenceBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 metadataTag:(id)a5 inferenceAttachedMediaKey:(id)a6 portType:(id)a7 compressionProfile:(int)a8 URL:(id)a9
{
  v13.receiver = self;
  v13.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  v10 = [(BWDeferredBufferIntermediate *)&v13 initWithBuffer:a3 tag:a4 bufferType:16 captureFrameFlags:0 metadataTag:a5 portType:a7 compressionProfile:a8 URL:a9];
  if (v10) {
    v10->_inferenceAttachedMediaKey = (NSString *)a6;
  }
  return v10;
}

- (BWDeferredInferenceBufferIntermediate)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  v4 = -[BWDeferredBufferIntermediate initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_inferenceAttachedMediaKey = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inferenceAttachedMediaKey"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  -[BWDeferredBufferIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_inferenceAttachedMediaKey forKey:@"inferenceAttachedMediaKey"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  [(BWDeferredBufferIntermediate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: tag:%@ inferenceAttachedMediaKey:%@ bufferType:%@ portType:%@ bufferAttributes:%@", v4, self, -[BWDeferredIntermediate tag](self, "tag"), self->_inferenceAttachedMediaKey, BWStillImageBufferTypeToShortString(-[BWDeferredBufferIntermediate bufferType](self, "bufferType")), -[BWDeferredBufferIntermediate portType](self, "portType"), -[BWDeferredBufferIntermediate attributes](self, "attributes")];
}

- (id)_shortString
{
  objc_super v3 = [(BWDeferredBufferIntermediate *)self attributes];
  uint64_t v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "unsignedIntValue");
  objc_super v5 = [(BWDeferredBufferIntermediate *)self attributes];
  uint64_t v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "unsignedIntValue");
  return (id)[NSString stringWithFormat:@"'%@' ('%@', %dx%d)", self->_inferenceAttachedMediaKey, BWStringFromCVPixelFormatType(-[BWDeferredBufferIntermediate pixelFormat](self, "pixelFormat")), v4, v6];
}

- (NSString)inferenceAttachedMediaKey
{
  return self->_inferenceAttachedMediaKey;
}

@end