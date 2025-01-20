@interface ATXAnchorModelPBModeMetadata
- (ATXAnchorModelPBLaunchHistoryMetadata)modeHistory;
- (BOOL)hasIsStart;
- (BOOL)hasModeHistory;
- (BOOL)hasModeId;
- (BOOL)hasRelativeTimeSinceAnchorInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)readFrom:(id)a3;
- (NSString)modeId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)relativeTimeSinceAnchorInSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3;
- (void)setIsStart:(BOOL)a3;
- (void)setModeHistory:(id)a3;
- (void)setModeId:(id)a3;
- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBModeMetadata

- (BOOL)hasModeId
{
  return self->_modeId != 0;
}

- (void)setIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsStart
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasModeHistory
{
  return self->_modeHistory != 0;
}

- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_relativeTimeSinceAnchorInSeconds = a3;
}

- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelativeTimeSinceAnchorInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBModeMetadata;
  v4 = [(ATXAnchorModelPBModeMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBModeMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  modeId = self->_modeId;
  if (modeId) {
    [v3 setObject:modeId forKey:@"modeId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_isStart];
    [v4 setObject:v6 forKey:@"isStart"];
  }
  modeHistory = self->_modeHistory;
  if (modeHistory)
  {
    objc_super v8 = [(ATXAnchorModelPBLaunchHistoryMetadata *)modeHistory dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"modeHistory"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithInt:self->_relativeTimeSinceAnchorInSeconds];
    [v4 setObject:v9 forKey:@"relativeTimeSinceAnchorInSeconds"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBModeMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_modeId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_modeHistory)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_modeId)
  {
    objc_msgSend(v4, "setModeId:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 28) = self->_isStart;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  if (self->_modeHistory)
  {
    objc_msgSend(v5, "setModeHistory:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_relativeTimeSinceAnchorInSeconds;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_modeId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_isStart;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  id v8 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_modeHistory copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_relativeTimeSinceAnchorInSeconds;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  modeId = self->_modeId;
  if ((unint64_t)modeId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](modeId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_19;
    }
    if (self->_isStart)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  modeHistory = self->_modeHistory;
  if (!((unint64_t)modeHistory | *((void *)v4 + 1))) {
    goto LABEL_15;
  }
  if (!-[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](modeHistory, "isEqual:"))
  {
LABEL_19:
    BOOL v8 = 0;
    goto LABEL_20;
  }
  char has = (char)self->_has;
LABEL_15:
  BOOL v8 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_relativeTimeSinceAnchorInSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modeId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_isStart;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_modeHistory hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_relativeTimeSinceAnchorInSeconds;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXAnchorModelPBModeMetadata setModeId:](self, "setModeId:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_isStart = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
  modeHistory = self->_modeHistory;
  uint64_t v6 = *((void *)v4 + 1);
  if (modeHistory)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](modeHistory, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ATXAnchorModelPBModeMetadata setModeHistory:](self, "setModeHistory:");
  }
  id v4 = v7;
LABEL_11:
  if (*((unsigned char *)v4 + 32))
  {
    self->_relativeTimeSinceAnchorInSeconds = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)modeId
{
  return self->_modeId;
}

- (void)setModeId:(id)a3
{
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (ATXAnchorModelPBLaunchHistoryMetadata)modeHistory
{
  return self->_modeHistory;
}

- (void)setModeHistory:(id)a3
{
}

- (int)relativeTimeSinceAnchorInSeconds
{
  return self->_relativeTimeSinceAnchorInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeId, 0);
  objc_storeStrong((id *)&self->_modeHistory, 0);
}

@end