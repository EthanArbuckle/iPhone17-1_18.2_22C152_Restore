@interface CLPLOGENTRYVISIONVIOInertialStateInfo
- (BOOL)hasAccelBiasLength;
- (BOOL)hasAccelBiasOffset;
- (BOOL)hasGyroBiasLength;
- (BOOL)hasGyroBiasOffset;
- (BOOL)hasOrientationLength;
- (BOOL)hasOrientationOffset;
- (BOOL)hasPositionLength;
- (BOOL)hasPositionOffset;
- (BOOL)hasStateLength;
- (BOOL)hasStateLengthInBytes;
- (BOOL)hasVelocityLength;
- (BOOL)hasVelocityOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)stateLengthInBytes;
- (unsigned)accelBiasLength;
- (unsigned)accelBiasOffset;
- (unsigned)gyroBiasLength;
- (unsigned)gyroBiasOffset;
- (unsigned)orientationLength;
- (unsigned)orientationOffset;
- (unsigned)positionLength;
- (unsigned)positionOffset;
- (unsigned)stateLength;
- (unsigned)velocityLength;
- (unsigned)velocityOffset;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccelBiasLength:(unsigned int)a3;
- (void)setAccelBiasOffset:(unsigned int)a3;
- (void)setGyroBiasLength:(unsigned int)a3;
- (void)setGyroBiasOffset:(unsigned int)a3;
- (void)setHasAccelBiasLength:(BOOL)a3;
- (void)setHasAccelBiasOffset:(BOOL)a3;
- (void)setHasGyroBiasLength:(BOOL)a3;
- (void)setHasGyroBiasOffset:(BOOL)a3;
- (void)setHasOrientationLength:(BOOL)a3;
- (void)setHasOrientationOffset:(BOOL)a3;
- (void)setHasPositionLength:(BOOL)a3;
- (void)setHasPositionOffset:(BOOL)a3;
- (void)setHasStateLength:(BOOL)a3;
- (void)setHasStateLengthInBytes:(BOOL)a3;
- (void)setHasVelocityLength:(BOOL)a3;
- (void)setHasVelocityOffset:(BOOL)a3;
- (void)setOrientationLength:(unsigned int)a3;
- (void)setOrientationOffset:(unsigned int)a3;
- (void)setPositionLength:(unsigned int)a3;
- (void)setPositionOffset:(unsigned int)a3;
- (void)setStateLength:(unsigned int)a3;
- (void)setStateLengthInBytes:(unint64_t)a3;
- (void)setVelocityLength:(unsigned int)a3;
- (void)setVelocityOffset:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVIOInertialStateInfo

- (void)setStateLengthInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_stateLengthInBytes = a3;
}

- (void)setHasStateLengthInBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasStateLengthInBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStateLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_stateLength = a3;
}

- (void)setHasStateLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasStateLength
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setOrientationOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_orientationOffset = a3;
}

- (void)setHasOrientationOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOrientationOffset
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOrientationLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_orientationLength = a3;
}

- (void)setHasOrientationLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOrientationLength
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setGyroBiasOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gyroBiasOffset = a3;
}

- (void)setHasGyroBiasOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGyroBiasOffset
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGyroBiasLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_gyroBiasLength = a3;
}

- (void)setHasGyroBiasLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGyroBiasLength
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setVelocityOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_velocityOffset = a3;
}

- (void)setHasVelocityOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVelocityOffset
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setVelocityLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_velocityLength = a3;
}

- (void)setHasVelocityLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVelocityLength
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAccelBiasOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_accelBiasOffset = a3;
}

- (void)setHasAccelBiasOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAccelBiasOffset
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAccelBiasLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accelBiasLength = a3;
}

- (void)setHasAccelBiasLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccelBiasLength
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPositionOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_positionOffset = a3;
}

- (void)setHasPositionOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPositionOffset
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPositionLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_positionLength = a3;
}

