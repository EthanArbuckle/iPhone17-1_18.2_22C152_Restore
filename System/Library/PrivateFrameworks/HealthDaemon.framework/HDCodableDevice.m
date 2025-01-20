@interface HDCodableDevice
- (BOOL)hasCreationDate;
- (BOOL)hasFDAUDI;
- (BOOL)hasFirmwareVersion;
- (BOOL)hasHardwareVersion;
- (BOOL)hasLocalIdentifier;
- (BOOL)hasManufacturer;
- (BOOL)hasModel;
- (BOOL)hasName;
- (BOOL)hasSoftwareVersion;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)uuid;
- (NSString)fDAUDI;
- (NSString)firmwareVersion;
- (NSString)hardwareVersion;
- (NSString)localIdentifier;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)softwareVersion;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setFDAUDI:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableDevice

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasManufacturer
{
  return self->_manufacturer != 0;
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (BOOL)hasHardwareVersion
{
  return self->_hardwareVersion != 0;
}

- (BOOL)hasFirmwareVersion
{
  return self->_firmwareVersion != 0;
}

- (BOOL)hasSoftwareVersion
{
  return self->_softwareVersion != 0;
}

- (BOOL)hasLocalIdentifier
{
  return self->_localIdentifier != 0;
}

- (BOOL)hasFDAUDI
{
  return self->_fDAUDI != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableDevice;
  v4 = [(HDCodableDevice *)&v8 description];
  v5 = [(HDCodableDevice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  manufacturer = self->_manufacturer;
  if (manufacturer) {
    [v4 setObject:manufacturer forKey:@"manufacturer"];
  }
  model = self->_model;
  if (model) {
    [v4 setObject:model forKey:@"model"];
  }
  hardwareVersion = self->_hardwareVersion;
  if (hardwareVersion) {
    [v4 setObject:hardwareVersion forKey:@"hardwareVersion"];
  }
  firmwareVersion = self->_firmwareVersion;
  if (firmwareVersion) {
    [v4 setObject:firmwareVersion forKey:@"firmwareVersion"];
  }
  softwareVersion = self->_softwareVersion;
  if (softwareVersion) {
    [v4 setObject:softwareVersion forKey:@"softwareVersion"];
  }
  localIdentifier = self->_localIdentifier;
  if (localIdentifier) {
    [v4 setObject:localIdentifier forKey:@"localIdentifier"];
  }
  fDAUDI = self->_fDAUDI;
  if (fDAUDI) {
    [v4 setObject:fDAUDI forKey:@"FDAUDI"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v4 setObject:uuid forKey:@"uuid"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = [NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v14 forKey:@"creationDate"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v16 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_manufacturer)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hardwareVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_firmwareVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_softwareVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_localIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_fDAUDI)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
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
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_manufacturer)
  {
    objc_msgSend(v5, "setManufacturer:");
    id v4 = v5;
  }
  if (self->_model)
  {
    objc_msgSend(v5, "setModel:");
    id v4 = v5;
  }
  if (self->_hardwareVersion)
  {
    objc_msgSend(v5, "setHardwareVersion:");
    id v4 = v5;
  }
  if (self->_firmwareVersion)
  {
    objc_msgSend(v5, "setFirmwareVersion:");
    id v4 = v5;
  }
  if (self->_softwareVersion)
  {
    objc_msgSend(v5, "setSoftwareVersion:");
    id v4 = v5;
  }
  if (self->_localIdentifier)
  {
    objc_msgSend(v5, "setLocalIdentifier:");
    id v4 = v5;
  }
  if (self->_fDAUDI)
  {
    objc_msgSend(v5, "setFDAUDI:");
    id v4 = v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_manufacturer copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_model copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_hardwareVersion copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_firmwareVersion copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  uint64_t v16 = [(NSString *)self->_softwareVersion copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSString *)self->_localIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  uint64_t v20 = [(NSString *)self->_fDAUDI copyWithZone:a3];
  v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  uint64_t v22 = [(NSData *)self->_uuid copyWithZone:a3];
  v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  id v24 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v25 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_27;
    }
  }
  manufacturer = self->_manufacturer;
  if ((unint64_t)manufacturer | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](manufacturer, "isEqual:")) {
      goto LABEL_27;
    }
  }
  model = self->_model;
  if ((unint64_t)model | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](model, "isEqual:")) {
      goto LABEL_27;
    }
  }
  hardwareVersion = self->_hardwareVersion;
  if ((unint64_t)hardwareVersion | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](hardwareVersion, "isEqual:")) {
      goto LABEL_27;
    }
  }
  firmwareVersion = self->_firmwareVersion;
  if ((unint64_t)firmwareVersion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](firmwareVersion, "isEqual:")) {
      goto LABEL_27;
    }
  }
  softwareVersion = self->_softwareVersion;
  if ((unint64_t)softwareVersion | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](softwareVersion, "isEqual:")) {
      goto LABEL_27;
    }
  }
  localIdentifier = self->_localIdentifier;
  if ((unint64_t)localIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](localIdentifier, "isEqual:")) {
      goto LABEL_27;
    }
  }
  fDAUDI = self->_fDAUDI;
  if ((unint64_t)fDAUDI | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](fDAUDI, "isEqual:")) {
      goto LABEL_27;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
LABEL_27:
    char v15 = 0;
    goto LABEL_28;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 10)) {
    char v15 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_manufacturer hash];
  NSUInteger v5 = [(NSString *)self->_model hash];
  NSUInteger v6 = [(NSString *)self->_hardwareVersion hash];
  NSUInteger v7 = [(NSString *)self->_firmwareVersion hash];
  NSUInteger v8 = [(NSString *)self->_softwareVersion hash];
  NSUInteger v9 = [(NSString *)self->_localIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_fDAUDI hash];
  uint64_t v11 = [(NSData *)self->_uuid hash];
  if (*(unsigned char *)&self->_has)
  {
    double creationDate = self->_creationDate;
    double v14 = -creationDate;
    if (creationDate >= 0.0) {
      double v14 = self->_creationDate;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  NSUInteger v7 = v4;
  if (*((void *)v4 + 8))
  {
    -[HDCodableDevice setName:](self, "setName:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[HDCodableDevice setManufacturer:](self, "setManufacturer:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[HDCodableDevice setModel:](self, "setModel:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCodableDevice setHardwareVersion:](self, "setHardwareVersion:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableDevice setFirmwareVersion:](self, "setFirmwareVersion:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[HDCodableDevice setSoftwareVersion:](self, "setSoftwareVersion:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[HDCodableDevice setLocalIdentifier:](self, "setLocalIdentifier:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[HDCodableDevice setFDAUDI:](self, "setFDAUDI:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[HDCodableDevice setUuid:](self, "setUuid:");
    NSUInteger v4 = v7;
  }
  if ((_BYTE)v4[12])
  {
    self->_double creationDate = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = *((void *)v4 + 10);
  if (syncIdentity)
  {
    if (!v6) {
      goto LABEL_27;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_27;
    }
    -[HDCodableDevice setSyncIdentity:](self, "setSyncIdentity:");
  }
  NSUInteger v4 = v7;
LABEL_27:
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSString)fDAUDI
{
  return self->_fDAUDI;
}

- (void)setFDAUDI:(id)a3
{
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
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
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);

  objc_storeStrong((id *)&self->_fDAUDI, 0);
}

@end