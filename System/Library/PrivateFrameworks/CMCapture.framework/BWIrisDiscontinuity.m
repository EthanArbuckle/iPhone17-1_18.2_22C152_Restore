@interface BWIrisDiscontinuity
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)containsVideoBufferTime:(id *)a3;
- (BOOL)shouldKeepBufferWithTime:(id *)a3 forceKeepingBuffer:(BOOL)a4 nextAdjustedTimeInOut:(id *)a5 discontinuityFrameAttributesOut:(id *)a6;
- (BWIrisDiscontinuity)initWithTime:(id *)a3 duration:(id *)a4 targetFrameDuration:(id *)a5 onlyRetime:(BOOL)a6 generateIFrames:(BOOL)a7 timeSkews:(id)a8;
- (uint64_t)_offsetIndexFromDiscontinuityForTime:(uint64_t)a1;
- (void)dealloc;
- (void)resetWithNewTimeSkews:(id)a3;
@end

@implementation BWIrisDiscontinuity

- (BWIrisDiscontinuity)initWithTime:(id *)a3 duration:(id *)a4 targetFrameDuration:(id *)a5 onlyRetime:(BOOL)a6 generateIFrames:(BOOL)a7 timeSkews:(id)a8
{
  v28.receiver = self;
  v28.super_class = (Class)BWIrisDiscontinuity;
  v14 = [(BWIrisDiscontinuity *)&v28 init];
  if ((a4->var2 & 1) != 0 && a8 && (a5->var2 & 1) != 0 && [a8 count])
  {
    if (v14)
    {
      long long v16 = *(_OWORD *)&a3->var0;
      *((void *)v14 + 3) = a3->var3;
      *(_OWORD *)(v14 + 8) = v16;
      long long v17 = *(_OWORD *)&a4->var0;
      *((void *)v14 + 6) = a4->var3;
      *((_OWORD *)v14 + 2) = v17;
      long long v18 = *(_OWORD *)&a5->var0;
      *(void *)(v14 + 108) = a5->var3;
      *(_OWORD *)(v14 + 92) = v18;
      v14[116] = a6;
      v14[117] = 0;
      v14[118] = a7;
      *((void *)v14 + 7) = a8;
      if (!a6)
      {
        CMTime time = (CMTime)*a5;
        CMTimeMultiply(&time2, &time, 3);
        CMTime time = (CMTime)*a4;
        if (CMTimeCompare(&time, &time2) >= 1)
        {
          CMTimeMake(&v25, 1, 29);
          CMTime time = (CMTime)*a5;
          if (CMTimeCompare(&time, &v25) < 0)
          {
            v19 = &unk_1EFB04220;
            *((void *)v14 + 8) = v19;
            *((_DWORD *)v14 + 22) = 1;
            if (!v19) {
              return (BWIrisDiscontinuity *)v14;
            }
            goto LABEL_22;
          }
          CMTimeMake(&v24, 1, 23);
          CMTime time = (CMTime)*a5;
          if (CMTimeCompare(&time, &v24) < 0)
          {
            v19 = &unk_1EFB04238;
            *((void *)v14 + 8) = v19;
            int v20 = 2;
          }
          else
          {
            CMTimeMake(&v23, 1, 19);
            CMTime time = (CMTime)*a5;
            if (CMTimeCompare(&time, &v23) < 0)
            {
              v19 = &unk_1EFB04250;
              *((void *)v14 + 8) = v19;
              int v20 = 3;
            }
            else
            {
              CMTimeMake(&v22, 1, 16);
              CMTime time = (CMTime)*a5;
              if (CMTimeCompare(&time, &v22) < 0)
              {
                v19 = &unk_1EFB04268;
                *((void *)v14 + 8) = v19;
                int v20 = 4;
              }
              else
              {
                CMTime time = (CMTime)*a5;
                CMTimeMultiply(&v21, &time, 6);
                CMTime time = (CMTime)*a4;
                if (CMTimeCompare(&time, &v21) < 1)
                {
                  v19 = &unk_1EFB04298;
                  *((void *)v14 + 8) = v19;
                  *((_DWORD *)v14 + 22) = 6;
                  if (!v19) {
                    return (BWIrisDiscontinuity *)v14;
                  }
                  goto LABEL_22;
                }
                v19 = &unk_1EFB04280;
                *((void *)v14 + 8) = v19;
                int v20 = 5;
              }
            }
          }
          *((_DWORD *)v14 + 22) = v20;
          if (v19)
          {
LABEL_22:
            *((void *)v14 + 9) = objc_msgSend((id)objc_msgSend(v19, "firstObject"), "integerValue") - 1;
            *((void *)v14 + 10) = objc_msgSend((id)objc_msgSend(*((id *)v14 + 8), "lastObject"), "integerValue") + 2;
          }
        }
      }
    }
  }
  else
  {

    return 0;
  }
  return (BWIrisDiscontinuity *)v14;
}

