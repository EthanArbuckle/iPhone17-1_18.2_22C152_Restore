@interface CLPLOGENTRYVISIONLSLHeading
- (BOOL)hasConfidence;
- (BOOL)hasGlobalReferenceFrame;
- (BOOL)hasLocation;
- (BOOL)hasRotationFromGlobalToCameraFrame;
- (BOOL)hasRotationFromGlobalToDeviceFrame;
- (BOOL)hasRotationalAccuracyInRadians;
- (BOOL)hasSupplemantaryInfo;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONLSLHeadingSupplInfo)supplemantaryInfo;
- (CLPLOGENTRYVISIONLSLLocation)location;
- (CLPLOGENTRYVISIONSimdDoubleM)rotationalAccuracyInRadians;
- (CLPLOGENTRYVISIONSimdDoubleMxN)rotationFromGlobalToCameraFrame;
- (CLPLOGENTRYVISIONSimdDoubleMxN)rotationFromGlobalToDeviceFrame;
- (CLPLOGENTRYVISIONTimeStamp)timestamp;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)globalReferenceFrameAsString:(int)a3;
- (int)StringAsGlobalReferenceFrame:(id)a3;
- (int)globalReferenceFrame;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setGlobalReferenceFrame:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasGlobalReferenceFrame:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setRotationFromGlobalToCameraFrame:(id)a3;
- (void)setRotationFromGlobalToDeviceFrame:(id)a3;
- (void)setRotationalAccuracyInRadians:(id)a3;
- (void)setSupplemantaryInfo:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONLSLHeading

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasRotationFromGlobalToDeviceFrame
{
  return self->_rotationFromGlobalToDeviceFrame != 0;
}

- (BOOL)hasRotationFromGlobalToCameraFrame
{
  return self->_rotationFromGlobalToCameraFrame != 0;
}

- (BOOL)hasRotationalAccuracyInRadians
{
  return self->_rotationalAccuracyInRadians != 0;
}

- (void)setConfidence:(double)a3
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

- (int)globalReferenceFrame
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_globalReferenceFrame;
  }
  else {
    return -1;
  }
}

- (void)setGlobalReferenceFrame:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_globalReferenceFrame = a3;
}

