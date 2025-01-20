@interface CLPLOGENTRYVISIONVIOEstimation
- (BOOL)hasCameraImageResolution;
- (BOOL)hasCameraIntrinsics;
- (BOOL)hasCameraPose;
- (BOOL)hasInertialCovariance;
- (BOOL)hasInertialCovarianceInfo;
- (BOOL)hasInertialState;
- (BOOL)hasInertialStateInfo;
- (BOOL)hasOriginTimestamp;
- (BOOL)hasTimestamp;
- (BOOL)hasTrackingState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLOGENTRYVISIONCGSize)cameraImageResolution;
- (CLPLOGENTRYVISIONSimdFloatMxN)cameraIntrinsics;
- (CLPLOGENTRYVISIONSimdFloatMxN)cameraPose;
- (CLPLOGENTRYVISIONTimeStamp)originTimestamp;
- (CLPLOGENTRYVISIONTimeStamp)timestamp;
- (CLPLOGENTRYVISIONVIOInertialCovarianceInfo)inertialCovarianceInfo;
- (CLPLOGENTRYVISIONVIOInertialStateInfo)inertialStateInfo;
- (NSData)inertialCovariance;
- (NSData)inertialState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trackingStateAsString:(int)a3;
- (int)StringAsTrackingState:(id)a3;
- (int)trackingState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCameraImageResolution:(id)a3;
- (void)setCameraIntrinsics:(id)a3;
- (void)setCameraPose:(id)a3;
- (void)setHasTrackingState:(BOOL)a3;
- (void)setInertialCovariance:(id)a3;
- (void)setInertialCovarianceInfo:(id)a3;
- (void)setInertialState:(id)a3;
- (void)setInertialStateInfo:(id)a3;
- (void)setOriginTimestamp:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrackingState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVIOEstimation

- (int)trackingState
{
  if (*(unsigned char *)&self->_has) {
    return self->_trackingState;
  }
  else {
    return -1;
  }
}

- (void)setTrackingState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_trackingState = a3;
}

