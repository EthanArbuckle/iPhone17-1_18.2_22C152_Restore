@interface ASCodableSecureCloudShareItem
- (BOOL)hasInvitationToken;
- (BOOL)hasShareURL;
- (BOOL)hasZoneName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)invitationToken;
- (NSString)shareURL;
- (NSString)zoneName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInvitationToken:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableSecureCloudShareItem

- (BOOL)hasShareURL
{
  return self->_shareURL != 0;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasInvitationToken
{
  return self->_invitationToken != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableSecureCloudShareItem;
  v4 = [(ASCodableSecureCloudShareItem *)&v8 description];
  v5 = [(ASCodableSecureCloudShareItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  shareURL = self->_shareURL;
  if (shareURL) {
    [v3 setObject:shareURL forKey:@"shareURL"];
  }
  zoneName = self->_zoneName;
  if (zoneName) {
    [v4 setObject:zoneName forKey:@"zoneName"];
  }
  invitationToken = self->_invitationToken;
  if (invitationToken) {
    [v4 setObject:invitationToken forKey:@"invitationToken"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableSecureCloudShareItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shareURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_invitationToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shareURL)
  {
    objc_msgSend(v4, "setShareURL:");
    id v4 = v5;
  }
  if (self->_zoneName)
  {
    objc_msgSend(v5, "setZoneName:");
    id v4 = v5;
  }
  if (self->_invitationToken)
  {
    objc_msgSend(v5, "setInvitationToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_shareURL copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_zoneName copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_invitationToken copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((shareURL = self->_shareURL, !((unint64_t)shareURL | v4[2]))
     || -[NSString isEqual:](shareURL, "isEqual:"))
    && ((zoneName = self->_zoneName, !((unint64_t)zoneName | v4[3]))
     || -[NSString isEqual:](zoneName, "isEqual:")))
  {
    invitationToken = self->_invitationToken;
    if ((unint64_t)invitationToken | v4[1]) {
      char v8 = -[NSData isEqual:](invitationToken, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_shareURL hash];
  NSUInteger v4 = [(NSString *)self->_zoneName hash] ^ v3;
  return v4 ^ [(NSData *)self->_invitationToken hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[ASCodableSecureCloudShareItem setShareURL:](self, "setShareURL:");
  }
  if (v4[3]) {
    -[ASCodableSecureCloudShareItem setZoneName:](self, "setZoneName:");
  }
  if (v4[1]) {
    -[ASCodableSecureCloudShareItem setInvitationToken:](self, "setInvitationToken:");
  }
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSData)invitationToken
{
  return self->_invitationToken;
}

- (void)setInvitationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);

  objc_storeStrong((id *)&self->_invitationToken, 0);
}

@end