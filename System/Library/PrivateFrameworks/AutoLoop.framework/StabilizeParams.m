@interface StabilizeParams
+ (id)stabilizeParams;
+ (id)stabilizeParamsFromNSDictionary:(id)a3;
+ (id)stabilizeParamsFromURL:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)roiLength;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)roiStart;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForFrame:(SEL)a3;
- (BOOL)passThrough;
- (BOOL)sparseFrames;
- (BOOL)writeToURL:(id)a3;
- (CGRect)cropRect;
- (StabilizeParams)init;
- (id).cxx_construct;
- (id)infoAsDict;
- (id)initFromDict:(id)a3;
- (unsigned)numFrames;
- (unsigned)version;
- (void)append:(id *)a3;
- (void)frameTimes;
- (void)getFrameInfo:(unsigned int)a3 frameInfo:(id *)a4;
- (void)setCropRect:(CGRect)a3;
- (void)setPassThrough:(BOOL)a3;
- (void)setRoiLength:(id *)a3;
- (void)setRoiStart:(id *)a3;
- (void)setSparseFrames:(BOOL)a3;
@end

@implementation StabilizeParams

- (StabilizeParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)StabilizeParams;
  result = [(StabilizeParams *)&v7 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1FA48];
    long long v4 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)(&result->version + 1) = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)((char *)&result->roiStart.epoch + 4) = v4;
    *(void *)&result->numFrames = 0x300000000;
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->cropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    uint64_t v6 = *(void *)(v3 + 16);
    *(void *)&result->roiStart.flags = v6;
    *(void *)&result->roiLength.flags = v6;
    result->cropRect.size = v5;
    *(_WORD *)&result->passThrough = 0;
  }
  return result;
}

+ (id)stabilizeParams
{
  v2 = objc_alloc_init(StabilizeParams);

  return v2;
}

+ (id)stabilizeParamsFromURL:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3];
  if (v3) {
    id v4 = [[StabilizeParams alloc] initFromDict:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)append:(id *)a3
{
  value = self->mFrameInfo.__end_cap_.__value_;
  p_end_cap = &self->mFrameInfo.__end_cap_;
  uint64_t v6 = value;
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v14 = p_end_cap[-2].__value_;
    unint64_t v15 = 0xEEEEEEEEEEEEEEEFLL * ((v8 - v14) >> 2);
    unint64_t v16 = v15 + 1;
    if (v15 + 1 > 0x444444444444444) {
      sub_1DD3A9B50();
    }
    unint64_t v17 = 0xEEEEEEEEEEEEEEEFLL * ((v6 - v14) >> 2);
    if (2 * v17 > v16) {
      unint64_t v16 = 2 * v17;
    }
    if (v17 >= 0x222222222222222) {
      unint64_t v18 = 0x444444444444444;
    }
    else {
      unint64_t v18 = v16;
    }
    if (v18) {
      v19 = (char *)sub_1DD3E2F8C((uint64_t)p_end_cap, v18);
    }
    else {
      v19 = 0;
    }
    v20 = &v19[60 * v15];
    v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v19[60 * v18];
    long long v22 = *(_OWORD *)a3->var0;
    long long v23 = *(_OWORD *)&a3->var0[4];
    long long v24 = *(_OWORD *)&a3->var0[8];
    *(_OWORD *)(v20 + 44) = *(_OWORD *)((char *)&a3->var1.var0 + 4);
    *((_OWORD *)v20 + 1) = v23;
    *((_OWORD *)v20 + 2) = v24;
    *(_OWORD *)v20 = v22;
    v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v20 + 60);
    begin = self->mFrameInfo.__begin_;
    end = self->mFrameInfo.__end_;
    if (end != begin)
    {
      do
      {
        long long v27 = *(_OWORD *)((char *)end - 60);
        long long v28 = *(_OWORD *)((char *)end - 44);
        long long v29 = *(_OWORD *)((char *)end - 28);
        *((_OWORD *)v20 - 1) = *((_OWORD *)end - 1);
        *(_OWORD *)(v20 - 28) = v29;
        *(_OWORD *)(v20 - 44) = v28;
        *(_OWORD *)(v20 - 60) = v27;
        v20 -= 60;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 60);
      }
      while (end != begin);
      end = *p_value;
    }
    self->mFrameInfo.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v20;
    self->mFrameInfo.__end_ = v12;
    self->mFrameInfo.__end_cap_.__value_ = v21;
    if (end) {
      operator delete(end);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)a3->var0;
    long long v10 = *(_OWORD *)&a3->var0[4];
    long long v11 = *(_OWORD *)&a3->var0[8];
    *(_OWORD *)((char *)v8 + 44) = *(_OWORD *)((char *)&a3->var1.var0 + 4);
    *((_OWORD *)v8 + 1) = v10;
    *((_OWORD *)v8 + 2) = v11;
    *(_OWORD *)v8 = v9;
    v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v8 + 60);
  }
  self->mFrameInfo.__end_ = v12;
  ++self->numFrames;
}

