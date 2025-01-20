@interface BMPBAppLaunchEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasBundleID;
- (BOOL)hasDuration;
- (BOOL)hasExactVersionString;
- (BOOL)hasExtensionHostID;
- (BOOL)hasLaunchReason;
- (BOOL)hasLaunchType;
- (BOOL)hasParentBundleID;
- (BOOL)hasShortVersionString;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)starting;
- (NSString)bundleID;
- (NSString)exactVersionString;
- (NSString)extensionHostID;
- (NSString)launchReason;
- (NSString)parentBundleID;
- (NSString)shortVersionString;
- (double)absoluteTimestamp;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)launchTypeAsString:(int)a3;
- (int)StringAsLaunchType:(id)a3;
- (int)launchType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setBundleID:(id)a3;
- (void)setDuration:(double)a3;
- (void)setExactVersionString:(id)a3;
- (void)setExtensionHostID:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasLaunchType:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setLaunchReason:(id)a3;
- (void)setLaunchType:(int)a3;
- (void)setParentBundleID:(id)a3;
- (void)setShortVersionString:(id)a3;
- (void)setStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBAppLaunchEvent

- (BOOL)hasLaunchReason
{
  return self->_launchReason != 0;
}

- (int)launchType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_launchType;
  }
  else {
    return 0;
  }
}

- (void)setLaunchType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_launchType = a3;
}

- (void)setHasLaunchType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLaunchType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)launchTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D76F8[a3];
  }

  return v3;
}

- (int)StringAsLaunchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unused"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"App"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Extension"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SystemUI"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setStarting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStarting
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasParentBundleID
{
  return self->_parentBundleID != 0;
}

- (BOOL)hasExtensionHostID
{
  return self->_extensionHostID != 0;
}

- (BOOL)hasShortVersionString
{
  return self->_shortVersionString != 0;
}

- (BOOL)hasExactVersionString
{
  return self->_exactVersionString != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBAppLaunchEvent;
  int v4 = [(BMPBAppLaunchEvent *)&v8 description];
  v5 = [(BMPBAppLaunchEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  launchReason = self->_launchReason;
  if (launchReason) {
    [v3 setObject:launchReason forKey:@"launchReason"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t launchType = self->_launchType;
    if (launchType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_launchType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D76F8[launchType];
    }
    [v4 setObject:v8 forKey:@"launchType"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_starting];
    [v4 setObject:v16 forKey:@"starting"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_10;
  }
  v17 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  [v4 setObject:v17 forKey:@"absoluteTimestamp"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithDouble:self->_duration];
    [v4 setObject:v9 forKey:@"duration"];
  }
LABEL_12:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  parentBundleID = self->_parentBundleID;
  if (parentBundleID) {
    [v4 setObject:parentBundleID forKey:@"parentBundleID"];
  }
  extensionHostID = self->_extensionHostID;
  if (extensionHostID) {
    [v4 setObject:extensionHostID forKey:@"extensionHostID"];
  }
  shortVersionString = self->_shortVersionString;
  if (shortVersionString) {
    [v4 setObject:shortVersionString forKey:@"shortVersionString"];
  }
  exactVersionString = self->_exactVersionString;
  if (exactVersionString) {
    [v4 setObject:exactVersionString forKey:@"exactVersionString"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAppLaunchEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_launchReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_8:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_parentBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_extensionHostID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_shortVersionString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_exactVersionString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_launchReason)
  {
    objc_msgSend(v4, "setLaunchReason:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_launchType;
    *((unsigned char *)v4 + 84) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 80) = self->_starting;
  *((unsigned char *)v4 + 84) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
  *((unsigned char *)v4 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((void *)v4 + 2) = *(void *)&self->_duration;
    *((unsigned char *)v4 + 84) |= 2u;
  }
LABEL_8:
  if (self->_bundleID)
  {
    objc_msgSend(v6, "setBundleID:");
    id v4 = v6;
  }
  if (self->_parentBundleID)
  {
    objc_msgSend(v6, "setParentBundleID:");
    id v4 = v6;
  }
  if (self->_extensionHostID)
  {
    objc_msgSend(v6, "setExtensionHostID:");
    id v4 = v6;
  }
  if (self->_shortVersionString)
  {
    objc_msgSend(v6, "setShortVersionString:");
    id v4 = v6;
  }
  if (self->_exactVersionString)
  {
    objc_msgSend(v6, "setExactVersionString:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_launchReason copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_launchType;
    *(unsigned char *)(v5 + 84) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 8) = self->_absoluteTimestamp;
      *(unsigned char *)(v5 + 84) |= 1u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 80) = self->_starting;
  *(unsigned char *)(v5 + 84) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_duration;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_bundleID copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_parentBundleID copyWithZone:a3];
  v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_extensionHostID copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_shortVersionString copyWithZone:a3];
  v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  uint64_t v17 = [(NSString *)self->_exactVersionString copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  launchReason = self->_launchReason;
  if ((unint64_t)launchReason | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](launchReason, "isEqual:")) {
      goto LABEL_37;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_launchType != *((_DWORD *)v4 + 14)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) != 0)
    {
      if (self->_starting)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_37;
        }
        goto LABEL_17;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_17;
      }
    }
LABEL_37:
    char v11 = 0;
    goto LABEL_38;
  }
  if ((*((unsigned char *)v4 + 84) & 8) != 0) {
    goto LABEL_37;
  }
