@interface AVVideoCompositionLayerInstruction
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVVideoCompositionLayerInstruction)init;
- (AVVideoCompositionLayerInstruction)initWithCoder:(id)a3;
- (BOOL)getCropRectangleRampForTime:(CMTime *)time startCropRectangle:(CGRect *)startCropRectangle endCropRectangle:(CGRect *)endCropRectangle timeRange:(CMTimeRange *)timeRange;
- (BOOL)getOpacityRampForTime:(CMTime *)time startOpacity:(float *)startOpacity endOpacity:(float *)endOpacity timeRange:(CMTimeRange *)timeRange;
- (BOOL)getTransformRampForTime:(CMTime *)time startTransform:(CGAffineTransform *)startTransform endTransform:(CGAffineTransform *)endTransform timeRange:(CMTimeRange *)timeRange;
- (BOOL)isEqual:(id)a3;
- (CMPersistentTrackID)trackID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentationWithTimeRange:(id *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_setCropRectangleRampFromStartCropRectangle:(CGRect)a3 toEndCropRectangle:(CGRect)a4 timeRange:(id *)a5 selector:(SEL)a6;
- (void)_setCropRectangleRamps:(id)a3;
- (void)_setOpacityRampFromStartOpacity:(float)a3 toEndOpacity:(float)a4 timeRange:(id *)a5 selector:(SEL)a6;
- (void)_setOpacityRamps:(id)a3;
- (void)_setTransformRampFromStartTransform:(CGAffineTransform *)a3 toEndTransform:(CGAffineTransform *)a4 timeRange:(id *)a5 selector:(SEL)a6;
- (void)_setTransformRamps:(id)a3;
- (void)_setValuesFromDictionary:(id)a3 timeRange:(id *)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCropRectangle:(CGRect)a3 atTime:(id *)a4;
- (void)setCropRectangleRampFromStartCropRectangle:(CGRect)a3 toEndCropRectangle:(CGRect)a4 timeRange:(id *)a5;
- (void)setOpacity:(float)a3 atTime:(id *)a4;
- (void)setOpacityRampFromStartOpacity:(float)a3 toEndOpacity:(float)a4 timeRange:(id *)a5;
- (void)setTrackID:(int)a3;
- (void)setTransform:(CGAffineTransform *)a3 atTime:(id *)a4;
- (void)setTransformRampFromStartTransform:(CGAffineTransform *)a3 toEndTransform:(CGAffineTransform *)a4 timeRange:(id *)a5;
@end

@implementation AVVideoCompositionLayerInstruction

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (AVVideoCompositionLayerInstruction)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVVideoCompositionLayerInstruction;
  v2 = [(AVVideoCompositionLayerInstruction *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVVideoCompositionLayerInstructionInternal);
    v2->_layerInstruction = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_layerInstruction->trackID = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (AVVideoCompositionLayerInstruction)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)AVVideoCompositionLayerInstruction;
  v4 = [(AVVideoCompositionLayerInstruction *)&v23 init];
  if (v4)
  {
    objc_super v5 = objc_alloc_init(AVVideoCompositionLayerInstructionInternal);
    v4->_layerInstruction = v5;
    if (v5)
    {
      CFRetain(v5);
      -[AVVideoCompositionLayerInstruction setTrackID:](v4, "setTrackID:", objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"AVVideoCompositionLayerTrackID"), "intValue"));
      v6 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0), @"AVVideoCompositionLayerTransformRamps");
      [(AVVideoCompositionLayerInstruction *)v4 _setTransformRamps:_rampArrayWithTimeRangesAsValues(v10)];
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0), @"AVVideoCompositionLayerOpacityRamps");
      [(AVVideoCompositionLayerInstruction *)v4 _setOpacityRamps:_rampArrayWithTimeRangesAsValues(v16)];
      v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0), @"AVVideoCompositionLayerCropRectangleRamps");
      [(AVVideoCompositionLayerInstruction *)v4 _setCropRectangleRamps:_rampArrayWithTimeRangesAsValues(v21)];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", self->_layerInstruction->trackID), @"AVVideoCompositionLayerTrackID");
  [a3 encodeObject:_rampArrayWithTimeRangesAsDictionaries(self->_layerInstruction->transformRamps) forKey:@"AVVideoCompositionLayerTransformRamps"];
  [a3 encodeObject:_rampArrayWithTimeRangesAsDictionaries(self->_layerInstruction->opacityRamps) forKey:@"AVVideoCompositionLayerOpacityRamps"];
  id v5 = _rampArrayWithTimeRangesAsDictionaries(self->_layerInstruction->cropRectangleRamps);
  [a3 encodeObject:v5 forKey:@"AVVideoCompositionLayerCropRectangleRamps"];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int trackID = self->_layerInstruction->trackID;
  if (trackID != [a3 trackID]) {
    goto LABEL_11;
  }
  layerInstruction = self->_layerInstruction;
  transformRamps = layerInstruction->transformRamps;
  uint64_t v8 = *(void *)(*((void *)a3 + 1) + 16);
  if (transformRamps)
  {
    LODWORD(v9) = [(NSMutableArray *)transformRamps isEqual:v8];
    if (!v9) {
      return v9;
    }
    layerInstruction = self->_layerInstruction;
  }
  else if (v8)
  {
    goto LABEL_11;
  }
  opacityRamps = layerInstruction->opacityRamps;
  uint64_t v11 = *(void *)(*((void *)a3 + 1) + 24);
  if (opacityRamps)
  {
    LODWORD(v9) = [(NSMutableArray *)opacityRamps isEqual:v11];
    if (!v9) {
      return v9;
    }
    layerInstruction = self->_layerInstruction;
    goto LABEL_13;
  }
  if (v11)
  {
LABEL_11:
    LOBYTE(v9) = 0;
    return v9;
  }
LABEL_13:
  cropRectangleRamps = layerInstruction->cropRectangleRamps;
  uint64_t v13 = *(void *)(*((void *)a3 + 1) + 32);
  if (cropRectangleRamps)
  {
    LOBYTE(v9) = [(NSMutableArray *)cropRectangleRamps isEqual:v13];
  }
  else
  {
    return v13 == 0;
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(AVVideoCompositionLayerInstruction *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    id v5 = [+[AVVideoCompositionLayerInstruction allocWithZone:a3] init];
    if (v5)
    {
      [(AVVideoCompositionLayerInstruction *)v5 setTrackID:[(AVVideoCompositionLayerInstruction *)self trackID]];
      [(AVVideoCompositionLayerInstruction *)v5 _setTransformRamps:self->_layerInstruction->transformRamps];
      [(AVVideoCompositionLayerInstruction *)v5 _setOpacityRamps:self->_layerInstruction->opacityRamps];
      [(AVVideoCompositionLayerInstruction *)v5 _setCropRectangleRamps:self->_layerInstruction->cropRectangleRamps];
    }
    return v5;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(AVVideoCompositionLayerInstruction *)+[AVMutableVideoCompositionLayerInstruction allocWithZone:a3] init];
  if (v4)
  {
    [(AVMutableVideoCompositionLayerInstruction *)v4 setTrackID:[(AVVideoCompositionLayerInstruction *)self trackID]];
    [(AVVideoCompositionLayerInstruction *)v4 _setTransformRamps:self->_layerInstruction->transformRamps];
    [(AVVideoCompositionLayerInstruction *)v4 _setOpacityRamps:self->_layerInstruction->opacityRamps];
    [(AVVideoCompositionLayerInstruction *)v4 _setCropRectangleRamps:self->_layerInstruction->cropRectangleRamps];
  }
  return v4;
}

- (void)dealloc
{
  layerInstruction = self->_layerInstruction;
  if (layerInstruction)
  {

    CFRelease(self->_layerInstruction);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoCompositionLayerInstruction;
  [(AVVideoCompositionLayerInstruction *)&v4 dealloc];
}

- (CMPersistentTrackID)trackID
{
  return self->_layerInstruction->trackID;
}

- (void)setTrackID:(int)a3
{
  self->_layerInstruction->int trackID = a3;
}

- (void)_setTransformRamps:(id)a3
{
  transformRamps = self->_layerInstruction->transformRamps;
  if (transformRamps != a3)
  {

    self->_layerInstruction->transformRamps = (NSMutableArray *)[a3 copy];
  }
}

- (void)_setOpacityRamps:(id)a3
{
  opacityRamps = self->_layerInstruction->opacityRamps;
  if (opacityRamps != a3)
  {

    self->_layerInstruction->opacityRamps = (NSMutableArray *)[a3 copy];
  }
}

- (void)_setCropRectangleRamps:(id)a3
{
  cropRectangleRamps = self->_layerInstruction->cropRectangleRamps;
  if (cropRectangleRamps != a3)
  {

    self->_layerInstruction->cropRectangleRamps = (NSMutableArray *)[a3 copy];
  }
}

- (void)_setTransformRampFromStartTransform:(CGAffineTransform *)a3 toEndTransform:(CGAffineTransform *)a4 timeRange:(id *)a5 selector:(SEL)a6
{
  transformRamps = self->_layerInstruction->transformRamps;
  long long v12 = *(_OWORD *)&a5->var0.var3;
  long long v39 = *(_OWORD *)&a5->var0.var0;
  long long v40 = v12;
  long long v41 = *(_OWORD *)&a5->var1.var1;
  if (AVRampsIncludesRampThatOverlapsTimeRange(transformRamps, &v39))
  {
    v31 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a6, @"The timeRange of a transform ramp must not overlap the timeRange of an existing transform ramp.", v13, v14, v15, v16, v17, v32), 0 reason userInfo];
    objc_exception_throw(v31);
  }
  uint64_t v18 = self->_layerInstruction->transformRamps;
  if (!v18)
  {
    self->_layerInstruction->transformRamps = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    uint64_t v18 = self->_layerInstruction->transformRamps;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__AVVideoCompositionLayerInstruction__setTransformRampFromStartTransform_toEndTransform_timeRange_selector___block_invoke;
  v35[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
  long long v19 = *(_OWORD *)&a5->var0.var3;
  long long v36 = *(_OWORD *)&a5->var0.var0;
  long long v37 = v19;
  long long v38 = *(_OWORD *)&a5->var1.var1;
  uint64_t v20 = [(NSMutableArray *)v18 indexOfObjectPassingTest:v35];
  long long v21 = *(_OWORD *)&a5->var0.var3;
  long long v39 = *(_OWORD *)&a5->var0.var0;
  long long v40 = v21;
  long long v41 = *(_OWORD *)&a5->var1.var1;
  uint64_t v22 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v39];
  objc_super v23 = (void *)MEMORY[0x1E4F1C9E8];
  long long v24 = *(_OWORD *)&a3->c;
  long long v39 = *(_OWORD *)&a3->a;
  long long v40 = v24;
  long long v41 = *(_OWORD *)&a3->tx;
  id v25 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
  long long v26 = *(_OWORD *)&a4->c;
  long long v39 = *(_OWORD *)&a4->a;
  long long v40 = v26;
  long long v41 = *(_OWORD *)&a4->tx;
  uint64_t v27 = objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v25, @"StartTransform", (id)FigCreate3x2MatrixArrayFromCGAffineTransform(), @"EndTransform", 0);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_layerInstruction->transformRamps addObject:v22];
    [(NSMutableArray *)self->_layerInstruction->transformRamps addObject:v27];
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    v28 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:v20];
    if (v28)
    {
      [v28 CMTimeRangeValue];
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v39 = 0u;
    }
    *(_OWORD *)&time1.value = v39;
    time1.epoch = v40;
    CMTime time2 = (CMTime)a5->var0;
    int32_t v29 = CMTimeCompare(&time1, &time2);
    v30 = self->_layerInstruction->transformRamps;
    if (v29)
    {
      [(NSMutableArray *)v30 insertObject:v22 atIndex:v20];
      [(NSMutableArray *)self->_layerInstruction->transformRamps insertObject:v27 atIndex:v20 + 1];
    }
    else
    {
      [(NSMutableArray *)v30 replaceObjectAtIndex:v20 withObject:v22];
      [(NSMutableArray *)self->_layerInstruction->transformRamps replaceObjectAtIndex:v20 + 1 withObject:v27];
    }
  }
}

