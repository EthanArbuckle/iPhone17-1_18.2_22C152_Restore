@interface AVMetadataSceneClassificationObject
+ (id)sceneClassificationObjectWithConfidences:(id)a3 input:(id)a4 time:(id *)a5;
- (NSDictionary)confidences;
- (float)_confidenceForKey:(id)a3;
- (float)appCodeSceneConfidence;
- (float)brightStageSceneConfidence;
- (float)documentSceneConfidence;
- (float)foodSceneConfidence;
- (float)indoorSceneConfidence;
- (float)lynxGiftCardSceneConfidence;
- (float)otherCodeSceneConfidence;
- (float)outdoorSceneConfidence;
- (float)qrSceneConfidence;
- (float)standardGiftCardSceneConfidence;
- (float)sunsetSceneConfidence;
- (float)textSceneConfidence;
- (float)waterBodySceneConfidence;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (id)initSceneClassificationObjectWithConfidences:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5;
- (void)dealloc;
@end

@implementation AVMetadataSceneClassificationObject

+ (id)sceneClassificationObjectWithConfidences:(id)a3 input:(id)a4 time:(id *)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  return (id)[v8 initSceneClassificationObjectWithConfidences:a3 time:&v10 sourceCaptureInput:a4];
}

- (id)initSceneClassificationObjectWithConfidences:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVMetadataSceneClassificationObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  long long v8 = *MEMORY[0x1E4F1F9F8];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v6 = [(AVMetadataObject *)&v11 initWithType:@"sceneClassification", &v10, &v8, 0, 0, a5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24) time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v6) {
    v6->_confidences = (NSDictionary *)[a3 copy];
  }
  return v6;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v8 = objc_msgSend(a3, "confidences", a6);
  if (a3) {
    [a3 time];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  return -[AVMetadataSceneClassificationObject initSceneClassificationObjectWithConfidences:time:sourceCaptureInput:](self, "initSceneClassificationObjectWithConfidences:time:sourceCaptureInput:", v8, v10, [a3 input]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataSceneClassificationObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (float)_confidenceForKey:(id)a3
{
  id v3 = [(NSDictionary *)self->_confidences objectForKeyedSubscript:a3];
  if (!v3) {
    return -1.0;
  }

  [v3 floatValue];
  return result;
}

- (float)appCodeSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F52480]];
  return result;
}

- (float)otherCodeSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524B0]];
  return result;
}

- (float)qrSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524C0]];
  return result;
}

- (float)brightStageSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F52488]];
  return result;
}

- (float)documentSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F52490]];
  return result;
}

- (float)foodSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F52498]];
  return result;
}

- (float)indoorSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524A0]];
  return result;
}

- (float)outdoorSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524B8]];
  return result;
}

- (float)lynxGiftCardSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524A8]];
  return result;
}

- (float)standardGiftCardSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524C8]];
  return result;
}

- (float)sunsetSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524D0]];
  return result;
}

- (float)textSceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524D8]];
  return result;
}

- (float)waterBodySceneConfidence
{
  [(AVMetadataSceneClassificationObject *)self _confidenceForKey:*MEMORY[0x1E4F524E0]];
  return result;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v6 = v20;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  v7 = (void *)[v3 stringWithFormat:@"<%@: %p, time=%lld", v5, self, v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  confidences = self->_confidences;
  uint64_t v9 = [(NSDictionary *)confidences countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(confidences);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [(AVMetadataSceneClassificationObject *)self _confidenceForKey:v13];
        [v7 appendFormat:@", %@: %f", v13, v14];
      }
      uint64_t v10 = [(NSDictionary *)confidences countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v10);
  }
  [v7 appendString:@">"];
  return v7;
}

- (NSDictionary)confidences
{
  return self->_confidences;
}

@end