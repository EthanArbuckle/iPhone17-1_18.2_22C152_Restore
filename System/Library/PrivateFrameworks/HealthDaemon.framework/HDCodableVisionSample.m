@interface HDCodableVisionSample
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasBrand;
- (BOOL)hasGlassesDescription;
- (BOOL)hasLeftAddPower;
- (BOOL)hasLeftAxis;
- (BOOL)hasLeftBaseCurve;
- (BOOL)hasLeftContactDiameter;
- (BOOL)hasLeftCylinder;
- (BOOL)hasLeftFarPupillaryDistance;
- (BOOL)hasLeftNearPupillaryDistance;
- (BOOL)hasLeftPrismAmount;
- (BOOL)hasLeftPrismAngle;
- (BOOL)hasLeftSphere;
- (BOOL)hasLeftVertexDistance;
- (BOOL)hasPrescriptionType;
- (BOOL)hasRightAddPower;
- (BOOL)hasRightAxis;
- (BOOL)hasRightBaseCurve;
- (BOOL)hasRightContactDiameter;
- (BOOL)hasRightCylinder;
- (BOOL)hasRightFarPupillaryDistance;
- (BOOL)hasRightNearPupillaryDistance;
- (BOOL)hasRightPrismAmount;
- (BOOL)hasRightPrismAngle;
- (BOOL)hasRightSphere;
- (BOOL)hasRightVertexDistance;
- (BOOL)hasSample;
- (BOOL)hasVerifiableData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (HDCodableVerifiableData)verifiableData;
- (NSString)brand;
- (NSString)description;
- (NSString)glassesDescription;
- (double)leftAddPower;
- (double)leftAxis;
- (double)leftBaseCurve;
- (double)leftContactDiameter;
- (double)leftCylinder;
- (double)leftFarPupillaryDistance;
- (double)leftNearPupillaryDistance;
- (double)leftPrismAmount;
- (double)leftPrismAngle;
- (double)leftSphere;
- (double)leftVertexDistance;
- (double)rightAddPower;
- (double)rightAxis;
- (double)rightBaseCurve;
- (double)rightContactDiameter;
- (double)rightCylinder;
- (double)rightFarPupillaryDistance;
- (double)rightNearPupillaryDistance;
- (double)rightPrismAmount;
- (double)rightPrismAngle;
- (double)rightSphere;
- (double)rightVertexDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)prescriptionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBrand:(id)a3;
- (void)setGlassesDescription:(id)a3;
- (void)setHasLeftAddPower:(BOOL)a3;
- (void)setHasLeftAxis:(BOOL)a3;
- (void)setHasLeftBaseCurve:(BOOL)a3;
- (void)setHasLeftContactDiameter:(BOOL)a3;
- (void)setHasLeftCylinder:(BOOL)a3;
- (void)setHasLeftFarPupillaryDistance:(BOOL)a3;
- (void)setHasLeftNearPupillaryDistance:(BOOL)a3;
- (void)setHasLeftPrismAmount:(BOOL)a3;
- (void)setHasLeftPrismAngle:(BOOL)a3;
- (void)setHasLeftSphere:(BOOL)a3;
- (void)setHasLeftVertexDistance:(BOOL)a3;
- (void)setHasPrescriptionType:(BOOL)a3;
- (void)setHasRightAddPower:(BOOL)a3;
- (void)setHasRightAxis:(BOOL)a3;
- (void)setHasRightBaseCurve:(BOOL)a3;
- (void)setHasRightContactDiameter:(BOOL)a3;
- (void)setHasRightCylinder:(BOOL)a3;
- (void)setHasRightFarPupillaryDistance:(BOOL)a3;
- (void)setHasRightNearPupillaryDistance:(BOOL)a3;
- (void)setHasRightPrismAmount:(BOOL)a3;
- (void)setHasRightPrismAngle:(BOOL)a3;
- (void)setHasRightSphere:(BOOL)a3;
- (void)setHasRightVertexDistance:(BOOL)a3;
- (void)setLeftAddPower:(double)a3;
- (void)setLeftAxis:(double)a3;
- (void)setLeftBaseCurve:(double)a3;
- (void)setLeftContactDiameter:(double)a3;
- (void)setLeftCylinder:(double)a3;
- (void)setLeftFarPupillaryDistance:(double)a3;
- (void)setLeftNearPupillaryDistance:(double)a3;
- (void)setLeftPrismAmount:(double)a3;
- (void)setLeftPrismAngle:(double)a3;
- (void)setLeftSphere:(double)a3;
- (void)setLeftVertexDistance:(double)a3;
- (void)setPrescriptionType:(int64_t)a3;
- (void)setRightAddPower:(double)a3;
- (void)setRightAxis:(double)a3;
- (void)setRightBaseCurve:(double)a3;
- (void)setRightContactDiameter:(double)a3;
- (void)setRightCylinder:(double)a3;
- (void)setRightFarPupillaryDistance:(double)a3;
- (void)setRightNearPupillaryDistance:(double)a3;
- (void)setRightPrismAmount:(double)a3;
- (void)setRightPrismAngle:(double)a3;
- (void)setRightSphere:(double)a3;
- (void)setRightVertexDistance:(double)a3;
- (void)setSample:(id)a3;
- (void)setVerifiableData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableVisionSample

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setPrescriptionType:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_prescriptionType = a3;
}

- (void)setHasPrescriptionType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPrescriptionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLeftSphere:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_leftSphere = a3;
}

- (void)setHasLeftSphere:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLeftSphere
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRightSphere:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_rightSphere = a3;
}

- (void)setHasRightSphere:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRightSphere
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setLeftCylinder:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_leftCylinder = a3;
}

- (void)setHasLeftCylinder:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasLeftCylinder
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRightCylinder:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rightCylinder = a3;
}

- (void)setHasRightCylinder:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRightCylinder
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setLeftAxis:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_leftAxis = a3;
}

- (void)setHasLeftAxis:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLeftAxis
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRightAxis:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_rightAxis = a3;
}

- (void)setHasRightAxis:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRightAxis
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setLeftAddPower:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_leftAddPower = a3;
}

