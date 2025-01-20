@interface VCPProtoMovieStabilizationRecipe
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)cropRectHeight;
- (float)cropRectWidth;
- (float)cropRectX;
- (float)cropRectY;
- (float)homographyParams;
- (float)homographyParamsAtIndex:(unint64_t)a3;
- (float)inputBoundsHeight;
- (float)inputBoundsWidth;
- (float)inputBoundsX;
- (float)inputBoundsY;
- (float)sourceSizeHeight;
- (float)sourceSizeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)timeScale;
- (int64_t)timeValueAtIndex:(unint64_t)a3;
- (int64_t)timeValues;
- (unint64_t)hash;
- (unint64_t)homographyParamsCount;
- (unint64_t)timeValuesCount;
- (void)addHomographyParams:(float)a3;
- (void)addTimeValue:(int64_t)a3;
- (void)clearHomographyParams;
- (void)clearTimeValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCropRectHeight:(float)a3;
- (void)setCropRectWidth:(float)a3;
- (void)setCropRectX:(float)a3;
- (void)setCropRectY:(float)a3;
- (void)setHomographyParams:(float *)a3 count:(unint64_t)a4;
- (void)setInputBoundsHeight:(float)a3;
- (void)setInputBoundsWidth:(float)a3;
- (void)setInputBoundsX:(float)a3;
- (void)setInputBoundsY:(float)a3;
- (void)setSourceSizeHeight:(float)a3;
- (void)setSourceSizeWidth:(float)a3;
- (void)setTimeScale:(int)a3;
- (void)setTimeValues:(int64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieStabilizationRecipe

+ (id)resultFromLegacyDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v36 = v3;
  v4 = [v3 objectForKeyedSubscript:@"stabCropRect"];
  if (!v4) {
    goto LABEL_17;
  }
  v5 = [v3 objectForKeyedSubscript:@"inputBounds"];
  if (!v5)
  {

    goto LABEL_17;
  }
  v6 = [v3 objectForKeyedSubscript:@"sourceSize"];
  if (!v6)
  {

    goto LABEL_18;
  }
  v7 = [v3 objectForKeyedSubscript:@"frameInstructions"];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  v9 = objc_alloc_init(VCPProtoMovieStabilizationRecipe);
  v34 = [v3 objectForKeyedSubscript:@"frameInstructions"];
  v32 = [v3 objectForKeyedSubscript:@"stabCropRect"];
  v33 = [v3 objectForKeyedSubscript:@"inputBounds"];
  v35 = [v3 objectForKeyedSubscript:@"sourceSize"];
  v10 = [v32 objectForKeyedSubscript:@"X"];
  [v10 floatValue];
  -[VCPProtoMovieStabilizationRecipe setCropRectX:](v9, "setCropRectX:");

  v11 = [v32 objectForKeyedSubscript:@"Y"];
  [v11 floatValue];
  -[VCPProtoMovieStabilizationRecipe setCropRectY:](v9, "setCropRectY:");

  v12 = [v32 objectForKeyedSubscript:@"Width"];
  [v12 floatValue];
  -[VCPProtoMovieStabilizationRecipe setCropRectWidth:](v9, "setCropRectWidth:");

  v13 = [v32 objectForKeyedSubscript:@"Height"];
  [v13 floatValue];
  -[VCPProtoMovieStabilizationRecipe setCropRectHeight:](v9, "setCropRectHeight:");

  v14 = [v33 objectForKeyedSubscript:@"X"];
  [v14 floatValue];
  -[VCPProtoMovieStabilizationRecipe setInputBoundsX:](v9, "setInputBoundsX:");

  v15 = [v33 objectForKeyedSubscript:@"Y"];
  [v15 floatValue];
  -[VCPProtoMovieStabilizationRecipe setInputBoundsY:](v9, "setInputBoundsY:");

  v16 = [v33 objectForKeyedSubscript:@"Width"];
  [v16 floatValue];
  -[VCPProtoMovieStabilizationRecipe setInputBoundsWidth:](v9, "setInputBoundsWidth:");

  v17 = [v33 objectForKeyedSubscript:@"Height"];
  [v17 floatValue];
  -[VCPProtoMovieStabilizationRecipe setInputBoundsHeight:](v9, "setInputBoundsHeight:");

  v18 = [v35 objectForKeyedSubscript:@"Width"];
  [v18 floatValue];
  -[VCPProtoMovieStabilizationRecipe setSourceSizeWidth:](v9, "setSourceSizeWidth:");

  v19 = [v35 objectForKeyedSubscript:@"Height"];
  [v19 floatValue];
  -[VCPProtoMovieStabilizationRecipe setSourceSizeHeight:](v9, "setSourceSizeHeight:");

  memset(&v42, 0, sizeof(v42));
  v20 = [v34 objectAtIndexedSubscript:0];
  CFDictionaryRef v21 = [v20 objectForKeyedSubscript:@"rawTime"];
  CMTimeMakeFromDictionary(&v42, v21);

  [(VCPProtoMovieStabilizationRecipe *)v9 setTimeScale:v42.timescale];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v22 = v34;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v22);
        }
        v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        memset(&v37, 0, sizeof(v37));
        CFDictionaryRef v27 = [v26 objectForKeyedSubscript:@"rawTime"];
        CMTimeMakeFromDictionary(&v37, v27);

        v28 = [v26 objectForKeyedSubscript:@"homography"];
        if ([v28 count] != 9)
        {

          v6 = 0;
          goto LABEL_23;
        }
        [(VCPProtoMovieStabilizationRecipe *)v9 addTimeValue:v37.value];
        for (uint64_t j = 0; j != 9; ++j)
        {
          v30 = [v28 objectAtIndexedSubscript:j];
          [v30 floatValue];
          -[VCPProtoMovieStabilizationRecipe addHomographyParams:](v9, "addHomographyParams:");
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  v6 = v9;
LABEL_23:

LABEL_18:
  return v6;
}

