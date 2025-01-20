@interface MTRPluginPBMDeviceNode
+ (id)deviceNodeWithNodeID:(id)a3;
- (BOOL)hasNodeID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)nodeID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNodeID:(BOOL)a3;
- (void)setNodeID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMDeviceNode

- (void)setNodeID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_nodeID = a3;
}

- (void)setHasNodeID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNodeID
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMDeviceNode;
  v4 = [(MTRPluginPBMDeviceNode *)&v8 description];
  v5 = [(MTRPluginPBMDeviceNode *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_nodeID];
    [v3 setObject:v4 forKey:@"nodeID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMDeviceNodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_nodeID;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_nodeID;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_nodeID == *((void *)v4 + 1))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_nodeID;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_nodeID = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)nodeID
{
  return self->_nodeID;
}

+ (id)deviceNodeWithNodeID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MTRPluginPBMDeviceNode);
  if (v4) {
    -[MTRPluginPBMDeviceNode setNodeID:](v4, "setNodeID:", [v3 unsignedLongLongValue]);
  }

  return v4;
}

@end