LABEL_17:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_37;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 3) && !-[NSString isEqual:](bundleID, "isEqual:")) {
    goto LABEL_37;
  }
  parentBundleID = self->_parentBundleID;
  if ((unint64_t)parentBundleID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](parentBundleID, "isEqual:")) {
      goto LABEL_37;
    }
  }
  extensionHostID = self->_extensionHostID;
  if ((unint64_t)extensionHostID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](extensionHostID, "isEqual:")) {
      goto LABEL_37;
    }
  }
  shortVersionString = self->_shortVersionString;
  if ((unint64_t)shortVersionString | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](shortVersionString, "isEqual:")) {
      goto LABEL_37;
    }
  }
  exactVersionString = self->_exactVersionString;
  if ((unint64_t)exactVersionString | *((void *)v4 + 4)) {
    char v11 = -[NSString isEqual:](exactVersionString, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_launchReason hash];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = 2654435761 * self->_launchType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_starting;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double absoluteTimestamp = self->_absoluteTimestamp;
  double v8 = -absoluteTimestamp;
  if (absoluteTimestamp >= 0.0) {
    double v8 = self->_absoluteTimestamp;
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
LABEL_13:
  if ((has & 2) != 0)
  {
    double duration = self->_duration;
    double v14 = -duration;
    if (duration >= 0.0) {
      double v14 = self->_duration;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  NSUInteger v17 = v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ [(NSString *)self->_bundleID hash];
  NSUInteger v18 = [(NSString *)self->_parentBundleID hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_extensionHostID hash];
  NSUInteger v20 = v17 ^ v19 ^ [(NSString *)self->_shortVersionString hash];
  return v20 ^ [(NSString *)self->_exactVersionString hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[BMPBAppLaunchEvent setLaunchReason:](self, "setLaunchReason:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t launchType = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 84);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_starting = *((unsigned char *)v4 + 80);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_23:
  self->_double absoluteTimestamp = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
LABEL_7:
    self->_double duration = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_8:
  if (*((void *)v4 + 3))
  {
    -[BMPBAppLaunchEvent setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[BMPBAppLaunchEvent setParentBundleID:](self, "setParentBundleID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBAppLaunchEvent setExtensionHostID:](self, "setExtensionHostID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[BMPBAppLaunchEvent setShortVersionString:](self, "setShortVersionString:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBAppLaunchEvent setExactVersionString:](self, "setExactVersionString:");
    id v4 = v6;
  }
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
}

- (BOOL)starting
{
  return self->_starting;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (void)setParentBundleID:(id)a3
{
}

- (NSString)extensionHostID
{
  return self->_extensionHostID;
}

- (void)setExtensionHostID:(id)a3
{
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (void)setShortVersionString:(id)a3
{
}

- (NSString)exactVersionString
{
  return self->_exactVersionString;
}

- (void)setExactVersionString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_extensionHostID, 0);
  objc_storeStrong((id *)&self->_exactVersionString, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end