@interface OTEscrowRecordMetadataClientMetadata
- (BOOL)hasDeviceColor;
- (BOOL)hasDeviceEnclosureColor;
- (BOOL)hasDeviceMid;
- (BOOL)hasDeviceModel;
- (BOOL)hasDeviceModelClass;
- (BOOL)hasDeviceModelVersion;
- (BOOL)hasDeviceName;
- (BOOL)hasDevicePlatform;
- (BOOL)hasSecureBackupMetadataTimestamp;
- (BOOL)hasSecureBackupNumericPassphraseLength;
- (BOOL)hasSecureBackupUsesComplexPassphrase;
- (BOOL)hasSecureBackupUsesNumericPassphrase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)deviceMid;
- (NSString)deviceModel;
- (NSString)deviceModelClass;
- (NSString)deviceModelVersion;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)devicePlatform;
- (unint64_t)hash;
- (unint64_t)secureBackupMetadataTimestamp;
- (unint64_t)secureBackupNumericPassphraseLength;
- (unint64_t)secureBackupUsesComplexPassphrase;
- (unint64_t)secureBackupUsesNumericPassphrase;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDeviceMid:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceModelClass:(id)a3;
- (void)setDeviceModelVersion:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDevicePlatform:(unint64_t)a3;
- (void)setHasDevicePlatform:(BOOL)a3;
- (void)setHasSecureBackupMetadataTimestamp:(BOOL)a3;
- (void)setHasSecureBackupNumericPassphraseLength:(BOOL)a3;
- (void)setHasSecureBackupUsesComplexPassphrase:(BOOL)a3;
- (void)setHasSecureBackupUsesNumericPassphrase:(BOOL)a3;
- (void)setSecureBackupMetadataTimestamp:(unint64_t)a3;
- (void)setSecureBackupNumericPassphraseLength:(unint64_t)a3;
- (void)setSecureBackupUsesComplexPassphrase:(unint64_t)a3;
- (void)setSecureBackupUsesNumericPassphrase:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowRecordMetadataClientMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceModelVersion, 0);
  objc_storeStrong((id *)&self->_deviceModelClass, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceMid, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);

  objc_storeStrong((id *)&self->_deviceColor, 0);
}

