@interface AVAssetWriterInputTaggedPixelBufferGroupAdaptor
+ (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)assetWriterInputTaggedPixelBufferGroupAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes;
- (AVAssetWriterInput)assetWriterInput;
- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)init;
- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes;
- (BOOL)appendTaggedPixelBufferGroup:(CMTaggedBufferGroupRef)taggedPixelBufferGroup withPresentationTime:(CMTime *)presentationTime;
- (CVPixelBufferPoolRef)pixelBufferPool;
- (NSDictionary)sourcePixelBufferAttributes;
- (id)description;
- (void)dealloc;
@end

@implementation AVAssetWriterInputTaggedPixelBufferGroupAdaptor

+ (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)assetWriterInputTaggedPixelBufferGroupAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetWriterInput:input sourcePixelBufferAttributes:sourcePixelBufferAttributes];
  return (AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)v4;
}

- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)init
{
  return [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)self initWithAssetWriterInput:0 sourcePixelBufferAttributes:0];
}

- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputTaggedPixelBufferGroupAdaptor;
  v7 = [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)&v28 init];
  p_isa = (id *)&v7->super.isa;
  if (!input)
  {
    v12 = v7;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = "input != nil";
LABEL_15:
    uint64_t v27 = (uint64_t)v20;
    v22 = @"invalid parameter not satisfying: %s";
LABEL_16:
    v26 = objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)p_isa, a2, (uint64_t)v22, v13, v14, v15, v16, v17, v27), 0);
    objc_exception_throw(v26);
  }
  if (([(NSString *)[(AVAssetWriterInput *)input mediaType] isEqual:@"vide"] & 1) == 0
    && ([(NSString *)[(AVAssetWriterInput *)input mediaType] isEqual:@"auxv"] & 1) == 0)
  {
    v25 = p_isa;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v20 = "[[input mediaType] isEqual:AVMediaTypeVideo] || [[input mediaType] isEqual:AVMediaTypeAuxiliaryPicture]";
    goto LABEL_15;
  }
  if ([(AVAssetWriterInput *)input _isAttachedToAdaptor])
  {
    v21 = p_isa;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v22 = @"Cannot create a new tagged buffer group adaptor with an asset writer input that is already attached to a tagged buffer group adaptor";
    goto LABEL_16;
  }
  if ([(AVAssetWriterInput *)input _status])
  {
    v23 = p_isa;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v22 = @"Cannot create a new tagged buffer group adaptor with an asset writer input that has already started writing";
    goto LABEL_16;
  }
  id v9 = [(NSDictionary *)[(AVAssetWriterInput *)input outputSettings] objectForKey:@"AVVideoCompressionPropertiesKey"];
  if (![v9 objectForKey:*MEMORY[0x1E4F449A0]])
  {
    v24 = p_isa;
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    v22 = @"Cannot create a new tagged buffer group adaptor with missing value for kVTCompressionPropertyKey_MVHEVCVideoLayerIDs key in the writer input's outputSettings";
    goto LABEL_16;
  }
  if (p_isa)
  {
    v10 = input;
    p_isa[1] = v10;
    [(AVAssetWriterInput *)v10 _setSourcePixelBufferAttributes:sourcePixelBufferAttributes];
    [p_isa[1] _setAttachedAdaptor:p_isa];
  }
  return (AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)p_isa;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputTaggedPixelBufferGroupAdaptor;
  [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, assetWriterInput = %@ sourcePixelBufferAttributes = %@>", NSStringFromClass(v4), self, -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor assetWriterInput](self, "assetWriterInput"), -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor sourcePixelBufferAttributes](self, "sourcePixelBufferAttributes")];
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_input;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  v2 = [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)self assetWriterInput];
  return [(AVAssetWriterInput *)v2 _sourcePixelBufferAttributes];
}

- (CVPixelBufferPoolRef)pixelBufferPool
{
  v2 = [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)self assetWriterInput];
  return [(AVAssetWriterInput *)v2 _pixelBufferPool];
}

- (BOOL)appendTaggedPixelBufferGroup:(CMTaggedBufferGroupRef)taggedPixelBufferGroup withPresentationTime:(CMTime *)presentationTime
{
  if (!taggedPixelBufferGroup)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "taggedPixelBufferGroup != NULL";
    goto LABEL_6;
  }
  if ((presentationTime->flags & 0x1D) != 1)
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "CMTIME_IS_NUMERIC(presentationTime)";
LABEL_6:
    uint64_t v15 = (void *)[v12 exceptionWithName:v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)presentationTime, v4, v5, v6, v7, (uint64_t)v14), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v10 = [(AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)self assetWriterInput];
  long long v16 = *(_OWORD *)&presentationTime->value;
  CMTimeEpoch epoch = presentationTime->epoch;
  return [(AVAssetWriterInput *)v10 _appendTaggedPixelBufferGroup:taggedPixelBufferGroup withPresentationTime:&v16];
}

@end