BOOL __108__AVVideoCompositionLayerInstruction__setTransformRampFromStartTransform_toEndTransform_timeRange_selector___block_invoke(uint64_t a1, void *a2, char a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  if (a2)
  {
    [a2 CMTimeRangeValue];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.epoch = v11;
  CMTime v8 = *(CMTime *)(a1 + 32);
  int32_t v7 = CMTimeCompare(&time1, &v8);
  BOOL result = v7 >= 0;
  if ((v7 & 0x80000000) == 0) {
    *a4 = 1;
  }
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3 atTime:(id *)a4
{
  if ((a4->var2 & 0x1D) != 1)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The time of a transform setting must be numeric.", (uint64_t)a4, v4, v5, v6, v7, v15), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)start = *a4;
  long long v15 = *MEMORY[0x1E4F1FA10];
  *(void *)&long long v16 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  CMTimeRangeMake(&v20, (CMTime *)start, (CMTime *)&v15);
  long long v11 = *(_OWORD *)&a3->c;
  *(_OWORD *)start = *(_OWORD *)&a3->a;
  *(_OWORD *)&start[16] = v11;
  long long v13 = *(_OWORD *)&a3->a;
  long long v12 = *(_OWORD *)&a3->c;
  long long v19 = *(_OWORD *)&a3->tx;
  long long v15 = v13;
  long long v16 = v12;
  long long v17 = *(_OWORD *)&a3->tx;
  [(AVVideoCompositionLayerInstruction *)self _setTransformRampFromStartTransform:start toEndTransform:&v15 timeRange:&v20 selector:a2];
}

- (void)setTransformRampFromStartTransform:(CGAffineTransform *)a3 toEndTransform:(CGAffineTransform *)a4 timeRange:(id *)a5
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    long long v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a transform ramp must have a numeric start time and a numeric duration.", (uint64_t)a4, (uint64_t)a5, v5, v6, v7, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v8 = *(_OWORD *)&a3->c;
  v14[0] = *(_OWORD *)&a3->a;
  v14[1] = v8;
  v14[2] = *(_OWORD *)&a3->tx;
  long long v9 = *(_OWORD *)&a4->c;
  v13[0] = *(_OWORD *)&a4->a;
  v13[1] = v9;
  v13[2] = *(_OWORD *)&a4->tx;
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  [(AVVideoCompositionLayerInstruction *)self _setTransformRampFromStartTransform:v14 toEndTransform:v13 timeRange:v12 selector:a2];
}

- (BOOL)getTransformRampForTime:(CMTime *)time startTransform:(CGAffineTransform *)startTransform endTransform:(CGAffineTransform *)endTransform timeRange:(CMTimeRange *)timeRange
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ((time->flags & 0x1D) == 1)
  {
    layerInstruction = self->_layerInstruction;
    if (layerInstruction->transformRamps)
    {
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
      transformRamps = layerInstruction->transformRamps;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __100__AVVideoCompositionLayerInstruction_getTransformRampForTime_startTransform_endTransform_timeRange___block_invoke;
      v32[3] = &unk_1E57B4790;
      CMTime v33 = *time;
      v32[4] = &v34;
      uint64_t v12 = [(NSMutableArray *)transformRamps indexOfObjectPassingTest:v32];
      if (v35[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = v12;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        uint64_t v14 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:v12];
        if (v14)
        {
          [v14 CMTimeRangeValue];
          CMTimeFlags flags = DWORD1(v31);
          CMTimeEpoch epoch = *((void *)&v31 + 1);
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v29 = 0u;
        }
        long long v38 = v29;
        long long v39 = v30;
        CMTimeScale timescale = v31;
      }
      else
      {
        uint64_t v18 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:");
        if (v18)
        {
          [v18 CMTimeRangeValue];
          CMTimeFlags flags = DWORD1(v31);
          CMTimeEpoch epoch = *((void *)&v31 + 1);
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v29 = 0u;
        }
        long long v38 = v29;
        long long v39 = v30;
        CMTimeScale timescale = v31;
        uint64_t v13 = v35[3];
      }
      if (v13 != 0x7FFFFFFFFFFFFFFELL)
      {
        long long v19 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:");
        CMTimeRange v20 = v19;
        if (startTransform)
        {
          [v19 objectForKey:@"StartTransform"];
          FigGetCGAffineTransformFrom3x2MatrixArray();
          long long v21 = v30;
          *(_OWORD *)&startTransform->a = v29;
          *(_OWORD *)&startTransform->c = v21;
          *(_OWORD *)&startTransform->tx = v31;
        }
        if (endTransform)
        {
          [v20 objectForKey:@"EndTransform"];
          FigGetCGAffineTransformFrom3x2MatrixArray();
          long long v22 = v30;
          *(_OWORD *)&endTransform->a = v29;
          *(_OWORD *)&endTransform->c = v22;
          *(_OWORD *)&endTransform->tx = v31;
        }
        if (timeRange)
        {
          if ((~flags & 5) == 0
            && v13 + 2 < (unint64_t)[(NSMutableArray *)self->_layerInstruction->transformRamps count])
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v29 = 0u;
            objc_super v23 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:");
            if (v23)
            {
              [v23 CMTimeRangeValue];
            }
            else
            {
              long long v30 = 0u;
              long long v31 = 0u;
              long long v29 = 0u;
            }
            *(_OWORD *)&lhs.value = v29;
            lhs.CMTimeEpoch epoch = v30;
            *(_OWORD *)&v26.value = v38;
            v26.CMTimeEpoch epoch = v39;
            CMTimeSubtract(&v28, &lhs, &v26);
            *((void *)&v39 + 1) = v28.value;
            CMTimeFlags flags = v28.flags;
            CMTimeScale timescale = v28.timescale;
            CMTimeEpoch epoch = v28.epoch;
          }
          long long v24 = v39;
          *(_OWORD *)&timeRange->start.value = v38;
          *(_OWORD *)&timeRange->start.CMTimeEpoch epoch = v24;
          timeRange->duration.CMTimeScale timescale = timescale;
          timeRange->duration.CMTimeFlags flags = flags;
          timeRange->duration.CMTimeEpoch epoch = epoch;
        }
        BOOL v17 = 1;
        goto LABEL_29;
      }
LABEL_15:
      BOOL v17 = 0;
LABEL_29:
      _Block_object_dispose(&v34, 8);
      return v17;
    }
  }
  return 0;
}

BOOL __100__AVVideoCompositionLayerInstruction_getTransformRampForTime_startTransform_endTransform_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  if (a2) {
    [a2 CMTimeRangeValue];
  }
  CMTimeRange range = v12;
  CMTime v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.CMTimeEpoch epoch = v12.start.epoch;
  CMTime v10 = *(CMTime *)(a1 + 40);
  int32_t v7 = CMTimeCompare(&range.start, &v10);
  BOOL result = v7 > 0;
  if (v7 < 1)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v9 + 24) < a3) {
      *(void *)(v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (void)_setOpacityRampFromStartOpacity:(float)a3 toEndOpacity:(float)a4 timeRange:(id *)a5 selector:(SEL)a6
{
  opacityRamps = self->_layerInstruction->opacityRamps;
  long long v12 = *(_OWORD *)&a5->var0.var3;
  long long v35 = *(_OWORD *)&a5->var0.var0;
  long long v36 = v12;
  long long v37 = *(_OWORD *)&a5->var1.var1;
  if (AVRampsIncludesRampThatOverlapsTimeRange(opacityRamps, &v35))
  {
    uint64_t v27 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a6, @"The timeRange of an opacity ramp must not overlap the timeRange of an existing opacity ramp.", v13, v14, v15, v16, v17, var0.var0), 0 reason userInfo];
    objc_exception_throw(v27);
  }
  uint64_t v18 = self->_layerInstruction->opacityRamps;
  if (!v18)
  {
    self->_layerInstruction->opacityRamps = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    uint64_t v18 = self->_layerInstruction->opacityRamps;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __102__AVVideoCompositionLayerInstruction__setOpacityRampFromStartOpacity_toEndOpacity_timeRange_selector___block_invoke;
  v31[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
  long long v19 = *(_OWORD *)&a5->var0.var3;
  long long v32 = *(_OWORD *)&a5->var0.var0;
  long long v33 = v19;
  long long v34 = *(_OWORD *)&a5->var1.var1;
  uint64_t v20 = [(NSMutableArray *)v18 indexOfObjectPassingTest:v31];
  long long v21 = *(_OWORD *)&a5->var0.var3;
  long long v35 = *(_OWORD *)&a5->var0.var0;
  long long v36 = v21;
  long long v37 = *(_OWORD *)&a5->var1.var1;
  uint64_t v22 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v35];
  *(float *)long long v30 = a3;
  *(float *)&v30[1] = a4;
  uint64_t v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:8];
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_layerInstruction->opacityRamps addObject:v22];
    [(NSMutableArray *)self->_layerInstruction->opacityRamps addObject:v23];
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v24 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:v20];
    if (v24)
    {
      [v24 CMTimeRangeValue];
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
    }
    *(_OWORD *)&time1.value = v35;
    time1.CMTimeEpoch epoch = v36;
    $3CC8671D27C23BF42ADDB32F2B5E48AE var0 = a5->var0;
    int32_t v25 = CMTimeCompare(&time1, (CMTime *)&var0);
    CMTime v26 = self->_layerInstruction->opacityRamps;
    if (v25)
    {
      [(NSMutableArray *)v26 insertObject:v22 atIndex:v20];
      [(NSMutableArray *)self->_layerInstruction->opacityRamps insertObject:v23 atIndex:v20 + 1];
    }
    else
    {
      [(NSMutableArray *)v26 replaceObjectAtIndex:v20 withObject:v22];
      [(NSMutableArray *)self->_layerInstruction->opacityRamps replaceObjectAtIndex:v20 + 1 withObject:v23];
    }
  }
}

BOOL __102__AVVideoCompositionLayerInstruction__setOpacityRampFromStartOpacity_toEndOpacity_timeRange_selector___block_invoke(uint64_t a1, void *a2, char a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  if (a2)
  {
    [a2 CMTimeRangeValue];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.CMTimeEpoch epoch = v11;
  CMTime v8 = *(CMTime *)(a1 + 32);
  int32_t v7 = CMTimeCompare(&time1, &v8);
  BOOL result = v7 >= 0;
  if ((v7 & 0x80000000) == 0) {
    *a4 = 1;
  }
  return result;
}

- (void)setOpacity:(float)a3 atTime:(id *)a4
{
  if ((a4->var2 & 0x1D) != 1)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The time of an opacity setting must be numeric.", v4, v5, v6, v7, v8, v15.value), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  CMTime start = *(CMTime *)a4;
  CMTime v15 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v17, &start, &v15);
  *(float *)&double v12 = a3;
  *(float *)&double v13 = a3;
  [(AVVideoCompositionLayerInstruction *)self _setOpacityRampFromStartOpacity:&v17 toEndOpacity:a2 timeRange:v12 selector:v13];
}

