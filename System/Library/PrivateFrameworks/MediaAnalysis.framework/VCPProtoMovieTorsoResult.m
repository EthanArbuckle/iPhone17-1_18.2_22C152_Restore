@interface VCPProtoMovieTorsoResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)bounds;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (unsigned)faceId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setFaceId:(unsigned int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieTorsoResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v16, 0, sizeof(v16));
  CMTimeRangeMakeFromDictionary(&v16, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = [v4 objectForKeyedSubscript:@"humanBounds"];
  v6 = [v4 objectForKeyedSubscript:@"faceId"];
  if (v6
    || ([v4 objectForKeyedSubscript:@"faceIdentifier"],
        v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = v12 == 0,
        v12,
        v13))
  {
    if ((v16.start.flags & 1) != 0
      && (v16.duration.flags & 1) != 0
      && !v16.duration.epoch
      && v6
      && (v16.duration.value & 0x8000000000000000) == 0
      && v5)
    {
      v9 = objc_alloc_init(VCPProtoMovieTorsoResult);
      CMTimeRange v15 = v16;
      v10 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v15];
      [(VCPProtoMovieTorsoResult *)v9 setTimeRange:v10];

      NSRect v25 = NSRectFromString(v5);
      v11 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
      [(VCPProtoMovieTorsoResult *)v9 setBounds:v11];

      -[VCPProtoMovieTorsoResult setFaceId:](v9, "setFaceId:", [v6 unsignedIntValue]);
      goto LABEL_22;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        if (v16.start.flags)
        {
          LODWORD(v8) = 1;
          if ((v16.duration.flags & 1) != 0 && !v16.duration.epoch) {
            unint64_t v8 = (unint64_t)v16.duration.value >> 63;
          }
        }
        else
        {
          LODWORD(v8) = 1;
        }
        *(_DWORD *)buf = 67109632;
        int v18 = v8;
        __int16 v19 = 1024;
        BOOL v20 = v5 == 0;
        __int16 v21 = 1024;
        BOOL v22 = v6 == 0;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "[VCPProtoMovieTorsoResult] Invalid time range (%d) / boundsValue (%d) / faceIdValue (%d)", buf, 0x14u);
      }
    }
  }
  else
  {
    if (+[VCPProtoMovieTorsoResult(LegacyConversion) resultFromLegacyDictionary:]::onceToken == -1)
    {
      v9 = 0;
      goto LABEL_22;
    }
    dispatch_once(&+[VCPProtoMovieTorsoResult(LegacyConversion) resultFromLegacyDictionary:]::onceToken, &__block_literal_global_51);
  }
  v9 = 0;
LABEL_22:

  return v9;
}

void __73__VCPProtoMovieTorsoResult_LegacyConversion__resultFromLegacyDictionary___block_invoke()
{
  v0 = VCPLogInstance();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __73__VCPProtoMovieTorsoResult_LegacyConversion__resultFromLegacyDictionary___block_invoke_cold_1(v0);
  }
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(VCPProtoMovieTorsoResult *)self bounds];
  [v4 rectValue];
  v5 = NSStringFromRect(v15);
  [v3 setObject:v5 forKeyedSubscript:@"humanBounds"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCPProtoMovieTorsoResult faceId](self, "faceId"));
  [v3 setObject:v6 forKeyedSubscript:@"faceId"];

  v7 = [(VCPProtoMovieTorsoResult *)self timeRange];
  unint64_t v8 = v7;
  if (v7) {
    [v7 timeRangeValue];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CMTimeRange range = v12;
  CFDictionaryRef v9 = CMTimeRangeCopyAsDictionary(&range, 0);
  v10 = (void *)[(__CFDictionary *)v9 mutableCopy];

  [v10 setObject:v3 forKeyedSubscript:@"attributes"];
  return v10;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieTorsoResult;
  v4 = [(VCPProtoMovieTorsoResult *)&v8 description];
  v5 = [(VCPProtoMovieTorsoResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  bounds = self->_bounds;
  if (bounds)
  {
    v7 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"bounds"];
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_faceId];
  [v3 setObject:v8 forKey:@"faceId"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieTorsoResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  v5 = a3;
  [v5 setTimeRange:timeRange];
  [v5 setBounds:self->_bounds];
  v5[4] = self->_faceId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  CFDictionaryRef v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  *(_DWORD *)(v5 + 16) = self->_faceId;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 3)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && ((bounds = self->_bounds, !((unint64_t)bounds | *((void *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_faceId == *((_DWORD *)v4 + 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  return [(VCPProtoBounds *)self->_bounds hash] ^ v3 ^ (2654435761 * self->_faceId);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
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
    -[VCPProtoMovieTorsoResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v9;
LABEL_7:
  bounds = self->_bounds;
  uint64_t v8 = *((void *)v4 + 1);
  if (bounds)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoMovieTorsoResult setBounds:](self, "setBounds:");
  }
  id v4 = v9;
LABEL_13:
  self->_faceId = *((_DWORD *)v4 + 4);
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

- (unsigned)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(unsigned int)a3
{
  self->_faceId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

void __73__VCPProtoMovieTorsoResult_LegacyConversion__resultFromLegacyDictionary___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "Previous media analysis database restore causes missing MediaAnalysisResultFaceIDAttributeKey (present as MediaAnalysisResultFaceIdentifierAttributeKey) in movie torso results", v1, 2u);
}

@end