@interface ATXPBActionCriteria
- (BOOL)hasEndDate;
- (BOOL)hasIsLockScreenEligible;
- (BOOL)hasPredicate;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLockScreenEligible;
- (BOOL)readFrom:(id)a3;
- (NSData)predicate;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasIsLockScreenEligible:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setIsLockScreenEligible:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBActionCriteria

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsLockScreenEligible:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isLockScreenEligible = a3;
}

- (void)setHasIsLockScreenEligible:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsLockScreenEligible
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasPredicate
{
  return self->_predicate != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBActionCriteria;
  v4 = [(ATXPBActionCriteria *)&v8 description];
  v5 = [(ATXPBActionCriteria *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_startDate];
    [v3 setObject:v8 forKey:@"startDate"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithDouble:self->_endDate];
  [v3 setObject:v9 forKey:@"endDate"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithBool:self->_isLockScreenEligible];
    [v3 setObject:v5 forKey:@"isLockScreenEligible"];
  }
LABEL_5:
  predicate = self->_predicate;
  if (predicate) {
    [v3 setObject:predicate forKey:@"predicate"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActionCriteriaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_predicate)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_endDate;
  *((unsigned char *)v4 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 32) = self->_isLockScreenEligible;
    *((unsigned char *)v4 + 36) |= 4u;
  }
LABEL_5:
  if (self->_predicate)
  {
    id v6 = v4;
    objc_msgSend(v4, "setPredicate:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 8) = self->_endDate;
    *(unsigned char *)(v5 + 36) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 16) = self->_startDate;
  *(unsigned char *)(v5 + 36) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 32) = self->_isLockScreenEligible;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_predicate copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_startDate != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_endDate != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0) {
      goto LABEL_22;
    }
LABEL_16:
    char v5 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 36) & 4) == 0) {
    goto LABEL_16;
  }
  if (!self->_isLockScreenEligible)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_16;
  }
LABEL_22:
  predicate = self->_predicate;
  if ((unint64_t)predicate | *((void *)v4 + 3)) {
    char v5 = -[NSData isEqual:](predicate, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double startDate = self->_startDate;
    double v6 = -startDate;
    if (startDate >= 0.0) {
      double v6 = self->_startDate;
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
  if (has)
  {
    double endDate = self->_endDate;
    double v11 = -endDate;
    if (endDate >= 0.0) {
      double v11 = self->_endDate;
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
  if ((has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_isLockScreenEligible;
  }
  else {
    uint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14 ^ [(NSData *)self->_predicate hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_double startDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double endDate = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_4:
    self->_isLockScreenEligible = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[ATXPBActionCriteria setPredicate:](self, "setPredicate:");
    id v4 = v6;
  }
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (BOOL)isLockScreenEligible
{
  return self->_isLockScreenEligible;
}

- (NSData)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end