- (void)setHasGlobalReferenceFrame:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGlobalReferenceFrame
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)globalReferenceFrameAsString:(int)a3
{
  if ((a3 + 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C35EE0[a3 + 1];
  }

  return v3;
}

- (int)StringAsGlobalReferenceFrame:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LSLGlobalReferenceFrameUnknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"LSLGlobalReferenceFrameNWU"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LSLGlobalReferenceFrameENU"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LSLGlobalReferenceFrameECEF"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasSupplemantaryInfo
{
  return self->_supplemantaryInfo != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONLSLHeading;
  int v4 = [(CLPLOGENTRYVISIONLSLHeading *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONLSLHeading *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v5 = [(CLPLOGENTRYVISIONTimeStamp *)timestamp dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
  rotationFromGlobalToDeviceFrame = self->_rotationFromGlobalToDeviceFrame;
  if (rotationFromGlobalToDeviceFrame)
  {
    v7 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)rotationFromGlobalToDeviceFrame dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"rotation_from_global_to_device_frame"];
  }
  rotationFromGlobalToCameraFrame = self->_rotationFromGlobalToCameraFrame;
  if (rotationFromGlobalToCameraFrame)
  {
    v9 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)rotationFromGlobalToCameraFrame dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"rotation_from_global_to_camera_frame"];
  }
  rotationalAccuracyInRadians = self->_rotationalAccuracyInRadians;
  if (rotationalAccuracyInRadians)
  {
    v11 = [(CLPLOGENTRYVISIONSimdDoubleM *)rotationalAccuracyInRadians dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"rotational_accuracy_in_radians"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v13 forKey:@"confidence"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v14 = self->_globalReferenceFrame + 1;
    if (v14 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_globalReferenceFrame);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E6C35EE0[v14];
    }
    [v3 setObject:v15 forKey:@"global_reference_frame"];
  }
  location = self->_location;
  if (location)
  {
    v17 = [(CLPLOGENTRYVISIONLSLLocation *)location dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"location"];
  }
  supplemantaryInfo = self->_supplemantaryInfo;
  if (supplemantaryInfo)
  {
    v19 = [(CLPLOGENTRYVISIONLSLHeadingSupplInfo *)supplemantaryInfo dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"supplemantary_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONLSLHeadingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_rotationFromGlobalToDeviceFrame)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_rotationFromGlobalToCameraFrame)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_rotationalAccuracyInRadians)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_supplemantaryInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_timestamp)
  {
    objc_msgSend(v4, "setTimestamp:");
    id v4 = v6;
  }
  if (self->_rotationFromGlobalToDeviceFrame)
  {
    objc_msgSend(v6, "setRotationFromGlobalToDeviceFrame:");
    id v4 = v6;
  }
  if (self->_rotationFromGlobalToCameraFrame)
  {
    objc_msgSend(v6, "setRotationFromGlobalToCameraFrame:");
    id v4 = v6;
  }
  if (self->_rotationalAccuracyInRadians)
  {
    objc_msgSend(v6, "setRotationalAccuracyInRadians:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_globalReferenceFrame;
    *((unsigned char *)v4 + 72) |= 2u;
  }
  if (self->_location)
  {
    objc_msgSend(v6, "setLocation:");
    id v4 = v6;
  }
  if (self->_supplemantaryInfo)
  {
    objc_msgSend(v6, "setSupplemantaryInfo:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp copyWithZone:a3];
  v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  id v8 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)self->_rotationFromGlobalToDeviceFrame copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)self->_rotationFromGlobalToCameraFrame copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  id v12 = [(CLPLOGENTRYVISIONSimdDoubleM *)self->_rotationalAccuracyInRadians copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 72) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_globalReferenceFrame;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  id v15 = [(CLPLOGENTRYVISIONLSLLocation *)self->_location copyWithZone:a3];
  v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  id v17 = [(CLPLOGENTRYVISIONLSLHeadingSupplInfo *)self->_supplemantaryInfo copyWithZone:a3];
  v18 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((void *)v4 + 8))
  {
    if (!-[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:")) {
      goto LABEL_24;
    }
  }
  rotationFromGlobalToDeviceFrame = self->_rotationFromGlobalToDeviceFrame;
  if ((unint64_t)rotationFromGlobalToDeviceFrame | *((void *)v4 + 5))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleMxN isEqual:](rotationFromGlobalToDeviceFrame, "isEqual:")) {
      goto LABEL_24;
    }
  }
  rotationFromGlobalToCameraFrame = self->_rotationFromGlobalToCameraFrame;
  if ((unint64_t)rotationFromGlobalToCameraFrame | *((void *)v4 + 4))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleMxN isEqual:](rotationFromGlobalToCameraFrame, "isEqual:")) {
      goto LABEL_24;
    }
  }
  rotationalAccuracyInRadians = self->_rotationalAccuracyInRadians;
  if ((unint64_t)rotationalAccuracyInRadians | *((void *)v4 + 6))
  {
    if (!-[CLPLOGENTRYVISIONSimdDoubleM isEqual:](rotationalAccuracyInRadians, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_24:
    char v11 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_globalReferenceFrame != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_24;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 3)
    && !-[CLPLOGENTRYVISIONLSLLocation isEqual:](location, "isEqual:"))
  {
    goto LABEL_24;
  }
  supplemantaryInfo = self->_supplemantaryInfo;
  if ((unint64_t)supplemantaryInfo | *((void *)v4 + 7)) {
    char v11 = -[CLPLOGENTRYVISIONLSLHeadingSupplInfo isEqual:](supplemantaryInfo, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp hash];
  unint64_t v4 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)self->_rotationFromGlobalToDeviceFrame hash];
  unint64_t v5 = [(CLPLOGENTRYVISIONSimdDoubleMxN *)self->_rotationFromGlobalToCameraFrame hash];
  unint64_t v6 = [(CLPLOGENTRYVISIONSimdDoubleM *)self->_rotationalAccuracyInRadians hash];
  char has = (char)self->_has;
  if (has)
  {
    double confidence = self->_confidence;
    double v10 = -confidence;
    if (confidence >= 0.0) {
      double v10 = self->_confidence;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_globalReferenceFrame;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v15 = v8 ^ v13 ^ [(CLPLOGENTRYVISIONLSLLocation *)self->_location hash];
  return v14 ^ v15 ^ [(CLPLOGENTRYVISIONLSLHeadingSupplInfo *)self->_supplemantaryInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timestamp = self->_timestamp;
  uint64_t v6 = *((void *)v4 + 8);
  id v18 = v4;
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
    -[CLPLOGENTRYVISIONLSLHeading setTimestamp:](self, "setTimestamp:");
  }
  id v4 = v18;
LABEL_7:
  rotationFromGlobalToDeviceFrame = self->_rotationFromGlobalToDeviceFrame;
  uint64_t v8 = *((void *)v4 + 5);
  if (rotationFromGlobalToDeviceFrame)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPLOGENTRYVISIONSimdDoubleMxN mergeFrom:](rotationFromGlobalToDeviceFrame, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[CLPLOGENTRYVISIONLSLHeading setRotationFromGlobalToDeviceFrame:](self, "setRotationFromGlobalToDeviceFrame:");
  }
  id v4 = v18;
LABEL_13:
  rotationFromGlobalToCameraFrame = self->_rotationFromGlobalToCameraFrame;
  uint64_t v10 = *((void *)v4 + 4);
  if (rotationFromGlobalToCameraFrame)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CLPLOGENTRYVISIONSimdDoubleMxN mergeFrom:](rotationFromGlobalToCameraFrame, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[CLPLOGENTRYVISIONLSLHeading setRotationFromGlobalToCameraFrame:](self, "setRotationFromGlobalToCameraFrame:");
  }
  id v4 = v18;