- (void)setHasTrackingState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTrackingState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)trackingStateAsString:(int)a3
{
  if ((a3 + 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6C35F78[a3 + 1];
  }

  return v3;
}

- (int)StringAsTrackingState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VIOTrackingStateUnknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"VIOTrackingStateNominal"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VIOTrackingStateUnacceptable"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VIOTrackingStateUnacceptableDueToFastMotion"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIOTrackingStateUnacceptableDueToLowSceneTexture"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VIOTrackingStateUnacceptableDueToLowLight"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasOriginTimestamp
{
  return self->_originTimestamp != 0;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (BOOL)hasInertialStateInfo
{
  return self->_inertialStateInfo != 0;
}

- (BOOL)hasInertialState
{
  return self->_inertialState != 0;
}

- (BOOL)hasInertialCovarianceInfo
{
  return self->_inertialCovarianceInfo != 0;
}

- (BOOL)hasInertialCovariance
{
  return self->_inertialCovariance != 0;
}

- (BOOL)hasCameraPose
{
  return self->_cameraPose != 0;
}

- (BOOL)hasCameraIntrinsics
{
  return self->_cameraIntrinsics != 0;
}

- (BOOL)hasCameraImageResolution
{
  return self->_cameraImageResolution != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVIOEstimation;
  int v4 = [(CLPLOGENTRYVISIONVIOEstimation *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVIOEstimation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_trackingState + 1;
    if (v4 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_trackingState);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6C35F78[v4];
    }
    [v3 setObject:v5 forKey:@"tracking_state"];
  }
  originTimestamp = self->_originTimestamp;
  if (originTimestamp)
  {
    v7 = [(CLPLOGENTRYVISIONTimeStamp *)originTimestamp dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"origin_timestamp"];
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v9 = [(CLPLOGENTRYVISIONTimeStamp *)timestamp dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"timestamp"];
  }
  inertialStateInfo = self->_inertialStateInfo;
  if (inertialStateInfo)
  {
    v11 = [(CLPLOGENTRYVISIONVIOInertialStateInfo *)inertialStateInfo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"inertial_state_info"];
  }
  inertialState = self->_inertialState;
  if (inertialState) {
    [v3 setObject:inertialState forKey:@"inertial_state"];
  }
  inertialCovarianceInfo = self->_inertialCovarianceInfo;
  if (inertialCovarianceInfo)
  {
    v14 = [(CLPLOGENTRYVISIONVIOInertialCovarianceInfo *)inertialCovarianceInfo dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"inertial_covariance_info"];
  }
  inertialCovariance = self->_inertialCovariance;
  if (inertialCovariance) {
    [v3 setObject:inertialCovariance forKey:@"inertial_covariance"];
  }
  cameraPose = self->_cameraPose;
  if (cameraPose)
  {
    v17 = [(CLPLOGENTRYVISIONSimdFloatMxN *)cameraPose dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"camera_pose"];
  }
  cameraIntrinsics = self->_cameraIntrinsics;
  if (cameraIntrinsics)
  {
    v19 = [(CLPLOGENTRYVISIONSimdFloatMxN *)cameraIntrinsics dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"camera_intrinsics"];
  }
  cameraImageResolution = self->_cameraImageResolution;
  if (cameraImageResolution)
  {
    v21 = [(CLPLOGENTRYVISIONCGSize *)cameraImageResolution dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"camera_image_resolution"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVIOEstimationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_originTimestamp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_inertialStateInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_inertialState)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_inertialCovarianceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_inertialCovariance)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_cameraPose)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_cameraIntrinsics)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_cameraImageResolution)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[20] = self->_trackingState;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  id v5 = v4;
  if (self->_originTimestamp)
  {
    objc_msgSend(v4, "setOriginTimestamp:");
    id v4 = v5;
  }
  if (self->_timestamp)
  {
    objc_msgSend(v5, "setTimestamp:");
    id v4 = v5;
  }
  if (self->_inertialStateInfo)
  {
    objc_msgSend(v5, "setInertialStateInfo:");
    id v4 = v5;
  }
  if (self->_inertialState)
  {
    objc_msgSend(v5, "setInertialState:");
    id v4 = v5;
  }
  if (self->_inertialCovarianceInfo)
  {
    objc_msgSend(v5, "setInertialCovarianceInfo:");
    id v4 = v5;
  }
  if (self->_inertialCovariance)
  {
    objc_msgSend(v5, "setInertialCovariance:");
    id v4 = v5;
  }
  if (self->_cameraPose)
  {
    objc_msgSend(v5, "setCameraPose:");
    id v4 = v5;
  }
  if (self->_cameraIntrinsics)
  {
    objc_msgSend(v5, "setCameraIntrinsics:");
    id v4 = v5;
  }
  if (self->_cameraImageResolution)
  {
    objc_msgSend(v5, "setCameraImageResolution:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 80) = self->_trackingState;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  id v7 = [(CLPLOGENTRYVISIONTimeStamp *)self->_originTimestamp copyWithZone:a3];
  objc_super v8 = (void *)v6[8];
  v6[8] = v7;

  id v9 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp copyWithZone:a3];
  v10 = (void *)v6[9];
  v6[9] = v9;

  id v11 = [(CLPLOGENTRYVISIONVIOInertialStateInfo *)self->_inertialStateInfo copyWithZone:a3];
  v12 = (void *)v6[7];
  v6[7] = v11;

  uint64_t v13 = [(NSData *)self->_inertialState copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(CLPLOGENTRYVISIONVIOInertialCovarianceInfo *)self->_inertialCovarianceInfo copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  uint64_t v17 = [(NSData *)self->_inertialCovariance copyWithZone:a3];
  v18 = (void *)v6[4];
  v6[4] = v17;

  id v19 = [(CLPLOGENTRYVISIONSimdFloatMxN *)self->_cameraPose copyWithZone:a3];
  v20 = (void *)v6[3];
  v6[3] = v19;

  id v21 = [(CLPLOGENTRYVISIONSimdFloatMxN *)self->_cameraIntrinsics copyWithZone:a3];
  v22 = (void *)v6[2];
  v6[2] = v21;

  id v23 = [(CLPLOGENTRYVISIONCGSize *)self->_cameraImageResolution copyWithZone:a3];
  v24 = (void *)v6[1];
  v6[1] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_trackingState != *((_DWORD *)v4 + 20)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
LABEL_25:
    char v14 = 0;
    goto LABEL_26;
  }
  originTimestamp = self->_originTimestamp;
  if ((unint64_t)originTimestamp | *((void *)v4 + 8)
    && !-[CLPLOGENTRYVISIONTimeStamp isEqual:](originTimestamp, "isEqual:"))
  {
    goto LABEL_25;
  }
  timestamp = self->_timestamp;
  if ((unint64_t)timestamp | *((void *)v4 + 9))
  {
    if (!-[CLPLOGENTRYVISIONTimeStamp isEqual:](timestamp, "isEqual:")) {
      goto LABEL_25;
    }
  }
  inertialStateInfo = self->_inertialStateInfo;
  if ((unint64_t)inertialStateInfo | *((void *)v4 + 7))
  {
    if (!-[CLPLOGENTRYVISIONVIOInertialStateInfo isEqual:](inertialStateInfo, "isEqual:")) {
      goto LABEL_25;
    }
  }
  inertialState = self->_inertialState;
  if ((unint64_t)inertialState | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](inertialState, "isEqual:")) {
      goto LABEL_25;
    }
  }
  inertialCovarianceInfo = self->_inertialCovarianceInfo;
  if ((unint64_t)inertialCovarianceInfo | *((void *)v4 + 5))
  {
    if (!-[CLPLOGENTRYVISIONVIOInertialCovarianceInfo isEqual:](inertialCovarianceInfo, "isEqual:")) {
      goto LABEL_25;
    }
  }
  inertialCovariance = self->_inertialCovariance;
  if ((unint64_t)inertialCovariance | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](inertialCovariance, "isEqual:")) {
      goto LABEL_25;
    }
  }
  cameraPose = self->_cameraPose;
  if ((unint64_t)cameraPose | *((void *)v4 + 3))
  {
    if (!-[CLPLOGENTRYVISIONSimdFloatMxN isEqual:](cameraPose, "isEqual:")) {
      goto LABEL_25;
    }
  }
  cameraIntrinsics = self->_cameraIntrinsics;
  if ((unint64_t)cameraIntrinsics | *((void *)v4 + 2))
  {
    if (!-[CLPLOGENTRYVISIONSimdFloatMxN isEqual:](cameraIntrinsics, "isEqual:")) {
      goto LABEL_25;
    }
  }
  cameraImageResolution = self->_cameraImageResolution;
  if ((unint64_t)cameraImageResolution | *((void *)v4 + 1)) {
    char v14 = -[CLPLOGENTRYVISIONCGSize isEqual:](cameraImageResolution, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_trackingState;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(CLPLOGENTRYVISIONTimeStamp *)self->_originTimestamp hash] ^ v3;
  unint64_t v5 = [(CLPLOGENTRYVISIONTimeStamp *)self->_timestamp hash];
  unint64_t v6 = v4 ^ v5 ^ [(CLPLOGENTRYVISIONVIOInertialStateInfo *)self->_inertialStateInfo hash];
  uint64_t v7 = [(NSData *)self->_inertialState hash];
  unint64_t v8 = v7 ^ [(CLPLOGENTRYVISIONVIOInertialCovarianceInfo *)self->_inertialCovarianceInfo hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSData *)self->_inertialCovariance hash];
  unint64_t v10 = [(CLPLOGENTRYVISIONSimdFloatMxN *)self->_cameraPose hash];
  unint64_t v11 = v10 ^ [(CLPLOGENTRYVISIONSimdFloatMxN *)self->_cameraIntrinsics hash];
  return v9 ^ v11 ^ [(CLPLOGENTRYVISIONCGSize *)self->_cameraImageResolution hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 84))
  {
    self->_trackingState = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 1u;
  }
  originTimestamp = self->_originTimestamp;
  uint64_t v7 = v5[8];
  v20 = v5;
  if (originTimestamp)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](originTimestamp, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[CLPLOGENTRYVISIONVIOEstimation setOriginTimestamp:](self, "setOriginTimestamp:");
  }
  unint64_t v5 = v20;
