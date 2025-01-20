@interface AVMetadataFaceObject
+ (AVMetadataFaceObject)faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataFaceObject)initWithFaceID:(int64_t)a3 hasRollAngle:(BOOL)a4 rollAngle:(double)a5 hasYawAngle:(BOOL)a6 yawAngle:(double)a7 hasPitchAngle:(BOOL)a8 pitchAngle:(double)a9 time:(id *)a10 duration:(id *)a11 bounds:(CGRect)a12;
- (AVMetadataFaceObject)initWithFaceID:(int64_t)a3 hasRollAngle:(BOOL)a4 rollAngle:(double)a5 hasYawAngle:(BOOL)a6 yawAngle:(double)a7 hasPitchAngle:(BOOL)a8 pitchAngle:(double)a9 time:(id *)a10 duration:(id *)a11 bounds:(CGRect)a12 optionalInfoDict:(id)a13 originalMetadataObject:(id)a14 sourceCaptureInput:(id)a15;
- (AVMetadataFaceObject)initWithFigEmbeddedCaptureDeviceFaceDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataFaceObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9;
- (BOOL)hasConfidence;
- (BOOL)hasDistance;
- (BOOL)hasLeftEyeBounds;
- (BOOL)hasLeftEyeClosedConfidence;
- (BOOL)hasOrientation;
- (BOOL)hasPayingAttention;
- (BOOL)hasPayingAttentionConfidence;
- (BOOL)hasPitchAngle;
- (BOOL)hasRightEyeBounds;
- (BOOL)hasRightEyeClosedConfidence;
- (BOOL)hasRollAngle;
- (BOOL)hasSmileConfidence;
- (BOOL)hasYawAngle;
- (BOOL)isEqual:(id)a3;
- (BOOL)payingAttention;
- (CGFloat)rollAngle;
- (CGFloat)yawAngle;
- (CGRect)leftEyeBounds;
- (CGRect)rightEyeBounds;
- (NSInteger)faceID;
- (double)confidence;
- (double)distance;
- (double)payingAttentionConfidence;
- (double)pitchAngle;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (int)leftEyeClosedConfidence;
- (int)rightEyeClosedConfidence;
- (int)smileConfidence;
- (unint64_t)orientation;
- (void)dealloc;
@end

@implementation AVMetadataFaceObject

- (AVMetadataFaceObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  return -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", 0, 0, 0, 0, &v11, &v10, 0.0, 0.0, 0.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7, a8, a9);
}

- (AVMetadataFaceObject)initWithFaceID:(int64_t)a3 hasRollAngle:(BOOL)a4 rollAngle:(double)a5 hasYawAngle:(BOOL)a6 yawAngle:(double)a7 hasPitchAngle:(BOOL)a8 pitchAngle:(double)a9 time:(id *)a10 duration:(id *)a11 bounds:(CGRect)a12
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a11;
  return -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, a4, a6, a8, &v14, &v13, a5, a7, a9, a12.origin.x, a12.origin.y, a12.size.width, a12.size.height, 0, 0, 0);
}