- (void)getFrameInfo:(unsigned int)a3 frameInfo:(id *)a4
{
  begin = self->mFrameInfo.__begin_;
  if (0xEEEEEEEEEEEEEEEFLL * ((self->mFrameInfo.__end_ - begin) >> 2) <= a3)
  {
    sub_1DD3DBB58((uint64_t)a4);
    uint64_t v10 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&a4->var0[9] = *MEMORY[0x1E4F1FA48];
    *(void *)&a4->var1.var2 = *(void *)(v10 + 16);
  }
  else
  {
    uint64_t v6 = (long long *)((char *)begin + 60 * a3);
    long long v7 = *v6;
    long long v8 = v6[1];
    long long v9 = v6[2];
    *(_OWORD *)((char *)&a4->var1.var0 + 4) = *(long long *)((char *)v6 + 44);
    *(_OWORD *)&a4->var0[4] = v8;
    *(_OWORD *)&a4->var0[8] = v9;
    *(_OWORD *)a4->var0 = v7;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForFrame:(SEL)a3
{
  uint64_t v4 = *(void *)&self->var1;
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((self->var3 - v4) >> 2);
  uint64_t v6 = v4 + 60 * a4 + 36;
  if (v5 <= a4) {
    long long v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E4F1FA48];
  }
  else {
    long long v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v6;
  }
  *retstr = *v7;
  return self;
}

- (BOOL)writeToURL:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(StabilizeParams *)self infoAsDict];
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 writeToURL:v4 atomically:1];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)infoAsDict
{
  v26 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->numFrames];
  for (unint64_t i = 0; i < [(StabilizeParams *)self numFrames]; ++i)
  {
    id v4 = (_OWORD *)((char *)self->mFrameInfo.__begin_ + 60 * i);
    long long v5 = v4[1];
    v27[0] = *v4;
    v27[1] = v5;
    v28[0] = v4[2];
    *(_OWORD *)((char *)v28 + 12) = *(_OWORD *)((char *)v4 + 44);
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    char v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:9];
    for (uint64_t j = 0; j != 36; j += 4)
    {
      LODWORD(v8) = *(_DWORD *)((char *)v27 + j);
      uint64_t v10 = [NSNumber numberWithFloat:v8];
      [v7 addObject:v10];
    }
    [v6 setObject:v7 forKeyedSubscript:@"Homographies"];
    long long v11 = [NSNumber numberWithLongLong:*(void *)((char *)v28 + 4)];
    [v6 setObject:v11 forKeyedSubscript:@"FrameTimeV"];
    v12 = [NSNumber numberWithInt:HIDWORD(v28[0])];

    [v6 setObject:v12 forKeyedSubscript:@"FrameTimeS"];
    [v26 addObject:v6];
  }
  v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  v14 = [NSNumber numberWithUnsignedInt:self->version];
  [v13 setObject:v14 forKeyedSubscript:@"Version"];
  unint64_t v15 = [NSNumber numberWithDouble:self->cropRect.origin.x];

  [v13 setObject:v15 forKeyedSubscript:@"CropRectX"];
  unint64_t v16 = [NSNumber numberWithDouble:self->cropRect.origin.y];

  [v13 setObject:v16 forKeyedSubscript:@"CropRectY"];
  unint64_t v17 = [NSNumber numberWithDouble:self->cropRect.size.width];

  [v13 setObject:v17 forKeyedSubscript:@"CropRectWidth"];
  unint64_t v18 = [NSNumber numberWithDouble:self->cropRect.size.height];

  [v13 setObject:v18 forKeyedSubscript:@"CropRectHeight"];
  v19 = [NSNumber numberWithLongLong:*(void *)(&self->version + 1)];

  [v13 setObject:v19 forKeyedSubscript:@"ROIStartV"];
  v20 = [NSNumber numberWithInt:HIDWORD(self->roiStart.value)];

  [v13 setObject:v20 forKeyedSubscript:@"ROIStartS"];
  v21 = [NSNumber numberWithLongLong:*(int64_t *)((char *)&self->roiStart.epoch + 4)];

  [v13 setObject:v21 forKeyedSubscript:@"ROILengthV"];
  long long v22 = [NSNumber numberWithInt:HIDWORD(self->roiLength.value)];

  [v13 setObject:v22 forKeyedSubscript:@"ROILengthS"];
  long long v23 = [NSNumber numberWithBool:self->passThrough];

  [v13 setObject:v23 forKeyedSubscript:@"PassThrough"];
  long long v24 = [NSNumber numberWithBool:self->sparseFrames];

  [v13 setObject:v24 forKeyedSubscript:@"Sparse"];
  [v13 setObject:v26 forKeyedSubscript:@"FrameArray"];

  return v13;
}

