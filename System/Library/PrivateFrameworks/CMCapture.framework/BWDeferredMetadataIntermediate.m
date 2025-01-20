@interface BWDeferredMetadataIntermediate
+ (BOOL)supportsSecureCoding;
- (BWDeferredMetadataIntermediate)initWithCoder:(id)a3;
- (BWDeferredMetadataIntermediate)initWithMetadata:(id)a3 tag:(id)a4 bufferTag:(id)a5 URL:(id)a6;
- (NSString)bufferTag;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWDeferredMetadataIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredMetadataIntermediate)initWithMetadata:(id)a3 tag:(id)a4 bufferTag:(id)a5 URL:(id)a6
{
  if (a5)
  {
    v10.receiver = self;
    v10.super_class = (Class)BWDeferredMetadataIntermediate;
    v8 = [(BWDeferredDictionaryIntermediate *)&v10 initWithDictionary:a3 tag:a4 URL:a6];
    if (v8) {
      v8->_bufferTag = (NSString *)a5;
    }
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v8;
}

- (BWDeferredMetadataIntermediate)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWDeferredMetadataIntermediate;
  v4 = -[BWDeferredDictionaryIntermediate initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_bufferTag = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bufferTag"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredMetadataIntermediate;
  -[BWDeferredDictionaryIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_bufferTag forKey:@"bufferTag"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredMetadataIntermediate;
  [(BWDeferredDictionaryIntermediate *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  v4 = (void *)MEMORY[0x1A6272C70]();
  objc_super v5 = [(NSDictionary *)[(BWDeferredDictionaryIntermediate *)self dictionary] description];
  if ([(NSString *)v5 length] >= 0x201) {
    objc_super v5 = (NSString *)[NSString stringWithFormat:@"%@...}", -[NSString substringToIndex:](v5, "substringToIndex:", 512)];
  }
  [v3 appendFormat:@"<%@ %p>: tag:%@ bufferTag:%@ metadata:%@", objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_bufferTag, v5];
  objc_super v6 = (void *)[v3 copy];
  return v6;
}

- (NSString)bufferTag
{
  return self->_bufferTag;
}

@end