- (AVMetadataFaceObject)initWithFaceID:(int64_t)a3 hasRollAngle:(BOOL)a4 rollAngle:(double)a5 hasYawAngle:(BOOL)a6 yawAngle:(double)a7 hasPitchAngle:(BOOL)a8 pitchAngle:(double)a9 time:(id *)a10 duration:(id *)a11 bounds:(CGRect)a12 optionalInfoDict:(id)a13 originalMetadataObject:(id)a14 sourceCaptureInput:(id)a15
{
  BOOL v15 = a8;
  BOOL v16 = a6;
  BOOL v17 = a4;
  v48.receiver = self;
  v48.super_class = (Class)AVMetadataFaceObject;
  v46.origin = *(CGPoint *)&a10->var0;
  *(void *)&v46.size.width = a10->var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47 = *a11;
  v22 = [(AVMetadataObject *)&v48 initWithType:@"face", &v46, &v47, a13, a14, a15, a12.origin.x, a12.origin.y, a12.size.width, a12.size.height time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v22)
  {
    v23 = objc_alloc_init(AVMetadataFaceObjectInternal);
    v22->_internal = v23;
    if (v23)
    {
      [(AVMetadataFaceObjectInternal *)v23 setFaceID:a3];
      [(AVMetadataFaceObjectInternal *)v22->_internal setHasRollAngle:v17];
      if (v17) {
        [(AVMetadataFaceObjectInternal *)v22->_internal setRollAngle:a5];
      }
      [(AVMetadataFaceObjectInternal *)v22->_internal setHasYawAngle:v16];
      if (v16) {
        [(AVMetadataFaceObjectInternal *)v22->_internal setYawAngle:a7];
      }
      [(AVMetadataFaceObjectInternal *)v22->_internal setHasPitchAngle:v15];
      if (v15) {
        [(AVMetadataFaceObjectInternal *)v22->_internal setPitchAngle:a9];
      }
      if (a13)
      {
        uint64_t v24 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F52380]];
        if (v24)
        {
          v25 = (void *)v24;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasLeftEyeClosedConfidence:1];
          -[AVMetadataFaceObjectInternal setLeftEyeClosedConfidence:](v22->_internal, "setLeftEyeClosedConfidence:", [v25 intValue]);
        }
        uint64_t v26 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F52388]];
        if (v26)
        {
          v27 = (void *)v26;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasRightEyeClosedConfidence:1];
          -[AVMetadataFaceObjectInternal setRightEyeClosedConfidence:](v22->_internal, "setRightEyeClosedConfidence:", [v27 intValue]);
        }
        uint64_t v28 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F52410]];
        if (v28)
        {
          v29 = (void *)v28;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasSmileConfidence:1];
          -[AVMetadataFaceObjectInternal setSmileConfidence:](v22->_internal, "setSmileConfidence:", [v29 intValue]);
        }
        CFDictionaryRef v30 = (const __CFDictionary *)[a13 objectForKeyedSubscript:*MEMORY[0x1E4F523E0]];
        uint64_t v31 = MEMORY[0x1E4F1DB28];
        if (v30)
        {
          CGSize v32 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
          v46.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
          v46.size = v32;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasLeftEyeBounds:CGRectMakeWithDictionaryRepresentation(v30, &v46)];
          -[AVMetadataFaceObjectInternal setLeftEyeBounds:](v22->_internal, "setLeftEyeBounds:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
        }
        CFDictionaryRef v33 = (const __CFDictionary *)[a13 objectForKeyedSubscript:*MEMORY[0x1E4F52400]];
        if (v33)
        {
          CGSize v34 = *(CGSize *)(v31 + 16);
          v46.origin = *(CGPoint *)v31;
          v46.size = v34;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasRightEyeBounds:CGRectMakeWithDictionaryRepresentation(v33, &v46)];
          -[AVMetadataFaceObjectInternal setRightEyeBounds:](v22->_internal, "setRightEyeBounds:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
        }
        uint64_t v35 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F52390]];
        if (v35)
        {
          v36 = (void *)v35;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasConfidence:1];
          -[AVMetadataFaceObjectInternal setConfidence:](v22->_internal, "setConfidence:", (float)((float)(int)[v36 intValue] / 1000.0));
        }
        uint64_t v37 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F52370]];
        if (v37)
        {
          v38 = (void *)v37;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasPayingAttention:1];
          -[AVMetadataFaceObjectInternal setPayingAttention:](v22->_internal, "setPayingAttention:", [v38 BOOLValue]);
          v39 = (void *)[a13 objectForKeyedSubscript:*MEMORY[0x1E4F52378]];
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasPayingAttentionConfidence:1];
          -[AVMetadataFaceObjectInternal setPayingAttentionConfidence:](v22->_internal, "setPayingAttentionConfidence:", (float)((float)(int)[v39 intValue] / 1000.0));
        }
        else
        {
          [a13 objectForKeyedSubscript:*MEMORY[0x1E4F52378]];
        }
        uint64_t v41 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F523B0]];
        if (v41)
        {
          v42 = (void *)v41;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasDistance:1];
          -[AVMetadataFaceObjectInternal setDistance:](v22->_internal, "setDistance:", (double)(int)[v42 intValue]);
        }
        uint64_t v43 = [a13 objectForKeyedSubscript:*MEMORY[0x1E4F523C0]];
        if (v43)
        {
          v44 = (void *)v43;
          [(AVMetadataFaceObjectInternal *)v22->_internal setHasOrientation:1];
          uint64_t v40 = (int)[v44 intValue];
          goto LABEL_33;
        }
      }
      else if (a14 && [a14 isMemberOfClass:objc_opt_class()])
      {
        -[AVMetadataFaceObjectInternal setHasLeftEyeClosedConfidence:](v22->_internal, "setHasLeftEyeClosedConfidence:", [*((id *)a14 + 2) hasLeftEyeClosedConfidence]);
        -[AVMetadataFaceObjectInternal setLeftEyeClosedConfidence:](v22->_internal, "setLeftEyeClosedConfidence:", [*((id *)a14 + 2) leftEyeClosedConfidence]);
        -[AVMetadataFaceObjectInternal setHasRightEyeClosedConfidence:](v22->_internal, "setHasRightEyeClosedConfidence:", [*((id *)a14 + 2) hasRightEyeClosedConfidence]);
        -[AVMetadataFaceObjectInternal setRightEyeClosedConfidence:](v22->_internal, "setRightEyeClosedConfidence:", [*((id *)a14 + 2) rightEyeClosedConfidence]);
        -[AVMetadataFaceObjectInternal setHasSmileConfidence:](v22->_internal, "setHasSmileConfidence:", [*((id *)a14 + 2) hasSmileConfidence]);
        -[AVMetadataFaceObjectInternal setSmileConfidence:](v22->_internal, "setSmileConfidence:", [*((id *)a14 + 2) smileConfidence]);
        -[AVMetadataFaceObjectInternal setHasLeftEyeBounds:](v22->_internal, "setHasLeftEyeBounds:", [*((id *)a14 + 2) hasLeftEyeBounds]);
        [*((id *)a14 + 2) leftEyeBounds];
        -[AVMetadataFaceObjectInternal setLeftEyeBounds:](v22->_internal, "setLeftEyeBounds:");
        -[AVMetadataFaceObjectInternal setHasRightEyeBounds:](v22->_internal, "setHasRightEyeBounds:", [*((id *)a14 + 2) hasRightEyeBounds]);
        [*((id *)a14 + 2) rightEyeBounds];
        -[AVMetadataFaceObjectInternal setRightEyeBounds:](v22->_internal, "setRightEyeBounds:");
        -[AVMetadataFaceObjectInternal setHasPayingAttention:](v22->_internal, "setHasPayingAttention:", [*((id *)a14 + 2) hasPayingAttention]);
        -[AVMetadataFaceObjectInternal setPayingAttention:](v22->_internal, "setPayingAttention:", [*((id *)a14 + 2) payingAttention]);
        -[AVMetadataFaceObjectInternal setHasPayingAttentionConfidence:](v22->_internal, "setHasPayingAttentionConfidence:", [*((id *)a14 + 2) hasPayingAttentionConfidence]);
        -[AVMetadataFaceObjectInternal setHasPayingAttention:](v22->_internal, "setHasPayingAttention:", [*((id *)a14 + 2) hasPayingAttention]);
        -[AVMetadataFaceObjectInternal setHasDistance:](v22->_internal, "setHasDistance:", [*((id *)a14 + 2) hasDistance]);
        [*((id *)a14 + 2) distance];
        -[AVMetadataFaceObjectInternal setDistance:](v22->_internal, "setDistance:");
        -[AVMetadataFaceObjectInternal setHasOrientation:](v22->_internal, "setHasOrientation:", [*((id *)a14 + 2) hasOrientation]);
        uint64_t v40 = [*((id *)a14 + 2) orientation];
LABEL_33:
        [(AVMetadataFaceObjectInternal *)v22->_internal setOrientation:v40];
      }
    }
    else
    {

      return 0;
    }
  }
  return v22;
}

