@interface AVAssetWriterInputMetadataAdaptor
+ (AVAssetWriterInputMetadataAdaptor)assetWriterInputMetadataAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input;
+ (void)initialize;
- (AVAssetWriterInput)assetWriterInput;
- (AVAssetWriterInputMetadataAdaptor)init;
- (AVAssetWriterInputMetadataAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input;
- (BOOL)appendTimedMetadataGroup:(AVTimedMetadataGroup *)timedMetadataGroup;
- (id)description;
- (void)dealloc;
@end

@implementation AVAssetWriterInputMetadataAdaptor

+ (void)initialize
{
}

+ (AVAssetWriterInputMetadataAdaptor)assetWriterInputMetadataAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAssetWriterInput:input];
  return (AVAssetWriterInputMetadataAdaptor *)v3;
}

- (AVAssetWriterInputMetadataAdaptor)init
{
  return [(AVAssetWriterInputMetadataAdaptor *)self initWithAssetWriterInput:0];
}

- (AVAssetWriterInputMetadataAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input
{
  v32.receiver = self;
  v32.super_class = (Class)AVAssetWriterInputMetadataAdaptor;
  v5 = [(AVAssetWriterInputMetadataAdaptor *)&v32 init];
  v6 = v5;
  if (!input)
  {
    v9 = v5;
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = "input != nil";
LABEL_14:
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)v17);
    goto LABEL_20;
  }
  if (([(NSString *)[(AVAssetWriterInput *)input mediaType] isEqual:@"meta"] & 1) == 0)
  {
    v18 = v6;
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = "[[input mediaType] isEqual:AVMediaTypeMetadata]";
    goto LABEL_14;
  }
  if ([(AVAssetWriterInput *)input _isAttachedToAdaptor])
  {
    v20 = v6;
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Cannot create a new metadata adaptor with an asset writer input that is already attached to a metadata adaptor";
LABEL_19:
    uint64_t v19 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)v26, v21, v22, v23, v24, v25, (uint64_t)v31);
LABEL_20:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v19 userInfo:0]);
  }
  if ([(AVAssetWriterInput *)input _status])
  {
    v27 = v6;
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Cannot create a new metadata adaptor with an asset writer input that has already started writing";
    goto LABEL_19;
  }
  if (![(AVAssetWriterInput *)input sourceFormatHint])
  {
    v28 = v6;
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v26 = @"Cannot create a new metadata adaptor with an asset writer that does not carry a source format hint";
    goto LABEL_19;
  }
  if (CMFormatDescriptionGetMediaSubType([(AVAssetWriterInput *)input sourceFormatHint]) != 1835360888)
  {
    v29 = v6;
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    AVStringForOSType(0x6D656278u);
    v26 = @"%@ only knows how to produce data with media subtype '%@', so it must be initialized with an instance of AVAssetWriterInput that is expecting data in that format";
    goto LABEL_19;
  }
  if (v6)
  {
    v7 = objc_alloc_init(AVAssetWriterInputMetadataAdaptorInternal);
    v6->_internal = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_internal->input = input;
      [(AVAssetWriterInput *)v6->_internal->input _setAttachedAdaptor:v6];
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputMetadataAdaptor;
  [(AVAssetWriterInputMetadataAdaptor *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, assetWriterInput = %@>", NSStringFromClass(v4), self, -[AVAssetWriterInputMetadataAdaptor assetWriterInput](self, "assetWriterInput")];
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_internal->input;
}

- (BOOL)appendTimedMetadataGroup:(AVTimedMetadataGroup *)timedMetadataGroup
{
  id v35 = 0;
  if (!timedMetadataGroup)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "group != nil";
LABEL_18:
    uint64_t v31 = (uint64_t)v18;
    uint64_t v19 = @"invalid parameter not satisfying: %s";
    goto LABEL_19;
  }
  [(AVTimedMetadataGroup *)timedMetadataGroup timeRange];
  if ((v34 & 0x1D) != 1)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "CMTIME_IS_NUMERIC([group timeRange].start)";
    goto LABEL_18;
  }
  [(AVTimedMetadataGroup *)timedMetadataGroup timeRange];
  if (v33)
  {
    [(AVTimedMetadataGroup *)timedMetadataGroup timeRange];
    if ((v32 & 8) != 0)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v18 = "! CMTIME_IS_NEGATIVE_INFINITY([group timeRange].duration)";
      goto LABEL_18;
    }
  }
  int64_t v11 = [[(AVAssetWriterInputMetadataAdaptor *)self assetWriterInput] _status];
  if ((unint64_t)(v11 - 1) >= 4)
  {
    if (v11)
    {
      int64_t v13 = 0;
      return v13 == 0;
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3B8];
    uint64_t v19 = @"Cannot invoke method before the attached asset writer input has been added to an asset writer and -startWriting has been called on that asset writer";
LABEL_19:
    v20 = objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v3, v4, v5, v6, v7, v31), 0);
    objc_exception_throw(v20);
  }
  uint64_t v12 = [(AVTimedMetadataGroup *)timedMetadataGroup _createSerializedRepresentationWithFormatDescription:[[(AVAssetWriterInputMetadataAdaptor *)self assetWriterInput] sourceFormatHint] error:&v35];
  if (v12)
  {
    int64_t v13 = [[(AVAssetWriterInputMetadataAdaptor *)self assetWriterInput] _appendSampleBuffer:v12 error:&v35];
    if (v13 != 1) {
      goto LABEL_8;
    }
  }
  if ([v35 code] == -11999)
  {
    uint64_t v21 = objc_msgSend((id)objc_msgSend(v35, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    uint64_t v22 = [v21 reason];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = [v21 name];
    if (v22) {
      [NSString stringWithFormat:@": %@", v22];
    }
    v30 = (void *)[v23 exceptionWithName:v29, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot write to file timed metadata group %p%@", v24, v25, v26, v27, v28, (uint64_t)timedMetadataGroup), 0 reason userInfo];
    if (v12) {
      CFRelease(v12);
    }
    objc_exception_throw(v30);
  }
  v15 = [(AVAssetWriterInputMetadataAdaptor *)self assetWriterInput];
  [(AVAssetWriterInput *)v15 _tellAssetWriterToTransitionToFailedStatusWithError:v35];
  int64_t v13 = 1;
  if (v12) {
LABEL_8:
  }
    CFRelease(v12);
  return v13 == 0;
}

@end