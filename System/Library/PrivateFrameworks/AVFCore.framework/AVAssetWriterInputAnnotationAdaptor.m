@interface AVAssetWriterInputAnnotationAdaptor
+ (id)assetWriterInputAnnotationAdaptorWithAssetWriterInput:(id)a3;
+ (opaqueCMFormatDescription)annotationFormatDescription;
+ (void)initialize;
- (AVAssetWriterInput)assetWriterInput;
- (AVAssetWriterInputAnnotationAdaptor)init;
- (AVAssetWriterInputAnnotationAdaptor)initWithAssetWriterInput:(id)a3;
- (BOOL)appendAnnotation:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation AVAssetWriterInputAnnotationAdaptor

+ (void)initialize
{
}

+ (id)assetWriterInputAnnotationAdaptorWithAssetWriterInput:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAssetWriterInput:a3];
  return v3;
}

+ (opaqueCMFormatDescription)annotationFormatDescription
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  v3 = objc_alloc_init(AVMutableMetadataItem);
  [(AVMutableMetadataItem *)v3 setIdentifier:@"mdta/com.apple.quicktime.annotation.body"];
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  long long v8 = *(_OWORD *)&start.value;
  CMTimeEpoch epoch = start.epoch;
  [(AVMutableMetadataItem *)v3 setTime:&start];
  [(AVMutableMetadataItem *)v3 setDataType:*MEMORY[0x1E4F1EFF0]];
  [v2 addObject:v3];
  v5 = objc_alloc_init(AVMutableMetadataItem);
  [(AVMutableMetadataItem *)v5 setIdentifier:@"mdta/com.apple.quicktime.annotation.representation"];
  *(_OWORD *)&start.value = v8;
  start.CMTimeEpoch epoch = epoch;
  [(AVMutableMetadataItem *)v5 setTime:&start];
  [(AVMutableMetadataItem *)v5 setDataType:*MEMORY[0x1E4F1F020]];
  [v2 addObject:v5];
  v6 = [AVMutableTimedMetadataGroup alloc];
  CMTimeMake(&duration, 1, 1000);
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeRangeMake(&v10, &start, &duration);
  return [(AVTimedMetadataGroup *)[(AVMutableTimedMetadataGroup *)v6 initWithItems:v2 timeRange:&v10] copyFormatDescription];
}

- (AVAssetWriterInputAnnotationAdaptor)init
{
  v4 = self;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3A8];
  v7 = NSStringFromSelector(sel_initWithAssetWriterInput_);
  v13 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v8, v9, v10, v11, v12, (uint64_t)v7), 0 reason userInfo];
  objc_exception_throw(v13);
}

