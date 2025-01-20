@interface MTRPluginPBMAttributePath
+ (id)attributePathWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5;
- (BOOL)hasAttributeID;
- (BOOL)hasClusterPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRAttributePath)attributePath;
- (MTRPluginPBMAttributePath)initWithAttributePath:(id)a3;
- (MTRPluginPBMClusterPath)clusterPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)attributeID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributeID:(unsigned int)a3;
- (void)setAttributePath:(id)a3;
- (void)setClusterPath:(id)a3;
- (void)setHasAttributeID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMAttributePath

- (BOOL)hasClusterPath
{
  return self->_clusterPath != 0;
}

- (void)setAttributeID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_attributeID = a3;
}

- (void)setHasAttributeID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAttributeID
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMAttributePath;
  v4 = [(MTRPluginPBMAttributePath *)&v8 description];
  v5 = [(MTRPluginPBMAttributePath *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  clusterPath = self->_clusterPath;
  if (clusterPath)
  {
    v5 = [(MTRPluginPBMClusterPath *)clusterPath dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"clusterPath"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_attributeID];
    [v3 setObject:v6 forKey:@"attributeID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMAttributePathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clusterPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_clusterPath)
  {
    id v5 = v4;
    objc_msgSend(v4, "setClusterPath:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_attributeID;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MTRPluginPBMClusterPath *)self->_clusterPath copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_attributeID;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  clusterPath = self->_clusterPath;
  if ((unint64_t)clusterPath | *((void *)v4 + 2))
  {
    if (!-[MTRPluginPBMClusterPath isEqual:](clusterPath, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_attributeID == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTRPluginPBMClusterPath *)self->_clusterPath hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_attributeID;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  clusterPath = self->_clusterPath;
  uint64_t v6 = *((void *)v4 + 2);
  if (clusterPath)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[MTRPluginPBMClusterPath mergeFrom:](clusterPath, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[MTRPluginPBMAttributePath setClusterPath:](self, "setClusterPath:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_attributeID = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (MTRPluginPBMClusterPath)clusterPath
{
  return self->_clusterPath;
}

- (void)setClusterPath:(id)a3
{
}

- (unsigned)attributeID
{
  return self->_attributeID;
}

- (void).cxx_destruct
{
}

- (MTRPluginPBMAttributePath)initWithAttributePath:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMAttributePath *)self init]) != 0)
  {
    uint64_t v5 = [[MTRPluginPBMClusterPath alloc] initWithClusterPath:v4];
    [(MTRPluginPBMAttributePath *)self setClusterPath:v5];

    uint64_t v6 = [v4 attribute];
    -[MTRPluginPBMAttributePath setAttributeID:](self, "setAttributeID:", [v6 unsignedIntValue]);

    self = self;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)attributePathWithEndpointID:(id)a3 clusterID:(id)a4 attributeID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(MTRPluginPBMAttributePath);
  v11 = +[MTRPluginPBMClusterPath clusterPathWithEndpointID:v9 clusterID:v8];

  [(MTRPluginPBMAttributePath *)v10 setClusterPath:v11];
  uint64_t v12 = [v7 unsignedIntValue];

  [(MTRPluginPBMAttributePath *)v10 setAttributeID:v12];
  return v10;
}

- (void)setAttributePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MTRPluginPBMClusterPath alloc] initWithClusterPath:v4];
  [(MTRPluginPBMAttributePath *)self setClusterPath:v5];

  id v6 = [v4 attribute];

  -[MTRPluginPBMAttributePath setAttributeID:](self, "setAttributeID:", [v6 unsignedIntValue]);
}

- (MTRAttributePath)attributePath
{
  unint64_t v3 = (void *)MEMORY[0x263F10C50];
  id v4 = NSNumber;
  uint64_t v5 = [(MTRPluginPBMAttributePath *)self clusterPath];
  id v6 = objc_msgSend(v4, "numberWithUnsignedInt:", objc_msgSend(v5, "endpointID"));
  id v7 = NSNumber;
  id v8 = [(MTRPluginPBMAttributePath *)self clusterPath];
  id v9 = objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v8, "clusterID"));
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTRPluginPBMAttributePath attributeID](self, "attributeID"));
  v11 = [v3 attributePathWithEndpointID:v6 clusterID:v9 attributeID:v10];

  return (MTRAttributePath *)v11;
}

- (BOOL)isValid
{
  if (![(MTRPluginPBMAttributePath *)self hasAttributeID]
    || ![(MTRPluginPBMAttributePath *)self hasClusterPath])
  {
    return 0;
  }
  unint64_t v3 = [(MTRPluginPBMAttributePath *)self clusterPath];
  char v4 = [v3 isValid];

  return v4;
}

@end