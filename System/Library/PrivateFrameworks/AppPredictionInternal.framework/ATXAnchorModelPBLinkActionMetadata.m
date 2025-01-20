@interface ATXAnchorModelPBLinkActionMetadata
- (ATXAnchorModelPBLaunchHistoryMetadata)actionHistory;
- (BOOL)hasActionHistory;
- (BOOL)hasActionId;
- (BOOL)hasBundleId;
- (BOOL)hasRelativeTimeSinceAnchorInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionId;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)relativeTimeSinceAnchorInSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionHistory:(id)a3;
- (void)setActionId:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasRelativeTimeSinceAnchorInSeconds:(BOOL)a3;
- (void)setRelativeTimeSinceAnchorInSeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXAnchorModelPBLinkActionMetadata

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasActionId
{
  return self->_actionId != 0;
}

- (BOOL)hasActionHistory
{
  return self->_actionHistory != 0;
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXAnchorModelPBLinkActionMetadata;
  v4 = [(ATXAnchorModelPBLinkActionMetadata *)&v8 description];
  v5 = [(ATXAnchorModelPBLinkActionMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  actionId = self->_actionId;
  if (actionId) {
    [v4 setObject:actionId forKey:@"actionId"];
  }
  actionHistory = self->_actionHistory;
  if (actionHistory)
  {
    objc_super v8 = [(ATXAnchorModelPBLaunchHistoryMetadata *)actionHistory dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"actionHistory"];
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
  return ATXAnchorModelPBLinkActionMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionHistory)
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
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v5;
  }
  if (self->_actionId)
  {
    objc_msgSend(v5, "setActionId:");
    id v4 = v5;
  }
  if (self->_actionHistory)
  {
    objc_msgSend(v5, "setActionHistory:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_relativeTimeSinceAnchorInSeconds;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_actionId copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  id v10 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionHistory copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_relativeTimeSinceAnchorInSeconds;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  actionId = self->_actionId;
  if ((unint64_t)actionId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionId, "isEqual:")) {
      goto LABEL_12;
    }
  }
  actionHistory = self->_actionHistory;
  if ((unint64_t)actionHistory | *((void *)v4 + 1))
  {
    if (!-[ATXAnchorModelPBLaunchHistoryMetadata isEqual:](actionHistory, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_relativeTimeSinceAnchorInSeconds == *((_DWORD *)v4 + 8))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_actionId hash];
  unint64_t v5 = [(ATXAnchorModelPBLaunchHistoryMetadata *)self->_actionHistory hash];
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
  NSUInteger v4 = (int *)a3;
  v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXAnchorModelPBLinkActionMetadata setBundleId:](self, "setBundleId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXAnchorModelPBLinkActionMetadata setActionId:](self, "setActionId:");
    NSUInteger v4 = v7;
  }
  actionHistory = self->_actionHistory;
  uint64_t v6 = *((void *)v4 + 1);
  if (actionHistory)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ATXAnchorModelPBLaunchHistoryMetadata mergeFrom:](actionHistory, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[ATXAnchorModelPBLinkActionMetadata setActionHistory:](self, "setActionHistory:");
  }
  NSUInteger v4 = v7;
LABEL_11:
  if (v4[9])
  {
    self->_relativeTimeSinceAnchorInSeconds = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
}

- (ATXAnchorModelPBLaunchHistoryMetadata)actionHistory
{
  return self->_actionHistory;
}

- (void)setActionHistory:(id)a3
{
}

- (int)relativeTimeSinceAnchorInSeconds
{
  return self->_relativeTimeSinceAnchorInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
  objc_storeStrong((id *)&self->_actionHistory, 0);
}

@end