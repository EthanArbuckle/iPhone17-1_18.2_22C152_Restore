@interface CLPLOGENTRYVISIONVIOInertialCovarianceInfo
- (BOOL)hasAccelBiasCovOffset;
- (BOOL)hasAccelBiasDof;
- (BOOL)hasCovarianceSize;
- (BOOL)hasCovarianceSizeInBytes;
- (BOOL)hasGyroBiasCovOffset;
- (BOOL)hasGyroBiasDof;
- (BOOL)hasOrientationCovOffset;
- (BOOL)hasOrientationDof;
- (BOOL)hasPositionCovOffset;
- (BOOL)hasPositionDof;
- (BOOL)hasVelocityCovOffset;
- (BOOL)hasVelocityDof;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)covarianceSizeInBytes;
- (unint64_t)hash;
- (unsigned)accelBiasCovOffset;
- (unsigned)accelBiasDof;
- (unsigned)covarianceSize;
- (unsigned)gyroBiasCovOffset;
- (unsigned)gyroBiasDof;
- (unsigned)orientationCovOffset;
- (unsigned)orientationDof;
- (unsigned)positionCovOffset;
- (unsigned)positionDof;
- (unsigned)velocityCovOffset;
- (unsigned)velocityDof;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccelBiasCovOffset:(unsigned int)a3;
- (void)setAccelBiasDof:(unsigned int)a3;
- (void)setCovarianceSize:(unsigned int)a3;
- (void)setCovarianceSizeInBytes:(unint64_t)a3;
- (void)setGyroBiasCovOffset:(unsigned int)a3;
- (void)setGyroBiasDof:(unsigned int)a3;
- (void)setHasAccelBiasCovOffset:(BOOL)a3;
- (void)setHasAccelBiasDof:(BOOL)a3;
- (void)setHasCovarianceSize:(BOOL)a3;
- (void)setHasCovarianceSizeInBytes:(BOOL)a3;
- (void)setHasGyroBiasCovOffset:(BOOL)a3;
- (void)setHasGyroBiasDof:(BOOL)a3;
- (void)setHasOrientationCovOffset:(BOOL)a3;
- (void)setHasOrientationDof:(BOOL)a3;
- (void)setHasPositionCovOffset:(BOOL)a3;
- (void)setHasPositionDof:(BOOL)a3;
- (void)setHasVelocityCovOffset:(BOOL)a3;
- (void)setHasVelocityDof:(BOOL)a3;
- (void)setOrientationCovOffset:(unsigned int)a3;
- (void)setOrientationDof:(unsigned int)a3;
- (void)setPositionCovOffset:(unsigned int)a3;
- (void)setPositionDof:(unsigned int)a3;
- (void)setVelocityCovOffset:(unsigned int)a3;
- (void)setVelocityDof:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVIOInertialCovarianceInfo

- (void)setCovarianceSizeInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_covarianceSizeInBytes = a3;
}

- (void)setHasCovarianceSizeInBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCovarianceSizeInBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCovarianceSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_covarianceSize = a3;
}

- (void)setHasCovarianceSize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCovarianceSize
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOrientationCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_orientationCovOffset = a3;
}

- (void)setHasOrientationCovOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOrientationCovOffset
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOrientationDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_orientationDof = a3;
}

- (void)setHasOrientationDof:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOrientationDof
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGyroBiasCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gyroBiasCovOffset = a3;
}

- (void)setHasGyroBiasCovOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGyroBiasCovOffset
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGyroBiasDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gyroBiasDof = a3;
}

- (void)setHasGyroBiasDof:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGyroBiasDof
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setVelocityCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_velocityCovOffset = a3;
}

- (void)setHasVelocityCovOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVelocityCovOffset
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setVelocityDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_velocityDof = a3;
}

- (void)setHasVelocityDof:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVelocityDof
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAccelBiasCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accelBiasCovOffset = a3;
}

- (void)setHasAccelBiasCovOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccelBiasCovOffset
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAccelBiasDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_accelBiasDof = a3;
}

- (void)setHasAccelBiasDof:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAccelBiasDof
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPositionCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_positionCovOffset = a3;
}

- (void)setHasPositionCovOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPositionCovOffset
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPositionDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_positionDof = a3;
}

