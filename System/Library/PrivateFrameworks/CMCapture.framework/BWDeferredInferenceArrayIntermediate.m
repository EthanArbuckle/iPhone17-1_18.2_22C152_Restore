@interface BWDeferredInferenceArrayIntermediate
+ (BOOL)supportsSecureCoding;
- (BWDeferredInferenceArrayIntermediate)initWithArray:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6 URL:(id)a7;
- (BWDeferredInferenceArrayIntermediate)initWithCoder:(id)a3;
- (NSString)inferenceAttachmentKey;
- (NSString)portType;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWDeferredInferenceArrayIntermediate

- (BWDeferredInferenceArrayIntermediate)initWithArray:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6 URL:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  v9 = [(BWDeferredArrayIntermediate *)&v11 initWithArray:a3 tag:a4 URL:a7];
  if (v9)
  {
    v9->_inferenceAttachmentKey = (NSString *)a5;
    v9->_portType = (NSString *)a6;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredInferenceArrayIntermediate)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  v4 = -[BWDeferredArrayIntermediate initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_inferenceAttachmentKey = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"inferenceAttachmentKey"];
    v4->_portType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"portType"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  -[BWDeferredArrayIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_inferenceAttachmentKey forKey:@"inferenceAttachmentKey"];
  [a3 encodeObject:self->_portType forKey:@"portType"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  [(BWDeferredArrayIntermediate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v4 = (void *)MEMORY[0x1A6272C70]();
  objc_super v5 = [(NSArray *)self->super._array description];
  if ([(NSString *)v5 length] >= 0x201) {
    objc_super v5 = (NSString *)[NSString stringWithFormat:@"%@..."], -[NSString substringToIndex:](v5, "substringToIndex:", 512));
  }
  [v3 appendFormat:@"<%@ %p>: tag:%@ inferenceAttachmentKey:%@ portType:%@ array:%@", objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_inferenceAttachmentKey, self->_portType, v5];
  objc_super v6 = (void *)[v3 copy];
  return v6;
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)inferenceAttachmentKey
{
  return self->_inferenceAttachmentKey;
}

@end