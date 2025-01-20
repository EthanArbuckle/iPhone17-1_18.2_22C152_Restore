@interface VCPProtoLivePhotoKeyFrameResult
+ (Class)faceResultsType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasContentScore;
- (BOOL)hasGlobalQualityScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)faceResults;
- (double)timestamp;
- (float)contentScore;
- (float)exposureScore;
- (float)expressionChangeScore;
- (float)globalQualityScore;
- (float)overallFaceQualityScore;
- (float)penaltyScore;
- (float)qualityScoreForLivePhoto;
- (float)sharpness;
- (float)textureScore;
- (float)visualPleasingScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (id)faceResultsAtIndex:(unint64_t)a3;
- (unint64_t)faceResultsCount;
- (unint64_t)hash;
- (void)addFaceResults:(id)a3;
- (void)clearFaceResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentScore:(float)a3;
- (void)setExposureScore:(float)a3;
- (void)setExpressionChangeScore:(float)a3;
- (void)setFaceResults:(id)a3;
- (void)setGlobalQualityScore:(float)a3;
- (void)setHasContentScore:(BOOL)a3;
- (void)setHasGlobalQualityScore:(BOOL)a3;
- (void)setOverallFaceQualityScore:(float)a3;
- (void)setPenaltyScore:(float)a3;
- (void)setQualityScoreForLivePhoto:(float)a3;
- (void)setSharpness:(float)a3;
- (void)setTextureScore:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setVisualPleasingScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoKeyFrameResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = 0;
    goto LABEL_29;
  }
  v5 = [v3 objectForKeyedSubscript:@"attributes"];
  if (!v5)
  {
    v9 = 0;
    goto LABEL_28;
  }
  v6 = objc_alloc_init(VCPProtoLivePhotoKeyFrameResult);
  v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  v8 = v7;
  if (!v7) {
    goto LABEL_25;
  }
  [v7 doubleValue];
  -[VCPProtoLivePhotoKeyFrameResult setTimestamp:](v6, "setTimestamp:");
  v9 = [v5 objectForKeyedSubscript:@"frameQualityScore"];

  if (!v9) {
    goto LABEL_26;
  }
  [(VCPProtoLivePhotoKeyFrameResult *)v9 floatValue];
  -[VCPProtoLivePhotoKeyFrameResult setQualityScoreForLivePhoto:](v6, "setQualityScoreForLivePhoto:");
  v10 = [v5 objectForKeyedSubscript:@"visualPleasingScore"];

  if (!v10) {
    goto LABEL_25;
  }
  [v10 floatValue];
  -[VCPProtoLivePhotoKeyFrameResult setVisualPleasingScore:](v6, "setVisualPleasingScore:");
  v9 = [v5 objectForKeyedSubscript:@"faceQualityScore"];

  if (!v9) {
    goto LABEL_26;
  }
  [(VCPProtoLivePhotoKeyFrameResult *)v9 floatValue];
  -[VCPProtoLivePhotoKeyFrameResult setOverallFaceQualityScore:](v6, "setOverallFaceQualityScore:");
  v11 = [v5 objectForKeyedSubscript:@"exposureScore"];

  if (!v11)
  {
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  [v11 floatValue];
  -[VCPProtoLivePhotoKeyFrameResult setExposureScore:](v6, "setExposureScore:");
  v9 = [v5 objectForKeyedSubscript:@"penaltyScore"];

  if (v9)
  {
    [(VCPProtoLivePhotoKeyFrameResult *)v9 floatValue];
    -[VCPProtoLivePhotoKeyFrameResult setPenaltyScore:](v6, "setPenaltyScore:");
    v12 = [v5 objectForKeyedSubscript:@"textureScore"];

    if (v12)
    {
      [v12 floatValue];
      -[VCPProtoLivePhotoKeyFrameResult setTextureScore:](v6, "setTextureScore:");
      v13 = [v5 objectForKeyedSubscript:@"sharpnessScore"];

      if (v13)
      {
        [v13 floatValue];
        -[VCPProtoLivePhotoKeyFrameResult setSharpness:](v6, "setSharpness:");
        v9 = [v5 objectForKeyedSubscript:@"expressionChangeScore"];

        if (v9)
        {
          [(VCPProtoLivePhotoKeyFrameResult *)v9 floatValue];
          -[VCPProtoLivePhotoKeyFrameResult setExpressionChangeScore:](v6, "setExpressionChangeScore:");
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          v14 = objc_msgSend(v5, "objectForKeyedSubscript:", @"FaceResults", 0);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v14);
                }
                v18 = +[VCPProtoLivePhotoKeyFrameFaceResult resultFromLegacyDictionary:*(void *)(*((void *)&v23 + 1) + 8 * i)];
                [(VCPProtoLivePhotoKeyFrameResult *)v6 addFaceResults:v18];
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
            }
            while (v15);
          }

          v19 = [v5 objectForKeyedSubscript:@"globalQualityScore"];

          v20 = v19;
          if (v19)
          {
            [v19 floatValue];
            -[VCPProtoLivePhotoKeyFrameResult setGlobalQualityScore:](v6, "setGlobalQualityScore:");
          }
          v21 = [v5 objectForKeyedSubscript:@"contentScore"];

          if (v21)
          {
            [v21 floatValue];
            -[VCPProtoLivePhotoKeyFrameResult setContentScore:](v6, "setContentScore:");
          }
          v9 = v6;
        }
        goto LABEL_26;
      }
    }
    goto LABEL_25;
  }
