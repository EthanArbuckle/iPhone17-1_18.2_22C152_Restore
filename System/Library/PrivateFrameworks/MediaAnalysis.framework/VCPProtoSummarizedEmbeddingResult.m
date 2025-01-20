@interface VCPProtoSummarizedEmbeddingResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)embeddingIDsCount;
- (unint64_t)hash;
- (unsigned)embeddingIDAtIndex:(unint64_t)a3;
- (unsigned)embeddingIDs;
- (void)addEmbeddingID:(unsigned int)a3;
- (void)clearEmbeddingIDs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEmbeddingIDs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoSummarizedEmbeddingResult

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoSummarizedEmbeddingResult;
  [(VCPProtoSummarizedEmbeddingResult *)&v3 dealloc];
}

- (unint64_t)embeddingIDsCount
{
  return self->_embeddingIDs.count;
}

- (unsigned)embeddingIDs
{
  return self->_embeddingIDs.list;
}

- (void)clearEmbeddingIDs
{
}

- (void)addEmbeddingID:(unsigned int)a3
{
}

- (unsigned)embeddingIDAtIndex:(unint64_t)a3
{
  p_embeddingIDs = &self->_embeddingIDs;
  unint64_t count = self->_embeddingIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_embeddingIDs->list[a3];
}

- (void)setEmbeddingIDs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoSummarizedEmbeddingResult;
  v4 = [(VCPProtoSummarizedEmbeddingResult *)&v8 description];
  v5 = [(VCPProtoSummarizedEmbeddingResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"embeddingID"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoSummarizedEmbeddingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteSubmessage();
  p_embeddingIDs = &self->_embeddingIDs;
  if (p_embeddingIDs->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_embeddingIDs->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [v7 setTimeRange:self->_timeRange];
  if ([(VCPProtoSummarizedEmbeddingResult *)self embeddingIDsCount])
  {
    [v7 clearEmbeddingIDs];
    unint64_t v4 = [(VCPProtoSummarizedEmbeddingResult *)self embeddingIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addEmbeddingID:", -[VCPProtoSummarizedEmbeddingResult embeddingIDAtIndex:](self, "embeddingIDAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[4]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")))
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
  unint64_t v2 = [(VCPProtoTimeRange *)self->_timeRange hash];
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = v4[4];
  v10 = v4;
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
    -[VCPProtoSummarizedEmbeddingResult setTimeRange:](self, "setTimeRange:");
  }
  unint64_t v4 = v10;
LABEL_7:
  uint64_t v7 = [v4 embeddingIDsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[VCPProtoSummarizedEmbeddingResult addEmbeddingID:](self, "addEmbeddingID:", [v10 embeddingIDAtIndex:i]);
  }
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  v28[16] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 objectForKeyedSubscript:@"attributes"];
  memset(&v27, 0, sizeof(v27));
  CMTimeRangeMakeFromDictionary(&v27, (CFDictionaryRef)v3);
  if (v27.start.flags)
  {
    unint64_t v5 = 0;
    if ((v27.duration.flags & 1) != 0 && !v27.duration.epoch)
    {
      unint64_t v5 = 0;
      if ((v27.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          uint64_t v7 = [v4 objectForKeyedSubscript:@"embeddingIds"];
          if ([v7 count])
          {
            unint64_t v5 = objc_alloc_init(VCPProtoSummarizedEmbeddingResult);
            CMTimeRange v26 = v27;
            uint64_t v8 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v26];
            [(VCPProtoSummarizedEmbeddingResult *)v5 setTimeRange:v8];

            uint64_t v9 = [v7 count];
            MEMORY[0x1F4188790]((void *)(4 * v9), v9, v10, v11);
            v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            id v14 = v7;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
            if (v15)
            {
              uint64_t v20 = (uint64_t)&v20;
              v21 = v7;
              int v16 = 0;
              uint64_t v17 = *(void *)v23;
              do
              {
                uint64_t v18 = 0;
                int v19 = v16;
                do
                {
                  if (*(void *)v23 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  *(_DWORD *)&v13[4 * (v19 + v18)] = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v18), "unsignedIntValue", v20);
                  ++v18;
                }
                while (v15 != v18);
                uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
                int v16 = v19 + v18;
              }
              while (v15);
              uint64_t v15 = (v19 + v18);
              uint64_t v7 = v21;
            }

            [(VCPProtoSummarizedEmbeddingResult *)v5 setEmbeddingIDs:v13 count:v15];
          }
          else
          {
            unint64_t v5 = 0;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(VCPProtoSummarizedEmbeddingResult *)self timeRange];
  unint64_t v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CMTimeRange range = v13;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[VCPProtoSummarizedEmbeddingResult embeddingIDsCount](self, "embeddingIDsCount"));
  for (unint64_t i = 0;
        i < [(VCPProtoSummarizedEmbeddingResult *)self embeddingIDsCount];
        ++i)
  {
    uint64_t v9 = [(VCPProtoSummarizedEmbeddingResult *)self embeddingIDAtIndex:i];
    uint64_t v10 = [NSNumber numberWithUnsignedInt:v9];
    [v7 addObject:v10];
  }
  uint64_t v15 = @"embeddingIds";
  v16[0] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v6 setObject:v11 forKeyedSubscript:@"attributes"];

  return v6;
}

@end