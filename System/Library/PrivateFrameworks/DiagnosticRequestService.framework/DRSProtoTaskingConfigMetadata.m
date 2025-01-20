@interface DRSProtoTaskingConfigMetadata
- (BOOL)hasTaskingDeviceMetadata;
- (BOOL)hasTeamId;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoTaskingDeviceMetadata)taskingDeviceMetadata;
- (NSString)teamId;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTaskingDeviceMetadata:(id)a3;
- (void)setTeamId:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoTaskingConfigMetadata

- (BOOL)hasTaskingDeviceMetadata
{
  return self->_taskingDeviceMetadata != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasTeamId
{
  return self->_teamId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoTaskingConfigMetadata;
  v4 = [(DRSProtoTaskingConfigMetadata *)&v8 description];
  v5 = [(DRSProtoTaskingConfigMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  if (taskingDeviceMetadata)
  {
    v5 = [(DRSProtoTaskingDeviceMetadata *)taskingDeviceMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"tasking_device_metadata"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  teamId = self->_teamId;
  if (teamId) {
    [v3 setObject:teamId forKey:@"team_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingConfigMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskingDeviceMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_teamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskingDeviceMetadata)
  {
    objc_msgSend(v4, "setTaskingDeviceMetadata:");
    id v4 = v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    id v4 = v5;
  }
  if (self->_teamId)
  {
    objc_msgSend(v5, "setTeamId:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoTaskingDeviceMetadata *)self->_taskingDeviceMetadata copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_uuid copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_teamId copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((taskingDeviceMetadata = self->_taskingDeviceMetadata, !((unint64_t)taskingDeviceMetadata | v4[1]))
     || -[DRSProtoTaskingDeviceMetadata isEqual:](taskingDeviceMetadata, "isEqual:"))
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[3])) || -[NSString isEqual:](uuid, "isEqual:")))
  {
    teamId = self->_teamId;
    if ((unint64_t)teamId | v4[2]) {
      char v8 = -[NSString isEqual:](teamId, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoTaskingDeviceMetadata *)self->_taskingDeviceMetadata hash];
  NSUInteger v4 = [(NSString *)self->_uuid hash] ^ v3;
  return v4 ^ [(NSString *)self->_teamId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (taskingDeviceMetadata)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingDeviceMetadata mergeFrom:](taskingDeviceMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DRSProtoTaskingConfigMetadata setTaskingDeviceMetadata:](self, "setTaskingDeviceMetadata:");
  }
  NSUInteger v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[DRSProtoTaskingConfigMetadata setUuid:](self, "setUuid:");
    NSUInteger v4 = v7;
  }
  if (v4[2])
  {
    -[DRSProtoTaskingConfigMetadata setTeamId:](self, "setTeamId:");
    NSUInteger v4 = v7;
  }
}

- (DRSProtoTaskingDeviceMetadata)taskingDeviceMetadata
{
  return self->_taskingDeviceMetadata;
}

- (void)setTaskingDeviceMetadata:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)teamId
{
  return self->_teamId;
}

- (void)setTeamId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_teamId, 0);

  objc_storeStrong((id *)&self->_taskingDeviceMetadata, 0);
}

@end