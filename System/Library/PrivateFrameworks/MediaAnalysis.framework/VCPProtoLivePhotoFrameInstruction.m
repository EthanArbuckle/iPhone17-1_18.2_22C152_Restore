@interface VCPProtoLivePhotoFrameInstruction
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)homographyParamAtIndex:(unint64_t)a3;
- (float)homographyParams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)flags;
- (int)timeScale;
- (int64_t)epoch;
- (int64_t)timeValue;
- (unint64_t)hash;
- (unint64_t)homographyParamsCount;
- (void)addHomographyParam:(float)a3;
- (void)clearHomographyParams;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEpoch:(int64_t)a3;
- (void)setFlags:(int)a3;
- (void)setHomographyParams:(float *)a3 count:(unint64_t)a4;
- (void)setTimeScale:(int)a3;
- (void)setTimeValue:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoFrameInstruction

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(VCPProtoLivePhotoFrameInstruction);
    v5 = [v3 objectForKeyedSubscript:@"homography"];
    memset(&v11, 0, sizeof(v11));
    CFDictionaryRef v6 = [v3 objectForKeyedSubscript:@"rawTime"];
    CMTimeMakeFromDictionary(&v11, v6);

    if ((unint64_t)[v5 count] >= 8 && (unint64_t)objc_msgSend(v5, "count") <= 9)
    {
      [(VCPProtoLivePhotoFrameInstruction *)v4 setTimeValue:v11.value];
      [(VCPProtoLivePhotoFrameInstruction *)v4 setTimeScale:v11.timescale];
      [(VCPProtoLivePhotoFrameInstruction *)v4 setEpoch:v11.epoch];
      [(VCPProtoLivePhotoFrameInstruction *)v4 setFlags:v11.flags];
      for (uint64_t i = 0; i != 8; ++i)
      {
        v9 = [v5 objectAtIndexedSubscript:i];
        [v9 floatValue];
        -[VCPProtoLivePhotoFrameInstruction addHomographyParam:](v4, "addHomographyParam:");
      }
      v7 = v4;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)exportToLegacyDictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; [(VCPProtoLivePhotoFrameInstruction *)self homographyParamsCount] > i; ++i)
  {
    CFDictionaryRef v6 = NSNumber;
    [(VCPProtoLivePhotoFrameInstruction *)self homographyParamAtIndex:i];
    v7 = objc_msgSend(v6, "numberWithFloat:");
    [v4 addObject:v7];
  }
  [v4 addObject:&unk_1F15EAC28];
  memset(&v10, 0, sizeof(v10));
  CMTimeMake(&v10, [(VCPProtoLivePhotoFrameInstruction *)self timeValue], [(VCPProtoLivePhotoFrameInstruction *)self timeScale]);
  v10.epoch = [(VCPProtoLivePhotoFrameInstruction *)self epoch];
  v10.flags = [(VCPProtoLivePhotoFrameInstruction *)self flags];
  CMTime time = v10;
  CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, 0);
  [v3 setObject:v8 forKeyedSubscript:@"rawTime"];

  [v3 setObject:v4 forKeyedSubscript:@"homography"];
  return v3;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoLivePhotoFrameInstruction;
  [(VCPProtoLivePhotoFrameInstruction *)&v3 dealloc];
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

- (void)addHomographyParam:(float)a3
{
}

- (float)homographyParamAtIndex:(unint64_t)a3
{
  p_homographyParams = &self->_homographyParams;
  unint64_t count = self->_homographyParams.count;
  if (count <= a3)
  {
    CFDictionaryRef v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    CFDictionaryRef v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
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
  v8.super_class = (Class)VCPProtoLivePhotoFrameInstruction;
  v4 = [(VCPProtoLivePhotoFrameInstruction *)&v8 description];
  v5 = [(VCPProtoLivePhotoFrameInstruction *)self dictionaryRepresentation];
  CFDictionaryRef v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_timeValue];
  [v3 setObject:v4 forKey:@"timeValue"];

  v5 = PBRepeatedFloatNSArray();
  [v3 setObject:v5 forKey:@"homographyParam"];

  CFDictionaryRef v6 = [NSNumber numberWithInt:self->_timeScale];
  [v3 setObject:v6 forKey:@"timeScale"];

  uint64_t v7 = [NSNumber numberWithLongLong:self->_epoch];
  [v3 setObject:v7 forKey:@"epoch"];

  objc_super v8 = [NSNumber numberWithInt:self->_flags];
  [v3 setObject:v8 forKey:@"flags"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoFrameInstructionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt64Field();
  if (self->_homographyParams.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v4;
    }
    while (v4 < self->_homographyParams.count);
  }
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  uint64_t v7 = a3;
  v7[5] = self->_timeValue;
  if ([(VCPProtoLivePhotoFrameInstruction *)self homographyParamsCount])
  {
    [v7 clearHomographyParams];
    unint64_t v4 = [(VCPProtoLivePhotoFrameInstruction *)self homographyParamsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(VCPProtoLivePhotoFrameInstruction *)self homographyParamAtIndex:i];
        objc_msgSend(v7, "addHomographyParam:");
      }
    }
  }
  *((_DWORD *)v7 + 13) = self->_timeScale;
  v7[4] = self->_epoch;
  *((_DWORD *)v7 + 12) = self->_flags;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 40) = self->_timeValue;
  PBRepeatedFloatCopy();
  *(_DWORD *)(v4 + 52) = self->_timeScale;
  *(void *)(v4 + 32) = self->_epoch;
  *(_DWORD *)(v4 + 48) = self->_flags;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_timeValue == *((void *)v4 + 5)
    && PBRepeatedFloatIsEqual()
    && self->_timeScale == *((_DWORD *)v4 + 13)
    && self->_epoch == *((void *)v4 + 4)
    && self->_flags == *((_DWORD *)v4 + 12);

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_timeValue;
  return PBRepeatedFloatHash() ^ v2 ^ (2654435761 * self->_timeScale) ^ (2654435761 * self->_epoch) ^ (2654435761 * self->_flags);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_timeValue = v4[5];
  id v8 = v4;
  uint64_t v5 = [v4 homographyParamsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v8 homographyParamAtIndex:i];
      -[VCPProtoLivePhotoFrameInstruction addHomographyParam:](self, "addHomographyParam:");
    }
  }
  self->_timeScale = *((_DWORD *)v8 + 13);
  self->_epoch = *((void *)v8 + 4);
  self->_flags = *((_DWORD *)v8 + 12);
}

- (int64_t)timeValue
{
  return self->_timeValue;
}

- (void)setTimeValue:(int64_t)a3
{
  self->_timeValue = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

@end