@interface AVMetadataObject
+ (id)derivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (AVMetadataObject)init;
- (AVMetadataObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9;
- (AVMetadataObjectType)type;
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (CMTime)duration;
- (CMTime)time;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (id)input;
- (id)originalMetadataObject;
- (int64_t)detectionSource;
- (int64_t)groupID;
- (int64_t)objectID;
- (unint64_t)syntheticFocusMode;
- (void)dealloc;
- (void)setDetectionSource:(int64_t)a3;
@end

@implementation AVMetadataObject

- (AVMetadataObject)init
{
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v3 = v5;
  uint64_t v4 = v6;
  return -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", 0, &v5, &v3, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (AVMetadataObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v37.receiver = self;
  v37.super_class = (Class)AVMetadataObject;
  v19 = [(AVMetadataObject *)&v37 init];
  if (v19)
  {
    objc_opt_class();
    AVRequireConcreteObject();
    v20 = objc_alloc_init(AVMetadataObjectInternal);
    v19->_objectInternal = v20;
    if (v20)
    {
      [(AVMetadataObjectInternal *)v20 setType:a3];
      objectInternal = v19->_objectInternal;
      long long v35 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      [(AVMetadataObjectInternal *)objectInternal setTime:&v35];
      v22 = v19->_objectInternal;
      long long v33 = *(_OWORD *)&a5->var0;
      int64_t v34 = a5->var3;
      [(AVMetadataObjectInternal *)v22 setDuration:&v33];
      -[AVMetadataObjectInternal setBounds:](v19->_objectInternal, "setBounds:", x, y, width, height);
      [(AVMetadataObjectInternal *)v19->_objectInternal setOriginalMetadataObject:a8];
      [(AVMetadataObjectInternal *)v19->_objectInternal setInput:a9];
      if (a7)
      {
        v23 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F522C0]];
        if (v23) {
          -[AVMetadataObjectInternal setGroupID:](v19->_objectInternal, "setGroupID:", [v23 integerValue]);
        }
        v24 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F522C8]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = [a7 objectForKeyedSubscript:*MEMORY[0x1E4F523B8]];
          if (v25) {
            v24 = (void *)v25;
          }
        }
        if (v24) {
          -[AVMetadataObjectInternal setObjectID:](v19->_objectInternal, "setObjectID:", [v24 integerValue]);
        }
        v26 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F512A0]];
        if (v26)
        {
          if ([v26 BOOLValue]) {
            uint64_t v27 = 2;
          }
          else {
            uint64_t v27 = 1;
          }
          [(AVMetadataObjectInternal *)v19->_objectInternal setSyntheticFocusMode:[(AVMetadataObjectInternal *)v19->_objectInternal syntheticFocusMode] | v27];
        }
        v28 = (void *)[a7 objectForKeyedSubscript:*MEMORY[0x1E4F51298]];
        if (!v28 || ![v28 BOOLValue]) {
          goto LABEL_23;
        }
        v29 = v19->_objectInternal;
        uint64_t v30 = [(AVMetadataObjectInternal *)v29 syntheticFocusMode] | 4;
        v31 = v29;
      }
      else
      {
        if (!a8)
        {
LABEL_23:
          -[AVMetadataObjectInternal setDetectionSource:](v19->_objectInternal, "setDetectionSource:", [a8 detectionSource]);
          return v19;
        }
        -[AVMetadataObjectInternal setGroupID:](v19->_objectInternal, "setGroupID:", [a8 groupID]);
        -[AVMetadataObjectInternal setObjectID:](v19->_objectInternal, "setObjectID:", [a8 objectID]);
        uint64_t v30 = [a8 syntheticFocusMode];
        v31 = v19->_objectInternal;
      }
      [(AVMetadataObjectInternal *)v31 setSyntheticFocusMode:v30];
      goto LABEL_23;
    }

    return 0;
  }
  return v19;
}

