@interface MTRPluginPBMDeviceNodeWriteAttributeMessage
+ (id)deviceNodeWriteAttributeMessageFromMessage:(id)a3;
+ (id)deviceNodeWriteAttributeMessageWithNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5 attributeID:(id)a6 value:(id)a7 expectedValueInterval:(id)a8 timedWriteTimeout:(id)a9;
- (BOOL)hasAttributePath;
- (BOOL)hasExpectedValueInterval;
- (BOOL)hasHeader;
- (BOOL)hasNode;
- (BOOL)hasTimedWriteTimeout;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMAttributePath)attributePath;
- (MTRPluginPBMDeviceNode)node;
- (MTRPluginPBMHeader)header;
- (MTRPluginPBMVariableValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)expectedValueInterval;
- (unint64_t)hash;
- (unint64_t)timedWriteTimeout;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributePath:(id)a3;
- (void)setExpectedValueInterval:(unint64_t)a3;
- (void)setHasExpectedValueInterval:(BOOL)a3;
- (void)setHasTimedWriteTimeout:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setNode:(id)a3;
- (void)setTimedWriteTimeout:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNodeWriteAttributeMessage

+ (id)deviceNodeWriteAttributeMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceNodeWriteAttributeMessage alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceNodeWriteAttributeMessage *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceNodeWriteAttributeMessageWithNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5 attributeID:(id)a6 value:(id)a7 expectedValueInterval:(id)a8 timedWriteTimeout:(id)a9
{
  id v14 = a8;
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_alloc_init(MTRPluginPBMDeviceNodeWriteAttributeMessage);
  v22 = +[MTRPluginPBMDeviceNode deviceNodeWithNodeID:v20];

  [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)v21 setNode:v22];
  v23 = +[MTRPluginPBMAttributePath attributePathWithEndpointID:v19 clusterID:v18 attributeID:v17];

  [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)v21 setAttributePath:v23];
  v24 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v16];

  [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)v21 setValue:v24];
  if (v14) {
    -[MTRPluginPBMDeviceNodeWriteAttributeMessage setExpectedValueInterval:](v21, "setExpectedValueInterval:", [v14 unsignedLongLongValue]);
  }
  if (v15) {
    -[MTRPluginPBMDeviceNodeWriteAttributeMessage setTimedWriteTimeout:](v21, "setTimedWriteTimeout:", [v15 unsignedLongLongValue]);
  }

  return v21;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self hasHeader]) {
    return 0;
  }
  id v3 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self header];
  if ([v3 isValid]
    && [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self hasNode])
  {
    v4 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self node];
    if ([v4 isValid]
      && [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self hasAttributePath])
    {
      v5 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self attributePath];
      if ([v5 isValid]
        && [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self hasValue])
      {
        v6 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self value];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasNode
{
  return self->_node != 0;
}

- (BOOL)hasAttributePath
{
  return self->_attributePath != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setExpectedValueInterval:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expectedValueInterval = a3;
}

- (void)setHasExpectedValueInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpectedValueInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimedWriteTimeout:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timedWriteTimeout = a3;
}

