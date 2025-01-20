@interface CLPCellOutOfServiceInfo
- (BOOL)hasHasWifiFallback;
- (BOOL)hasLocation;
- (BOOL)hasServiceProviderName;
- (BOOL)hasUniqueCount;
- (BOOL)hasWifiFallback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)uniqueCount;
- (CLPLocation)location;
- (NSString)serviceProviderName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHasWifiFallback:(BOOL)a3;
- (void)setHasUniqueCount:(BOOL)a3;
- (void)setHasWifiFallback:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setServiceProviderName:(id)a3;
- (void)setUniqueCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPCellOutOfServiceInfo

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasServiceProviderName
{
  return self->_serviceProviderName != 0;
}

- (void)setUniqueCount:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uniqueCount = a3;
}

- (void)setHasUniqueCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUniqueCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasWifiFallback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hasWifiFallback = a3;
}

- (void)setHasHasWifiFallback:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasWifiFallback
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPCellOutOfServiceInfo;
  v4 = [(CLPCellOutOfServiceInfo *)&v8 description];
  v5 = [(CLPCellOutOfServiceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  location = self->_location;
  if (location)
  {
    v5 = [(CLPLocation *)location dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"location"];
  }
  serviceProviderName = self->_serviceProviderName;
  if (serviceProviderName) {
    [v3 setObject:serviceProviderName forKey:@"serviceProviderName"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_uniqueCount];
    [v3 setObject:v8 forKey:@"uniqueCount"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithBool:self->_hasWifiFallback];
    [v3 setObject:v9 forKey:@"hasWifiFallback"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPCellOutOfServiceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_location)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_serviceProviderName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_location)
  {
    objc_msgSend(v4, "setLocation:");
    id v4 = v6;
  }
  if (self->_serviceProviderName)
  {
    objc_msgSend(v6, "setServiceProviderName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[25] = self->_uniqueCount;
    v4[28] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[24] = self->_hasWifiFallback;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CLPLocation *)self->_location copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_serviceProviderName copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 25) = self->_uniqueCount;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 24) = self->_hasWifiFallback;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 1))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:")) {
      goto LABEL_16;
    }
  }
  serviceProviderName = self->_serviceProviderName;
  if ((unint64_t)serviceProviderName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](serviceProviderName, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_16;
    }
    if (self->_uniqueCount)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_hasWifiFallback)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_16;
      }
      BOOL v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CLPLocation *)self->_location hash];
  NSUInteger v4 = [(NSString *)self->_serviceProviderName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_uniqueCount;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_hasWifiFallback;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 1);
  id v8 = v4;
  if (location)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CLPCellOutOfServiceInfo setLocation:](self, "setLocation:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 2))
  {
    -[CLPCellOutOfServiceInfo setServiceProviderName:](self, "setServiceProviderName:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 28);
  if ((v7 & 2) != 0)
  {
    self->_uniqueCount = *((unsigned char *)v4 + 25);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 28);
  }
  if (v7)
  {
    self->_hasWifiFallback = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8]();
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)serviceProviderName
{
  return self->_serviceProviderName;
}

- (void)setServiceProviderName:(id)a3
{
}

- (BOOL)uniqueCount
{
  return self->_uniqueCount;
}

- (BOOL)hasWifiFallback
{
  return self->_hasWifiFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderName, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end