+ (id)derivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  BOOL v7 = a5;
  id v10 = objc_alloc((Class)objc_opt_class());
  long long v11 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&a4->tx;
  return (id)[v10 initDerivedMetadataObjectFromMetadataObject:a3 withTransform:v13 isVideoMirrored:v7 rollAdjustment:a6];
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self)
  {
    [(AVMetadataObject *)self time];
    if (a3)
    {
LABEL_3:
      [a3 time];
      goto LABEL_6;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (a3) {
      goto LABEL_3;
    }
  }
  memset(&time2, 0, sizeof(time2));
LABEL_6:
  if (CMTimeCompare(&time1, &time2))
  {
LABEL_13:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (self)
  {
    [(AVMetadataObject *)self duration];
    if (a3)
    {
LABEL_9:
      [a3 duration];
      goto LABEL_12;
    }
  }
  else
  {
    memset(&v23, 0, sizeof(v23));
    if (a3) {
      goto LABEL_9;
    }
  }
  memset(&v22, 0, sizeof(v22));
LABEL_12:
  if (CMTimeCompare(&v23, &v22)) {
    goto LABEL_13;
  }
  [(AVMetadataObject *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [a3 bounds];
  v27.origin.double x = v14;
  v27.origin.double y = v15;
  v27.size.double width = v16;
  v27.size.double height = v17;
  v26.origin.double x = v7;
  v26.origin.double y = v9;
  v26.size.double width = v11;
  v26.size.double height = v13;
  BOOL v5 = CGRectEqualToRect(v26, v27);
  if (v5)
  {
    BOOL v5 = -[NSString isEqualToString:](-[AVMetadataObject type](self, "type"), "isEqualToString:", [a3 type]);
    if (v5)
    {
      if (-[AVMetadataObject groupID](self, "groupID") != -1 && [a3 groupID] != -1)
      {
        int64_t v18 = [(AVMetadataObject *)self groupID];
        if (v18 != [a3 groupID]) {
          goto LABEL_13;
        }
      }
      if (-[AVMetadataObject objectID](self, "objectID", v22.value, *(void *)&v22.timescale, v22.epoch, v23.value, *(void *)&v23.timescale, v23.epoch, time2.value, *(void *)&time2.timescale, time2.epoch, time1.value, *(void *)&time1.timescale, time1.epoch) != -1&& [a3 objectID] != -1)
      {
        int64_t v19 = [(AVMetadataObject *)self objectID];
        if (v19 != [a3 objectID]) {
          goto LABEL_13;
        }
      }
      int64_t v20 = [(AVMetadataObject *)self detectionSource];
      LOBYTE(v5) = v20 == [a3 detectionSource];
    }
  }
  return v5;
}

- (CMTime)time
{
  result = (CMTime *)self->_objectInternal;
  if (result) {
    return (CMTime *)[(CMTime *)result time];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CMTime)duration
{
  result = (CMTime *)self->_objectInternal;
  if (result) {
    return (CMTime *)[(CMTime *)result duration];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CGRect)bounds
{
  [(AVMetadataObjectInternal *)self->_objectInternal bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (AVMetadataObjectType)type
{
  return [(AVMetadataObjectInternal *)self->_objectInternal type];
}

- (id)input
{
  return [(AVMetadataObjectInternal *)self->_objectInternal input];
}

- (int64_t)groupID
{
  return [(AVMetadataObjectInternal *)self->_objectInternal groupID];
}

- (int64_t)objectID
{
  return [(AVMetadataObjectInternal *)self->_objectInternal objectID];
}

- (unint64_t)syntheticFocusMode
{
  return [(AVMetadataObjectInternal *)self->_objectInternal syntheticFocusMode];
}

- (id)originalMetadataObject
{
  id result = [(AVMetadataObjectInternal *)self->_objectInternal originalMetadataObject];
  if (!result)
  {
    double v4 = self;
    return v4;
  }
  return result;
}

- (int64_t)detectionSource
{
  return [(AVMetadataObjectInternal *)self->_objectInternal detectionSource];
}

- (void)setDetectionSource:(int64_t)a3
{
}

@end