@interface HDCodableSharingAuthorization
- (BOOL)hasAuthorizationIdentifier;
- (BOOL)hasDisplayName;
- (BOOL)hasDisplaySubtitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSharingAuthorization)initWithSharingAuthorization:(id)a3;
- (NSString)authorizationIdentifier;
- (NSString)displayName;
- (NSString)displaySubtitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sharingAuthorization;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplaySubtitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSharingAuthorization

- (BOOL)hasAuthorizationIdentifier
{
  return self->_authorizationIdentifier != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasDisplaySubtitle
{
  return self->_displaySubtitle != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSharingAuthorization;
  v4 = [(HDCodableSharingAuthorization *)&v8 description];
  v5 = [(HDCodableSharingAuthorization *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  authorizationIdentifier = self->_authorizationIdentifier;
  if (authorizationIdentifier) {
    [v3 setObject:authorizationIdentifier forKey:@"authorizationIdentifier"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  displaySubtitle = self->_displaySubtitle;
  if (displaySubtitle) {
    [v4 setObject:displaySubtitle forKey:@"displaySubtitle"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSharingAuthorizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_authorizationIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_displaySubtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_authorizationIdentifier)
  {
    objc_msgSend(v4, "setAuthorizationIdentifier:");
    id v4 = v5;
  }
  if (self->_displayName)
  {
    objc_msgSend(v5, "setDisplayName:");
    id v4 = v5;
  }
  if (self->_displaySubtitle)
  {
    objc_msgSend(v5, "setDisplaySubtitle:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_authorizationIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_displaySubtitle copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((authorizationIdentifier = self->_authorizationIdentifier, !((unint64_t)authorizationIdentifier | v4[1]))
     || -[NSString isEqual:](authorizationIdentifier, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[2]))
     || -[NSString isEqual:](displayName, "isEqual:")))
  {
    displaySubtitle = self->_displaySubtitle;
    if ((unint64_t)displaySubtitle | v4[3]) {
      char v8 = -[NSString isEqual:](displaySubtitle, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_authorizationIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash] ^ v3;
  return v4 ^ [(NSString *)self->_displaySubtitle hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[HDCodableSharingAuthorization setAuthorizationIdentifier:](self, "setAuthorizationIdentifier:");
  }
  if (v4[2]) {
    -[HDCodableSharingAuthorization setDisplayName:](self, "setDisplayName:");
  }
  if (v4[3]) {
    -[HDCodableSharingAuthorization setDisplaySubtitle:](self, "setDisplaySubtitle:");
  }
}

- (NSString)authorizationIdentifier
{
  return self->_authorizationIdentifier;
}

- (void)setAuthorizationIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displaySubtitle
{
  return self->_displaySubtitle;
}

- (void)setDisplaySubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_authorizationIdentifier, 0);
}

- (HDCodableSharingAuthorization)initWithSharingAuthorization:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDCodableSharingAuthorization;
  id v5 = [(HDCodableSharingAuthorization *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 authorizationIdentifier];
    [(HDCodableSharingAuthorization *)v5 setAuthorizationIdentifier:v6];

    v7 = [v4 displayName];

    if (v7)
    {
      char v8 = [v4 displayName];
      [(HDCodableSharingAuthorization *)v5 setDisplayName:v8];
    }
    v9 = [v4 displaySubtitle];

    if (v9)
    {
      uint64_t v10 = [v4 displaySubtitle];
      [(HDCodableSharingAuthorization *)v5 setDisplaySubtitle:v10];
    }
  }

  return v5;
}

- (id)sharingAuthorization
{
  id v3 = objc_alloc(MEMORY[0x1E4F2B4D8]);
  id v4 = [(HDCodableSharingAuthorization *)self authorizationIdentifier];
  id v5 = [(HDCodableSharingAuthorization *)self displayName];
  uint64_t v6 = [(HDCodableSharingAuthorization *)self displaySubtitle];
  v7 = (void *)[v3 initWithAuthorizationIdentifier:v4 displayName:v5 displaySubtitle:v6];

  return v7;
}

@end