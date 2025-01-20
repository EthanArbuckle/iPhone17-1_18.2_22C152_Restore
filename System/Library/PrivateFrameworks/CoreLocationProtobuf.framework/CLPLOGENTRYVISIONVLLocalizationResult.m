@interface CLPLOGENTRYVISIONVLLocalizationResult
- (BOOL)hasConfidence;
- (BOOL)hasCovariance;
- (BOOL)hasDebugInfo;
- (BOOL)hasLocation;
- (BOOL)hasTimestamp;
- (BOOL)hasTransform;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONSimdDoubleMxN)transform;
- (CLPLOGENTRYVISIONTimeStamp)timestamp;
- (CLPLOGENTRYVISIONVLLocalizationDebugInfo)debugInfo;
- (CLPLOGENTRYVISIONVLLocation)location;
- (CLPLOGENTRYVISIONVLMatrixfMxN)covariance;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setCovariance:(id)a3;
- (void)setDebugInfo:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTransform:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVLLocalizationResult

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasTransform
{
  return self->_transform != 0;
}

- (BOOL)hasCovariance
{
  return self->_covariance != 0;
}

- (void)setConfidence:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDebugInfo
{
  return self->_debugInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationResult;
  v4 = [(CLPLOGENTRYVISIONVLLocalizationResult *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVLLocalizationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v6 = [(CLPLOGENTRYVISIONTimeStamp *)timestamp dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timestamp"];
  }
  location = self->_location;
  if (location)
  {
    objc_super v8 = [(CLPLOGENTRYVISIONVLLocation *)location dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"location"];
  }
  transform = self->_transform;
  if (transform)
  {
    v10 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)transform dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"transform"];
  }
  covariance = self->_covariance;
  if (covariance)
  {
    v12 = [(CLPLOGENTRYVISIONVLMatrixfMxN *)covariance dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"covariance"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_confidence;
    v13 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v13 forKey:@"confidence"];
  }
  debugInfo = self->_debugInfo;
  if (debugInfo)
  {
    v15 = [(CLPLOGENTRYVISIONVLLocalizationDebugInfo *)debugInfo dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"debug_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocalizationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_transform)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_covariance)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_debugInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_timestamp)
  {
    objc_msgSend(v4, "setTimestamp:");
    id v4 = v5;
  }
  if (self->_location)
  {
    objc_msgSend(v5, "setLocation:");
    id v4 = v5;
  }
  if (self->_transform)
  {
    objc_msgSend(v5, "setTransform:");
    id v4 = v5;
  }
  if (self->_covariance)
  {
    objc_msgSend(v5, "setCovariance:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_confidence);
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_debugInfo)
  {
    objc_msgSend(v5, "setDebugInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(CLPLOGENTRYVISIONVLLocation *)self->_location copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)self->_transform copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  id v12 = [(CLPLOGENTRYVISIONVLMatrixfMxN *)self->_covariance copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v14 = [(CLPLOGENTRYVISIONVLLocalizationDebugInfo *)self->_debugInfo copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((void *)v4 + 5))
  {
    if (!-[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:")) {
      goto LABEL_17;
    }
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4))
  {
    if (!-[CLPLOGENTRYVISIONVLLocation isEqual:](location, "isEqual:")) {
      goto LABEL_17;
    }
  }
  transform = self->_transform;
  if ((unint64_t)transform | *((void *)v4 + 6))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleMxN isEqual:](transform, "isEqual:")) {
      goto LABEL_17;
    }
  }
  covariance = self->_covariance;
  if ((unint64_t)covariance | *((void *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONVLMatrixfMxN isEqual:](covariance, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_confidence != *((float *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  debugInfo = self->_debugInfo;
  if ((unint64_t)debugInfo | *((void *)v4 + 3)) {
    char v10 = -[CLPLOGENTRYVISIONVLLocalizationDebugInfo isEqual:](debugInfo, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp hash];
  unint64_t v4 = [(CLPLOGENTRYVISIONVLLocation *)self->_location hash];
  unint64_t v5 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)self->_transform hash];
  unint64_t v6 = [(CLPLOGENTRYVISIONVLMatrixfMxN *)self->_covariance hash];
  if (*(unsigned char *)&self->_has)
  {
    float confidence = self->_confidence;
    float v9 = -confidence;
    if (confidence >= 0.0) {
      float v9 = self->_confidence;
    }
    float v10 = floorf(v9 + 0.5);
    float v11 = (float)(v9 - v10) * 1.8447e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(CLPLOGENTRYVISIONVLLocalizationDebugInfo *)self->_debugInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timestamp = self->_timestamp;
  uint64_t v6 = *((void *)v4 + 5);
  id v15 = v4;
  if (timestamp)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPLOGENTRYVISIONVLLocalizationResult setTimestamp:](self, "setTimestamp:");
  }
  id v4 = v15;
LABEL_7:
  location = self->_location;
  uint64_t v8 = *((void *)v4 + 4);
  if (location)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPLOGENTRYVISIONVLLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPLOGENTRYVISIONVLLocalizationResult setLocation:](self, "setLocation:");
  }
  id v4 = v15;
LABEL_13:
  transform = self->_transform;
  uint64_t v10 = *((void *)v4 + 6);
  if (transform)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CLPLOGENTRYVISIONSimdDoubleMxN mergeFrom:](transform, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CLPLOGENTRYVISIONVLLocalizationResult setTransform:](self, "setTransform:");
  }
  id v4 = v15;
LABEL_19:
  covariance = self->_covariance;
  uint64_t v12 = *((void *)v4 + 2);
  if (covariance)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[CLPLOGENTRYVISIONVLMatrixfMxN mergeFrom:](covariance, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[CLPLOGENTRYVISIONVLLocalizationResult setCovariance:](self, "setCovariance:");
  }
  id v4 = v15;
LABEL_25:
  if (*((unsigned char *)v4 + 56))
  {
    self->_float confidence = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  debugInfo = self->_debugInfo;
  uint64_t v14 = *((void *)v4 + 3);
  if (debugInfo)
  {
    if (v14) {
      -[CLPLOGENTRYVISIONVLLocalizationDebugInfo mergeFrom:](debugInfo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[CLPLOGENTRYVISIONVLLocalizationResult setDebugInfo:](self, "setDebugInfo:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLOGENTRYVISIONTimeStamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (CLPLOGENTRYVISIONVLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (CLPLOGENTRYVISIONSimdDoubleMxN)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (CLPLOGENTRYVISIONVLMatrixfMxN)covariance
{
  return self->_covariance;
}

- (void)setCovariance:(id)a3
{
}

- (float)confidence
{
  return self->_confidence;
}

- (CLPLOGENTRYVISIONVLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);

  objc_storeStrong((id *)&self->_covariance, 0);
}

@end