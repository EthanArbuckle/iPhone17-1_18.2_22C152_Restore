@interface ATXMPBHomeScreenAppPanelLaunchRatioTracker
- (BOOL)hasLocation;
- (BOOL)hasRatioType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationAsString:(int)a3;
- (id)ratioTypeAsString:(int)a3;
- (int)StringAsLocation:(id)a3;
- (int)StringAsRatioType:(id)a3;
- (int)location;
- (int)ratioType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasRatioType:(BOOL)a3;
- (void)setLocation:(int)a3;
- (void)setRatioType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBHomeScreenAppPanelLaunchRatioTracker

- (int)location
{
  if (*(unsigned char *)&self->_has) {
    return self->_location;
  }
  else {
    return 1;
  }
}

- (void)setLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_location = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)locationAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5D07E28[a3 - 1];
  }

  return v3;
}

- (int)StringAsLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Page1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Page2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Page3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Page4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OtherPages"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HomeScreenDock"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (int)ratioType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_ratioType;
  }
  else {
    return 1;
  }
}

- (void)setRatioType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ratioType = a3;
}

- (void)setHasRatioType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRatioType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)ratioTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D07E58[a3 - 1];
  }

  return v3;
}

- (int)StringAsRatioType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AppPanel"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"StaticAppIcon"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"StaticAppIconIncludingEveryAppInFolder"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Dock"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBHomeScreenAppPanelLaunchRatioTracker;
  int v4 = [(ATXMPBHomeScreenAppPanelLaunchRatioTracker *)&v8 description];
  v5 = [(ATXMPBHomeScreenAppPanelLaunchRatioTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = self->_location - 1;
    if (v5 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_location);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5D07E28[v5];
    }
    [v3 setObject:v6 forKey:@"location"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = self->_ratioType - 1;
    if (v7 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ratioType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D07E58[v7];
    }
    [v3 setObject:v8 forKey:@"ratioType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBHomeScreenAppPanelLaunchRatioTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_location;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_ratioType;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_location;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_ratioType;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_location != *((_DWORD *)v4 + 2)) {
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
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_ratioType != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_location;
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
  uint64_t v3 = 2654435761 * self->_ratioType;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_location = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_ratioType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

@end