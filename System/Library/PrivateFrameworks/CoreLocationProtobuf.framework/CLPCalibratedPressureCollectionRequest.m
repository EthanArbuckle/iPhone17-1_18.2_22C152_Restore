@interface CLPCalibratedPressureCollectionRequest
- (BOOL)hasActivity;
- (BOOL)hasAltitudeHAEM;
- (BOOL)hasAltitudeHAEUncM;
- (BOOL)hasCalibratedPressurePa;
- (BOOL)hasCalibratedPressureUncPa;
- (BOOL)hasCalibration;
- (BOOL)hasDevicePressurePa;
- (BOOL)hasDevicePressureUncPa;
- (BOOL)hasHorizontalUncM;
- (BOOL)hasLatitudeDeg;
- (BOOL)hasLongitudeDeg;
- (BOOL)hasQuantizedDistChangeSinceLastCalibrationM;
- (BOOL)hasQuantizedTimeChangeSinceLastCalibrationS;
- (BOOL)hasReferenceAltM;
- (BOOL)hasReferenceAltUncM;
- (BOOL)hasReliability;
- (BOOL)hasSpeedMps;
- (BOOL)hasSpeedUncMps;
- (BOOL)hasTimeSinceLastSignificantLocationVisitExitS;
- (BOOL)hasTimestampOfCalibrationS;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPBaroCalibrationIndication)calibration;
- (CLPMotionActivity)activity;
- (double)latitudeDeg;
- (double)longitudeDeg;
- (double)timeSinceLastSignificantLocationVisitExitS;
- (double)timestampOfCalibrationS;
- (float)altitudeHAEM;
- (float)altitudeHAEUncM;
- (float)calibratedPressurePa;
- (float)calibratedPressureUncPa;
- (float)devicePressurePa;
- (float)devicePressureUncPa;
- (float)horizontalUncM;
- (float)referenceAltM;
- (float)referenceAltUncM;
- (float)speedMps;
- (float)speedUncMps;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reliabilityAsString:(int)a3;
- (int)StringAsReliability:(id)a3;
- (int)quantizedDistChangeSinceLastCalibrationM;
- (int)quantizedTimeChangeSinceLastCalibrationS;
- (int)reliability;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivity:(id)a3;
- (void)setAltitudeHAEM:(float)a3;
- (void)setAltitudeHAEUncM:(float)a3;
- (void)setCalibratedPressurePa:(float)a3;
- (void)setCalibratedPressureUncPa:(float)a3;
- (void)setCalibration:(id)a3;
- (void)setDevicePressurePa:(float)a3;
- (void)setDevicePressureUncPa:(float)a3;
- (void)setHasAltitudeHAEM:(BOOL)a3;
- (void)setHasAltitudeHAEUncM:(BOOL)a3;
- (void)setHasCalibratedPressurePa:(BOOL)a3;
- (void)setHasCalibratedPressureUncPa:(BOOL)a3;
- (void)setHasDevicePressurePa:(BOOL)a3;
- (void)setHasDevicePressureUncPa:(BOOL)a3;
- (void)setHasHorizontalUncM:(BOOL)a3;
- (void)setHasLatitudeDeg:(BOOL)a3;
- (void)setHasLongitudeDeg:(BOOL)a3;
- (void)setHasQuantizedDistChangeSinceLastCalibrationM:(BOOL)a3;
- (void)setHasQuantizedTimeChangeSinceLastCalibrationS:(BOOL)a3;
- (void)setHasReferenceAltM:(BOOL)a3;
- (void)setHasReferenceAltUncM:(BOOL)a3;
- (void)setHasReliability:(BOOL)a3;
- (void)setHasSpeedMps:(BOOL)a3;
- (void)setHasSpeedUncMps:(BOOL)a3;
- (void)setHasTimeSinceLastSignificantLocationVisitExitS:(BOOL)a3;
- (void)setHasTimestampOfCalibrationS:(BOOL)a3;
- (void)setHorizontalUncM:(float)a3;
- (void)setLatitudeDeg:(double)a3;
- (void)setLongitudeDeg:(double)a3;
- (void)setQuantizedDistChangeSinceLastCalibrationM:(int)a3;
- (void)setQuantizedTimeChangeSinceLastCalibrationS:(int)a3;
- (void)setReferenceAltM:(float)a3;
- (void)setReferenceAltUncM:(float)a3;
- (void)setReliability:(int)a3;
- (void)setSpeedMps:(float)a3;
- (void)setSpeedUncMps:(float)a3;
- (void)setTimeSinceLastSignificantLocationVisitExitS:(double)a3;
- (void)setTimestampOfCalibrationS:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPCalibratedPressureCollectionRequest

