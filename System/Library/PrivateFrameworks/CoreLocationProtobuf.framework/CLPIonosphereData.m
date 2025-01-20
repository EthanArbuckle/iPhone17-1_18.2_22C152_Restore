@interface CLPIonosphereData
- (BOOL)hasApplicableTimeSec;
- (BOOL)hasD2vtecDphi2;
- (BOOL)hasD2vtecDtheta2;
- (BOOL)hasD2vtecDthetaphi;
- (BOOL)hasDvtecDphi;
- (BOOL)hasDvtecDtheta;
- (BOOL)hasEstimatorAgeSec;
- (BOOL)hasGeodeticAltitudeM;
- (BOOL)hasHmaxKm;
- (BOOL)hasLatitudeDeg;
- (BOOL)hasLongitudeDeg;
- (BOOL)hasPd2vtecDphi2D2vtecDphi2;
- (BOOL)hasPd2vtecDtheta2D2vtecDtheta2;
- (BOOL)hasPd2vtecDthetadphiD2vtecDthetadphi;
- (BOOL)hasPdvtecDphiDvtecDphi;
- (BOOL)hasPdvtecDthetaDvtecDtheta;
- (BOOL)hasPhmaxHmaxKm2;
- (BOOL)hasPvtec0Vtec0;
- (BOOL)hasVtec0;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)applicableTimeSec;
- (double)d2vtecDphi2;
- (double)d2vtecDtheta2;
- (double)d2vtecDthetaphi;
- (double)dvtecDphi;
- (double)dvtecDtheta;
- (double)estimatorAgeSec;
- (double)geodeticAltitudeM;
- (double)hmaxKm;
- (double)latitudeDeg;
- (double)longitudeDeg;
- (double)pd2vtecDphi2D2vtecDphi2;
- (double)pd2vtecDtheta2D2vtecDtheta2;
- (double)pd2vtecDthetadphiD2vtecDthetadphi;
- (double)pdvtecDphiDvtecDphi;
- (double)pdvtecDthetaDvtecDtheta;
- (double)phmaxHmaxKm2;
- (double)pvtec0Vtec0;
- (double)vtec0;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicableTimeSec:(double)a3;
- (void)setD2vtecDphi2:(double)a3;
- (void)setD2vtecDtheta2:(double)a3;
- (void)setD2vtecDthetaphi:(double)a3;
- (void)setDvtecDphi:(double)a3;
- (void)setDvtecDtheta:(double)a3;
- (void)setEstimatorAgeSec:(double)a3;
- (void)setGeodeticAltitudeM:(double)a3;
- (void)setHasApplicableTimeSec:(BOOL)a3;
- (void)setHasD2vtecDphi2:(BOOL)a3;
- (void)setHasD2vtecDtheta2:(BOOL)a3;
- (void)setHasD2vtecDthetaphi:(BOOL)a3;
- (void)setHasDvtecDphi:(BOOL)a3;
- (void)setHasDvtecDtheta:(BOOL)a3;
- (void)setHasEstimatorAgeSec:(BOOL)a3;
- (void)setHasGeodeticAltitudeM:(BOOL)a3;
- (void)setHasHmaxKm:(BOOL)a3;
- (void)setHasLatitudeDeg:(BOOL)a3;
- (void)setHasLongitudeDeg:(BOOL)a3;
- (void)setHasPd2vtecDphi2D2vtecDphi2:(BOOL)a3;
- (void)setHasPd2vtecDtheta2D2vtecDtheta2:(BOOL)a3;
- (void)setHasPd2vtecDthetadphiD2vtecDthetadphi:(BOOL)a3;
- (void)setHasPdvtecDphiDvtecDphi:(BOOL)a3;
- (void)setHasPdvtecDthetaDvtecDtheta:(BOOL)a3;
- (void)setHasPhmaxHmaxKm2:(BOOL)a3;
- (void)setHasPvtec0Vtec0:(BOOL)a3;
- (void)setHasVtec0:(BOOL)a3;
- (void)setHmaxKm:(double)a3;
- (void)setLatitudeDeg:(double)a3;
- (void)setLongitudeDeg:(double)a3;
- (void)setPd2vtecDphi2D2vtecDphi2:(double)a3;
- (void)setPd2vtecDtheta2D2vtecDtheta2:(double)a3;
- (void)setPd2vtecDthetadphiD2vtecDthetadphi:(double)a3;
- (void)setPdvtecDphiDvtecDphi:(double)a3;
- (void)setPdvtecDthetaDvtecDtheta:(double)a3;
- (void)setPhmaxHmaxKm2:(double)a3;
- (void)setPvtec0Vtec0:(double)a3;
- (void)setVtec0:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIonosphereData

- (void)setLatitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_latitudeDeg = a3;
}

- (void)setHasLatitudeDeg:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLatitudeDeg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLongitudeDeg:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_longitudeDeg = a3;
}

- (void)setHasLongitudeDeg:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLongitudeDeg
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setGeodeticAltitudeM:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_geodeticAltitudeM = a3;
}

- (void)setHasGeodeticAltitudeM:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGeodeticAltitudeM
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setApplicableTimeSec:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_applicableTimeSec = a3;
}

- (void)setHasApplicableTimeSec:(BOOL)a3
{
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasApplicableTimeSec
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHmaxKm:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hmaxKm = a3;
}

- (void)setHasHmaxKm:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasHmaxKm
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setVtec0:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_vtec0 = a3;
}

- (void)setHasVtec0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVtec0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setDvtecDtheta:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dvtecDtheta = a3;
}

- (void)setHasDvtecDtheta:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDvtecDtheta
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDvtecDphi:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_dvtecDphi = a3;
}

- (void)setHasDvtecDphi:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasDvtecDphi
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setD2vtecDtheta2:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_d2vtecDtheta2 = a3;
}

- (void)setHasD2vtecDtheta2:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasD2vtecDtheta2
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setD2vtecDthetaphi:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_d2vtecDthetaphi = a3;
}

- (void)setHasD2vtecDthetaphi:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasD2vtecDthetaphi
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setD2vtecDphi2:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_d2vtecDphi2 = a3;
}

- (void)setHasD2vtecDphi2:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasD2vtecDphi2
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEstimatorAgeSec:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_estimatorAgeSec = a3;
}

- (void)setHasEstimatorAgeSec:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEstimatorAgeSec
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPhmaxHmaxKm2:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_phmaxHmaxKm2 = a3;
}

- (void)setHasPhmaxHmaxKm2:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasPhmaxHmaxKm2
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setPvtec0Vtec0:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_pvtec0Vtec0 = a3;
}

- (void)setHasPvtec0Vtec0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasPvtec0Vtec0
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPdvtecDthetaDvtecDtheta:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_pdvtecDthetaDvtecDtheta = a3;
}

- (void)setHasPdvtecDthetaDvtecDtheta:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPdvtecDthetaDvtecDtheta
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPdvtecDphiDvtecDphi:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_pdvtecDphiDvtecDphi = a3;
}

- (void)setHasPdvtecDphiDvtecDphi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPdvtecDphiDvtecDphi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPd2vtecDtheta2D2vtecDtheta2:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_pd2vtecDtheta2D2vtecDtheta2 = a3;
}

- (void)setHasPd2vtecDtheta2D2vtecDtheta2:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPd2vtecDtheta2D2vtecDtheta2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setPd2vtecDthetadphiD2vtecDthetadphi:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_pd2vtecDthetadphiD2vtecDthetadphi = a3;
}

- (void)setHasPd2vtecDthetadphiD2vtecDthetadphi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPd2vtecDthetadphiD2vtecDthetadphi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPd2vtecDphi2D2vtecDphi2:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_pd2vtecDphi2D2vtecDphi2 = a3;
}

