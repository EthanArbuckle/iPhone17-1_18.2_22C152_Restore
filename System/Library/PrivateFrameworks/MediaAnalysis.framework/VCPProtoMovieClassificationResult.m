@interface VCPProtoMovieClassificationResult
+ (Class)classificationType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classifications;
- (VCPProtoTimeRange)timeRange;
- (id)classificationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)classificationsCount;
- (unint64_t)hash;
- (void)addClassification:(id)a3;
- (void)clearClassifications;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassifications:(id)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieClassificationResult

- (void)clearClassifications
{
}

- (void)addClassification:(id)a3
{
  id v4 = a3;
  classifications = self->_classifications;
  id v8 = v4;
  if (!classifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_classifications;
    self->_classifications = v6;

    id v4 = v8;
    classifications = self->_classifications;
  }
  [(NSMutableArray *)classifications addObject:v4];
}

- (unint64_t)classificationsCount
{
  return [(NSMutableArray *)self->_classifications count];
}

- (id)classificationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_classifications objectAtIndex:a3];
}

+ (Class)classificationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieClassificationResult;
  id v4 = [(VCPProtoMovieClassificationResult *)&v8 description];
  v5 = [(VCPProtoMovieClassificationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  if ([(NSMutableArray *)self->_classifications count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_classifications, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_classifications;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"classification"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieClassificationResultReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_classifications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setTimeRange:self->_timeRange];
  if ([(VCPProtoMovieClassificationResult *)self classificationsCount])
  {
    [v8 clearClassifications];
    unint64_t v4 = [(VCPProtoMovieClassificationResult *)self classificationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VCPProtoMovieClassificationResult *)self classificationAtIndex:i];
        [v8 addClassification:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_classifications;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addClassification:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[2]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")))
  {
    classifications = self->_classifications;
    if ((unint64_t)classifications | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](classifications, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  return [(NSMutableArray *)self->_classifications hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 2);
  if (timeRange)
  {
    if (v6) {
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCPProtoMovieClassificationResult setTimeRange:](self, "setTimeRange:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[VCPProtoMovieClassificationResult addClassification:](self, "addClassification:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (NSMutableArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, v3);
  id v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  unint64_t v5 = v4;
  if ((v13.start.flags & 1) == 0) {
    goto LABEL_2;
  }
  uint64_t v6 = 0;
  if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch && (v13.duration.value & 0x8000000000000000) == 0)
  {
    if (![v4 count])
    {
LABEL_2:
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    id v7 = objc_alloc_init(VCPProtoMovieClassificationResult);
    CMTimeRange v12 = v13;
    uint64_t v8 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v12];
    [(VCPProtoMovieClassificationResult *)v7 setTimeRange:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__VCPProtoMovieClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
    v10[3] = &unk_1E6298C90;
    uint64_t v6 = v7;
    uint64_t v11 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
  }
LABEL_8:

  return v6;
}

void __82__VCPProtoMovieClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(VCPProtoClassification);
  -[VCPProtoClassification setIdentifier:](v6, "setIdentifier:", [v7 longLongValue]);
  [v5 floatValue];
  -[VCPProtoClassification setConfidence:](v6, "setConfidence:");
  [*(id *)(a1 + 32) addClassification:v6];
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[VCPProtoMovieClassificationResult classificationsCount](self, "classificationsCount"));
  for (unint64_t i = 0; i < [(VCPProtoMovieClassificationResult *)self classificationsCount]; ++i)
  {
    id v5 = [(VCPProtoMovieClassificationResult *)self classificationAtIndex:i];
    uint64_t v6 = NSNumber;
    [v5 confidence];
    id v7 = objc_msgSend(v6, "numberWithFloat:");
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "identifier"));
    uint64_t v9 = [v8 stringValue];
    [v3 setObject:v7 forKey:v9];
  }
  uint64_t v10 = [(VCPProtoMovieClassificationResult *)self timeRange];
  uint64_t v11 = v10;
  if (v10) {
    [v10 timeRangeValue];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CMTimeRange range = v15;
  CFDictionaryRef v12 = CMTimeRangeCopyAsDictionary(&range, 0);
  CMTimeRange v13 = (void *)[(__CFDictionary *)v12 mutableCopy];

  [v13 setObject:v3 forKeyedSubscript:@"attributes"];
  return v13;
}

@end