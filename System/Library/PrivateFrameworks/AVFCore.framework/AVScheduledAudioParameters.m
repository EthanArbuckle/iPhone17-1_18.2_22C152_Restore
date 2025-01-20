@interface AVScheduledAudioParameters
- (AVScheduledAudioParameters)init;
- (AVScheduledAudioParameters)initWithPropertyList:(id)a3;
- (BOOL)_isScheduledRampClass:(id)a3;
- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6;
- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6 rampMode:(int64_t *)a7;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)_ramps;
- (id)_audioCurveOfClass:(Class)a3;
- (id)_audioVolumeCurve;
- (id)_figAudioCurves;
- (id)_getRampOfClass:(Class)a3 forTime:(id *)a4 timeRange:(id *)a5;
- (id)_rampsOfClass:(Class)a3;
- (id)_volumeCurveAsString;
- (id)_volumeCurveKeysForScheduledRampClassNames;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertyList;
- (unint64_t)hash;
- (void)_setRamp:(id)a3;
- (void)_setRamps:(id)a3;
- (void)dealloc;
@end

@implementation AVScheduledAudioParameters

- (AVScheduledAudioParameters)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVScheduledAudioParameters;
  v2 = [(AVScheduledAudioParameters *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AVScheduledAudioParametersInternal);
    v2->_scheduledParametersInternal = v3;
    if (v3)
    {
      CFRetain(v3);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  scheduledParametersInternal = self->_scheduledParametersInternal;
  if (scheduledParametersInternal)
  {

    CFRelease(self->_scheduledParametersInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVScheduledAudioParameters;
  [(AVScheduledAudioParameters *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, volume mix: %@>", NSStringFromClass(v4), self, -[AVScheduledAudioParameters _volumeCurveAsString](self, "_volumeCurveAsString")];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [(AVScheduledAudioParameters *)+[AVMutableScheduledAudioParameters allocWithZone:a3] init];
  [(AVScheduledAudioParameters *)v4 _setRamps:self->_scheduledParametersInternal->parameterRamps];
  return v4;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_scheduledParametersInternal->parameterRamps hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  parameterRamps = self->_scheduledParametersInternal->parameterRamps;
  uint64_t v6 = *(void *)(*((void *)a3 + 1) + 8);
  return [(NSMutableDictionary *)parameterRamps isEqual:v6];
}

- (id)_volumeCurveKeysForScheduledRampClassNames
{
  if (_volumeCurveKeysForScheduledRampClassNames_onceToken != -1) {
    dispatch_once(&_volumeCurveKeysForScheduledRampClassNames_onceToken, &__block_literal_global_28);
  }
  return (id)_volumeCurveKeysForScheduledRampClassNames_figKeysForRampClassNames;
}

id __72__AVScheduledAudioParameters__volumeCurveKeysForScheduledRampClassNames__block_invoke()
{
  v10[8] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v9[0] = NSStringFromClass(v0);
  v10[0] = *MEMORY[0x1E4F32698];
  v1 = (objc_class *)objc_opt_class();
  v9[1] = NSStringFromClass(v1);
  v10[1] = *MEMORY[0x1E4F32668];
  v2 = (objc_class *)objc_opt_class();
  v9[2] = NSStringFromClass(v2);
  v10[2] = *MEMORY[0x1E4F32658];
  v3 = (objc_class *)objc_opt_class();
  v9[3] = NSStringFromClass(v3);
  v10[3] = *MEMORY[0x1E4F32678];
  objc_super v4 = (objc_class *)objc_opt_class();
  v9[4] = NSStringFromClass(v4);
  v10[4] = *MEMORY[0x1E4F32670];
  objc_super v5 = (objc_class *)objc_opt_class();
  v9[5] = NSStringFromClass(v5);
  v10[5] = *MEMORY[0x1E4F32660];
  uint64_t v6 = (objc_class *)objc_opt_class();
  v9[6] = NSStringFromClass(v6);
  v10[6] = *MEMORY[0x1E4F32688];
  v7 = (objc_class *)objc_opt_class();
  v9[7] = NSStringFromClass(v7);
  v10[7] = *MEMORY[0x1E4F32690];
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:8];
  _volumeCurveKeysForScheduledRampClassNames_figKeysForRampClassNames = (uint64_t)result;
  return result;
}

- (BOOL)_isScheduledRampClass:(id)a3
{
  return objc_msgSend(-[AVScheduledAudioParameters _volumeCurveKeysForScheduledRampClassNames](self, "_volumeCurveKeysForScheduledRampClassNames"), "objectForKey:", a3) != 0;
}

- (NSMutableDictionary)_ramps
{
  return self->_scheduledParametersInternal->parameterRamps;
}

- (void)_setRamps:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if ([(AVScheduledAudioParameters *)self _isScheduledRampClass:v10])
        {
          v11 = (void *)[a3 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = (void *)[v11 mutableCopy];
            [(NSMutableDictionary *)v5 setObject:v12 forKey:v10];
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  self->_scheduledParametersInternal->parameterRamps = v5;
}

- (id)_rampsOfClass:(Class)a3
{
  parameterRamps = self->_scheduledParametersInternal->parameterRamps;
  objc_super v4 = NSStringFromClass(a3);
  return (id)[(NSMutableDictionary *)parameterRamps objectForKey:v4];
}

- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6 rampMode:(int64_t *)a7
{
  uint64_t v13 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a3;
  id v14 = [(AVScheduledAudioParameters *)self _getRampOfClass:v13 forTime:&v19 timeRange:a6];
  long long v15 = v14;
  if (v14)
  {
    if (a4)
    {
      [v14 startVolume];
      *(_DWORD *)a4 = v16;
    }
    if (a5)
    {
      [v15 endVolume];
      *(_DWORD *)a5 = v17;
    }
    if (a7) {
      *a7 = [v15 rampMode];
    }
  }
  return v15 != 0;
}

- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  return [(AVScheduledAudioParameters *)self getVolumeRampForTime:&v7 startVolume:a4 endVolume:a5 timeRange:a6 rampMode:0];
}

- (AVScheduledAudioParameters)initWithPropertyList:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(AVScheduledAudioParameters *)self init];
  if (v4)
  {
    int v17 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v21 = [a3 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v21)
      {
        uint64_t v5 = *(void *)v27;
        id v19 = a3;
        v20 = v4;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v27 != v5) {
              objc_enumerationMutation(a3);
            }
            $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *(NSString **)(*((void *)&v26 + 1) + 8 * i);
            if ([(AVScheduledAudioParameters *)v4 _isScheduledRampClass:v7])
            {
              uint64_t v8 = (void *)[a3 objectForKey:v7];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v9 = (void *)[MEMORY[0x1E4F1CA48] array];
                long long v22 = 0u;
                long long v23 = 0u;
                long long v24 = 0u;
                long long v25 = 0u;
                uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v10)
                {
                  uint64_t v11 = v10;
                  uint64_t v12 = *(void *)v23;
                  do
                  {
                    for (uint64_t j = 0; j != v11; ++j)
                    {
                      if (*(void *)v23 != v12) {
                        objc_enumerationMutation(v8);
                      }
                      uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        long long v15 = (void *)[objc_alloc(NSClassFromString(v7)) initWithPropertyList:v14];
                        if (v14) {
                          [v9 addObject:v15];
                        }
                      }
                    }
                    uint64_t v11 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
                  }
                  while (v11);
                }
                a3 = v19;
                objc_super v4 = v20;
                uint64_t v5 = v18;
                if ([v9 count]) {
                  [v17 setObject:v9 forKey:v7];
                }
              }
            }
          }
          uint64_t v21 = [a3 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v21);
      }
    }
    [(AVScheduledAudioParameters *)v4 _setRamps:v17];
  }
  return v4;
}

