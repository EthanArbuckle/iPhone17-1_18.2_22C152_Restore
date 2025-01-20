@interface DRSProtoClientDeviceMetadata
- (BOOL)hasBuildVariant;
- (BOOL)hasDeviceCategory;
- (BOOL)hasDeviceModel;
- (BOOL)hasPlatform;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)buildVariant;
- (NSString)deviceCategory;
- (NSString)deviceModel;
- (NSString)platform;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVariant:(id)a3;
- (void)setDeviceCategory:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setPlatform:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoClientDeviceMetadata

- (BOOL)hasBuildVariant
{
  return self->_buildVariant != 0;
}

- (BOOL)hasDeviceCategory
{
  return self->_deviceCategory != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasPlatform
{
  return self->_platform != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoClientDeviceMetadata;
  v4 = [(DRSProtoClientDeviceMetadata *)&v8 description];
  v5 = [(DRSProtoClientDeviceMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  buildVariant = self->_buildVariant;
  if (buildVariant) {
    [v3 setObject:buildVariant forKey:@"build_variant"];
  }
  deviceCategory = self->_deviceCategory;
  if (deviceCategory) {
    [v4 setObject:deviceCategory forKey:@"device_category"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v4 setObject:deviceModel forKey:@"device_model"];
  }
  platform = self->_platform;
  if (platform) {
    [v4 setObject:platform forKey:@"platform"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoClientDeviceMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_buildVariant)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_platform)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_buildVariant)
  {
    objc_msgSend(v4, "setBuildVariant:");
    id v4 = v5;
  }
  if (self->_deviceCategory)
  {
    objc_msgSend(v5, "setDeviceCategory:");
    id v4 = v5;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v5, "setDeviceModel:");
    id v4 = v5;
  }
  if (self->_platform)
  {
    objc_msgSend(v5, "setPlatform:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_buildVariant copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_deviceCategory copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_platform copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((buildVariant = self->_buildVariant, !((unint64_t)buildVariant | v4[1]))
     || -[NSString isEqual:](buildVariant, "isEqual:"))
    && ((deviceCategory = self->_deviceCategory, !((unint64_t)deviceCategory | v4[2]))
     || -[NSString isEqual:](deviceCategory, "isEqual:"))
    && ((deviceModel = self->_deviceModel, !((unint64_t)deviceModel | v4[3]))
     || -[NSString isEqual:](deviceModel, "isEqual:")))
  {
    platform = self->_platform;
    if ((unint64_t)platform | v4[4]) {
      char v9 = -[NSString isEqual:](platform, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_buildVariant hash];
  NSUInteger v4 = [(NSString *)self->_deviceCategory hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_deviceModel hash];
  return v4 ^ v5 ^ [(NSString *)self->_platform hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[DRSProtoClientDeviceMetadata setBuildVariant:](self, "setBuildVariant:");
  }
  if (v4[2]) {
    -[DRSProtoClientDeviceMetadata setDeviceCategory:](self, "setDeviceCategory:");
  }
  if (v4[3]) {
    -[DRSProtoClientDeviceMetadata setDeviceModel:](self, "setDeviceModel:");
  }
  if (v4[4]) {
    -[DRSProtoClientDeviceMetadata setPlatform:](self, "setPlatform:");
  }
}

- (NSString)buildVariant
{
  return self->_buildVariant;
}

- (void)setBuildVariant:(id)a3
{
}

- (NSString)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceCategory, 0);

  objc_storeStrong((id *)&self->_buildVariant, 0);
}

@end