LABEL_26:

LABEL_28:
LABEL_29:

  return v9;
}

- (id)exportToLegacyDictionary
{
  v38[10] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; [(VCPProtoLivePhotoKeyFrameResult *)self faceResultsCount] > i; ++i)
  {
    v5 = [(VCPProtoLivePhotoKeyFrameResult *)self faceResults];
    v6 = [v5 objectAtIndex:i];

    v7 = [v6 exportToLegacyDictionary];
    [v3 addObject:v7];
  }
  v8 = (void *)MEMORY[0x1E4F1CA60];
  v37[0] = @"timestamp";
  v9 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self timestamp];
  v34 = objc_msgSend(v9, "numberWithDouble:");
  v38[0] = v34;
  v37[1] = @"frameQualityScore";
  v10 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self qualityScoreForLivePhoto];
  v33 = objc_msgSend(v10, "numberWithFloat:");
  v38[1] = v33;
  v37[2] = @"visualPleasingScore";
  v11 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self visualPleasingScore];
  v32 = objc_msgSend(v11, "numberWithFloat:");
  v38[2] = v32;
  v37[3] = @"faceQualityScore";
  v12 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self overallFaceQualityScore];
  v31 = objc_msgSend(v12, "numberWithFloat:");
  v38[3] = v31;
  v37[4] = @"exposureScore";
  v13 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self exposureScore];
  v14 = objc_msgSend(v13, "numberWithFloat:");
  v38[4] = v14;
  v37[5] = @"penaltyScore";
  uint64_t v15 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self penaltyScore];
  uint64_t v16 = objc_msgSend(v15, "numberWithFloat:");
  v38[5] = v16;
  v37[6] = @"textureScore";
  v17 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self textureScore];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  v38[6] = v18;
  v37[7] = @"sharpnessScore";
  v19 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self sharpness];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  v38[7] = v20;
  v37[8] = @"expressionChangeScore";
  v21 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameResult *)self expressionChangeScore];
  v22 = objc_msgSend(v21, "numberWithFloat:");
  v37[9] = @"FaceResults";
  v38[8] = v22;
  v38[9] = v3;
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:10];
  long long v24 = [v8 dictionaryWithDictionary:v23];

  if ([(VCPProtoLivePhotoKeyFrameResult *)self hasGlobalQualityScore])
  {
    long long v25 = NSNumber;
    [(VCPProtoLivePhotoKeyFrameResult *)self globalQualityScore];
    long long v26 = objc_msgSend(v25, "numberWithFloat:");
    [v24 setObject:v26 forKeyedSubscript:@"globalQualityScore"];
  }
  if ([(VCPProtoLivePhotoKeyFrameResult *)self hasContentScore])
  {
    v27 = NSNumber;
    [(VCPProtoLivePhotoKeyFrameResult *)self contentScore];
    uint64_t v28 = objc_msgSend(v27, "numberWithFloat:");
    [v24 setObject:v28 forKeyedSubscript:@"contentScore"];
  }
  v35 = @"attributes";
  v36 = v24;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

  return v29;
}

- (void)clearFaceResults
{
}

