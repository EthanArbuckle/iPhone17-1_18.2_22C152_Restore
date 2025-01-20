@interface ASCodableInviteRequest
- (ASCodableActivityDataPreview)activityDataPreview;
- (BOOL)hasActivityDataPreview;
- (BOOL)hasHandshakeToken;
- (BOOL)hasInviterBuildNumber;
- (BOOL)hasInviterCallerID;
- (BOOL)hasInviterCloudKitAddress;
- (BOOL)hasInviterVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)handshakeToken;
- (NSString)inviterBuildNumber;
- (NSString)inviterCallerID;
- (NSString)inviterCloudKitAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)inviterVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityDataPreview:(id)a3;
- (void)setHandshakeToken:(id)a3;
- (void)setHasInviterVersion:(BOOL)a3;
- (void)setInviterBuildNumber:(id)a3;
- (void)setInviterCallerID:(id)a3;
- (void)setInviterCloudKitAddress:(id)a3;
- (void)setInviterVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableInviteRequest

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (BOOL)hasInviterCloudKitAddress
{
  return self->_inviterCloudKitAddress != 0;
}

- (BOOL)hasInviterCallerID
{
  return self->_inviterCallerID != 0;
}

- (BOOL)hasInviterBuildNumber
{
  return self->_inviterBuildNumber != 0;
}

- (void)setInviterVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inviterVersion = a3;
}

- (void)setHasInviterVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInviterVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasActivityDataPreview
{
  return self->_activityDataPreview != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableInviteRequest;
  v4 = [(ASCodableInviteRequest *)&v8 description];
  v5 = [(ASCodableInviteRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken) {
    [v3 setObject:handshakeToken forKey:@"handshakeToken"];
  }
  inviterCloudKitAddress = self->_inviterCloudKitAddress;
  if (inviterCloudKitAddress) {
    [v4 setObject:inviterCloudKitAddress forKey:@"inviterCloudKitAddress"];
  }
  inviterCallerID = self->_inviterCallerID;
  if (inviterCallerID) {
    [v4 setObject:inviterCallerID forKey:@"inviterCallerID"];
  }
  inviterBuildNumber = self->_inviterBuildNumber;
  if (inviterBuildNumber) {
    [v4 setObject:inviterBuildNumber forKey:@"inviterBuildNumber"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_inviterVersion];
    [v4 setObject:v9 forKey:@"inviterVersion"];
  }
  activityDataPreview = self->_activityDataPreview;
  if (activityDataPreview)
  {
    v11 = [(ASCodableActivityDataPreview *)activityDataPreview dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"activityDataPreview"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableInviteRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handshakeToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inviterCloudKitAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inviterCallerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inviterBuildNumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_activityDataPreview)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handshakeToken)
  {
    objc_msgSend(v4, "setHandshakeToken:");
    id v4 = v5;
  }
  if (self->_inviterCloudKitAddress)
  {
    objc_msgSend(v5, "setInviterCloudKitAddress:");
    id v4 = v5;
  }
  if (self->_inviterCallerID)
  {
    objc_msgSend(v5, "setInviterCallerID:");
    id v4 = v5;
  }
  if (self->_inviterBuildNumber)
  {
    objc_msgSend(v5, "setInviterBuildNumber:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_inviterVersion;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_activityDataPreview)
  {
    objc_msgSend(v5, "setActivityDataPreview:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_handshakeToken copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_inviterCloudKitAddress copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_inviterCallerID copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_inviterBuildNumber copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_inviterVersion;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v14 = [(ASCodableActivityDataPreview *)self->_activityDataPreview copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  handshakeToken = self->_handshakeToken;
  if ((unint64_t)handshakeToken | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](handshakeToken, "isEqual:")) {
      goto LABEL_17;
    }
  }
  inviterCloudKitAddress = self->_inviterCloudKitAddress;
  if ((unint64_t)inviterCloudKitAddress | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](inviterCloudKitAddress, "isEqual:")) {
      goto LABEL_17;
    }
  }
  inviterCallerID = self->_inviterCallerID;
  if ((unint64_t)inviterCallerID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](inviterCallerID, "isEqual:")) {
      goto LABEL_17;
    }
  }
  inviterBuildNumber = self->_inviterBuildNumber;
  if ((unint64_t)inviterBuildNumber | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](inviterBuildNumber, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_inviterVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  activityDataPreview = self->_activityDataPreview;
  if ((unint64_t)activityDataPreview | *((void *)v4 + 1)) {
    char v10 = -[ASCodableActivityDataPreview isEqual:](activityDataPreview, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_handshakeToken hash];
  NSUInteger v4 = [(NSString *)self->_inviterCloudKitAddress hash];
  NSUInteger v5 = [(NSString *)self->_inviterCallerID hash];
  NSUInteger v6 = [(NSString *)self->_inviterBuildNumber hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_inviterVersion;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(ASCodableActivityDataPreview *)self->_activityDataPreview hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  uint64_t v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[ASCodableInviteRequest setHandshakeToken:](self, "setHandshakeToken:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[ASCodableInviteRequest setInviterCloudKitAddress:](self, "setInviterCloudKitAddress:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[ASCodableInviteRequest setInviterCallerID:](self, "setInviterCallerID:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[ASCodableInviteRequest setInviterBuildNumber:](self, "setInviterBuildNumber:");
    NSUInteger v4 = v7;
  }
  if (v4[13])
  {
    self->_inviterVersion = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  activityDataPreview = self->_activityDataPreview;
  uint64_t v6 = *((void *)v4 + 1);
  if (activityDataPreview)
  {
    if (v6) {
      -[ASCodableActivityDataPreview mergeFrom:](activityDataPreview, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ASCodableInviteRequest setActivityDataPreview:](self, "setActivityDataPreview:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)handshakeToken
{
  return self->_handshakeToken;
}

- (void)setHandshakeToken:(id)a3
{
}

- (NSString)inviterCloudKitAddress
{
  return self->_inviterCloudKitAddress;
}

- (void)setInviterCloudKitAddress:(id)a3
{
}

- (NSString)inviterCallerID
{
  return self->_inviterCallerID;
}

- (void)setInviterCallerID:(id)a3
{
}

- (NSString)inviterBuildNumber
{
  return self->_inviterBuildNumber;
}

- (void)setInviterBuildNumber:(id)a3
{
}

- (unsigned)inviterVersion
{
  return self->_inviterVersion;
}

- (ASCodableActivityDataPreview)activityDataPreview
{
  return self->_activityDataPreview;
}

- (void)setActivityDataPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviterCloudKitAddress, 0);
  objc_storeStrong((id *)&self->_inviterCallerID, 0);
  objc_storeStrong((id *)&self->_inviterBuildNumber, 0);
  objc_storeStrong((id *)&self->_handshakeToken, 0);

  objc_storeStrong((id *)&self->_activityDataPreview, 0);
}

@end