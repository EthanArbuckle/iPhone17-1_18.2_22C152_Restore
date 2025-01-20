@interface VCPProtoMovieMovingObjectResult
+ (Class)boundsType;
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bounds;
- (VCPProtoTimeRange)timeRange;
- (id)boundsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)boundsCount;
- (unint64_t)hash;
- (void)addBounds:(id)a3;
- (void)clearBounds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieMovingObjectResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v20, 0, sizeof(v20));
  CMTimeRangeMakeFromDictionary(&v20, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = [v4 objectForKeyedSubscript:@"objectBounds"];
  v6 = v5;
  if ((v20.start.flags & 1) == 0) {
    goto LABEL_2;
  }
  v7 = 0;
  if ((v20.duration.flags & 1) != 0 && !v20.duration.epoch && (v20.duration.value & 0x8000000000000000) == 0)
  {
    if (![v5 count])
    {
LABEL_2:
      v7 = 0;
      goto LABEL_15;
    }
    v7 = objc_alloc_init(VCPProtoMovieMovingObjectResult);
    CMTimeRange v19 = v20;
    v8 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v19];
    [(VCPProtoMovieMovingObjectResult *)v7 setTimeRange:v8];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          NSRect v24 = NSRectFromString((NSString *)*(void *)(*((void *)&v15 + 1) + 8 * i));
          v13 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height, (void)v15);
          [(VCPProtoMovieMovingObjectResult *)v7 addBounds:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v10);
    }
  }
LABEL_15:

  return v7;
}

- (id)exportToLegacyDictionary
{
  v16[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[VCPProtoMovieMovingObjectResult boundsCount](self, "boundsCount"));
  for (unint64_t i = 0; i < [(VCPProtoMovieMovingObjectResult *)self boundsCount]; ++i)
  {
    v5 = [(VCPProtoMovieMovingObjectResult *)self boundsAtIndex:i];
    [v5 rectValue];
    v6 = NSStringFromRect(v18);
    [v3 addObject:v6];
  }
  v7 = [(VCPProtoMovieMovingObjectResult *)self timeRange];
  v8 = v7;
  if (v7) {
    [v7 timeRangeValue];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CMTimeRange range = v13;
  CFDictionaryRef v9 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v10 = (void *)[(__CFDictionary *)v9 mutableCopy];

  long long v15 = @"objectBounds";
  v16[0] = v3;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v10 setObject:v11 forKeyedSubscript:@"attributes"];

  return v10;
}

- (void)clearBounds
{
}

- (void)addBounds:(id)a3
{
  id v4 = a3;
  bounds = self->_bounds;
  id v8 = v4;
  if (!bounds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_bounds;
    self->_bounds = v6;

    id v4 = v8;
    bounds = self->_bounds;
  }
  [(NSMutableArray *)bounds addObject:v4];
}

- (unint64_t)boundsCount
{
  return [(NSMutableArray *)self->_bounds count];
}

- (id)boundsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bounds objectAtIndex:a3];
}

+ (Class)boundsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieMovingObjectResult;
  id v4 = [(VCPProtoMovieMovingObjectResult *)&v8 description];
  v5 = [(VCPProtoMovieMovingObjectResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  if ([(NSMutableArray *)self->_bounds count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_bounds, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_bounds;
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

    [v3 setObject:v6 forKey:@"bounds"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieMovingObjectResultReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  v5 = self->_bounds;
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
  if ([(VCPProtoMovieMovingObjectResult *)self boundsCount])
  {
    [v8 clearBounds];
    unint64_t v4 = [(VCPProtoMovieMovingObjectResult *)self boundsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VCPProtoMovieMovingObjectResult *)self boundsAtIndex:i];
        [v8 addBounds:v7];
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
  id v8 = self->_bounds;
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
        [v5 addBounds:v13];

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
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](bounds, "isEqual:");
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
  return [(NSMutableArray *)self->_bounds hash] ^ v3;
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
    -[VCPProtoMovieMovingObjectResult setTimeRange:](self, "setTimeRange:");
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
        -[VCPProtoMovieMovingObjectResult addBounds:](self, "addBounds:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

- (NSMutableArray)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end