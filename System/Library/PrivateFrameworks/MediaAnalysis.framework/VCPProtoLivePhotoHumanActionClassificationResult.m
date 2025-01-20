@interface VCPProtoLivePhotoHumanActionClassificationResult
+ (Class)classificationType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasFaceId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)classifications;
- (NSString)faceId;
- (VCPProtoBounds)bounds;
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
- (void)setBounds:(id)a3;
- (void)setClassifications:(id)a3;
- (void)setFaceId:(id)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoHumanActionClassificationResult

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

- (BOOL)hasFaceId
{
  return self->_faceId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoHumanActionClassificationResult;
  id v4 = [(VCPProtoLivePhotoHumanActionClassificationResult *)&v8 description];
  v5 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = self->_classifications;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"classification"];
  }
  bounds = self->_bounds;
  if (bounds)
  {
    v14 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"bounds"];
  }
  faceId = self->_faceId;
  if (faceId) {
    [v3 setObject:faceId forKey:@"faceId"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoHumanActionClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
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

  PBDataWriterWriteSubmessage();
  if (self->_faceId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setTimeRange:self->_timeRange];
  if ([(VCPProtoLivePhotoHumanActionClassificationResult *)self classificationsCount])
  {
    [v8 clearClassifications];
    unint64_t v4 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self classificationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self classificationAtIndex:i];
        [v8 addClassification:v7];
      }
    }
  }
  [v8 setBounds:self->_bounds];
  if (self->_faceId) {
    objc_msgSend(v8, "setFaceId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_classifications;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        [v5 addClassification:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  uint64_t v15 = (void *)v5[1];
  v5[1] = v14;

  uint64_t v16 = [(NSString *)self->_faceId copyWithZone:a3];
  long long v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[4]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && ((classifications = self->_classifications, !((unint64_t)classifications | v4[2]))
     || -[NSMutableArray isEqual:](classifications, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[1])) || -[VCPProtoBounds isEqual:](bounds, "isEqual:")))
  {
    faceId = self->_faceId;
    if ((unint64_t)faceId | v4[3]) {
      char v9 = -[NSString isEqual:](faceId, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  uint64_t v4 = [(NSMutableArray *)self->_classifications hash] ^ v3;
  unint64_t v5 = [(VCPProtoBounds *)self->_bounds hash];
  return v4 ^ v5 ^ [(NSString *)self->_faceId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 4);
  if (timeRange)
  {
    if (v6) {
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCPProtoLivePhotoHumanActionClassificationResult setTimeRange:](self, "setTimeRange:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        -[VCPProtoLivePhotoHumanActionClassificationResult addClassification:](self, "addClassification:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  bounds = self->_bounds;
  uint64_t v13 = *((void *)v4 + 1);
  if (bounds)
  {
    if (v13) {
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[VCPProtoLivePhotoHumanActionClassificationResult setBounds:](self, "setBounds:");
  }
  if (*((void *)v4 + 3)) {
    -[VCPProtoLivePhotoHumanActionClassificationResult setFaceId:](self, "setFaceId:");
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

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (NSString)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_faceId, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v16, 0, sizeof(v16));
  CMTimeRangeMakeFromDictionary(&v16, v3);
  id v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  unint64_t v5 = [v4 objectForKeyedSubscript:@"humanBounds"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"humanActions"];
  id v7 = [v4 objectForKeyedSubscript:@"faceIdentifier"];
  if (v16.start.flags)
  {
    uint64_t v8 = 0;
    if ((v16.duration.flags & 1) != 0 && !v16.duration.epoch && (v16.duration.value & 0x8000000000000000) == 0)
    {
      uint64_t v8 = 0;
      if ([v4 count])
      {
        if (v5)
        {
          uint64_t v10 = objc_alloc_init(VCPProtoLivePhotoHumanActionClassificationResult);
          CMTimeRange v15 = v16;
          uint64_t v11 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v15];
          [(VCPProtoLivePhotoHumanActionClassificationResult *)v10 setTimeRange:v11];

          NSRect v18 = NSRectFromString(v5);
          uint64_t v12 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
          [(VCPProtoLivePhotoHumanActionClassificationResult *)v10 setBounds:v12];

          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __97__VCPProtoLivePhotoHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
          v13[3] = &unk_1E6298C90;
          uint64_t v8 = v10;
          long long v14 = v8;
          [v6 enumerateKeysAndObjectsUsingBlock:v13];
          if (v7) {
            [(VCPProtoLivePhotoHumanActionClassificationResult *)v8 setFaceId:v7];
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __97__VCPProtoLivePhotoHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[VCPProtoLivePhotoHumanActionClassificationResult classificationsCount](self, "classificationsCount"));
  for (unint64_t i = 0;
        i < [(VCPProtoLivePhotoHumanActionClassificationResult *)self classificationsCount];
        ++i)
  {
    uint64_t v6 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self classificationAtIndex:i];
    id v7 = NSNumber;
    [v6 confidence];
    uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "identifier"));
    uint64_t v10 = [v9 stringValue];
    [v4 setObject:v8 forKey:v10];
  }
  [v3 setObject:v4 forKeyedSubscript:@"humanActions"];
  uint64_t v11 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self bounds];
  [v11 rectValue];
  uint64_t v12 = NSStringFromRect(v22);
  [v3 setObject:v12 forKeyedSubscript:@"humanBounds"];

  if ([(VCPProtoLivePhotoHumanActionClassificationResult *)self hasFaceId])
  {
    uint64_t v13 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self faceId];
    [v3 setObject:v13 forKeyedSubscript:@"faceIdentifier"];
  }
  long long v14 = [(VCPProtoLivePhotoHumanActionClassificationResult *)self timeRange];
  CMTimeRange v15 = v14;
  if (v14) {
    [v14 timeRangeValue];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CMTimeRange range = v19;
  CFDictionaryRef v16 = CMTimeRangeCopyAsDictionary(&range, 0);
  long long v17 = (void *)[(__CFDictionary *)v16 mutableCopy];

  [v17 setObject:v3 forKeyedSubscript:@"attributes"];
  return v17;
}

@end