+ (AVMetadataFaceObject)faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceFaceDictionary:a3 input:a4 timeStamp:a5];

  return (AVMetadataFaceObject *)v5;
}

- (AVMetadataFaceObject)initWithFigEmbeddedCaptureDeviceFaceDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  long long v31 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v35.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v35.epoch = v8;
  v9 = (double *)MEMORY[0x1E4F1DB28];
  if (a5)
  {
    [a5 longLongValue];
    int64_t v10 = FigHostTimeToNanoseconds();
    CMTimeMake(&v35, v10, 1000000000);
  }
  double v11 = *v9;
  double v12 = v9[1];
  double v13 = v9[2];
  double v14 = v9[3];
  CFDictionaryRef v15 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F523F8]];
  if (v15)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v15, &rect))
    {
      double v11 = rect.origin.x - rect.size.width * 0.119999997 * 0.5;
      double v13 = rect.size.width + rect.size.width * 0.119999997;
      double v12 = rect.origin.y - rect.size.height * 0.119999997 * 0.5;
      double v14 = rect.size.height + rect.size.height * 0.119999997;
    }
  }
  BOOL v16 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F523B8]];
  if (v16 || (BOOL v16 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F522C8]]) != 0) {
    uint64_t v17 = [v16 integerValue];
  }
  else {
    uint64_t v17 = 0;
  }
  v18 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52360]];
  v19 = v18;
  double v20 = 0.0;
  double v21 = 0.0;
  if (v18)
  {
    [v18 floatValue];
    double v21 = v22;
  }
  v23 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52368]];
  uint64_t v24 = v23;
  if (v23)
  {
    [v23 floatValue];
    double v20 = v25;
  }
  uint64_t v26 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52358]];
  v27 = v26;
  if (v26)
  {
    [v26 floatValue];
    double v29 = v28;
  }
  else
  {
    double v29 = 0.0;
  }
  rect.origin = *(CGPoint *)&v35.value;
  *(void *)&rect.size.width = v35.epoch;
  long long v32 = v31;
  CMTimeEpoch v33 = v8;
  return -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v17, v19 != 0, v24 != 0, v27 != 0, &rect, &v32, v21, v20, v29, v11, v12, v13, v14, a3, 0, a4);
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  BOOL v7 = a5;
  uint64_t v11 = [a3 faceID];
  long long v48 = 0uLL;
  CGFloat v49 = 0.0;
  if (a3)
  {
    [a3 time];
    long long v46 = 0uLL;
    uint64_t v47 = 0;
    [a3 duration];
  }
  else
  {
    long long v46 = 0uLL;
    uint64_t v47 = 0;
  }
  CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v45.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v45.size = v12;
  [a3 bounds];
  long long v13 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v44.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v44.c = v13;
  *(_OWORD *)&v44.tdouble x = *(_OWORD *)&a4->tx;
  if (!AVMetadataObjectAdjustBaseClassProperties((uint64_t)&v44, &v45, v14, v15, v16, v17))
  {

    return 0;
  }
  uint64_t v18 = [a3 hasRollAngle];
  double v19 = 0.0;
  double v20 = 0.0;
  if (v18)
  {
    [a3 rollAngle];
    double v22 = v21 + a6;
    if (v7) {
      double v20 = -v22;
    }
    else {
      double v20 = v22;
    }
    double v23 = 360.0;
    if (v20 >= 360.0)
    {
      double v23 = -360.0;
    }
    else if (v20 >= 0.0)
    {
      goto LABEL_15;
    }
    double v20 = v20 + v23;
  }