- (void)setOpacityRampFromStartOpacity:(float)a3 toEndOpacity:(float)a4 timeRange:(id *)a5
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    long long v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of an opacity ramp must have a numeric start time and a numeric duration.", v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVVideoCompositionLayerInstruction _setOpacityRampFromStartOpacity:toEndOpacity:timeRange:selector:](self, "_setOpacityRampFromStartOpacity:toEndOpacity:timeRange:selector:", v12, a2);
}

- (BOOL)getOpacityRampForTime:(CMTime *)time startOpacity:(float *)startOpacity endOpacity:(float *)endOpacity timeRange:(CMTimeRange *)timeRange
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((time->flags & 0x1D) == 1)
  {
    layerInstruction = self->_layerInstruction;
    if (layerInstruction->opacityRamps)
    {
      uint64_t v32 = 0;
      long long v33 = &v32;
      uint64_t v34 = 0x2020000000;
      uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      opacityRamps = layerInstruction->opacityRamps;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      _DWORD v30[2] = __94__AVVideoCompositionLayerInstruction_getOpacityRampForTime_startOpacity_endOpacity_timeRange___block_invoke;
      v30[3] = &unk_1E57B4790;
      CMTime v31 = *time;
      v30[4] = &v32;
      uint64_t v12 = [(NSMutableArray *)opacityRamps indexOfObjectPassingTest:v30];
      if (v33[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = v12;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        uint64_t v14 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:v12];
        if (v14)
        {
          [v14 CMTimeRangeValue];
          CMTimeFlags flags = DWORD1(v29);
          CMTimeEpoch epoch = *((void *)&v29 + 1);
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v27 = 0u;
        }
        long long v36 = v27;
        long long v37 = v28;
        CMTimeScale timescale = v29;
      }
      else
      {
        uint64_t v18 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:");
        if (v18)
        {
          [v18 CMTimeRangeValue];
          CMTimeFlags flags = DWORD1(v29);
          CMTimeEpoch epoch = *((void *)&v29 + 1);
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v27 = 0u;
        }
        long long v36 = v27;
        long long v37 = v28;
        CMTimeScale timescale = v29;
        uint64_t v13 = v33[3];
      }
      if (v13 != 0x7FFFFFFFFFFFFFFELL)
      {
        long long v19 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:");
        uint64_t v26 = 0x3F8000003F800000;
        if (v19) {
          [v19 getBytes:&v26 length:8];
        }
        if (startOpacity) {
          *(_DWORD *)startOpacity = v26;
        }
        if (endOpacity) {
          *endOpacity = *((float *)&v26 + 1);
        }
        if (timeRange)
        {
          if ((~flags & 5) == 0
            && v13 + 2 < (unint64_t)[(NSMutableArray *)self->_layerInstruction->opacityRamps count])
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v27 = 0u;
            uint64_t v20 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->opacityRamps, "objectAtIndex:");
            if (v20)
            {
              [v20 CMTimeRangeValue];
            }
            else
            {
              long long v28 = 0u;
              long long v29 = 0u;
              long long v27 = 0u;
            }
            *(_OWORD *)&lhs.value = v27;
            lhs.CMTimeEpoch epoch = v28;
            *(_OWORD *)&v23.value = v36;
            v23.CMTimeEpoch epoch = v37;
            CMTimeSubtract(&v25, &lhs, &v23);
            *((void *)&v37 + 1) = v25.value;
            CMTimeFlags flags = v25.flags;
            CMTimeScale timescale = v25.timescale;
            CMTimeEpoch epoch = v25.epoch;
          }
          long long v21 = v37;
          *(_OWORD *)&timeRange->start.value = v36;
          *(_OWORD *)&timeRange->start.CMTimeEpoch epoch = v21;
          timeRange->duration.CMTimeScale timescale = timescale;
          timeRange->duration.CMTimeFlags flags = flags;
          timeRange->duration.CMTimeEpoch epoch = epoch;
        }
        BOOL v17 = 1;
        goto LABEL_31;
      }
LABEL_15:
      BOOL v17 = 0;
LABEL_31:
      _Block_object_dispose(&v32, 8);
      return v17;
    }
  }
  return 0;
}

BOOL __94__AVVideoCompositionLayerInstruction_getOpacityRampForTime_startOpacity_endOpacity_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  if (a2) {
    [a2 CMTimeRangeValue];
  }
  CMTimeRange range = v12;
  CMTime v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.CMTimeEpoch epoch = v12.start.epoch;
  CMTime v10 = *(CMTime *)(a1 + 40);
  int32_t v7 = CMTimeCompare(&range.start, &v10);
  BOOL result = v7 > 0;
  if (v7 < 1)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v9 + 24) < a3) {
      *(void *)(v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (void)_setCropRectangleRampFromStartCropRectangle:(CGRect)a3 toEndCropRectangle:(CGRect)a4 timeRange:(id *)a5 selector:(SEL)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v12 = a3.size.height;
  CGFloat v13 = a3.size.width;
  CGFloat v14 = a3.origin.y;
  CGFloat v15 = a3.origin.x;
  cropRectangleRamps = self->_layerInstruction->cropRectangleRamps;
  long long v18 = *(_OWORD *)&a5->var0.var3;
  long long v43 = *(_OWORD *)&a5->var0.var0;
  long long v44 = v18;
  long long v45 = *(_OWORD *)&a5->var1.var1;
  if (AVRampsIncludesRampThatOverlapsTimeRange(cropRectangleRamps, &v43))
  {
    uint64_t v35 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a6, @"The timeRange of a crop rectangle ramp must not overlap the timeRange of an existing crop rectangle ramp.", v19, v20, v21, v22, v23, v36), 0 reason userInfo];
    objc_exception_throw(v35);
  }
  long long v24 = self->_layerInstruction->cropRectangleRamps;
  if (!v24)
  {
    self->_layerInstruction->cropRectangleRamps = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v24 = self->_layerInstruction->cropRectangleRamps;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __120__AVVideoCompositionLayerInstruction__setCropRectangleRampFromStartCropRectangle_toEndCropRectangle_timeRange_selector___block_invoke;
  v39[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
  long long v25 = *(_OWORD *)&a5->var0.var3;
  long long v40 = *(_OWORD *)&a5->var0.var0;
  long long v41 = v25;
  long long v42 = *(_OWORD *)&a5->var1.var1;
  uint64_t v26 = [(NSMutableArray *)v24 indexOfObjectPassingTest:v39];
  long long v27 = *(_OWORD *)&a5->var0.var3;
  long long v43 = *(_OWORD *)&a5->var0.var0;
  long long v44 = v27;
  long long v45 = *(_OWORD *)&a5->var1.var1;
  uint64_t v28 = [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v43];
  long long v29 = (void *)MEMORY[0x1E4F1C9E8];
  v46.origin.CGFloat x = v15;
  v46.origin.CGFloat y = v14;
  v46.size.CGFloat width = v13;
  v46.size.CGFloat height = v12;
  CFDictionaryRef v30 = CGRectCreateDictionaryRepresentation(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  uint64_t v31 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", v30, @"StartCropRectangle", CGRectCreateDictionaryRepresentation(v47), @"EndCropRectangle", 0);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_layerInstruction->cropRectangleRamps addObject:v28];
    [(NSMutableArray *)self->_layerInstruction->cropRectangleRamps addObject:v31];
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    uint64_t v32 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:v26];
    if (v32)
    {
      [v32 CMTimeRangeValue];
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
    }
    *(_OWORD *)&time1.value = v43;
    time1.CMTimeEpoch epoch = v44;
    CMTime time2 = (CMTime)a5->var0;
    int32_t v33 = CMTimeCompare(&time1, &time2);
    uint64_t v34 = self->_layerInstruction->cropRectangleRamps;
    if (v33)
    {
      [(NSMutableArray *)v34 insertObject:v28 atIndex:v26];
      [(NSMutableArray *)self->_layerInstruction->cropRectangleRamps insertObject:v31 atIndex:v26 + 1];
    }
    else
    {
      [(NSMutableArray *)v34 replaceObjectAtIndex:v26 withObject:v28];
      [(NSMutableArray *)self->_layerInstruction->cropRectangleRamps replaceObjectAtIndex:v26 + 1 withObject:v31];
    }
  }
}

BOOL __120__AVVideoCompositionLayerInstruction__setCropRectangleRampFromStartCropRectangle_toEndCropRectangle_timeRange_selector___block_invoke(uint64_t a1, void *a2, char a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  if (a2)
  {
    [a2 CMTimeRangeValue];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  *(_OWORD *)&time1.value = v10;
  time1.CMTimeEpoch epoch = v11;
  CMTime v8 = *(CMTime *)(a1 + 32);
  int32_t v7 = CMTimeCompare(&time1, &v8);
  BOOL result = v7 >= 0;
  if ((v7 & 0x80000000) == 0) {
    *a4 = 1;
  }
  return result;
}

- (void)setCropRectangle:(CGRect)a3 atTime:(id *)a4
{
  if ((a4->var2 & 0x1D) != 1)
  {
    CGFloat v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The time of a crop rectangle setting must be numeric.", v4, v5, v6, v7, v8, v16.value), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CMTime start = *(CMTime *)a4;
  CMTime v16 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v18, &start, &v16);
  -[AVVideoCompositionLayerInstruction _setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:](self, "_setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:", &v18, a2, x, y, width, height, x, y, width, height);
}

- (void)setCropRectangleRampFromStartCropRectangle:(CGRect)a3 toEndCropRectangle:(CGRect)a4 timeRange:(id *)a5
{
  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    long long v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a crop rectangle ramp must have a numeric start time and a numeric duration.", v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  long long v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVVideoCompositionLayerInstruction _setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:](self, "_setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:selector:", v12, a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (BOOL)getCropRectangleRampForTime:(CMTime *)time startCropRectangle:(CGRect *)startCropRectangle endCropRectangle:(CGRect *)endCropRectangle timeRange:(CMTimeRange *)timeRange
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((time->flags & 0x1D) == 1)
  {
    cropRectangleRamps = self->_layerInstruction->cropRectangleRamps;
    if (cropRectangleRamps)
    {
      uint64_t v34 = 0;
      uint64_t v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __112__AVVideoCompositionLayerInstruction_getCropRectangleRampForTime_startCropRectangle_endCropRectangle_timeRange___block_invoke;
      v32[3] = &unk_1E57B4790;
      CMTime v33 = *time;
      v32[4] = &v34;
      uint64_t v11 = [(NSMutableArray *)cropRectangleRamps indexOfObjectPassingTest:v32];
      if (v35[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = v11;
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        CGFloat v13 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:v11];
        if (v13)
        {
          [v13 CMTimeRangeValue];
          CMTimeFlags flags = DWORD1(v31);
          CMTimeEpoch epoch = *((void *)&v31 + 1);
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          long long v31 = 0u;
          memset(&rect, 0, sizeof(rect));
        }
        CGRect v38 = rect;
        CMTimeScale timescale = v31;
      }
      else
      {
        BOOL v17 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:");
        if (v17)
        {
          [v17 CMTimeRangeValue];
          CMTimeFlags flags = DWORD1(v31);
          CMTimeEpoch epoch = *((void *)&v31 + 1);
        }
        else
        {
          CMTimeEpoch epoch = 0;
          CMTimeFlags flags = 0;
          long long v31 = 0u;
          memset(&rect, 0, sizeof(rect));
        }
        CGRect v38 = rect;
        CMTimeScale timescale = v31;
        uint64_t v12 = v35[3];
      }
      if (v12 != 0x7FFFFFFFFFFFFFFELL)
      {
        CMTimeRange v18 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:");
        uint64_t v19 = v18;
        if (startCropRectangle)
        {
          CFDictionaryRef v20 = (const __CFDictionary *)[v18 objectForKey:@"StartCropRectangle"];
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v20, &rect);
          CGSize size = rect.size;
          startCropRectangle->origin = rect.origin;
          startCropRectangle->CGSize size = size;
        }
        if (endCropRectangle)
        {
          CFDictionaryRef v22 = (const __CFDictionary *)[v19 objectForKey:@"EndCropRectangle"];
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v22, &rect);
          CGSize v23 = rect.size;
          endCropRectangle->origin = rect.origin;
          endCropRectangle->CGSize size = v23;
        }
        if (timeRange)
        {
          if ((~flags & 5) == 0
            && v12 + 2 < (unint64_t)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps count])
          {
            long long v31 = 0u;
            memset(&rect, 0, sizeof(rect));
            long long v24 = (void *)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:");
            if (v24)
            {
              [v24 CMTimeRangeValue];
            }
            else
            {
              long long v31 = 0u;
              memset(&rect, 0, sizeof(rect));
            }
            *(CGPoint *)&lhs.value = rect.origin;
            lhs.CMTimeEpoch epoch = *(void *)&rect.size.width;
            CMTime v27 = *(CMTime *)&v38.origin.x;
            CMTimeSubtract(&v29, &lhs, &v27);
            *(void *)&v38.size.double height = v29.value;
            CMTimeFlags flags = v29.flags;
            CMTimeScale timescale = v29.timescale;
            CMTimeEpoch epoch = v29.epoch;
          }
          CGSize v25 = v38.size;
          *(CGPoint *)&timeRange->start.value = v38.origin;
          *(CGSize *)&timeRange->start.CMTimeEpoch epoch = v25;
          timeRange->duration.CMTimeScale timescale = timescale;
          timeRange->duration.CMTimeFlags flags = flags;
          timeRange->duration.CMTimeEpoch epoch = epoch;
        }
        BOOL v16 = 1;
        goto LABEL_29;
      }
LABEL_15:
      BOOL v16 = 0;
LABEL_29:
      _Block_object_dispose(&v34, 8);
      return v16;
    }
  }
  return 0;
}