- (void)setDevicePressurePa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_devicePressurePa = a3;
}

- (void)setHasDevicePressurePa:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasDevicePressurePa
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setDevicePressureUncPa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_devicePressureUncPa = a3;
}

- (void)setHasDevicePressureUncPa:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasDevicePressureUncPa
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCalibratedPressurePa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_calibratedPressurePa = a3;
}

- (void)setHasCalibratedPressurePa:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCalibratedPressurePa
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCalibratedPressureUncPa:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_calibratedPressureUncPa = a3;
}

- (void)setHasCalibratedPressureUncPa:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCalibratedPressureUncPa
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTimestampOfCalibrationS:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_timestampOfCalibrationS = a3;
}

- (void)setHasTimestampOfCalibrationS:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTimestampOfCalibrationS
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLatitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_latitudeDeg = a3;
}

- (void)setHasLatitudeDeg:(BOOL)a3
{
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasLatitudeDeg
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setLongitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_longitudeDeg = a3;
}

- (void)setHasLongitudeDeg:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLongitudeDeg
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHorizontalUncM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_horizontalUncM = a3;
}

- (void)setHasHorizontalUncM:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasHorizontalUncM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAltitudeHAEM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_altitudeHAEM = a3;
}

- (void)setHasAltitudeHAEM:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAltitudeHAEM
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAltitudeHAEUncM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_altitudeHAEUncM = a3;
}

- (void)setHasAltitudeHAEUncM:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAltitudeHAEUncM
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSpeedMps:(float)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_speedMps = a3;
}

- (void)setHasSpeedMps:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSpeedMps
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSpeedUncMps:(float)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_speedUncMps = a3;
}

- (void)setHasSpeedUncMps:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSpeedUncMps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setReferenceAltM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_referenceAltM = a3;
}

- (void)setHasReferenceAltM:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasReferenceAltM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setReferenceAltUncM:(float)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_referenceAltUncM = a3;
}

- (void)setHasReferenceAltUncM:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasReferenceAltUncM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTimeSinceLastSignificantLocationVisitExitS:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timeSinceLastSignificantLocationVisitExitS = a3;
}

- (void)setHasTimeSinceLastSignificantLocationVisitExitS:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimeSinceLastSignificantLocationVisitExitS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivity
{
  return self->_activity != 0;
}

- (int)reliability
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_reliability;
  }
  else {
    return 0;
  }
}

- (void)setReliability:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_reliability = a3;
}

- (void)setHasReliability:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasReliability
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)reliabilityAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E6C35E20[a3];
  }

  return v3;
}

- (int)StringAsReliability:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ReliabilityProtobufDefault"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ReliablityLow"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ReliablityMedium"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ReliabilityHigh"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCalibration
{
  return self->_calibration != 0;
}

- (void)setQuantizedDistChangeSinceLastCalibrationM:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_quantizedDistChangeSinceLastCalibrationM = a3;
}

- (void)setHasQuantizedDistChangeSinceLastCalibrationM:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasQuantizedDistChangeSinceLastCalibrationM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setQuantizedTimeChangeSinceLastCalibrationS:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_quantizedTimeChangeSinceLastCalibrationS = a3;
}

