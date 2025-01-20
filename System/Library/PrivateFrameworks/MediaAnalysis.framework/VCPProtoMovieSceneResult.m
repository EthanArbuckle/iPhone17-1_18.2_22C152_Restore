@interface VCPProtoMovieSceneResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasDistanceToPreviousScene;
- (BOOL)hasFlickerScore;
- (BOOL)hasSceneprintDistanceToPreviousScene;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (float)distanceToPreviousScene;
- (float)flickerScore;
- (float)qualityScore;
- (float)sceneprintDistanceToPreviousScene;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistanceToPreviousScene:(float)a3;
- (void)setFlickerScore:(float)a3;
- (void)setHasDistanceToPreviousScene:(BOOL)a3;
- (void)setHasFlickerScore:(BOOL)a3;
- (void)setHasSceneprintDistanceToPreviousScene:(BOOL)a3;
- (void)setQualityScore:(float)a3;
- (void)setSceneprintDistanceToPreviousScene:(float)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieSceneResult

- (void)setDistanceToPreviousScene:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_distanceToPreviousScene = a3;
}

- (void)setHasDistanceToPreviousScene:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDistanceToPreviousScene
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFlickerScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_flickerScore = a3;
}

- (void)setHasFlickerScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlickerScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSceneprintDistanceToPreviousScene:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sceneprintDistanceToPreviousScene = a3;
}