- (id)propertyList
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v17 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = self;
  obuint64_t j = self->_scheduledParametersInternal->parameterRamps;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * v7);
        v9 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v10 = (void *)[(NSMutableDictionary *)v3->_scheduledParametersInternal->parameterRamps objectForKey:v8];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "propertyList"));
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
        [v17 setObject:v9 forKey:v8];
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  return v17;
}

- (id)_getRampOfClass:(Class)a3 forTime:(id *)a4 timeRange:(id *)a5
{
  if ((a4->var2 & 0x1D) != 1) {
    return 0;
  }
  id v7 = [(AVScheduledAudioParameters *)self _rampsOfClass:a3];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___getRampOfClass_forTime_timeRange___block_invoke;
  v25[3] = &unk_1E57B4790;
  long long v26 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v25[4] = &v28;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v25];
  if (v29[3] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v29[3];
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = objc_msgSend(v8, "objectAtIndex:");
    uint64_t v11 = v12;
    if (a5)
    {
      memset(v24, 0, sizeof(v24));
      long long v23 = 0u;
      if (v12)
      {
        [v12 timeRange];
        if ((~DWORD1(v24[1]) & 5) == 0)
        {
          unint64_t v13 = [v8 count];
          if (v29[3] + 1 < v13)
          {
            long long v21 = 0u;
            long long v22 = 0u;
            long long v20 = 0u;
            uint64_t v14 = objc_msgSend(v8, "objectAtIndex:");
            if (v14)
            {
              [v14 timeRange];
            }
            else
            {
              long long v21 = 0u;
              long long v22 = 0u;
              long long v20 = 0u;
            }
            *(_OWORD *)&lhs.value = v20;
            lhs.epoch = v21;
            *(_OWORD *)&v17.value = v23;
            v17.epoch = *(void *)&v24[0];
            CMTimeSubtract(&v19, &lhs, &v17);
            *(CMTime *)((char *)v24 + 8) = v19;
          }
        }
      }
      long long v15 = v24[0];
      *(_OWORD *)&a5->var0.var0 = v23;
      *(_OWORD *)&a5->var0.int64_t var3 = v15;
      *(_OWORD *)&a5->var1.var1 = v24[1];
    }
  }
  _Block_object_dispose(&v28, 8);
  return v11;
}

