@interface DRSProtoTaskingDeviceMetadata
- (BOOL)hasBuild;
- (BOOL)hasDeviceMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoClientDeviceMetadata)deviceMetadata;
- (NSString)build;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoTaskingDeviceMetadata

- (BOOL)hasDeviceMetadata
{
  return self->_deviceMetadata != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoTaskingDeviceMetadata;
  v4 = [(DRSProtoTaskingDeviceMetadata *)&v8 description];
  v5 = [(DRSProtoTaskingDeviceMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    v5 = [(DRSProtoClientDeviceMetadata *)deviceMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"device_metadata"];
  }
  build = self->_build;
  if (build) {
    [v3 setObject:build forKey:@"build"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingDeviceMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceMetadata)
  {
    objc_msgSend(v4, "setDeviceMetadata:");
    id v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoClientDeviceMetadata *)self->_deviceMetadata copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_build copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((deviceMetadata = self->_deviceMetadata, !((unint64_t)deviceMetadata | v4[2]))
     || -[DRSProtoClientDeviceMetadata isEqual:](deviceMetadata, "isEqual:")))
  {
    build = self->_build;
    if ((unint64_t)build | v4[1]) {
      char v7 = -[NSString isEqual:](build, "isEqual:");
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
  unint64_t v3 = [(DRSProtoClientDeviceMetadata *)self->_deviceMetadata hash];
  return [(NSString *)self->_build hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  deviceMetadata = self->_deviceMetadata;
  uint64_t v6 = v4[2];
  char v7 = v4;
  if (deviceMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoClientDeviceMetadata mergeFrom:](deviceMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingDeviceMetadata setDeviceMetadata:](self, "setDeviceMetadata:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[DRSProtoTaskingDeviceMetadata setBuild:](self, "setBuild:");
    id v4 = v7;
  }
}

- (DRSProtoClientDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end