- (id)exportToLegacyDictionary
{
  v52[4] = *MEMORY[0x1E4F143B8];
  if ([(VCPProtoMovieStabilizationRecipe *)self homographyParamsCount]
    && [(VCPProtoMovieStabilizationRecipe *)self timeValuesCount]
    && (unint64_t v3 = [(VCPProtoMovieStabilizationRecipe *)self homographyParamsCount],
        v3 == 9 * [(VCPProtoMovieStabilizationRecipe *)self timeValuesCount]))
  {
    v51[0] = @"X";
    v4 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self cropRectX];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    v52[0] = v5;
    v51[1] = @"Y";
    v6 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self cropRectY];
    v7 = objc_msgSend(v6, "numberWithFloat:");
    v52[1] = v7;
    v51[2] = @"Width";
    uint64_t v8 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self cropRectWidth];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    v52[2] = v9;
    v51[3] = @"Height";
    v10 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self cropRectHeight];
    v11 = objc_msgSend(v10, "numberWithFloat:");
    v52[3] = v11;
    long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:4];

    v49[0] = @"X";
    v12 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self inputBoundsX];
    v13 = objc_msgSend(v12, "numberWithFloat:");
    v50[0] = v13;
    v49[1] = @"Y";
    v14 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self inputBoundsY];
    v15 = objc_msgSend(v14, "numberWithFloat:");
    v50[1] = v15;
    v49[2] = @"Width";
    v16 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self inputBoundsWidth];
    v17 = objc_msgSend(v16, "numberWithFloat:");
    v50[2] = v17;
    v49[3] = @"Height";
    v18 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self inputBoundsHeight];
    v19 = objc_msgSend(v18, "numberWithFloat:");
    v50[3] = v19;
    long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];

    v47[0] = @"Width";
    v20 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self sourceSizeWidth];
    CFDictionaryRef v21 = objc_msgSend(v20, "numberWithFloat:");
    v47[1] = @"Height";
    v48[0] = v21;
    id v22 = NSNumber;
    [(VCPProtoMovieStabilizationRecipe *)self sourceSizeHeight];
    uint64_t v23 = objc_msgSend(v22, "numberWithFloat:");
    v48[1] = v23;
    long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    unsigned int v25 = 0;
    for (unint64_t i = 0; [(VCPProtoMovieStabilizationRecipe *)self timeValuesCount] > i; ++i)
    {
      CFDictionaryRef v27 = [MEMORY[0x1E4F1C9E8] dictionary];
      memset(&v41, 0, sizeof(v41));
      CMTimeMake(&v41, [(VCPProtoMovieStabilizationRecipe *)self timeValues][8 * i], [(VCPProtoMovieStabilizationRecipe *)self timeScale]);
      v28 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t j = 0; j != 36; j += 4)
      {
        v30 = NSNumber;
        LODWORD(v31) = ([(VCPProtoMovieStabilizationRecipe *)self homographyParams]
                              + 4 * v25)[j];
        v32 = [v30 numberWithFloat:v31];
        [v28 addObject:v32];
      }
      v45[0] = @"rawTime";
      CMTime time = v41;
      CFDictionaryRef v33 = CMTimeCopyAsDictionary(&time, 0);
      v45[1] = @"homography";
      v46[0] = v33;
      v46[1] = v28;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

      [v24 addObject:v34];
      v25 += 9;
    }
    CMTime v37 = [MEMORY[0x1E4F1C9E8] dictionary];
    v43[0] = @"stabCropRect";
    v43[1] = @"inputBounds";
    v44[0] = v38;
    v44[1] = v39;
    v43[2] = @"sourceSize";
    v43[3] = @"frameInstructions";
    v44[2] = v40;
    v44[3] = v24;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];
  }
  else
  {
    v35 = 0;
  }
  return v35;
}

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoMovieStabilizationRecipe;
  [(VCPProtoMovieStabilizationRecipe *)&v3 dealloc];
}

