@interface HDCloudSyncCodableAttachment
- (BOOL)hasAssetData;
- (BOOL)hasCreationDate;
- (BOOL)hasDeviceName;
- (BOOL)hasEncryptionKey;
- (BOOL)hasFileHash;
- (BOOL)hasFileName;
- (BOOL)hasFileSize;
- (BOOL)hasMetadata;
- (BOOL)hasMimeType;
- (BOOL)hasProductType;
- (BOOL)hasSystemBuildVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)assetData;
- (NSData)encryptionKey;
- (NSData)metadata;
- (NSString)deviceName;
- (NSString)fileHash;
- (NSString)fileName;
- (NSString)mimeType;
- (NSString)productType;
- (NSString)systemBuildVersion;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)fileSize;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetData:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setDeviceName:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasFileSize:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableAttachment

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFileSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMimeType
{
  return self->_mimeType != 0;
}

- (BOOL)hasFileHash
{
  return self->_fileHash != 0;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasAssetData
{
  return self->_assetData != 0;
}

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableAttachment;
  v4 = [(HDCloudSyncCodableAttachment *)&v8 description];
  v5 = [(HDCloudSyncCodableAttachment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  fileName = self->_fileName;
  if (fileName) {
    [v3 setObject:fileName forKey:@"fileName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_fileSize];
    [v4 setObject:v6 forKey:@"fileSize"];
  }
  mimeType = self->_mimeType;
  if (mimeType) {
    [v4 setObject:mimeType forKey:@"mimeType"];
  }
  fileHash = self->_fileHash;
  if (fileHash) {
    [v4 setObject:fileHash forKey:@"fileHash"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v9 forKey:@"creationDate"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  assetData = self->_assetData;
  if (assetData) {
    [v4 setObject:assetData forKey:@"assetData"];
  }
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v4 setObject:encryptionKey forKey:@"encryptionKey"];
  }
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion) {
    [v4 setObject:systemBuildVersion forKey:@"systemBuildVersion"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v4 setObject:deviceName forKey:@"deviceName"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_mimeType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fileHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_assetData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fileName)
  {
    objc_msgSend(v4, "setFileName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_fileSize;
    *((unsigned char *)v4 + 96) |= 2u;
  }
  if (self->_mimeType)
  {
    objc_msgSend(v5, "setMimeType:");
    id v4 = v5;
  }
  if (self->_fileHash)
  {
    objc_msgSend(v5, "setFileHash:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    id v4 = v5;
  }
  if (self->_assetData)
  {
    objc_msgSend(v5, "setAssetData:");
    id v4 = v5;
  }
  if (self->_encryptionKey)
  {
    objc_msgSend(v5, "setEncryptionKey:");
    id v4 = v5;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v5, "setSystemBuildVersion:");
    id v4 = v5;
  }
  if (self->_productType)
  {
    objc_msgSend(v5, "setProductType:");
    id v4 = v5;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v5, "setDeviceName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_fileName copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_fileSize;
    *(unsigned char *)(v5 + 96) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_mimeType copyWithZone:a3];
  v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  uint64_t v10 = [(NSString *)self->_fileHash copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  uint64_t v12 = [(NSData *)self->_metadata copyWithZone:a3];
  v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSData *)self->_assetData copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  uint64_t v18 = [(NSString *)self->_systemBuildVersion copyWithZone:a3];
  v19 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v18;

  uint64_t v20 = [(NSString *)self->_productType copyWithZone:a3];
  v21 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v20;

  uint64_t v22 = [(NSString *)self->_deviceName copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](fileName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_fileSize != *((void *)v4 + 2)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_30:
    char v14 = 0;
    goto LABEL_31;
  }
  mimeType = self->_mimeType;
  if ((unint64_t)mimeType | *((void *)v4 + 9) && !-[NSString isEqual:](mimeType, "isEqual:")) {
    goto LABEL_30;
  }
  fileHash = self->_fileHash;
  if ((unint64_t)fileHash | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](fileHash, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_30;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 8) && !-[NSData isEqual:](metadata, "isEqual:")) {
    goto LABEL_30;
  }
  assetData = self->_assetData;
  if ((unint64_t)assetData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](assetData, "isEqual:")) {
      goto LABEL_30;
    }
  }
  encryptionKey = self->_encryptionKey;
  if ((unint64_t)encryptionKey | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](encryptionKey, "isEqual:")) {
      goto LABEL_30;
    }
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](systemBuildVersion, "isEqual:")) {
      goto LABEL_30;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_30;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 4)) {
    char v14 = -[NSString isEqual:](deviceName, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fileName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_fileSize;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_mimeType hash];
  NSUInteger v6 = [(NSString *)self->_fileHash hash];
  if (*(unsigned char *)&self->_has)
  {
    double creationDate = self->_creationDate;
    double v9 = -creationDate;
    if (creationDate >= 0.0) {
      double v9 = self->_creationDate;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v13 = v7 ^ [(NSData *)self->_metadata hash];
  uint64_t v14 = v12 ^ v13 ^ [(NSData *)self->_assetData hash];
  uint64_t v15 = [(NSData *)self->_encryptionKey hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_systemBuildVersion hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_productType hash];
  return v14 ^ v17 ^ [(NSString *)self->_deviceName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 7))
  {
    -[HDCloudSyncCodableAttachment setFileName:](self, "setFileName:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    self->_fileSize = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCloudSyncCodableAttachment setMimeType:](self, "setMimeType:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCloudSyncCodableAttachment setFileHash:](self, "setFileHash:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_double creationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8))
  {
    -[HDCloudSyncCodableAttachment setMetadata:](self, "setMetadata:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCloudSyncCodableAttachment setAssetData:](self, "setAssetData:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCloudSyncCodableAttachment setEncryptionKey:](self, "setEncryptionKey:");
    id v4 = v5;
  }
  if (*((void *)v4 + 11))
  {
    -[HDCloudSyncCodableAttachment setSystemBuildVersion:](self, "setSystemBuildVersion:");
    id v4 = v5;
  }
  if (*((void *)v4 + 10))
  {
    -[HDCloudSyncCodableAttachment setProductType:](self, "setProductType:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCloudSyncCodableAttachment setDeviceName:](self, "setDeviceName:");
    id v4 = v5;
  }
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_assetData, 0);
}

@end