- (id)initFromDict:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 objectForKeyedSubscript:@"Version"];
  uint64_t v6 = v5;
  if (!v5)
  {
    NSLog(&cfstr_Stabilizeparam_0.isa);
    goto LABEL_16;
  }
  uint64_t v7 = [v5 unsignedIntegerValue];
  self->version = v7;
  if (v7 <= 1)
  {
    NSLog(&cfstr_Stabilizeparam_1.isa, v7);
    double v8 = 0;
    long long v9 = v6;
    goto LABEL_17;
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:@"CropRectX"];

  if (!v10)
  {
    NSLog(&cfstr_Stabilizeparam_2.isa);
    goto LABEL_16;
  }
  [v10 doubleValue];
  self->cropRect.origin.x = v11;
  v12 = [v4 objectForKeyedSubscript:@"CropRectY"];

  if (!v12)
  {
    NSLog(&cfstr_Stabilizeparam_3.isa);
    goto LABEL_16;
  }
  [v12 doubleValue];
  self->cropRect.origin.y = v13;
  v14 = [v4 objectForKeyedSubscript:@"CropRectWidth"];

  if (!v14)
  {
    NSLog(&cfstr_Stabilizeparam_4.isa);
    goto LABEL_16;
  }
  [v14 doubleValue];
  self->cropRect.size.width = v15;
  long long v9 = [v4 objectForKeyedSubscript:@"CropRectHeight"];

  if (!v9)
  {
    NSLog(&cfstr_Stabilizeparam_5.isa);
    goto LABEL_16;
  }
  [v9 doubleValue];
  self->cropRect.size.height = v16;
  unint64_t v17 = [v4 objectForKeyedSubscript:@"ROIStartV"];
  unint64_t v18 = [v4 objectForKeyedSubscript:@"ROIStartS"];
  int v19 = sub_1DD3E2BDC(v17, v18, (CMTime *)(&self->version + 1));

  if (v19
    || ([v4 objectForKeyedSubscript:@"ROILengthV"],
        v20 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"ROILengthS"],
        v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = sub_1DD3E2BDC(v20, v21, (CMTime *)((char *)&self->roiStart.epoch + 4)),
        v21,
        v20,
        v22))
  {
    double v8 = 0;
    goto LABEL_17;
  }
  long long v24 = [v4 objectForKeyedSubscript:@"PassThrough"];

  if (!v24)
  {
    NSLog(&cfstr_Stabilizeparam_6.isa);
    goto LABEL_16;
  }
  self->passThrough = [v24 BOOLValue];
  long long v9 = [v4 objectForKeyedSubscript:@"Sparse"];

  if (!v9)
  {
    if (self->version < 3) {
      goto LABEL_24;
    }
    NSLog(&cfstr_Stabilizeparam_7.isa);
LABEL_16:
    long long v9 = 0;
    double v8 = 0;
    goto LABEL_17;
  }
  self->sparseFrames = [v9 BOOLValue];