BOOL __112__AVVideoCompositionLayerInstruction_getCropRectangleRampForTime_startCropRectangle_endCropRectangle_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (a3) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  if (a2) {
    [a2 CMTimeRangeValue];
  }
  CMTimeRange range = v12;
  CMTime v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.CMTimeEpoch epoch = v12.start.epoch;
  CMTime v10 = *(CMTime *)(a1 + 40);
  int32_t v7 = CMTimeCompare(&range.start, &v10);
  BOOL result = v7 > 0;
  if (v7 < 1)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v9 + 24) < a3) {
      *(void *)(v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (id)dictionaryRepresentationWithTimeRange:(id *)a3
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  long long time = *(_OWORD *)&a3->var1.var0;
  *(void *)time_16 = a3->var1.var3;
  double Seconds = CMTimeGetSeconds((CMTime *)&time);
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &self->_layerInstruction->trackID);
  if (v7)
  {
    CFNumberRef v8 = v7;
    [v5 setObject:v7 forKey:@"SourceVideoTrackID"];
    CFRelease(v8);
  }
  p_var1 = &a3->var1;
  unint64_t v9 = [(NSMutableArray *)self->_layerInstruction->transformRamps count];
  uint64_t v10 = MEMORY[0x1E4F1FA48];
  double v162 = Seconds;
  v149 = v5;
  if (v9 < 2
    || (unint64_t v11 = v9,
        long long time = *(_OWORD *)&p_var1->var0,
        *(void *)time_16 = a3->var1.var3,
        *(_OWORD *)&time2.CGFloat a = *MEMORY[0x1E4F1FA48],
        time2.CGFloat c = *(CGFloat *)(MEMORY[0x1E4F1FA48] + 16),
        !CMTimeCompare((CMTime *)&time, (CMTime *)&time2)))
  {
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long time = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)time_16 = v13;
    *(_OWORD *)&time_16[16] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    id v14 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
    CGFloat v15 = v5;
LABEL_8:
    [v15 setObject:v14 forKey:@"ConstantAffineMatrix"];
    goto LABEL_51;
  }
  unint64_t v174 = v11 >> 1;
  long long v230 = 0u;
  memset(v229, 0, sizeof(v229));
  CMTimeRange v12 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:0];
  if (v12)
  {
    [v12 CMTimeRangeValue];
  }
  else
  {
    long long v230 = 0u;
    memset(v229, 0, sizeof(v229));
  }
  BOOL v16 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:1];
  long long v228 = 0u;
  memset(v227, 0, sizeof(v227));
  [v16 objectForKey:@"StartTransform"];
  FigGetCGAffineTransformFrom3x2MatrixArray();
  memset(&v226, 0, sizeof(v226));
  [v16 objectForKey:@"EndTransform"];
  FigGetCGAffineTransformFrom3x2MatrixArray();
  if (v174 == 1)
  {
    long long time = *(_OWORD *)v229;
    *(void *)time_16 = *(void *)&v229[16];
    *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
    *(void *)&time2.CGFloat c = a3->var0.var3;
    if (!CMTimeCompare((CMTime *)&time, (CMTime *)&time2))
    {
      long long time = *(_OWORD *)v227;
      *(_OWORD *)time_16 = *(_OWORD *)&v227[16];
      *(_OWORD *)&time_16[16] = v228;
      CGAffineTransform time2 = v226;
      if (CGAffineTransformEqualToTransform((CGAffineTransform *)&time, &time2))
      {
        long long time = *(_OWORD *)v227;
        *(_OWORD *)time_16 = *(_OWORD *)&v227[16];
        *(_OWORD *)&time_16[16] = v228;
        id v14 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
        CGFloat v15 = v5;
        goto LABEL_8;
      }
    }
  }
  BOOL v17 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3 * v174];
  long long time = *(_OWORD *)v229;
  *(void *)time_16 = *(void *)&v229[16];
  *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
  *(void *)&time2.CGFloat c = a3->var0.var3;
  int32_t v18 = CMTimeCompare((CMTime *)&time, (CMTime *)&time2);
  uint64_t v19 = (long long *)MEMORY[0x1E4F1DAB8];
  if (v18 >= 1)
  {
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long time = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)time_16 = v20;
    *(_OWORD *)&time_16[16] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v21 = (long long *)MEMORY[0x1E4F1DAB8];
    id v22 = (id)FigCreate3x2MatrixArrayFromCGAffineTransform();
    objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", 0.0));
    [v17 addObject:v22];
    CGSize v23 = (void *)MEMORY[0x1E4F28ED0];
    long long time = *(_OWORD *)v229;
    *(void *)time_16 = *(void *)&v229[16];
    *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
    *(void *)&time2.CGFloat c = a3->var0.var3;
    CMTimeSubtract(&v225, (CMTime *)&time, (CMTime *)&time2);
    Float64 v24 = CMTimeGetSeconds(&v225) / Seconds;
    *(float *)&Float64 v24 = v24;
    objc_msgSend(v17, "addObject:", objc_msgSend(v23, "numberWithFloat:", v24));
    [v17 addObject:v22];
    uint64_t v19 = v21;
  }
  unint64_t v25 = 0;
  uint64_t v26 = v174;
  if (v174 <= 1) {
    uint64_t v26 = 1;
  }
  uint64_t v171 = v26;
  long long v27 = 0uLL;
  long long v165 = v19[1];
  long long v168 = *v19;
  *(_OWORD *)rect1 = v19[2];
  long long v158 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v160 = *MEMORY[0x1E4F1FA20];
  long long v156 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  do
  {
    uint64_t v28 = 2 * v25;
    v224[2] = v27;
    v224[1] = v27;
    v224[0] = v27;
    CMTime v29 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:2 * v25];
    if (v29) {
      [v29 CMTimeRangeValue];
    }
    else {
      memset(v224, 0, sizeof(v224));
    }
    long long time = v224[0];
    *(_OWORD *)time_16 = v224[1];
    *(_OWORD *)&time_16[16] = v224[2];
    CMTimeRangeGetEnd(&time1, (CMTimeRange *)&time);
    long long v30 = *(_OWORD *)&a3->var0.var3;
    long long time = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)time_16 = v30;
    *(_OWORD *)&time_16[16] = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v222, (CMTimeRange *)&time);
    if (CMTimeCompare(&time1, &v222) >= 1)
    {
      long long time = v224[0];
      *(void *)time_16 = *(void *)&v224[1];
      *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
      *(void *)&time2.CGFloat c = a3->var0.var3;
      CMTimeSubtract(&rhs, (CMTime *)&time, (CMTime *)&time2);
      *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&p_var1->var0;
      *(void *)&time2.CGFloat c = a3->var1.var3;
      CMTimeSubtract((CMTime *)&time, (CMTime *)&time2, &rhs);
      *(_OWORD *)((char *)&v224[1] + 8) = time;
      *((void *)&v224[2] + 1) = *(void *)time_16;
    }
    memset(&v220, 0, sizeof(v220));
    long long time = v224[0];
    *(_OWORD *)time_16 = v224[1];
    *(_OWORD *)&time_16[16] = v224[2];
    CMTimeRangeGetEnd(&v220, (CMTimeRange *)&time);
    long long v31 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:(2 * v25) | 1];
    memset(&v219, 0, sizeof(v219));
    [v31 objectForKey:@"StartTransform"];
    FigGetCGAffineTransformFrom3x2MatrixArray();
    memset(&v218, 0, sizeof(v218));
    [v31 objectForKey:@"EndTransform"];
    FigGetCGAffineTransformFrom3x2MatrixArray();
    *(_OWORD *)&v217.CGFloat a = v168;
    *(_OWORD *)&v217.CGFloat c = v165;
    *(_OWORD *)&v217.tdouble x = *(_OWORD *)rect1;
    long long v214 = v160;
    long long v215 = v158;
    ++v25;
    long long v216 = v156;
    if (v25 < v174)
    {
      uint64_t v32 = (void *)[(NSMutableArray *)self->_layerInstruction->transformRamps objectAtIndex:v28 + 2];
      if (v32)
      {
        [v32 CMTimeRangeValue];
      }
      else
      {
        memset(time_16, 0, 32);
        long long time = 0u;
      }
      long long v214 = time;
      long long v215 = *(_OWORD *)time_16;
      long long v216 = *(_OWORD *)&time_16[16];
      CMTimeRangeGetEnd(&v213, (CMTimeRange *)&time);
      long long v33 = *(_OWORD *)&a3->var0.var3;
      long long time = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)time_16 = v33;
      *(_OWORD *)&time_16[16] = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v212, (CMTimeRange *)&time);
      if (CMTimeCompare(&v213, &v212) >= 1)
      {
        long long time = v214;
        *(void *)time_16 = v215;
        *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
        *(void *)&time2.CGFloat c = a3->var0.var3;
        CMTimeSubtract(&v211, (CMTime *)&time, (CMTime *)&time2);
        long long time = *(_OWORD *)&p_var1->var0;
        *(void *)time_16 = a3->var1.var3;
        CMTimeSubtract((CMTime *)((char *)&v215 + 8), (CMTime *)&time, &v211);
      }
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layerInstruction->transformRamps, "objectAtIndex:", v28 + 3), "objectForKey:", @"StartTransform");
      FigGetCGAffineTransformFrom3x2MatrixArray();
      long long time = v214;
      *(void *)time_16 = v215;
      *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&v220.value;
      *(void *)&time2.CGFloat c = v220.epoch;
      if (CMTimeCompare((CMTime *)&time, (CMTime *)&time2) < 0)
      {
        long long time = *(_OWORD *)((char *)&v224[1] + 8);
        *(void *)time_16 = *((void *)&v224[2] + 1);
        double v34 = CMTimeGetSeconds((CMTime *)&time);
        *(_OWORD *)&time2.CGFloat a = v214;
        *(void *)&time2.CGFloat c = v215;
        *(_OWORD *)&v232.start.value = v224[0];
        v232.start.CMTimeEpoch epoch = *(void *)&v224[1];
        CMTimeSubtract((CMTime *)&time, (CMTime *)&time2, &v232.start);
        *((void *)&v224[2] + 1) = *(void *)time_16;
        *(_OWORD *)((char *)&v224[1] + 8) = time;
        long long time = v224[0];
        *(_OWORD *)time_16 = v224[1];
        *(_OWORD *)&time_16[16] = v224[2];
        CMTimeRangeGetEnd((CMTime *)&time2, (CMTimeRange *)&time);
        *(_OWORD *)&v220.value = *(_OWORD *)&time2.a;
        v220.CMTimeEpoch epoch = *(void *)&time2.c;
        long long time = *(_OWORD *)((char *)&v224[1] + 8);
        *(void *)time_16 = *((void *)&v224[2] + 1);
        double v35 = CMTimeGetSeconds((CMTime *)&time);
        memset(&v210, 0, sizeof(v210));
        CGAffineTransform time2 = v219;
        CMTimeRange v232 = v218;
        avvc_CGAffineTransformDecompose((uint64_t)&time2, (uint64_t)&time);
        avvc_CGAffineTransformDecompose((uint64_t)&v232, (uint64_t)&time2);
        if ((*(double *)&time >= 0.0 || time2.b >= 0.0) && (*((double *)&time + 1) >= 0.0 || time2.a >= 0.0))
        {
          double v36 = *(double *)time_16;
        }
        else
        {
          *(double *)&long long time = -*(double *)&time;
          *((double *)&time + 1) = -*((double *)&time + 1);
          double v36 = *(double *)time_16 + dbl_194C5FDB0[*(double *)time_16 < 0.0];
        }
        double v37 = fmod(v36, 6.28318531);
        *(double *)time_16 = v37;
        double v38 = fmod(time2.c, 6.28318531);
        time2.CGFloat c = v38;
        if (vabdd_f64(v37, v38) > 3.14159265)
        {
          if (v37 <= v38)
          {
            p_CGAffineTransform time2 = &time2;
          }
          else
          {
            double v38 = v37;
            p_CGAffineTransform time2 = (CGAffineTransform *)&time;
          }
          p_time2->CGFloat c = v38 + -6.28318531;
        }
        for (uint64_t i = 0; i != 72; i += 8)
          *(double *)&time_16[i - 16] = *(double *)&time_16[i - 16]
                                      + v35 / v34 * (*(double *)((char *)&time2.a + i) - *(double *)&time_16[i - 16]);
        CGAffineTransform v210 = *(CGAffineTransform *)&time_16[8];
        CMTimeRange v232 = *(CMTimeRange *)&time_16[8];
        CGAffineTransformRotate(&v210, (CGAffineTransform *)&v232, *(CGFloat *)time_16);
        CGAffineTransform v231 = v210;
        CGAffineTransformScale((CGAffineTransform *)&v232, &v231, *(CGFloat *)&time, *((CGFloat *)&time + 1));
        CGAffineTransform v210 = (CGAffineTransform)v232;
        long long v41 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v42 = [v31 objectForKey:@"StartTransform"];
        long long time = *(_OWORD *)&v210.a;
        *(_OWORD *)time_16 = *(_OWORD *)&v210.c;
        *(_OWORD *)&time_16[16] = *(_OWORD *)&v210.tx;
        long long v31 = objc_msgSend(v41, "dictionaryWithObjectsAndKeys:", v42, @"StartTransform", (id)FigCreate3x2MatrixArrayFromCGAffineTransform(), @"EndTransform", 0);
        double Seconds = v162;
      }
    }
    long long v43 = (void *)MEMORY[0x1E4F28ED0];
    long long time = v224[0];
    *(void *)time_16 = *(void *)&v224[1];
    *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
    *(void *)&time2.CGFloat c = a3->var0.var3;
    CMTimeSubtract(&v209, (CMTime *)&time, (CMTime *)&time2);
    Float64 v44 = CMTimeGetSeconds(&v209) / Seconds;
    *(float *)&Float64 v44 = v44;
    objc_msgSend(v17, "addObject:", objc_msgSend(v43, "numberWithFloat:", v44));
    objc_msgSend(v17, "addObject:", objc_msgSend(v31, "objectForKey:", @"StartTransform"));
    long long v45 = (void *)MEMORY[0x1E4F28ED0];
    long long time = v224[0];
    *(_OWORD *)time_16 = v224[1];
    *(_OWORD *)&time_16[16] = v224[2];
    CMTimeRangeGetEnd(&lhs, (CMTimeRange *)&time);
    long long time = *(_OWORD *)&a3->var0.var0;
    *(void *)time_16 = a3->var0.var3;
    CMTimeSubtract(&v208, &lhs, (CMTime *)&time);
    Float64 v46 = CMTimeGetSeconds(&v208) / Seconds;
    *(float *)&Float64 v46 = v46;
    objc_msgSend(v17, "addObject:", objc_msgSend(v45, "numberWithFloat:", v46));
    objc_msgSend(v17, "addObject:", objc_msgSend(v31, "objectForKey:", @"EndTransform"));
    if (v25 < v174)
    {
      long long time = v214;
      *(void *)time_16 = v215;
      *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&v220.value;
      *(void *)&time2.CGFloat c = v220.epoch;
      if (CMTimeCompare((CMTime *)&time, (CMTime *)&time2) >= 1)
      {
        long long time = *(_OWORD *)&v218.start.value;
        *(_OWORD *)time_16 = *(_OWORD *)&v218.start.epoch;
        *(_OWORD *)&time_16[16] = *(_OWORD *)&v218.duration.timescale;
        CGAffineTransform time2 = v217;
        if (!CGAffineTransformEqualToTransform((CGAffineTransform *)&time, &time2))
        {
          CGRect v47 = (void *)MEMORY[0x1E4F28ED0];
          long long time = v224[0];
          *(_OWORD *)time_16 = v224[1];
          *(_OWORD *)&time_16[16] = v224[2];
          CMTimeRangeGetEnd(&v205, (CMTimeRange *)&time);
          long long time = *(_OWORD *)&a3->var0.var0;
          *(void *)time_16 = a3->var0.var3;
          CMTimeSubtract(&v206, &v205, (CMTime *)&time);
          Float64 v48 = CMTimeGetSeconds(&v206) / Seconds;
          *(float *)&Float64 v48 = v48;
          objc_msgSend(v17, "addObject:", objc_msgSend(v47, "numberWithFloat:", v48));
          objc_msgSend(v17, "addObject:", objc_msgSend(v31, "objectForKey:", @"EndTransform"));
          v49 = (void *)MEMORY[0x1E4F28ED0];
          long long time = v214;
          *(void *)time_16 = v215;
          *(_OWORD *)&time2.CGFloat a = *(_OWORD *)&a3->var0.var0;
          *(void *)&time2.CGFloat c = a3->var0.var3;
          CMTimeSubtract(&v204, (CMTime *)&time, (CMTime *)&time2);
          Float64 v50 = CMTimeGetSeconds(&v204) / Seconds;
          *(float *)&Float64 v50 = v50;
          objc_msgSend(v17, "addObject:", objc_msgSend(v49, "numberWithFloat:", v50));
          objc_msgSend(v17, "addObject:", objc_msgSend(v31, "objectForKey:", @"EndTransform"));
        }
      }
    }
    long long v27 = 0uLL;
  }
  while (v25 != v171);
  objc_msgSend(v5, "setObject:forKey:", v17, @"TweenedAffineMatrix", 0.0);
  uint64_t v10 = MEMORY[0x1E4F1FA48];
