@interface MTRPluginPBMDeviceNodeMessage
+ (id)deviceNodeMessageFromMessage:(id)a3;
+ (id)deviceNodeMessageWithNodeID:(id)a3;
- (BOOL)hasHeader;
- (BOOL)hasNode;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMDeviceNode)node;
- (MTRPluginPBMHeader)header;
- (MTRPluginPBMVariableValue)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeader:(id)a3;
- (void)setNode:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNodeMessage

+ (id)deviceNodeMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceNodeMessage alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceNodeMessage *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceNodeMessage *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceNodeMessageWithNodeID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MTRPluginPBMDeviceNodeMessage);
  v5 = +[MTRPluginPBMDeviceNode deviceNodeWithNodeID:v3];

  [(MTRPluginPBMDeviceNodeMessage *)v4 setNode:v5];
  return v4;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMDeviceNodeMessage *)self hasHeader]) {
    return 0;
  }
  id v3 = [(MTRPluginPBMDeviceNodeMessage *)self header];
  if ([v3 isValid] && -[MTRPluginPBMDeviceNodeMessage hasNode](self, "hasNode"))
  {
    v4 = [(MTRPluginPBMDeviceNodeMessage *)self node];
    char v5 = [v4 isValid];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasNode
{
  return self->_node != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNodeMessage;
  v4 = [(MTRPluginPBMDeviceNodeMessage *)&v8 description];
  char v5 = [(MTRPluginPBMDeviceNodeMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    char v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  node = self->_node;
  if (node)
  {
    v7 = [(MTRPluginPBMDeviceNode *)node dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"node"];
  }
  value = self->_value;
  if (value)
  {
    v9 = [(MTRPluginPBMVariableValue *)value dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"value"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_node)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v5;
  }
  if (self->_node)
  {
    objc_msgSend(v5, "setNode:");
    id v4 = v5;
  }
  if (self->_value)
  {
    objc_msgSend(v5, "setValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(MTRPluginPBMDeviceNode *)self->_node copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(MTRPluginPBMVariableValue *)self->_value copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[1]))
     || -[MTRPluginPBMHeader isEqual:](header, "isEqual:"))
    && ((node = self->_node, !((unint64_t)node | v4[2])) || -[MTRPluginPBMDeviceNode isEqual:](node, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[3]) {
      char v8 = -[MTRPluginPBMVariableValue isEqual:](value, "isEqual:");
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
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  unint64_t v4 = [(MTRPluginPBMDeviceNode *)self->_node hash] ^ v3;
  return v4 ^ [(MTRPluginPBMVariableValue *)self->_value hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[1];
  v11 = v4;
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
    -[MTRPluginPBMDeviceNodeMessage setHeader:](self, "setHeader:");
  }
  unint64_t v4 = v11;
LABEL_7:
  node = self->_node;
  uint64_t v8 = v4[2];
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
    -[MTRPluginPBMDeviceNodeMessage setNode:](self, "setNode:");
  }
  unint64_t v4 = v11;
LABEL_13:
  value = self->_value;
  uint64_t v10 = v4[3];
  if (value)
  {
    if (v10) {
      -[MTRPluginPBMVariableValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[MTRPluginPBMDeviceNodeMessage setValue:](self, "setValue:");
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

- (MTRPluginPBMVariableValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end