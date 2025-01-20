@interface BMPBSiriUIEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasDismissalReason;
- (BOOL)hasSessionID;
- (BOOL)hasStarting;
- (BOOL)hasUuid;
- (BOOL)hasViewMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)starting;
- (NSString)dismissalReason;
- (NSString)sessionID;
- (NSString)uuid;
- (NSString)viewMode;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setDismissalReason:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setStarting:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)setViewMode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriUIEvent

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasViewMode
{
  return self->_viewMode != 0;
}

- (BOOL)hasDismissalReason
{
  return self->_dismissalReason != 0;
}

- (void)setStarting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStarting
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSiriUIEvent;
  v4 = [(BMPBSiriUIEvent *)&v8 description];
  v5 = [(BMPBSiriUIEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v4 setObject:uuid forKey:@"uuid"];
  }
  viewMode = self->_viewMode;
  if (viewMode) {
    [v4 setObject:viewMode forKey:@"viewMode"];
  }
  dismissalReason = self->_dismissalReason;
  if (dismissalReason) {
    [v4 setObject:dismissalReason forKey:@"dismissalReason"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_starting];
    [v4 setObject:v10 forKey:@"starting"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v11 forKey:@"absoluteTimestamp"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriUIEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_viewMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_dismissalReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionID)
  {
    objc_msgSend(v4, "setSessionID:");
    id v4 = v6;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    id v4 = v6;
  }
  if (self->_viewMode)
  {
    objc_msgSend(v6, "setViewMode:");
    id v4 = v6;
  }
  if (self->_dismissalReason)
  {
    objc_msgSend(v6, "setDismissalReason:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_starting;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_uuid copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_viewMode copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_dismissalReason copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_starting;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:")) {
      goto LABEL_22;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_22;
    }
  }
  viewMode = self->_viewMode;
  if ((unint64_t)viewMode | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](viewMode, "isEqual:")) {
      goto LABEL_22;
    }
  }
  dismissalReason = self->_dismissalReason;
  if ((unint64_t)dismissalReason | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](dismissalReason, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) != 0)
    {
      if (self->_starting)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    BOOL v9 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  BOOL v9 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_22;
    }
    BOOL v9 = 1;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionID hash];
  NSUInteger v4 = [(NSString *)self->_uuid hash];
  NSUInteger v5 = [(NSString *)self->_viewMode hash];
  NSUInteger v6 = [(NSString *)self->_dismissalReason hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_starting;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double absoluteTimestamp = self->_absoluteTimestamp;
  double v9 = -absoluteTimestamp;
  if (absoluteTimestamp >= 0.0) {
    double v9 = self->_absoluteTimestamp;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[BMPBSiriUIEvent setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBSiriUIEvent setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBSiriUIEvent setViewMode:](self, "setViewMode:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBSiriUIEvent setDismissalReason:](self, "setDismissalReason:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_starting = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if (v5)
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(id)a3
{
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (void)setDismissalReason:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_dismissalReason, 0);
}

@end