- (void)setHasPd2vtecDphi2D2vtecDphi2:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($183B9D190D05FF5DA7F347791C463DAE)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPd2vtecDphi2D2vtecDphi2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIonosphereData;
  v4 = [(CLPIonosphereData *)&v8 description];
  v5 = [(CLPIonosphereData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_latitudeDeg];
    [v3 setObject:v7 forKey:@"latitude_deg"];

    $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_longitudeDeg];
  [v3 setObject:v8 forKey:@"longitude_deg"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  v9 = [NSNumber numberWithDouble:self->_geodeticAltitudeM];
  [v3 setObject:v9 forKey:@"geodetic_altitude_m"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v10 = [NSNumber numberWithDouble:self->_applicableTimeSec];
  [v3 setObject:v10 forKey:@"applicable_time_sec"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v11 = [NSNumber numberWithDouble:self->_hmaxKm];
  [v3 setObject:v11 forKey:@"hmax_km"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v12 = [NSNumber numberWithDouble:self->_vtec0];
  [v3 setObject:v12 forKey:@"vtec0"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  v13 = [NSNumber numberWithDouble:self->_dvtecDtheta];
  [v3 setObject:v13 forKey:@"dvtec_dtheta"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  v14 = [NSNumber numberWithDouble:self->_dvtecDphi];
  [v3 setObject:v14 forKey:@"dvtec_dphi"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  v15 = [NSNumber numberWithDouble:self->_d2vtecDtheta2];
  [v3 setObject:v15 forKey:@"d2vtec_dtheta2"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  v16 = [NSNumber numberWithDouble:self->_d2vtecDthetaphi];
  [v3 setObject:v16 forKey:@"d2vtec_dthetaphi"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v17 = [NSNumber numberWithDouble:self->_d2vtecDphi2];
  [v3 setObject:v17 forKey:@"d2vtec_dphi2"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v18 = [NSNumber numberWithDouble:self->_estimatorAgeSec];
  [v3 setObject:v18 forKey:@"estimator_age_sec"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v19 = [NSNumber numberWithDouble:self->_phmaxHmaxKm2];
  [v3 setObject:v19 forKey:@"phmax_hmax_km2"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v20 = [NSNumber numberWithDouble:self->_pvtec0Vtec0];
  [v3 setObject:v20 forKey:@"pvtec0_vtec0"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  v21 = [NSNumber numberWithDouble:self->_pdvtecDthetaDvtecDtheta];
  [v3 setObject:v21 forKey:@"pdvtec_dtheta_dvtec_dtheta"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = [NSNumber numberWithDouble:self->_pdvtecDphiDvtecDphi];
  [v3 setObject:v22 forKey:@"pdvtec_dphi_dvtec_dphi"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = [NSNumber numberWithDouble:self->_pd2vtecDtheta2D2vtecDtheta2];
  [v3 setObject:v23 forKey:@"pd2vtec_dtheta2_d2vtec_dtheta2"];

  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  v24 = [NSNumber numberWithDouble:self->_pd2vtecDthetadphiD2vtecDthetadphi];
  [v3 setObject:v24 forKey:@"pd2vtec_dthetadphi_d2vtec_dthetadphi"];

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    v5 = [NSNumber numberWithDouble:self->_pd2vtecDphi2D2vtecDphi2];
    [v3 setObject:v5 forKey:@"pd2vtec_dphi2_d2vtec_dphi2"];
  }
LABEL_21:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIonosphereDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    PBDataWriterWriteDoubleField();
    $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_20:
  }
    PBDataWriterWriteDoubleField();
LABEL_21:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    v4[10] = *(void *)&self->_latitudeDeg;
    *((_DWORD *)v4 + 40) |= 0x200u;
    $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v4[11] = *(void *)&self->_longitudeDeg;
  *((_DWORD *)v4 + 40) |= 0x400u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[8] = *(void *)&self->_geodeticAltitudeM;
  *((_DWORD *)v4 + 40) |= 0x80u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[1] = *(void *)&self->_applicableTimeSec;
  *((_DWORD *)v4 + 40) |= 1u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[9] = *(void *)&self->_hmaxKm;
  *((_DWORD *)v4 + 40) |= 0x100u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[19] = *(void *)&self->_vtec0;
  *((_DWORD *)v4 + 40) |= 0x40000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[6] = *(void *)&self->_dvtecDtheta;
  *((_DWORD *)v4 + 40) |= 0x20u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[5] = *(void *)&self->_dvtecDphi;
  *((_DWORD *)v4 + 40) |= 0x10u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[3] = *(void *)&self->_d2vtecDtheta2;
  *((_DWORD *)v4 + 40) |= 4u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[4] = *(void *)&self->_d2vtecDthetaphi;
  *((_DWORD *)v4 + 40) |= 8u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[2] = *(void *)&self->_d2vtecDphi2;
  *((_DWORD *)v4 + 40) |= 2u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v4[7] = *(void *)&self->_estimatorAgeSec;
  *((_DWORD *)v4 + 40) |= 0x40u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v4[17] = *(void *)&self->_phmaxHmaxKm2;
  *((_DWORD *)v4 + 40) |= 0x10000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v4[18] = *(void *)&self->_pvtec0Vtec0;
  *((_DWORD *)v4 + 40) |= 0x20000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  v4[16] = *(void *)&self->_pdvtecDthetaDvtecDtheta;
  *((_DWORD *)v4 + 40) |= 0x8000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  v4[15] = *(void *)&self->_pdvtecDphiDvtecDphi;
  *((_DWORD *)v4 + 40) |= 0x4000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  v4[13] = *(void *)&self->_pd2vtecDtheta2D2vtecDtheta2;
  *((_DWORD *)v4 + 40) |= 0x1000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  v4[14] = *(void *)&self->_pd2vtecDthetadphiD2vtecDthetadphi;
  *((_DWORD *)v4 + 40) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    v4[12] = *(void *)&self->_pd2vtecDphi2D2vtecDphi2;
    *((_DWORD *)v4 + 40) |= 0x800u;
  }
LABEL_21:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *((void *)result + 10) = *(void *)&self->_latitudeDeg;
    *((_DWORD *)result + 40) |= 0x200u;
    $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 11) = *(void *)&self->_longitudeDeg;
  *((_DWORD *)result + 40) |= 0x400u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 8) = *(void *)&self->_geodeticAltitudeM;
  *((_DWORD *)result + 40) |= 0x80u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)result + 1) = *(void *)&self->_applicableTimeSec;
  *((_DWORD *)result + 40) |= 1u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)result + 9) = *(void *)&self->_hmaxKm;
  *((_DWORD *)result + 40) |= 0x100u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)result + 19) = *(void *)&self->_vtec0;
  *((_DWORD *)result + 40) |= 0x40000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)result + 6) = *(void *)&self->_dvtecDtheta;
  *((_DWORD *)result + 40) |= 0x20u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)result + 5) = *(void *)&self->_dvtecDphi;
  *((_DWORD *)result + 40) |= 0x10u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)result + 3) = *(void *)&self->_d2vtecDtheta2;
  *((_DWORD *)result + 40) |= 4u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)result + 4) = *(void *)&self->_d2vtecDthetaphi;
  *((_DWORD *)result + 40) |= 8u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)result + 2) = *(void *)&self->_d2vtecDphi2;
  *((_DWORD *)result + 40) |= 2u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)result + 7) = *(void *)&self->_estimatorAgeSec;
  *((_DWORD *)result + 40) |= 0x40u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)result + 17) = *(void *)&self->_phmaxHmaxKm2;
  *((_DWORD *)result + 40) |= 0x10000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)result + 18) = *(void *)&self->_pvtec0Vtec0;
  *((_DWORD *)result + 40) |= 0x20000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)result + 16) = *(void *)&self->_pdvtecDthetaDvtecDtheta;
  *((_DWORD *)result + 40) |= 0x8000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)result + 15) = *(void *)&self->_pdvtecDphiDvtecDphi;
  *((_DWORD *)result + 40) |= 0x4000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 13) = *(void *)&self->_pd2vtecDtheta2D2vtecDtheta2;
  *((_DWORD *)result + 40) |= 0x1000u;
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      return result;
    }
    goto LABEL_20;
  }
