@interface SGM2HarvestBudgetStatusTransition
- (BOOL)hasFromStatus;
- (BOOL)hasToStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fromStatusAsString:(int)a3;
- (id)toStatusAsString:(int)a3;
- (int)StringAsFromStatus:(id)a3;
- (int)StringAsToStatus:(id)a3;
- (int)fromStatus;
- (int)toStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFromStatus:(int)a3;
- (void)setHasFromStatus:(BOOL)a3;
- (void)setHasToStatus:(BOOL)a3;
- (void)setToStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2HarvestBudgetStatusTransition

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_fromStatus = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_toStatus = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_fromStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_toStatus;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_fromStatus != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_toStatus != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_fromStatus;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_toStatus;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_fromStatus;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_toStatus;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2HarvestBudgetStatusTransitionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t fromStatus = self->_fromStatus;
    if (fromStatus >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fromStatus);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E65BB580[fromStatus];
    }
    [v3 setObject:v6 forKey:@"fromStatus"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t toStatus = self->_toStatus;
    if (toStatus >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_toStatus);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E65BB580[toStatus];
    }
    [v3 setObject:v8 forKey:@"toStatus"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2HarvestBudgetStatusTransition;
  id v4 = [(SGM2HarvestBudgetStatusTransition *)&v8 description];
  BOOL v5 = [(SGM2HarvestBudgetStatusTransition *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsToStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusPower"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusBattery"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusExhaustedNumberOfOperations"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusExhaustedElapsedSeconds"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusExhaustedDuet"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)toStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65BB580[a3];
  }
  return v3;
}

- (BOOL)hasToStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasToStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setToStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t toStatus = a3;
}

- (int)toStatus
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_toStatus;
  }
  else {
    return 0;
  }
}

- (int)StringAsFromStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusPower"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusBattery"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusExhaustedNumberOfOperations"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusExhaustedElapsedSeconds"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGM2HarvestBudgetStatusExhaustedDuet"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)fromStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65BB580[a3];
  }
  return v3;
}

- (BOOL)hasFromStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasFromStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setFromStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t fromStatus = a3;
}

- (int)fromStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_fromStatus;
  }
  else {
    return 0;
  }
}

@end