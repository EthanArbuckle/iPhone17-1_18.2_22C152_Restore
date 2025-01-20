@interface ATXPBAppDirectoryEventMetadata
- (BOOL)bundleIdInTopAppsVisible;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userLaunchedAppBeforeLeaving;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)hasBundleIdInTopAppsVisible;
- (uint64_t)hasUserLaunchedAppBeforeLeaving;
- (uint64_t)setBundleIdInTopAppsVisible:(uint64_t)result;
- (uint64_t)setHasBundleIdInTopAppsVisible:(uint64_t)result;
- (uint64_t)setHasUserLaunchedAppBeforeLeaving:(uint64_t)result;
- (uint64_t)setUserLaunchedAppBeforeLeaving:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(unsigned char *)a1;
- (void)mergeFrom:(unsigned char *)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBAppDirectoryEventMetadata

- (uint64_t)setBundleIdInTopAppsVisible:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 12) |= 1u;
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasBundleIdInTopAppsVisible:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 12) = *(unsigned char *)(result + 12) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasBundleIdInTopAppsVisible
{
  if (result) {
    return *(unsigned char *)(result + 12) & 1;
  }
  return result;
}

- (uint64_t)setUserLaunchedAppBeforeLeaving:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 12) |= 2u;
    *(unsigned char *)(result + 9) = a2;
  }
  return result;
}

- (uint64_t)setHasUserLaunchedAppBeforeLeaving:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 12) = *(unsigned char *)(result + 12) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasUserLaunchedAppBeforeLeaving
{
  if (result) {
    return (*(unsigned __int8 *)(result + 12) >> 1) & 1;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBAppDirectoryEventMetadata;
  v4 = [(ATXPBAppDirectoryEventMetadata *)&v8 description];
  v5 = [(ATXPBAppDirectoryEventMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithBool:self->_bundleIdInTopAppsVisible];
    [v3 setObject:v5 forKey:@"bundleIdInTopAppsVisible"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_userLaunchedAppBeforeLeaving];
    [v3 setObject:v6 forKey:@"userLaunchedAppBeforeLeaving"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAppDirectoryEventMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(unsigned char *)a1
{
  v3 = a2;
  if (a1)
  {
    char v4 = a1[12];
    if (v4)
    {
      v3[8] = a1[8];
      v3[12] |= 1u;
      char v4 = a1[12];
    }
    if ((v4 & 2) != 0)
    {
      v3[9] = a1[9];
      v3[12] |= 2u;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 8) = self->_bundleIdInTopAppsVisible;
    *((unsigned char *)result + 12) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_userLaunchedAppBeforeLeaving;
    *((unsigned char *)result + 12) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_12;
    }
    if (self->_bundleIdInTopAppsVisible)
    {
      if (!v4[8]) {
        goto LABEL_12;
      }
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if (v4[12])
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_userLaunchedAppBeforeLeaving)
      {
        if (!v4[9]) {
          goto LABEL_12;
        }
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_bundleIdInTopAppsVisible;
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
  uint64_t v3 = 2654435761 * self->_userLaunchedAppBeforeLeaving;
  return v3 ^ v2;
}

- (void)mergeFrom:(unsigned char *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = v3[12];
    if (v4)
    {
      a1[8] = v3[8];
      a1[12] |= 1u;
      char v4 = v3[12];
    }
    if ((v4 & 2) != 0)
    {
      a1[9] = v3[9];
      a1[12] |= 2u;
    }
  }
}

- (BOOL)bundleIdInTopAppsVisible
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (BOOL)userLaunchedAppBeforeLeaving
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

@end