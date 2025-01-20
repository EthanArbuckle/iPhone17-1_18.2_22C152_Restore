@interface MTRPluginPBMDeviceNodeReadMultipleAttributesMessage
+ (Class)attributePathsType;
+ (id)_convertArray:(id)a3;
+ (id)deviceNodeReadMultipleAttributesMessageFromMessage:(id)a3;
+ (id)deviceNodeReadMultipleAttributesMessageWithNodeID:(id)a3 readAttributePaths:(id)a4;
- (BOOL)hasHeader;
- (BOOL)hasNode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMDeviceNode)node;
- (MTRPluginPBMHeader)header;
- (NSArray)attributeRequestPaths;
- (NSMutableArray)attributePaths;
- (id)attributePathsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attributePathsCount;
- (unint64_t)hash;
- (void)addAttributePaths:(id)a3;
- (void)clearAttributePaths;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributePaths:(id)a3;
- (void)setHeader:(id)a3;
- (void)setNode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNodeReadMultipleAttributesMessage

+ (id)deviceNodeReadMultipleAttributesMessageFromMessage:(id)a3
{
  id v3 = a3;
  v4 = [MTRPluginPBMDeviceNodeReadMultipleAttributesMessage alloc];
  v5 = [v3 messageData];

  v6 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)v4 initWithData:v5];
  if ([(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceNodeReadMultipleAttributesMessageWithNodeID:(id)a3 readAttributePaths:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage);
  v8 = +[MTRPluginPBMDeviceNode deviceNodeWithNodeID:v6];

  [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)v7 setNode:v8];
  v9 = +[MTRPluginPBMDeviceNodeReadMultipleAttributesMessage _convertArray:v5];

  if (v9)
  {
    [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)v7 setAttributePaths:v9];
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_convertArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x263F10C50];
        v12 = objc_msgSend(v10, "endpoint", (void)v20);
        v13 = [v10 cluster];
        v14 = [v10 attribute];
        v15 = [v11 attributePathWithEndpointID:v12 clusterID:v13 attributeID:v14];

        v16 = [[MTRPluginPBMAttributePath alloc] initWithAttributePath:v15];
        if (!v16)
        {

          id v18 = 0;
          goto LABEL_11;
        }
        v17 = v16;
        [v4 addObject:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v18 = v4;
LABEL_11:

  return v18;
}

- (NSArray)attributeRequestPaths
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePaths];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePaths];
  uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        uint64_t v7 = v5;
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x263F10C60];
        v10 = NSNumber;
        v11 = [v8 clusterPath];
        v12 = objc_msgSend(v10, "numberWithUnsignedInt:", objc_msgSend(v11, "endpointID"));
        v13 = NSNumber;
        v14 = [v8 clusterPath];
        v15 = objc_msgSend(v13, "numberWithUnsignedInt:", objc_msgSend(v14, "clusterID"));
        v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "attributeID"));
        v17 = [v9 requestPathWithEndpointID:v12 clusterID:v15 attributeID:v16];

        if (!v17)
        {

          id v18 = 0;
          id v5 = v7;
          goto LABEL_11;
        }
        id v5 = v7;
        [v7 addObject:v17];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  id v18 = v5;
LABEL_11:

  return (NSArray *)v18;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self hasHeader]) {
    return 0;
  }
  id v3 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self header];
  if ([v3 isValid]
    && [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self hasNode])
  {
    v4 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self node];
    if ([v4 isValid])
    {
      id v5 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePaths];
      if (v5)
      {
        uint64_t v6 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePaths];
        BOOL v7 = [v6 count] != 0;
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

- (void)clearAttributePaths
{
}

- (void)addAttributePaths:(id)a3
{
  id v4 = a3;
  attributePaths = self->_attributePaths;
  id v8 = v4;
  if (!attributePaths)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    BOOL v7 = self->_attributePaths;
    self->_attributePaths = v6;

    id v4 = v8;
    attributePaths = self->_attributePaths;
  }
  [(NSMutableArray *)attributePaths addObject:v4];
}

- (unint64_t)attributePathsCount
{
  return [(NSMutableArray *)self->_attributePaths count];
}

- (id)attributePathsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attributePaths objectAtIndex:a3];
}

+ (Class)attributePathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNodeReadMultipleAttributesMessage;
  id v4 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)&v8 description];
  id v5 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    id v5 = [(MTRPluginPBMHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  node = self->_node;
  if (node)
  {
    BOOL v7 = [(MTRPluginPBMDeviceNode *)node dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"node"];
  }
  if ([(NSMutableArray *)self->_attributePaths count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_attributePaths, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_attributePaths;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"attributePaths"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeReadMultipleAttributesMessageReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_header) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_node) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_attributePaths;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_header) {
    objc_msgSend(v8, "setHeader:");
  }
  if (self->_node) {
    objc_msgSend(v8, "setNode:");
  }
  if ([(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePathsCount])
  {
    [v8 clearAttributePaths];
    unint64_t v4 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MTRPluginPBMDeviceNodeReadMultipleAttributesMessage *)self attributePathsAtIndex:i];
        [v8 addAttributePaths:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMHeader *)self->_header copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(MTRPluginPBMDeviceNode *)self->_node copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_attributePaths;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addAttributePaths:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[2]))
     || -[MTRPluginPBMHeader isEqual:](header, "isEqual:"))
    && ((node = self->_node, !((unint64_t)node | v4[3])) || -[MTRPluginPBMDeviceNode isEqual:](node, "isEqual:")))
  {
    attributePaths = self->_attributePaths;
    if ((unint64_t)attributePaths | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](attributePaths, "isEqual:");
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
  return v4 ^ [(NSMutableArray *)self->_attributePaths hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
  if (header)
  {
    if (v6) {
      -[MTRPluginPBMHeader mergeFrom:](header, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MTRPluginPBMDeviceNodeReadMultipleAttributesMessage setHeader:](self, "setHeader:");
  }
  node = self->_node;
  uint64_t v8 = *((void *)v4 + 3);
  if (node)
  {
    if (v8) {
      -[MTRPluginPBMDeviceNode mergeFrom:](node, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MTRPluginPBMDeviceNodeReadMultipleAttributesMessage setNode:](self, "setNode:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 1);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[MTRPluginPBMDeviceNodeReadMultipleAttributesMessage addAttributePaths:](self, "addAttributePaths:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
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

- (NSMutableArray)attributePaths
{
  return self->_attributePaths;
}

- (void)setAttributePaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_attributePaths, 0);
}

@end