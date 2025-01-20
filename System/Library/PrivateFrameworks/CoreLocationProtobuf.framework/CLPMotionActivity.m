@interface CLPMotionActivity
- (BOOL)hasConfidence;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsConfidence:(id)a3;
- (int)StringAsType:(id)a3;
- (int)confidence;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPMotionActivity

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_type != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_confidence != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_confidence;
  return v3 ^ v2;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 > 61)
  {
    if (a3 > 2149)
    {
      if (a3 > 17149)
      {
        if (a3 > 19149)
        {
          if (a3 == 19150)
          {
            id v4 = @"TypeDownhillSkiing";
          }
          else
          {
            if (a3 != 90603) {
              goto LABEL_125;
            }
            id v4 = @"TypeOutdoorWheelchair";
          }
        }
        else if (a3 == 17150)
        {
          id v4 = @"TypeIndoorWalking";
        }
        else
        {
          if (a3 != 18240) {
            goto LABEL_125;
          }
          id v4 = @"TypeSwimming";
        }
      }
      else if (a3 > 11804)
      {
        if (a3 == 11805)
        {
          id v4 = @"TypePushingWheelchair";
        }
        else
        {
          if (a3 != 12150) {
            goto LABEL_125;
          }
          id v4 = @"TypeIndoorRunning";
        }
      }
      else if (a3 == 2150)
      {
        id v4 = @"TypeYoga";
      }
      else
      {
        if (a3 != 3015) {
          goto LABEL_125;
        }
        id v4 = @"TypeDancing";
      }
    }
    else if (a3 > 2047)
    {
      if (a3 > 2064)
      {
        if (a3 == 2065)
        {
          id v4 = @"TypeStairClimbing";
        }
        else
        {
          if (a3 != 2071) {
            goto LABEL_125;
          }
          id v4 = @"TypeRowing";
        }
      }
      else if (a3 == 2048)
      {
        id v4 = @"TypeElliptical";
      }
      else
      {
        if (a3 != 2061) {
          goto LABEL_125;
        }
        id v4 = @"TypeCrossTraining";
      }
    }
    else if (a3 > 2009)
    {
      if (a3 == 2010)
      {
        id v4 = @"TypeStationaryCycling";
      }
      else
      {
        if (a3 != 2020) {
          goto LABEL_125;
        }
        id v4 = @"TypeCalisthenics";
      }
    }
    else if (a3 == 62)
    {
      id v4 = @"TypeWorkout";
    }
    else
    {
      if (a3 != 100) {
        goto LABEL_125;
      }
      id v4 = @"TypeCyclingLeg";
    }
  }
  else
  {
    if (a3 <= 40)
    {
      id v4 = @"TypeUnknown";
      switch(a3)
      {
        case 0:
          goto LABEL_126;
        case 1:
          id v4 = @"TypeFrozen";
          break;
        case 2:
          id v4 = @"TypeStatic";
          break;
        case 3:
          id v4 = @"TypeMoving";
          break;
        case 4:
          id v4 = @"TypeWalking";
          break;
        case 5:
          id v4 = @"TypeDriving";
          break;
        case 6:
          id v4 = @"TypeCycling";
          break;
        case 7:
          id v4 = @"TypeSemiStationary";
          break;
        case 8:
          id v4 = @"TypeRunning";
          break;
        case 9:
          id v4 = @"TypeMovingCoarse";
          break;
        case 10:
          id v4 = @"TypeInVehicleFrozen";
          break;
        case 11:
          id v4 = @"TypeInVehicleStatic";
          break;
        default:
          goto LABEL_125;
      }
      return v4;
    }
    if (a3 > 55)
    {
      if (a3 == 56)
      {
        id v4 = @"TypeDrivingOther";
      }
      else
      {
        if (a3 != 61) {
          goto LABEL_125;
        }
        id v4 = @"TypeMachineWorkout";
      }
    }
    else
    {
      if (a3 != 41)
      {
        if (a3 == 52)
        {
          id v4 = @"TypeVehicularInHand";
          return v4;
        }
LABEL_125:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_126:
        return v4;
      }
      id v4 = @"TypeWalkingSlow";
    }
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TypeFrozen"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TypeStatic"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TypeMoving"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TypeWalking"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TypeDriving"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TypeCycling"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TypeSemiStationary"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TypeRunning"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TypeMovingCoarse"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"TypeInVehicleFrozen"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TypeInVehicleStatic"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TypeWalkingSlow"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"TypeVehicularInHand"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"TypeDrivingOther"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"TypeMachineWorkout"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"TypeWorkout"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"TypeCyclingLeg"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"TypeStationaryCycling"])
  {
    int v4 = 2010;
  }
  else if ([v3 isEqualToString:@"TypeCalisthenics"])
  {
    int v4 = 2020;
  }
  else if ([v3 isEqualToString:@"TypeElliptical"])
  {
    int v4 = 2048;
  }
  else if ([v3 isEqualToString:@"TypeCrossTraining"])
  {
    int v4 = 2061;
  }
  else if ([v3 isEqualToString:@"TypeStairClimbing"])
  {
    int v4 = 2065;
  }
  else if ([v3 isEqualToString:@"TypeRowing"])
  {
    int v4 = 2071;
  }
  else if ([v3 isEqualToString:@"TypeYoga"])
  {
    int v4 = 2150;
  }
  else if ([v3 isEqualToString:@"TypeDancing"])
  {
    int v4 = 3015;
  }
  else if ([v3 isEqualToString:@"TypeIndoorRunning"])
  {
    int v4 = 12150;
  }
  else if ([v3 isEqualToString:@"TypeIndoorWalking"])
  {
    int v4 = 17150;
  }
  else if ([v3 isEqualToString:@"TypeSwimming"])
  {
    int v4 = 18240;
  }
  else if ([v3 isEqualToString:@"TypePushingWheelchair"])
  {
    int v4 = 11805;
  }
  else if ([v3 isEqualToString:@"TypeOutdoorWheelchair"])
  {
    int v4 = 90603;
  }
  else if ([v3 isEqualToString:@"TypeDownhillSkiing"])
  {
    int v4 = 19150;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)confidence
{
  if (*(unsigned char *)&self->_has) {
    return self->_confidence;
  }
  else {
    return 0;
  }
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6C35FF0[a3];
  }

  return v3;
}

