@interface CLPBaroCalibrationIndication
- (BOOL)hasIsCalibratedBarometricAlt;
- (BOOL)hasIsMapMatched;
- (BOOL)hasIsOutdoorContext;
- (BOOL)hasMapMatchRoadType;
- (BOOL)hasOutdoorConfidence;
- (BOOL)isCalibratedBarometricAlt;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMapMatched;
- (BOOL)isOutdoorContext;
- (BOOL)readFrom:(id)a3;
- (double)outdoorConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mapMatchRoadTypeAsString:(int)a3;
- (int)StringAsMapMatchRoadType:(id)a3;
- (int)mapMatchRoadType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsCalibratedBarometricAlt:(BOOL)a3;
- (void)setHasIsMapMatched:(BOOL)a3;
- (void)setHasIsOutdoorContext:(BOOL)a3;
- (void)setHasMapMatchRoadType:(BOOL)a3;
- (void)setHasOutdoorConfidence:(BOOL)a3;
- (void)setIsCalibratedBarometricAlt:(BOOL)a3;
- (void)setIsMapMatched:(BOOL)a3;
- (void)setIsOutdoorContext:(BOOL)a3;
- (void)setMapMatchRoadType:(int)a3;
- (void)setOutdoorConfidence:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPBaroCalibrationIndication

- (void)setIsCalibratedBarometricAlt:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isCalibratedBarometricAlt = a3;
}

- (void)setHasIsCalibratedBarometricAlt:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsCalibratedBarometricAlt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsMapMatched:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isMapMatched = a3;
}

- (void)setHasIsMapMatched:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsMapMatched
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsOutdoorContext:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isOutdoorContext = a3;
}

- (void)setHasIsOutdoorContext:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsOutdoorContext
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setOutdoorConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_outdoorConfidence = a3;
}

- (void)setHasOutdoorConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutdoorConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)mapMatchRoadType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_mapMatchRoadType;
  }
  else {
    return 0;
  }
}

- (void)setMapMatchRoadType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mapMatchRoadType = a3;
}

- (void)setHasMapMatchRoadType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMapMatchRoadType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)mapMatchRoadTypeAsString:(int)a3
{
  if (a3 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C35D88[a3];
  }

  return v3;
}

- (int)StringAsMapMatchRoadType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PartOfMotorway"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PartOfMultiCarriageWayNotMotorway"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ParOfSingleCarriageWayDefault"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PartOfRoundabout"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PartOfAnEtaParkingPlace"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PartOfAnEtaParkingGarageBuilding"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PartOfEtaUnstructuredTrafficSquare"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PartOfSlipRoad"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PartOfServiceRoad"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EntraceExitToFormCarPark"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PartOfPedestrianZone"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PartOfWalkWay"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SpecialTrafficFigures"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FowEtaGallery"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FowStairs"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RoadForAuthorities"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FowConnector"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FowCulDeSac"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPBaroCalibrationIndication;
  int v4 = [(CLPBaroCalibrationIndication *)&v8 description];
  v5 = [(CLPBaroCalibrationIndication *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_isCalibratedBarometricAlt];
    [v3 setObject:v5 forKey:@"isCalibratedBarometricAlt"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithBool:self->_isMapMatched];
  [v3 setObject:v6 forKey:@"isMapMatched"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithDouble:self->_outdoorConfidence];
    [v3 setObject:v8 forKey:@"outdoorConfidence"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_15;
    }
LABEL_11:
    uint64_t mapMatchRoadType = self->_mapMatchRoadType;
    if (mapMatchRoadType >= 0x13)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mapMatchRoadType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E6C35D88[mapMatchRoadType];
    }
    [v3 setObject:v10 forKey:@"mapMatchRoadType"];

    goto LABEL_15;
  }
LABEL_9:
  v7 = [NSNumber numberWithBool:self->_isOutdoorContext];
  [v3 setObject:v7 forKey:@"isOutdoorContext"];

  char has = (char)self->_has;
  if (has) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_15:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPBaroCalibrationIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[20] = self->_isCalibratedBarometricAlt;
    v4[24] |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[21] = self->_isMapMatched;
  v4[24] |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[22] = self->_isOutdoorContext;
  v4[24] |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((void *)v4 + 1) = *(void *)&self->_outdoorConfidence;
  v4[24] |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 4) = self->_mapMatchRoadType;
    v4[24] |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)result + 20) = self->_isCalibratedBarometricAlt;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 21) = self->_isMapMatched;
  *((unsigned char *)result + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 22) = self->_isOutdoorContext;
  *((unsigned char *)result + 24) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 1) = *(void *)&self->_outdoorConfidence;
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 4) = self->_mapMatchRoadType;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_35;
    }
    if (self->_isCalibratedBarometricAlt)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0) {
      goto LABEL_35;
    }
    if (self->_isMapMatched)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x10) != 0)
    {
      if (self->_isOutdoorContext)
      {
        if (!*((unsigned char *)v4 + 22)) {
          goto LABEL_35;
        }
        goto LABEL_26;
      }
      if (!*((unsigned char *)v4 + 22)) {
        goto LABEL_26;
      }
    }
LABEL_35:
    BOOL v5 = 0;
    goto LABEL_36;
  }
  if ((*((unsigned char *)v4 + 24) & 0x10) != 0) {
    goto LABEL_35;
  }
LABEL_26:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_outdoorConfidence != *((double *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_35;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_mapMatchRoadType != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
    BOOL v5 = 1;
  }
LABEL_36:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isCalibratedBarometricAlt;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isMapMatched;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_isOutdoorContext;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double outdoorConfidence = self->_outdoorConfidence;
  double v8 = -outdoorConfidence;
  if (outdoorConfidence >= 0.0) {
    double v8 = self->_outdoorConfidence;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_mapMatchRoadType;
  }
  else {
    uint64_t v12 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_isCalibratedBarometricAlt = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isMapMatched = *((unsigned char *)v4 + 21);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_isOutdoorContext = *((unsigned char *)v4 + 22);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_double outdoorConfidence = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_6:
    self->_uint64_t mapMatchRoadType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (BOOL)isCalibratedBarometricAlt
{
  return self->_isCalibratedBarometricAlt;
}

- (BOOL)isMapMatched
{
  return self->_isMapMatched;
}

- (BOOL)isOutdoorContext
{
  return self->_isOutdoorContext;
}

- (double)outdoorConfidence
{
  return self->_outdoorConfidence;
}

@end