BOOL __101__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___getRampOfClass_forTime_timeRange___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  memset(&v12, 0, sizeof(v12));
  if (a2) {
    [a2 timeRange];
  }
  CMTimeRange range = v12;
  CMTime v10 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v10)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&v12.start.value;
  range.start.epoch = v12.start.epoch;
  CMTime v10 = *(CMTime *)(a1 + 40);
  int32_t v7 = CMTimeCompare(&range.start, &v10);
  if (v7 < 1)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v8 + 24) < a3) {
      *(void *)(v8 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    *a4 = 1;
  }
  return v7 > 0;
}

- (void)_setRamp:(id)a3
{
  if (a3)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    if ([(AVScheduledAudioParameters *)self _isScheduledRampClass:NSStringFromClass(v6)])
    {
      id v7 = [(AVScheduledAudioParameters *)self _rampsOfClass:objc_opt_class()];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v28 = 0u;
      [a3 timeRange];
      long long v25 = v28;
      long long v26 = v29;
      long long v27 = v30;
      if (AVScheduledParameterRampsIncludesRampThatOverlapsTimeRange(v7, &v25))
      {
        long long v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"The timeRange of a ramp must not overlap the timeRange of an existing ramp.", v8, v9, v10, v11, v12, v19.value), 0 reason userInfo];
        objc_exception_throw(v18);
      }
      if (!v7)
      {
        id v7 = (id)[MEMORY[0x1E4F1CA48] array];
        parameterRamps = self->_scheduledParametersInternal->parameterRamps;
        if (!parameterRamps)
        {
          self->_scheduledParametersInternal->parameterRamps = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
          parameterRamps = self->_scheduledParametersInternal->parameterRamps;
        }
        uint64_t v14 = (objc_class *)objc_opt_class();
        [(NSMutableDictionary *)parameterRamps setObject:v7 forKey:NSStringFromClass(v14)];
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __76__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___setRamp___block_invoke;
      v21[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
      long long v22 = v28;
      long long v23 = v29;
      long long v24 = v30;
      uint64_t v15 = [v7 indexOfObjectPassingTest:v21];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v7 addObject:a3];
      }
      else
      {
        uint64_t v16 = v15;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v25 = 0u;
        CMTime v17 = (void *)[v7 objectAtIndex:v15];
        if (v17)
        {
          [v17 timeRange];
        }
        else
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v25 = 0u;
        }
        *(_OWORD *)&time1.value = v25;
        time1.epoch = v26;
        *(_OWORD *)&v19.value = v28;
        v19.epoch = v29;
        if (CMTimeCompare(&time1, &v19)) {
          [v7 insertObject:a3 atIndex:v16];
        }
        else {
          [v7 replaceObjectAtIndex:v16 withObject:a3];
        }
      }
    }
  }
}

