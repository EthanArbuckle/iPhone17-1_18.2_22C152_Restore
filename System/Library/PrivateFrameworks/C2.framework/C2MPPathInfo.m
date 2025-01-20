@interface C2MPPathInfo
- (BOOL)hasApplicationBytesReceived;
- (BOOL)hasApplicationBytesSent;
- (BOOL)hasInterfaceType;
- (BOOL)hasRadioType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)interfaceType;
- (NSString)radioType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)applicationBytesReceived;
- (unint64_t)applicationBytesSent;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationBytesReceived:(unint64_t)a3;
- (void)setApplicationBytesSent:(unint64_t)a3;
- (void)setHasApplicationBytesReceived:(BOOL)a3;
- (void)setHasApplicationBytesSent:(BOOL)a3;
- (void)setInterfaceType:(id)a3;
- (void)setRadioType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPPathInfo

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  interfaceType = self->_interfaceType;
  if (interfaceType) {
    [v3 setObject:interfaceType forKey:@"interface_type"];
  }
  radioType = self->_radioType;
  if (radioType) {
    [v4 setObject:radioType forKey:@"radio_type"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = [NSNumber numberWithUnsignedLongLong:self->_applicationBytesSent];
    [v4 setObject:v8 forKey:@"application_bytes_sent"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_applicationBytesReceived];
    [v4 setObject:v9 forKey:@"application_bytes_received"];
  }
  return v4;
}

- (void)setInterfaceType:(id)a3
{
}

- (void)setApplicationBytesSent:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_applicationBytesSent = a3;
}

- (void)setApplicationBytesReceived:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_applicationBytesReceived = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioType, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
}

- (BOOL)hasInterfaceType
{
  return self->_interfaceType != 0;
}

- (BOOL)hasRadioType
{
  return self->_radioType != 0;
}

- (void)setHasApplicationBytesSent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApplicationBytesSent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasApplicationBytesReceived:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApplicationBytesReceived
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPPathInfo;
  v4 = [(C2MPPathInfo *)&v8 description];
  v5 = [(C2MPPathInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPPathInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_interfaceType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_radioType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_interfaceType)
  {
    objc_msgSend(v4, "setInterfaceType:");
    id v4 = v6;
  }
  if (self->_radioType)
  {
    objc_msgSend(v6, "setRadioType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_applicationBytesSent;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_applicationBytesReceived;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_interfaceType copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_radioType copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_applicationBytesSent;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_applicationBytesReceived;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  interfaceType = self->_interfaceType;
  if ((unint64_t)interfaceType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](interfaceType, "isEqual:")) {
      goto LABEL_15;
    }
  }
  radioType = self->_radioType;
  if ((unint64_t)radioType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](radioType, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_applicationBytesSent != *((void *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_applicationBytesReceived != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_interfaceType hash];
  NSUInteger v4 = [(NSString *)self->_radioType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_applicationBytesSent;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v6 = 2654435761u * self->_applicationBytesReceived;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  unint64_t v6 = v4;
  if (v4[3])
  {
    -[C2MPPathInfo setInterfaceType:](self, "setInterfaceType:");
    NSUInteger v4 = v6;
  }
  if (v4[4])
  {
    -[C2MPPathInfo setRadioType:](self, "setRadioType:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_applicationBytesSent = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_applicationBytesReceived = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (NSString)radioType
{
  return self->_radioType;
}

- (void)setRadioType:(id)a3
{
}

- (unint64_t)applicationBytesSent
{
  return self->_applicationBytesSent;
}

- (unint64_t)applicationBytesReceived
{
  return self->_applicationBytesReceived;
}

@end