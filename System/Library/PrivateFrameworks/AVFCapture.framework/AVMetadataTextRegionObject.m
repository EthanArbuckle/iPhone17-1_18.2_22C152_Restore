@interface AVMetadataTextRegionObject
+ (id)textRegionObjectWithDictionary:(id)a3 input:(id)a4;
- (CGRect)angularOffsetBounds;
- (float)angularOffset;
- (float)confidence;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (id)initTextRegionObjectWithDictionary:(id)a3 input:(id)a4;
- (int64_t)regionID;
- (void)dealloc;
@end

@implementation AVMetadataTextRegionObject

+ (id)textRegionObjectWithDictionary:(id)a3 input:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initTextRegionObjectWithDictionary:a3 input:a4];

  return v4;
}

- (id)initTextRegionObjectWithDictionary:(id)a3 input:(id)a4
{
  memset(&v17, 0, sizeof(v17));
  CMTimeMakeFromDictionary(&v17, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52568]]);
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  rect.size = v7;
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52550]], &rect);
  v15.receiver = self;
  v15.super_class = (Class)AVMetadataTextRegionObject;
  CMTime v14 = v17;
  long long v12 = *MEMORY[0x1E4F1F9F8];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v8 = [(AVMetadataObject *)&v15 initWithType:@"textRegion", &v14, &v12, 0, 0, a4, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v8)
  {
    v8->_regionID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52560]), "integerValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52558]), "floatValue");
    v8->_confidence = v9;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52540]), "floatValue");
    v8->_angularOffset = v10;
    CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52548]], &v8->_angularOffsetBounds);
  }
  return v8;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v25.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v25.size = v9;
  [a3 bounds];
  long long v10 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v24.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v24.c = v10;
  *(_OWORD *)&v24.tx = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)&v24, &v25, v11, v12, v13, v14))
  {
    if (a3)
    {
      [a3 time];
      [a3 duration];
    }
    else
    {
      memset(v23, 0, sizeof(v23));
      memset(v22, 0, sizeof(v22));
    }
    uint64_t v16 = [a3 input];
    v21.receiver = self;
    v21.super_class = (Class)AVMetadataTextRegionObject;
    objc_super v15 = [(AVMetadataObject *)&v21 initWithType:@"textRegion", v23, v22, 0, a3, v16, *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
    if (v15)
    {
      v15->_regionID = [a3 regionID];
      [a3 confidence];
      v15->_confidence = v17;
      [a3 angularOffset];
      v15->_angularOffset = v18;
      [a3 angularOffsetBounds];
      long long v19 = *(_OWORD *)&a4->c;
      *(_OWORD *)&v24.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&v24.c = v19;
      *(_OWORD *)&v24.tx = *(_OWORD *)&a4->tx;
      v15->_angularOffsetBounds = CGRectApplyAffineTransform(v26, &v24);
    }
  }
  else
  {

    return 0;
  }
  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVMetadataTextRegionObject;
  [(AVMetadataObject *)&v2 dealloc];
}

- (int64_t)regionID
{
  return self->_regionID;
}

- (float)confidence
{
  return self->_confidence;
}

- (float)angularOffset
{
  return self->_angularOffset;
}

- (CGRect)angularOffsetBounds
{
  objc_copyStruct(v6, &self->_angularOffsetBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end