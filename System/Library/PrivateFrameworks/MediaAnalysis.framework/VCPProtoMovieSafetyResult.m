@interface VCPProtoMovieSafetyResult
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
- (int)sensitivity;
- (unint64_t)classificationsCount;
- (unint64_t)hash;
- (void)addClassification:(id)a3;
- (void)clearClassifications;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassifications:(id)a3;
- (void)setSensitivity:(int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieSafetyResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"attributes"];
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, (CFDictionaryRef)v3);
  v5 = [v4 objectForKeyedSubscript:@"Sensitivity"];
  v6 = [v4 objectForKeyedSubscript:@"SensitivitySceneResults"];
  if (v14.start.flags)
  {
    v7 = 0;
    if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
    {
      v7 = 0;
      if ((v14.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v8 = objc_alloc_init(VCPProtoMovieSafetyResult);
          CMTimeRange v13 = v14;
          v9 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v13];
          [(VCPProtoMovieSafetyResult *)v8 setTimeRange:v9];

          -[VCPProtoMovieSafetyResult setSensitivity:](v8, "setSensitivity:", [v5 intValue]);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __74__VCPProtoMovieSafetyResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
          v11[3] = &unk_1E6298C90;
          v7 = v8;
          v12 = v7;
          [v6 enumerateKeysAndObjectsUsingBlock:v11];
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __74__VCPProtoMovieSafetyResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = objc_alloc_init(VCPProtoClassification);
  -[VCPProtoClassification setIdentifier:](v6, "setIdentifier:", [v7 longLongValue]);
  [v5 floatValue];
  -[VCPProtoClassification setConfidence:](v6, "setConfidence:");
  [*(id *)(a1 + 32) addClassification:v6];
}

- (id)exportToLegacyDictionary
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(VCPProtoMovieSafetyResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  CMTimeRange range = v17;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[VCPProtoMovieSafetyResult classificationsCount](self, "classificationsCount"));
  for (unint64_t i = 0;
        i < [(VCPProtoMovieSafetyResult *)self classificationsCount];
        ++i)
  {
    v9 = [(VCPProtoMovieSafetyResult *)self classificationAtIndex:i];
    v10 = NSNumber;
    [v9 confidence];
    v11 = objc_msgSend(v10, "numberWithFloat:");
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "identifier"));
    CMTimeRange v13 = [v12 stringValue];
    [v7 setObject:v11 forKey:v13];
  }
  v19[0] = @"Sensitivity";
  CMTimeRange v14 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoMovieSafetyResult sensitivity](self, "sensitivity"));
  v19[1] = @"SensitivitySceneResults";
  v20[0] = v14;
  v20[1] = v7;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v6 setObject:v15 forKeyedSubscript:@"attributes"];

  return v6;
}

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
    id v7 = self->_classifications;
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
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSafetyResult;
  id v4 = [(VCPProtoMovieSafetyResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMovieSafetyResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    CFDictionaryRef v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  v6 = [NSNumber numberWithInt:self->_sensitivity];
  [v3 setObject:v6 forKey:@"sensitivity"];

  if ([(NSMutableArray *)self->_classifications count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_classifications, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_classifications;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          CMTimeRange v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"classification"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSafetyResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFDictionaryRef v5 = self->_classifications;
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
  uint64_t v8 = a3;
  [v8 setTimeRange:self->_timeRange];
  v8[4] = self->_sensitivity;
  if ([(VCPProtoMovieSafetyResult *)self classificationsCount])
  {
    [v8 clearClassifications];
    unint64_t v4 = [(VCPProtoMovieSafetyResult *)self classificationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VCPProtoMovieSafetyResult *)self classificationAtIndex:i];
        [v8 addClassification:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(_DWORD *)(v5 + 16) = self->_sensitivity;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_classifications;
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
        [(id)v5 addClassification:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[3]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_sensitivity == *((_DWORD *)v4 + 4))
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
  uint64_t v4 = 2654435761 * self->_sensitivity;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_classifications hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 3);
  if (timeRange)
  {
    if (v6) {
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCPProtoMovieSafetyResult setTimeRange:](self, "setTimeRange:");
  }
  self->_sensitivity = *((_DWORD *)v4 + 4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        -[VCPProtoMovieSafetyResult addClassification:](self, "addClassification:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

- (int)sensitivity
{
  return self->_sensitivity;
}

- (void)setSensitivity:(int)a3
{
  self->_sensitivity = a3;
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

@end