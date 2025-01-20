@interface BWDeferredInferenceDictionaryIntermediate
+ (BOOL)supportsSecureCoding;
- (BWDeferredInferenceDictionaryIntermediate)initWithCoder:(id)a3;
- (BWDeferredInferenceDictionaryIntermediate)initWithDictionary:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6 URL:(id)a7;
- (NSString)inferenceAttachmentKey;
- (NSString)portType;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWDeferredInferenceDictionaryIntermediate

- (BWDeferredInferenceDictionaryIntermediate)initWithDictionary:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6 URL:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)BWDeferredInferenceDictionaryIntermediate;
  v9 = [(BWDeferredDictionaryIntermediate *)&v11 initWithDictionary:a3 tag:a4 URL:a7];
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

- (BWDeferredInferenceDictionaryIntermediate)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWDeferredInferenceDictionaryIntermediate;
  v4 = -[BWDeferredDictionaryIntermediate initWithCoder:](&v6, sel_initWithCoder_);
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
  v5.super_class = (Class)BWDeferredInferenceDictionaryIntermediate;
  -[BWDeferredDictionaryIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_inferenceAttachmentKey forKey:@"inferenceAttachmentKey"];
  [a3 encodeObject:self->_portType forKey:@"portType"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredInferenceDictionaryIntermediate;
  [(BWDeferredDictionaryIntermediate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1A6272C70](self, a2);
  v4 = [(NSDictionary *)self->super._dictionary description];
  if ([(NSString *)v4 length] >= 0x201) {
    v4 = (NSString *)[NSString stringWithFormat:@"%@..."], -[NSString substringToIndex:](v4, "substringToIndex:", 512));
  }
  objc_super v5 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p>: tag:%@ inferenceAttachmentKey:%@ portType:%@ array:%@", objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_inferenceAttachmentKey, self->_portType, v4];
  return v5;
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