- (void)setHasLeftAddPower:(BOOL)a3
{
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasLeftAddPower
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRightAddPower:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_rightAddPower = a3;
}

- (void)setHasRightAddPower:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRightAddPower
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLeftVertexDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_leftVertexDistance = a3;
}

- (void)setHasLeftVertexDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLeftVertexDistance
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRightVertexDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_rightVertexDistance = a3;
}

- (void)setHasRightVertexDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasRightVertexDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setLeftPrismAmount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_leftPrismAmount = a3;
}

- (void)setHasLeftPrismAmount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLeftPrismAmount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setRightPrismAmount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rightPrismAmount = a3;
}

- (void)setHasRightPrismAmount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRightPrismAmount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setLeftPrismAngle:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_leftPrismAngle = a3;
}

- (void)setHasLeftPrismAngle:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLeftPrismAngle
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRightPrismAngle:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rightPrismAngle = a3;
}

- (void)setHasRightPrismAngle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRightPrismAngle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setLeftFarPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_leftFarPupillaryDistance = a3;
}

- (void)setHasLeftFarPupillaryDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLeftFarPupillaryDistance
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setRightFarPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_rightFarPupillaryDistance = a3;
}

- (void)setHasRightFarPupillaryDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRightFarPupillaryDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLeftNearPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_leftNearPupillaryDistance = a3;
}

- (void)setHasLeftNearPupillaryDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLeftNearPupillaryDistance
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRightNearPupillaryDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_rightNearPupillaryDistance = a3;
}

- (void)setHasRightNearPupillaryDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRightNearPupillaryDistance
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasGlassesDescription
{
  return self->_glassesDescription != 0;
}

- (void)setLeftBaseCurve:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_leftBaseCurve = a3;
}

- (void)setHasLeftBaseCurve:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasLeftBaseCurve
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRightBaseCurve:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rightBaseCurve = a3;
}

- (void)setHasRightBaseCurve:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRightBaseCurve
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setLeftContactDiameter:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_leftContactDiameter = a3;
}

- (void)setHasLeftContactDiameter:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasLeftContactDiameter
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRightContactDiameter:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_rightContactDiameter = a3;
}

- (void)setHasRightContactDiameter:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F833AA3FAF368E1CC47BE03942224269)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRightContactDiameter
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasBrand
{
  return self->_brand != 0;
}

- (BOOL)hasVerifiableData
{
  return self->_verifiableData != 0;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableVisionSample;
  v4 = [(HDCodableVisionSample *)&v8 description];
  v5 = [(HDCodableVisionSample *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v15 = [NSNumber numberWithLongLong:self->_prescriptionType];
    [v3 setObject:v15 forKey:@"prescriptionType"];

    $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  v16 = [NSNumber numberWithDouble:self->_leftSphere];
  [v3 setObject:v16 forKey:@"leftSphere"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  v17 = [NSNumber numberWithDouble:self->_rightSphere];
  [v3 setObject:v17 forKey:@"rightSphere"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  v18 = [NSNumber numberWithDouble:self->_leftCylinder];
  [v3 setObject:v18 forKey:@"leftCylinder"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  v19 = [NSNumber numberWithDouble:self->_rightCylinder];
  [v3 setObject:v19 forKey:@"rightCylinder"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  v20 = [NSNumber numberWithDouble:self->_leftAxis];
  [v3 setObject:v20 forKey:@"leftAxis"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  v21 = [NSNumber numberWithDouble:self->_rightAxis];
  [v3 setObject:v21 forKey:@"rightAxis"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  v22 = [NSNumber numberWithDouble:self->_leftAddPower];
  [v3 setObject:v22 forKey:@"leftAddPower"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  v23 = [NSNumber numberWithDouble:self->_rightAddPower];
  [v3 setObject:v23 forKey:@"rightAddPower"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  v24 = [NSNumber numberWithDouble:self->_leftVertexDistance];
  [v3 setObject:v24 forKey:@"leftVertexDistance"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  v25 = [NSNumber numberWithDouble:self->_rightVertexDistance];
  [v3 setObject:v25 forKey:@"rightVertexDistance"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  v26 = [NSNumber numberWithDouble:self->_leftPrismAmount];
  [v3 setObject:v26 forKey:@"leftPrismAmount"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  v27 = [NSNumber numberWithDouble:self->_rightPrismAmount];
  [v3 setObject:v27 forKey:@"rightPrismAmount"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  v28 = [NSNumber numberWithDouble:self->_leftPrismAngle];
  [v3 setObject:v28 forKey:@"leftPrismAngle"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  v29 = [NSNumber numberWithDouble:self->_rightPrismAngle];
  [v3 setObject:v29 forKey:@"rightPrismAngle"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  v30 = [NSNumber numberWithDouble:self->_leftFarPupillaryDistance];
  [v3 setObject:v30 forKey:@"leftFarPupillaryDistance"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  v31 = [NSNumber numberWithDouble:self->_rightFarPupillaryDistance];
  [v3 setObject:v31 forKey:@"rightFarPupillaryDistance"];

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_54:
  v32 = [NSNumber numberWithDouble:self->_leftNearPupillaryDistance];
  [v3 setObject:v32 forKey:@"leftNearPupillaryDistance"];

  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_22:
    v7 = [NSNumber numberWithDouble:self->_rightNearPupillaryDistance];
    [v3 setObject:v7 forKey:@"rightNearPupillaryDistance"];
  }
LABEL_23:
  glassesDescription = self->_glassesDescription;
  if (glassesDescription) {
    [v3 setObject:glassesDescription forKey:@"glassesDescription"];
  }
  $F833AA3FAF368E1CC47BE03942224269 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    v33 = [NSNumber numberWithDouble:self->_leftBaseCurve];
    [v3 setObject:v33 forKey:@"leftBaseCurve"];

    $F833AA3FAF368E1CC47BE03942224269 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v9 & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  v34 = [NSNumber numberWithDouble:self->_rightBaseCurve];
  [v3 setObject:v34 forKey:@"rightBaseCurve"];

  $F833AA3FAF368E1CC47BE03942224269 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_58:
  v35 = [NSNumber numberWithDouble:self->_leftContactDiameter];
  [v3 setObject:v35 forKey:@"leftContactDiameter"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    v10 = [NSNumber numberWithDouble:self->_rightContactDiameter];
    [v3 setObject:v10 forKey:@"rightContactDiameter"];
  }
LABEL_30:
  brand = self->_brand;
  if (brand) {
    [v3 setObject:brand forKey:@"brand"];
  }
  verifiableData = self->_verifiableData;
  if (verifiableData)
  {
    v13 = [(HDCodableVerifiableData *)verifiableData dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"verifiableData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableVisionSampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_22:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_23:
  if (self->_glassesDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  $F833AA3FAF368E1CC47BE03942224269 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    $F833AA3FAF368E1CC47BE03942224269 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v6 & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  $F833AA3FAF368E1CC47BE03942224269 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_30:
  if (self->_brand)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_verifiableData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v7;
  }
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((void *)v4 + 12) = self->_prescriptionType;
    *((_DWORD *)v4 + 56) |= 0x800u;
    $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_5:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 10) = *(void *)&self->_leftSphere;
  *((_DWORD *)v4 + 56) |= 0x200u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)v4 + 22) = *(void *)&self->_rightSphere;
  *((_DWORD *)v4 + 56) |= 0x200000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v4 + 5) = *(void *)&self->_leftCylinder;
  *((_DWORD *)v4 + 56) |= 0x10u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)v4 + 17) = *(void *)&self->_rightCylinder;
  *((_DWORD *)v4 + 56) |= 0x10000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)v4 + 2) = *(void *)&self->_leftAxis;
  *((_DWORD *)v4 + 56) |= 2u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)v4 + 14) = *(void *)&self->_rightAxis;
  *((_DWORD *)v4 + 56) |= 0x2000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)v4 + 1) = *(void *)&self->_leftAddPower;
  *((_DWORD *)v4 + 56) |= 1u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)v4 + 13) = *(void *)&self->_rightAddPower;
  *((_DWORD *)v4 + 56) |= 0x1000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)v4 + 11) = *(void *)&self->_leftVertexDistance;
  *((_DWORD *)v4 + 56) |= 0x400u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v4 + 23) = *(void *)&self->_rightVertexDistance;
  *((_DWORD *)v4 + 56) |= 0x400000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v4 + 8) = *(void *)&self->_leftPrismAmount;
  *((_DWORD *)v4 + 56) |= 0x80u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)v4 + 20) = *(void *)&self->_rightPrismAmount;
  *((_DWORD *)v4 + 56) |= 0x80000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)v4 + 9) = *(void *)&self->_leftPrismAngle;
  *((_DWORD *)v4 + 56) |= 0x100u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)v4 + 21) = *(void *)&self->_rightPrismAngle;
  *((_DWORD *)v4 + 56) |= 0x100000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)v4 + 6) = *(void *)&self->_leftFarPupillaryDistance;
  *((_DWORD *)v4 + 56) |= 0x20u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)v4 + 18) = *(void *)&self->_rightFarPupillaryDistance;
  *((_DWORD *)v4 + 56) |= 0x20000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_54:
  *((void *)v4 + 7) = *(void *)&self->_leftNearPupillaryDistance;
  *((_DWORD *)v4 + 56) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_22:
    *((void *)v4 + 19) = *(void *)&self->_rightNearPupillaryDistance;
    *((_DWORD *)v4 + 56) |= 0x40000u;
  }