LABEL_15:
  uint64_t v25 = [a3 hasYawAngle];
  if (v25)
  {
    [a3 yawAngle];
    double v19 = v26;
    if (v7)
    {
      if (v26 <= 0.0) {
        double v19 = -v26;
      }
      else {
        double v19 = 360.0 - v26;
      }
    }
  }
  uint64_t v27 = [a3 hasPitchAngle];
  double v28 = 0.0;
  if (v27)
  {
    [a3 pitchAngle];
    double v28 = v29;
  }
  uint64_t v30 = [a3 input];
  *(_OWORD *)&v44.a = v48;
  v44.c = v49;
  long long v42 = v46;
  uint64_t v43 = v47;
  uint64_t v24 = -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v11, v18, v25, v27, &v44, &v42, v20, v19, v28, *(_OWORD *)&v45.origin, *(_OWORD *)&v45.size, 0, a3, v30);
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasLeftEyeBounds])
  {
    [(AVMetadataFaceObjectInternal *)v24->_internal leftEyeBounds];
    long long v31 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v44.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v44.c = v31;
    *(_OWORD *)&v44.tdouble x = *(_OWORD *)&a4->tx;
    CGRect v51 = CGRectApplyAffineTransform(v50, &v44);
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;
    if (CGRectIsEmpty(v51)) {
      goto LABEL_26;
    }
    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.double width = width;
    v52.size.double height = height;
    if (CGRectIsNull(v52)
      || (v53.origin.double x = x, v53.origin.y = y, v53.size.width = width, v53.size.height = height, CGRectIsInfinite(v53)))
    {
LABEL_26:
      [(AVMetadataFaceObjectInternal *)v24->_internal setHasLeftEyeBounds:0];
    }
    else
    {
      -[AVMetadataFaceObjectInternal setLeftEyeBounds:](v24->_internal, "setLeftEyeBounds:", x, y, width, height);
    }
  }
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasRightEyeBounds])
  {
    [(AVMetadataFaceObjectInternal *)v24->_internal rightEyeBounds];
    long long v36 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v44.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v44.c = v36;
    *(_OWORD *)&v44.tdouble x = *(_OWORD *)&a4->tx;
    CGRect v55 = CGRectApplyAffineTransform(v54, &v44);
    double v37 = v55.origin.x;
    double v38 = v55.origin.y;
    double v39 = v55.size.width;
    double v40 = v55.size.height;
    if (CGRectIsEmpty(v55)) {
      goto LABEL_31;
    }
    v56.origin.double x = v37;
    v56.origin.double y = v38;
    v56.size.double width = v39;
    v56.size.double height = v40;
    if (CGRectIsNull(v56)
      || (v57.origin.double x = v37, v57.origin.y = v38, v57.size.width = v39, v57.size.height = v40, CGRectIsInfinite(v57)))
    {
LABEL_31:
      [(AVMetadataFaceObjectInternal *)v24->_internal setHasRightEyeBounds:0];
    }
    else
    {
      -[AVMetadataFaceObjectInternal setRightEyeBounds:](v24->_internal, "setRightEyeBounds:", v37, v38, v39, v40);
    }
  }
  -[AVMetadataFaceObjectInternal setHasConfidence:](v24->_internal, "setHasConfidence:", [a3 hasConfidence]);
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasConfidence])
  {
    [a3 confidence];
    -[AVMetadataFaceObjectInternal setConfidence:](v24->_internal, "setConfidence:");
  }
  -[AVMetadataFaceObjectInternal setHasPayingAttention:](v24->_internal, "setHasPayingAttention:", [a3 hasPayingAttention]);
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasPayingAttention]) {
    -[AVMetadataFaceObjectInternal setPayingAttention:](v24->_internal, "setPayingAttention:", [a3 payingAttention]);
  }
  -[AVMetadataFaceObjectInternal setHasPayingAttentionConfidence:](v24->_internal, "setHasPayingAttentionConfidence:", [a3 hasPayingAttentionConfidence]);
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasPayingAttentionConfidence])
  {
    [a3 payingAttentionConfidence];
    -[AVMetadataFaceObjectInternal setPayingAttentionConfidence:](v24->_internal, "setPayingAttentionConfidence:");
  }
  -[AVMetadataFaceObjectInternal setHasDistance:](v24->_internal, "setHasDistance:", [a3 hasDistance]);
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasDistance])
  {
    [a3 distance];
    -[AVMetadataFaceObjectInternal setDistance:](v24->_internal, "setDistance:");
  }
  -[AVMetadataFaceObjectInternal setHasOrientation:](v24->_internal, "setHasOrientation:", [a3 hasOrientation]);
  if ([(AVMetadataFaceObjectInternal *)v24->_internal hasOrientation]) {
    -[AVMetadataFaceObjectInternal setOrientation:](v24->_internal, "setOrientation:", [a3 orientation]);
  }
  return v24;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataFaceObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (id)description
{
  [(AVMetadataObject *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = (void *)MEMORY[0x1E4F28E78];
  CGSize v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  NSInteger v14 = [(AVMetadataFaceObject *)self faceID];
  double v15 = -1.0;
  double v16 = -1.0;
  if ([(AVMetadataFaceObject *)self hasRollAngle])
  {
    [(AVMetadataFaceObject *)self rollAngle];
    double v16 = v17;
  }
  if ([(AVMetadataFaceObject *)self hasYawAngle])
  {
    [(AVMetadataFaceObject *)self yawAngle];
    double v15 = v18;
  }
  BOOL v19 = [(AVMetadataFaceObject *)self hasPitchAngle];
  double v20 = -1.0;
  if (v19) {
    [(AVMetadataFaceObject *)self pitchAngle];
  }
  double v21 = (void *)[v11 stringWithFormat:@"<%@: %p, faceID=%d, bounds={%.1f,%.1f %.1fx%.1f}, rollAngle=%.1f, yawAngle=%.1f, pitchAngle=%.1f", v13, self, v14, v4, v6, v8, v10, *(void *)&v16, *(void *)&v15, *(void *)&v20];
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v22 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }
  [v21 appendFormat:@", time=%lld", v22];
  [v21 appendString:@">"];
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  v68.receiver = self;
  v68.super_class = (Class)AVMetadataFaceObject;
  unsigned int v5 = -[AVMetadataObject isEqual:](&v68, sel_isEqual_);
  if (v5)
  {
    NSInteger v6 = [(AVMetadataFaceObject *)self faceID];
    if (v6 != [a3 faceID]) {
      goto LABEL_42;
    }
    int v7 = [(AVMetadataFaceObject *)self hasRollAngle];
    if (v7 != [a3 hasRollAngle]) {
      goto LABEL_42;
    }
    if ([(AVMetadataFaceObject *)self hasRollAngle])
    {
      [(AVMetadataFaceObject *)self rollAngle];
      double v9 = v8;
      [a3 rollAngle];
      if (v9 != v10) {
        goto LABEL_42;
      }
    }
    int v11 = [(AVMetadataFaceObject *)self hasYawAngle];
    if (v11 != [a3 hasYawAngle]) {
      goto LABEL_42;
    }
    if ([(AVMetadataFaceObject *)self hasYawAngle])
    {
      [(AVMetadataFaceObject *)self yawAngle];
      double v13 = v12;
      [a3 yawAngle];
      if (v13 != v14) {
        goto LABEL_42;
      }
    }
    int v15 = [(AVMetadataFaceObject *)self hasPitchAngle];
    if (v15 != [a3 hasPitchAngle]) {
      goto LABEL_42;
    }
    if ([(AVMetadataFaceObject *)self hasPitchAngle])
    {
      [(AVMetadataFaceObject *)self pitchAngle];
      double v17 = v16;
      [a3 pitchAngle];
      if (v17 != v18) {
        goto LABEL_42;
      }
    }
    int v19 = [(AVMetadataFaceObject *)self hasLeftEyeClosedConfidence];
    if (v19 != [a3 hasLeftEyeClosedConfidence]) {
      goto LABEL_42;
    }
    if ([(AVMetadataFaceObject *)self hasLeftEyeClosedConfidence])
    {
      int v20 = [(AVMetadataFaceObject *)self leftEyeClosedConfidence];
      if (v20 != [a3 leftEyeClosedConfidence]) {
        goto LABEL_42;
      }
    }
    int v21 = [(AVMetadataFaceObject *)self hasRightEyeClosedConfidence];
    if (v21 != [a3 hasRightEyeClosedConfidence]) {
      goto LABEL_42;
    }
    if ([(AVMetadataFaceObject *)self hasRightEyeClosedConfidence])
    {
      int v22 = [(AVMetadataFaceObject *)self rightEyeClosedConfidence];
      if (v22 != [a3 rightEyeClosedConfidence]) {
        goto LABEL_42;
      }
    }
    int v23 = [(AVMetadataFaceObject *)self hasSmileConfidence];
    if (v23 != [a3 hasSmileConfidence]) {
      goto LABEL_42;
    }
    if ([(AVMetadataFaceObject *)self hasSmileConfidence])
    {
      int v24 = [(AVMetadataFaceObject *)self smileConfidence];
      if (v24 != [a3 smileConfidence]) {
        goto LABEL_42;
      }
    }
    int v25 = [(AVMetadataFaceObject *)self hasLeftEyeBounds];
    if (v25 != [a3 hasLeftEyeBounds]) {
      goto LABEL_42;
    }
    if (![(AVMetadataFaceObject *)self hasLeftEyeBounds]) {
      goto LABEL_24;
    }
    [(AVMetadataFaceObject *)self leftEyeBounds];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    [a3 leftEyeBounds];
    v71.origin.double x = v34;
    v71.origin.double y = v35;
    v71.size.double width = v36;
    v71.size.double height = v37;
    v69.origin.double x = v27;
    v69.origin.double y = v29;
    v69.size.double width = v31;
    v69.size.double height = v33;
    unsigned int v5 = CGRectEqualToRect(v69, v71);
    if (v5)
    {
LABEL_24:
      int v38 = [(AVMetadataFaceObject *)self hasRightEyeBounds];
      if (v38 != [a3 hasRightEyeBounds]) {
        goto LABEL_42;
      }
      if (![(AVMetadataFaceObject *)self hasRightEyeBounds]) {
        goto LABEL_27;
      }
      [(AVMetadataFaceObject *)self rightEyeBounds];
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      [a3 rightEyeBounds];
      v72.origin.double x = v47;
      v72.origin.double y = v48;
      v72.size.double width = v49;
      v72.size.double height = v50;
      v70.origin.double x = v40;
      v70.origin.double y = v42;
      v70.size.double width = v44;
      v70.size.double height = v46;
      unsigned int v5 = CGRectEqualToRect(v70, v72);
      if (v5)
      {
LABEL_27:
        int v51 = [(AVMetadataFaceObject *)self hasConfidence];
        if (v51 == [a3 hasConfidence])
        {
          [(AVMetadataFaceObject *)self confidence];
          double v53 = v52;
          [a3 confidence];
          if (v53 == v54)
          {
            int v55 = [(AVMetadataFaceObject *)self hasPayingAttention];
            if (v55 == [a3 hasPayingAttention])
            {
              if (![(AVMetadataFaceObject *)self hasPayingAttention]
                || (int v56 = [(AVMetadataFaceObject *)self payingAttention],
                    v56 == [a3 payingAttention]))
              {
                int v57 = [(AVMetadataFaceObject *)self hasPayingAttentionConfidence];
                if (v57 == [a3 hasPayingAttentionConfidence])
                {
                  if (![(AVMetadataFaceObject *)self hasPayingAttentionConfidence]
                    || ([(AVMetadataFaceObject *)self payingAttentionConfidence],
                        double v59 = v58,
                        [a3 payingAttentionConfidence],
                        v59 == v60))
                  {
                    int v61 = [(AVMetadataFaceObject *)self hasDistance];
                    if (v61 == [a3 hasDistance])
                    {
                      if (![(AVMetadataFaceObject *)self hasDistance]
                        || ([(AVMetadataFaceObject *)self distance],
                            double v63 = v62,
                            [a3 distance],
                            v63 == v64))
                      {
                        int v65 = [(AVMetadataFaceObject *)self hasOrientation];
                        if (v65 == [a3 hasOrientation])
                        {
                          if (![(AVMetadataFaceObject *)self hasOrientation]
                            || (unint64_t v66 = [(AVMetadataFaceObject *)self orientation],
                                v66 == [a3 orientation]))
                          {
                            LOBYTE(v5) = 1;
                            return v5;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_42:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (NSInteger)faceID
{
  return [(AVMetadataFaceObjectInternal *)self->_internal faceID];
}

- (BOOL)hasRollAngle
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasRollAngle];
}

- (CGFloat)rollAngle
{
  if ([(AVMetadataFaceObject *)self hasRollAngle])
  {
    internal = self->_internal;
    [(AVMetadataFaceObjectInternal *)internal rollAngle];
  }
  else
  {
    unsigned int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  return result;
}

- (BOOL)hasYawAngle
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasYawAngle];
}

- (CGFloat)yawAngle
{
  if ([(AVMetadataFaceObject *)self hasYawAngle])
  {
    internal = self->_internal;
    [(AVMetadataFaceObjectInternal *)internal yawAngle];
  }
  else
  {
    unsigned int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  return result;
}

- (BOOL)hasLeftEyeClosedConfidence
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasLeftEyeClosedConfidence];
}

- (BOOL)hasRightEyeClosedConfidence
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasRightEyeClosedConfidence];
}

- (int)leftEyeClosedConfidence
{
  if ([(AVMetadataFaceObject *)self hasLeftEyeClosedConfidence])
  {
    internal = self->_internal;
    return [(AVMetadataFaceObjectInternal *)internal leftEyeClosedConfidence];
  }
  else
  {
    unsigned int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0;
  }
}

- (int)rightEyeClosedConfidence
{
  if ([(AVMetadataFaceObject *)self hasRightEyeClosedConfidence])
  {
    internal = self->_internal;
    return [(AVMetadataFaceObjectInternal *)internal rightEyeClosedConfidence];
  }
  else
  {
    unsigned int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0;
  }
}

- (BOOL)hasSmileConfidence
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasSmileConfidence];
}

- (int)smileConfidence
{
  if ([(AVMetadataFaceObject *)self hasSmileConfidence])
  {
    internal = self->_internal;
    return [(AVMetadataFaceObjectInternal *)internal smileConfidence];
  }
  else
  {
    unsigned int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0;
  }
}

- (BOOL)hasLeftEyeBounds
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasLeftEyeBounds];
}

- (BOOL)hasRightEyeBounds
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasRightEyeBounds];
}

- (CGRect)leftEyeBounds
{
  if ([(AVMetadataFaceObject *)self hasLeftEyeBounds])
  {
    [(AVMetadataFaceObjectInternal *)self->_internal leftEyeBounds];
  }
  else
  {
    int v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)rightEyeBounds
{
  if ([(AVMetadataFaceObject *)self hasRightEyeBounds])
  {
    [(AVMetadataFaceObjectInternal *)self->_internal rightEyeBounds];
  }
  else
  {
    int v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)hasPitchAngle
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasPitchAngle];
}

- (double)pitchAngle
{
  if ([(AVMetadataFaceObject *)self hasPitchAngle])
  {
    internal = self->_internal;
    [(AVMetadataFaceObjectInternal *)internal pitchAngle];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  return result;
}

- (BOOL)hasConfidence
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasConfidence];
}

- (double)confidence
{
  if ([(AVMetadataFaceObject *)self hasConfidence])
  {
    internal = self->_internal;
    [(AVMetadataFaceObjectInternal *)internal confidence];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  return result;
}

- (BOOL)hasPayingAttention
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasPayingAttention];
}

- (BOOL)payingAttention
{
  if ([(AVMetadataFaceObject *)self hasPayingAttention])
  {
    internal = self->_internal;
    return [(AVMetadataFaceObjectInternal *)internal payingAttention];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0;
  }
}

- (BOOL)hasPayingAttentionConfidence
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasPayingAttentionConfidence];
}

- (double)payingAttentionConfidence
{
  if ([(AVMetadataFaceObject *)self hasPayingAttentionConfidence])
  {
    internal = self->_internal;
    [(AVMetadataFaceObjectInternal *)internal payingAttentionConfidence];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  return result;
}

- (BOOL)hasDistance
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasDistance];
}

- (double)distance
{
  if ([(AVMetadataFaceObject *)self hasDistance])
  {
    internal = self->_internal;
    [(AVMetadataFaceObjectInternal *)internal distance];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0.0;
  }
  return result;
}

- (BOOL)hasOrientation
{
  return [(AVMetadataFaceObjectInternal *)self->_internal hasOrientation];
}

- (unint64_t)orientation
{
  if ([(AVMetadataFaceObject *)self hasOrientation])
  {
    internal = self->_internal;
    return [(AVMetadataFaceObjectInternal *)internal orientation];
  }
  else
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
    return 0;
  }
}

@end