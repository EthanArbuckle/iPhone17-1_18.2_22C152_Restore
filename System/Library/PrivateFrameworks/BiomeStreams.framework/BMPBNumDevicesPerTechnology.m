@interface BMPBNumDevicesPerTechnology
- (BOOL)hasNumber;
- (BOOL)hasTechnologyString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)technologyString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)number;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumber:(BOOL)a3;
- (void)setNumber:(int)a3;
- (void)setTechnologyString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBNumDevicesPerTechnology

- (BOOL)hasTechnologyString
{
  return self->_technologyString != 0;
}

- (void)setNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_number = a3;
}

- (void)setHasNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBNumDevicesPerTechnology;
  v4 = [(BMPBNumDevicesPerTechnology *)&v8 description];
  v5 = [(BMPBNumDevicesPerTechnology *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  technologyString = self->_technologyString;
  if (technologyString) {
    [v3 setObject:technologyString forKey:@"technologyString"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_number];
    [v4 setObject:v6 forKey:@"number"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNumDevicesPerTechnologyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_technologyString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_technologyString)
  {
    id v5 = v4;
    objc_msgSend(v4, "setTechnologyString:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_number;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_technologyString copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_number;
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
  technologyString = self->_technologyString;
  if ((unint64_t)technologyString | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](technologyString, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_number == *((_DWORD *)v4 + 2))
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
  NSUInteger v3 = [(NSString *)self->_technologyString hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_number;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[BMPBNumDevicesPerTechnology setTechnologyString:](self, "setTechnologyString:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_number = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)technologyString
{
  return self->_technologyString;
}

- (void)setTechnologyString:(id)a3
{
}

- (int)number
{
  return self->_number;
}

- (void).cxx_destruct
{
}

@end