- (void)addFaceResults:(id)a3
{
  id v4 = a3;
  faceResults = self->_faceResults;
  id v8 = v4;
  if (!faceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_faceResults;
    self->_faceResults = v6;

    id v4 = v8;
    faceResults = self->_faceResults;
  }
  [(NSMutableArray *)faceResults addObject:v4];
}

- (unint64_t)faceResultsCount
{
  return [(NSMutableArray *)self->_faceResults count];
}

- (id)faceResultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_faceResults objectAtIndex:a3];
}

+ (Class)faceResultsType
{
  return (Class)objc_opt_class();
}

- (void)setGlobalQualityScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_globalQualityScore = a3;
}

- (void)setHasGlobalQualityScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGlobalQualityScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setContentScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentScore = a3;
}

- (void)setHasContentScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoKeyFrameResult;
  id v4 = [(VCPProtoLivePhotoKeyFrameResult *)&v8 description];
  v5 = [(VCPProtoLivePhotoKeyFrameResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKey:@"timestamp"];

  *(float *)&double v5 = self->_qualityScoreForLivePhoto;
  v6 = [NSNumber numberWithFloat:v5];
  [v3 setObject:v6 forKey:@"qualityScoreForLivePhoto"];

  *(float *)&double v7 = self->_visualPleasingScore;
  objc_super v8 = [NSNumber numberWithFloat:v7];
  [v3 setObject:v8 forKey:@"visualPleasingScore"];

  *(float *)&double v9 = self->_overallFaceQualityScore;
  v10 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v10 forKey:@"overallFaceQualityScore"];

  *(float *)&double v11 = self->_exposureScore;
  v12 = [NSNumber numberWithFloat:v11];
  [v3 setObject:v12 forKey:@"exposureScore"];

  *(float *)&double v13 = self->_penaltyScore;
  v14 = [NSNumber numberWithFloat:v13];
  [v3 setObject:v14 forKey:@"penaltyScore"];

  *(float *)&double v15 = self->_textureScore;
  uint64_t v16 = [NSNumber numberWithFloat:v15];
  [v3 setObject:v16 forKey:@"textureScore"];

  *(float *)&double v17 = self->_sharpness;
  v18 = [NSNumber numberWithFloat:v17];
  [v3 setObject:v18 forKey:@"sharpness"];

  if ([(NSMutableArray *)self->_faceResults count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_faceResults, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v21 = self->_faceResults;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v33 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "dictionaryRepresentation", (void)v32);
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"faceResults"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v19 = self->_globalQualityScore;
    uint64_t v28 = [NSNumber numberWithFloat:v19];
    [v3 setObject:v28 forKey:@"globalQualityScore"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v19 = self->_contentScore;
    v29 = [NSNumber numberWithFloat:v19];
    [v3 setObject:v29 forKey:@"contentScore"];
  }
  *(float *)&double v19 = self->_expressionChangeScore;
  v30 = objc_msgSend(NSNumber, "numberWithFloat:", v19, (void)v32);
  [v3 setObject:v30 forKey:@"expressionChangeScore"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoKeyFrameResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = self->_faceResults;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[1] = *(void *)&self->_timestamp;
  *((_DWORD *)v4 + 13) = LODWORD(self->_qualityScoreForLivePhoto);
  *((_DWORD *)v4 + 16) = LODWORD(self->_visualPleasingScore);
  *((_DWORD *)v4 + 11) = LODWORD(self->_overallFaceQualityScore);
  *((_DWORD *)v4 + 5) = LODWORD(self->_exposureScore);
  *((_DWORD *)v4 + 12) = LODWORD(self->_penaltyScore);
  *((_DWORD *)v4 + 15) = LODWORD(self->_textureScore);
  id v10 = v4;
  *((_DWORD *)v4 + 14) = LODWORD(self->_sharpness);
  if ([(VCPProtoLivePhotoKeyFrameResult *)self faceResultsCount])
  {
    [v10 clearFaceResults];
    unint64_t v5 = [(VCPProtoLivePhotoKeyFrameResult *)self faceResultsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(VCPProtoLivePhotoKeyFrameResult *)self faceResultsAtIndex:i];
        [v10 addFaceResults:v8];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 10) = LODWORD(self->_globalQualityScore);
    *((unsigned char *)v10 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v10 + 4) = LODWORD(self->_contentScore);
    *((unsigned char *)v10 + 68) |= 1u;
  }
  *((_DWORD *)v10 + 6) = LODWORD(self->_expressionChangeScore);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_timestamp;
  *(float *)(v5 + 52) = self->_qualityScoreForLivePhoto;
  *(float *)(v5 + 64) = self->_visualPleasingScore;
  *(float *)(v5 + 44) = self->_overallFaceQualityScore;
  *(float *)(v5 + 20) = self->_exposureScore;
  *(float *)(v5 + 48) = self->_penaltyScore;
  *(float *)(v5 + 60) = self->_textureScore;
  *(float *)(v5 + 56) = self->_sharpness;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v6 = self->_faceResults;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addFaceResults:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 40) = self->_globalQualityScore;
    *(unsigned char *)(v5 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v5 + 16) = self->_contentScore;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  *(float *)(v5 + 24) = self->_expressionChangeScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if (self->_timestamp != *((double *)v4 + 1)) {
    goto LABEL_23;
  }
  if (self->_qualityScoreForLivePhoto != *((float *)v4 + 13)) {
    goto LABEL_23;
  }
  if (self->_visualPleasingScore != *((float *)v4 + 16)) {
    goto LABEL_23;
  }
  if (self->_overallFaceQualityScore != *((float *)v4 + 11)) {
    goto LABEL_23;
  }
  if (self->_exposureScore != *((float *)v4 + 5)) {
    goto LABEL_23;
  }
  if (self->_penaltyScore != *((float *)v4 + 12)) {
    goto LABEL_23;
  }
  if (self->_textureScore != *((float *)v4 + 15)) {
    goto LABEL_23;
  }
  if (self->_sharpness != *((float *)v4 + 14)) {
    goto LABEL_23;
  }
  faceResults = self->_faceResults;
  if ((unint64_t)faceResults | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](faceResults, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_globalQualityScore != *((float *)v4 + 10)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_contentScore != *((float *)v4 + 4)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_23;
  }
  BOOL v6 = self->_expressionChangeScore == *((float *)v4 + 6);
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  unint64_t v8 = v7 + (unint64_t)v6;
  double v9 = fabs(v6);
  if (v6 <= 0.0) {
    unint64_t v8 = v7;
  }
  unint64_t v10 = v7 - (unint64_t)v9;
  if (v6 >= 0.0) {
    unint64_t v10 = v8;
  }
  unint64_t v101 = v10;
  float qualityScoreForLivePhoto = self->_qualityScoreForLivePhoto;
  float v12 = -qualityScoreForLivePhoto;
  if (qualityScoreForLivePhoto >= 0.0) {
    float v12 = self->_qualityScoreForLivePhoto;
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
  if (v14 >= 0.0) {
    unint64_t v18 = v17;
  }
  unint64_t v100 = v18;
  float visualPleasingScore = self->_visualPleasingScore;
  float v20 = -visualPleasingScore;
  if (visualPleasingScore >= 0.0) {
    float v20 = self->_visualPleasingScore;
  }
  float v21 = floorf(v20 + 0.5);
  float v22 = (float)(v20 - v21) * 1.8447e19;
  float v23 = fmodf(v21, 1.8447e19);
  unint64_t v24 = 2654435761u * (unint64_t)v23;
  unint64_t v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0) {
    unint64_t v25 = 2654435761u * (unint64_t)v23;
  }
  unint64_t v26 = v24 - (unint64_t)fabsf(v22);
  if (v22 >= 0.0) {
    unint64_t v26 = v25;
  }
  unint64_t v99 = v26;
  float overallFaceQualityScore = self->_overallFaceQualityScore;
  float v28 = -overallFaceQualityScore;
  if (overallFaceQualityScore >= 0.0) {
    float v28 = self->_overallFaceQualityScore;
  }
  float v29 = floorf(v28 + 0.5);
  float v30 = (float)(v28 - v29) * 1.8447e19;
  float v31 = fmodf(v29, 1.8447e19);
  unint64_t v32 = 2654435761u * (unint64_t)v31;
  unint64_t v33 = v32 + (unint64_t)v30;
  if (v30 <= 0.0) {
    unint64_t v33 = 2654435761u * (unint64_t)v31;
  }
  unint64_t v34 = v32 - (unint64_t)fabsf(v30);
  if (v30 < 0.0) {
    unint64_t v35 = v34;
  }
  else {
    unint64_t v35 = v33;
  }
  float exposureScore = self->_exposureScore;
  float v37 = -exposureScore;
  if (exposureScore >= 0.0) {
    float v37 = self->_exposureScore;
  }
  float v38 = floorf(v37 + 0.5);
  float v39 = (float)(v37 - v38) * 1.8447e19;
  float v40 = fmodf(v38, 1.8447e19);
  unint64_t v41 = 2654435761u * (unint64_t)v40;
  unint64_t v42 = v41 + (unint64_t)v39;
  if (v39 <= 0.0) {
    unint64_t v42 = 2654435761u * (unint64_t)v40;
  }
  unint64_t v43 = v41 - (unint64_t)fabsf(v39);
  if (v39 < 0.0) {
    unint64_t v44 = v43;
  }
  else {
    unint64_t v44 = v42;
  }
  float penaltyScore = self->_penaltyScore;
  float v46 = -penaltyScore;
  if (penaltyScore >= 0.0) {
    float v46 = self->_penaltyScore;
  }
  float v47 = floorf(v46 + 0.5);
  float v48 = (float)(v46 - v47) * 1.8447e19;
  float v49 = fmodf(v47, 1.8447e19);
  unint64_t v50 = 2654435761u * (unint64_t)v49;
  unint64_t v51 = v50 + (unint64_t)v48;
  if (v48 <= 0.0) {
    unint64_t v51 = 2654435761u * (unint64_t)v49;
  }
  unint64_t v52 = v50 - (unint64_t)fabsf(v48);
  if (v48 < 0.0) {
    unint64_t v53 = v52;
  }
  else {
    unint64_t v53 = v51;
  }
  float textureScore = self->_textureScore;
  float v55 = -textureScore;
  if (textureScore >= 0.0) {
    float v55 = self->_textureScore;
  }
  float v56 = floorf(v55 + 0.5);
  float v57 = (float)(v55 - v56) * 1.8447e19;
  float v58 = fmodf(v56, 1.8447e19);
  unint64_t v59 = 2654435761u * (unint64_t)v58;
  unint64_t v60 = v59 + (unint64_t)v57;
  if (v57 <= 0.0) {
    unint64_t v60 = 2654435761u * (unint64_t)v58;
  }
  unint64_t v61 = v59 - (unint64_t)fabsf(v57);
  if (v57 < 0.0) {
    unint64_t v62 = v61;
  }
  else {
    unint64_t v62 = v60;
  }
  float sharpness = self->_sharpness;
  float v64 = -sharpness;
  if (sharpness >= 0.0) {
    float v64 = self->_sharpness;
  }
  float v65 = floorf(v64 + 0.5);
  float v66 = (float)(v64 - v65) * 1.8447e19;
  float v67 = fmodf(v65, 1.8447e19);
  unint64_t v68 = 2654435761u * (unint64_t)v67;
  unint64_t v69 = v68 + (unint64_t)v66;
  if (v66 <= 0.0) {
    unint64_t v69 = 2654435761u * (unint64_t)v67;
  }
  unint64_t v70 = v68 - (unint64_t)fabsf(v66);
  if (v66 < 0.0) {
    unint64_t v71 = v70;
  }
  else {
    unint64_t v71 = v69;
  }
  uint64_t v72 = [(NSMutableArray *)self->_faceResults hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float globalQualityScore = self->_globalQualityScore;
    float v76 = -globalQualityScore;
    if (globalQualityScore >= 0.0) {
      float v76 = self->_globalQualityScore;
    }
    float v77 = floorf(v76 + 0.5);
    float v78 = (float)(v76 - v77) * 1.8447e19;
    float v79 = fmodf(v77, 1.8447e19);
    unint64_t v80 = 2654435761u * (unint64_t)v79;
    if (v78 >= 0.0)
    {
      if (v78 > 0.0) {
        unint64_t v74 = v80 + (unint64_t)v78;
      }
      else {
        unint64_t v74 = 2654435761u * (unint64_t)v79;
      }
      if ((has & 1) == 0) {
        goto LABEL_72;
      }
    }
    else
    {
      unint64_t v74 = v80 - (unint64_t)fabsf(v78);
      if ((has & 1) == 0)
      {
LABEL_72:
        unint64_t v89 = 0;
        goto LABEL_73;
      }
    }
  }
  else
  {
    unint64_t v74 = 0;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_72;
    }
  }
  float contentScore = self->_contentScore;
  float v82 = -contentScore;
  if (contentScore >= 0.0) {
    float v82 = self->_contentScore;
  }
  float v83 = floorf(v82 + 0.5);
  float v84 = (float)(v82 - v83) * 1.8447e19;
  float v85 = fmodf(v83, 1.8447e19);
  unint64_t v86 = 2654435761u * (unint64_t)v85;
  unint64_t v87 = v86 + (unint64_t)v84;
  if (v84 <= 0.0) {
    unint64_t v87 = 2654435761u * (unint64_t)v85;
  }
  unint64_t v88 = v86 - (unint64_t)fabsf(v84);
  if (v84 < 0.0) {
    unint64_t v89 = v88;
  }
  else {
    unint64_t v89 = v87;
  }
