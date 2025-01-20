@interface FPSearchableItemVersion
+ (id)stringFromVersion:(id)a3;
+ (id)versionFromString:(id)a3;
- (BOOL)hasContentVersion;
- (BOOL)hasMetadataVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contentVersion;
- (NSData)metadataVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentVersion:(id)a3;
- (void)setMetadataVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FPSearchableItemVersion

- (BOOL)readFrom:(id)a3
{
  return FPSearchableItemVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataVersion, 0);

  objc_storeStrong((id *)&self->_contentVersion, 0);
}

+ (id)versionFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  v6 = [[FPSearchableItemVersion alloc] initWithData:v5];
  v7 = [NSFileProviderItemVersion alloc];
  v8 = [(FPSearchableItemVersion *)v6 contentVersion];
  v9 = [(FPSearchableItemVersion *)v6 metadataVersion];
  v10 = [(NSFileProviderItemVersion *)v7 initWithContentVersion:v8 metadataVersion:v9];

  return v10;
}

- (NSData)metadataVersion
{
  return self->_metadataVersion;
}

- (NSData)contentVersion
{
  return self->_contentVersion;
}

+ (id)stringFromVersion:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(FPSearchableItemVersion);
    v5 = [v3 contentVersion];
    [(FPSearchableItemVersion *)v4 setContentVersion:v5];

    v6 = [v3 metadataVersion];

    [(FPSearchableItemVersion *)v4 setMetadataVersion:v6];
    v7 = [(FPSearchableItemVersion *)v4 data];
    v8 = [v7 base64EncodedStringWithOptions:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasContentVersion
{
  return self->_contentVersion != 0;
}

- (BOOL)hasMetadataVersion
{
  return self->_metadataVersion != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FPSearchableItemVersion;
  id v4 = [(FPSearchableItemVersion *)&v8 description];
  v5 = [(FPSearchableItemVersion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  contentVersion = self->_contentVersion;
  if (contentVersion) {
    [v3 setObject:contentVersion forKey:@"contentVersion"];
  }
  metadataVersion = self->_metadataVersion;
  if (metadataVersion) {
    [v4 setObject:metadataVersion forKey:@"metadataVersion"];
  }

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contentVersion)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_metadataVersion)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contentVersion)
  {
    objc_msgSend(v4, "setContentVersion:");
    id v4 = v5;
  }
  if (self->_metadataVersion)
  {
    objc_msgSend(v5, "setMetadataVersion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_contentVersion copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_metadataVersion copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contentVersion = self->_contentVersion, !((unint64_t)contentVersion | v4[1]))
     || -[NSData isEqual:](contentVersion, "isEqual:")))
  {
    metadataVersion = self->_metadataVersion;
    if ((unint64_t)metadataVersion | v4[2]) {
      char v7 = -[NSData isEqual:](metadataVersion, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_contentVersion hash];
  return [(NSData *)self->_metadataVersion hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[FPSearchableItemVersion setContentVersion:](self, "setContentVersion:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[FPSearchableItemVersion setMetadataVersion:](self, "setMetadataVersion:");
    id v4 = v5;
  }
}

- (void)setContentVersion:(id)a3
{
}

- (void)setMetadataVersion:(id)a3
{
}

@end