- (void)setHasQuantizedTimeChangeSinceLastCalibrationS:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($516943A72E2914F818D9A7665AC24C48)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasQuantizedTimeChangeSinceLastCalibrationS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPCalibratedPressureCollectionRequest;
  int v4 = [(CLPCalibratedPressureCollectionRequest *)&v8 description];
  v5 = [(CLPCalibratedPressureCollectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(float *)&double v4 = self->_devicePressurePa;
    v11 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v11 forKey:@"devicePressure_pa"];

    $516943A72E2914F818D9A7665AC24C48 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_devicePressureUncPa;
  v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"devicePressureUnc_pa"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(float *)&double v4 = self->_calibratedPressurePa;
  v13 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"calibratedPressure_pa"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(float *)&double v4 = self->_calibratedPressureUncPa;
  v14 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v14 forKey:@"calibratedPressureUnc_pa"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = [NSNumber numberWithDouble:self->_timestampOfCalibrationS];
  [v3 setObject:v15 forKey:@"timestampOfCalibration_s"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  v16 = [NSNumber numberWithDouble:self->_latitudeDeg];
  [v3 setObject:v16 forKey:@"latitude_deg"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = [NSNumber numberWithDouble:self->_longitudeDeg];
  [v3 setObject:v17 forKey:@"longitude_deg"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(float *)&double v4 = self->_horizontalUncM;
  v18 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v18 forKey:@"horizontalUnc_m"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(float *)&double v4 = self->_altitudeHAEM;
  v19 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v19 forKey:@"altitudeHAE_m"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(float *)&double v4 = self->_altitudeHAEUncM;
  v20 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v20 forKey:@"altitudeHAEUnc_m"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(float *)&double v4 = self->_speedMps;
  v21 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v21 forKey:@"speed_mps"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(float *)&double v4 = self->_speedUncMps;
  v22 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v22 forKey:@"speedUnc_mps"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(float *)&double v4 = self->_referenceAltM;
  v23 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v23 forKey:@"referenceAlt_m"];

  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  *(float *)&double v4 = self->_referenceAltUncM;
  v24 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v24 forKey:@"referenceAltUnc_m"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    v6 = [NSNumber numberWithDouble:self->_timeSinceLastSignificantLocationVisitExitS];
    [v3 setObject:v6 forKey:@"timeSinceLastSignificantLocationVisitExit_s"];
  }
LABEL_17:
  activity = self->_activity;
  if (activity)
  {
    objc_super v8 = [(CLPMotionActivity *)activity dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"activity"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    uint64_t reliability = self->_reliability;
    if (reliability >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reliability);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E6C35E20[reliability];
    }
    [v3 setObject:v10 forKey:@"reliability"];
  }
  calibration = self->_calibration;
  if (calibration)
  {
    v26 = [(CLPBaroCalibrationIndication *)calibration dictionaryRepresentation];
    [v3 setObject:v26 forKey:@"Calibration"];
  }
  $516943A72E2914F818D9A7665AC24C48 v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x800) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_quantizedDistChangeSinceLastCalibrationM];
    [v3 setObject:v28 forKey:@"quantizedDistChangeSinceLastCalibration_m"];

    $516943A72E2914F818D9A7665AC24C48 v27 = self->_has;
  }
  if ((*(_WORD *)&v27 & 0x1000) != 0)
  {
    v29 = [NSNumber numberWithInt:self->_quantizedTimeChangeSinceLastCalibrationS];
    [v3 setObject:v29 forKey:@"quantizedTimeChangeSinceLastCalibration_s"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCalibratedPressureCollectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteFloatField();
    $516943A72E2914F818D9A7665AC24C48 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteFloatField();
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_43:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_16:
  }
    PBDataWriterWriteDoubleField();
LABEL_17:
  if (self->_activity) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_calibration) {
    PBDataWriterWriteSubmessage();
  }
  $516943A72E2914F818D9A7665AC24C48 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    $516943A72E2914F818D9A7665AC24C48 v5 = self->_has;
  }
  if ((*(_WORD *)&v5 & 0x1000) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v4[18] = LODWORD(self->_devicePressurePa);
    v4[28] |= 0x100u;
    $516943A72E2914F818D9A7665AC24C48 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = LODWORD(self->_devicePressureUncPa);
  v4[28] |= 0x200u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[14] = LODWORD(self->_calibratedPressurePa);
  v4[28] |= 0x40u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[15] = LODWORD(self->_calibratedPressureUncPa);
  v4[28] |= 0x80u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 4) = *(void *)&self->_timestampOfCalibrationS;
  v4[28] |= 8u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 1) = *(void *)&self->_latitudeDeg;
  v4[28] |= 1u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v4 + 2) = *(void *)&self->_longitudeDeg;
  v4[28] |= 2u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[20] = LODWORD(self->_horizontalUncM);
  v4[28] |= 0x400u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[12] = LODWORD(self->_altitudeHAEM);
  v4[28] |= 0x10u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[13] = LODWORD(self->_altitudeHAEUncM);
  v4[28] |= 0x20u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[26] = LODWORD(self->_speedMps);
  v4[28] |= 0x10000u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  v4[27] = LODWORD(self->_speedUncMps);
  v4[28] |= 0x20000u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  v4[23] = LODWORD(self->_referenceAltM);
  v4[28] |= 0x2000u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_43:
  v4[24] = LODWORD(self->_referenceAltUncM);
  v4[28] |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    *((void *)v4 + 3) = *(void *)&self->_timeSinceLastSignificantLocationVisitExitS;
    v4[28] |= 4u;
  }
