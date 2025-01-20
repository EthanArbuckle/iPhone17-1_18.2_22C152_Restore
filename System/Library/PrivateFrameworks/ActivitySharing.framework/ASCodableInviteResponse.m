@interface ASCodableInviteResponse
- (ASCodableActivityDataPreview)activityDataPreview;
- (ASCodableShareLocations)inviteeShareLocations;
- (BOOL)hasActivityDataPreview;
- (BOOL)hasHandshakeToken;
- (BOOL)hasInviteeBuildNumber;
- (BOOL)hasInviteeCloudKitAddress;
- (BOOL)hasInviteeShareLocations;
- (BOOL)hasInviteeVersion;
- (BOOL)hasResponseCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)handshakeToken;
- (NSString)inviteeBuildNumber;
- (NSString)inviteeCloudKitAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)responseCode;
- (unint64_t)hash;
- (unsigned)inviteeVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityDataPreview:(id)a3;
- (void)setHandshakeToken:(id)a3;
- (void)setHasInviteeVersion:(BOOL)a3;
- (void)setHasResponseCode:(BOOL)a3;
- (void)setInviteeBuildNumber:(id)a3;
- (void)setInviteeCloudKitAddress:(id)a3;
- (void)setInviteeShareLocations:(id)a3;
- (void)setInviteeVersion:(unsigned int)a3;
- (void)setResponseCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableInviteResponse

- (BOOL)hasHandshakeToken
{
  return self->_handshakeToken != 0;
}

- (void)setResponseCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_responseCode = a3;
}

- (void)setHasResponseCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResponseCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasInviteeCloudKitAddress
{
  return self->_inviteeCloudKitAddress != 0;
}

- (BOOL)hasInviteeShareLocations
{
  return self->_inviteeShareLocations != 0;
}

- (BOOL)hasInviteeBuildNumber
{
  return self->_inviteeBuildNumber != 0;
}

- (void)setInviteeVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_inviteeVersion = a3;
}