LABEL_73:
  float expressionChangeScore = self->_expressionChangeScore;
  float v91 = -expressionChangeScore;
  if (expressionChangeScore >= 0.0) {
    float v91 = self->_expressionChangeScore;
  }
  float v92 = floorf(v91 + 0.5);
  float v93 = (float)(v91 - v92) * 1.8447e19;
  float v94 = fmodf(v92, 1.8447e19);
  unint64_t v95 = 2654435761u * (unint64_t)v94;
  unint64_t v96 = v95 + (unint64_t)v93;
  if (v93 <= 0.0) {
    unint64_t v96 = 2654435761u * (unint64_t)v94;
  }
  unint64_t v97 = v95 - (unint64_t)fabsf(v93);
  if (v93 >= 0.0) {
    unint64_t v97 = v96;
  }
  return v100 ^ v101 ^ v99 ^ v35 ^ v44 ^ v53 ^ v62 ^ v71 ^ v72 ^ v74 ^ v89 ^ v97;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_double timestamp = *((double *)v4 + 1);
  self->_float qualityScoreForLivePhoto = *((float *)v4 + 13);
  self->_float visualPleasingScore = *((float *)v4 + 16);
  self->_float overallFaceQualityScore = *((float *)v4 + 11);
  self->_float exposureScore = *((float *)v4 + 5);
  self->_float penaltyScore = *((float *)v4 + 12);
  self->_float textureScore = *((float *)v4 + 15);
  self->_float sharpness = *((float *)v4 + 14);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[VCPProtoLivePhotoKeyFrameResult addFaceResults:](self, "addFaceResults:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 68);
  if ((v10 & 2) != 0)
  {
    self->_float globalQualityScore = *((float *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v4 + 68);
  }
  if (v10)
  {
    self->_float contentScore = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  self->_float expressionChangeScore = *((float *)v4 + 6);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (float)qualityScoreForLivePhoto
{
  return self->_qualityScoreForLivePhoto;
}

- (void)setQualityScoreForLivePhoto:(float)a3
{
  self->_float qualityScoreForLivePhoto = a3;
}

- (float)visualPleasingScore
{
  return self->_visualPleasingScore;
}

- (void)setVisualPleasingScore:(float)a3
{
  self->_float visualPleasingScore = a3;
}

- (float)overallFaceQualityScore
{
  return self->_overallFaceQualityScore;
}

- (void)setOverallFaceQualityScore:(float)a3
{
  self->_float overallFaceQualityScore = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_float exposureScore = a3;
}

- (float)penaltyScore
{
  return self->_penaltyScore;
}

- (void)setPenaltyScore:(float)a3
{
  self->_float penaltyScore = a3;
}

- (float)textureScore
{
  return self->_textureScore;
}

- (void)setTextureScore:(float)a3
{
  self->_float textureScore = a3;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_float sharpness = a3;
}

- (NSMutableArray)faceResults
{
  return self->_faceResults;
}

- (void)setFaceResults:(id)a3
{
}

- (float)globalQualityScore
{
  return self->_globalQualityScore;
}

- (float)contentScore
{
  return self->_contentScore;
}

- (float)expressionChangeScore
{
  return self->_expressionChangeScore;
}

- (void)setExpressionChangeScore:(float)a3
{
  self->_float expressionChangeScore = a3;
}

- (void).cxx_destruct
{
}

@end