@interface HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor
- (BOOL)hasBuildVersion;
- (BOOL)hasDownloadSize;
- (BOOL)hasErrorCode;
- (BOOL)hasHumanReadableUpdateName;
- (BOOL)hasMajorVersion;
- (BOOL)hasMinorVersion;
- (BOOL)hasRampEnabled;
- (BOOL)hasServerAssetAlgorithm;
- (BOOL)hasServerAssetMeasurement;
- (BOOL)hasServerAssetURL;
- (BOOL)hasStatus;
- (BOOL)hasUpdateVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)rampEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)serverAssetMeasurement;
- (NSString)buildVersion;
- (NSString)humanReadableUpdateName;
- (NSString)serverAssetAlgorithm;
- (NSString)serverAssetURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)downloadSize;
- (int64_t)errorCode;
- (int64_t)majorVersion;
- (int64_t)minorVersion;
- (int64_t)status;
- (int64_t)updateVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDownloadSize:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setHasDownloadSize:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasMajorVersion:(BOOL)a3;
- (void)setHasMinorVersion:(BOOL)a3;
- (void)setHasRampEnabled:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasUpdateVersion:(BOOL)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setMajorVersion:(int64_t)a3;
- (void)setMinorVersion:(int64_t)a3;
- (void)setRampEnabled:(BOOL)a3;
- (void)setServerAssetAlgorithm:(id)a3;
- (void)setServerAssetMeasurement:(id)a3;
- (void)setServerAssetURL:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUpdateVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAssetURL, 0);
  objc_storeStrong((id *)&self->_serverAssetMeasurement, 0);
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);

  objc_storeStrong((id *)&self->_buildVersion, 0);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (BOOL)rampEnabled
{
  return self->_rampEnabled;
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSString)humanReadableUpdateName
{
  return self->_humanReadableUpdateName;
}

- (int64_t)downloadSize
{
  return self->_downloadSize;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (int64_t)updateVersion
{
  return self->_updateVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setServerAssetMeasurement:(id)a3
{
}

- (NSData)serverAssetMeasurement
{
  return self->_serverAssetMeasurement;
}

- (void)setServerAssetAlgorithm:(id)a3
{
}

- (NSString)serverAssetAlgorithm
{
  return self->_serverAssetAlgorithm;
}

- (void)setServerAssetURL:(id)a3
{
}

- (NSString)serverAssetURL
{
  return self->_serverAssetURL;
}

- (int64_t)status
{
  return self->_status;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    self->_status = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  id v7 = v4;
  if (*((void *)v4 + 11))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetURL:](self, "setServerAssetURL:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetAlgorithm:](self, "setServerAssetAlgorithm:");
    id v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setServerAssetMeasurement:](self, "setServerAssetMeasurement:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 100);
  if ((v5 & 4) != 0)
  {
    self->_majorVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 100);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_minorVersion = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
  {
LABEL_12:
    self->_updateVersion = *((void *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_13:
  if (*((void *)v4 + 7))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setBuildVersion:](self, "setBuildVersion:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 100))
  {
    self->_downloadSize = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 8))
  {
    -[HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor setHumanReadableUpdateName:](self, "setHumanReadableUpdateName:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 100);
  if ((v6 & 0x40) != 0)
  {
    self->_rampEnabled = *((unsigned char *)v4 + 96);
    *(unsigned char *)&self->_has |= 0x40u;
    char v6 = *((unsigned char *)v4 + 100);
  }
  if ((v6 & 2) != 0)
  {
    self->_errorCode = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v15 = 2654435761 * self->_status;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_serverAssetURL hash];
  NSUInteger v3 = [(NSString *)self->_serverAssetAlgorithm hash];
  uint64_t v4 = [(NSData *)self->_serverAssetMeasurement hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v5 = 2654435761 * self->_majorVersion;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_minorVersion;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_updateVersion;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_buildVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_downloadSize;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_humanReadableUpdateName hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v11 = 2654435761 * self->_rampEnabled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_16;
    }
LABEL_18:
    uint64_t v12 = 0;
    return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v12 = 2654435761 * self->_errorCode;
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0 || self->_status != *((void *)v4 + 5)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_51;
  }
  serverAssetURL = self->_serverAssetURL;
  if ((unint64_t)serverAssetURL | *((void *)v4 + 11)
    && !-[NSString isEqual:](serverAssetURL, "isEqual:"))
  {
    goto LABEL_51;
  }
  serverAssetAlgorithm = self->_serverAssetAlgorithm;
  if ((unint64_t)serverAssetAlgorithm | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](serverAssetAlgorithm, "isEqual:")) {
      goto LABEL_51;
    }
  }
  serverAssetMeasurement = self->_serverAssetMeasurement;
  if ((unint64_t)serverAssetMeasurement | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](serverAssetMeasurement, "isEqual:")) {
      goto LABEL_51;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 100);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_majorVersion != *((void *)v4 + 3)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0 || self->_minorVersion != *((void *)v4 + 4)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_51;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x20) == 0 || self->_updateVersion != *((void *)v4 + 6)) {
      goto LABEL_51;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
  {
    goto LABEL_51;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:")) {
      goto LABEL_51;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 100);
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_downloadSize != *((void *)v4 + 1)) {
      goto LABEL_51;
    }
  }
  else if (v9)
  {
    goto LABEL_51;
  }
  humanReadableUpdateName = self->_humanReadableUpdateName;
  if ((unint64_t)humanReadableUpdateName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](humanReadableUpdateName, "isEqual:")) {
      goto LABEL_51;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 100);
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) != 0)
    {
      if (self->_rampEnabled)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_51;
        }
        goto LABEL_47;
      }
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_47;
      }
    }
