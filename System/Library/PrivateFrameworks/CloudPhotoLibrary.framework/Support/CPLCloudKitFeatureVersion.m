@interface CPLCloudKitFeatureVersion
- (BOOL)hasEtag;
- (BOOL)hasServerToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serverToken;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setServerToken:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitFeatureVersion

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasServerToken
{
  return self->_serverToken != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCloudKitFeatureVersion;
  v3 = [(CPLCloudKitFeatureVersion *)&v7 description];
  v4 = [(CPLCloudKitFeatureVersion *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  serverToken = self->_serverToken;
  if (serverToken) {
    [v3 setObject:serverToken forKey:@"serverToken"];
  }
  etag = self->_etag;
  if (etag) {
    [v3 setObject:etag forKey:@"etag"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitFeatureVersionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_serverToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_etag)
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
    v4[1] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
  if (self->_serverToken)
  {
    objc_msgSend(v4, "setServerToken:");
    id v4 = v5;
  }
  if (self->_etag)
  {
    objc_msgSend(v5, "setEtag:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_version;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(NSData *)self->_serverToken copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_etag copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_version != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  serverToken = self->_serverToken;
  if ((unint64_t)serverToken | *((void *)v4 + 3) && !-[NSData isEqual:](serverToken, "isEqual:")) {
    goto LABEL_11;
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[NSString isEqual:](etag, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_serverToken hash] ^ v3;
  return v4 ^ [(NSString *)self->_etag hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[4])
  {
    self->_version = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  id v5 = v4;
  if (v4[3])
  {
    -[CPLCloudKitFeatureVersion setServerToken:](self, "setServerToken:");
    unint64_t v4 = v5;
  }
  if (v4[2])
  {
    -[CPLCloudKitFeatureVersion setEtag:](self, "setEtag:");
    unint64_t v4 = v5;
  }
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)serverToken
{
  return self->_serverToken;
}

- (void)setServerToken:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverToken, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end