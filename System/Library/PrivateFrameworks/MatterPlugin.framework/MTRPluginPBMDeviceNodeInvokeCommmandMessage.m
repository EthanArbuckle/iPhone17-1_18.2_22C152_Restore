@interface MTRPluginPBMDeviceNodeInvokeCommmandMessage
+ (id)deviceNodeInvokeCommandMessageFromMessage:(id)a3;
+ (id)deviceNodeInvokeCommandMessageWithNodeID:(id)a3 invokeCommandWithEndpointID:(id)a4 clusterID:(id)a5 commandID:(id)a6 commandFields:(id)a7 expectedValues:(id)a8 expectedValueInterval:(id)a9 timedInvokeTimeout:(id)a10 serverSideProcessingTimeout:(id)a11;
- (BOOL)hasCommandFields;
- (BOOL)hasCommandPath;
- (BOOL)hasExpectedValueInterval;
- (BOOL)hasExpectedValues;
- (BOOL)hasHeader;
- (BOOL)hasNode;
- (BOOL)hasServerSideProcessingTimeout;
- (BOOL)hasTimedInvokeTimeout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMCommandPath)commandPath;
- (MTRPluginPBMDeviceNode)node;
- (MTRPluginPBMHeader)header;
- (MTRPluginPBMVariableValue)commandFields;
- (MTRPluginPBMVariableValueList)expectedValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)expectedValueInterval;
- (unint64_t)hash;
- (unint64_t)serverSideProcessingTimeout;
- (unint64_t)timedInvokeTimeout;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCommandFields:(id)a3;
- (void)setCommandPath:(id)a3;
- (void)setExpectedValueInterval:(unint64_t)a3;
- (void)setExpectedValues:(id)a3;
- (void)setHasExpectedValueInterval:(BOOL)a3;
- (void)setHasServerSideProcessingTimeout:(BOOL)a3;
- (void)setHasTimedInvokeTimeout:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setNode:(id)a3;
- (void)setServerSideProcessingTimeout:(unint64_t)a3;
- (void)setTimedInvokeTimeout:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNodeInvokeCommmandMessage

+ (id)deviceNodeInvokeCommandMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceNodeInvokeCommmandMessage alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceNodeInvokeCommandMessageWithNodeID:(id)a3 invokeCommandWithEndpointID:(id)a4 clusterID:(id)a5 commandID:(id)a6 commandFields:(id)a7 expectedValues:(id)a8 expectedValueInterval:(id)a9 timedInvokeTimeout:(id)a10 serverSideProcessingTimeout:(id)a11
{
  id v16 = a7;
  id v30 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_alloc_init(MTRPluginPBMDeviceNodeInvokeCommmandMessage);
  v25 = +[MTRPluginPBMDeviceNode deviceNodeWithNodeID:v23];

  [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)v24 setNode:v25];
  v26 = +[MTRPluginPBMCommandPath commandPathWithEndpointID:v22 clusterID:v21 commandID:v20];

  [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)v24 setCommandPath:v26];
  if (v16)
  {
    v27 = [[MTRPluginPBMVariableValue alloc] initWithObjectValue:v16];
    [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)v24 setCommandFields:v27];
  }
  if (v30)
  {
    v28 = [[MTRPluginPBMVariableValueList alloc] initWithArray:v30];
    [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)v24 setExpectedValues:v28];
  }
  if (v17) {
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setExpectedValueInterval:](v24, "setExpectedValueInterval:", [v17 unsignedLongLongValue]);
  }
  if (v18) {
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setTimedInvokeTimeout:](v24, "setTimedInvokeTimeout:", [v18 unsignedLongLongValue]);
  }
  if (v19) {
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setServerSideProcessingTimeout:](v24, "setServerSideProcessingTimeout:", [v19 unsignedLongLongValue]);
  }

  return v24;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self hasHeader]) {
    return 0;
  }
  id v3 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self header];
  if ([v3 isValid]
    && [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self hasNode])
  {
    v4 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self node];
    if ([v4 isValid])
    {
      v5 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self commandPath];
      if (v5)
      {
        v6 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self commandPath];
        char v7 = [v6 isValid];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
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