LABEL_9:
  timestamp = self->_timestamp;
  uint64_t v9 = v5[9];
  if (timestamp)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[CLPLOGENTRYVISIONTimeStamp mergeFrom:](timestamp, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[CLPLOGENTRYVISIONVIOEstimation setTimestamp:](self, "setTimestamp:");
  }
  unint64_t v5 = v20;
LABEL_15:
  inertialStateInfo = self->_inertialStateInfo;
  uint64_t v11 = v5[7];
  if (inertialStateInfo)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[CLPLOGENTRYVISIONVIOInertialStateInfo mergeFrom:](inertialStateInfo, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[CLPLOGENTRYVISIONVIOEstimation setInertialStateInfo:](self, "setInertialStateInfo:");
  }
  unint64_t v5 = v20;
LABEL_21:
  if (v5[6])
  {
    -[CLPLOGENTRYVISIONVIOEstimation setInertialState:](self, "setInertialState:");
    unint64_t v5 = v20;
  }
  inertialCovarianceInfo = self->_inertialCovarianceInfo;
  uint64_t v13 = v5[5];
  if (inertialCovarianceInfo)
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo mergeFrom:](inertialCovarianceInfo, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[CLPLOGENTRYVISIONVIOEstimation setInertialCovarianceInfo:](self, "setInertialCovarianceInfo:");
  }
  unint64_t v5 = v20;