LABEL_19:
  rotationalAccuracyInRadians = self->_rotationalAccuracyInRadians;
  uint64_t v12 = *((void *)v4 + 6);
  if (rotationalAccuracyInRadians)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[CLPLOGENTRYVISIONSimdDoubleM mergeFrom:](rotationalAccuracyInRadians, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[CLPLOGENTRYVISIONLSLHeading setRotationalAccuracyInRadians:](self, "setRotationalAccuracyInRadians:");
  }
  id v4 = v18;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 72);
  if (v13)
  {
    self->_double confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v13 = *((unsigned char *)v4 + 72);
  }
  if ((v13 & 2) != 0)
  {
    self->_globalReferenceFrame = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
  location = self->_location;
  uint64_t v15 = *((void *)v4 + 3);
  if (location)
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[CLPLOGENTRYVISIONLSLLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[CLPLOGENTRYVISIONLSLHeading setLocation:](self, "setLocation:");
  }
  id v4 = v18;
LABEL_35:
  supplemantaryInfo = self->_supplemantaryInfo;
  uint64_t v17 = *((void *)v4 + 7);
  if (supplemantaryInfo)
  {
    if (v17) {
      -[CLPLOGENTRYVISIONLSLHeadingSupplInfo mergeFrom:](supplemantaryInfo, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[CLPLOGENTRYVISIONLSLHeading setSupplemantaryInfo:](self, "setSupplemantaryInfo:");
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

- (CLPLOGENTRYVISIONSimdDoubleMxN)rotationFromGlobalToDeviceFrame
{
  return self->_rotationFromGlobalToDeviceFrame;
}

- (void)setRotationFromGlobalToDeviceFrame:(id)a3
{
}

- (CLPLOGENTRYVISIONSimdDoubleMxN)rotationFromGlobalToCameraFrame
{
  return self->_rotationFromGlobalToCameraFrame;
}

- (void)setRotationFromGlobalToCameraFrame:(id)a3
{
}

- (CLPLOGENTRYVISIONSimdDoubleM)rotationalAccuracyInRadians
{
  return self->_rotationalAccuracyInRadians;
}

- (void)setRotationalAccuracyInRadians:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (CLPLOGENTRYVISIONLSLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (CLPLOGENTRYVISIONLSLHeadingSupplInfo)supplemantaryInfo
{
  return self->_supplemantaryInfo;
}

- (void)setSupplemantaryInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_supplemantaryInfo, 0);
  objc_storeStrong((id *)&self->_rotationalAccuracyInRadians, 0);
  objc_storeStrong((id *)&self->_rotationFromGlobalToDeviceFrame, 0);
  objc_storeStrong((id *)&self->_rotationFromGlobalToCameraFrame, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end