LABEL_51:
  unint64_t v51 = [(NSMutableArray *)self->_layerInstruction->opacityRamps count];
  if (v51 <= 1)
  {
    v53 = (void *)MEMORY[0x1E4F28ED0];
    LODWORD(v52) = 1.0;
LABEL_53:
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v53, "numberWithFloat:", v52), @"ConstantOpacity");
    goto LABEL_86;
  }
  unint64_t v54 = v51 >> 1;
  memset(time_16, 0, 32);
  long long time = 0u;
  v55 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:0];
  if (v55)
  {
    [v55 CMTimeRangeValue];
  }
  else
  {
    memset(time_16, 0, 32);
    long long time = 0u;
  }
  v56 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:1];
  *(void *)&v224[0] = 0x3F8000003F800000;
  [v56 getBytes:v224 length:8];
  if (v54 == 1)
  {
    *(_OWORD *)&time2.CGFloat a = time;
    time2.CGFloat c = *(CGFloat *)time_16;
    *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
    v232.start.CMTimeEpoch epoch = a3->var0.var3;
    if (!CMTimeCompare((CMTime *)&time2, &v232.start))
    {
      LODWORD(v52) = v224[0];
      if (*(float *)v224 == *((float *)v224 + 1))
      {
        v53 = (void *)MEMORY[0x1E4F28ED0];
        goto LABEL_53;
      }
    }
  }
  v57 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3 * v54];
  *(_OWORD *)&time2.CGFloat a = time;
  time2.CGFloat c = *(CGFloat *)time_16;
  *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
  v232.start.CMTimeEpoch epoch = a3->var0.var3;
  if (CMTimeCompare((CMTime *)&time2, &v232.start) >= 1)
  {
    LODWORD(v58) = 1.0;
    uint64_t v59 = [MEMORY[0x1E4F28ED0] numberWithFloat:v58];
    objc_msgSend(v57, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", 0.0));
    [v57 addObject:v59];
    v60 = (void *)MEMORY[0x1E4F28ED0];
    *(_OWORD *)&time2.CGFloat a = time;
    time2.CGFloat c = *(CGFloat *)time_16;
    *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
    v232.start.CMTimeEpoch epoch = a3->var0.var3;
    CMTimeSubtract(&v203, (CMTime *)&time2, &v232.start);
    Float64 v61 = CMTimeGetSeconds(&v203) / Seconds;
    *(float *)&Float64 v61 = v61;
    objc_msgSend(v57, "addObject:", objc_msgSend(v60, "numberWithFloat:", v61));
    [v57 addObject:v59];
  }
  unint64_t v62 = 0;
  if (v54 <= 1) {
    uint64_t v63 = 1;
  }
  else {
    uint64_t v63 = v54;
  }
  uint64_t v175 = v63;
  uint64_t v64 = 1;
  long long v65 = 0uLL;
  long long v169 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v172 = *MEMORY[0x1E4F1FA20];
  long long v166 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  do
  {
    *(_OWORD *)&time2.tdouble x = v65;
    *(_OWORD *)&time2.CGFloat c = v65;
    *(_OWORD *)&time2.CGFloat a = v65;
    v66 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:v64 - 1];
    if (v66) {
      [v66 CMTimeRangeValue];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTimeRange v232 = (CMTimeRange)time2;
    CMTimeRangeGetEnd(&v202, &v232);
    long long v67 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v232.start.CMTimeEpoch epoch = v67;
    *(_OWORD *)&v232.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v201, &v232);
    if (CMTimeCompare(&v202, &v201) >= 1)
    {
      *(_OWORD *)&v232.start.value = *(_OWORD *)&time2.a;
      v232.start.CMTimeEpoch epoch = *(void *)&time2.c;
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
      *(void *)&v231.CGFloat c = a3->var0.var3;
      CMTimeSubtract(&v200, &v232.start, (CMTime *)&v231);
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&p_var1->var0;
      *(void *)&v231.CGFloat c = a3->var1.var3;
      CMTimeSubtract(&v232.start, (CMTime *)&v231, &v200);
      *(_OWORD *)&time2.CGFloat d = *(_OWORD *)&v232.start.value;
      *(void *)&time2.tdouble y = v232.start.epoch;
    }
    memset(v229, 0, 24);
    CMTimeRange v232 = (CMTimeRange)time2;
    CMTimeRangeGetEnd((CMTime *)v229, &v232);
    v68 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:v64];
    v219.CGFloat a = 0.00781250185;
    [v68 getBytes:&v219 length:8];
    v218.start.value = 0x3F8000003F800000;
    *(_OWORD *)&v232.start.value = v172;
    *(_OWORD *)&v232.start.CMTimeEpoch epoch = v169;
    *(_OWORD *)&v232.duration.CMTimeScale timescale = v166;
    if (++v62 < v54)
    {
      v69 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:v64 + 1];
      if (v69) {
        [v69 CMTimeRangeValue];
      }
      else {
        memset(&v231, 0, sizeof(v231));
      }
      CMTimeRange v232 = (CMTimeRange)v231;
      CMTimeRangeGetEnd(&v199, (CMTimeRange *)&v231);
      long long v70 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v231.CGFloat c = v70;
      *(_OWORD *)&v231.tdouble x = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v198, (CMTimeRange *)&v231);
      if (CMTimeCompare(&v199, &v198) >= 1)
      {
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
        *(void *)&v231.CGFloat c = v232.start.epoch;
        *(_OWORD *)v227 = *(_OWORD *)&a3->var0.var0;
        *(void *)&v227[16] = a3->var0.var3;
        CMTimeSubtract(&v197, (CMTime *)&v231, (CMTime *)v227);
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&p_var1->var0;
        *(void *)&v231.CGFloat c = a3->var1.var3;
        CMTimeSubtract(&v232.duration, (CMTime *)&v231, &v197);
      }
      v71 = (void *)[(NSMutableArray *)self->_layerInstruction->opacityRamps objectAtIndex:v64 + 2];
      if (v71) {
        [v71 getBytes:&v218 length:8];
      }
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
      *(void *)&v231.CGFloat c = v232.start.epoch;
      *(_OWORD *)v227 = *(_OWORD *)v229;
      *(void *)&v227[16] = *(void *)&v229[16];
      if (CMTimeCompare((CMTime *)&v231, (CMTime *)v227) < 0)
      {
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&time2.d;
        v231.CGFloat c = time2.ty;
        double v72 = CMTimeGetSeconds((CMTime *)&v231);
        *(_OWORD *)v227 = *(_OWORD *)&v232.start.value;
        *(void *)&v227[16] = v232.start.epoch;
        *(_OWORD *)&v226.CGFloat a = *(_OWORD *)&time2.a;
        v226.CGFloat c = time2.c;
        CMTimeSubtract((CMTime *)&v231, (CMTime *)v227, (CMTime *)&v226);
        time2.tdouble y = v231.c;
        *(_OWORD *)&time2.CGFloat d = *(_OWORD *)&v231.a;
        CGAffineTransform v231 = time2;
        CMTimeRangeGetEnd((CMTime *)v227, (CMTimeRange *)&v231);
        *(_OWORD *)v229 = *(_OWORD *)v227;
        *(void *)&v229[16] = *(void *)&v227[16];
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&time2.d;
        v231.CGFloat c = time2.ty;
        Float64 v73 = CMTimeGetSeconds((CMTime *)&v231);
        *(float *)&Float64 v73 = v73 * (float)(*((float *)&v219.a + 1) - *(float *)&v219.a) / v72 + *(float *)&v219.a;
        HIDWORD(v219.a) = LODWORD(v73);
      }
    }
    v74 = (void *)MEMORY[0x1E4F28ED0];
    *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&time2.a;
    v231.CGFloat c = time2.c;
    *(_OWORD *)v227 = *(_OWORD *)&a3->var0.var0;
    *(void *)&v227[16] = a3->var0.var3;
    CMTimeSubtract(&v196, (CMTime *)&v231, (CMTime *)v227);
    Float64 v75 = CMTimeGetSeconds(&v196) / Seconds;
    *(float *)&Float64 v75 = v75;
    objc_msgSend(v57, "addObject:", objc_msgSend(v74, "numberWithFloat:", v75));
    LODWORD(v76) = LODWORD(v219.a);
    objc_msgSend(v57, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v76));
    v77 = (void *)MEMORY[0x1E4F28ED0];
    CGAffineTransform v231 = time2;
    CMTimeRangeGetEnd(&v194, (CMTimeRange *)&v231);
    *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
    *(void *)&v231.CGFloat c = a3->var0.var3;
    CMTimeSubtract(&v195, &v194, (CMTime *)&v231);
    Float64 v78 = CMTimeGetSeconds(&v195) / Seconds;
    *(float *)&Float64 v78 = v78;
    objc_msgSend(v57, "addObject:", objc_msgSend(v77, "numberWithFloat:", v78));
    LODWORD(v79) = HIDWORD(v219.a);
    objc_msgSend(v57, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v79));
    if (v62 < v54)
    {
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
      *(void *)&v231.CGFloat c = v232.start.epoch;
      *(_OWORD *)v227 = *(_OWORD *)v229;
      *(void *)&v227[16] = *(void *)&v229[16];
      if (CMTimeCompare((CMTime *)&v231, (CMTime *)v227) >= 1 && *((float *)&v219.a + 1) != *(float *)&v218.start.value)
      {
        v80 = (void *)MEMORY[0x1E4F28ED0];
        CGAffineTransform v231 = time2;
        CMTimeRangeGetEnd(&v192, (CMTimeRange *)&v231);
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
        *(void *)&v231.CGFloat c = a3->var0.var3;
        CMTimeSubtract(&v193, &v192, (CMTime *)&v231);
        Float64 v81 = CMTimeGetSeconds(&v193) / Seconds;
        *(float *)&Float64 v81 = v81;
        objc_msgSend(v57, "addObject:", objc_msgSend(v80, "numberWithFloat:", v81));
        LODWORD(v82) = HIDWORD(v219.a);
        objc_msgSend(v57, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v82));
        v83 = (void *)MEMORY[0x1E4F28ED0];
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
        *(void *)&v231.CGFloat c = v232.start.epoch;
        *(_OWORD *)v227 = *(_OWORD *)&a3->var0.var0;
        *(void *)&v227[16] = a3->var0.var3;
        CMTimeSubtract(&v191, (CMTime *)&v231, (CMTime *)v227);
        Float64 v84 = CMTimeGetSeconds(&v191) / Seconds;
        *(float *)&Float64 v84 = v84;
        objc_msgSend(v57, "addObject:", objc_msgSend(v83, "numberWithFloat:", v84));
        LODWORD(v85) = HIDWORD(v219.a);
        objc_msgSend(v57, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", v85));
      }
    }
    v64 += 2;
    long long v65 = 0uLL;
  }
  while (v175 != v62);
  objc_msgSend(v5, "setObject:forKey:", v57, @"TweenedOpacity", 0.0);
  uint64_t v10 = MEMORY[0x1E4F1FA48];
