@interface MTRPluginPBMClusterPath
+ (MTRPluginPBMClusterPath)clusterPathWithEndpointID:(id)a3 clusterID:(id)a4;
- (BOOL)hasClusterID;
- (BOOL)hasEndpointID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRClusterPath)clusterPath;
- (MTRPluginPBMClusterPath)initWithClusterPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)clusterID;
- (unsigned)endpointID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClusterID:(unsigned int)a3;
- (void)setClusterPath:(id)a3;
- (void)setEndpointID:(unsigned int)a3;
- (void)setHasClusterID:(BOOL)a3;
- (void)setHasEndpointID:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMClusterPath

- (void)setEndpointID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endpointID = a3;
}

- (void)setHasEndpointID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndpointID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setClusterID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clusterID = a3;
}

- (void)setHasClusterID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClusterID
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMClusterPath;
  v4 = [(MTRPluginPBMClusterPath *)&v8 description];
  v5 = [(MTRPluginPBMClusterPath *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_endpointID];
    [v3 setObject:v5 forKey:@"endpointID"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_clusterID];
    [v3 setObject:v6 forKey:@"clusterID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMClusterPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_endpointID;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_clusterID;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_endpointID;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_clusterID;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_endpointID != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_clusterID != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_endpointID;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_clusterID;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_endpointID = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_clusterID = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)endpointID
{
  return self->_endpointID;
}

- (unsigned)clusterID
{
  return self->_clusterID;
}

- (MTRPluginPBMClusterPath)initWithClusterPath:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMClusterPath *)self init]) != 0)
  {
    char v5 = [v4 endpoint];
    -[MTRPluginPBMClusterPath setEndpointID:](self, "setEndpointID:", [v5 unsignedIntValue]);

    id v6 = [v4 cluster];
    -[MTRPluginPBMClusterPath setClusterID:](self, "setClusterID:", [v6 unsignedIntValue]);

    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (MTRPluginPBMClusterPath)clusterPathWithEndpointID:(id)a3 clusterID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MTRPluginPBMClusterPath);
  uint64_t v8 = [v6 unsignedIntValue];

  [(MTRPluginPBMClusterPath *)v7 setEndpointID:v8];
  uint64_t v9 = [v5 unsignedIntValue];

  [(MTRPluginPBMClusterPath *)v7 setClusterID:v9];
  return v7;
}

- (void)setClusterPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 endpoint];
  -[MTRPluginPBMClusterPath setEndpointID:](self, "setEndpointID:", [v5 unsignedIntValue]);

  id v6 = [v4 cluster];

  -[MTRPluginPBMClusterPath setClusterID:](self, "setClusterID:", [v6 unsignedIntValue]);
}

- (MTRClusterPath)clusterPath
{
  uint64_t v3 = (void *)MEMORY[0x263F10D30];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTRPluginPBMClusterPath endpointID](self, "endpointID"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTRPluginPBMClusterPath clusterID](self, "clusterID"));
  id v6 = [v3 clusterPathWithEndpointID:v4 clusterID:v5];

  return (MTRClusterPath *)v6;
}

- (BOOL)isValid
{
  BOOL v3 = [(MTRPluginPBMClusterPath *)self hasEndpointID];
  if (v3)
  {
    LOBYTE(v3) = [(MTRPluginPBMClusterPath *)self hasClusterID];
  }
  return v3;
}

@end