LABEL_29:
  if (v5[4])
  {
    -[CLPLOGENTRYVISIONVIOEstimation setInertialCovariance:](self, "setInertialCovariance:");
    unint64_t v5 = v20;
  }
  cameraPose = self->_cameraPose;
  uint64_t v15 = v5[3];
  if (cameraPose)
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[CLPLOGENTRYVISIONSimdFloatMxN mergeFrom:](cameraPose, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_37;
    }
    -[CLPLOGENTRYVISIONVIOEstimation setCameraPose:](self, "setCameraPose:");
  }
  unint64_t v5 = v20;
LABEL_37:
  cameraIntrinsics = self->_cameraIntrinsics;
  uint64_t v17 = v5[2];
  if (cameraIntrinsics)
  {
    if (!v17) {
      goto LABEL_43;
    }
    -[CLPLOGENTRYVISIONSimdFloatMxN mergeFrom:](cameraIntrinsics, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_43;
    }
    -[CLPLOGENTRYVISIONVIOEstimation setCameraIntrinsics:](self, "setCameraIntrinsics:");
  }
  unint64_t v5 = v20;
LABEL_43:
  cameraImageResolution = self->_cameraImageResolution;
  uint64_t v19 = v5[1];
  if (cameraImageResolution)
  {
    if (v19) {
      -[CLPLOGENTRYVISIONCGSize mergeFrom:](cameraImageResolution, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[CLPLOGENTRYVISIONVIOEstimation setCameraImageResolution:](self, "setCameraImageResolution:");
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLOGENTRYVISIONTimeStamp)originTimestamp
{
  return self->_originTimestamp;
}

- (void)setOriginTimestamp:(id)a3
{
}

- (CLPLOGENTRYVISIONTimeStamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (CLPLOGENTRYVISIONVIOInertialStateInfo)inertialStateInfo
{
  return self->_inertialStateInfo;
}

- (void)setInertialStateInfo:(id)a3
{
}

- (NSData)inertialState
{
  return self->_inertialState;
}

- (void)setInertialState:(id)a3
{
}

- (CLPLOGENTRYVISIONVIOInertialCovarianceInfo)inertialCovarianceInfo
{
  return self->_inertialCovarianceInfo;
}

- (void)setInertialCovarianceInfo:(id)a3
{
}

- (NSData)inertialCovariance
{
  return self->_inertialCovariance;
}

- (void)setInertialCovariance:(id)a3
{
}

- (CLPLOGENTRYVISIONSimdFloatMxN)cameraPose
{
  return self->_cameraPose;
}

- (void)setCameraPose:(id)a3
{
}

- (CLPLOGENTRYVISIONSimdFloatMxN)cameraIntrinsics
{
  return self->_cameraIntrinsics;
}

- (void)setCameraIntrinsics:(id)a3
{
}

- (CLPLOGENTRYVISIONCGSize)cameraImageResolution
{
  return self->_cameraImageResolution;
}

- (void)setCameraImageResolution:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_originTimestamp, 0);
  objc_storeStrong((id *)&self->_inertialStateInfo, 0);
  objc_storeStrong((id *)&self->_inertialState, 0);
  objc_storeStrong((id *)&self->_inertialCovarianceInfo, 0);
  objc_storeStrong((id *)&self->_inertialCovariance, 0);
  objc_storeStrong((id *)&self->_cameraPose, 0);
  objc_storeStrong((id *)&self->_cameraIntrinsics, 0);

  objc_storeStrong((id *)&self->_cameraImageResolution, 0);
}

@end