- (AVAssetWriterInputAnnotationAdaptor)initWithAssetWriterInput:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputAnnotationAdaptor;
  v5 = [(AVAssetWriterInputAnnotationAdaptor *)&v28 init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (a3)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqual:", @"meta"))
      {
        if ([a3 _isAttachedToAdaptor])
        {
          v19 = v6;
          v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = *MEMORY[0x1E4F1C3C8];
          v25 = @"Cannot create a new annotation adaptor with an asset writer input that is already attached to an annotation adaptor";
        }
        else
        {
          if (![a3 _status])
          {
            v6->_assetWriterInputMetadataAdaptor = +[AVAssetWriterInputMetadataAdaptor assetWriterInputMetadataAdaptorWithAssetWriterInput:a3];
            v6->_assetWriterInput = (AVAssetWriterInput *)a3;
            [a3 _setAttachedAdaptor:v6];
            return v6;
          }
          v26 = v6;
          v14 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v15 = *MEMORY[0x1E4F1C3C8];
          v25 = @"Cannot create a new annotation adaptor with an asset writer input that has already started writing";
        }
        uint64_t v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, (uint64_t)v25, v20, v21, v22, v23, v24, v27);
LABEL_14:
        objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v18 userInfo:0]);
      }
      v17 = v6;
      v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      v16 = "[[input mediaType] isEqual:AVMediaTypeMetadata]";
    }
    else
    {
      uint64_t v8 = v5;
      v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = *MEMORY[0x1E4F1C3C8];
      v16 = "input != nil";
    }
    uint64_t v18 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)v16);
    goto LABEL_14;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputAnnotationAdaptor;
  [(AVAssetWriterInputAnnotationAdaptor *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, assetWriterInput = %@>", NSStringFromClass(v4), self, -[AVAssetWriterInputAnnotationAdaptor assetWriterInput](self, "assetWriterInput")];
}

- (AVAssetWriterInput)assetWriterInput
{
  v2 = self->_assetWriterInput;
  return v2;
}

- (BOOL)appendAnnotation:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v57 = 0;
  if (!a3)
  {
    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = *MEMORY[0x1E4F1C3C8];
    v32 = "annotation != nil";
LABEL_33:
    uint64_t v40 = (uint64_t)v32;
    v36 = @"invalid parameter not satisfying: %s";
    goto LABEL_34;
  }
  [a3 timeRange];
  if ((v56 & 0x1D) != 1)
  {
    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = *MEMORY[0x1E4F1C3C8];
    v32 = "CMTIME_IS_NUMERIC([annotation timeRange].start)";
    goto LABEL_33;
  }
  [a3 timeRange];
  if (v55)
  {
    [a3 timeRange];
    if ((v54 & 8) != 0)
    {
      v30 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v31 = *MEMORY[0x1E4F1C3C8];
      v32 = "! CMTIME_IS_NEGATIVE_INFINITY([annotation timeRange].duration)";
      goto LABEL_33;
    }
  }
  int64_t v11 = [[(AVAssetWriterInputAnnotationAdaptor *)self assetWriterInput] _status];
  if ((unint64_t)(v11 - 1) >= 4)
  {
    if (v11) {
      return 1;
    }
    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = *MEMORY[0x1E4F1C3B8];
    v36 = @"Cannot invoke method before the attached asset writer input has been added to an asset writer and -startWriting has been called on that asset writer";
LABEL_34:
    v37 = (objc_class *)self;
    v38 = a2;
    goto LABEL_37;
  }
  SEL v41 = a2;
  v42 = self;
  [[(AVAssetWriterInputAnnotationAdaptor *)self assetWriterInput] sourceFormatHint];
  id v52 = 0;
  uint64_t v53 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v49 = 0u;
  [a3 timeRange];
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  [a3 getJSONData:&v53 representationBinaryDataBindings:&v52];
  uint64_t v13 = objc_alloc_init(AVMutableMetadataItem);
  [(AVMutableMetadataItem *)v13 setIdentifier:0x1EE598378];
  [(AVMutableMetadataItem *)v13 setDataType:*MEMORY[0x1E4F1EFF0]];
  uint64_t v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v53 options:0 error:&v57];
  if (!v14)
  {
LABEL_24:
    uint64_t v27 = v42;
    goto LABEL_25;
  }
  [(AVMutableMetadataItem *)v13 setValue:v14];
  [v12 addObject:v13];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v52;
  uint64_t v15 = [v52 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (!v15) {
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v46;
  uint64_t v18 = *MEMORY[0x1E4F1F020];
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      uint64_t v21 = [v20 objectForKey:0x1EE591BB8];
      if ([v20 objectForKey:0x1EE5983B8]) {
        BOOL v22 = v21 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        id v57 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11883, 0);
        goto LABEL_24;
      }
      id v23 = +[AVAnnotationRepresentation _createMetadataItemPayloadForDataBinding:v20 error:&v57];
      if (!v23) {
        goto LABEL_24;
      }
      id v24 = v23;
      v25 = objc_alloc_init(AVMutableMetadataItem);
      [(AVMutableMetadataItem *)v25 setIdentifier:0x1EE598398];
      [(AVMutableMetadataItem *)v25 setDataType:v18];
      [(AVMutableMetadataItem *)v25 setValue:v24];
      [v12 addObject:v25];
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  }
  while (v16);
LABEL_19:
  v26 = [AVTimedMetadataGroup alloc];
  v44[0] = v49;
  v44[1] = v50;
  v44[2] = v51;
  uint64_t v27 = v42;
  if ([(AVAssetWriterInputMetadataAdaptor *)v42->_assetWriterInputMetadataAdaptor appendTimedMetadataGroup:[(AVTimedMetadataGroup *)v26 initWithItems:v12 timeRange:v44]])
  {
    return 1;
  }
LABEL_25:
  if ([v57 code] == -11999)
  {
    v33 = objc_msgSend((id)objc_msgSend(v57, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
    uint64_t v34 = [v33 reason];
    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = [v33 name];
    if (v34) {
      v35 = (__CFString *)[NSString stringWithFormat:@": %@", v34];
    }
    else {
      v35 = &stru_1EE5953B8;
    }
    uint64_t v40 = (uint64_t)v35;
    v36 = @"Cannot write annotation to file %@";
    v38 = v41;
    v37 = (objc_class *)v42;
LABEL_37:
    v39 = objc_msgSend(v30, "exceptionWithName:reason:userInfo:", v31, AVMethodExceptionReasonWithObjectAndSelector(v37, v38, (uint64_t)v36, v3, v4, v5, v6, v7, v40), 0);
    objc_exception_throw(v39);
  }
  v29 = [(AVAssetWriterInputAnnotationAdaptor *)v27 assetWriterInput];
  [(AVAssetWriterInput *)v29 _tellAssetWriterToTransitionToFailedStatusWithError:v57];
  return 0;
}

@end