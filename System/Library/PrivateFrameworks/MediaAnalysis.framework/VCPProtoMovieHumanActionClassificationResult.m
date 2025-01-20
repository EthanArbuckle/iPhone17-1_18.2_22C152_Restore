@interface VCPProtoMovieHumanActionClassificationResult
+ (Class)classificationType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasFaceId;
- (BOOL)hasTorsoprint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)torsoprint;
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
- (void)setTorsoprint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieHumanActionClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v17, 0, sizeof(v17));
  CMTimeRangeMakeFromDictionary(&v17, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = [v4 objectForKeyedSubscript:@"humanBounds"];
  v6 = [v4 objectForKeyedSubscript:@"humanActions"];
  v7 = [v4 objectForKeyedSubscript:@"faceIdentifier"];
  v8 = [v4 objectForKeyedSubscript:@"torsoPrint"];
  if (v17.start.flags)
  {
    v9 = 0;
    if ((v17.duration.flags & 1) != 0 && !v17.duration.epoch)
    {
      v9 = 0;
      if ((v17.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v10 = objc_alloc_init(VCPProtoMovieHumanActionClassificationResult);
          CMTimeRange v16 = v17;
          v11 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v16];
          [(VCPProtoMovieHumanActionClassificationResult *)v10 setTimeRange:v11];

          NSRect v19 = NSRectFromString(v5);
          v12 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
          [(VCPProtoMovieHumanActionClassificationResult *)v10 setBounds:v12];

          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __93__VCPProtoMovieHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke;
          v14[3] = &unk_1E6298C90;
          v9 = v10;
          v15 = v9;
          [v6 enumerateKeysAndObjectsUsingBlock:v14];
          if (v7) {
            [(VCPProtoMovieHumanActionClassificationResult *)v9 setFaceId:v7];
          }
          if (v8) {
            [(VCPProtoMovieHumanActionClassificationResult *)v9 setTorsoprint:v8];
          }
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __93__VCPProtoMovieHumanActionClassificationResult_LegacyConversion__resultFromLegacyDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
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
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(VCPProtoMovieHumanActionClassificationResult *)self bounds];
  [v4 rectValue];
  id v5 = NSStringFromRect(v23);
  [v3 setObject:v5 forKeyedSubscript:@"humanBounds"];

  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[VCPProtoMovieHumanActionClassificationResult classificationsCount](self, "classificationsCount"));
  for (unint64_t i = 0; i < [(VCPProtoMovieHumanActionClassificationResult *)self classificationsCount]; ++i)
  {
    v8 = [(VCPProtoMovieHumanActionClassificationResult *)self classificationAtIndex:i];
    v9 = NSNumber;
    [v8 confidence];
    v10 = objc_msgSend(v9, "numberWithFloat:");
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
    v12 = [v11 stringValue];
    [v6 setObject:v10 forKey:v12];
  }
  [v3 setObject:v6 forKeyedSubscript:@"humanActions"];
  if ([(VCPProtoMovieHumanActionClassificationResult *)self hasFaceId])
  {
    v13 = [(VCPProtoMovieHumanActionClassificationResult *)self faceId];
    [v3 setObject:v13 forKeyedSubscript:@"faceIdentifier"];
  }
  if ([(VCPProtoMovieHumanActionClassificationResult *)self hasTorsoprint])
  {
    v14 = [(VCPProtoMovieHumanActionClassificationResult *)self torsoprint];
    [v3 setObject:v14 forKeyedSubscript:@"torsoPrint"];
  }
  v15 = [(VCPProtoMovieHumanActionClassificationResult *)self timeRange];
  CMTimeRange v16 = v15;
  if (v15) {
    [v15 timeRangeValue];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  CMTimeRange range = v20;
  CFDictionaryRef v17 = CMTimeRangeCopyAsDictionary(&range, 0);
  v18 = (void *)[(__CFDictionary *)v17 mutableCopy];

  [v18 setObject:v3 forKeyedSubscript:@"attributes"];
  return v18;
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

- (BOOL)hasFaceId
{
  return self->_faceId != 0;
}

- (BOOL)hasTorsoprint
{
  return self->_torsoprint != 0;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieHumanActionClassificationResult;
  id v4 = [(VCPProtoMovieHumanActionClassificationResult *)&v8 description];
  id v5 = [(VCPProtoMovieHumanActionClassificationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    id v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  bounds = self->_bounds;
  if (bounds)
  {
    id v7 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"bounds"];
  }
  if ([(NSMutableArray *)self->_classifications count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_classifications, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_classifications;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"classification"];
  }
  faceId = self->_faceId;
  if (faceId) {
    [v3 setObject:faceId forKey:@"faceId"];
  }
  torsoprint = self->_torsoprint;
  if (torsoprint) {
    [v3 setObject:torsoprint forKey:@"torsoprint"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHumanActionClassificationResultReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_classifications;
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

  if (self->_faceId) {
    PBDataWriterWriteStringField();
  }
  if (self->_torsoprint) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [v9 setTimeRange:self->_timeRange];
  [v9 setBounds:self->_bounds];
  if ([(VCPProtoMovieHumanActionClassificationResult *)self classificationsCount])
  {
    [v9 clearClassifications];
    unint64_t v4 = [(VCPProtoMovieHumanActionClassificationResult *)self classificationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VCPProtoMovieHumanActionClassificationResult *)self classificationAtIndex:i];
        [v9 addClassification:v7];
      }
    }
  }
  if (self->_faceId) {
    objc_msgSend(v9, "setFaceId:");
  }
  uint64_t v8 = v9;
  if (self->_torsoprint)
  {
    objc_msgSend(v9, "setTorsoprint:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v10 = self->_classifications;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v14), "copyWithZone:", a3, (void)v21);
        [v5 addClassification:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSString *)self->_faceId copyWithZone:a3];
  CFDictionaryRef v17 = (void *)v5[3];
  v5[3] = v16;

  uint64_t v18 = [(NSData *)self->_torsoprint copyWithZone:a3];
  long long v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[4]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | v4[1])) || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && ((classifications = self->_classifications, !((unint64_t)classifications | v4[2]))
     || -[NSMutableArray isEqual:](classifications, "isEqual:"))
    && ((faceId = self->_faceId, !((unint64_t)faceId | v4[3]))
     || -[NSString isEqual:](faceId, "isEqual:")))
  {
    torsoprint = self->_torsoprint;
    if ((unint64_t)torsoprint | v4[5]) {
      char v10 = -[NSData isEqual:](torsoprint, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  unint64_t v4 = [(VCPProtoBounds *)self->_bounds hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_classifications hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_faceId hash];
  return v6 ^ [(NSData *)self->_torsoprint hash];
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
    -[VCPProtoMovieHumanActionClassificationResult setTimeRange:](self, "setTimeRange:");
  }
  bounds = self->_bounds;
  uint64_t v8 = *((void *)v4 + 1);
  if (bounds)
  {
    if (v8) {
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[VCPProtoMovieHumanActionClassificationResult setBounds:](self, "setBounds:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 2);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[VCPProtoMovieHumanActionClassificationResult addClassification:](self, "addClassification:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (*((void *)v4 + 3)) {
    -[VCPProtoMovieHumanActionClassificationResult setFaceId:](self, "setFaceId:");
  }
  if (*((void *)v4 + 5)) {
    -[VCPProtoMovieHumanActionClassificationResult setTorsoprint:](self, "setTorsoprint:");
  }
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (NSMutableArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
}

- (NSString)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(id)a3
{
}

- (NSData)torsoprint
{
  return self->_torsoprint;
}

- (void)setTorsoprint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_faceId, 0);
  objc_storeStrong((id *)&self->_classifications, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end