LABEL_23:
  if (self->_glassesDescription)
  {
    objc_msgSend(v7, "setGlassesDescription:");
    id v4 = v7;
  }
  $F833AA3FAF368E1CC47BE03942224269 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_leftBaseCurve;
    *((_DWORD *)v4 + 56) |= 4u;
    $F833AA3FAF368E1CC47BE03942224269 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v6 & 8) == 0) {
        goto LABEL_28;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  *((void *)v4 + 15) = *(void *)&self->_rightBaseCurve;
  *((_DWORD *)v4 + 56) |= 0x4000u;
  $F833AA3FAF368E1CC47BE03942224269 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_58:
  *((void *)v4 + 4) = *(void *)&self->_leftContactDiameter;
  *((_DWORD *)v4 + 56) |= 8u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    *((void *)v4 + 16) = *(void *)&self->_rightContactDiameter;
    *((_DWORD *)v4 + 56) |= 0x8000u;
  }
LABEL_30:
  if (self->_brand)
  {
    objc_msgSend(v7, "setBrand:");
    id v4 = v7;
  }
  if (self->_verifiableData)
  {
    objc_msgSend(v7, "setVerifiableData:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  id v7 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v6;

  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(void *)(v5 + 96) = self->_prescriptionType;
    *(_DWORD *)(v5 + 224) |= 0x800u;
    $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x200000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 80) = self->_leftSphere;
  *(_DWORD *)(v5 + 224) |= 0x200u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 176) = self->_rightSphere;
  *(_DWORD *)(v5 + 224) |= 0x200000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 40) = self->_leftCylinder;
  *(_DWORD *)(v5 + 224) |= 0x10u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 136) = self->_rightCylinder;
  *(_DWORD *)(v5 + 224) |= 0x10000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(double *)(v5 + 16) = self->_leftAxis;
  *(_DWORD *)(v5 + 224) |= 2u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 112) = self->_rightAxis;
  *(_DWORD *)(v5 + 224) |= 0x2000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(double *)(v5 + 8) = self->_leftAddPower;
  *(_DWORD *)(v5 + 224) |= 1u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(double *)(v5 + 104) = self->_rightAddPower;
  *(_DWORD *)(v5 + 224) |= 0x1000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(double *)(v5 + 88) = self->_leftVertexDistance;
  *(_DWORD *)(v5 + 224) |= 0x400u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(double *)(v5 + 184) = self->_rightVertexDistance;
  *(_DWORD *)(v5 + 224) |= 0x400000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(double *)(v5 + 64) = self->_leftPrismAmount;
  *(_DWORD *)(v5 + 224) |= 0x80u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(double *)(v5 + 160) = self->_rightPrismAmount;
  *(_DWORD *)(v5 + 224) |= 0x80000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(double *)(v5 + 72) = self->_leftPrismAngle;
  *(_DWORD *)(v5 + 224) |= 0x100u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(double *)(v5 + 168) = self->_rightPrismAngle;
  *(_DWORD *)(v5 + 224) |= 0x100000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 48) = self->_leftFarPupillaryDistance;
  *(_DWORD *)(v5 + 224) |= 0x20u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(double *)(v5 + 144) = self->_rightFarPupillaryDistance;
  *(_DWORD *)(v5 + 224) |= 0x20000u;
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_44:
  *(double *)(v5 + 56) = self->_leftNearPupillaryDistance;
  *(_DWORD *)(v5 + 224) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_20:
    *(double *)(v5 + 152) = self->_rightNearPupillaryDistance;
    *(_DWORD *)(v5 + 224) |= 0x40000u;
  }