BOOL __76__AVScheduledAudioParameters_AVScheduledAudioParameters_Internal___setRamp___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    [a2 timeRange];
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
  int32_t v6 = CMTimeCompare(&time1, &v8);
  if ((v6 & 0x80000000) == 0) {
    *a4 = 1;
  }
  return v6 >= 0;
}

- (id)_audioCurveOfClass:(Class)a3
{
  id v4 = -[AVScheduledAudioParameters _rampsOfClass:](self, "_rampsOfClass:");
  uint64_t v5 = [v4 count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend((id)-[objc_class _defaultAdditionalFigRepresentationObjects](a3, "_defaultAdditionalFigRepresentationObjects"), "count");
  CMTime v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:(v7 + 2) * v6];
  uint64_t v9 = (void *)[v4 objectAtIndex:0];
  if (v9)
  {
    [v9 timeRange];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
  }
  long long v31 = v28;
  CMTimeEpoch v32 = v29;
  *(_OWORD *)&time1.start.value = v28;
  time1.start.epoch = v29;
  long long v21 = *MEMORY[0x1E4F1FA48];
  *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48];
  CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  time2.start.epoch = v10;
  if (CMTimeCompare(&time1.start, &time2.start) >= 1)
  {
    uint64_t v11 = [(objc_class *)a3 defaultValue];
    uint64_t v12 = [(objc_class *)a3 _defaultAdditionalFigRepresentationObjects];
    *(_OWORD *)&time1.start.value = v21;
    time1.start.epoch = v10;
    [v8 addObject:NSDictionaryFromCMTime(&time1.start)];
    [v8 addObject:v11];
    [v8 addObjectsFromArray:v12];
    *(_OWORD *)&time1.start.value = v31;
    time1.start.epoch = v32;
    [v8 addObject:NSDictionaryFromCMTime(&time1.start)];
    [v8 addObject:v11];
    [v8 addObjectsFromArray:v12];
  }
  if (v6 >= 1)
  {
    uint64_t v13 = 0;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v22 = *MEMORY[0x1E4F1FA20];
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    do
    {
      uint64_t v14 = objc_msgSend(v4, "objectAtIndex:", v13, v19, v20);
      uint64_t v15 = v14;
      memset(&time1, 0, sizeof(time1));
      if (v14) {
        [v14 timeRange];
      }
      memset(&v26, 0, sizeof(v26));
      CMTimeRange time2 = time1;
      CMTimeRangeGetEnd(&v26, &time2);
      *(_OWORD *)&time2.start.value = v22;
      *(_OWORD *)&time2.start.epoch = v20;
      *(_OWORD *)&time2.duration.timescale = v19;
      if (++v13 >= v6)
      {
        CMTime v17 = 0;
      }
      else
      {
        uint64_t v16 = (void *)[v4 objectAtIndex:v13];
        CMTime v17 = v16;
        if (v16) {
          [v16 timeRange];
        }
        else {
          memset(&v24, 0, sizeof(v24));
        }
        CMTimeRange time2 = v24;
        CMTime v23 = v26;
        if (CMTimeCompare(&v24.start, &v23) < 0)
        {
          *(_OWORD *)&v24.start.value = *(_OWORD *)&time2.start.value;
          v24.start.epoch = time2.start.epoch;
          uint64_t v15 = (void *)[v15 scheduledParameterRampInterpolatedToTime:&v24];
        }
      }
      *(_OWORD *)&v24.start.value = *(_OWORD *)&time1.start.value;
      v24.start.epoch = time1.start.epoch;
      [v8 addObject:NSDictionaryFromCMTime(&v24.start)];
      objc_msgSend(v8, "addObject:", objc_msgSend(v15, "startValue"));
      objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v15, "_additionalFigRepresentationObjects"));
      if ((v26.flags & 0x1D) == 1)
      {
        v24.start = v26;
        [v8 addObject:NSDictionaryFromCMTime(&v24.start)];
        objc_msgSend(v8, "addObject:", objc_msgSend(v15, "endValue"));
        objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v15, "_additionalFigRepresentationObjects"));
      }
      if (v17)
      {
        *(_OWORD *)&v24.start.value = *(_OWORD *)&time2.start.value;
        v24.start.epoch = time2.start.epoch;
        CMTime v23 = v26;
        if (CMTimeCompare(&v24.start, &v23) >= 1
          && (objc_msgSend((id)objc_msgSend(v15, "endValue"), "isEqual:", objc_msgSend(v17, "startValue")) & 1) == 0)
        {
          *(_OWORD *)&v24.start.value = *(_OWORD *)&time2.start.value;
          v24.start.epoch = time2.start.epoch;
          [v8 addObject:NSDictionaryFromCMTime(&v24.start)];
          objc_msgSend(v8, "addObject:", objc_msgSend(v15, "endValue"));
          objc_msgSend(v8, "addObjectsFromArray:", -[objc_class _defaultAdditionalFigRepresentationObjects](a3, "_defaultAdditionalFigRepresentationObjects"));
        }
      }
    }
    while (v6 != v13);
  }
  return v8;
}