- (void)setHasPositionLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPositionLength
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVIOInertialStateInfo;
  v4 = [(CLPLOGENTRYVISIONVIOInertialStateInfo *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVIOInertialStateInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_stateLengthInBytes];
    [v3 setObject:v7 forKey:@"state_length_in_bytes"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_stateLength];
  [v3 setObject:v8 forKey:@"state_length"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v9 = [NSNumber numberWithUnsignedInt:self->_orientationOffset];
  [v3 setObject:v9 forKey:@"orientation_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = [NSNumber numberWithUnsignedInt:self->_orientationLength];
  [v3 setObject:v10 forKey:@"orientation_length"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = [NSNumber numberWithUnsignedInt:self->_gyroBiasOffset];
  [v3 setObject:v11 forKey:@"gyro_bias_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithUnsignedInt:self->_gyroBiasLength];
  [v3 setObject:v12 forKey:@"gyro_bias_length"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = [NSNumber numberWithUnsignedInt:self->_velocityOffset];
  [v3 setObject:v13 forKey:@"velocity_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = [NSNumber numberWithUnsignedInt:self->_velocityLength];
  [v3 setObject:v14 forKey:@"velocity_length"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = [NSNumber numberWithUnsignedInt:self->_accelBiasOffset];
  [v3 setObject:v15 forKey:@"accel_bias_offset"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = [NSNumber numberWithUnsignedInt:self->_accelBiasLength];
  [v3 setObject:v16 forKey:@"accel_bias_length"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  v17 = [NSNumber numberWithUnsignedInt:self->_positionOffset];
  [v3 setObject:v17 forKey:@"position_offset"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    v5 = [NSNumber numberWithUnsignedInt:self->_positionLength];
    [v3 setObject:v5 forKey:@"position_length"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVIOInertialStateInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
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
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
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
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
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
    v4[1] = self->_stateLengthInBytes;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_stateLength;
  *((_WORD *)v4 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 9) = self->_orientationOffset;
  *((_WORD *)v4 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 8) = self->_orientationLength;
  *((_WORD *)v4 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 7) = self->_gyroBiasOffset;
  *((_WORD *)v4 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 6) = self->_gyroBiasLength;
  *((_WORD *)v4 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 14) = self->_velocityOffset;
  *((_WORD *)v4 + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 13) = self->_velocityLength;
  *((_WORD *)v4 + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 5) = self->_accelBiasOffset;
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 4) = self->_accelBiasLength;
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  *((_DWORD *)v4 + 11) = self->_positionOffset;
  *((_WORD *)v4 + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 10) = self->_positionLength;
    *((_WORD *)v4 + 30) |= 0x80u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_stateLengthInBytes;
    *((_WORD *)result + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 12) = self->_stateLength;
  *((_WORD *)result + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_orientationOffset;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_orientationLength;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_gyroBiasOffset;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 6) = self->_gyroBiasLength;
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 14) = self->_velocityOffset;
  *((_WORD *)result + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 13) = self->_velocityLength;
  *((_WORD *)result + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_accelBiasOffset;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_accelBiasLength;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_positionOffset;
  *((_WORD *)result + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return result;
  }
LABEL_13:
  *((_DWORD *)result + 10) = self->_positionLength;
  *((_WORD *)result + 30) |= 0x80u;
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
    if ((v6 & 1) == 0 || self->_stateLengthInBytes != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
LABEL_62:
    BOOL v7 = 0;
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_stateLength != *((_DWORD *)v4 + 12)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_orientationOffset != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_orientationLength != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gyroBiasOffset != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_gyroBiasLength != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_velocityOffset != *((_DWORD *)v4 + 14)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_velocityLength != *((_DWORD *)v4 + 13)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_accelBiasOffset != *((_DWORD *)v4 + 5)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accelBiasLength != *((_DWORD *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_positionOffset != *((_DWORD *)v4 + 11)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_positionLength != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x80) == 0;
  }
LABEL_63:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_stateLengthInBytes;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_stateLength;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_orientationOffset;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_orientationLength;
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
    uint64_t v7 = 2654435761 * self->_gyroBiasOffset;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_gyroBiasLength;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_velocityOffset;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_velocityLength;
    if ((has & 4) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_accelBiasOffset;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((has & 2) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_accelBiasLength;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((has & 0x80) != 0) {
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
  uint64_t v13 = 2654435761 * self->_positionOffset;
  if ((has & 0x80) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_positionLength;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_stateLengthInBytes = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_stateLength = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_orientationOffset = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_orientationLength = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_gyroBiasOffset = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_gyroBiasLength = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_velocityOffset = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_velocityLength = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_accelBiasOffset = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_accelBiasLength = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_positionOffset = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 30) & 0x80) != 0)
  {
LABEL_13:
    self->_positionLength = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_14:
}

- (unint64_t)stateLengthInBytes
{
  return self->_stateLengthInBytes;
}

- (unsigned)stateLength
{
  return self->_stateLength;
}

- (unsigned)orientationOffset
{
  return self->_orientationOffset;
}

- (unsigned)orientationLength
{
  return self->_orientationLength;
}

- (unsigned)gyroBiasOffset
{
  return self->_gyroBiasOffset;
}

- (unsigned)gyroBiasLength
{
  return self->_gyroBiasLength;
}

- (unsigned)velocityOffset
{
  return self->_velocityOffset;
}

- (unsigned)velocityLength
{
  return self->_velocityLength;
}

- (unsigned)accelBiasOffset
{
  return self->_accelBiasOffset;
}

- (unsigned)accelBiasLength
{
  return self->_accelBiasLength;
}

- (unsigned)positionOffset
{
  return self->_positionOffset;
}

- (unsigned)positionLength
{
  return self->_positionLength;
}

@end