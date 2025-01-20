@interface DRSProtoRapidPayload
- (BOOL)hasDeviceMetadata;
- (BOOL)hasPayload;
- (BOOL)hasPayloadDescription;
- (BOOL)hasPayloadMetadata;
- (BOOL)hasUploadAttempts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoClientDeviceMetadata)deviceMetadata;
- (DRSProtoFileDescription)payloadDescription;
- (DRSProtoRequestDescription)payloadMetadata;
- (NSData)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)uploadAttempts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setHasUploadAttempts:(BOOL)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPayloadMetadata:(id)a3;
- (void)setUploadAttempts:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoRapidPayload

- (BOOL)hasDeviceMetadata
{
  return self->_deviceMetadata != 0;
}

- (BOOL)hasPayloadMetadata
{
  return self->_payloadMetadata != 0;
}

- (BOOL)hasPayloadDescription
{
  return self->_payloadDescription != 0;
}

- (void)setUploadAttempts:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uploadAttempts = a3;
}

- (void)setHasUploadAttempts:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUploadAttempts
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoRapidPayload;
  v4 = [(DRSProtoRapidPayload *)&v8 description];
  v5 = [(DRSProtoRapidPayload *)self dictionaryRepresentation];
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
  payloadMetadata = self->_payloadMetadata;
  if (payloadMetadata)
  {
    v7 = [(DRSProtoRequestDescription *)payloadMetadata dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"payload_metadata"];
  }
  payloadDescription = self->_payloadDescription;
  if (payloadDescription)
  {
    v9 = [(DRSProtoFileDescription *)payloadDescription dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"payload_description"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_uploadAttempts];
    [v3 setObject:v10 forKey:@"upload_attempts"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoRapidPayloadReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_payloadMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_payloadDescription)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
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
  if (self->_payloadMetadata)
  {
    objc_msgSend(v5, "setPayloadMetadata:");
    id v4 = v5;
  }
  if (self->_payloadDescription)
  {
    objc_msgSend(v5, "setPayloadDescription:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_uploadAttempts;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_payload)
  {
    objc_msgSend(v5, "setPayload:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoClientDeviceMetadata *)self->_deviceMetadata copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(DRSProtoRequestDescription *)self->_payloadMetadata copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(DRSProtoFileDescription *)self->_payloadDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_uploadAttempts;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v12 = [(NSData *)self->_payload copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  deviceMetadata = self->_deviceMetadata;
  if ((unint64_t)deviceMetadata | *((void *)v4 + 1))
  {
    if (!-[DRSProtoClientDeviceMetadata isEqual:](deviceMetadata, "isEqual:")) {
      goto LABEL_15;
    }
  }
  payloadMetadata = self->_payloadMetadata;
  if ((unint64_t)payloadMetadata | *((void *)v4 + 4))
  {
    if (!-[DRSProtoRequestDescription isEqual:](payloadMetadata, "isEqual:")) {
      goto LABEL_15;
    }
  }
  payloadDescription = self->_payloadDescription;
  if ((unint64_t)payloadDescription | *((void *)v4 + 3))
  {
    if (!-[DRSProtoFileDescription isEqual:](payloadDescription, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_uploadAttempts != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((void *)v4 + 2)) {
    char v9 = -[NSData isEqual:](payload, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoClientDeviceMetadata *)self->_deviceMetadata hash];
  unint64_t v4 = [(DRSProtoRequestDescription *)self->_payloadMetadata hash];
  unint64_t v5 = [(DRSProtoFileDescription *)self->_payloadDescription hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_uploadAttempts;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSData *)self->_payload hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  deviceMetadata = self->_deviceMetadata;
  uint64_t v6 = *((void *)v4 + 1);
  id v11 = v4;
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
    -[DRSProtoRapidPayload setDeviceMetadata:](self, "setDeviceMetadata:");
  }
  id v4 = v11;
LABEL_7:
  payloadMetadata = self->_payloadMetadata;
  uint64_t v8 = *((void *)v4 + 4);
  if (payloadMetadata)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[DRSProtoRequestDescription mergeFrom:](payloadMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[DRSProtoRapidPayload setPayloadMetadata:](self, "setPayloadMetadata:");
  }
  id v4 = v11;
LABEL_13:
  payloadDescription = self->_payloadDescription;
  uint64_t v10 = *((void *)v4 + 3);
  if (payloadDescription)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[DRSProtoFileDescription mergeFrom:](payloadDescription, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[DRSProtoRapidPayload setPayloadDescription:](self, "setPayloadDescription:");
  }
  id v4 = v11;
LABEL_19:
  if (*((unsigned char *)v4 + 44))
  {
    self->_uploadAttempts = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[DRSProtoRapidPayload setPayload:](self, "setPayload:");
    id v4 = v11;
  }
}

- (DRSProtoClientDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (DRSProtoRequestDescription)payloadMetadata
{
  return self->_payloadMetadata;
}

- (void)setPayloadMetadata:(id)a3
{
}

- (DRSProtoFileDescription)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (unsigned)uploadAttempts
{
  return self->_uploadAttempts;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMetadata, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end