LABEL_17:
  v7 = v4;
  if (self->_activity)
  {
    objc_msgSend(v4, "setActivity:");
    double v4 = v7;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    v4[25] = self->_reliability;
    v4[28] |= 0x8000u;
  }
  if (self->_calibration)
  {
    objc_msgSend(v7, "setCalibration:");
    double v4 = v7;
  }
  $516943A72E2914F818D9A7665AC24C48 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    v4[21] = self->_quantizedDistChangeSinceLastCalibrationM;
    v4[28] |= 0x800u;
    $516943A72E2914F818D9A7665AC24C48 v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    v4[22] = self->_quantizedTimeChangeSinceLastCalibrationS;
    v4[28] |= 0x1000u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(float *)(v5 + 72) = self->_devicePressurePa;
    *(_DWORD *)(v5 + 112) |= 0x100u;
    $516943A72E2914F818D9A7665AC24C48 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 76) = self->_devicePressureUncPa;
  *(_DWORD *)(v5 + 112) |= 0x200u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(float *)(v5 + 56) = self->_calibratedPressurePa;
  *(_DWORD *)(v5 + 112) |= 0x40u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(float *)(v5 + 60) = self->_calibratedPressureUncPa;
  *(_DWORD *)(v5 + 112) |= 0x80u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 32) = self->_timestampOfCalibrationS;
  *(_DWORD *)(v5 + 112) |= 8u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 8) = self->_latitudeDeg;
  *(_DWORD *)(v5 + 112) |= 1u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 16) = self->_longitudeDeg;
  *(_DWORD *)(v5 + 112) |= 2u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(float *)(v5 + 80) = self->_horizontalUncM;
  *(_DWORD *)(v5 + 112) |= 0x400u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(float *)(v5 + 48) = self->_altitudeHAEM;
  *(_DWORD *)(v5 + 112) |= 0x10u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(float *)(v5 + 52) = self->_altitudeHAEUncM;
  *(_DWORD *)(v5 + 112) |= 0x20u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(float *)(v5 + 104) = self->_speedMps;
  *(_DWORD *)(v5 + 112) |= 0x10000u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(float *)(v5 + 108) = self->_speedUncMps;
  *(_DWORD *)(v5 + 112) |= 0x20000u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(float *)(v5 + 92) = self->_referenceAltM;
  *(_DWORD *)(v5 + 112) |= 0x2000u;
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_37:
  *(float *)(v5 + 96) = self->_referenceAltUncM;
  *(_DWORD *)(v5 + 112) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_16:
    *(double *)(v5 + 24) = self->_timeSinceLastSignificantLocationVisitExitS;
    *(_DWORD *)(v5 + 112) |= 4u;
  }