- (void)setHasPositionDof:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPositionDof
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVIOInertialCovarianceInfo;
  v4 = [(CLPLOGENTRYVISIONVIOInertialCovarianceInfo *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVIOInertialCovarianceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_covarianceSizeInBytes];
    [v3 setObject:v7 forKey:@"covariance_size_in_bytes"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_covarianceSize];
  [v3 setObject:v8 forKey:@"covariance_size"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v9 = [NSNumber numberWithUnsignedInt:self->_orientationCovOffset];
  [v3 setObject:v9 forKey:@"orientation_cov_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = [NSNumber numberWithUnsignedInt:self->_orientationDof];
  [v3 setObject:v10 forKey:@"orientation_dof"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = [NSNumber numberWithUnsignedInt:self->_gyroBiasCovOffset];
  [v3 setObject:v11 forKey:@"gyro_bias_cov_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithUnsignedInt:self->_gyroBiasDof];
  [v3 setObject:v12 forKey:@"gyro_bias_dof"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = [NSNumber numberWithUnsignedInt:self->_velocityCovOffset];
  [v3 setObject:v13 forKey:@"velocity_cov_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = [NSNumber numberWithUnsignedInt:self->_velocityDof];
  [v3 setObject:v14 forKey:@"velocity_dof"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = [NSNumber numberWithUnsignedInt:self->_accelBiasCovOffset];
  [v3 setObject:v15 forKey:@"accel_bias_cov_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = [NSNumber numberWithUnsignedInt:self->_accelBiasDof];
  [v3 setObject:v16 forKey:@"accel_bias_dof"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  v17 = [NSNumber numberWithUnsignedInt:self->_positionCovOffset];
  [v3 setObject:v17 forKey:@"position_cov_offset"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_13:
    v5 = [NSNumber numberWithUnsignedInt:self->_positionDof];
    [v3 setObject:v5 forKey:@"position_dof"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVIOInertialCovarianceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_covarianceSizeInBytes;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_covarianceSize;
  *((_WORD *)v4 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 9) = self->_orientationCovOffset;
  *((_WORD *)v4 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 10) = self->_orientationDof;
  *((_WORD *)v4 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 7) = self->_gyroBiasCovOffset;
  *((_WORD *)v4 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 8) = self->_gyroBiasDof;
  *((_WORD *)v4 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 13) = self->_velocityCovOffset;
  *((_WORD *)v4 + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 14) = self->_velocityDof;
  *((_WORD *)v4 + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 4) = self->_accelBiasCovOffset;
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 5) = self->_accelBiasDof;
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((_DWORD *)v4 + 11) = self->_positionCovOffset;
  *((_WORD *)v4 + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 12) = self->_positionDof;
    *((_WORD *)v4 + 30) |= 0x200u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_covarianceSizeInBytes;
    *((_WORD *)result + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_covarianceSize;
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_orientationCovOffset;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 10) = self->_orientationDof;
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_gyroBiasCovOffset;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = self->_gyroBiasDof;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 13) = self->_velocityCovOffset;
  *((_WORD *)result + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_velocityDof;
  *((_WORD *)result + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 4) = self->_accelBiasCovOffset;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 5) = self->_accelBiasDof;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_positionCovOffset;
  *((_WORD *)result + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return result;
  }
LABEL_13:
  *((_DWORD *)result + 12) = self->_positionDof;
  *((_WORD *)result + 30) |= 0x200u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_covarianceSizeInBytes != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
LABEL_62:
    BOOL v7 = 0;
    goto LABEL_63;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_covarianceSize != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_orientationCovOffset != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_orientationDof != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gyroBiasCovOffset != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_gyroBiasDof != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_velocityCovOffset != *((_DWORD *)v4 + 13)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_velocityDof != *((_DWORD *)v4 + 14)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accelBiasCovOffset != *((_DWORD *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_accelBiasDof != *((_DWORD *)v4 + 5)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_positionCovOffset != *((_DWORD *)v4 + 11)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_positionDof != *((_DWORD *)v4 + 12)) {
      goto LABEL_62;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x200) == 0;
  }
LABEL_63:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_covarianceSizeInBytes;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_covarianceSize;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_orientationCovOffset;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_orientationDof;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_gyroBiasCovOffset;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_gyroBiasDof;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_velocityCovOffset;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_velocityDof;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_accelBiasCovOffset;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_accelBiasDof;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_positionCovOffset;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_positionDof;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_covarianceSizeInBytes = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_covarianceSize = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_orientationCovOffset = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_orientationDof = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_gyroBiasCovOffset = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_gyroBiasDof = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_velocityCovOffset = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_velocityDof = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_accelBiasCovOffset = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_accelBiasDof = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_positionCovOffset = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
LABEL_13:
    self->_positionDof = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_14:
}

- (unint64_t)covarianceSizeInBytes
{
  return self->_covarianceSizeInBytes;
}

- (unsigned)covarianceSize
{
  return self->_covarianceSize;
}

- (unsigned)orientationCovOffset
{
  return self->_orientationCovOffset;
}

- (unsigned)orientationDof
{
  return self->_orientationDof;
}

- (unsigned)gyroBiasCovOffset
{
  return self->_gyroBiasCovOffset;
}

- (unsigned)gyroBiasDof
{
  return self->_gyroBiasDof;
}

- (unsigned)velocityCovOffset
{
  return self->_velocityCovOffset;
}

- (unsigned)velocityDof
{
  return self->_velocityDof;
}

- (unsigned)accelBiasCovOffset
{
  return self->_accelBiasCovOffset;
}

- (unsigned)accelBiasDof
{
  return self->_accelBiasDof;
}

- (unsigned)positionCovOffset
{
  return self->_positionCovOffset;
}

- (unsigned)positionDof
{
  return self->_positionDof;
}

@end