LABEL_51:
    BOOL v12 = 0;
    goto LABEL_52;
  }
  if ((v9 & 0x40) != 0) {
    goto LABEL_51;
  }
LABEL_47:
  BOOL v12 = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_errorCode != *((void *)v4 + 2)) {
      goto LABEL_51;
    }
    BOOL v12 = 1;
  }
LABEL_52:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_status;
    *(unsigned char *)(v5 + 100) |= 0x10u;
  }
  uint64_t v7 = [(NSString *)self->_serverAssetURL copyWithZone:a3];
  NSUInteger v8 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v7;

  uint64_t v9 = [(NSString *)self->_serverAssetAlgorithm copyWithZone:a3];
  NSUInteger v10 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v9;

  uint64_t v11 = [(NSData *)self->_serverAssetMeasurement copyWithZone:a3];
  BOOL v12 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v11;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_majorVersion;
    *(unsigned char *)(v6 + 100) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 32) = self->_minorVersion;
  *(unsigned char *)(v6 + 100) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(void *)(v6 + 48) = self->_updateVersion;
    *(unsigned char *)(v6 + 100) |= 0x20u;
  }
LABEL_7:
  uint64_t v14 = [(NSString *)self->_buildVersion copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_downloadSize;
    *(unsigned char *)(v6 + 100) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_humanReadableUpdateName copyWithZone:a3];
  v17 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v16;

  char v18 = (char)self->_has;
  if ((v18 & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 96) = self->_rampEnabled;
    *(unsigned char *)(v6 + 100) |= 0x40u;
    char v18 = (char)self->_has;
  }
  if ((v18 & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_errorCode;
    *(unsigned char *)(v6 + 100) |= 2u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[5] = self->_status;
    *((unsigned char *)v4 + 100) |= 0x10u;
  }
  uint64_t v7 = v4;
  if (self->_serverAssetURL)
  {
    objc_msgSend(v4, "setServerAssetURL:");
    id v4 = v7;
  }
  if (self->_serverAssetAlgorithm)
  {
    objc_msgSend(v7, "setServerAssetAlgorithm:");
    id v4 = v7;
  }
  if (self->_serverAssetMeasurement)
  {
    objc_msgSend(v7, "setServerAssetMeasurement:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_majorVersion;
    *((unsigned char *)v4 + 100) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  v4[4] = self->_minorVersion;
  *((unsigned char *)v4 + 100) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    v4[6] = self->_updateVersion;
    *((unsigned char *)v4 + 100) |= 0x20u;
  }
LABEL_13:
  if (self->_buildVersion)
  {
    objc_msgSend(v7, "setBuildVersion:");
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_downloadSize;
    *((unsigned char *)v4 + 100) |= 1u;
  }
  if (self->_humanReadableUpdateName)
  {
    objc_msgSend(v7, "setHumanReadableUpdateName:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((unsigned char *)v4 + 96) = self->_rampEnabled;
    *((unsigned char *)v4 + 100) |= 0x40u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 100) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_serverAssetURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_serverAssetAlgorithm) {
    PBDataWriterWriteStringField();
  }
  if (self->_serverAssetMeasurement) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt64Field();
LABEL_13:
  if (self->_buildVersion) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_humanReadableUpdateName) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMSoftwareUpdateEventProtoSoftwareUpdateDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    id v4 = [NSNumber numberWithLongLong:self->_status];
    [v3 setObject:v4 forKey:@"status"];
  }
  serverAssetURL = self->_serverAssetURL;
  if (serverAssetURL) {
    [v3 setObject:serverAssetURL forKey:@"serverAssetURL"];
  }
  serverAssetAlgorithm = self->_serverAssetAlgorithm;
  if (serverAssetAlgorithm) {
    [v3 setObject:serverAssetAlgorithm forKey:@"serverAssetAlgorithm"];
  }
  serverAssetMeasurement = self->_serverAssetMeasurement;
  if (serverAssetMeasurement) {
    [v3 setObject:serverAssetMeasurement forKey:@"serverAssetMeasurement"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v17 = [NSNumber numberWithLongLong:self->_majorVersion];
    [v3 setObject:v17 forKey:@"majorVersion"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  char v18 = [NSNumber numberWithLongLong:self->_minorVersion];
  [v3 setObject:v18 forKey:@"minorVersion"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v9 = [NSNumber numberWithLongLong:self->_updateVersion];
    [v3 setObject:v9 forKey:@"updateVersion"];
  }
LABEL_13:
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v3 setObject:buildVersion forKey:@"buildVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = [NSNumber numberWithLongLong:self->_downloadSize];
    [v3 setObject:v11 forKey:@"downloadSize"];
  }
  humanReadableUpdateName = self->_humanReadableUpdateName;
  if (humanReadableUpdateName) {
    [v3 setObject:humanReadableUpdateName forKey:@"humanReadableUpdateName"];
  }
  char v13 = (char)self->_has;
  if ((v13 & 0x40) != 0)
  {
    uint64_t v14 = [NSNumber numberWithBool:self->_rampEnabled];
    [v3 setObject:v14 forKey:@"rampEnabled"];

    char v13 = (char)self->_has;
  }
  if ((v13 & 2) != 0)
  {
    uint64_t v15 = [NSNumber numberWithLongLong:self->_errorCode];
    [v3 setObject:v15 forKey:@"errorCode"];
  }

  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor;
  id v4 = [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)&v8 description];
  char v5 = [(HMSoftwareUpdateEventProtoSoftwareUpdateDescriptor *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (BOOL)hasRampEnabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasRampEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setRampEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_rampEnabled = a3;
}

- (BOOL)hasHumanReadableUpdateName
{
  return self->_humanReadableUpdateName != 0;
}

- (BOOL)hasDownloadSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDownloadSize:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDownloadSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_downloadSize = a3;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasUpdateVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasUpdateVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setUpdateVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_updateVersion = a3;
}

- (BOOL)hasMinorVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setMinorVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minorVersion = a3;
}

- (BOOL)hasMajorVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setMajorVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_majorVersion = a3;
}

- (BOOL)hasServerAssetMeasurement
{
  return self->_serverAssetMeasurement != 0;
}

- (BOOL)hasServerAssetAlgorithm
{
  return self->_serverAssetAlgorithm != 0;
}

- (BOOL)hasServerAssetURL
{
  return self->_serverAssetURL != 0;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_status = a3;
}

@end