- (unint64_t)devicePlatform
{
  return self->_devicePlatform;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceModelVersion:(id)a3
{
}

- (NSString)deviceModelVersion
{
  return self->_deviceModelVersion;
}

- (void)setDeviceModelClass:(id)a3
{
}

- (NSString)deviceModelClass
{
  return self->_deviceModelClass;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceMid:(id)a3
{
}

- (NSString)deviceMid
{
  return self->_deviceMid;
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (unint64_t)secureBackupUsesNumericPassphrase
{
  return self->_secureBackupUsesNumericPassphrase;
}

- (unint64_t)secureBackupUsesComplexPassphrase
{
  return self->_secureBackupUsesComplexPassphrase;
}

- (unint64_t)secureBackupNumericPassphraseLength
{
  return self->_secureBackupNumericPassphraseLength;
}

- (unint64_t)secureBackupMetadataTimestamp
{
  return self->_secureBackupMetadataTimestamp;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 104);
  if ((v5 & 2) != 0)
  {
    self->_secureBackupMetadataTimestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_secureBackupNumericPassphraseLength = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 104);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  self->_secureBackupUsesComplexPassphrase = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
  {
LABEL_5:
    self->_secureBackupUsesNumericPassphrase = *((void *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_6:
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceColor:](self, "setDeviceColor:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceMid:](self, "setDeviceMid:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModel:](self, "setDeviceModel:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModelClass:](self, "setDeviceModelClass:");
    id v4 = v6;
  }
  if (*((void *)v4 + 11))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceModelVersion:](self, "setDeviceModelVersion:");
    id v4 = v6;
  }
  if (*((void *)v4 + 12))
  {
    -[OTEscrowRecordMetadataClientMetadata setDeviceName:](self, "setDeviceName:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 104))
  {
    self->_devicePlatform = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v16 = 2654435761u * self->_secureBackupMetadataTimestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      unint64_t v14 = 2654435761u * self->_secureBackupNumericPassphraseLength;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v3 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v14 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v3 = 2654435761u * self->_secureBackupUsesComplexPassphrase;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v4 = 2654435761u * self->_secureBackupUsesNumericPassphrase;
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v4 = 0;
LABEL_10:
  NSUInteger v5 = [(NSString *)self->_deviceColor hash];
  NSUInteger v6 = [(NSString *)self->_deviceEnclosureColor hash];
  NSUInteger v7 = [(NSString *)self->_deviceMid hash];
  NSUInteger v8 = [(NSString *)self->_deviceModel hash];
  NSUInteger v9 = [(NSString *)self->_deviceModelClass hash];
  NSUInteger v10 = [(NSString *)self->_deviceModelVersion hash];
  NSUInteger v11 = [(NSString *)self->_deviceName hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v12 = 2654435761u * self->_devicePlatform;
  }
  else {
    unint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_secureBackupMetadataTimestamp != *((void *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
LABEL_40:
    BOOL v12 = 0;
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_secureBackupNumericPassphraseLength != *((void *)v4 + 3)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 8) == 0 || self->_secureBackupUsesComplexPassphrase != *((void *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x10) == 0 || self->_secureBackupUsesNumericPassphrase != *((void *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  deviceColor = self->_deviceColor;
  if ((unint64_t)deviceColor | *((void *)v4 + 6)
    && !-[NSString isEqual:](deviceColor, "isEqual:"))
  {
    goto LABEL_40;
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if ((unint64_t)deviceEnclosureColor | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceEnclosureColor, "isEqual:")) {
      goto LABEL_40;
    }
  }
  deviceMid = self->_deviceMid;
  if ((unint64_t)deviceMid | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](deviceMid, "isEqual:")) {
      goto LABEL_40;
    }
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_40;
    }
  }
  deviceModelClass = self->_deviceModelClass;
  if ((unint64_t)deviceModelClass | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](deviceModelClass, "isEqual:")) {
      goto LABEL_40;
    }
  }
  deviceModelVersion = self->_deviceModelVersion;
  if ((unint64_t)deviceModelVersion | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](deviceModelVersion, "isEqual:")) {
      goto LABEL_40;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_40;
    }
  }
  BOOL v12 = (*((unsigned char *)v4 + 104) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_devicePlatform != *((void *)v4 + 1)) {
      goto LABEL_40;
    }
    BOOL v12 = 1;
  }
LABEL_41:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_secureBackupMetadataTimestamp;
    *((unsigned char *)v5 + 104) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = self->_secureBackupNumericPassphraseLength;
  *((unsigned char *)v5 + 104) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v5[4] = self->_secureBackupUsesComplexPassphrase;
  *((unsigned char *)v5 + 104) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5[5] = self->_secureBackupUsesNumericPassphrase;
    *((unsigned char *)v5 + 104) |= 0x10u;
  }
LABEL_6:
  id v8 = [(NSString *)self->_deviceColor copyWithZone:a3];
  NSUInteger v9 = (void *)v6[6];
  v6[6] = v8;

  id v10 = [(NSString *)self->_deviceEnclosureColor copyWithZone:a3];
  NSUInteger v11 = (void *)v6[7];
  v6[7] = v10;

  id v12 = [(NSString *)self->_deviceMid copyWithZone:a3];
  v13 = (void *)v6[8];
  v6[8] = v12;

  id v14 = [(NSString *)self->_deviceModel copyWithZone:a3];
  uint64_t v15 = (void *)v6[9];
  v6[9] = v14;

  id v16 = [(NSString *)self->_deviceModelClass copyWithZone:a3];
  v17 = (void *)v6[10];
  v6[10] = v16;

  id v18 = [(NSString *)self->_deviceModelVersion copyWithZone:a3];
  v19 = (void *)v6[11];
  v6[11] = v18;

  id v20 = [(NSString *)self->_deviceName copyWithZone:a3];
  v21 = (void *)v6[12];
  v6[12] = v20;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_devicePlatform;
    *((unsigned char *)v6 + 104) |= 1u;
  }
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_secureBackupMetadataTimestamp;
    *((unsigned char *)v4 + 104) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_secureBackupNumericPassphraseLength;
  *((unsigned char *)v4 + 104) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  v4[4] = self->_secureBackupUsesComplexPassphrase;
  *((unsigned char *)v4 + 104) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v4[5] = self->_secureBackupUsesNumericPassphrase;
    *((unsigned char *)v4 + 104) |= 0x10u;
  }