LABEL_39:
  *((void *)result + 14) = *(void *)&self->_pd2vtecDthetadphiD2vtecDthetadphi;
  *((_DWORD *)result + 40) |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_20:
  *((void *)result + 12) = *(void *)&self->_pd2vtecDphi2D2vtecDphi2;
  *((_DWORD *)result + 40) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_97;
  }
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  int v6 = *((_DWORD *)v4 + 40);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_latitudeDeg != *((double *)v4 + 10)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
LABEL_97:
    BOOL v7 = 0;
    goto LABEL_98;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_longitudeDeg != *((double *)v4 + 11)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_geodeticAltitudeM != *((double *)v4 + 8)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_applicableTimeSec != *((double *)v4 + 1)) {
      goto LABEL_97;
    }
  }
  else if (v6)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_hmaxKm != *((double *)v4 + 9)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_vtec0 != *((double *)v4 + 19)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_dvtecDtheta != *((double *)v4 + 6)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_dvtecDphi != *((double *)v4 + 5)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_d2vtecDtheta2 != *((double *)v4 + 3)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_d2vtecDthetaphi != *((double *)v4 + 4)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_d2vtecDphi2 != *((double *)v4 + 2)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_97;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_estimatorAgeSec != *((double *)v4 + 7)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_phmaxHmaxKm2 != *((double *)v4 + 17)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_pvtec0Vtec0 != *((double *)v4 + 18)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_pdvtecDthetaDvtecDtheta != *((double *)v4 + 16)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_pdvtecDphiDvtecDphi != *((double *)v4 + 15)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_pd2vtecDtheta2D2vtecDtheta2 != *((double *)v4 + 13)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_pd2vtecDthetadphiD2vtecDthetadphi != *((double *)v4 + 14)) {
      goto LABEL_97;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_pd2vtecDphi2D2vtecDphi2 != *((double *)v4 + 12)) {
      goto LABEL_97;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (*((_DWORD *)v4 + 40) & 0x800) == 0;
  }