- (void)setHasTimedWriteTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimedWriteTimeout
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNodeWriteAttributeMessage;
  v4 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)&v8 description];
  v5 = [(MTRPluginPBMDeviceNodeWriteAttributeMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  node = self->_node;
  if (node)
  {
    BOOL v7 = [(MTRPluginPBMDeviceNode *)node dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"node"];
  }
  attributePath = self->_attributePath;
  if (attributePath)
  {
    v9 = [(MTRPluginPBMAttributePath *)attributePath dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"attributePath"];
  }
  value = self->_value;
  if (value)
  {
    v11 = [(MTRPluginPBMVariableValue *)value dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"value"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:self->_expectedValueInterval];
    [v3 setObject:v13 forKey:@"expectedValueInterval"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    id v14 = [NSNumber numberWithUnsignedLongLong:self->_timedWriteTimeout];
    [v3 setObject:v14 forKey:@"timedWriteTimeout"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeWriteAttributeMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_node)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_attributePath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v6;
  }
  if (self->_node)
  {
    objc_msgSend(v6, "setNode:");
    id v4 = v6;
  }
  if (self->_attributePath)
  {
    objc_msgSend(v6, "setAttributePath:");
    id v4 = v6;
  }
  if (self->_value)
  {
    objc_msgSend(v6, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_expectedValueInterval;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_timedWriteTimeout;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(MTRPluginPBMDeviceNode *)self->_node copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  id v10 = [(MTRPluginPBMAttributePath *)self->_attributePath copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  id v12 = [(MTRPluginPBMVariableValue *)self->_value copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_expectedValueInterval;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timedWriteTimeout;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 4))
  {
    if (!-[MTRPluginPBMHeader isEqual:](header, "isEqual:")) {
      goto LABEL_19;
    }
  }
  node = self->_node;
  if ((unint64_t)node | *((void *)v4 + 5))
  {
    if (!-[MTRPluginPBMDeviceNode isEqual:](node, "isEqual:")) {
      goto LABEL_19;
    }
  }
  attributePath = self->_attributePath;
  if ((unint64_t)attributePath | *((void *)v4 + 3))
  {
    if (!-[MTRPluginPBMAttributePath isEqual:](attributePath, "isEqual:")) {
      goto LABEL_19;
    }
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 6))
  {
    if (!-[MTRPluginPBMVariableValue isEqual:](value, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_expectedValueInterval != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_timedWriteTimeout != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  unint64_t v4 = [(MTRPluginPBMDeviceNode *)self->_node hash];
  unint64_t v5 = [(MTRPluginPBMAttributePath *)self->_attributePath hash];
  unint64_t v6 = [(MTRPluginPBMVariableValue *)self->_value hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v7 = 2654435761u * self->_expectedValueInterval;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v8 = 2654435761u * self->_timedWriteTimeout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[4];
  id v14 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[MTRPluginPBMDeviceNodeWriteAttributeMessage setHeader:](self, "setHeader:");
  }
  unint64_t v4 = v14;
LABEL_7:
  node = self->_node;
  uint64_t v8 = v4[5];
  if (node)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MTRPluginPBMDeviceNode mergeFrom:](node, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[MTRPluginPBMDeviceNodeWriteAttributeMessage setNode:](self, "setNode:");
  }
  unint64_t v4 = v14;
LABEL_13:
  attributePath = self->_attributePath;
  uint64_t v10 = v4[3];
  if (attributePath)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MTRPluginPBMAttributePath mergeFrom:](attributePath, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MTRPluginPBMDeviceNodeWriteAttributeMessage setAttributePath:](self, "setAttributePath:");
  }
  unint64_t v4 = v14;
LABEL_19:
  value = self->_value;
  uint64_t v12 = v4[6];
  if (value)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[MTRPluginPBMVariableValue mergeFrom:](value, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[MTRPluginPBMDeviceNodeWriteAttributeMessage setValue:](self, "setValue:");
  }
  unint64_t v4 = v14;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 56);
  if (v13)
  {
    self->_expectedValueInterval = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v13 = *((unsigned char *)v4 + 56);
  }
  if ((v13 & 2) != 0)
  {
    self->_timedWriteTimeout = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x270F9A758]();
}

- (MTRPluginPBMHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (MTRPluginPBMDeviceNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (MTRPluginPBMAttributePath)attributePath
{
  return self->_attributePath;
}

- (void)setAttributePath:(id)a3
{
}

- (MTRPluginPBMVariableValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (unint64_t)expectedValueInterval
{
  return self->_expectedValueInterval;
}

- (unint64_t)timedWriteTimeout
{
  return self->_timedWriteTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_attributePath, 0);
}

@end