LABEL_86:
  unint64_t v86 = [(NSMutableArray *)self->_layerInstruction->cropRectangleRamps count];
  if (v86 < 2
    || (unint64_t v87 = v86,
        long long time = *(_OWORD *)&p_var1->var0,
        *(void *)time_16 = a3->var1.var3,
        *(_OWORD *)&time2.CGFloat a = *(_OWORD *)v10,
        time2.CGFloat c = *(CGFloat *)(v10 + 16),
        !CMTimeCompare((CMTime *)&time, (CMTime *)&time2)))
  {
    CGFloat v89 = *MEMORY[0x1E4F1DB10];
    CGFloat v90 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    CGFloat v91 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    CGFloat v92 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
LABEL_91:
    CFDictionaryRef v93 = CGRectCreateDictionaryRepresentation(*(CGRect *)&v89);
    v94 = @"ConstantCropRectangle";
    v95 = v5;
    goto LABEL_122;
  }
  unint64_t v176 = v87 >> 1;
  memset(time_16, 0, 32);
  long long time = 0u;
  v88 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:0];
  if (v88)
  {
    [v88 CMTimeRangeValue];
  }
  else
  {
    memset(time_16, 0, 32);
    long long time = 0u;
  }
  v96 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:1];
  CFDictionaryRef v97 = (const __CFDictionary *)[v96 objectForKey:@"StartCropRectangle"];
  memset(&time2, 0, 32);
  CGRectMakeWithDictionaryRepresentation(v97, (CGRect *)&time2);
  CGFloat a = time2.a;
  CGFloat b = time2.b;
  CGFloat c = time2.c;
  CGFloat d = time2.d;
  CFDictionaryRef v102 = (const __CFDictionary *)[v96 objectForKey:@"EndCropRectangle"];
  memset(&time2, 0, 32);
  CGRectMakeWithDictionaryRepresentation(v102, (CGRect *)&time2);
  if (v176 == 1)
  {
    CGFloat v103 = time2.a;
    CGFloat v104 = time2.b;
    CGFloat v105 = time2.c;
    CGFloat v106 = time2.d;
    *(_OWORD *)&time2.CGFloat a = time;
    time2.CGFloat c = *(CGFloat *)time_16;
    *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
    v232.start.CMTimeEpoch epoch = a3->var0.var3;
    if (!CMTimeCompare((CMTime *)&time2, &v232.start))
    {
      v237.origin.double x = a;
      v237.origin.double y = b;
      v237.size.double width = c;
      v237.size.double height = d;
      v240.origin.double x = v103;
      v240.origin.double y = v104;
      v240.size.double width = v105;
      v240.size.double height = v106;
      if (CGRectEqualToRect(v237, v240))
      {
        CGFloat v89 = a;
        CGFloat v90 = b;
        CGFloat v91 = c;
        CGFloat v92 = d;
        goto LABEL_91;
      }
    }
  }
  v107 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3 * v176];
  *(_OWORD *)&time2.CGFloat a = time;
  time2.CGFloat c = *(CGFloat *)time_16;
  *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
  v232.start.CMTimeEpoch epoch = a3->var0.var3;
  int32_t v108 = CMTimeCompare((CMTime *)&time2, &v232.start);
  v109 = (double *)MEMORY[0x1E4F1DB10];
  if (v108 >= 1)
  {
    CFDictionaryRef v110 = CGRectCreateDictionaryRepresentation(*MEMORY[0x1E4F1DB10]);
    objc_msgSend(v107, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:", 0.0));
    [v107 addObject:v110];
    v111 = (void *)MEMORY[0x1E4F28ED0];
    *(_OWORD *)&time2.CGFloat a = time;
    time2.CGFloat c = *(CGFloat *)time_16;
    *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
    v232.start.CMTimeEpoch epoch = a3->var0.var3;
    CMTimeSubtract(&v190, (CMTime *)&time2, &v232.start);
    Float64 v112 = CMTimeGetSeconds(&v190) / v162;
    *(float *)&Float64 v112 = v112;
    objc_msgSend(v107, "addObject:", objc_msgSend(v111, "numberWithFloat:", v112));
    [v107 addObject:v110];
  }
  unint64_t v113 = 0;
  v153 = *((CMTime **)v109 + 1);
  double v154 = *v109;
  double v151 = v109[3];
  double v152 = v109[2];
  uint64_t v114 = v87 >> 1;
  if (v176 <= 1) {
    uint64_t v114 = 1;
  }
  uint64_t v161 = v114;
  uint64_t v115 = 1;
  long long v116 = 0uLL;
  long long v157 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v159 = *MEMORY[0x1E4F1FA20];
  long long v155 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  do
  {
    *(_OWORD *)&time2.tdouble x = v116;
    *(_OWORD *)&time2.CGFloat c = v116;
    *(_OWORD *)&time2.CGFloat a = v116;
    v117 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:v115 - 1];
    if (v117) {
      [v117 CMTimeRangeValue];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTimeRange v232 = (CMTimeRange)time2;
    CMTimeRangeGetEnd(&v189, &v232);
    long long v118 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v232.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v232.start.CMTimeEpoch epoch = v118;
    *(_OWORD *)&v232.duration.CMTimeScale timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v188, &v232);
    if (CMTimeCompare(&v189, &v188) >= 1)
    {
      *(_OWORD *)&v232.start.value = *(_OWORD *)&time2.a;
      v232.start.CMTimeEpoch epoch = *(void *)&time2.c;
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
      *(void *)&v231.CGFloat c = a3->var0.var3;
      CMTimeSubtract(&v187, &v232.start, (CMTime *)&v231);
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&p_var1->var0;
      *(void *)&v231.CGFloat c = a3->var1.var3;
      CMTimeSubtract(&v232.start, (CMTime *)&v231, &v187);
      *(_OWORD *)&time2.CGFloat d = *(_OWORD *)&v232.start.value;
      *(void *)&time2.tdouble y = v232.start.epoch;
    }
    memset(v229, 0, 24);
    CMTimeRange v232 = (CMTimeRange)time2;
    CMTimeRangeGetEnd((CMTime *)v229, &v232);
    v119 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:v115];
    CFDictionaryRef v120 = (const __CFDictionary *)[v119 objectForKey:@"StartCropRectangle"];
    memset(&v232, 0, 32);
    CGRectMakeWithDictionaryRepresentation(v120, (CGRect *)&v232);
    double v121 = *(double *)&v232.start.value;
    double v122 = *(double *)&v232.start.timescale;
    double v123 = *(double *)&v232.start.epoch;
    double v124 = *(double *)&v232.duration.value;
    CFDictionaryRef v125 = (const __CFDictionary *)[v119 objectForKey:@"EndCropRectangle"];
    memset(&v232, 0, 32);
    CGRectMakeWithDictionaryRepresentation(v125, (CGRect *)&v232);
    double v173 = *(double *)&v232.start.value;
    double v170 = *(double *)&v232.start.timescale;
    double v167 = *(double *)&v232.start.epoch;
    rect1CGFloat a = *(double *)&v232.duration.value;
    *(_OWORD *)&v232.start.value = v159;
    *(_OWORD *)&v232.start.CMTimeEpoch epoch = v157;
    ++v113;
    *(_OWORD *)&v232.duration.CMTimeScale timescale = v155;
    if (v113 >= v176)
    {
      CGFloat v128 = *(double *)&v153;
      CGFloat v127 = v154;
      CGFloat v129 = v151;
      CGFloat v130 = v152;
    }
    else
    {
      v126 = (void *)[(NSMutableArray *)self->_layerInstruction->cropRectangleRamps objectAtIndex:v115 + 1];
      if (v126) {
        [v126 CMTimeRangeValue];
      }
      else {
        memset(&v231, 0, sizeof(v231));
      }
      CMTimeRange v232 = (CMTimeRange)v231;
      CMTimeRangeGetEnd(&v186, (CMTimeRange *)&v231);
      long long v131 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v231.CGFloat c = v131;
      *(_OWORD *)&v231.tdouble x = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v185, (CMTimeRange *)&v231);
      if (CMTimeCompare(&v186, &v185) >= 1)
      {
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
        *(void *)&v231.CGFloat c = v232.start.epoch;
        *(_OWORD *)v227 = *(_OWORD *)&a3->var0.var0;
        *(void *)&v227[16] = a3->var0.var3;
        CMTimeSubtract(&v184, (CMTime *)&v231, (CMTime *)v227);
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&p_var1->var0;
        *(void *)&v231.CGFloat c = a3->var1.var3;
        CMTimeSubtract(&v232.duration, (CMTime *)&v231, &v184);
      }
      CFDictionaryRef v132 = (const __CFDictionary *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layerInstruction->cropRectangleRamps, "objectAtIndex:", v115 + 2), "objectForKey:", @"StartCropRectangle");
      memset(&v231, 0, 32);
      CGRectMakeWithDictionaryRepresentation(v132, (CGRect *)&v231);
      CGFloat v127 = v231.a;
      CGFloat v128 = v231.b;
      CGFloat v130 = v231.c;
      CGFloat v129 = v231.d;
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
      *(void *)&v231.CGFloat c = v232.start.epoch;
      *(_OWORD *)v227 = *(_OWORD *)v229;
      *(void *)&v227[16] = *(void *)&v229[16];
      if (CMTimeCompare((CMTime *)&v231, (CMTime *)v227) < 0)
      {
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&time2.d;
        v231.CGFloat c = time2.ty;
        double v150 = CMTimeGetSeconds((CMTime *)&v231);
        *(_OWORD *)v227 = *(_OWORD *)&v232.start.value;
        *(void *)&v227[16] = v232.start.epoch;
        *(_OWORD *)&v226.CGFloat a = *(_OWORD *)&time2.a;
        v226.CGFloat c = time2.c;
        CMTimeSubtract((CMTime *)&v231, (CMTime *)v227, (CMTime *)&v226);
        time2.tdouble y = v231.c;
        *(_OWORD *)&time2.CGFloat d = *(_OWORD *)&v231.a;
        CGAffineTransform v231 = time2;
        CMTimeRangeGetEnd((CMTime *)v227, (CMTimeRange *)&v231);
        *(_OWORD *)v229 = *(_OWORD *)v227;
        *(void *)&v229[16] = *(void *)&v227[16];
        *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&time2.d;
        v231.CGFloat c = time2.ty;
        Float64 v133 = CMTimeGetSeconds((CMTime *)&v231) / v150;
        CGFloat v134 = v121 + v133 * (v173 - v121);
        CGFloat v135 = v122 + v133 * (v170 - v122);
        CGFloat v136 = v123 + v133 * (v167 - v123);
        CGFloat v137 = v124 + v133 * (rect1a - v124);
        v138 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v139 = [v119 objectForKey:@"StartCropRectangle"];
        v238.origin.double x = v134;
        v238.origin.double y = v135;
        v238.size.double width = v136;
        v238.size.double height = v137;
        v119 = objc_msgSend(v138, "dictionaryWithObjectsAndKeys:", v139, @"StartCropRectangle", CGRectCreateDictionaryRepresentation(v238), @"EndCropRectangle", 0);
      }
    }
    v140 = (void *)MEMORY[0x1E4F28ED0];
    *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&time2.a;
    v231.CGFloat c = time2.c;
    *(_OWORD *)v227 = *(_OWORD *)&a3->var0.var0;
    *(void *)&v227[16] = a3->var0.var3;
    CMTimeSubtract(&v183, (CMTime *)&v231, (CMTime *)v227);
    Float64 v141 = CMTimeGetSeconds(&v183) / v162;
    *(float *)&Float64 v141 = v141;
    objc_msgSend(v107, "addObject:", objc_msgSend(v140, "numberWithFloat:", v141));
    objc_msgSend(v107, "addObject:", objc_msgSend(v119, "objectForKey:", @"StartCropRectangle"));
    v142 = (void *)MEMORY[0x1E4F28ED0];
    CGAffineTransform v231 = time2;
    CMTimeRangeGetEnd(&v181, (CMTimeRange *)&v231);
    *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
    *(void *)&v231.CGFloat c = a3->var0.var3;
    CMTimeSubtract(&v182, &v181, (CMTime *)&v231);
    Float64 v143 = CMTimeGetSeconds(&v182) / v162;
    *(float *)&Float64 v143 = v143;
    objc_msgSend(v107, "addObject:", objc_msgSend(v142, "numberWithFloat:", v143));
    objc_msgSend(v107, "addObject:", objc_msgSend(v119, "objectForKey:", @"EndCropRectangle"));
    if (v113 < v176)
    {
      *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
      *(void *)&v231.CGFloat c = v232.start.epoch;
      *(_OWORD *)v227 = *(_OWORD *)v229;
      *(void *)&v227[16] = *(void *)&v229[16];
      if (CMTimeCompare((CMTime *)&v231, (CMTime *)v227) >= 1)
      {
        v239.origin.double x = v173;
        v239.origin.double y = v170;
        v239.size.double width = v167;
        v239.size.double height = rect1a;
        v241.origin.double x = v127;
        v241.origin.double y = v128;
        v241.size.double width = v130;
        v241.size.double height = v129;
        if (!CGRectEqualToRect(v239, v241))
        {
          v144 = (void *)MEMORY[0x1E4F28ED0];
          CGAffineTransform v231 = time2;
          CMTimeRangeGetEnd(&v179, (CMTimeRange *)&v231);
          *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&a3->var0.var0;
          *(void *)&v231.CGFloat c = a3->var0.var3;
          CMTimeSubtract(&v180, &v179, (CMTime *)&v231);
          Float64 v145 = CMTimeGetSeconds(&v180) / v162;
          *(float *)&Float64 v145 = v145;
          objc_msgSend(v107, "addObject:", objc_msgSend(v144, "numberWithFloat:", v145));
          objc_msgSend(v107, "addObject:", objc_msgSend(v119, "objectForKey:", @"EndCropRectangle"));
          v146 = (void *)MEMORY[0x1E4F28ED0];
          *(_OWORD *)&v231.CGFloat a = *(_OWORD *)&v232.start.value;
          *(void *)&v231.CGFloat c = v232.start.epoch;
          *(_OWORD *)v227 = *(_OWORD *)&a3->var0.var0;
          *(void *)&v227[16] = a3->var0.var3;
          CMTimeSubtract(&v178, (CMTime *)&v231, (CMTime *)v227);
          Float64 v147 = CMTimeGetSeconds(&v178) / v162;
          *(float *)&Float64 v147 = v147;
          objc_msgSend(v107, "addObject:", objc_msgSend(v146, "numberWithFloat:", v147));
          objc_msgSend(v107, "addObject:", objc_msgSend(v119, "objectForKey:", @"EndCropRectangle"));
        }
      }
    }
    v115 += 2;
    long long v116 = 0uLL;
  }
  while (v161 != v113);
  v94 = @"TweenedCropRectangle";
  uint64_t v5 = v149;
  v95 = v149;
  CFDictionaryRef v93 = (const __CFDictionary *)v107;