- (void)setHasSceneprintDistanceToPreviousScene:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSceneprintDistanceToPreviousScene
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSceneResult;
  v4 = [(VCPProtoMovieSceneResult *)&v8 description];
  v5 = [(VCPProtoMovieSceneResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v6 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timeRange"];
  }
  *(float *)&double v4 = self->_qualityScore;
  v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"qualityScore"];

  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v8 = self->_distanceToPreviousScene;
    v12 = [NSNumber numberWithFloat:v8];
    [v3 setObject:v12 forKey:@"distanceToPreviousScene"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(float *)&double v8 = self->_flickerScore;
  v13 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v13 forKey:@"flickerScore"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *(float *)&double v8 = self->_sceneprintDistanceToPreviousScene;
    v10 = [NSNumber numberWithFloat:v8];
    [v3 setObject:v10 forKey:@"sceneprintDistanceToPreviousScene"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSceneResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteFloatField();
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setTimeRange:self->_timeRange];
  *((_DWORD *)v5 + 4) = LODWORD(self->_qualityScore);
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = LODWORD(self->_distanceToPreviousScene);
    *((unsigned char *)v5 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 3) = LODWORD(self->_flickerScore);
  *((unsigned char *)v5 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 5) = LODWORD(self->_sceneprintDistanceToPreviousScene);
    *((unsigned char *)v5 + 32) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(float *)(v5 + 16) = self->_qualityScore;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(float *)(v5 + 12) = self->_flickerScore;
    *(unsigned char *)(v5 + 32) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(float *)(v5 + 8) = self->_distanceToPreviousScene;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(float *)(v5 + 20) = self->_sceneprintDistanceToPreviousScene;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((void *)v4 + 3))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (self->_qualityScore != *((float *)v4 + 4)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_distanceToPreviousScene != *((float *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_19:
    BOOL v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_flickerScore != *((float *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_sceneprintDistanceToPreviousScene != *((float *)v4 + 5)) {
      goto LABEL_19;
    }
    BOOL v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  float qualityScore = self->_qualityScore;
  float v5 = -qualityScore;
  if (qualityScore >= 0.0) {
    float v5 = self->_qualityScore;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  float v8 = fmodf(v6, 1.8447e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    float distanceToPreviousScene = self->_distanceToPreviousScene;
    float v16 = -distanceToPreviousScene;
    if (distanceToPreviousScene >= 0.0) {
      float v16 = self->_distanceToPreviousScene;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    float flickerScore = self->_flickerScore;
    float v21 = -flickerScore;
    if (flickerScore >= 0.0) {
      float v21 = self->_flickerScore;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    float v24 = fmodf(v22, 1.8447e19);
    unint64_t v25 = 2654435761u * (unint64_t)v24;
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        unint64_t v19 = v25 + (unint64_t)v23;
      }
      else {
        unint64_t v19 = 2654435761u * (unint64_t)v24;
      }
      if ((has & 4) == 0) {
        goto LABEL_34;
      }
    }
    else
    {
      unint64_t v19 = v25 - (unint64_t)fabsf(v23);
      if ((has & 4) == 0)
      {
LABEL_34:
        unint64_t v33 = 0;
        return v12 ^ v3 ^ v14 ^ v19 ^ v33;
      }
    }
  }
  else
  {
    unint64_t v19 = 0;
    if ((has & 4) == 0) {
      goto LABEL_34;
    }
  }
  float sceneprintDistanceToPreviousScene = self->_sceneprintDistanceToPreviousScene;
  float v27 = -sceneprintDistanceToPreviousScene;
  if (sceneprintDistanceToPreviousScene >= 0.0) {
    float v27 = self->_sceneprintDistanceToPreviousScene;
  }
  float v28 = floorf(v27 + 0.5);
  float v29 = (float)(v27 - v28) * 1.8447e19;
  float v30 = fmodf(v28, 1.8447e19);
  unint64_t v31 = 2654435761u * (unint64_t)v30;
  unint64_t v32 = v31 + (unint64_t)v29;
  if (v29 <= 0.0) {
    unint64_t v32 = 2654435761u * (unint64_t)v30;
  }
  unint64_t v33 = v31 - (unint64_t)fabsf(v29);
  if (v29 >= 0.0) {
    unint64_t v33 = v32;
  }
  return v12 ^ v3 ^ v14 ^ v19 ^ v33;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 3);
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[VCPProtoMovieSceneResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v8;
LABEL_7:
  self->_float qualityScore = *((float *)v4 + 4);
  char v7 = *((unsigned char *)v4 + 32);
  if (v7)
  {
    self->_float distanceToPreviousScene = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 32);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_float flickerScore = *((float *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_10:
    self->_float sceneprintDistanceToPreviousScene = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (float)qualityScore
{
  return self->_qualityScore;
}

- (void)setQualityScore:(float)a3
{
  self->_float qualityScore = a3;
}

- (float)distanceToPreviousScene
{
  return self->_distanceToPreviousScene;
}

- (float)flickerScore
{
  return self->_flickerScore;
}

- (float)sceneprintDistanceToPreviousScene
{
  return self->_sceneprintDistanceToPreviousScene;
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"attributes"];
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, (CFDictionaryRef)v3);
  float v5 = [v3 objectForKeyedSubscript:@"quality"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"distance"];
  char v7 = [v4 objectForKeyedSubscript:@"slowMoFlicker"];
  id v8 = [v4 objectForKeyedSubscript:@"sceneprintDistance"];
  if (v13.start.flags)
  {
    unint64_t v9 = 0;
    if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch)
    {
      unint64_t v9 = 0;
      if ((v13.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          unint64_t v9 = objc_alloc_init(VCPProtoMovieSceneResult);
          CMTimeRange v12 = v13;
          unint64_t v10 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v12];
          [(VCPProtoMovieSceneResult *)v9 setTimeRange:v10];

          [v5 floatValue];
          -[VCPProtoMovieSceneResult setQualityScore:](v9, "setQualityScore:");
          if (v6)
          {
            [v6 floatValue];
            -[VCPProtoMovieSceneResult setDistanceToPreviousScene:](v9, "setDistanceToPreviousScene:");
          }
          if (v8)
          {
            [v8 floatValue];
            -[VCPProtoMovieSceneResult setSceneprintDistanceToPreviousScene:](v9, "setSceneprintDistanceToPreviousScene:");
          }
          if (v7)
          {
            [v7 floatValue];
            -[VCPProtoMovieSceneResult setFlickerScore:](v9, "setFlickerScore:");
          }
        }
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)exportToLegacyDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(VCPProtoMovieSceneResult *)self hasDistanceToPreviousScene])
  {
    id v4 = NSNumber;
    [(VCPProtoMovieSceneResult *)self distanceToPreviousScene];
    float v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"distance"];
  }
  if ([(VCPProtoMovieSceneResult *)self hasSceneprintDistanceToPreviousScene])
  {
    uint64_t v6 = NSNumber;
    [(VCPProtoMovieSceneResult *)self sceneprintDistanceToPreviousScene];
    char v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"sceneprintDistance"];
  }
  if ([(VCPProtoMovieSceneResult *)self hasFlickerScore])
  {
    id v8 = NSNumber;
    [(VCPProtoMovieSceneResult *)self flickerScore];
    unint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"slowMoFlicker"];
  }
  unint64_t v10 = [(VCPProtoMovieSceneResult *)self timeRange];
  unint64_t v11 = v10;
  if (v10) {
    [v10 timeRangeValue];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CMTimeRange range = v17;
  CFDictionaryRef v12 = CMTimeRangeCopyAsDictionary(&range, 0);
  CMTimeRange v13 = (void *)[(__CFDictionary *)v12 mutableCopy];

  unint64_t v14 = NSNumber;
  [(VCPProtoMovieSceneResult *)self qualityScore];
  v15 = objc_msgSend(v14, "numberWithFloat:");
  [v13 setObject:v15 forKeyedSubscript:@"quality"];

  if ([v3 count]) {
    [v13 setObject:v3 forKeyedSubscript:@"attributes"];
  }

  return v13;
}

@end