LABEL_17:
  id v8 = [(CLPMotionActivity *)self->_activity copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_reliability;
    *(_DWORD *)(v6 + 112) |= 0x8000u;
  }
  id v10 = [(CLPBaroCalibrationIndication *)self->_calibration copyWithZone:a3];
  v11 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v10;

  $516943A72E2914F818D9A7665AC24C48 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_quantizedDistChangeSinceLastCalibrationM;
    *(_DWORD *)(v6 + 112) |= 0x800u;
    $516943A72E2914F818D9A7665AC24C48 v12 = self->_has;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_quantizedTimeChangeSinceLastCalibrationS;
    *(_DWORD *)(v6 + 112) |= 0x1000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_98;
  }
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  int v6 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_devicePressurePa != *((float *)v4 + 18)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_devicePressureUncPa != *((float *)v4 + 19)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_calibratedPressurePa != *((float *)v4 + 14)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_calibratedPressureUncPa != *((float *)v4 + 15)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_timestampOfCalibrationS != *((double *)v4 + 4)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_98;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_latitudeDeg != *((double *)v4 + 1)) {
      goto LABEL_98;
    }
  }
  else if (v6)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_longitudeDeg != *((double *)v4 + 2)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_horizontalUncM != *((float *)v4 + 20)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_altitudeHAEM != *((float *)v4 + 12)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_altitudeHAEUncM != *((float *)v4 + 13)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_speedMps != *((float *)v4 + 26)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_speedUncMps != *((float *)v4 + 27)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_referenceAltM != *((float *)v4 + 23)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_referenceAltUncM != *((float *)v4 + 24)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_98;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timeSinceLastSignificantLocationVisitExitS != *((double *)v4 + 3)) {
      goto LABEL_98;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_98;
  }
  activity = self->_activity;
  if ((unint64_t)activity | *((void *)v4 + 5))
  {
    if (!-[CLPMotionActivity isEqual:](activity, "isEqual:")) {
      goto LABEL_98;
    }
    $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_reliability != *((_DWORD *)v4 + 25)) {
      goto LABEL_98;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_98;
  }
  calibration = self->_calibration;
  if ((unint64_t)calibration | *((void *)v4 + 8))
  {
    if (-[CLPBaroCalibrationIndication isEqual:](calibration, "isEqual:"))
    {
      $516943A72E2914F818D9A7665AC24C48 has = self->_has;
      goto LABEL_88;
    }
LABEL_98:
    BOOL v11 = 0;
    goto LABEL_99;
  }
LABEL_88:
  int v10 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_quantizedDistChangeSinceLastCalibrationM != *((_DWORD *)v4 + 21)) {
      goto LABEL_98;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_quantizedTimeChangeSinceLastCalibrationS != *((_DWORD *)v4 + 22)) {
      goto LABEL_98;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (*((_DWORD *)v4 + 28) & 0x1000) == 0;
  }
LABEL_99:

  return v11;
}

