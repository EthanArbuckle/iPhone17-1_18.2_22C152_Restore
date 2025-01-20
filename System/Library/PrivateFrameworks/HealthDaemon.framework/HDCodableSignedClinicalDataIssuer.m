@interface HDCodableSignedClinicalDataIssuer
- (BOOL)hasIdentifier;
- (BOOL)hasMessageVersion;
- (BOOL)hasSubtitle;
- (BOOL)hasSyncIdentity;
- (BOOL)hasTitle;
- (BOOL)hasWellKnownURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMessageVersion)messageVersion;
- (HDCodableSyncIdentity)syncIdentity;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)wellKnownURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageVersion:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWellKnownURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSignedClinicalDataIssuer

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasWellKnownURL
{
  return self->_wellKnownURL != 0;
}

- (BOOL)hasMessageVersion
{
  return self->_messageVersion != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSignedClinicalDataIssuer;
  v4 = [(HDCodableSignedClinicalDataIssuer *)&v8 description];
  v5 = [(HDCodableSignedClinicalDataIssuer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v4 setObject:identifier forKey:@"identifier"];
  }
  wellKnownURL = self->_wellKnownURL;
  if (wellKnownURL) {
    [v4 setObject:wellKnownURL forKey:@"wellKnownURL"];
  }
  messageVersion = self->_messageVersion;
  if (messageVersion)
  {
    v10 = [(HDCodableMessageVersion *)messageVersion dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"MessageVersion"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v12 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSignedClinicalDataIssuerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_wellKnownURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_messageVersion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
    id v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_wellKnownURL)
  {
    objc_msgSend(v5, "setWellKnownURL:");
    id v4 = v5;
  }
  if (self->_messageVersion)
  {
    objc_msgSend(v5, "setMessageVersion:");
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_wellKnownURL copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(HDCodableMessageVersion *)self->_messageVersion copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | v4[5]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((subtitle = self->_subtitle, !((unint64_t)subtitle | v4[3]))
     || -[NSString isEqual:](subtitle, "isEqual:"))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((wellKnownURL = self->_wellKnownURL, !((unint64_t)wellKnownURL | v4[6]))
     || -[NSString isEqual:](wellKnownURL, "isEqual:"))
    && ((messageVersion = self->_messageVersion, !((unint64_t)messageVersion | v4[2]))
     || -[HDCodableMessageVersion isEqual:](messageVersion, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[4]) {
      char v11 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_wellKnownURL hash];
  unint64_t v7 = [(HDCodableMessageVersion *)self->_messageVersion hash];
  return v6 ^ v7 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = a3;
  if (v8[5]) {
    -[HDCodableSignedClinicalDataIssuer setTitle:](self, "setTitle:");
  }
  if (v8[3]) {
    -[HDCodableSignedClinicalDataIssuer setSubtitle:](self, "setSubtitle:");
  }
  if (v8[1]) {
    -[HDCodableSignedClinicalDataIssuer setIdentifier:](self, "setIdentifier:");
  }
  if (v8[6]) {
    -[HDCodableSignedClinicalDataIssuer setWellKnownURL:](self, "setWellKnownURL:");
  }
  messageVersion = self->_messageVersion;
  uint64_t v5 = v8[2];
  if (messageVersion)
  {
    if (v5) {
      -[HDCodableMessageVersion mergeFrom:](messageVersion, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[HDCodableSignedClinicalDataIssuer setMessageVersion:](self, "setMessageVersion:");
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v7 = v8[4];
  if (syncIdentity)
  {
    if (v7) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[HDCodableSignedClinicalDataIssuer setSyncIdentity:](self, "setSyncIdentity:");
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)wellKnownURL
{
  return self->_wellKnownURL;
}

- (void)setWellKnownURL:(id)a3
{
}

- (HDCodableMessageVersion)messageVersion
{
  return self->_messageVersion;
}

- (void)setMessageVersion:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellKnownURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_messageVersion, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end