LABEL_21:
  uint64_t v9 = [(NSString *)self->_glassesDescription copyWithZone:a3];
  v10 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v9;

  $F833AA3FAF368E1CC47BE03942224269 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_leftBaseCurve;
    *(_DWORD *)(v5 + 224) |= 4u;
    $F833AA3FAF368E1CC47BE03942224269 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x4000) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&v11 & 8) == 0) {
        goto LABEL_24;
      }
LABEL_48:
      *(double *)(v5 + 32) = self->_leftContactDiameter;
      *(_DWORD *)(v5 + 224) |= 8u;
      if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
    goto LABEL_23;
  }
  *(double *)(v5 + 120) = self->_rightBaseCurve;
  *(_DWORD *)(v5 + 224) |= 0x4000u;
  $F833AA3FAF368E1CC47BE03942224269 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 8) != 0) {
    goto LABEL_48;
  }
LABEL_24:
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
LABEL_25:
    *(double *)(v5 + 128) = self->_rightContactDiameter;
    *(_DWORD *)(v5 + 224) |= 0x8000u;
  }
LABEL_26:
  uint64_t v12 = [(NSString *)self->_brand copyWithZone:a3];
  v13 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v12;

  id v14 = [(HDCodableVerifiableData *)self->_verifiableData copyWithZone:a3];
  v15 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_126;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 26))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_126;
    }
  }
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  int v7 = *((_DWORD *)v4 + 56);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_prescriptionType != *((void *)v4 + 12)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_leftSphere != *((double *)v4 + 10)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_rightSphere != *((double *)v4 + 22)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_leftCylinder != *((double *)v4 + 5)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_rightCylinder != *((double *)v4 + 17)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_leftAxis != *((double *)v4 + 2)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_rightAxis != *((double *)v4 + 14)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_126;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_leftAddPower != *((double *)v4 + 1)) {
      goto LABEL_126;
    }
  }
  else if (v7)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_rightAddPower != *((double *)v4 + 13)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_leftVertexDistance != *((double *)v4 + 11)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_rightVertexDistance != *((double *)v4 + 23)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_leftPrismAmount != *((double *)v4 + 8)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_rightPrismAmount != *((double *)v4 + 20)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_leftPrismAngle != *((double *)v4 + 9)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_rightPrismAngle != *((double *)v4 + 21)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_leftFarPupillaryDistance != *((double *)v4 + 6)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_rightFarPupillaryDistance != *((double *)v4 + 18)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_leftNearPupillaryDistance != *((double *)v4 + 7)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_rightNearPupillaryDistance != *((double *)v4 + 19)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_126;
  }
  glassesDescription = self->_glassesDescription;
  if ((unint64_t)glassesDescription | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](glassesDescription, "isEqual:"))
    {
LABEL_126:
      char v11 = 0;
      goto LABEL_127;
    }
    $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
    int v7 = *((_DWORD *)v4 + 56);
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_leftBaseCurve != *((double *)v4 + 3)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_rightBaseCurve != *((double *)v4 + 15)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_126;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_leftContactDiameter != *((double *)v4 + 4)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_126;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_rightContactDiameter != *((double *)v4 + 16)) {
      goto LABEL_126;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_126;
  }
  brand = self->_brand;
  if ((unint64_t)brand | *((void *)v4 + 24) && !-[NSString isEqual:](brand, "isEqual:")) {
    goto LABEL_126;
  }
  verifiableData = self->_verifiableData;
  if ((unint64_t)verifiableData | *((void *)v4 + 27)) {
    char v11 = -[HDCodableVerifiableData isEqual:](verifiableData, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_127:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v136 = [(HDCodableSample *)self->_sample hash];
  $F833AA3FAF368E1CC47BE03942224269 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    uint64_t v135 = 2654435761 * self->_prescriptionType;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v135 = 0;
  if ((*(_WORD *)&has & 0x200) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double leftSphere = self->_leftSphere;
  double v5 = -leftSphere;
  if (leftSphere >= 0.0) {
    double v5 = self->_leftSphere;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    double rightSphere = self->_rightSphere;
    double v11 = -rightSphere;
    if (rightSphere >= 0.0) {
      double v11 = self->_rightSphere;
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
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double leftCylinder = self->_leftCylinder;
    double v16 = -leftCylinder;
    if (leftCylinder >= 0.0) {
      double v16 = self->_leftCylinder;
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
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    double rightCylinder = self->_rightCylinder;
    double v21 = -rightCylinder;
    if (rightCylinder >= 0.0) {
      double v21 = self->_rightCylinder;
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
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double leftAxis = self->_leftAxis;
    double v26 = -leftAxis;
    if (leftAxis >= 0.0) {
      double v26 = self->_leftAxis;
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
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    double rightAxis = self->_rightAxis;
    double v31 = -rightAxis;
    if (rightAxis >= 0.0) {
      double v31 = self->_rightAxis;
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
  if (*(unsigned char *)&has)
  {
    double leftAddPower = self->_leftAddPower;
    double v36 = -leftAddPower;
    if (leftAddPower >= 0.0) {
      double v36 = self->_leftAddPower;
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
  unint64_t v131 = v34;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    double rightAddPower = self->_rightAddPower;
    double v41 = -rightAddPower;
    if (rightAddPower >= 0.0) {
      double v41 = self->_rightAddPower;
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
  unint64_t v130 = v39;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    double leftVertexDistance = self->_leftVertexDistance;
    double v46 = -leftVertexDistance;
    if (leftVertexDistance >= 0.0) {
      double v46 = self->_leftVertexDistance;
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
  unint64_t v129 = v44;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    double rightVertexDistance = self->_rightVertexDistance;
    double v51 = -rightVertexDistance;
    if (rightVertexDistance >= 0.0) {
      double v51 = self->_rightVertexDistance;
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
  unint64_t v128 = v49;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double leftPrismAmount = self->_leftPrismAmount;
    double v56 = -leftPrismAmount;
    if (leftPrismAmount >= 0.0) {
      double v56 = self->_leftPrismAmount;
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
  unint64_t v127 = v54;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    double rightPrismAmount = self->_rightPrismAmount;
    double v61 = -rightPrismAmount;
    if (rightPrismAmount >= 0.0) {
      double v61 = self->_rightPrismAmount;
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
  unint64_t v126 = v59;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double leftPrismAngle = self->_leftPrismAngle;
    double v66 = -leftPrismAngle;
    if (leftPrismAngle >= 0.0) {
      double v66 = self->_leftPrismAngle;
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
  unint64_t v125 = v64;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    double rightPrismAngle = self->_rightPrismAngle;
    double v71 = -rightPrismAngle;
    if (rightPrismAngle >= 0.0) {
      double v71 = self->_rightPrismAngle;
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
  unint64_t v124 = v69;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double leftFarPupillaryDistance = self->_leftFarPupillaryDistance;
    double v76 = -leftFarPupillaryDistance;
    if (leftFarPupillaryDistance >= 0.0) {
      double v76 = self->_leftFarPupillaryDistance;
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
  unint64_t v123 = v74;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    double rightFarPupillaryDistance = self->_rightFarPupillaryDistance;
    double v81 = -rightFarPupillaryDistance;
    if (rightFarPupillaryDistance >= 0.0) {
      double v81 = self->_rightFarPupillaryDistance;
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
  unint64_t v122 = v79;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    double leftNearPupillaryDistance = self->_leftNearPupillaryDistance;
    double v86 = -leftNearPupillaryDistance;
    if (leftNearPupillaryDistance >= 0.0) {
      double v86 = self->_leftNearPupillaryDistance;
    }
    long double v87 = floor(v86 + 0.5);
    double v88 = (v86 - v87) * 1.84467441e19;
    unint64_t v84 = 2654435761u * (unint64_t)fmod(v87, 1.84467441e19);
    if (v88 >= 0.0)
    {
      if (v88 > 0.0) {
        v84 += (unint64_t)v88;
      }
    }
    else
    {
      v84 -= (unint64_t)fabs(v88);
    }
  }
  else
  {
    unint64_t v84 = 0;
  }
  unint64_t v121 = v84;
  unint64_t v133 = v24;
  unint64_t v134 = v8;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    double rightNearPupillaryDistance = self->_rightNearPupillaryDistance;
    double v92 = -rightNearPupillaryDistance;
    if (rightNearPupillaryDistance >= 0.0) {
      double v92 = self->_rightNearPupillaryDistance;
    }
    long double v93 = floor(v92 + 0.5);
    double v94 = (v92 - v93) * 1.84467441e19;
    unint64_t v90 = 2654435761u * (unint64_t)fmod(v93, 1.84467441e19);
    unint64_t v89 = v9;
    if (v94 >= 0.0)
    {
      if (v94 > 0.0) {
        v90 += (unint64_t)v94;
      }
    }
    else
    {
      v90 -= (unint64_t)fabs(v94);
    }
  }
  else
  {
    unint64_t v89 = v9;
    unint64_t v90 = 0;
  }
  unint64_t v132 = v29;
  NSUInteger v120 = [(NSString *)self->_glassesDescription hash];
  $F833AA3FAF368E1CC47BE03942224269 v95 = self->_has;
  if ((*(unsigned char *)&v95 & 4) != 0)
  {
    double leftBaseCurve = self->_leftBaseCurve;
    double v98 = -leftBaseCurve;
    if (leftBaseCurve >= 0.0) {
      double v98 = self->_leftBaseCurve;
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
  if ((*(_WORD *)&v95 & 0x4000) != 0)
  {
    double rightBaseCurve = self->_rightBaseCurve;
    double v103 = -rightBaseCurve;
    if (rightBaseCurve >= 0.0) {
      double v103 = self->_rightBaseCurve;
    }
    long double v104 = floor(v103 + 0.5);
    double v105 = (v103 - v104) * 1.84467441e19;
    unint64_t v101 = 2654435761u * (unint64_t)fmod(v104, 1.84467441e19);
    if (v105 >= 0.0)
    {
      if (v105 > 0.0) {
        v101 += (unint64_t)v105;
      }
    }
    else
    {
      v101 -= (unint64_t)fabs(v105);
    }
  }
  else
  {
    unint64_t v101 = 0;
  }
  unint64_t v106 = v14;
  if ((*(unsigned char *)&v95 & 8) != 0)
  {
    double leftContactDiameter = self->_leftContactDiameter;
    double v109 = -leftContactDiameter;
    if (leftContactDiameter >= 0.0) {
      double v109 = self->_leftContactDiameter;
    }
    long double v110 = floor(v109 + 0.5);
    double v111 = (v109 - v110) * 1.84467441e19;
    unint64_t v107 = 2654435761u * (unint64_t)fmod(v110, 1.84467441e19);
    if (v111 >= 0.0)
    {
      if (v111 > 0.0) {
        v107 += (unint64_t)v111;
      }
    }
    else
    {
      v107 -= (unint64_t)fabs(v111);
    }
  }
  else
  {
    unint64_t v107 = 0;
  }
  if ((*(_WORD *)&v95 & 0x8000) != 0)
  {
    double rightContactDiameter = self->_rightContactDiameter;
    double v114 = -rightContactDiameter;
    if (rightContactDiameter >= 0.0) {
      double v114 = self->_rightContactDiameter;
    }
    long double v115 = floor(v114 + 0.5);
    double v116 = (v114 - v115) * 1.84467441e19;
    unint64_t v112 = 2654435761u * (unint64_t)fmod(v115, 1.84467441e19);
    if (v116 >= 0.0)
    {
      if (v116 > 0.0) {
        v112 += (unint64_t)v116;
      }
    }
    else
    {
      v112 -= (unint64_t)fabs(v116);
    }
  }
  else
  {
    unint64_t v112 = 0;
  }
  unint64_t v117 = v135 ^ v136 ^ v134 ^ v89 ^ v106 ^ v19 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v90 ^ v120 ^ v96;
  NSUInteger v118 = v101 ^ v107 ^ v112 ^ [(NSString *)self->_brand hash];
  return v117 ^ v118 ^ [(HDCodableVerifiableData *)self->_verifiableData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 26);
  id v11 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableVisionSample setSample:](self, "setSample:");
  }
  id v4 = v11;
LABEL_7:
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x800) != 0)
  {
    self->_prescriptionType = *((void *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
    int v7 = *((_DWORD *)v4 + 56);
    if ((v7 & 0x200) == 0)
    {
LABEL_9:
      if ((v7 & 0x200000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_41;
    }
  }
  else if ((v7 & 0x200) == 0)
  {
    goto LABEL_9;
  }
  self->_double leftSphere = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x200000) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double rightSphere = *((double *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_double leftCylinder = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x10000) == 0)
  {
LABEL_12:
    if ((v7 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_double rightCylinder = *((double *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 2) == 0)
  {
LABEL_13:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_double leftAxis = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x2000) == 0)
  {
LABEL_14:
    if ((v7 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_double rightAxis = *((double *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 1) == 0)
  {
LABEL_15:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_double leftAddPower = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x1000) == 0)
  {
LABEL_16:
    if ((v7 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_double rightAddPower = *((double *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x400) == 0)
  {
LABEL_17:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_double leftVertexDistance = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x400000) == 0)
  {
LABEL_18:
    if ((v7 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_double rightVertexDistance = *((double *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x80) == 0)
  {
LABEL_19:
    if ((v7 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_double leftPrismAmount = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x80000) == 0)
  {
LABEL_20:
    if ((v7 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_double rightPrismAmount = *((double *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x100) == 0)
  {
LABEL_21:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_double leftPrismAngle = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x100000) == 0)
  {
LABEL_22:
    if ((v7 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_double rightPrismAngle = *((double *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x20) == 0)
  {
LABEL_23:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_double leftFarPupillaryDistance = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x20000) == 0)
  {
LABEL_24:
    if ((v7 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_double rightFarPupillaryDistance = *((double *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x40) == 0)
  {
LABEL_25:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_56:
  self->_double leftNearPupillaryDistance = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v4 + 56) & 0x40000) != 0)
  {
LABEL_26:
    self->_double rightNearPupillaryDistance = *((double *)v4 + 19);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
LABEL_27:
  if (*((void *)v4 + 25))
  {
    -[HDCodableVisionSample setGlassesDescription:](self, "setGlassesDescription:");
    id v4 = v11;
  }
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 4) != 0)
  {
    self->_double leftBaseCurve = *((double *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
    int v8 = *((_DWORD *)v4 + 56);
    if ((v8 & 0x4000) == 0)
    {
LABEL_31:
      if ((v8 & 8) == 0) {
        goto LABEL_32;
      }
      goto LABEL_60;
    }
  }
  else if ((v8 & 0x4000) == 0)
  {
    goto LABEL_31;
  }
  self->_double rightBaseCurve = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 8) == 0)
  {
LABEL_32:
    if ((v8 & 0x8000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_60:
  self->_double leftContactDiameter = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)v4 + 56) & 0x8000) != 0)
  {
LABEL_33:
    self->_double rightContactDiameter = *((double *)v4 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_34:
  if (*((void *)v4 + 24))
  {
    -[HDCodableVisionSample setBrand:](self, "setBrand:");
    id v4 = v11;
  }
  verifiableData = self->_verifiableData;
  uint64_t v10 = *((void *)v4 + 27);
  if (verifiableData)
  {
    if (!v10) {
      goto LABEL_65;
    }
    -[HDCodableVerifiableData mergeFrom:](verifiableData, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_65;
    }
    -[HDCodableVisionSample setVerifiableData:](self, "setVerifiableData:");
  }
  id v4 = v11;
LABEL_65:
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)prescriptionType
{
  return self->_prescriptionType;
}

- (double)leftSphere
{
  return self->_leftSphere;
}

- (double)rightSphere
{
  return self->_rightSphere;
}

- (double)leftCylinder
{
  return self->_leftCylinder;
}

- (double)rightCylinder
{
  return self->_rightCylinder;
}

- (double)leftAxis
{
  return self->_leftAxis;
}

- (double)rightAxis
{
  return self->_rightAxis;
}

- (double)leftAddPower
{
  return self->_leftAddPower;
}

- (double)rightAddPower
{
  return self->_rightAddPower;
}

- (double)leftVertexDistance
{
  return self->_leftVertexDistance;
}

- (double)rightVertexDistance
{
  return self->_rightVertexDistance;
}

- (double)leftPrismAmount
{
  return self->_leftPrismAmount;
}

- (double)rightPrismAmount
{
  return self->_rightPrismAmount;
}

- (double)leftPrismAngle
{
  return self->_leftPrismAngle;
}

- (double)rightPrismAngle
{
  return self->_rightPrismAngle;
}

- (double)leftFarPupillaryDistance
{
  return self->_leftFarPupillaryDistance;
}

- (double)rightFarPupillaryDistance
{
  return self->_rightFarPupillaryDistance;
}

- (double)leftNearPupillaryDistance
{
  return self->_leftNearPupillaryDistance;
}

- (double)rightNearPupillaryDistance
{
  return self->_rightNearPupillaryDistance;
}

- (NSString)glassesDescription
{
  return self->_glassesDescription;
}

- (void)setGlassesDescription:(id)a3
{
}

- (double)leftBaseCurve
{
  return self->_leftBaseCurve;
}

- (double)rightBaseCurve
{
  return self->_rightBaseCurve;
}

- (double)leftContactDiameter
{
  return self->_leftContactDiameter;
}

- (double)rightContactDiameter
{
  return self->_rightContactDiameter;
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
}

- (HDCodableVerifiableData)verifiableData
{
  return self->_verifiableData;
}

- (void)setVerifiableData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiableData, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_glassesDescription, 0);

  objc_storeStrong((id *)&self->_brand, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(HDCodableVisionSample *)self sample];
    int v6 = [v5 applyToObject:v4];

    if (v6)
    {
      int64_t v7 = [(HDCodableVisionSample *)self prescriptionType];
      [v4 _setPrescriptionType:v7];
      if ([(HDCodableVisionSample *)self hasLeftSphere])
      {
        int v8 = (void *)MEMORY[0x1E4F2B370];
        unint64_t v9 = [MEMORY[0x1E4F2B618] diopterUnit];
        [(HDCodableVisionSample *)self leftSphere];
        uint64_t v10 = objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9);
      }
      else
      {
        uint64_t v10 = 0;
      }
      if ([(HDCodableVisionSample *)self hasRightSphere])
      {
        long double v12 = (void *)MEMORY[0x1E4F2B370];
        double v13 = [MEMORY[0x1E4F2B618] diopterUnit];
        [(HDCodableVisionSample *)self rightSphere];
        uint64_t v14 = objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13);
      }
      else
      {
        uint64_t v14 = 0;
      }
      if ([(HDCodableVisionSample *)self hasLeftCylinder])
      {
        v15 = (void *)MEMORY[0x1E4F2B370];
        double v16 = [MEMORY[0x1E4F2B618] diopterUnit];
        [(HDCodableVisionSample *)self leftCylinder];
        unint64_t v90 = objc_msgSend(v15, "quantityWithUnit:doubleValue:", v16);
      }
      else
      {
        unint64_t v90 = 0;
      }
      if ([(HDCodableVisionSample *)self hasRightCylinder])
      {
        long double v17 = (void *)MEMORY[0x1E4F2B370];
        double v18 = [MEMORY[0x1E4F2B618] diopterUnit];
        [(HDCodableVisionSample *)self rightCylinder];
        unint64_t v89 = objc_msgSend(v17, "quantityWithUnit:doubleValue:", v18);
      }
      else
      {
        unint64_t v89 = 0;
      }
      if ([(HDCodableVisionSample *)self hasLeftAxis])
      {
        unint64_t v19 = (void *)MEMORY[0x1E4F2B370];
        v20 = [MEMORY[0x1E4F2B618] radianAngleUnit];
        [(HDCodableVisionSample *)self leftAxis];
        double v88 = objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);
      }
      else
      {
        double v88 = 0;
      }
      if ([(HDCodableVisionSample *)self hasRightAxis])
      {
        double v21 = (void *)MEMORY[0x1E4F2B370];
        long double v22 = [MEMORY[0x1E4F2B618] radianAngleUnit];
        [(HDCodableVisionSample *)self rightAxis];
        double v23 = objc_msgSend(v21, "quantityWithUnit:doubleValue:", v22);
      }
      else
      {
        double v23 = 0;
      }
      if ([(HDCodableVisionSample *)self hasLeftAddPower])
      {
        unint64_t v24 = (void *)MEMORY[0x1E4F2B370];
        v25 = [MEMORY[0x1E4F2B618] diopterUnit];
        [(HDCodableVisionSample *)self leftAddPower];
        double v26 = objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25);
      }
      else
      {
        double v26 = 0;
      }
      if ([(HDCodableVisionSample *)self hasRightAddPower])
      {
        long double v27 = (void *)MEMORY[0x1E4F2B370];
        double v28 = [MEMORY[0x1E4F2B618] diopterUnit];
        [(HDCodableVisionSample *)self rightAddPower];
        unint64_t v29 = objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);
      }
      else
      {
        unint64_t v29 = 0;
      }
      if (!(v10 | v14)) {
        goto LABEL_88;
      }
      if (v7 == 2)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = v4;
          if ([(HDCodableVisionSample *)self hasLeftBaseCurve])
          {
            unint64_t v34 = (void *)MEMORY[0x1E4F2B370];
            v35 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self leftBaseCurve];
            uint64_t v83 = objc_msgSend(v34, "quantityWithUnit:doubleValue:", v35);
          }
          else
          {
            uint64_t v83 = 0;
          }
          if ([(HDCodableVisionSample *)self hasRightBaseCurve])
          {
            double v38 = (void *)MEMORY[0x1E4F2B370];
            unint64_t v39 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self rightBaseCurve];
            long double v87 = objc_msgSend(v38, "quantityWithUnit:doubleValue:", v39);
          }
          else
          {
            long double v87 = 0;
          }
          if ([(HDCodableVisionSample *)self hasLeftContactDiameter])
          {
            long double v42 = (void *)MEMORY[0x1E4F2B370];
            double v43 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self leftContactDiameter];
            double v86 = objc_msgSend(v42, "quantityWithUnit:doubleValue:", v43);
          }
          else
          {
            double v86 = 0;
          }
          if ([(HDCodableVisionSample *)self hasRightContactDiameter])
          {
            double v46 = (void *)MEMORY[0x1E4F2B370];
            long double v47 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self rightContactDiameter];
            v85 = objc_msgSend(v46, "quantityWithUnit:doubleValue:", v47);
          }
          else
          {
            v85 = 0;
          }
          if (v10)
          {
            v50 = (void *)[objc_alloc(MEMORY[0x1E4F2AE30]) initWithSphere:v10 cylinder:v90 axis:v88 addPower:v26 baseCurve:v83 diameter:v86];
            [v33 _setLeftEyeSpecification:v50];
          }
          if (v14)
          {
            double v51 = (void *)[objc_alloc(MEMORY[0x1E4F2AE30]) initWithSphere:v14 cylinder:v89 axis:v23 addPower:v29 baseCurve:v87 diameter:v85];
            [v33 _setRightEyeSpecification:v51];
          }
          long double v52 = [(HDCodableVisionSample *)self brand];
          [v33 _setBrand:v52];
          long double v32 = (void *)v83;
          goto LABEL_87;
        }
      }
      else
      {
        if (v7 != 1)
        {
LABEL_88:
          BOOL v11 = 1;
          goto LABEL_89;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v82 = v4;
          if ([(HDCodableVisionSample *)self hasLeftVertexDistance])
          {
            v30 = (void *)MEMORY[0x1E4F2B370];
            double v31 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self leftVertexDistance];
            long double v32 = objc_msgSend(v30, "quantityWithUnit:doubleValue:", v31);
          }
          else
          {
            long double v32 = 0;
          }
          if ([(HDCodableVisionSample *)self hasRightVertexDistance])
          {
            double v36 = (void *)MEMORY[0x1E4F2B370];
            long double v37 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self rightVertexDistance];
            long double v87 = objc_msgSend(v36, "quantityWithUnit:doubleValue:", v37);
          }
          else
          {
            long double v87 = 0;
          }
          if ([(HDCodableVisionSample *)self hasLeftFarPupillaryDistance])
          {
            v40 = (void *)MEMORY[0x1E4F2B370];
            double v41 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self leftFarPupillaryDistance];
            double v86 = objc_msgSend(v40, "quantityWithUnit:doubleValue:", v41);
          }
          else
          {
            double v86 = 0;
          }
          if ([(HDCodableVisionSample *)self hasRightFarPupillaryDistance])
          {
            unint64_t v44 = (void *)MEMORY[0x1E4F2B370];
            v45 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self rightFarPupillaryDistance];
            v85 = objc_msgSend(v44, "quantityWithUnit:doubleValue:", v45);
          }
          else
          {
            v85 = 0;
          }
          if ([(HDCodableVisionSample *)self hasLeftNearPupillaryDistance])
          {
            double v48 = (void *)MEMORY[0x1E4F2B370];
            unint64_t v49 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self leftNearPupillaryDistance];
            uint64_t v81 = objc_msgSend(v48, "quantityWithUnit:doubleValue:", v49);
          }
          else
          {
            uint64_t v81 = 0;
          }
          if ([(HDCodableVisionSample *)self hasRightNearPupillaryDistance])
          {
            double v53 = (void *)MEMORY[0x1E4F2B370];
            unint64_t v54 = [MEMORY[0x1E4F2B618] meterUnit];
            [(HDCodableVisionSample *)self rightNearPupillaryDistance];
            v80 = objc_msgSend(v53, "quantityWithUnit:doubleValue:", v54);
          }
          else
          {
            v80 = 0;
          }
          unint64_t v84 = v32;
          if ([(HDCodableVisionSample *)self hasLeftPrismAmount]
            && [(HDCodableVisionSample *)self hasLeftPrismAngle])
          {
            id v78 = objc_alloc(MEMORY[0x1E4F2B708]);
            v55 = (void *)MEMORY[0x1E4F2B370];
            v75 = [MEMORY[0x1E4F2B618] prismDiopterUnit];
            [(HDCodableVisionSample *)self leftPrismAmount];
            double v56 = objc_msgSend(v55, "quantityWithUnit:doubleValue:", v75);
            long double v57 = (void *)MEMORY[0x1E4F2B370];
            double v58 = [MEMORY[0x1E4F2B618] radianAngleUnit];
            [(HDCodableVisionSample *)self leftPrismAngle];
            unint64_t v59 = objc_msgSend(v57, "quantityWithUnit:doubleValue:", v58);
            unint64_t v79 = (void *)[v78 initWithAmount:v56 angle:v59 eye:1];

            long double v32 = v84;
          }
          else
          {
            unint64_t v79 = 0;
          }
          if ([(HDCodableVisionSample *)self hasRightPrismAmount]
            && [(HDCodableVisionSample *)self hasRightPrismAngle])
          {
            id v76 = objc_alloc(MEMORY[0x1E4F2B708]);
            v60 = (void *)MEMORY[0x1E4F2B370];
            unint64_t v74 = [MEMORY[0x1E4F2B618] prismDiopterUnit];
            [(HDCodableVisionSample *)self rightPrismAmount];
            double v61 = objc_msgSend(v60, "quantityWithUnit:doubleValue:", v74);
            long double v62 = (void *)MEMORY[0x1E4F2B370];
            double v63 = [MEMORY[0x1E4F2B618] radianAngleUnit];
            [(HDCodableVisionSample *)self rightPrismAngle];
            unint64_t v64 = objc_msgSend(v62, "quantityWithUnit:doubleValue:", v63);
            long double v77 = (void *)[v76 initWithAmount:v61 angle:v64 eye:2];

            long double v32 = v84;
          }
          else
          {
            long double v77 = 0;
          }
          if (v10)
          {
            v65 = (void *)[objc_alloc(MEMORY[0x1E4F2B080]) initWithSphere:v10 cylinder:v90 axis:v88 addPower:v26 vertexDistance:v32 prism:v79 farPupillaryDistance:v86 nearPupillaryDistance:v81];
            [v82 _setLeftEyeSpecification:v65];
          }
          if (v14)
          {
            double v66 = (void *)[objc_alloc(MEMORY[0x1E4F2B080]) initWithSphere:v14 cylinder:v89 axis:v23 addPower:v29 vertexDistance:v87 prism:v77 farPupillaryDistance:v85 nearPupillaryDistance:v80];
            [v82 _setRightEyeSpecification:v66];
          }
          if ([(HDCodableVisionSample *)self hasGlassesDescription])
          {
            long double v67 = [v82 metadata];
            double v68 = (void *)[v67 mutableCopy];
            unint64_t v69 = v68;
            if (v68) {
              id v70 = v68;
            }
            else {
              id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            double v71 = v70;

            long double v72 = [(HDCodableVisionSample *)self glassesDescription];
            [v71 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F2A130]];

            [v82 _setMetadata:v71];
            long double v32 = v84;
          }

          long double v52 = (void *)v81;
LABEL_87:

          goto LABEL_88;
        }
      }
      BOOL v11 = 0;
LABEL_89:

      goto LABEL_90;
    }
  }
  BOOL v11 = 0;
LABEL_90:

  return v11;
}

@end