- (unint64_t)hash
{
  $516943A72E2914F818D9A7665AC24C48 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    float devicePressurePa = self->_devicePressurePa;
    float v6 = -devicePressurePa;
    if (devicePressurePa >= 0.0) {
      float v6 = self->_devicePressurePa;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    float devicePressureUncPa = self->_devicePressureUncPa;
    float v11 = -devicePressureUncPa;
    if (devicePressureUncPa >= 0.0) {
      float v11 = self->_devicePressureUncPa;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    float calibratedPressurePa = self->_calibratedPressurePa;
    float v16 = -calibratedPressurePa;
    if (calibratedPressurePa >= 0.0) {
      float v16 = self->_calibratedPressurePa;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    float calibratedPressureUncPa = self->_calibratedPressureUncPa;
    float v21 = -calibratedPressureUncPa;
    if (calibratedPressureUncPa >= 0.0) {
      float v21 = self->_calibratedPressureUncPa;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double timestampOfCalibrationS = self->_timestampOfCalibrationS;
    double v26 = -timestampOfCalibrationS;
    if (timestampOfCalibrationS >= 0.0) {
      double v26 = self->_timestampOfCalibrationS;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double latitudeDeg = self->_latitudeDeg;
    double v31 = -latitudeDeg;
    if (latitudeDeg >= 0.0) {
      double v31 = self->_latitudeDeg;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double longitudeDeg = self->_longitudeDeg;
    double v36 = -longitudeDeg;
    if (longitudeDeg >= 0.0) {
      double v36 = self->_longitudeDeg;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v96 = v34;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    float horizontalUncM = self->_horizontalUncM;
    float v41 = -horizontalUncM;
    if (horizontalUncM >= 0.0) {
      float v41 = self->_horizontalUncM;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v95 = v39;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    float altitudeHAEM = self->_altitudeHAEM;
    float v46 = -altitudeHAEM;
    if (altitudeHAEM >= 0.0) {
      float v46 = self->_altitudeHAEM;
    }
    float v47 = floorf(v46 + 0.5);
    float v48 = (float)(v46 - v47) * 1.8447e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v94 = v44;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    float altitudeHAEUncM = self->_altitudeHAEUncM;
    float v51 = -altitudeHAEUncM;
    if (altitudeHAEUncM >= 0.0) {
      float v51 = self->_altitudeHAEUncM;
    }
    float v52 = floorf(v51 + 0.5);
    float v53 = (float)(v51 - v52) * 1.8447e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v93 = v49;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    float speedMps = self->_speedMps;
    float v56 = -speedMps;
    if (speedMps >= 0.0) {
      float v56 = self->_speedMps;
    }
    float v57 = floorf(v56 + 0.5);
    float v58 = (float)(v56 - v57) * 1.8447e19;
    unint64_t v54 = 2654435761u * (unint64_t)fmodf(v57, 1.8447e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0) {
        v54 += (unint64_t)v58;
      }
    }
    else
    {
      v54 -= (unint64_t)fabsf(v58);
    }
  }
  else
  {
    unint64_t v54 = 0;
  }
  unint64_t v92 = v54;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    float speedUncMps = self->_speedUncMps;
    float v61 = -speedUncMps;
    if (speedUncMps >= 0.0) {
      float v61 = self->_speedUncMps;
    }
    float v62 = floorf(v61 + 0.5);
    float v63 = (float)(v61 - v62) * 1.8447e19;
    unint64_t v59 = 2654435761u * (unint64_t)fmodf(v62, 1.8447e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0) {
        v59 += (unint64_t)v63;
      }
    }
    else
    {
      v59 -= (unint64_t)fabsf(v63);
    }
  }
  else
  {
    unint64_t v59 = 0;
  }
  unint64_t v91 = v59;
  unint64_t v99 = v9;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    float referenceAltM = self->_referenceAltM;
    float v66 = -referenceAltM;
    if (referenceAltM >= 0.0) {
      float v66 = self->_referenceAltM;
    }
    float v67 = floorf(v66 + 0.5);
    float v68 = (float)(v66 - v67) * 1.8447e19;
    unint64_t v64 = 2654435761u * (unint64_t)fmodf(v67, 1.8447e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0) {
        v64 += (unint64_t)v68;
      }
    }
    else
    {
      v64 -= (unint64_t)fabsf(v68);
    }
  }
  else
  {
    unint64_t v64 = 0;
  }
  unint64_t v97 = v29;
  unint64_t v98 = v4;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    float referenceAltUncM = self->_referenceAltUncM;
    float v71 = -referenceAltUncM;
    if (referenceAltUncM >= 0.0) {
      float v71 = self->_referenceAltUncM;
    }
    float v72 = floorf(v71 + 0.5);
    float v73 = (float)(v71 - v72) * 1.8447e19;
    unint64_t v69 = 2654435761u * (unint64_t)fmodf(v72, 1.8447e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0) {
        v69 += (unint64_t)v73;
      }
    }
    else
    {
      v69 -= (unint64_t)fabsf(v73);
    }
  }
  else
  {
    unint64_t v69 = 0;
  }
  unint64_t v89 = v64;
  unint64_t v74 = v14;
  unint64_t v75 = v24;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    double timeSinceLastSignificantLocationVisitExitS = self->_timeSinceLastSignificantLocationVisitExitS;
    double v79 = -timeSinceLastSignificantLocationVisitExitS;
    if (timeSinceLastSignificantLocationVisitExitS >= 0.0) {
      double v79 = self->_timeSinceLastSignificantLocationVisitExitS;
    }
    long double v80 = floor(v79 + 0.5);
    double v81 = (v79 - v80) * 1.84467441e19;
    unint64_t v77 = 2654435761u * (unint64_t)fmod(v80, 1.84467441e19);
    unint64_t v76 = v19;
    if (v81 >= 0.0)
    {
      if (v81 > 0.0) {
        v77 += (unint64_t)v81;
      }
    }
    else
    {
      v77 -= (unint64_t)fabs(v81);
    }
  }
  else
  {
    unint64_t v76 = v19;
    unint64_t v77 = 0;
  }
  unint64_t v82 = [(CLPMotionActivity *)self->_activity hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v83 = 2654435761 * self->_reliability;
  }
  else {
    uint64_t v83 = 0;
  }
  unint64_t v84 = [(CLPBaroCalibrationIndication *)self->_calibration hash];
  $516943A72E2914F818D9A7665AC24C48 v85 = self->_has;
  if ((*(_WORD *)&v85 & 0x800) != 0)
  {
    uint64_t v86 = 2654435761 * self->_quantizedDistChangeSinceLastCalibrationM;
    if ((*(_WORD *)&v85 & 0x1000) != 0) {
      goto LABEL_126;
    }
LABEL_128:
    uint64_t v87 = 0;
    return v99 ^ v98 ^ v74 ^ v76 ^ v75 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v69 ^ v77 ^ v83 ^ v82 ^ v84 ^ v86 ^ v87;
  }
  uint64_t v86 = 0;
  if ((*(_WORD *)&v85 & 0x1000) == 0) {
    goto LABEL_128;
  }
