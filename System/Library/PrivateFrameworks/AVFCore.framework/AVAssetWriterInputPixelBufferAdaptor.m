@interface AVAssetWriterInputPixelBufferAdaptor
+ (AVAssetWriterInputPixelBufferAdaptor)assetWriterInputPixelBufferAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes;
- (AVAssetWriterInput)assetWriterInput;
- (AVAssetWriterInputPixelBufferAdaptor)init;
- (AVAssetWriterInputPixelBufferAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes;
- (BOOL)appendPixelBuffer:(CVPixelBufferRef)pixelBuffer withPresentationTime:(CMTime *)presentationTime;
- (CVPixelBufferPoolRef)pixelBufferPool;
- (NSDictionary)sourcePixelBufferAttributes;
- (NSString)description;
- (void)addCallbackToCancelDuringDeallocation:(id)a3;
- (void)dealloc;
- (void)declareKeyPathDependenciesWithRegistry:(id)a3;
@end

@implementation AVAssetWriterInputPixelBufferAdaptor

+ (AVAssetWriterInputPixelBufferAdaptor)assetWriterInputPixelBufferAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetWriterInput:input sourcePixelBufferAttributes:sourcePixelBufferAttributes];
  return (AVAssetWriterInputPixelBufferAdaptor *)v4;
}

- (AVAssetWriterInputPixelBufferAdaptor)init
{
  return [(AVAssetWriterInputPixelBufferAdaptor *)self initWithAssetWriterInput:0 sourcePixelBufferAttributes:0];
}

- (AVAssetWriterInputPixelBufferAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  v26.receiver = self;
  v26.super_class = (Class)AVAssetWriterInputPixelBufferAdaptor;
  v7 = [(AVAssetWriterInputPixelBufferAdaptor *)&v26 init];
  v8 = v7;
  if (!input)
  {
    v11 = v7;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "input != nil";
LABEL_15:
    uint64_t v25 = (uint64_t)v19;
    v21 = @"invalid parameter not satisfying: %s";
LABEL_16:
    v24 = objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)v21, v12, v13, v14, v15, v16, v25), 0);
    objc_exception_throw(v24);
  }
  if (![(NSString *)[(AVAssetWriterInput *)input mediaType] isEqualToString:@"vide"]&& ![(NSString *)[(AVAssetWriterInput *)input mediaType] isEqualToString:@"auxv"])
  {
    v23 = v8;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "[[input mediaType] isEqualToString:AVMediaTypeVideo] || [[input mediaType] isEqualToString:AVMediaTypeAuxiliaryPicture]";
    goto LABEL_15;
  }
  if ([(AVAssetWriterInput *)input _isAttachedToAdaptor])
  {
    v20 = v8;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Cannot create a new pixel buffer adaptor with an asset writer input that is already attached to a pixel buffer adaptor";
    goto LABEL_16;
  }
  if ([(AVAssetWriterInput *)input _status])
  {
    v22 = v8;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Cannot create a new pixel buffer adaptor with an asset writer input that has already started writing";
    goto LABEL_16;
  }
  if (v8)
  {
    v9 = objc_alloc_init(AVAssetWriterInputPixelBufferAdaptorInternal);
    v8->_internal = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_internal->input = input;
      [(AVAssetWriterInput *)v8->_internal->input _setSourcePixelBufferAttributes:sourcePixelBufferAttributes];
      [(AVAssetWriterInput *)v8->_internal->input _setAttachedAdaptor:v8];
      v8->_internal->keyPathDependencyManager = [[AVKeyPathDependencyManager alloc] initWithDependencyHost:v8];
      [(AVKeyPathDependencyManager *)v8->_internal->keyPathDependencyManager dependencyHostIsFullyInitialized];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    [(AVKeyPathDependencyManager *)internal->keyPathDependencyManager cancelAllCallbacks];

    CFRelease(self->_internal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputPixelBufferAdaptor;
  [(AVAssetWriterInputPixelBufferAdaptor *)&v4 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, assetWriterInput = %@, sourcePixelBufferAttributes = %@>", NSStringFromClass(v4), self, -[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self, "assetWriterInput"), -[AVAssetWriterInputPixelBufferAdaptor sourcePixelBufferAttributes](self, "sourcePixelBufferAttributes")];
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_internal->input;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  v2 = [(AVAssetWriterInputPixelBufferAdaptor *)self assetWriterInput];
  return [(AVAssetWriterInput *)v2 _sourcePixelBufferAttributes];
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  objc_super v4 = AVTwoPartKeyPathMake(@"assetWriterInput", @"pixelBufferPool");
  [a3 valueForKey:@"pixelBufferPool" dependsOnValueAtKeyPath:v4];
}

- (CVPixelBufferPoolRef)pixelBufferPool
{
  v2 = [(AVAssetWriterInputPixelBufferAdaptor *)self assetWriterInput];
  return [(AVAssetWriterInput *)v2 _pixelBufferPool];
}

- (BOOL)appendPixelBuffer:(CVPixelBufferRef)pixelBuffer withPresentationTime:(CMTime *)presentationTime
{
  if (!pixelBuffer)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "pixelBuffer != NULL";
    goto LABEL_6;
  }
  if ((presentationTime->flags & 0x1D) != 1)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = "CMTIME_IS_NUMERIC(presentationTime)";
LABEL_6:
    uint64_t v15 = (void *)[v12 exceptionWithName:v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)presentationTime, v4, v5, v6, v7, (uint64_t)v14), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  v10 = [(AVAssetWriterInputPixelBufferAdaptor *)self assetWriterInput];
  long long v16 = *(_OWORD *)&presentationTime->value;
  CMTimeEpoch epoch = presentationTime->epoch;
  return [(AVAssetWriterInput *)v10 _appendPixelBuffer:pixelBuffer withPresentationTime:&v16];
}

@end