- (BOOL)hasCommandPath
{
  return self->_commandPath != 0;
}

- (BOOL)hasCommandFields
{
  return self->_commandFields != 0;
}

- (BOOL)hasExpectedValues
{
  return self->_expectedValues != 0;
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

- (void)setTimedInvokeTimeout:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timedInvokeTimeout = a3;
}

- (void)setHasTimedInvokeTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimedInvokeTimeout
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setServerSideProcessingTimeout:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serverSideProcessingTimeout = a3;
}

- (void)setHasServerSideProcessingTimeout:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerSideProcessingTimeout
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNodeInvokeCommmandMessage;
  v4 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)&v8 description];
  v5 = [(MTRPluginPBMDeviceNodeInvokeCommmandMessage *)self dictionaryRepresentation];
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
    char v7 = [(MTRPluginPBMDeviceNode *)node dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"node"];
  }
  commandPath = self->_commandPath;
  if (commandPath)
  {
    v9 = [(MTRPluginPBMCommandPath *)commandPath dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"commandPath"];
  }
  commandFields = self->_commandFields;
  if (commandFields)
  {
    v11 = [(MTRPluginPBMVariableValue *)commandFields dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"commandFields"];
  }
  expectedValues = self->_expectedValues;
  if (expectedValues)
  {
    v13 = [(MTRPluginPBMVariableValueList *)expectedValues dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"expectedValues"];
  }
  char has = (char)self->_has;
  if (has)
  {
    id v17 = [NSNumber numberWithUnsignedLongLong:self->_expectedValueInterval];
    [v3 setObject:v17 forKey:@"expectedValueInterval"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  id v18 = [NSNumber numberWithUnsignedLongLong:self->_timedInvokeTimeout];
  [v3 setObject:v18 forKey:@"timedInvokeTimeout"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    v15 = [NSNumber numberWithUnsignedLongLong:self->_serverSideProcessingTimeout];
    [v3 setObject:v15 forKey:@"serverSideProcessingTimeout"];
  }
LABEL_15:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeInvokeCommmandMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_commandPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_commandFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_expectedValues)
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
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_15:
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
  if (self->_commandPath)
  {
    objc_msgSend(v6, "setCommandPath:");
    id v4 = v6;
  }
  if (self->_commandFields)
  {
    objc_msgSend(v6, "setCommandFields:");
    id v4 = v6;
  }
  if (self->_expectedValues)
  {
    objc_msgSend(v6, "setExpectedValues:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_expectedValueInterval;
    *((unsigned char *)v4 + 72) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  *((void *)v4 + 3) = self->_timedInvokeTimeout;
  *((unsigned char *)v4 + 72) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_14:
    *((void *)v4 + 2) = self->_serverSideProcessingTimeout;
    *((unsigned char *)v4 + 72) |= 2u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  char v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  id v8 = [(MTRPluginPBMDeviceNode *)self->_node copyWithZone:a3];
  v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  id v10 = [(MTRPluginPBMCommandPath *)self->_commandPath copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(MTRPluginPBMVariableValue *)self->_commandFields copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  id v14 = [(MTRPluginPBMVariableValueList *)self->_expectedValues copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 24) = self->_timedInvokeTimeout;
    *(unsigned char *)(v5 + 72) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_expectedValueInterval;
  *(unsigned char *)(v5 + 72) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(void *)(v5 + 16) = self->_serverSideProcessingTimeout;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 7))
  {
    if (!-[MTRPluginPBMHeader isEqual:](header, "isEqual:")) {
      goto LABEL_26;
    }
  }
  node = self->_node;
  if ((unint64_t)node | *((void *)v4 + 8))
  {
    if (!-[MTRPluginPBMDeviceNode isEqual:](node, "isEqual:")) {
      goto LABEL_26;
    }
  }
  commandPath = self->_commandPath;
  if ((unint64_t)commandPath | *((void *)v4 + 5))
  {
    if (!-[MTRPluginPBMCommandPath isEqual:](commandPath, "isEqual:")) {
      goto LABEL_26;
    }
  }
  commandFields = self->_commandFields;
  if ((unint64_t)commandFields | *((void *)v4 + 4))
  {
    if (!-[MTRPluginPBMVariableValue isEqual:](commandFields, "isEqual:")) {
      goto LABEL_26;
    }
  }
  expectedValues = self->_expectedValues;
  if ((unint64_t)expectedValues | *((void *)v4 + 6))
  {
    if (!-[MTRPluginPBMVariableValueList isEqual:](expectedValues, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_expectedValueInterval != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_26:
    BOOL v10 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_timedInvokeTimeout != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v10 = (*((unsigned char *)v4 + 72) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_serverSideProcessingTimeout != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
    BOOL v10 = 1;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  unint64_t v4 = [(MTRPluginPBMDeviceNode *)self->_node hash];
  unint64_t v5 = [(MTRPluginPBMCommandPath *)self->_commandPath hash];
  unint64_t v6 = [(MTRPluginPBMVariableValue *)self->_commandFields hash];
  unint64_t v7 = [(MTRPluginPBMVariableValueList *)self->_expectedValues hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  unint64_t v8 = 2654435761u * self->_expectedValueInterval;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v9 = 2654435761u * self->_timedInvokeTimeout;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v10 = 2654435761u * self->_serverSideProcessingTimeout;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[7];
  id v16 = v4;
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
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setHeader:](self, "setHeader:");
  }
  unint64_t v4 = v16;
LABEL_7:
  node = self->_node;
  uint64_t v8 = v4[8];
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
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setNode:](self, "setNode:");
  }
  unint64_t v4 = v16;
LABEL_13:
  commandPath = self->_commandPath;
  uint64_t v10 = v4[5];
  if (commandPath)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MTRPluginPBMCommandPath mergeFrom:](commandPath, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setCommandPath:](self, "setCommandPath:");
  }
  unint64_t v4 = v16;
LABEL_19:
  commandFields = self->_commandFields;
  uint64_t v12 = v4[4];
  if (commandFields)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[MTRPluginPBMVariableValue mergeFrom:](commandFields, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setCommandFields:](self, "setCommandFields:");
  }
  unint64_t v4 = v16;