- (unint64_t)timeValuesCount
{
  return self->_timeValues.count;
}

- (int64_t)timeValues
{
  return self->_timeValues.list;
}

- (void)clearTimeValues
{
}

- (void)addTimeValue:(int64_t)a3
{
}

- (int64_t)timeValueAtIndex:(unint64_t)a3
{
  p_timeValues = &self->_timeValues;
  unint64_t count = self->_timeValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_timeValues->list[a3];
}

- (void)setTimeValues:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)homographyParamsCount
{
  return self->_homographyParams.count;
}

- (float)homographyParams
{
  return self->_homographyParams.list;
}

- (void)clearHomographyParams
{
}

- (void)addHomographyParams:(float)a3
{
}

- (float)homographyParamsAtIndex:(unint64_t)a3
{
  p_homographyParams = &self->_homographyParams;
  unint64_t count = self->_homographyParams.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_homographyParams->list[a3];
}

- (void)setHomographyParams:(float *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieStabilizationRecipe;
  v4 = [(VCPProtoMovieStabilizationRecipe *)&v8 description];
  v5 = [(VCPProtoMovieStabilizationRecipe *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_cropRectX;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"cropRectX"];

  *(float *)&double v6 = self->_cropRectY;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"cropRectY"];

  *(float *)&double v8 = self->_cropRectHeight;
  v9 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKey:@"cropRectHeight"];

  *(float *)&double v10 = self->_cropRectWidth;
  v11 = [NSNumber numberWithFloat:v10];
  [v3 setObject:v11 forKey:@"cropRectWidth"];

  *(float *)&double v12 = self->_inputBoundsX;
  v13 = [NSNumber numberWithFloat:v12];
  [v3 setObject:v13 forKey:@"inputBoundsX"];

  *(float *)&double v14 = self->_inputBoundsY;
  v15 = [NSNumber numberWithFloat:v14];
  [v3 setObject:v15 forKey:@"inputBoundsY"];

  *(float *)&double v16 = self->_inputBoundsHeight;
  v17 = [NSNumber numberWithFloat:v16];
  [v3 setObject:v17 forKey:@"inputBoundsHeight"];

  *(float *)&double v18 = self->_inputBoundsWidth;
  v19 = [NSNumber numberWithFloat:v18];
  [v3 setObject:v19 forKey:@"inputBoundsWidth"];

  *(float *)&double v20 = self->_sourceSizeHeight;
  CFDictionaryRef v21 = [NSNumber numberWithFloat:v20];
  [v3 setObject:v21 forKey:@"sourceSizeHeight"];

  *(float *)&double v22 = self->_sourceSizeWidth;
  uint64_t v23 = [NSNumber numberWithFloat:v22];
  [v3 setObject:v23 forKey:@"sourceSizeWidth"];

  uint64_t v24 = [NSNumber numberWithInt:self->_timeScale];
  [v3 setObject:v24 forKey:@"timeScale"];

  unsigned int v25 = PBRepeatedInt64NSArray();
  [v3 setObject:v25 forKey:@"timeValue"];

  v26 = PBRepeatedFloatNSArray();
  [v3 setObject:v26 forKey:@"homographyParams"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieStabilizationRecipeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteInt32Field();
  if (self->_timeValues.count)
  {
    PBDataWriterPlaceMark();
    if (self->_timeValues.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v5;
      }
      while (v5 < self->_timeValues.count);
    }
    PBDataWriterRecallMark();
  }
  p_homographyParams = &self->_homographyParams;
  if (p_homographyParams->count)
  {
    PBDataWriterPlaceMark();
    if (p_homographyParams->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v7;
      }
      while (v7 < p_homographyParams->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[16] = LODWORD(self->_cropRectX);
  v4[17] = LODWORD(self->_cropRectY);
  v4[14] = LODWORD(self->_cropRectHeight);
  v4[15] = LODWORD(self->_cropRectWidth);
  v4[20] = LODWORD(self->_inputBoundsX);
  v4[21] = LODWORD(self->_inputBoundsY);
  v4[18] = LODWORD(self->_inputBoundsHeight);
  v4[19] = LODWORD(self->_inputBoundsWidth);
  v4[22] = LODWORD(self->_sourceSizeHeight);
  v4[23] = LODWORD(self->_sourceSizeWidth);
  id v11 = v4;
  v4[24] = self->_timeScale;
  if ([(VCPProtoMovieStabilizationRecipe *)self timeValuesCount])
  {
    [v11 clearTimeValues];
    unint64_t v5 = [(VCPProtoMovieStabilizationRecipe *)self timeValuesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v11, "addTimeValue:", -[VCPProtoMovieStabilizationRecipe timeValueAtIndex:](self, "timeValueAtIndex:", i));
    }
  }
  if ([(VCPProtoMovieStabilizationRecipe *)self homographyParamsCount])
  {
    [v11 clearHomographyParams];
    unint64_t v8 = [(VCPProtoMovieStabilizationRecipe *)self homographyParamsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        [(VCPProtoMovieStabilizationRecipe *)self homographyParamsAtIndex:j];
        objc_msgSend(v11, "addHomographyParams:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v4 + 64) = self->_cropRectX;
  *(float *)(v4 + 68) = self->_cropRectY;
  *(float *)(v4 + 56) = self->_cropRectHeight;
  *(float *)(v4 + 60) = self->_cropRectWidth;
  *(float *)(v4 + 80) = self->_inputBoundsX;
  *(float *)(v4 + 84) = self->_inputBoundsY;
  *(float *)(v4 + 72) = self->_inputBoundsHeight;
  *(float *)(v4 + 76) = self->_inputBoundsWidth;
  *(float *)(v4 + 88) = self->_sourceSizeHeight;
  *(float *)(v4 + 92) = self->_sourceSizeWidth;
  *(_DWORD *)(v4 + 96) = self->_timeScale;
  PBRepeatedInt64Copy();
  PBRepeatedFloatCopy();
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_cropRectX == *((float *)v4 + 16)
    && self->_cropRectY == *((float *)v4 + 17)
    && self->_cropRectHeight == *((float *)v4 + 14)
    && self->_cropRectWidth == *((float *)v4 + 15)
    && self->_inputBoundsX == *((float *)v4 + 20)
    && self->_inputBoundsY == *((float *)v4 + 21)
    && self->_inputBoundsHeight == *((float *)v4 + 18)
    && self->_inputBoundsWidth == *((float *)v4 + 19)
    && self->_sourceSizeHeight == *((float *)v4 + 22)
    && self->_sourceSizeWidth == *((float *)v4 + 23)
    && self->_timeScale == *((_DWORD *)v4 + 24)
    && PBRepeatedInt64IsEqual())
  {
    char IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  float cropRectX = self->_cropRectX;
  float v4 = -cropRectX;
  if (cropRectX >= 0.0) {
    float v4 = self->_cropRectX;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  unint64_t v94 = v10;
  float cropRectY = self->_cropRectY;
  float v12 = -cropRectY;
  if (cropRectY >= 0.0) {
    float v12 = self->_cropRectY;
  }
  float v13 = floorf(v12 + 0.5);
  float v14 = (float)(v12 - v13) * 1.8447e19;
  float v15 = fmodf(v13, 1.8447e19);
  unint64_t v16 = 2654435761u * (unint64_t)v15;
  unint64_t v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0) {
    unint64_t v17 = 2654435761u * (unint64_t)v15;
  }
  unint64_t v18 = v16 - (unint64_t)fabsf(v14);
  if (v14 < 0.0) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = v17;
  }
  float cropRectHeight = self->_cropRectHeight;
  float v21 = -cropRectHeight;
  if (cropRectHeight >= 0.0) {
    float v21 = self->_cropRectHeight;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  float v24 = fmodf(v22, 1.8447e19);
  unint64_t v25 = 2654435761u * (unint64_t)v24;
  unint64_t v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0) {
    unint64_t v26 = 2654435761u * (unint64_t)v24;
  }
  unint64_t v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 < 0.0) {
    unint64_t v28 = v27;
  }
  else {
    unint64_t v28 = v26;
  }
  float cropRectWidth = self->_cropRectWidth;
  float v30 = -cropRectWidth;
  if (cropRectWidth >= 0.0) {
    float v30 = self->_cropRectWidth;
  }
  float v31 = floorf(v30 + 0.5);
  float v32 = (float)(v30 - v31) * 1.8447e19;
  float v33 = fmodf(v31, 1.8447e19);
  unint64_t v34 = 2654435761u * (unint64_t)v33;
  unint64_t v35 = v34 + (unint64_t)v32;
  if (v32 <= 0.0) {
    unint64_t v35 = 2654435761u * (unint64_t)v33;
  }
  unint64_t v36 = v34 - (unint64_t)fabsf(v32);
  if (v32 < 0.0) {
    unint64_t v37 = v36;
  }
  else {
    unint64_t v37 = v35;
  }
  float inputBoundsX = self->_inputBoundsX;
  float v39 = -inputBoundsX;
  if (inputBoundsX >= 0.0) {
    float v39 = self->_inputBoundsX;
  }
  float v40 = floorf(v39 + 0.5);
  float v41 = (float)(v39 - v40) * 1.8447e19;
  float v42 = fmodf(v40, 1.8447e19);
  unint64_t v43 = 2654435761u * (unint64_t)v42;
  unint64_t v44 = v43 + (unint64_t)v41;
  if (v41 <= 0.0) {
    unint64_t v44 = 2654435761u * (unint64_t)v42;
  }
  unint64_t v45 = v43 - (unint64_t)fabsf(v41);
  if (v41 < 0.0) {
    unint64_t v46 = v45;
  }
  else {
    unint64_t v46 = v44;
  }
  float inputBoundsY = self->_inputBoundsY;
  float v48 = -inputBoundsY;
  if (inputBoundsY >= 0.0) {
    float v48 = self->_inputBoundsY;
  }
  float v49 = floorf(v48 + 0.5);
  float v50 = (float)(v48 - v49) * 1.8447e19;
  float v51 = fmodf(v49, 1.8447e19);
  unint64_t v52 = 2654435761u * (unint64_t)v51;
  unint64_t v53 = v52 + (unint64_t)v50;
  if (v50 <= 0.0) {
    unint64_t v53 = 2654435761u * (unint64_t)v51;
  }
  unint64_t v54 = v52 - (unint64_t)fabsf(v50);
  if (v50 < 0.0) {
    unint64_t v55 = v54;
  }
  else {
    unint64_t v55 = v53;
  }
  float inputBoundsHeight = self->_inputBoundsHeight;
  float v57 = -inputBoundsHeight;
  if (inputBoundsHeight >= 0.0) {
    float v57 = self->_inputBoundsHeight;
  }
  float v58 = floorf(v57 + 0.5);
  float v59 = (float)(v57 - v58) * 1.8447e19;
  float v60 = fmodf(v58, 1.8447e19);
  unint64_t v61 = 2654435761u * (unint64_t)v60;
  unint64_t v62 = v61 + (unint64_t)v59;
  if (v59 <= 0.0) {
    unint64_t v62 = 2654435761u * (unint64_t)v60;
  }
  unint64_t v63 = v61 - (unint64_t)fabsf(v59);
  if (v59 < 0.0) {
    unint64_t v64 = v63;
  }
  else {
    unint64_t v64 = v62;
  }
  float inputBoundsWidth = self->_inputBoundsWidth;
  float v66 = -inputBoundsWidth;
  if (inputBoundsWidth >= 0.0) {
    float v66 = self->_inputBoundsWidth;
  }
  float v67 = floorf(v66 + 0.5);
  float v68 = (float)(v66 - v67) * 1.8447e19;
  float v69 = fmodf(v67, 1.8447e19);
  unint64_t v70 = 2654435761u * (unint64_t)v69;
  unint64_t v71 = v70 + (unint64_t)v68;
  if (v68 <= 0.0) {
    unint64_t v71 = 2654435761u * (unint64_t)v69;
  }
  unint64_t v72 = v70 - (unint64_t)fabsf(v68);
  if (v68 < 0.0) {
    unint64_t v73 = v72;
  }
  else {
    unint64_t v73 = v71;
  }
  float sourceSizeHeight = self->_sourceSizeHeight;
  float v75 = -sourceSizeHeight;
  if (sourceSizeHeight >= 0.0) {
    float v75 = self->_sourceSizeHeight;
  }
  float v76 = floorf(v75 + 0.5);
  float v77 = (float)(v75 - v76) * 1.8447e19;
  float v78 = fmodf(v76, 1.8447e19);
  unint64_t v79 = 2654435761u * (unint64_t)v78;
  unint64_t v80 = v79 + (unint64_t)v77;
  if (v77 <= 0.0) {
    unint64_t v80 = 2654435761u * (unint64_t)v78;
  }
  unint64_t v81 = v79 - (unint64_t)fabsf(v77);
  if (v77 < 0.0) {
    unint64_t v82 = v81;
  }
  else {
    unint64_t v82 = v80;
  }
  float sourceSizeWidth = self->_sourceSizeWidth;
  float v84 = -sourceSizeWidth;
  if (sourceSizeWidth >= 0.0) {
    float v84 = self->_sourceSizeWidth;
  }
  float v85 = floorf(v84 + 0.5);
  float v86 = (float)(v84 - v85) * 1.8447e19;
  float v87 = fmodf(v85, 1.8447e19);
  unint64_t v88 = 2654435761u * (unint64_t)v87;
  unint64_t v89 = v88 + (unint64_t)v86;
  if (v86 <= 0.0) {
    unint64_t v89 = 2654435761u * (unint64_t)v87;
  }
  unint64_t v90 = v88 - (unint64_t)fabsf(v86);
  if (v86 >= 0.0) {
    unint64_t v90 = v89;
  }
  uint64_t v91 = v19 ^ v94 ^ v28 ^ v37 ^ v46 ^ v55 ^ v64 ^ v73 ^ v82 ^ v90 ^ (2654435761 * self->_timeScale);
  uint64_t v92 = PBRepeatedInt64Hash();
  return v91 ^ v92 ^ PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_float cropRectX = *((float *)v4 + 16);
  self->_float cropRectY = *((float *)v4 + 17);
  self->_float cropRectHeight = *((float *)v4 + 14);
  self->_float cropRectWidth = *((float *)v4 + 15);
  self->_float inputBoundsX = *((float *)v4 + 20);
  self->_float inputBoundsY = *((float *)v4 + 21);
  self->_float inputBoundsHeight = *((float *)v4 + 18);
  self->_float inputBoundsWidth = *((float *)v4 + 19);
  self->_float sourceSizeHeight = *((float *)v4 + 22);
  self->_float sourceSizeWidth = *((float *)v4 + 23);
  self->_timeScale = *((_DWORD *)v4 + 24);
  id v11 = v4;
  uint64_t v5 = [v4 timeValuesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[VCPProtoMovieStabilizationRecipe addTimeValue:](self, "addTimeValue:", [v11 timeValueAtIndex:i]);
  }
  uint64_t v8 = [v11 homographyParamsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
    {
      [v11 homographyParamsAtIndex:j];
      -[VCPProtoMovieStabilizationRecipe addHomographyParams:](self, "addHomographyParams:");
    }
  }
}

- (float)cropRectX
{
  return self->_cropRectX;
}

- (void)setCropRectX:(float)a3
{
  self->_float cropRectX = a3;
}

- (float)cropRectY
{
  return self->_cropRectY;
}

- (void)setCropRectY:(float)a3
{
  self->_float cropRectY = a3;
}

- (float)cropRectHeight
{
  return self->_cropRectHeight;
}

- (void)setCropRectHeight:(float)a3
{
  self->_float cropRectHeight = a3;
}

- (float)cropRectWidth
{
  return self->_cropRectWidth;
}

- (void)setCropRectWidth:(float)a3
{
  self->_float cropRectWidth = a3;
}

- (float)inputBoundsX
{
  return self->_inputBoundsX;
}

- (void)setInputBoundsX:(float)a3
{
  self->_float inputBoundsX = a3;
}

- (float)inputBoundsY
{
  return self->_inputBoundsY;
}

- (void)setInputBoundsY:(float)a3
{
  self->_float inputBoundsY = a3;
}

- (float)inputBoundsHeight
{
  return self->_inputBoundsHeight;
}

- (void)setInputBoundsHeight:(float)a3
{
  self->_float inputBoundsHeight = a3;
}

- (float)inputBoundsWidth
{
  return self->_inputBoundsWidth;
}

- (void)setInputBoundsWidth:(float)a3
{
  self->_float inputBoundsWidth = a3;
}

- (float)sourceSizeHeight
{
  return self->_sourceSizeHeight;
}

- (void)setSourceSizeHeight:(float)a3
{
  self->_float sourceSizeHeight = a3;
}

- (float)sourceSizeWidth
{
  return self->_sourceSizeWidth;
}

- (void)setSourceSizeWidth:(float)a3
{
  self->_float sourceSizeWidth = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

@end