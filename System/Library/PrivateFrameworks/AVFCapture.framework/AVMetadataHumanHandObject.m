@interface AVMetadataHumanHandObject
+ (id)humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataHumanHandObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6;
- (AVMetadataHumanHandObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9;
- (BOOL)hasChirality;
- (BOOL)hasConfidence;
- (double)confidence;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (unint64_t)chirality;
- (void)dealloc;
@end

@implementation AVMetadataHumanHandObject

- (AVMetadataHumanHandObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  v19.receiver = self;
  v19.super_class = (Class)AVMetadataHumanHandObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a5;
  v11 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v19, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a3, &v18, &v17, a7, a8, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  if (v11)
  {
    if (a7)
    {
      v12 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F52390]];
      if (v12)
      {
        v11->_hasConfidence = 1;
        v11->_confidence = (float)((float)(int)[v12 intValue] / 1000.0);
      }
      v13 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F522B8]];
      if (v13)
      {
        v11->_hasChirality = 1;
        uint64_t v14 = (int)[v13 intValue];
LABEL_10:
        v11->_chirality = v14;
      }
    }
    else if (a8 && [a8 isMemberOfClass:objc_opt_class()])
    {
      v11->_hasConfidence = [a8 hasConfidence];
      [a8 confidence];
      v11->_confidence = v15;
      v11->_hasChirality = [a8 hasChirality];
      uint64_t v14 = [a8 chirality];
      goto LABEL_10;
    }
  }
  return v11;
}

+ (id)humanHandObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5 type:@"humanHand"];

  return v5;
}

- (AVMetadataHumanHandObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  long long v18 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v23.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v23.epoch = v9;
  v10 = (double *)MEMORY[0x1E4F1DB28];
  if (a5)
  {
    [a5 longLongValue];
    int64_t v11 = FigHostTimeToNanoseconds();
    CMTimeMake(&v23, v11, 1000000000);
  }
  double x = *v10;
  double y = v10[1];
  double width = v10[2];
  double height = v10[3];
  CFDictionaryRef v16 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F523F8], v18);
  if (v16)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v16, &rect))
    {
      double x = rect.origin.x;
      double y = rect.origin.y;
      double width = rect.size.width;
      double height = rect.size.height;
    }
  }
  rect.origin = *(CGPoint *)&v23.value;
  *(void *)&rect.size.double width = v23.epoch;
  long long v20 = v19;
  CMTimeEpoch v21 = v9;
  return [(AVMetadataHumanHandObject *)self initWithType:@"humanHand", &rect, &v20, a3, 0, a4, x, y, width, height time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVMetadataHumanHandObject;
  [(AVMetadataObject *)&v2 dealloc];
}

- (id)description
{
  [(AVMetadataObject *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  int64_t v11 = (void *)MEMORY[0x1E4F28E78];
  v12 = (objc_class *)objc_opt_class();
  v13 = (void *)[v11 stringWithFormat:@"<%@: %p, objectID=%d, bounds={%.1f,%.1f %.1fx%.1f}", NSStringFromClass(v12), self, -[AVMetadataObject objectID](self, "objectID"), v4, v6, v8, v10];
  if ([(AVMetadataObject *)self groupID] != -1) {
    [v13 appendFormat:@", groupID:(%d)", -[AVMetadataObject groupID](self, "groupID")];
  }
  if ([(AVMetadataHumanHandObject *)self hasConfidence])
  {
    [(AVMetadataHumanHandObject *)self confidence];
    [v13 appendFormat:@", confidence=(%f)", v14];
  }
  if ([(AVMetadataHumanHandObject *)self hasChirality]) {
    [v13 appendFormat:@", chirality=(%d)", -[AVMetadataHumanHandObject chirality](self, "chirality")];
  }
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v13 appendFormat:@", time=%lld", v15];
  [v13 appendString:@">"];
  return v13;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v24.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v24.size = v9;
  [a3 bounds];
  long long v10 = *(_OWORD *)&a4->c;
  v23[0] = *(_OWORD *)&a4->a;
  v23[1] = v10;
  v23[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v23, &v24, v11, v12, v13, v14))
  {
    if (a3)
    {
      [a3 time];
      [a3 duration];
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v16 = objc_msgSend(a3, "input", v17, v18, v19, v20, v21, v22);
    return [(AVMetadataHumanHandObject *)self initWithType:@"humanHand", &v20, &v17, 0, a3, v16, *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  }
  else
  {

    return 0;
  }
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasChirality
{
  return self->_hasChirality;
}

- (unint64_t)chirality
{
  return self->_chirality;
}

@end