LABEL_98:

  return v7;
}

- (unint64_t)hash
{
  $183B9D190D05FF5DA7F347791C463DAE has = self->_has;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double latitudeDeg = self->_latitudeDeg;
    double v6 = -latitudeDeg;
    if (latitudeDeg >= 0.0) {
      double v6 = self->_latitudeDeg;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    double longitudeDeg = self->_longitudeDeg;
    double v11 = -longitudeDeg;
    if (longitudeDeg >= 0.0) {
      double v11 = self->_longitudeDeg;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double geodeticAltitudeM = self->_geodeticAltitudeM;
    double v16 = -geodeticAltitudeM;
    if (geodeticAltitudeM >= 0.0) {
      double v16 = self->_geodeticAltitudeM;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double applicableTimeSec = self->_applicableTimeSec;
    double v21 = -applicableTimeSec;
    if (applicableTimeSec >= 0.0) {
      double v21 = self->_applicableTimeSec;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double hmaxKm = self->_hmaxKm;
    double v26 = -hmaxKm;
    if (hmaxKm >= 0.0) {
      double v26 = self->_hmaxKm;
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
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    double vtec0 = self->_vtec0;
    double v31 = -vtec0;
    if (vtec0 >= 0.0) {
      double v31 = self->_vtec0;
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
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double dvtecDtheta = self->_dvtecDtheta;
    double v36 = -dvtecDtheta;
    if (dvtecDtheta >= 0.0) {
      double v36 = self->_dvtecDtheta;
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
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double dvtecDphi = self->_dvtecDphi;
    double v41 = -dvtecDphi;
    if (dvtecDphi >= 0.0) {
      double v41 = self->_dvtecDphi;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v108 = v39;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    d2vtecDtheta2 = self->_d2vtecDtheta2;
    double v46 = -d2vtecDtheta2;
    if (d2vtecDtheta2 >= 0.0) {
      double v46 = self->_d2vtecDtheta2;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v107 = v44;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double d2vtecDthetaphi = self->_d2vtecDthetaphi;
    double v51 = -d2vtecDthetaphi;
    if (d2vtecDthetaphi >= 0.0) {
      double v51 = self->_d2vtecDthetaphi;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v106 = v49;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double d2vtecDphi2 = self->_d2vtecDphi2;
    double v56 = -d2vtecDphi2;
    if (d2vtecDphi2 >= 0.0) {
      double v56 = self->_d2vtecDphi2;
    }
    long double v57 = floor(v56 + 0.5);
    double v58 = (v56 - v57) * 1.84467441e19;
    unint64_t v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0) {
        v54 += (unint64_t)v58;
      }
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    unint64_t v54 = 0;
  }
  unint64_t v105 = v54;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    double estimatorAgeSec = self->_estimatorAgeSec;
    double v61 = -estimatorAgeSec;
    if (estimatorAgeSec >= 0.0) {
      double v61 = self->_estimatorAgeSec;
    }
    long double v62 = floor(v61 + 0.5);
    double v63 = (v61 - v62) * 1.84467441e19;
    unint64_t v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0) {
        v59 += (unint64_t)v63;
      }
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    unint64_t v59 = 0;
  }
  unint64_t v104 = v59;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    double phmaxHmaxKm2 = self->_phmaxHmaxKm2;
    double v66 = -phmaxHmaxKm2;
    if (phmaxHmaxKm2 >= 0.0) {
      double v66 = self->_phmaxHmaxKm2;
    }
    long double v67 = floor(v66 + 0.5);
    double v68 = (v66 - v67) * 1.84467441e19;
    unint64_t v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0) {
        v64 += (unint64_t)v68;
      }
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    unint64_t v64 = 0;
  }
  unint64_t v103 = v64;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    double pvtec0Vtec0 = self->_pvtec0Vtec0;
    double v71 = -pvtec0Vtec0;
    if (pvtec0Vtec0 >= 0.0) {
      double v71 = self->_pvtec0Vtec0;
    }
    long double v72 = floor(v71 + 0.5);
    double v73 = (v71 - v72) * 1.84467441e19;
    unint64_t v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0) {
        v69 += (unint64_t)v73;
      }
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    unint64_t v69 = 0;
  }
  unint64_t v102 = v69;
  unint64_t v111 = v24;
  unint64_t v112 = v4;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    double pdvtecDthetaDvtecDtheta = self->_pdvtecDthetaDvtecDtheta;
    double v76 = -pdvtecDthetaDvtecDtheta;
    if (pdvtecDthetaDvtecDtheta >= 0.0) {
      double v76 = self->_pdvtecDthetaDvtecDtheta;
    }
    long double v77 = floor(v76 + 0.5);
    double v78 = (v76 - v77) * 1.84467441e19;
    unint64_t v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0) {
        v74 += (unint64_t)v78;
      }
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    unint64_t v74 = 0;
  }
  unint64_t v109 = v29;
  unint64_t v110 = v9;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    double pdvtecDphiDvtecDphi = self->_pdvtecDphiDvtecDphi;
    double v81 = -pdvtecDphiDvtecDphi;
    if (pdvtecDphiDvtecDphi >= 0.0) {
      double v81 = self->_pdvtecDphiDvtecDphi;
    }
    long double v82 = floor(v81 + 0.5);
    double v83 = (v81 - v82) * 1.84467441e19;
    unint64_t v79 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
    if (v83 >= 0.0)
    {
      if (v83 > 0.0) {
        v79 += (unint64_t)v83;
      }
    }
    else
    {
      v79 -= (unint64_t)fabs(v83);
    }
  }
  else
  {
    unint64_t v79 = 0;
  }
  unint64_t v84 = v14;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    pd2vtecDtheta2D2vtecDtheta2 = self->_pd2vtecDtheta2D2vtecDtheta2;
    double v88 = -pd2vtecDtheta2D2vtecDtheta2;
    if (pd2vtecDtheta2D2vtecDtheta2 >= 0.0) {
      double v88 = self->_pd2vtecDtheta2D2vtecDtheta2;
    }
    long double v89 = floor(v88 + 0.5);
    double v90 = (v88 - v89) * 1.84467441e19;
    unint64_t v86 = 2654435761u * (unint64_t)fmod(v89, 1.84467441e19);
    unint64_t v85 = v34;
    if (v90 >= 0.0)
    {
      if (v90 > 0.0) {
        v86 += (unint64_t)v90;
      }
    }
    else
    {
      v86 -= (unint64_t)fabs(v90);
    }
  }
  else
  {
    unint64_t v85 = v34;
    unint64_t v86 = 0;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    double pd2vtecDthetadphiD2vtecDthetadphi = self->_pd2vtecDthetadphiD2vtecDthetadphi;
    double v93 = -pd2vtecDthetadphiD2vtecDthetadphi;
    if (pd2vtecDthetadphiD2vtecDthetadphi >= 0.0) {
      double v93 = self->_pd2vtecDthetadphiD2vtecDthetadphi;
    }
    long double v94 = floor(v93 + 0.5);
    double v95 = (v93 - v94) * 1.84467441e19;
    unint64_t v91 = 2654435761u * (unint64_t)fmod(v94, 1.84467441e19);
    if (v95 >= 0.0)
    {
      if (v95 > 0.0) {
        v91 += (unint64_t)v95;
      }
    }
    else
    {
      v91 -= (unint64_t)fabs(v95);
    }
  }
  else
  {
    unint64_t v91 = 0;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    double pd2vtecDphi2D2vtecDphi2 = self->_pd2vtecDphi2D2vtecDphi2;
    double v98 = -pd2vtecDphi2D2vtecDphi2;
    if (pd2vtecDphi2D2vtecDphi2 >= 0.0) {
      double v98 = self->_pd2vtecDphi2D2vtecDphi2;
    }
    long double v99 = floor(v98 + 0.5);
    double v100 = (v98 - v99) * 1.84467441e19;
    unint64_t v96 = 2654435761u * (unint64_t)fmod(v99, 1.84467441e19);
    if (v100 >= 0.0)
    {
      if (v100 > 0.0) {
        v96 += (unint64_t)v100;
      }
    }
    else
    {
      v96 -= (unint64_t)fabs(v100);
    }
  }
  else
  {
    unint64_t v96 = 0;
  }
  return v110 ^ v112 ^ v84 ^ v19 ^ v111 ^ v109 ^ v85 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v74 ^ v79 ^ v86 ^ v91 ^ v96;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x200) != 0)
  {
    self->_double latitudeDeg = *((double *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
    int v5 = *((_DWORD *)v4 + 40);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_double longitudeDeg = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double geodeticAltitudeM = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double applicableTimeSec = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double hmaxKm = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x40000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double vtec0 = *((double *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double dvtecDtheta = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double dvtecDphi = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_d2vtecDtheta2 = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double d2vtecDthetaphi = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_double d2vtecDphi2 = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_double estimatorAgeSec = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x10000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_double phmaxHmaxKm2 = *((double *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x20000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_double pvtec0Vtec0 = *((double *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x8000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double pdvtecDthetaDvtecDtheta = *((double *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_double pdvtecDphiDvtecDphi = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_pd2vtecDtheta2D2vtecDtheta2 = *((double *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 40);
  if ((v5 & 0x2000) == 0)
  {
LABEL_19:
    if ((v5 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  self->_double pd2vtecDthetadphiD2vtecDthetadphi = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v4 + 40) & 0x800) != 0)
  {
LABEL_20:
    self->_double pd2vtecDphi2D2vtecDphi2 = *((double *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_21:
}

- (double)latitudeDeg
{
  return self->_latitudeDeg;
}

- (double)longitudeDeg
{
  return self->_longitudeDeg;
}

- (double)geodeticAltitudeM
{
  return self->_geodeticAltitudeM;
}

- (double)applicableTimeSec
{
  return self->_applicableTimeSec;
}

- (double)hmaxKm
{
  return self->_hmaxKm;
}

- (double)vtec0
{
  return self->_vtec0;
}

- (double)dvtecDtheta
{
  return self->_dvtecDtheta;
}

- (double)dvtecDphi
{
  return self->_dvtecDphi;
}

- (double)d2vtecDtheta2
{
  return self->_d2vtecDtheta2;
}

- (double)d2vtecDthetaphi
{
  return self->_d2vtecDthetaphi;
}

- (double)d2vtecDphi2
{
  return self->_d2vtecDphi2;
}

- (double)estimatorAgeSec
{
  return self->_estimatorAgeSec;
}

- (double)phmaxHmaxKm2
{
  return self->_phmaxHmaxKm2;
}

- (double)pvtec0Vtec0
{
  return self->_pvtec0Vtec0;
}

- (double)pdvtecDthetaDvtecDtheta
{
  return self->_pdvtecDthetaDvtecDtheta;
}

- (double)pdvtecDphiDvtecDphi
{
  return self->_pdvtecDphiDvtecDphi;
}

- (double)pd2vtecDtheta2D2vtecDtheta2
{
  return self->_pd2vtecDtheta2D2vtecDtheta2;
}

- (double)pd2vtecDthetadphiD2vtecDthetadphi
{
  return self->_pd2vtecDthetadphiD2vtecDthetadphi;
}

- (double)pd2vtecDphi2D2vtecDphi2
{
  return self->_pd2vtecDphi2D2vtecDphi2;
}

@end