- (int)StringAsConfidence:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ConfidenceLow"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ConfidenceMedium"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConfidenceHigh"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)CLPMotionActivity;
  int v4 = [(CLPMotionActivity *)&v8 description];
  BOOL v5 = [(CLPMotionActivity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int type = self->_type;
    if (type <= 61)
    {
      if (type <= 40)
      {
        v6 = @"TypeUnknown";
        switch(type)
        {
          case 0:
            goto LABEL_65;
          case 1:
            v6 = @"TypeFrozen";
            break;
          case 2:
            v6 = @"TypeStatic";
            break;
          case 3:
            v6 = @"TypeMoving";
            break;
          case 4:
            v6 = @"TypeWalking";
            break;
          case 5:
            v6 = @"TypeDriving";
            break;
          case 6:
            v6 = @"TypeCycling";
            break;
          case 7:
            v6 = @"TypeSemiStationary";
            break;
          case 8:
            v6 = @"TypeRunning";
            break;
          case 9:
            v6 = @"TypeMovingCoarse";
            break;
          case 10:
            v6 = @"TypeInVehicleFrozen";
            break;
          case 11:
            v6 = @"TypeInVehicleStatic";
            break;
          default:
            goto LABEL_64;
        }
        goto LABEL_65;
      }
      if (type > 55)
      {
        if (type == 56)
        {
          v6 = @"TypeDrivingOther";
          goto LABEL_65;
        }
        if (type == 61)
        {
          v6 = @"TypeMachineWorkout";
          goto LABEL_65;
        }
      }
      else
      {
        if (type == 41)
        {
          v6 = @"TypeWalkingSlow";
          goto LABEL_65;
        }
        if (type == 52)
        {
          v6 = @"TypeVehicularInHand";
          goto LABEL_65;
        }
      }
LABEL_64:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    }
    if (type > 2149)
    {
      if (type > 17149)
      {
        if (type > 19149)
        {
          if (type == 19150)
          {
            v6 = @"TypeDownhillSkiing";
            goto LABEL_65;
          }
          if (type == 90603)
          {
            v6 = @"TypeOutdoorWheelchair";
            goto LABEL_65;
          }
        }
        else
        {
          if (type == 17150)
          {
            v6 = @"TypeIndoorWalking";
            goto LABEL_65;
          }
          if (type == 18240)
          {
            v6 = @"TypeSwimming";
            goto LABEL_65;
          }
        }
        goto LABEL_64;
      }
      if (type > 11804)
      {
        if (type == 11805)
        {
          v6 = @"TypePushingWheelchair";
          goto LABEL_65;
        }
        if (type == 12150)
        {
          v6 = @"TypeIndoorRunning";
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      if (type == 2150)
      {
        v6 = @"TypeYoga";
        goto LABEL_65;
      }
      if (type != 3015) {
        goto LABEL_64;
      }
      v6 = @"TypeDancing";
    }
    else
    {
      if (type > 2047)
      {
        if (type > 2064)
        {
          if (type == 2065)
          {
            v6 = @"TypeStairClimbing";
            goto LABEL_65;
          }
          if (type == 2071)
          {
            v6 = @"TypeRowing";
            goto LABEL_65;
          }
        }
        else
        {
          if (type == 2048)
          {
            v6 = @"TypeElliptical";
            goto LABEL_65;
          }
          if (type == 2061)
          {
            v6 = @"TypeCrossTraining";
            goto LABEL_65;
          }
        }
        goto LABEL_64;
      }
      if (type > 2009)
      {
        if (type == 2010)
        {
          v6 = @"TypeStationaryCycling";
          goto LABEL_65;
        }
        if (type == 2020)
        {
          v6 = @"TypeCalisthenics";
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      if (type == 62)
      {
        v6 = @"TypeWorkout";
        goto LABEL_65;
      }
      if (type != 100) {
        goto LABEL_64;
      }
      v6 = @"TypeCyclingLeg";
    }
LABEL_65:
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t confidence = self->_confidence;
    if (confidence >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_confidence);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6C35FF0[confidence];
    }
    [v3 setObject:v8 forKey:@"confidence"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPMotionActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_type;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_confidence;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_type;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_confidence;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_int type = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_uint64_t confidence = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end