LABEL_6:
  NSUInteger v6 = v4;
  if (self->_deviceColor)
  {
    objc_msgSend(v4, "setDeviceColor:");
    id v4 = v6;
  }
  if (self->_deviceEnclosureColor)
  {
    objc_msgSend(v6, "setDeviceEnclosureColor:");
    id v4 = v6;
  }
  if (self->_deviceMid)
  {
    objc_msgSend(v6, "setDeviceMid:");
    id v4 = v6;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v6, "setDeviceModel:");
    id v4 = v6;
  }
  if (self->_deviceModelClass)
  {
    objc_msgSend(v6, "setDeviceModelClass:");
    id v4 = v6;
  }
  if (self->_deviceModelVersion)
  {
    objc_msgSend(v6, "setDeviceModelVersion:");
    id v4 = v6;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v6, "setDeviceName:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_devicePlatform;
    *((unsigned char *)v4 + 104) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_deviceColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceEnclosureColor) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceMid) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModelClass) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceModelVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_10021A960((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:self->_secureBackupMetadataTimestamp];
    [v3 setObject:v15 forKey:@"secure_backup_metadata_timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  id v16 = +[NSNumber numberWithUnsignedLongLong:self->_secureBackupNumericPassphraseLength];
  [v3 setObject:v16 forKey:@"secure_backup_numeric_passphrase_length"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  v17 = +[NSNumber numberWithUnsignedLongLong:self->_secureBackupUsesComplexPassphrase];
  [v3 setObject:v17 forKey:@"secure_backup_uses_complex_passphrase"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    id v5 = +[NSNumber numberWithUnsignedLongLong:self->_secureBackupUsesNumericPassphrase];
    [v3 setObject:v5 forKey:@"secure_backup_uses_numeric_passphrase"];
  }
LABEL_6:
  deviceColor = self->_deviceColor;
  if (deviceColor) {
    [v3 setObject:deviceColor forKey:@"device_color"];
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor) {
    [v3 setObject:deviceEnclosureColor forKey:@"device_enclosure_color"];
  }
  deviceMid = self->_deviceMid;
  if (deviceMid) {
    [v3 setObject:deviceMid forKey:@"device_mid"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }
  deviceModelClass = self->_deviceModelClass;
  if (deviceModelClass) {
    [v3 setObject:deviceModelClass forKey:@"device_model_class"];
  }
  deviceModelVersion = self->_deviceModelVersion;
  if (deviceModelVersion) {
    [v3 setObject:deviceModelVersion forKey:@"device_model_version"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"device_name"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = +[NSNumber numberWithUnsignedLongLong:self->_devicePlatform];
    [v3 setObject:v13 forKey:@"device_platform"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTEscrowRecordMetadataClientMetadata;
  unint64_t v3 = [(OTEscrowRecordMetadataClientMetadata *)&v7 description];
  id v4 = [(OTEscrowRecordMetadataClientMetadata *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasDevicePlatform
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDevicePlatform:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDevicePlatform:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_devicePlatform = a3;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasDeviceModelVersion
{
  return self->_deviceModelVersion != 0;
}

- (BOOL)hasDeviceModelClass
{
  return self->_deviceModelClass != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasDeviceMid
{
  return self->_deviceMid != 0;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (BOOL)hasDeviceColor
{
  return self->_deviceColor != 0;
}

- (BOOL)hasSecureBackupUsesNumericPassphrase
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasSecureBackupUsesNumericPassphrase:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setSecureBackupUsesNumericPassphrase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_secureBackupUsesNumericPassphrase = a3;
}

- (BOOL)hasSecureBackupUsesComplexPassphrase
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSecureBackupUsesComplexPassphrase:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSecureBackupUsesComplexPassphrase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_secureBackupUsesComplexPassphrase = a3;
}

- (BOOL)hasSecureBackupNumericPassphraseLength
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSecureBackupNumericPassphraseLength:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSecureBackupNumericPassphraseLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_secureBackupNumericPassphraseLength = a3;
}

- (BOOL)hasSecureBackupMetadataTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSecureBackupMetadataTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSecureBackupMetadataTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_secureBackupMetadataTimestamp = a3;
}

@end