LABEL_126:
  uint64_t v87 = 2654435761 * self->_quantizedTimeChangeSinceLastCalibrationS;
  return v99 ^ v98 ^ v74 ^ v76 ^ v75 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v69 ^ v77 ^ v83 ^ v82 ^ v84 ^ v86 ^ v87;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x100) != 0)
  {
    self->_float devicePressurePa = *((float *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x100u;
    int v6 = *((_DWORD *)v4 + 28);
    if ((v6 & 0x200) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_float devicePressureUncPa = *((float *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_float calibratedPressurePa = *((float *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x80) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_float calibratedPressureUncPa = *((float *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double timestampOfCalibrationS = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 1) == 0)
  {
LABEL_7:
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double latitudeDeg = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 2) == 0)
  {
LABEL_8:
    if ((v6 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double longitudeDeg = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x400) == 0)
  {
LABEL_9:
    if ((v6 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_float horizontalUncM = *((float *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x400u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10) == 0)
  {
LABEL_10:
    if ((v6 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_float altitudeHAEM = *((float *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x10u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x20) == 0)
  {
LABEL_11:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_float altitudeHAEUncM = *((float *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x20u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x10000) == 0)
  {
LABEL_12:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_float speedMps = *((float *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x20000) == 0)
  {
LABEL_13:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_float speedUncMps = *((float *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x2000) == 0)
  {
LABEL_14:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_float referenceAltM = *((float *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)v4 + 28);
  if ((v6 & 0x4000) == 0)
  {
LABEL_15:
    if ((v6 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  self->_float referenceAltUncM = *((float *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    self->_double timeSinceLastSignificantLocationVisitExitS = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_17:
  activity = self->_activity;
  uint64_t v8 = *((void *)v5 + 5);
  id v12 = v5;
  if (activity)
  {
    if (!v8) {
      goto LABEL_38;
    }
    -[CLPMotionActivity mergeFrom:](activity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_38;
    }
    -[CLPCalibratedPressureCollectionRequest setActivity:](self, "setActivity:");
  }
  id v5 = v12;
LABEL_38:
  if ((*((unsigned char *)v5 + 113) & 0x80) != 0)
  {
    self->_uint64_t reliability = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  calibration = self->_calibration;
  uint64_t v10 = *((void *)v5 + 8);
  if (calibration)
  {
    if (!v10) {
      goto LABEL_46;
    }
    -[CLPBaroCalibrationIndication mergeFrom:](calibration, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_46;
    }
    -[CLPCalibratedPressureCollectionRequest setCalibration:](self, "setCalibration:");
  }
  id v5 = v12;
LABEL_46:
  int v11 = *((_DWORD *)v5 + 28);
  if ((v11 & 0x800) != 0)
  {
    self->_quantizedDistChangeSinceLastCalibrationM = *((_DWORD *)v5 + 21);
    *(_DWORD *)&self->_has |= 0x800u;
    int v11 = *((_DWORD *)v5 + 28);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_quantizedTimeChangeSinceLastCalibrationS = *((_DWORD *)v5 + 22);
    *(_DWORD *)&self->_has |= 0x1000u;
  }

  MEMORY[0x1F41817F8]();
}

- (float)devicePressurePa
{
  return self->_devicePressurePa;
}

- (float)devicePressureUncPa
{
  return self->_devicePressureUncPa;
}

- (float)calibratedPressurePa
{
  return self->_calibratedPressurePa;
}

- (float)calibratedPressureUncPa
{
  return self->_calibratedPressureUncPa;
}

- (double)timestampOfCalibrationS
{
  return self->_timestampOfCalibrationS;
}

- (double)latitudeDeg
{
  return self->_latitudeDeg;
}

- (double)longitudeDeg
{
  return self->_longitudeDeg;
}

- (float)horizontalUncM
{
  return self->_horizontalUncM;
}

- (float)altitudeHAEM
{
  return self->_altitudeHAEM;
}

- (float)altitudeHAEUncM
{
  return self->_altitudeHAEUncM;
}

- (float)speedMps
{
  return self->_speedMps;
}

- (float)speedUncMps
{
  return self->_speedUncMps;
}

- (float)referenceAltM
{
  return self->_referenceAltM;
}

- (float)referenceAltUncM
{
  return self->_referenceAltUncM;
}

- (double)timeSinceLastSignificantLocationVisitExitS
{
  return self->_timeSinceLastSignificantLocationVisitExitS;
}

- (CLPMotionActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (CLPBaroCalibrationIndication)calibration
{
  return self->_calibration;
}

- (void)setCalibration:(id)a3
{
}

- (int)quantizedDistChangeSinceLastCalibrationM
{
  return self->_quantizedDistChangeSinceLastCalibrationM;
}

- (int)quantizedTimeChangeSinceLastCalibrationS
{
  return self->_quantizedTimeChangeSinceLastCalibrationS;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibration, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end