- (void)resetWithNewTimeSkews:(id)a3
{
  v4 = (NSArray *)a3;

  self->_timeSkews = v4;
  BYTE5(self->_targetFrameDuration.epoch) = 0;
  HIBYTE(self->_targetFrameDuration.epoch) = 0;
}

- (BOOL)containsVideoBufferTime:(id *)a3
{
  if (BYTE4(self->_targetFrameDuration.epoch))
  {
    memset(&v10, 0, sizeof(v10));
    CMTime lhs = (CMTime)self->_discontinuityTime;
    CMTime duration = (CMTime)self->_duration;
    CMTimeAdd(&v10, &lhs, &duration);
    CMTime lhs = (CMTime)*a3;
    CMTime duration = (CMTime)self->_discontinuityTime;
    if ((CMTimeCompare(&lhs, &duration) & 0x80000000) == 0)
    {
      CMTime lhs = (CMTime)*a3;
      CMTime duration = v10;
      return CMTimeCompare(&lhs, &duration) >> 31;
    }
LABEL_6:
    LOBYTE(v5) = 0;
    return v5;
  }
  CMTime v10 = *(CMTime *)a3;
  int64_t v6 = -[BWIrisDiscontinuity _offsetIndexFromDiscontinuityForTime:]((uint64_t)self, &v10);
  if (v6 < self->_recipeMinDisplacement || v6 > self->_recipeMaxDisplacement) {
    goto LABEL_6;
  }
  if (v6 < 1)
  {
    LOBYTE(v5) = 1;
    BYTE5(self->_targetFrameDuration.epoch) = 1;
  }
  else
  {
    LOBYTE(v5) = BYTE5(self->_targetFrameDuration.epoch) != 0;
  }
  return v5;
}

