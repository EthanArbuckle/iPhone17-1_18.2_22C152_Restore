@interface SYLogDeviceState
- (BOOL)hasBuildVersion;
- (BOOL)hasDeviceClass;
- (BOOL)hasIdentifier;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)buildVersion;
- (NSString)deviceClass;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)state;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setHasState:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYLogDeviceState

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDeviceClass
{
  return self->_deviceClass != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (unsigned)state
{
  if (*(unsigned char *)&self->_has) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYLogDeviceState;
  v4 = [(SYLogDeviceState *)&v8 description];
  v5 = [(SYLogDeviceState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  deviceClass = self->_deviceClass;
  if (deviceClass) {
    [v4 setObject:deviceClass forKey:@"deviceClass"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_state];
    [v4 setObject:v8 forKey:@"state"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogDeviceStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceClass)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
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
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_deviceClass)
  {
    objc_msgSend(v5, "setDeviceClass:");
    id v4 = v5;
  }
  if (self->_buildVersion)
  {
    objc_msgSend(v5, "setBuildVersion:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_state;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_deviceClass copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_buildVersion copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_state;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  deviceClass = self->_deviceClass;
  if ((unint64_t)deviceClass | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceClass, "isEqual:")) {
      goto LABEL_12;
    }
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_state == *((_DWORD *)v4 + 8))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_deviceClass hash];
  NSUInteger v5 = [(NSString *)self->_buildVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_state;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unsigned int *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SYLogDeviceState setIdentifier:](self, "setIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[SYLogDeviceState setDeviceClass:](self, "setDeviceClass:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SYLogDeviceState setBuildVersion:](self, "setBuildVersion:");
    NSUInteger v4 = v5;
  }
  if (v4[9])
  {
    self->_state = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end