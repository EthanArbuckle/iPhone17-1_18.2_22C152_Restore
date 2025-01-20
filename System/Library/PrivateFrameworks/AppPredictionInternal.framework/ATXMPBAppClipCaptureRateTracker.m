@interface ATXMPBAppClipCaptureRateTracker
- (BOOL)hasBundleId;
- (BOOL)hasCaptureType;
- (BOOL)hasUrlHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)urlHash;
- (id)captureTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCaptureType:(id)a3;
- (int)captureType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCaptureType:(int)a3;
- (void)setHasCaptureType:(BOOL)a3;
- (void)setUrlHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBAppClipCaptureRateTracker

- (int)captureType
{
  if (*(unsigned char *)&self->_has) {
    return self->_captureType;
  }
  else {
    return 0;
  }
}

- (void)setCaptureType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_captureType = a3;
}

- (void)setHasCaptureType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)captureTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B3198[a3];
  }
  return v3;
}

- (int)StringAsCaptureType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NFC"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"QR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LocationBasedSpotlight"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LocationBasedHomescreen"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SpringBoard"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Maps"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Safari"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Messages"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Mail"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)ATXMPBAppClipCaptureRateTracker;
  int v4 = [(ATXMPBAppClipCaptureRateTracker *)&v8 description];
  v5 = [(ATXMPBAppClipCaptureRateTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t captureType = self->_captureType;
    if (captureType >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_captureType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B3198[captureType];
    }
    [v3 setObject:v5 forKey:@"captureType"];
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
  return ATXMPBAppClipCaptureRateTrackerReadFrom((uint64_t)self, (uint64_t)a3);
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
    v4[4] = self->_captureType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
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
    *(_DWORD *)(v5 + 16) = self->_captureType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_bundleId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_urlHash copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_captureType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 1) && !-[NSString isEqual:](bundleId, "isEqual:")) {
    goto LABEL_11;
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](urlHash, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_captureType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bundleId hash] ^ v3;
  return v4 ^ [(NSString *)self->_urlHash hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[8])
  {
    self->_uint64_t captureType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[ATXMPBAppClipCaptureRateTracker setBundleId:](self, "setBundleId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXMPBAppClipCaptureRateTracker setUrlHash:](self, "setUrlHash:");
    NSUInteger v4 = v5;
  }
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
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end