@interface MTRPluginPBMDeviceNodeReadAttributeMessage
+ (id)deviceNodeReadAttributeMessageFromMessage:(id)a3;
+ (id)deviceNodeReadAttributeMessageWithNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5 attributeID:(id)a6 readParams:(id)a7;
- (BOOL)hasAttributePath;
- (BOOL)hasHeader;
- (BOOL)hasNode;
- (BOOL)hasReadParams;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMAttributePath)attributePath;
- (MTRPluginPBMDeviceNode)node;
- (MTRPluginPBMHeader)header;
- (MTRPluginPBMReadParams)readParams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributePath:(id)a3;
- (void)setHeader:(id)a3;
- (void)setNode:(id)a3;
- (void)setReadParams:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNodeReadAttributeMessage

+ (id)deviceNodeReadAttributeMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceNodeReadAttributeMessage alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceNodeReadAttributeMessage *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceNodeReadAttributeMessage *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceNodeReadAttributeMessageWithNodeID:(id)a3 endpointID:(id)a4 clusterID:(id)a5 attributeID:(id)a6 readParams:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(MTRPluginPBMDeviceNodeReadAttributeMessage);
  v17 = +[MTRPluginPBMDeviceNode deviceNodeWithNodeID:v15];

  [(MTRPluginPBMDeviceNodeReadAttributeMessage *)v16 setNode:v17];
  v18 = +[MTRPluginPBMAttributePath attributePathWithEndpointID:v14 clusterID:v13 attributeID:v12];

  [(MTRPluginPBMDeviceNodeReadAttributeMessage *)v16 setAttributePath:v18];
  if (v11)
  {
    v19 = [[MTRPluginPBMReadParams alloc] initWithReadParams:v11];
    [(MTRPluginPBMDeviceNodeReadAttributeMessage *)v16 setReadParams:v19];
  }
  return v16;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMDeviceNodeReadAttributeMessage *)self hasHeader]) {
    return 0;
  }
  id v3 = [(MTRPluginPBMDeviceNodeReadAttributeMessage *)self header];
  if ([v3 isValid]
    && [(MTRPluginPBMDeviceNodeReadAttributeMessage *)self hasNode])
  {
    v4 = [(MTRPluginPBMDeviceNodeReadAttributeMessage *)self node];
    if ([v4 isValid]
      && [(MTRPluginPBMDeviceNodeReadAttributeMessage *)self hasAttributePath])
    {
      v5 = [(MTRPluginPBMDeviceNodeReadAttributeMessage *)self attributePath];
      char v6 = [v5 isValid];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
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

- (BOOL)hasReadParams
{
  return self->_readParams != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNodeReadAttributeMessage;
  v4 = [(MTRPluginPBMDeviceNodeReadAttributeMessage *)&v8 description];
  v5 = [(MTRPluginPBMDeviceNodeReadAttributeMessage *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  node = self->_node;
  if (node)
  {
    v7 = [(MTRPluginPBMDeviceNode *)node dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"node"];
  }
  attributePath = self->_attributePath;
  if (attributePath)
  {
    v9 = [(MTRPluginPBMAttributePath *)attributePath dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"attributePath"];
  }
  readParams = self->_readParams;
  if (readParams)
  {
    id v11 = [(MTRPluginPBMReadParams *)readParams dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"readParams"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeReadAttributeMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_attributePath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_readParams)
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
  if (self->_attributePath)
  {
    objc_msgSend(v5, "setAttributePath:");
    id v4 = v5;
  }
  if (self->_readParams)
  {
    objc_msgSend(v5, "setReadParams:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(MTRPluginPBMDeviceNode *)self->_node copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(MTRPluginPBMAttributePath *)self->_attributePath copyWithZone:a3];
  id v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(MTRPluginPBMReadParams *)self->_readParams copyWithZone:a3];
  id v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[2]))
     || -[MTRPluginPBMHeader isEqual:](header, "isEqual:"))
    && ((node = self->_node, !((unint64_t)node | v4[3])) || -[MTRPluginPBMDeviceNode isEqual:](node, "isEqual:"))
    && ((attributePath = self->_attributePath, !((unint64_t)attributePath | v4[1]))
     || -[MTRPluginPBMAttributePath isEqual:](attributePath, "isEqual:")))
  {
    readParams = self->_readParams;
    if ((unint64_t)readParams | v4[4]) {
      char v9 = -[MTRPluginPBMReadParams isEqual:](readParams, "isEqual:");
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
  unint64_t v3 = [(MTRPluginPBMHeader *)self->_header hash];
  unint64_t v4 = [(MTRPluginPBMDeviceNode *)self->_node hash] ^ v3;
  unint64_t v5 = [(MTRPluginPBMAttributePath *)self->_attributePath hash];
  return v4 ^ v5 ^ [(MTRPluginPBMReadParams *)self->_readParams hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[2];
  id v13 = v4;
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
    -[MTRPluginPBMDeviceNodeReadAttributeMessage setHeader:](self, "setHeader:");
  }
  unint64_t v4 = v13;
LABEL_7:
  node = self->_node;
  uint64_t v8 = v4[3];
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
    -[MTRPluginPBMDeviceNodeReadAttributeMessage setNode:](self, "setNode:");
  }
  unint64_t v4 = v13;
LABEL_13:
  attributePath = self->_attributePath;
  uint64_t v10 = v4[1];
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
    -[MTRPluginPBMDeviceNodeReadAttributeMessage setAttributePath:](self, "setAttributePath:");
  }
  unint64_t v4 = v13;
LABEL_19:
  readParams = self->_readParams;
  uint64_t v12 = v4[4];
  if (readParams)
  {
    if (v12) {
      -[MTRPluginPBMReadParams mergeFrom:](readParams, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[MTRPluginPBMDeviceNodeReadAttributeMessage setReadParams:](self, "setReadParams:");
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

- (MTRPluginPBMReadParams)readParams
{
  return self->_readParams;
}

- (void)setReadParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readParams, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_attributePath, 0);
}

@end