@interface AVAssetWriterInputCaptionAdaptor
+ (AVAssetWriterInputCaptionAdaptor)assetWriterInputCaptionAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input;
- (AVAssetWriterInput)assetWriterInput;
- (AVAssetWriterInputCaptionAdaptor)init;
- (AVAssetWriterInputCaptionAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input;
- (BOOL)appendCaption:(AVCaption *)caption;
- (BOOL)appendCaptionGroup:(AVCaptionGroup *)captionGroup;
- (void)dealloc;
@end

@implementation AVAssetWriterInputCaptionAdaptor

+ (AVAssetWriterInputCaptionAdaptor)assetWriterInputCaptionAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAssetWriterInput:input];
  return (AVAssetWriterInputCaptionAdaptor *)v3;
}

- (AVAssetWriterInputCaptionAdaptor)init
{
  v4 = self;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  v7 = NSStringFromSelector(sel_initWithAssetWriterInput_);
  v13 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v8, v9, v10, v11, v12, (uint64_t)v7), 0 reason userInfo];
  objc_exception_throw(v13);
}

- (AVAssetWriterInputCaptionAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input
{
  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputCaptionAdaptor;
  v5 = [(AVAssetWriterInputCaptionAdaptor *)&v28 init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (input)
    {
      if (objc_msgSend((id)AVMediaTypesForCaptionEditing(), "containsObject:", -[AVAssetWriterInput mediaType](input, "mediaType")))
      {
        if ([(AVAssetWriterInput *)input _isAttachedToAdaptor])
        {
          v25 = v6;
          uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v11 = *MEMORY[0x1E4F1C3C8];
          v24 = @"Cannot create a new caption adaptor with an asset writer input that is already attached to a caption adaptor";
        }
        else
        {
          if (![(AVAssetWriterInput *)input _status])
          {
            v7 = objc_alloc_init(AVAssetWriterInputCaptionAdaptorInternal);
            v6->_internal = v7;
            if (v7)
            {
              v6->_internal->assetWriterInput = input;
              CFRetain(v6->_internal);
              [(AVAssetWriterInput *)input _setAttachedAdaptor:v6];
            }
            else
            {

              return 0;
            }
            return v6;
          }
          v26 = v6;
          uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v11 = *MEMORY[0x1E4F1C3C8];
          v24 = @"Cannot create a new caption adaptor with an asset writer input that has already started writing";
        }
      }
      else
      {
        v18 = v6;
        uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v11 = *MEMORY[0x1E4F1C3C8];
        v24 = @"Cannot create a new caption adaptor with an unsupported media type";
      }
      uint64_t v17 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)v24, v19, v20, v21, v22, v23, v27);
    }
    else
    {
      uint64_t v9 = v5;
      uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      uint64_t v17 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)"input != nil");
    }
    objc_exception_throw((id)[v10 exceptionWithName:v11 reason:v17 userInfo:0]);
  }
  return v6;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    if (v4) {
      CFRelease(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterInputCaptionAdaptor;
  [(AVAssetWriterInputCaptionAdaptor *)&v5 dealloc];
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_internal->assetWriterInput;
}

- (BOOL)appendCaption:(AVCaption *)caption
{
  if (!caption)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "caption != NULL";
    goto LABEL_15;
  }
  [(AVCaption *)caption timeRange];
  if ((v34 & 1) == 0
    || ([(AVCaption *)caption timeRange], (v33 & 1) == 0)
    || ([(AVCaption *)caption timeRange], v32)
    || ([(AVCaption *)caption timeRange], v31 < 0))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "CMTIMERANGE_IS_VALID(caption.timeRange)";
LABEL_15:
    uint64_t v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)v15);
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    goto LABEL_16;
  }
  [(AVCaption *)caption timeRange];
  if ((v30 & 0x1D) != 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "CMTIME_IS_NUMERIC(caption.timeRange.start)";
    goto LABEL_15;
  }
  [(AVCaption *)caption timeRange];
  if ((v29 & 0x1D) != 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "CMTIME_IS_NUMERIC(caption.timeRange.duration)";
    goto LABEL_15;
  }
  id v28 = 0;
  int64_t v11 = [[(AVAssetWriterInputCaptionAdaptor *)self assetWriterInput] _appendCaption:(id)[(AVCaption *)caption copy] error:&v28];
  if (v11 == 1 && [v28 code] == -11999)
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = [v19 name];
    uint64_t v22 = [v19 reason];
    uint64_t v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot append caption: %@", v23, v24, v25, v26, v27, v22);
    uint64_t v17 = v20;
    uint64_t v18 = v21;
LABEL_16:
    objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v16 userInfo:0]);
  }
  return v11 == 0;
}

- (BOOL)appendCaptionGroup:(AVCaptionGroup *)captionGroup
{
  if (!captionGroup)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "captionGroup != NULL";
    goto LABEL_15;
  }
  [(AVCaptionGroup *)captionGroup timeRange];
  if ((v34 & 1) == 0
    || ([(AVCaptionGroup *)captionGroup timeRange], (v33 & 1) == 0)
    || ([(AVCaptionGroup *)captionGroup timeRange], v32)
    || ([(AVCaptionGroup *)captionGroup timeRange], v31 < 0))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "CMTIMERANGE_IS_VALID(captionGroup.timeRange)";
LABEL_15:
    uint64_t v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)v15);
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    goto LABEL_16;
  }
  [(AVCaptionGroup *)captionGroup timeRange];
  if ((v30 & 0x1D) != 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "CMTIME_IS_NUMERIC(captionGroup.timeRange.start)";
    goto LABEL_15;
  }
  [(AVCaptionGroup *)captionGroup timeRange];
  if ((v29 & 0x1D) != 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    uint64_t v15 = "CMTIME_IS_NUMERIC(captionGroup.timeRange.duration)";
    goto LABEL_15;
  }
  id v28 = 0;
  int64_t v11 = [[(AVAssetWriterInputCaptionAdaptor *)self assetWriterInput] _appendCaptionGroup:captionGroup error:&v28];
  if (v11 == 1 && [v28 code] == -11999)
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = [v19 name];
    uint64_t v22 = [v19 reason];
    uint64_t v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot append caption group: %@", v23, v24, v25, v26, v27, v22);
    uint64_t v17 = v20;
    uint64_t v18 = v21;
LABEL_16:
    objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v16 userInfo:0]);
  }
  return v11 == 0;
}

@end