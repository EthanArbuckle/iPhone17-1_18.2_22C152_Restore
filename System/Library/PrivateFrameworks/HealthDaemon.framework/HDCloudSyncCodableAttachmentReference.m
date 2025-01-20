@interface HDCloudSyncCodableAttachmentReference
- (BOOL)hasAttachmentIdentifier;
- (BOOL)hasCreationDate;
- (BOOL)hasDeviceName;
- (BOOL)hasMetadata;
- (BOOL)hasObjectIdentifier;
- (BOOL)hasOptions;
- (BOOL)hasProductType;
- (BOOL)hasSchemaIdentifier;
- (BOOL)hasSchemaVersion;
- (BOOL)hasSystemBuildVersion;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)metadata;
- (NSString)attachmentIdentifier;
- (NSString)deviceName;
- (NSString)objectIdentifier;
- (NSString)productType;
- (NSString)schemaIdentifier;
- (NSString)systemBuildVersion;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)options;
- (int64_t)schemaVersion;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentIdentifier:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasOptions:(BOOL)a3;
- (void)setHasSchemaVersion:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setProductType:(id)a3;
- (void)setSchemaIdentifier:(id)a3;
- (void)setSchemaVersion:(int64_t)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableAttachmentReference

- (BOOL)hasObjectIdentifier
{
  return self->_objectIdentifier != 0;
}

- (BOOL)hasSchemaIdentifier
{
  return self->_schemaIdentifier != 0;
}

- (BOOL)hasAttachmentIdentifier
{
  return self->_attachmentIdentifier != 0;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (void)setOptions:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOptions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (void)setSchemaVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_schemaVersion = a3;
}

- (void)setHasSchemaVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSchemaVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)HDCloudSyncCodableAttachmentReference;
  v4 = [(HDCloudSyncCodableAttachmentReference *)&v8 description];
  v5 = [(HDCloudSyncCodableAttachmentReference *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  objectIdentifier = self->_objectIdentifier;
  if (objectIdentifier) {
    [v3 setObject:objectIdentifier forKey:@"objectIdentifier"];
  }
  schemaIdentifier = self->_schemaIdentifier;
  if (schemaIdentifier) {
    [v4 setObject:schemaIdentifier forKey:@"schemaIdentifier"];
  }
  attachmentIdentifier = self->_attachmentIdentifier;
  if (attachmentIdentifier) {
    [v4 setObject:attachmentIdentifier forKey:@"attachmentIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v16 = [NSNumber numberWithLongLong:self->_type];
    [v4 setObject:v16 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v17 = [NSNumber numberWithDouble:self->_creationDate];
  [v4 setObject:v17 forKey:@"creationDate"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    v9 = [NSNumber numberWithLongLong:self->_options];
    [v4 setObject:v9 forKey:@"options"];
  }
LABEL_11:
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_schemaVersion];
    [v4 setObject:v11 forKey:@"schemaVersion"];
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
  return HDCloudSyncCodableAttachmentReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_objectIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_schemaIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_attachmentIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_11:
  if (self->_metadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_objectIdentifier)
  {
    objc_msgSend(v4, "setObjectIdentifier:");
    id v4 = v6;
  }
  if (self->_schemaIdentifier)
  {
    objc_msgSend(v6, "setSchemaIdentifier:");
    id v4 = v6;
  }
  if (self->_attachmentIdentifier)
  {
    objc_msgSend(v6, "setAttachmentIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = self->_type;
    *((unsigned char *)v4 + 96) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 1) = *(void *)&self->_creationDate;
  *((unsigned char *)v4 + 96) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((void *)v4 + 2) = self->_options;
    *((unsigned char *)v4 + 96) |= 2u;
  }
LABEL_11:
  if (self->_metadata)
  {
    objc_msgSend(v6, "setMetadata:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_schemaVersion;
    *((unsigned char *)v4 + 96) |= 4u;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v6, "setSystemBuildVersion:");
    id v4 = v6;
  }
  if (self->_productType)
  {
    objc_msgSend(v6, "setProductType:");
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_objectIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_schemaIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  uint64_t v10 = [(NSString *)self->_attachmentIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 96) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_creationDate;
  *(unsigned char *)(v5 + 96) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(void *)(v5 + 16) = self->_options;
    *(unsigned char *)(v5 + 96) |= 2u;
  }
LABEL_5:
  uint64_t v13 = [(NSData *)self->_metadata copyWithZone:a3];
  v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_schemaVersion;
    *(unsigned char *)(v5 + 96) |= 4u;
  }
  uint64_t v15 = [(NSString *)self->_systemBuildVersion copyWithZone:a3];
  v16 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v15;

  uint64_t v17 = [(NSString *)self->_productType copyWithZone:a3];
  v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  uint64_t v19 = [(NSString *)self->_deviceName copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  objectIdentifier = self->_objectIdentifier;
  if ((unint64_t)objectIdentifier | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](objectIdentifier, "isEqual:")) {
      goto LABEL_37;
    }
  }
  schemaIdentifier = self->_schemaIdentifier;
  if ((unint64_t)schemaIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](schemaIdentifier, "isEqual:")) {
      goto LABEL_37;
    }
  }
  attachmentIdentifier = self->_attachmentIdentifier;
  if ((unint64_t)attachmentIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](attachmentIdentifier, "isEqual:")) {
      goto LABEL_37;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 96);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_type != *((void *)v4 + 4)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    goto LABEL_37;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_options != *((void *)v4 + 2)) {
      goto LABEL_37;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_37;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](metadata, "isEqual:"))
    {
LABEL_37:
      char v14 = 0;
      goto LABEL_38;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 96);
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_schemaVersion != *((void *)v4 + 3)) {
      goto LABEL_37;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_37;
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((void *)v4 + 11)
    && !-[NSString isEqual:](systemBuildVersion, "isEqual:"))
  {
    goto LABEL_37;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_37;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 6)) {
    char v14 = -[NSString isEqual:](deviceName, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_38:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_schemaIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_attachmentIdentifier hash];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double creationDate = self->_creationDate;
  double v9 = -creationDate;
  if (creationDate >= 0.0) {
    double v9 = self->_creationDate;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_11:
  if ((has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_options;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(NSData *)self->_metadata hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_schemaVersion;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15;
  NSUInteger v17 = [(NSString *)self->_systemBuildVersion hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_productType hash];
  return v16 ^ v18 ^ [(NSString *)self->_deviceName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 8))
  {
    -[HDCloudSyncCodableAttachmentReference setObjectIdentifier:](self, "setObjectIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[HDCloudSyncCodableAttachmentReference setSchemaIdentifier:](self, "setSchemaIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCloudSyncCodableAttachmentReference setAttachmentIdentifier:](self, "setAttachmentIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 96);
  if ((v5 & 8) != 0)
  {
    self->_type = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 96);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_double creationDate = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
LABEL_10:
    self->_options = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
  if (*((void *)v4 + 7))
  {
    -[HDCloudSyncCodableAttachmentReference setMetadata:](self, "setMetadata:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    self->_schemaVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 11))
  {
    -[HDCloudSyncCodableAttachmentReference setSystemBuildVersion:](self, "setSystemBuildVersion:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCloudSyncCodableAttachmentReference setProductType:](self, "setProductType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCloudSyncCodableAttachmentReference setDeviceName:](self, "setDeviceName:");
    id v4 = v6;
  }
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void)setSchemaIdentifier:(id)a3
{
}

- (NSString)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (void)setAttachmentIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (int64_t)options
{
  return self->_options;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
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
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
}

@end