- (id)_audioVolumeCurve
{
  uint64_t v3 = objc_opt_class();
  return [(AVScheduledAudioParameters *)self _audioCurveOfClass:v3];
}

- (id)_figAudioCurves
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id result = (id)[(NSMutableDictionary *)self->_scheduledParametersInternal->parameterRamps count];
  if (result)
  {
    id v4 = [(AVScheduledAudioParameters *)self _volumeCurveKeysForScheduledRampClassNames];
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    parameterRamps = self->_scheduledParametersInternal->parameterRamps;
    uint64_t v7 = [(NSMutableDictionary *)parameterRamps countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(parameterRamps);
          }
          uint64_t v11 = *(NSString **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v4 objectForKey:v11];
          if (v12)
          {
            uint64_t v13 = v12;
            id v14 = [(AVScheduledAudioParameters *)self _audioCurveOfClass:NSClassFromString(v11)];
            if (v14) {
              [v5 setObject:v14 forKey:v13];
            }
          }
        }
        uint64_t v8 = [(NSMutableDictionary *)parameterRamps countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    if ([v5 count]) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)_volumeCurveAsString
{
  long long v22 = (void *)[MEMORY[0x1E4F28E78] string];
  id v3 = [(AVScheduledAudioParameters *)self _audioVolumeCurve];
  unint64_t v4 = [v3 count];
  if (v4 >= 3)
  {
    unint64_t v5 = 0;
    unint64_t v6 = v4 / 3;
    unint64_t v7 = v4 / 3 - 1;
    uint64_t v8 = &stru_1EE5953B8;
    uint64_t v9 = 2;
    for (uint64_t i = 4; ; i += 3)
    {
      CMTimeMakeFromDictionary(&time, (CFDictionaryRef)[v3 objectAtIndex:i - 4]);
      double Seconds = CMTimeGetSeconds(&time);
      objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", i - 3), "floatValue");
      float v13 = v12;
      uint64_t v14 = [v3 objectAtIndex:i - 2];
      float v15 = 0.0;
      float v16 = 0.0;
      if (v7 != v5)
      {
        CMTimeMakeFromDictionary(&v23, (CFDictionaryRef)objc_msgSend(v3, "objectAtIndex:", i - 1, 0.0));
        float v15 = CMTimeGetSeconds(&v23);
        objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", i), "floatValue");
      }
      float v17 = Seconds;
      if (v9 == 2) {
        long long v18 = @"at";
      }
      else {
        long long v18 = @"through";
      }
      long long v19 = &stru_1EE5953B8;
      uint64_t v20 = v8;
      if (v7 <= v5) {
        goto LABEL_16;
      }
      if (v15 != v17) {
        break;
      }
      if (v13 != v16)
      {
        long long v19 = @", changes instantaneously to ";
        uint64_t v20 = &stru_1EE5953B8;
        uint64_t v9 = 2;
LABEL_16:
        [v22 appendString:objc_msgSend(NSString, "stringWithFormat:", @"volume %1.3f %@ time %1.3f%@%@", v13, v18, v17, v8, v19)];
        goto LABEL_17;
      }
      uint64_t v9 = 0;
      uint64_t v20 = &stru_1EE5953B8;
LABEL_17:
      ++v5;
      uint64_t v8 = v20;
      if (v6 == v5) {
        return v22;
      }
    }
    if (v13 == v16)
    {
      uint64_t v9 = 0;
      long long v19 = @", holds steady at ";
      uint64_t v20 = &stru_1EE5953B8;
    }
    else
    {
      uint64_t v20 = (__CFString *)[NSString stringWithFormat:@" with %@ ramp style", v14];
      long long v19 = @", ramps to ";
      uint64_t v9 = 1;
    }
    goto LABEL_16;
  }
  return v22;
}

@end