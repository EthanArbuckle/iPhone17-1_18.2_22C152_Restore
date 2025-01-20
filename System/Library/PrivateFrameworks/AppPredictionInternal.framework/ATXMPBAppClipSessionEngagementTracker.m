@interface ATXMPBAppClipSessionEngagementTracker
- (BOOL)hasBundleId;
- (BOOL)hasConsumerSubType;
- (BOOL)hasInteractionType;
- (BOOL)hasUrlHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)consumerSubType;
- (NSString)urlHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interactionTypeAsString:(int)a3;
- (int)StringAsInteractionType:(id)a3;
- (int)interactionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setHasInteractionType:(BOOL)a3;
- (void)setInteractionType:(int)a3;
- (void)setUrlHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBAppClipSessionEngagementTracker

- (int)interactionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_interactionType;
  }
  else {
    return 0;
  }
}

- (void)setInteractionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_interactionType = a3;
}

- (void)setHasInteractionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteractionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)interactionTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B4018[a3];
  }
  return v3;
}

- (int)StringAsInteractionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Shown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Engaged"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Rejected"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasUrlHash
{
  return self->_urlHash != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBAppClipSessionEngagementTracker;
  int v4 = [(ATXMPBAppClipSessionEngagementTracker *)&v8 description];
  v5 = [(ATXMPBAppClipSessionEngagementTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t interactionType = self->_interactionType;
    if (interactionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_interactionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B4018[interactionType];
    }
    [v3 setObject:v5 forKey:@"interactionType"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  urlHash = self->_urlHash;
  if (urlHash) {
    [v3 setObject:urlHash forKey:@"urlHash"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAppClipSessionEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_urlHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_interactionType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    id v4 = v5;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    id v4 = v5;
  }
  if (self->_urlHash)
  {
    objc_msgSend(v5, "setUrlHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_interactionType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_bundleId copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSString *)self->_urlHash copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_interactionType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 2)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_13;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](urlHash, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_interactionType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_consumerSubType hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_bundleId hash];
  return v4 ^ v5 ^ [(NSString *)self->_urlHash hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[10])
  {
    self->_uint64_t interactionType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATXMPBAppClipSessionEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBAppClipSessionEngagementTracker setBundleId:](self, "setBundleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBAppClipSessionEngagementTracker setUrlHash:](self, "setUrlHash:");
    NSUInteger v4 = v5;
  }
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end