- (uint64_t)_offsetIndexFromDiscontinuityForTime:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 56);
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = 0;
    uint64_t v16 = *(void *)v21;
    v8 = (CMTime *)(a1 + 8);
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v14 = v7 + v6;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        if (v12) {
          [*(id *)(*((void *)&v20 + 1) + 8 * v11) original];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        CMTime time2 = *v8;
        if (!CMTimeCompare(&time1, &time2)) {
          uint64_t v9 = v7 + v11;
        }
        if (v12) {
          [v12 original];
        }
        else {
          memset(&v17, 0, sizeof(v17));
        }
        CMTime time2 = *a2;
        if (!CMTimeCompare(&v17, &time2)) {
          uint64_t v10 = v7 + v11;
        }
        if (v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL) {
          return v10 - v9;
        }
        ++v11;
      }
      while (v6 != v11);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v7 = v14;
      if (v6) {
        continue;
      }
      break;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (BOOL)shouldKeepBufferWithTime:(id *)a3 forceKeepingBuffer:(BOOL)a4 nextAdjustedTimeInOut:(id *)a5 discontinuityFrameAttributesOut:(id *)a6
{
  BOOL v8 = a4;
  CMTime v23 = *(CMTime *)a3;
  uint64_t v11 = -[BWIrisDiscontinuity _offsetIndexFromDiscontinuityForTime:]((uint64_t)self, &v23);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int recipeIdentifier = 0;
    char v13 = 0;
    BOOL v14 = 0;
    BOOL result = 1;
LABEL_3:
    int64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_27;
  }
  if (BYTE4(self->_targetFrameDuration.epoch)) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = !v8;
  }
  if (!v17)
  {
    if (a5->var2)
    {
      *(_OWORD *)&lhs.value = *(_OWORD *)&a5->var0;
      CMTimeEpoch var3 = a5->var3;
    }
    else
    {
      *(_OWORD *)&lhs.value = *(_OWORD *)&a3->var0;
      CMTimeEpoch var3 = a3->var3;
    }
    lhs.epoch = var3;
    CMTime v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
    CMTimeAdd(&v23, &lhs, &v21);
    int recipeIdentifier = 0;
    char v13 = 0;
    BOOL v14 = 0;
    *(CMTime *)a5 = v23;
    goto LABEL_26;
  }
  int64_t v16 = v11;
  int v19 = !-[NSArray containsObject:](self->_recipe, "containsObject:", [NSNumber numberWithInteger:v11]);
  if (BYTE6(self->_targetFrameDuration.epoch) && !HIBYTE(self->_targetFrameDuration.epoch)) {
    int v19 = 1;
  }
  if (!v16)
  {
    CMTime lhs = (CMTime)*a5;
    CMTime v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
    CMTimeAdd(&v23, &lhs, &v21);
    *(CMTime *)a5 = v23;
  }
  if (a5->var2)
  {
    if ((v19 | !-[NSArray containsObject:](self->_recipe, "containsObject:", [NSNumber numberWithInteger:v16 - 1])) == 1)
    {
      CMTime lhs = (CMTime)*a5;
      CMTime v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
      CMTimeAdd(&v23, &lhs, &v21);
      *(CMTime *)a5 = v23;
    }
    if (!v19)
    {
      BOOL result = 0;
      int recipeIdentifier = 0;
      char v13 = 0;
      BOOL v14 = 0;
      goto LABEL_3;
    }
  }
  else if ((v19 & 1) == 0)
  {
    CMTime lhs = (CMTime)*a3;
    CMTime v21 = *(CMTime *)(&self->_recipeIdentifier + 1);
    CMTimeAdd(&v23, &lhs, &v21);
    BOOL result = 0;
    int recipeIdentifier = 0;
    char v13 = 0;
    BOOL v14 = 0;
    *(CMTime *)a5 = v23;
    goto LABEL_3;
  }
  if (BYTE4(self->_targetFrameDuration.epoch)) {
    goto LABEL_24;
  }
  char v13 = BYTE6(self->_targetFrameDuration.epoch);
  if (!v13)
  {
    int recipeIdentifier = 0;
    goto LABEL_25;
  }
  if (v16 < self->_recipeMinDisplacement
    || (int64_t recipeMaxDisplacement = self->_recipeMaxDisplacement, v16 > recipeMaxDisplacement))
  {
LABEL_24:
    int recipeIdentifier = 0;
    char v13 = 0;
LABEL_25:
    BOOL v14 = 0;
LABEL_26:
    int64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL result = 1;
    goto LABEL_27;
  }
  if (HIBYTE(self->_targetFrameDuration.epoch))
  {
    char v13 = v16 == recipeMaxDisplacement;
  }
  else
  {
    char v13 = 1;
    HIBYTE(self->_targetFrameDuration.epoch) = 1;
  }
  int recipeIdentifier = self->_recipeIdentifier;
  BOOL result = 1;
  BOOL v14 = 1;
LABEL_27:
  a6->var0 = v14;
  a6->var1 = v13;
  *(_DWORD *)(&a6->var1 + 1) = 0;
  *(_WORD *)(&a6->var1 + 5) = 0;
  a6->var2 = v16;
  a6->CMTimeEpoch var3 = recipeIdentifier;
  *(&a6->var3 + 1) = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[3].var3 + 4);
  retstr->CMTimeEpoch var3 = *(void *)&self[4].var2;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIrisDiscontinuity;
  [(BWIrisDiscontinuity *)&v3 dealloc];
}

@end