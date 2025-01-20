@interface ATXPBPredictionUserContext
- (BOOL)hasLastAppActionLaunch;
- (BOOL)hasLastAppLaunch;
- (BOOL)hasLastAppLaunchDate;
- (BOOL)hasLastUnlockDate;
- (BOOL)hasSecondMostRecentAppLaunch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)lastAppActionLaunch;
- (NSString)lastAppLaunch;
- (NSString)secondMostRecentAppLaunch;
- (double)lastAppLaunchDate;
- (double)lastUnlockDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLastAppLaunchDate:(BOOL)a3;
- (void)setHasLastUnlockDate:(BOOL)a3;
- (void)setLastAppActionLaunch:(id)a3;
- (void)setLastAppLaunch:(id)a3;
- (void)setLastAppLaunchDate:(double)a3;
- (void)setLastUnlockDate:(double)a3;
- (void)setSecondMostRecentAppLaunch:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPredictionUserContext

- (void)setLastUnlockDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastUnlockDate = a3;
}

- (void)setHasLastUnlockDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastUnlockDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasLastAppLaunch
{
  return self->_lastAppLaunch != 0;
}

- (void)setLastAppLaunchDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastAppLaunchDate = a3;
}

- (void)setHasLastAppLaunchDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastAppLaunchDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSecondMostRecentAppLaunch
{
  return self->_secondMostRecentAppLaunch != 0;
}

- (BOOL)hasLastAppActionLaunch
{
  return self->_lastAppActionLaunch != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionUserContext;
  v4 = [(ATXPBPredictionUserContext *)&v8 description];
  v5 = [(ATXPBPredictionUserContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithDouble:self->_lastUnlockDate];
    [v3 setObject:v4 forKey:@"lastUnlockDate"];
  }
  lastAppLaunch = self->_lastAppLaunch;
  if (lastAppLaunch) {
    [v3 setObject:lastAppLaunch forKey:@"lastAppLaunch"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_lastAppLaunchDate];
    [v3 setObject:v6 forKey:@"lastAppLaunchDate"];
  }
  secondMostRecentAppLaunch = self->_secondMostRecentAppLaunch;
  if (secondMostRecentAppLaunch) {
    [v3 setObject:secondMostRecentAppLaunch forKey:@"secondMostRecentAppLaunch"];
  }
  lastAppActionLaunch = self->_lastAppActionLaunch;
  if (lastAppActionLaunch) {
    [v3 setObject:lastAppActionLaunch forKey:@"lastAppActionLaunch"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionUserContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_lastAppLaunch)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_secondMostRecentAppLaunch)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_lastAppActionLaunch)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = *(void *)&self->_lastUnlockDate;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  id v5 = v4;
  if (self->_lastAppLaunch)
  {
    objc_msgSend(v4, "setLastAppLaunch:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_lastAppLaunchDate;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_secondMostRecentAppLaunch)
  {
    objc_msgSend(v5, "setSecondMostRecentAppLaunch:");
    id v4 = v5;
  }
  if (self->_lastAppActionLaunch)
  {
    objc_msgSend(v5, "setLastAppActionLaunch:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUnlockDate;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_lastAppLaunch copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_lastAppLaunchDate;
    *(unsigned char *)(v6 + 48) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_secondMostRecentAppLaunch copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_lastAppActionLaunch copyWithZone:a3];
  v12 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_lastUnlockDate != *((double *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_19;
  }
  lastAppLaunch = self->_lastAppLaunch;
  if ((unint64_t)lastAppLaunch | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](lastAppLaunch, "isEqual:"))
    {
LABEL_19:
      char v9 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_lastAppLaunchDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_19;
  }
  secondMostRecentAppLaunch = self->_secondMostRecentAppLaunch;
  if ((unint64_t)secondMostRecentAppLaunch | *((void *)v4 + 5)
    && !-[NSString isEqual:](secondMostRecentAppLaunch, "isEqual:"))
  {
    goto LABEL_19;
  }
  lastAppActionLaunch = self->_lastAppActionLaunch;
  if ((unint64_t)lastAppActionLaunch | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](lastAppActionLaunch, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double lastUnlockDate = self->_lastUnlockDate;
    double v5 = -lastUnlockDate;
    if (lastUnlockDate >= 0.0) {
      double v5 = self->_lastUnlockDate;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_lastAppLaunch hash];
  if (*(unsigned char *)&self->_has)
  {
    double lastAppLaunchDate = self->_lastAppLaunchDate;
    double v11 = -lastAppLaunchDate;
    if (lastAppLaunchDate >= 0.0) {
      double v11 = self->_lastAppLaunchDate;
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
  NSUInteger v14 = v8 ^ v3 ^ v9 ^ [(NSString *)self->_secondMostRecentAppLaunch hash];
  return v14 ^ [(NSString *)self->_lastAppActionLaunch hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if (((_BYTE)v4[6] & 2) != 0)
  {
    self->_double lastUnlockDate = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  double v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[ATXPBPredictionUserContext setLastAppLaunch:](self, "setLastAppLaunch:");
    id v4 = v5;
  }
  if ((_BYTE)v4[6])
  {
    self->_double lastAppLaunchDate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXPBPredictionUserContext setSecondMostRecentAppLaunch:](self, "setSecondMostRecentAppLaunch:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXPBPredictionUserContext setLastAppActionLaunch:](self, "setLastAppActionLaunch:");
    id v4 = v5;
  }
}

- (double)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (NSString)lastAppLaunch
{
  return self->_lastAppLaunch;
}

- (void)setLastAppLaunch:(id)a3
{
}

- (double)lastAppLaunchDate
{
  return self->_lastAppLaunchDate;
}

- (NSString)secondMostRecentAppLaunch
{
  return self->_secondMostRecentAppLaunch;
}

- (void)setSecondMostRecentAppLaunch:(id)a3
{
}

- (NSString)lastAppActionLaunch
{
  return self->_lastAppActionLaunch;
}

- (void)setLastAppActionLaunch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondMostRecentAppLaunch, 0);
  objc_storeStrong((id *)&self->_lastAppLaunch, 0);
  objc_storeStrong((id *)&self->_lastAppActionLaunch, 0);
}

@end