LABEL_25:
  expectedValues = self->_expectedValues;
  uint64_t v14 = v4[6];
  if (expectedValues)
  {
    if (!v14) {
      goto LABEL_31;
    }
    -[MTRPluginPBMVariableValueList mergeFrom:](expectedValues, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_31;
    }
    -[MTRPluginPBMDeviceNodeInvokeCommmandMessage setExpectedValues:](self, "setExpectedValues:");
  }
  unint64_t v4 = v16;
LABEL_31:
  char v15 = *((unsigned char *)v4 + 72);
  if (v15)
  {
    self->_expectedValueInterval = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v15 = *((unsigned char *)v4 + 72);
    if ((v15 & 4) == 0)
    {
LABEL_33:
      if ((v15 & 2) == 0) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  else if ((v4[9] & 4) == 0)
  {
    goto LABEL_33;
  }
  self->_timedInvokeTimeout = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[9] & 2) != 0)
  {
LABEL_34:
    self->_serverSideProcessingTimeout = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_35:
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

- (MTRPluginPBMCommandPath)commandPath
{
  return self->_commandPath;
}

- (void)setCommandPath:(id)a3
{
}

- (MTRPluginPBMVariableValue)commandFields
{
  return self->_commandFields;
}

- (void)setCommandFields:(id)a3
{
}

- (MTRPluginPBMVariableValueList)expectedValues
{
  return self->_expectedValues;
}

- (void)setExpectedValues:(id)a3
{
}

- (unint64_t)expectedValueInterval
{
  return self->_expectedValueInterval;
}

- (unint64_t)timedInvokeTimeout
{
  return self->_timedInvokeTimeout;
}

- (unint64_t)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_commandPath, 0);
  objc_storeStrong((id *)&self->_commandFields, 0);
}

@end