LABEL_24:
  v25 = [v4 objectForKeyedSubscript:@"FrameArray"];
  v26 = v25;
  v41 = v25;
  if (v25)
  {
    unsigned int v27 = [v25 count];
    begin = self->mFrameInfo.__begin_;
    self->numFrames = v27;
    self->mFrameInfo.__end_ = begin;
    sub_1DD3E2C98((uint64_t)&self->mFrameInfo, v27);
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= [(StabilizeParams *)self numFrames])
      {
        double v8 = self;
        goto LABEL_39;
      }
      v30 = [v26 objectAtIndexedSubscript:i];
      v31 = [v30 objectForKeyedSubscript:@"Homographies"];
      v32 = v31;
      if (!v31)
      {
        NSLog(&cfstr_Stabilizeparam_9.isa);
        goto LABEL_37;
      }
      if ([v31 count] != 9) {
        break;
      }
      for (uint64_t j = 0; j != 9; ++j)
      {
        v34 = [v32 objectAtIndexedSubscript:j];
        [v34 floatValue];
        *((_DWORD *)v42 + j) = v35;
      }
      v36 = [v30 objectForKeyedSubscript:@"FrameTimeV"];
      v37 = [v30 objectForKeyedSubscript:@"FrameTimeS"];
      int v38 = sub_1DD3E2BDC(v36, v37, (CMTime *)&v43[4]);

      if (v38) {
        goto LABEL_37;
      }
      v39 = (_OWORD *)((char *)self->mFrameInfo.__begin_ + 60 * i);
      long long v40 = v42[1];
      _OWORD *v39 = v42[0];
      v39[1] = v40;
      v39[2] = *(_OWORD *)v43;
      *(_OWORD *)((char *)v39 + 44) = *(_OWORD *)&v43[12];

      v26 = v41;
    }
    NSLog(&cfstr_Stabilizeparam_10.isa);
LABEL_37:
  }
  else
  {
    NSLog(&cfstr_Stabilizeparam_8.isa);
  }
  double v8 = 0;
LABEL_39:

LABEL_17:
  return v8;
}

- (void)frameTimes
{
  p_mFrameTimeArray = &self->mFrameTimeArray;
  if (self->mFrameTimeArray.__end_ == self->mFrameTimeArray.__begin_)
  {
    sub_1DD3E2D70((uint64_t)&self->mFrameTimeArray, self->numFrames);
    if (self->numFrames)
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        [(StabilizeParams *)self timeForFrame:v5];
        uint64_t v6 = (char *)self->mFrameTimeArray.__begin_ + v4;
        *((void *)v6 + 2) = v9;
        *(_OWORD *)uint64_t v6 = v8;
        ++v5;
        v4 += 24;
      }
      while (v5 < self->numFrames);
    }
  }
  return p_mFrameTimeArray;
}

+ (id)stabilizeParamsFromNSDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [[StabilizeParams alloc] initFromDict:v3];

  return v4;
}

- (unsigned)numFrames
{
  return self->numFrames;
}

- (CGRect)cropRect
{
  objc_copyStruct(v6, &self->cropRect, 32, 1, 0);
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

- (void)setCropRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->cropRect, &v3, 32, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)roiStart
{
  objc_copyStruct(retstr, &self->version + 1, 24, 1, 0);
  return result;
}

- (void)setRoiStart:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)roiLength
{
  objc_copyStruct(retstr, (char *)&self->roiStart.epoch + 4, 24, 1, 0);
  return result;
}

- (void)setRoiLength:(id *)a3
{
}

- (BOOL)passThrough
{
  return self->passThrough;
}

- (void)setPassThrough:(BOOL)a3
{
  self->passThrough = a3;
}

- (BOOL)sparseFrames
{
  return self->sparseFrames;
}

- (void)setSparseFrames:(BOOL)a3
{
  self->sparseFrames = a3;
}

- (unsigned)version
{
  return self->version;
}

- (void).cxx_destruct
{
  begin = self->mFrameTimeArray.__begin_;
  if (begin)
  {
    self->mFrameTimeArray.__end_ = begin;
    operator delete(begin);
  }
  double v4 = self->mFrameInfo.__begin_;
  if (v4)
  {
    self->mFrameInfo.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end