LABEL_122:
  [v95 setObject:v93 forKey:v94];
  return v5;
}

- (void)_setValuesFromDictionary:(id)a3 timeRange:(id *)a4
{
  [(AVVideoCompositionLayerInstruction *)self setTrackID:0];
  [(AVVideoCompositionLayerInstruction *)self _setTransformRamps:0];
  [(AVVideoCompositionLayerInstruction *)self _setOpacityRamps:0];
  [(AVVideoCompositionLayerInstruction *)self _setCropRectangleRamps:0];
  valuePtr[0] = 0;
  CFNumberRef v7 = (const __CFNumber *)[a3 objectForKey:@"SourceVideoTrackID"];
  if (v7)
  {
    CFNumberRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v8, kCFNumberSInt32Type, valuePtr)) {
        [(AVVideoCompositionLayerInstruction *)self setTrackID:valuePtr[0]];
      }
    }
  }
  uint64_t v10 = [a3 objectForKey:@"ConstantAffineMatrix"];
  if (v10)
  {
    long long v94 = 0u;
    memset(&rect, 0, sizeof(rect));
    FigGetCGAffineTransformFrom3x2MatrixArray();
    memset(&t1, 0, sizeof(t1));
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&t2.CGFloat a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t2.CGFloat c = v11;
    *(_OWORD *)&t2.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (!CGAffineTransformEqualToTransform(&t1, &t2))
    {
      *(CGPoint *)&t1.CGFloat a = rect.origin;
      *(CGSize *)&t1.CGFloat c = rect.size;
      *(_OWORD *)&t1.tdouble x = v94;
      *(_OWORD *)&t2.CGFloat a = *(_OWORD *)&a4->var0.var0;
      *(void *)&t2.CGFloat c = a4->var0.var3;
      [(AVVideoCompositionLayerInstruction *)self setTransform:&t1 atTime:&t2];
    }
  }
  CMTimeRange v12 = (void *)[a3 objectForKey:@"ConstantOpacity"];
  long long v13 = v12;
  if (v12)
  {
    [v12 floatValue];
    if (v14 != 1.0)
    {
      rect.origin = *(CGPoint *)&a4->var0.var0;
      *(void *)&rect.size.double width = a4->var0.var3;
      -[AVVideoCompositionLayerInstruction setOpacity:atTime:](self, "setOpacity:atTime:", &rect);
    }
  }
  CFDictionaryRef v15 = (const __CFDictionary *)[a3 objectForKey:@"ConstantCropRectangle"];
  CFDictionaryRef v16 = v15;
  if (v15)
  {
    memset(&rect, 0, sizeof(rect));
    CGRectMakeWithDictionaryRepresentation(v15, &rect);
    double x = rect.origin.x;
    double y = rect.origin.y;
    double width = rect.size.width;
    double height = rect.size.height;
    if (!CGRectEqualToRect(rect, *MEMORY[0x1E4F1DB10]))
    {
      rect.origin = *(CGPoint *)&a4->var0.var0;
      *(void *)&rect.size.double width = a4->var0.var3;
      -[AVVideoCompositionLayerInstruction setCropRectangle:atTime:](self, "setCropRectangle:atTime:", &rect, x, y, width, height);
    }
  }
  p_var1 = (CGPoint *)&a4->var1;
  rect.origin = *(CGPoint *)&a4->var1.var0;
  *(void *)&rect.size.double width = a4->var1.var3;
  float Seconds = CMTimeGetSeconds((CMTime *)&rect);
  if (!v10)
  {
    CGSize v23 = (void *)[a3 objectForKey:@"TweenedAffineMatrix"];
    if (v23)
    {
      Float64 v24 = v23;
      unint64_t v25 = [v23 count];
      if (v25 >= 4)
      {
        unint64_t v26 = v25 >> 2;
        uint64_t v27 = 3;
        do
        {
          objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", v27 - 3), "floatValue");
          float v29 = v28;
          objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", v27 - 1), "floatValue");
          float v31 = v30;
          memset(&var0, 0, sizeof(var0));
          if (v27 == 3)
          {
            CMTime var0 = (CMTime)a4->var0;
          }
          else
          {
            CMTimeMakeWithSeconds(&rhs, (float)(v29 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(void *)&rect.size.double width = a4->var0.var3;
            CMTimeAdd(&var0, (CMTime *)&rect, &rhs);
          }
          memset(&v88, 0, sizeof(v88));
          if (v26 == 1)
          {
            rect.origin = *(CGPoint *)&var0.value;
            *(void *)&rect.size.double width = var0.epoch;
            *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a4->var0.var0;
            *(void *)&t1.CGFloat c = a4->var0.var3;
            CMTimeSubtract(&v87, (CMTime *)&rect, (CMTime *)&t1);
            rect.origin = *p_var1;
            *(void *)&rect.size.double width = a4->var1.var3;
            p_CGRect rect = (CMTime *)&rect;
            long long v33 = &v87;
          }
          else
          {
            CMTimeMakeWithSeconds(&v85, (float)(v31 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(void *)&rect.size.double width = a4->var0.var3;
            CMTimeAdd(&lhs, (CMTime *)&rect, &v85);
            rect.origin = *(CGPoint *)&var0.value;
            *(void *)&rect.size.double width = var0.epoch;
            p_CGRect rect = &lhs;
            long long v33 = (CMTime *)&rect;
          }
          CMTimeSubtract(&v88, p_rect, v33);
          long long v94 = 0u;
          memset(&rect, 0, sizeof(rect));
          [v24 objectAtIndex:v27 - 2];
          FigGetCGAffineTransformFrom3x2MatrixArray();
          memset(&t1, 0, sizeof(t1));
          [v24 objectAtIndex:v27];
          FigGetCGAffineTransformFrom3x2MatrixArray();
          *(_OWORD *)&t2.CGFloat a = *(_OWORD *)&var0.value;
          *(void *)&t2.CGFloat c = var0.epoch;
          *(CMTime *)&duration.CGFloat a = v88;
          CMTimeRangeMake(&v84, (CMTime *)&t2, (CMTime *)&duration);
          *(CGPoint *)&t2.CGFloat a = rect.origin;
          *(CGSize *)&t2.CGFloat c = rect.size;
          *(_OWORD *)&t2.tdouble x = v94;
          CGAffineTransform duration = t1;
          [(AVVideoCompositionLayerInstruction *)self setTransformRampFromStartTransform:&t2 toEndTransform:&duration timeRange:&v84];
          v27 += 4;
          --v26;
        }
        while (v26);
      }
    }
  }
  if (!v13)
  {
    double v34 = (void *)[a3 objectForKey:@"TweenedOpacity"];
    if (v34)
    {
      double v35 = v34;
      unint64_t v36 = [v34 count];
      if (v36 >= 4)
      {
        unint64_t v37 = v36 >> 2;
        uint64_t v38 = 3;
        do
        {
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38 - 3), "floatValue");
          float v40 = v39;
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38 - 1), "floatValue");
          float v42 = v41;
          memset(&rect, 0, 24);
          if (v38 == 3)
          {
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(void *)&rect.size.double width = a4->var0.var3;
          }
          else
          {
            CMTimeMakeWithSeconds(&v82, (float)(v40 * Seconds), 600);
            *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a4->var0.var0;
            *(void *)&t1.CGFloat c = a4->var0.var3;
            CMTimeAdd((CMTime *)&rect, (CMTime *)&t1, &v82);
          }
          memset(&t1, 0, 24);
          if (v37 == 1)
          {
            *(CGPoint *)&t2.CGFloat a = rect.origin;
            t2.CGFloat c = rect.size.width;
            *(_OWORD *)&duration.CGFloat a = *(_OWORD *)&a4->var0.var0;
            *(void *)&duration.CGFloat c = a4->var0.var3;
            CMTimeSubtract(&v81, (CMTime *)&t2, (CMTime *)&duration);
            *(CGPoint *)&t2.CGFloat a = *p_var1;
            *(void *)&t2.CGFloat c = a4->var1.var3;
            p_CGAffineTransform t2 = (CMTime *)&t2;
            Float64 v44 = &v81;
          }
          else
          {
            CMTimeMakeWithSeconds(&v79, (float)(v42 * Seconds), 600);
            *(_OWORD *)&t2.CGFloat a = *(_OWORD *)&a4->var0.var0;
            *(void *)&t2.CGFloat c = a4->var0.var3;
            CMTimeAdd(&v80, (CMTime *)&t2, &v79);
            *(CGPoint *)&t2.CGFloat a = rect.origin;
            t2.CGFloat c = rect.size.width;
            p_CGAffineTransform t2 = &v80;
            Float64 v44 = (CMTime *)&t2;
          }
          CMTimeSubtract((CMTime *)&t1, p_t2, v44);
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38 - 2), "floatValue");
          int v46 = v45;
          objc_msgSend((id)objc_msgSend(v35, "objectAtIndex:", v38), "floatValue");
          int v48 = v47;
          *(CGPoint *)&t2.CGFloat a = rect.origin;
          t2.CGFloat c = rect.size.width;
          *(_OWORD *)&duration.CGFloat a = *(_OWORD *)&t1.a;
          duration.CGFloat c = t1.c;
          CMTimeRangeMake(&v78, (CMTime *)&t2, (CMTime *)&duration);
          LODWORD(v49) = v46;
          LODWORD(v50) = v48;
          [(AVVideoCompositionLayerInstruction *)self setOpacityRampFromStartOpacity:&v78 toEndOpacity:v49 timeRange:v50];
          v38 += 4;
          --v37;
        }
        while (v37);
      }
    }
  }
  if (!v16)
  {
    unint64_t v51 = (void *)[a3 objectForKey:@"TweenedCropRectangle"];
    if (v51)
    {
      double v52 = v51;
      unint64_t v53 = [v51 count];
      if (v53 >= 4)
      {
        unint64_t v54 = v53 >> 2;
        uint64_t v55 = 3;
        float v72 = Seconds;
        do
        {
          objc_msgSend((id)objc_msgSend(v52, "objectAtIndex:", v55 - 3), "floatValue");
          float v57 = v56;
          objc_msgSend((id)objc_msgSend(v52, "objectAtIndex:", v55 - 1), "floatValue");
          float v59 = v58;
          memset(&t1, 0, 24);
          if (v55 == 3)
          {
            *(_OWORD *)&t1.CGFloat a = *(_OWORD *)&a4->var0.var0;
            *(void *)&t1.CGFloat c = a4->var0.var3;
          }
          else
          {
            CMTimeMakeWithSeconds(&v77, (float)(v57 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(void *)&rect.size.double width = a4->var0.var3;
            CMTimeAdd((CMTime *)&t1, (CMTime *)&rect, &v77);
          }
          memset(&t2, 0, 24);
          if (v54 == 1)
          {
            rect.origin = *(CGPoint *)&t1.a;
            rect.size.double width = t1.c;
            *(_OWORD *)&duration.CGFloat a = *(_OWORD *)&a4->var0.var0;
            *(void *)&duration.CGFloat c = a4->var0.var3;
            CMTimeSubtract(&v76, (CMTime *)&rect, (CMTime *)&duration);
            rect.origin = *p_var1;
            *(void *)&rect.size.double width = a4->var1.var3;
            v60 = (CMTime *)&rect;
            Float64 v61 = &v76;
          }
          else
          {
            CMTimeMakeWithSeconds(&v74, (float)(v59 * Seconds), 600);
            rect.origin = *(CGPoint *)&a4->var0.var0;
            *(void *)&rect.size.double width = a4->var0.var3;
            CMTimeAdd(&v75, (CMTime *)&rect, &v74);
            rect.origin = *(CGPoint *)&t1.a;
            rect.size.double width = t1.c;
            v60 = &v75;
            Float64 v61 = (CMTime *)&rect;
          }
          CMTimeSubtract((CMTime *)&t2, v60, v61);
          CFDictionaryRef v62 = (const __CFDictionary *)[v52 objectAtIndex:v55 - 2];
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v62, &rect);
          double v63 = rect.origin.x;
          double v64 = rect.origin.y;
          double v65 = rect.size.width;
          double v66 = rect.size.height;
          CFDictionaryRef v67 = (const __CFDictionary *)[v52 objectAtIndex:v55];
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v67, &rect);
          double v68 = rect.origin.x;
          double v69 = rect.origin.y;
          double v70 = rect.size.width;
          double v71 = rect.size.height;
          rect.origin = *(CGPoint *)&t1.a;
          rect.size.double width = t1.c;
          *(_OWORD *)&duration.CGFloat a = *(_OWORD *)&t2.a;
          duration.CGFloat c = t2.c;
          CMTimeRangeMake(&v73, (CMTime *)&rect, (CMTime *)&duration);
          -[AVVideoCompositionLayerInstruction setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:](self, "setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:", &v73, v63, v64, v65, v66, v68, v69, v70, v71);
          v55 += 4;
          --v54;
          float Seconds = v72;
        }
        while (v54);
      }
    }
  }
}

@end