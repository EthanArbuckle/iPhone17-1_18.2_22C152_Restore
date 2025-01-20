@interface VCPProtoFilesystemMovieClassificationResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)duration;
- (float)start;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (unint64_t)identifiersCount;
- (unsigned)identifierAtIndex:(unint64_t)a3;
- (unsigned)identifiers;
- (void)addIdentifier:(unsigned int)a3;
- (void)clearIdentifiers;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(float)a3;
- (void)setIdentifiers:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setStart:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoFilesystemMovieClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"attributes"];
  memset(&v26, 0, sizeof(v26));
  CMTimeRangeMakeFromDictionary(&v26, (CFDictionaryRef)v3);
  CMTime start = v26.start;
  CMTime duration = v26.duration;
  if ((v26.start.flags & 1) == 0) {
    goto LABEL_2;
  }
  v5 = 0;
  if ((v26.duration.flags & 1) != 0 && !v26.duration.epoch && (v26.duration.value & 0x8000000000000000) == 0)
  {
    if (![v4 count])
    {
LABEL_2:
      v5 = 0;
      goto LABEL_16;
    }
    v5 = objc_alloc_init(VCPProtoFilesystemMovieClassificationResult);
    CMTime v23 = start;
    Float64 Seconds = CMTimeGetSeconds(&v23);
    *(float *)&Float64 Seconds = Seconds;
    [(VCPProtoFilesystemMovieClassificationResult *)v5 setStart:Seconds];
    CMTime v22 = duration;
    Float64 v7 = CMTimeGetSeconds(&v22);
    *(float *)&Float64 v7 = v7;
    [(VCPProtoFilesystemMovieClassificationResult *)v5 setDuration:v7];
    [v4 count];
    MEMORY[0x1F4188790]();
    v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = [v4 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v11)
    {
      v17[1] = v17;
      int v12 = 0;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        int v15 = v12;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          *(_DWORD *)&v9[4 * (v15 + v14)] = [*(id *)(*((void *)&v18 + 1) + 8 * v14) longLongValue];
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
        int v12 = v15 + v14;
      }
      while (v11);
      uint64_t v11 = (v15 + v14);
    }

    [(VCPProtoFilesystemMovieClassificationResult *)v5 setIdentifiers:v9 count:v11];
  }
LABEL_16:

  return v5;
}

- (id)exportToLegacyDictionary
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[VCPProtoFilesystemMovieClassificationResult identifiersCount](self, "identifiersCount"));
  for (unint64_t i = 0; i < [(VCPProtoFilesystemMovieClassificationResult *)self identifiersCount]; ++i)
  {
    uint64_t v5 = [(VCPProtoFilesystemMovieClassificationResult *)self identifierAtIndex:i];
    v6 = [NSNumber numberWithUnsignedInt:v5];
    Float64 v7 = [v6 stringValue];
    [v3 setObject:&unk_1F15EAC58 forKey:v7];
  }
  memset(&v17, 0, sizeof(v17));
  [(VCPProtoFilesystemMovieClassificationResult *)self start];
  CMTimeMakeWithSeconds(&v17, v8, 600);
  memset(&v16, 0, sizeof(v16));
  [(VCPProtoFilesystemMovieClassificationResult *)self duration];
  CMTimeMakeWithSeconds(&v16, v9, 600);
  memset(&v15, 0, sizeof(v15));
  CMTime start = v17;
  CMTime v13 = v16;
  CMTimeRangeMake(&v15, &start, &v13);
  CMTimeRange range = v15;
  CFDictionaryRef v10 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v11 = (void *)[(__CFDictionary *)v10 mutableCopy];

  [v11 setObject:v3 forKeyedSubscript:@"attributes"];
  return v11;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoFilesystemMovieClassificationResult;
  [(VCPProtoFilesystemMovieClassificationResult *)&v3 dealloc];
}

- (unint64_t)identifiersCount
{
  return self->_identifiers.count;
}

- (unsigned)identifiers
{
  return self->_identifiers.list;
}

- (void)clearIdentifiers
{
}

- (void)addIdentifier:(unsigned int)a3
{
}

- (unsigned)identifierAtIndex:(unint64_t)a3
{
  p_identifiers = &self->_identifiers;
  unint64_t count = self->_identifiers.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    float v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    float v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_identifiers->list[a3];
}

- (void)setIdentifiers:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoFilesystemMovieClassificationResult;
  v4 = [(VCPProtoFilesystemMovieClassificationResult *)&v8 description];
  uint64_t v5 = [(VCPProtoFilesystemMovieClassificationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_start;
  uint64_t v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"start"];

  *(float *)&double v6 = self->_duration;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"duration"];

  objc_super v8 = PBRepeatedUInt32NSArray();
  [v3 setObject:v8 forKey:@"identifier"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoFilesystemMovieClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  p_identifiers = &self->_identifiers;
  if (p_identifiers->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_identifiers->count);
  }
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  v4[9] = LODWORD(self->_start);
  id v8 = v4;
  v4[8] = LODWORD(self->_duration);
  if ([(VCPProtoFilesystemMovieClassificationResult *)self identifiersCount])
  {
    [v8 clearIdentifiers];
    unint64_t v5 = [(VCPProtoFilesystemMovieClassificationResult *)self identifiersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addIdentifier:", -[VCPProtoFilesystemMovieClassificationResult identifierAtIndex:](self, "identifierAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (float *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[9] = self->_start;
  v4[8] = self->_duration;
  PBRepeatedUInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_start == v4[9]
    && self->_duration == v4[8])
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  float start = self->_start;
  float v4 = -start;
  if (start >= 0.0) {
    float v4 = self->_start;
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
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  float duration = self->_duration;
  float v13 = -duration;
  if (duration >= 0.0) {
    float v13 = self->_duration;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  float v16 = fmodf(v14, 1.8447e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  return v20 ^ v11 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  float v4 = (float *)a3;
  self->_float start = v4[9];
  self->_float duration = v4[8];
  unint64_t v8 = v4;
  uint64_t v5 = [v4 identifiersCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[VCPProtoFilesystemMovieClassificationResult addIdentifier:](self, "addIdentifier:", [v8 identifierAtIndex:i]);
  }
}

- (float)start
{
  return self->_start;
}

- (void)setStart:(float)a3
{
  self->_float start = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_float duration = a3;
}

@end