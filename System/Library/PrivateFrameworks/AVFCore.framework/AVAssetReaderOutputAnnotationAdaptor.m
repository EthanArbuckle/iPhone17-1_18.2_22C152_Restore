@interface AVAssetReaderOutputAnnotationAdaptor
+ (id)assetReaderOutputAnnotationAdaptorWithAssetReaderTrackOutput:(id)a3;
- (AVAssetReaderOutputAnnotationAdaptor)init;
- (AVAssetReaderOutputAnnotationAdaptor)initWithAssetReaderTrackOutput:(id)a3;
- (AVAssetReaderTrackOutput)assetReaderTrackOutput;
- (id)nextAnnotation;
- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6;
- (void)dealloc;
@end

@implementation AVAssetReaderOutputAnnotationAdaptor

+ (id)assetReaderOutputAnnotationAdaptorWithAssetReaderTrackOutput:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithAssetReaderTrackOutput:a3];
  return v3;
}

- (AVAssetReaderOutputAnnotationAdaptor)init
{
  return [(AVAssetReaderOutputAnnotationAdaptor *)self initWithAssetReaderTrackOutput:0];
}

- (AVAssetReaderOutputAnnotationAdaptor)initWithAssetReaderTrackOutput:(id)a3
{
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (!a3)
  {
    v11 = self;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "trackOutput != nil";
LABEL_10:
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)v19);
    v22 = v17;
    uint64_t v23 = v18;
    goto LABEL_14;
  }
  uint64_t v8 = (uint64_t)v7;
  if ((objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"meta") & 1) == 0)
  {
    v20 = self;
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "[[trackOutput mediaType] isEqualToString:AVMediaTypeMetadata]";
    goto LABEL_10;
  }
  if ([a3 _isAttachedToAdaptor])
  {
    v24 = self;
    v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    uint64_t v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot initialize an instance of %@ with a track output which was used to initialize another instance of %@", v27, v28, v29, v30, v31, v8);
LABEL_13:
    uint64_t v21 = v32;
    v22 = v25;
    uint64_t v23 = v26;
LABEL_14:
    objc_exception_throw((id)[v22 exceptionWithName:v23 reason:v21 userInfo:0]);
  }
  if ([a3 _status] >= 1)
  {
    v33 = self;
    v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3C8];
    uint64_t v32 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot initialize an instance of %@ with a track output which has already progressed beyond AVAssetReaderStatusUnknown", v34, v35, v36, v37, v38, v8);
    goto LABEL_13;
  }
  v39.receiver = self;
  v39.super_class = (Class)AVAssetReaderOutputAnnotationAdaptor;
  v9 = [(AVAssetReaderOutputAnnotationAdaptor *)&v39 init];
  if (v9)
  {
    v9->_trackOutput = (AVAssetReaderTrackOutput *)a3;
    v9->_assetReaderOutputMetadataAdaptor = +[AVAssetReaderOutputMetadataAdaptor assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:a3];
    [a3 _setAttachedAdaptor:v9];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetReaderOutputAnnotationAdaptor;
  [(AVAssetReaderOutputAnnotationAdaptor *)&v3 dealloc];
}

- (int)addExtractionForOutput:(id)a3 figAssetReader:(OpaqueFigAssetReader *)a4 options:(id)a5 withOutputExtactionID:(int *)a6
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "track"), "trackID");
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, int *))(v11 + 24);
  if (!v12) {
    return -12782;
  }
  return v12(a4, v9, a5, a6);
}

- (AVAssetReaderTrackOutput)assetReaderTrackOutput
{
  return self->_trackOutput;
}

- (id)nextAnnotation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v4 = [(AVAssetReaderOutputMetadataAdaptor *)self->_assetReaderOutputMetadataAdaptor nextTimedMetadataGroup];
  if (v4)
  {
    uint64_t v14 = v3;
    v5 = [(AVTimedMetadataGroup *)v4 items];
    v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      uint64_t v10 = *MEMORY[0x1E4F1F020];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqualToString:", 0x1EE598398))
          {
            if (objc_msgSend((id)objc_msgSend(v12, "dataType"), "isEqualToString:", v10))
            {
              [v12 value];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v6, "addObject:", +[AVAnnotationRepresentation _createBindingDictionaryFromMetadataItemPayload:error:](AVAnnotationRepresentation, "_createBindingDictionaryFromMetadataItemPayload:error:", objc_msgSend(v12, "value"), 0));
              }
            }
          }
        }
        uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke;
    v15[3] = &unk_1E57B6740;
    v15[4] = v6;
    objc_super v3 = v14;
    v15[5] = v14;
    [(NSArray *)v5 enumerateObjectsUsingBlock:v15];
  }
  return (id)[v3 firstObject];
}

uint64_t __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqualToString:", 0x1EE598378);
    if (result)
    {
      [a2 value];
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if (result)
      {
        uint64_t v13 = [a2 value];
        id v5 = +[AVAnnotation annotationPropertyListToNonDataBindingsArray:](AVAnnotation, "annotationPropertyListToNonDataBindingsArray:");
        uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v17;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v17 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) objectForKey:0x1EE591BB8];
              uint64_t v11 = *(void **)(a1 + 32);
              v15[0] = MEMORY[0x1E4F143A8];
              v15[1] = 3221225472;
              v15[2] = __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke_2;
              v15[3] = &unk_1E57B2CB8;
              v15[4] = v10;
              uint64_t v12 = [v11 indexOfObjectPassingTest:v15];
              if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
                objc_msgSend(v14, "addObject:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v12));
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v7);
        }
        return objc_msgSend(*(id *)(a1 + 40), "addObject:", -[AVAnnotation initWithJSONData:representationBinaryDataBindings:error:]([AVAnnotation alloc], "initWithJSONData:representationBinaryDataBindings:error:", objc_msgSend(MEMORY[0x1E4F28D90], "dataWithJSONObject:options:error:", v13, 0, 0), v14, 0));
      }
    }
  }
  return result;
}

uint64_t __54__AVAssetReaderOutputAnnotationAdaptor_nextAnnotation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "objectForKey:", 0x1EE591BB8));
  if (result) {
    *a4 = 1;
  }
  return result;
}

@end