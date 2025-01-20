@interface CPLCloudKitResourceInfo
- (BOOL)hasFileSize;
- (BOOL)hasFileUTI;
- (BOOL)hasImageDimensions;
- (BOOL)hasStableHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CPLCloudKitResourceInfoImageDimensions)imageDimensions;
- (NSString)fileUTI;
- (NSString)stableHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileUTI:(id)a3;
- (void)setHasFileSize:(BOOL)a3;
- (void)setImageDimensions:(id)a3;
- (void)setStableHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitResourceInfo

- (void)setFileSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFileSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasImageDimensions
{
  return self->_imageDimensions != 0;
}

- (BOOL)hasFileUTI
{
  return self->_fileUTI != 0;
}

- (BOOL)hasStableHash
{
  return self->_stableHash != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCloudKitResourceInfo;
  v3 = [(CPLCloudKitResourceInfo *)&v7 description];
  v4 = [(CPLCloudKitResourceInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_fileSize];
    [v3 setObject:v4 forKey:@"fileSize"];
  }
  imageDimensions = self->_imageDimensions;
  if (imageDimensions)
  {
    v6 = [(CPLCloudKitResourceInfoImageDimensions *)imageDimensions dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"imageDimensions"];
  }
  fileUTI = self->_fileUTI;
  if (fileUTI) {
    [v3 setObject:fileUTI forKey:@"fileUTI"];
  }
  stableHash = self->_stableHash;
  if (stableHash) {
    [v3 setObject:stableHash forKey:@"stableHash"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitResourceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_imageDimensions)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fileUTI)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_stableHash)
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
    v4[1] = self->_fileSize;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_imageDimensions)
  {
    objc_msgSend(v4, "setImageDimensions:");
    id v4 = v5;
  }
  if (self->_fileUTI)
  {
    objc_msgSend(v5, "setFileUTI:");
    id v4 = v5;
  }
  if (self->_stableHash)
  {
    objc_msgSend(v5, "setStableHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_fileSize;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(CPLCloudKitResourceInfoImageDimensions *)self->_imageDimensions copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_fileUTI copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(NSString *)self->_stableHash copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_fileSize != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  imageDimensions = self->_imageDimensions;
  if ((unint64_t)imageDimensions | *((void *)v4 + 3)
    && !-[CPLCloudKitResourceInfoImageDimensions isEqual:](imageDimensions, "isEqual:"))
  {
    goto LABEL_13;
  }
  fileUTI = self->_fileUTI;
  if ((unint64_t)fileUTI | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](fileUTI, "isEqual:")) {
      goto LABEL_13;
    }
  }
  stableHash = self->_stableHash;
  if ((unint64_t)stableHash | *((void *)v4 + 4)) {
    unsigned __int8 v8 = -[NSString isEqual:](stableHash, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_fileSize;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(CPLCloudKitResourceInfoImageDimensions *)self->_imageDimensions hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_fileUTI hash];
  return v4 ^ v5 ^ [(NSString *)self->_stableHash hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  NSUInteger v5 = v4;
  if (v4[5])
  {
    self->_fileSize = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  imageDimensions = self->_imageDimensions;
  uint64_t v7 = v5[3];
  unsigned __int8 v8 = v5;
  if (imageDimensions)
  {
    if (!v7) {
      goto LABEL_9;
    }
    imageDimensions = (CPLCloudKitResourceInfoImageDimensions *)-[CPLCloudKitResourceInfoImageDimensions mergeFrom:](imageDimensions, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    imageDimensions = (CPLCloudKitResourceInfoImageDimensions *)-[CPLCloudKitResourceInfo setImageDimensions:](self, "setImageDimensions:");
  }
  NSUInteger v5 = v8;
LABEL_9:
  if (v5[2])
  {
    imageDimensions = (CPLCloudKitResourceInfoImageDimensions *)-[CPLCloudKitResourceInfo setFileUTI:](self, "setFileUTI:");
    NSUInteger v5 = v8;
  }
  if (v5[4])
  {
    imageDimensions = (CPLCloudKitResourceInfoImageDimensions *)-[CPLCloudKitResourceInfo setStableHash:](self, "setStableHash:");
    NSUInteger v5 = v8;
  }
  _objc_release_x1(imageDimensions, v5);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (CPLCloudKitResourceInfoImageDimensions)imageDimensions
{
  return self->_imageDimensions;
}

- (void)setImageDimensions:(id)a3
{
}

- (NSString)fileUTI
{
  return self->_fileUTI;
}

- (void)setFileUTI:(id)a3
{
}

- (NSString)stableHash
{
  return self->_stableHash;
}

- (void)setStableHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableHash, 0);
  objc_storeStrong((id *)&self->_imageDimensions, 0);
  objc_storeStrong((id *)&self->_fileUTI, 0);
}

@end