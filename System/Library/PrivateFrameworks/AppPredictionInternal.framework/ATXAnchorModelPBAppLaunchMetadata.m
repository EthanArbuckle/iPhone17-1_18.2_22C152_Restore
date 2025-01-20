@interface ATXAnchorModelPBAppLaunchMetadata
- (ATXAnchorModelPBLaunchHistoryMetadata)appLaunchHistory;
- (BOOL)appInstalledInLast48Hours;
- (BOOL)hasApp2VecCluster;
- (BOOL)hasAppInstalledInLast48Hours;
- (BOOL)hasAppLaunchHistory;
- (BOOL)hasBundleId;
- (BOOL)hasGenreId;
- (BOOL)hasRelativeTimeSinceAnchorInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)relativeTimeSinceAnchorInSeconds;
- (int64_t)app2VecCluster;
- (int64_t)genreId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp2VecCluster:(int64_t)a3;
- (void)setAppInstalledInLast48Hours:(BOOL)a3;
- (void)setAppLaunchHistory:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setGenreId:(int64_t)a3;
- (void)setHasApp2VecCluster:(BOOL)a3;
- (void)setHasAppInstalledInLast48Hours:(BOOL)a3;
- (void)setHasGenreId:(BOOL)a3;
- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3;
- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBAppLaunchMetadata

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasAppLaunchHistory
{
  return self->_appLaunchHistory != 0;
}

- (void)setAppInstalledInLast48Hours:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_appInstalledInLast48Hours = a3;
}

- (void)setHasAppInstalledInLast48Hours:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppInstalledInLast48Hours
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_relativeTimeSinceAnchorInSeconds = a3;
}

- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRelativeTimeSinceAnchorInSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setGenreId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_genreId = a3;
}

- (void)setHasGenreId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenreId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setApp2VecCluster:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_app2VecCluster = a3;
}

- (void)setHasApp2VecCluster:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApp2VecCluster
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBAppLaunchMetadata;
  v4 = [(ATXAnchorModelPBAppLaunchMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBAppLaunchMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  appLaunchHistory = self->_appLaunchHistory;
  if (appLaunchHistory)
  {
    v7 = [(ATXAnchorModelPBLaunchHistoryMetadata *)appLaunchHistory dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"appLaunchHistory"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_appInstalledInLast48Hours];
    [v4 setObject:v11 forKey:@"appInstalledInLast48Hours"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithInt:self->_relativeTimeSinceAnchorInSeconds];
  [v4 setObject:v12 forKey:@"relativeTimeSinceAnchorInSeconds"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  v13 = [NSNumber numberWithLongLong:self->_genreId];
  [v4 setObject:v13 forKey:@"genreId"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    v9 = [NSNumber numberWithLongLong:self->_app2VecCluster];
    [v4 setObject:v9 forKey:@"app2VecCluster"];
  }
LABEL_10:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXAnchorModelPBAppLaunchMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_appLaunchHistory)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_10:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v6;
  }
  if (self->_appLaunchHistory)
  {
    objc_msgSend(v6, "setAppLaunchHistory:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 44) = self->_appInstalledInLast48Hours;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 10) = self->_relativeTimeSinceAnchorInSeconds;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((void *)v4 + 2) = self->_genreId;
  *((unsigned char *)v4 + 48) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    *((void *)v4 + 1) = self->_app2VecCluster;
    *((unsigned char *)v4 + 48) |= 1u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_appLaunchHistory copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 44) = self->_appInstalledInLast48Hours;
    *(unsigned char *)(v5 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 16) = self->_genreId;
      *(unsigned char *)(v5 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_relativeTimeSinceAnchorInSeconds;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(void *)(v5 + 8) = self->_app2VecCluster;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_28;
    }
  }
  appLaunchHistory = self->_appLaunchHistory;
  if ((unint64_t)appLaunchHistory | *((void *)v4 + 3))
  {
    if (!-[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](appLaunchHistory, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) != 0)
    {
      if (self->_appInstalledInLast48Hours)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_28;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_14;
      }
    }
LABEL_28:
    BOOL v7 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)v4 + 48) & 8) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_relativeTimeSinceAnchorInSeconds != *((_DWORD *)v4 + 10)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_genreId != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_28;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_app2VecCluster != *((void *)v4 + 1)) {
      goto LABEL_28;
    }
    BOOL v7 = 1;
  }
LABEL_29:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  unint64_t v4 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_appLaunchHistory hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_appInstalledInLast48Hours;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_relativeTimeSinceAnchorInSeconds;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_genreId;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v8 = 2654435761 * self->_app2VecCluster;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[ATXAnchorModelPBAppLaunchMetadata setBundleId:](self, "setBundleId:");
    id v4 = v8;
  }
  appLaunchHistory = self->_appLaunchHistory;
  uint64_t v6 = *((void *)v4 + 3);
  if (appLaunchHistory)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](appLaunchHistory, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[ATXAnchorModelPBAppLaunchMetadata setAppLaunchHistory:](self, "setAppLaunchHistory:");
  }
  id v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 8) != 0)
  {
    self->_appInstalledInLast48Hours = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 48);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_relativeTimeSinceAnchorInSeconds = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 4u;
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 2) == 0)
  {
LABEL_12:
    if ((v7 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  self->_genreId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_13:
    self->_app2VecCluster = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_14:
  MEMORY[0x1F41817F8]();
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (ATXAnchorModelPBLaunchHistoryMetadata)appLaunchHistory
{
  return self->_appLaunchHistory;
}

- (void)setAppLaunchHistory:(id)a3
{
}

- (BOOL)appInstalledInLast48Hours
{
  return self->_appInstalledInLast48Hours;
}

- (int)relativeTimeSinceAnchorInSeconds
{
  return self->_relativeTimeSinceAnchorInSeconds;
}

- (int64_t)genreId
{
  return self->_genreId;
}

- (int64_t)app2VecCluster
{
  return self->_app2VecCluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appLaunchHistory, 0);
}

@end