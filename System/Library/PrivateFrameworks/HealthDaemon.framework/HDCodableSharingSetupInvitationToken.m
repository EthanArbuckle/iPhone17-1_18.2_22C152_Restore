@interface HDCodableSharingSetupInvitationToken
- (BOOL)hasShareURL;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)token;
- (NSString)shareURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSharingSetupInvitationToken

- (BOOL)hasShareURL
{
  return self->_shareURL != 0;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSharingSetupInvitationToken;
  v4 = [(HDCodableSharingSetupInvitationToken *)&v8 description];
  v5 = [(HDCodableSharingSetupInvitationToken *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  shareURL = self->_shareURL;
  if (shareURL) {
    [v3 setObject:shareURL forKey:@"shareURL"];
  }
  token = self->_token;
  if (token) {
    [v4 setObject:token forKey:@"token"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingSetupInvitationTokenReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_token)
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
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_shareURL copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_token copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((shareURL = self->_shareURL, !((unint64_t)shareURL | v4[1]))
     || -[NSString isEqual:](shareURL, "isEqual:")))
  {
    token = self->_token;
    if ((unint64_t)token | v4[2]) {
      char v7 = -[NSData isEqual:](token, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_shareURL hash];
  return [(NSData *)self->_token hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[HDCodableSharingSetupInvitationToken setShareURL:](self, "setShareURL:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[HDCodableSharingSetupInvitationToken setToken:](self, "setToken:");
    id v4 = v5;
  }
}

- (NSString)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end