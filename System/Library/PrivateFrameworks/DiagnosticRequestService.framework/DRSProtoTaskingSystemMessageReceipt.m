@interface DRSProtoTaskingSystemMessageReceipt
- (BOOL)hasChannelEnvironment;
- (BOOL)hasChannelType;
- (BOOL)hasMessageType;
- (BOOL)hasReceiptDelay;
- (BOOL)hasTaskingDeviceMetadata;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DRSProtoTaskingDeviceMetadata)taskingDeviceMetadata;
- (NSString)channelEnvironment;
- (NSString)channelType;
- (NSString)description;
- (NSString)messageType;
- (NSString)uuid;
- (float)receiptDelay;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelEnvironment:(id)a3;
- (void)setChannelType:(id)a3;
- (void)setHasReceiptDelay:(BOOL)a3;
- (void)setMessageType:(id)a3;
- (void)setReceiptDelay:(float)a3;
- (void)setTaskingDeviceMetadata:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DRSProtoTaskingSystemMessageReceipt

- (BOOL)hasTaskingDeviceMetadata
{
  return self->_taskingDeviceMetadata != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (BOOL)hasChannelType
{
  return self->_channelType != 0;
}

- (BOOL)hasChannelEnvironment
{
  return self->_channelEnvironment != 0;
}

- (void)setReceiptDelay:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_receiptDelay = a3;
}

- (void)setHasReceiptDelay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReceiptDelay
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoTaskingSystemMessageReceipt;
  v4 = [(DRSProtoTaskingSystemMessageReceipt *)&v8 description];
  v5 = [(DRSProtoTaskingSystemMessageReceipt *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  if (taskingDeviceMetadata)
  {
    v6 = [(DRSProtoTaskingDeviceMetadata *)taskingDeviceMetadata dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"tasking_device_metadata"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  messageType = self->_messageType;
  if (messageType) {
    [v3 setObject:messageType forKey:@"message_type"];
  }
  channelType = self->_channelType;
  if (channelType) {
    [v3 setObject:channelType forKey:@"channel_type"];
  }
  channelEnvironment = self->_channelEnvironment;
  if (channelEnvironment) {
    [v3 setObject:channelEnvironment forKey:@"channel_environment"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_receiptDelay;
    v11 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v11 forKey:@"receipt_delay"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingSystemMessageReceiptReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_messageType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelEnvironment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
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
  if (self->_messageType)
  {
    objc_msgSend(v5, "setMessageType:");
    id v4 = v5;
  }
  if (self->_channelType)
  {
    objc_msgSend(v5, "setChannelType:");
    id v4 = v5;
  }
  if (self->_channelEnvironment)
  {
    objc_msgSend(v5, "setChannelEnvironment:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_receiptDelay);
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DRSProtoTaskingDeviceMetadata *)self->_taskingDeviceMetadata copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_uuid copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_messageType copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_channelType copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSString *)self->_channelEnvironment copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v5 + 32) = self->_receiptDelay;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  if ((unint64_t)taskingDeviceMetadata | *((void *)v4 + 5))
  {
    if (!-[DRSProtoTaskingDeviceMetadata isEqual:](taskingDeviceMetadata, "isEqual:")) {
      goto LABEL_16;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_16;
    }
  }
  messageType = self->_messageType;
  if ((unint64_t)messageType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](messageType, "isEqual:")) {
      goto LABEL_16;
    }
  }
  channelType = self->_channelType;
  if ((unint64_t)channelType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](channelType, "isEqual:")) {
      goto LABEL_16;
    }
  }
  channelEnvironment = self->_channelEnvironment;
  if ((unint64_t)channelEnvironment | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](channelEnvironment, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_receiptDelay == *((float *)v4 + 8))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DRSProtoTaskingDeviceMetadata *)self->_taskingDeviceMetadata hash];
  NSUInteger v4 = [(NSString *)self->_uuid hash];
  NSUInteger v5 = [(NSString *)self->_messageType hash];
  NSUInteger v6 = [(NSString *)self->_channelType hash];
  NSUInteger v7 = [(NSString *)self->_channelEnvironment hash];
  if (*(unsigned char *)&self->_has)
  {
    float receiptDelay = self->_receiptDelay;
    float v10 = -receiptDelay;
    if (receiptDelay >= 0.0) {
      float v10 = self->_receiptDelay;
    }
    float v11 = floorf(v10 + 0.5);
    float v12 = (float)(v10 - v11) * 1.8447e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabsf(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  uint64_t v6 = *((void *)v4 + 5);
  id v7 = v4;
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
    -[DRSProtoTaskingSystemMessageReceipt setTaskingDeviceMetadata:](self, "setTaskingDeviceMetadata:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 6))
  {
    -[DRSProtoTaskingSystemMessageReceipt setUuid:](self, "setUuid:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[DRSProtoTaskingSystemMessageReceipt setMessageType:](self, "setMessageType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[DRSProtoTaskingSystemMessageReceipt setChannelType:](self, "setChannelType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[DRSProtoTaskingSystemMessageReceipt setChannelEnvironment:](self, "setChannelEnvironment:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_float receiptDelay = *((float *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
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

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
}

- (NSString)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(id)a3
{
}

- (NSString)channelEnvironment
{
  return self->_channelEnvironment;
}

- (void)setChannelEnvironment:(id)a3
{
}

- (float)receiptDelay
{
  return self->_receiptDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_taskingDeviceMetadata, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_channelType, 0);

  objc_storeStrong((id *)&self->_channelEnvironment, 0);
}

@end