- (void)setHasInviteeVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInviteeVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasActivityDataPreview
{
  return self->_activityDataPreview != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableInviteResponse;
  v4 = [(ASCodableInviteResponse *)&v8 description];
  v5 = [(ASCodableInviteResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  handshakeToken = self->_handshakeToken;
  if (handshakeToken) {
    [v3 setObject:handshakeToken forKey:@"handshakeToken"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_responseCode];
    [v4 setObject:v6 forKey:@"responseCode"];
  }
  inviteeCloudKitAddress = self->_inviteeCloudKitAddress;
  if (inviteeCloudKitAddress) {
    [v4 setObject:inviteeCloudKitAddress forKey:@"inviteeCloudKitAddress"];
  }
  inviteeShareLocations = self->_inviteeShareLocations;
  if (inviteeShareLocations)
  {
    v9 = [(ASCodableShareLocations *)inviteeShareLocations dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"inviteeShareLocations"];
  }
  inviteeBuildNumber = self->_inviteeBuildNumber;
  if (inviteeBuildNumber) {
    [v4 setObject:inviteeBuildNumber forKey:@"inviteeBuildNumber"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_inviteeVersion];
    [v4 setObject:v11 forKey:@"inviteeVersion"];
  }
  activityDataPreview = self->_activityDataPreview;
  if (activityDataPreview)
  {
    v13 = [(ASCodableActivityDataPreview *)activityDataPreview dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"activityDataPreview"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableInviteResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_inviteeCloudKitAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inviteeShareLocations)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_inviteeBuildNumber)
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_responseCode;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_inviteeCloudKitAddress)
  {
    objc_msgSend(v5, "setInviteeCloudKitAddress:");
    id v4 = v5;
  }
  if (self->_inviteeShareLocations)
  {
    objc_msgSend(v5, "setInviteeShareLocations:");
    id v4 = v5;
  }
  if (self->_inviteeBuildNumber)
  {
    objc_msgSend(v5, "setInviteeBuildNumber:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 12) = self->_inviteeVersion;
    *((unsigned char *)v4 + 56) |= 1u;
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

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_responseCode;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_inviteeCloudKitAddress copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(ASCodableShareLocations *)self->_inviteeShareLocations copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_inviteeBuildNumber copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_inviteeVersion;
    *(unsigned char *)(v5 + 56) |= 1u;
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
    goto LABEL_22;
  }
  handshakeToken = self->_handshakeToken;
  if ((unint64_t)handshakeToken | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](handshakeToken, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_responseCode != *((_DWORD *)v4 + 13)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  inviteeCloudKitAddress = self->_inviteeCloudKitAddress;
  if ((unint64_t)inviteeCloudKitAddress | *((void *)v4 + 4)
    && !-[NSString isEqual:](inviteeCloudKitAddress, "isEqual:"))
  {
    goto LABEL_22;
  }
  inviteeShareLocations = self->_inviteeShareLocations;
  if ((unint64_t)inviteeShareLocations | *((void *)v4 + 5))
  {
    if (!-[ASCodableShareLocations isEqual:](inviteeShareLocations, "isEqual:")) {
      goto LABEL_22;
    }
  }
  inviteeBuildNumber = self->_inviteeBuildNumber;
  if ((unint64_t)inviteeBuildNumber | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](inviteeBuildNumber, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_inviteeVersion != *((_DWORD *)v4 + 12)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_22;
  }
  activityDataPreview = self->_activityDataPreview;
  if ((unint64_t)activityDataPreview | *((void *)v4 + 1)) {
    char v10 = -[ASCodableActivityDataPreview isEqual:](activityDataPreview, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_handshakeToken hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_responseCode;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_inviteeCloudKitAddress hash];
  unint64_t v6 = [(ASCodableShareLocations *)self->_inviteeShareLocations hash];
  NSUInteger v7 = [(NSString *)self->_inviteeBuildNumber hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_inviteeVersion;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(ASCodableActivityDataPreview *)self->_activityDataPreview hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (*((void *)v4 + 2))
  {
    -[ASCodableInviteResponse setHandshakeToken:](self, "setHandshakeToken:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    self->_responseCode = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[ASCodableInviteResponse setInviteeCloudKitAddress:](self, "setInviteeCloudKitAddress:");
    id v4 = v9;
  }
  inviteeShareLocations = self->_inviteeShareLocations;
  uint64_t v6 = *((void *)v4 + 5);
  if (inviteeShareLocations)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[ASCodableShareLocations mergeFrom:](inviteeShareLocations, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[ASCodableInviteResponse setInviteeShareLocations:](self, "setInviteeShareLocations:");
  }
  id v4 = v9;
LABEL_13:
  if (*((void *)v4 + 3))
  {
    -[ASCodableInviteResponse setInviteeBuildNumber:](self, "setInviteeBuildNumber:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_inviteeVersion = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  activityDataPreview = self->_activityDataPreview;
  uint64_t v8 = *((void *)v4 + 1);
  if (activityDataPreview)
  {
    if (v8) {
      -[ASCodableActivityDataPreview mergeFrom:](activityDataPreview, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ASCodableInviteResponse setActivityDataPreview:](self, "setActivityDataPreview:");
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

- (int)responseCode
{
  return self->_responseCode;
}

- (NSString)inviteeCloudKitAddress
{
  return self->_inviteeCloudKitAddress;
}

- (void)setInviteeCloudKitAddress:(id)a3
{
}

- (ASCodableShareLocations)inviteeShareLocations
{
  return self->_inviteeShareLocations;
}

- (void)setInviteeShareLocations:(id)a3
{
}

- (NSString)inviteeBuildNumber
{
  return self->_inviteeBuildNumber;
}

- (void)setInviteeBuildNumber:(id)a3
{
}

- (unsigned)inviteeVersion
{
  return self->_inviteeVersion;
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
  objc_storeStrong((id *)&self->_inviteeShareLocations, 0);
  objc_storeStrong((id *)&self->_inviteeCloudKitAddress, 0);
  objc_storeStrong((id *)&self->_inviteeBuildNumber, 0);
  objc_storeStrong((id *)&self->_handshakeToken, 0);

  objc_storeStrong((id *)&self->_activityDataPreview, 0);
}

@end