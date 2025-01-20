@interface VCPProtoEmbeddingResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)embeddingBlob;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddingBlob:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setTimeRange:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoEmbeddingResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, v3);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = (void *)v4;
  if (v13.start.flags)
  {
    v6 = 0;
    if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch)
    {
      v6 = 0;
      if ((v13.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          v8 = objc_alloc_init(VCPProtoEmbeddingResult);
          CMTimeRange v12 = v13;
          v9 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v12];
          [(VCPProtoEmbeddingResult *)v8 setTimeRange:v9];

          v10 = [v5 objectForKeyedSubscript:@"embeddings"];
          if (v10)
          {
            [(VCPProtoEmbeddingResult *)v8 setEmbeddingBlob:v10];
            v11 = [v5 objectForKeyedSubscript:@"embeddingVersion"];
            if (v11)
            {
              [(VCPProtoEmbeddingResult *)v8 setHasVersion:1];
              -[VCPProtoEmbeddingResult setVersion:](v8, "setVersion:", [v11 unsignedIntValue]);
            }
            v6 = v8;
          }
          else
          {
            v6 = 0;
          }
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoEmbeddingResult *)self timeRange];
  uint64_t v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CMTimeRange range = v11;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(VCPProtoEmbeddingResult *)self embeddingBlob];
  [v7 setObject:v8 forKeyedSubscript:@"embeddings"];

  if ([(VCPProtoEmbeddingResult *)self hasVersion])
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoEmbeddingResult version](self, "version"));
    [v7 setObject:v9 forKeyedSubscript:@"embeddingVersion"];
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, @"attributes", *(_OWORD *)&v11.start.value, *(_OWORD *)&v11.start.epoch, *(_OWORD *)&v11.duration.timescale);

  return v6;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoEmbeddingResult;
  uint64_t v4 = [(VCPProtoEmbeddingResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoEmbeddingResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    CFDictionaryRef v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  embeddingBlob = self->_embeddingBlob;
  if (embeddingBlob) {
    [v3 setObject:embeddingBlob forKey:@"embeddingBlob"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v7 forKey:@"version"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoEmbeddingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setTimeRange:self->_timeRange];
  [v4 setEmbeddingBlob:self->_embeddingBlob];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_version;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_embeddingBlob copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((void *)v4 + 2))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")) {
      goto LABEL_10;
    }
  }
  embeddingBlob = self->_embeddingBlob;
  if ((unint64_t)embeddingBlob | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](embeddingBlob, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_version == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  uint64_t v4 = [(NSData *)self->_embeddingBlob hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_version;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoEmbeddingResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[VCPProtoEmbeddingResult setEmbeddingBlob:](self, "setEmbeddingBlob:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (NSData)embeddingBlob
{
  return self->_embeddingBlob;
}

- (void)setEmbeddingBlob:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_embeddingBlob, 0);
}

@end