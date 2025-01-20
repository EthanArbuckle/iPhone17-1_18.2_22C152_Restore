@interface ATXTimelineRelevancePBFeatureVector
- (BOOL)hasAppLaunchCount;
- (BOOL)hasAppLaunchPopularity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)appLaunchCount;
- (int64_t)appLaunchPopularity;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLaunchCount:(int64_t)a3;
- (void)setAppLaunchPopularity:(int64_t)a3;
- (void)setHasAppLaunchCount:(BOOL)a3;
- (void)setHasAppLaunchPopularity:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXTimelineRelevancePBFeatureVector

- (void)setAppLaunchPopularity:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_appLaunchPopularity = a3;
}

- (void)setHasAppLaunchPopularity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppLaunchPopularity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppLaunchCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_appLaunchCount = a3;
}

- (void)setHasAppLaunchCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppLaunchCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXTimelineRelevancePBFeatureVector;
  v4 = [(ATXTimelineRelevancePBFeatureVector *)&v8 description];
  v5 = [(ATXTimelineRelevancePBFeatureVector *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_appLaunchPopularity];
    [v3 setObject:v5 forKey:@"appLaunchPopularity"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithLongLong:self->_appLaunchCount];
    [v3 setObject:v6 forKey:@"appLaunchCount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBFeatureVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_appLaunchPopularity;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = self->_appLaunchCount;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_appLaunchPopularity;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = self->_appLaunchCount;
    *((unsigned char *)result + 24) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_appLaunchPopularity != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_appLaunchCount != *((void *)v4 + 1)) {
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
    uint64_t v2 = 2654435761 * self->_appLaunchPopularity;
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
  uint64_t v3 = 2654435761 * self->_appLaunchCount;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_appLaunchPopularity = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_appLaunchCount = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int64_t)appLaunchPopularity
{
  return self->_appLaunchPopularity;
}

- (int64_t)appLaunchCount
{
  return self->_appLaunchCount;
}

@end