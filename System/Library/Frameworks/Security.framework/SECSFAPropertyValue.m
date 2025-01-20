@interface SECSFAPropertyValue
- (BOOL)hasInteger;
- (BOOL)hasProperty;
- (BOOL)hasString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)propertyAsString:(int)a3;
- (int)StringAsProperty:(id)a3;
- (int)property;
- (int64_t)integer;
- (unint64_t)hash;
- (void)clearOneofValuesForProperty;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInteger:(BOOL)a3;
- (void)setHasProperty:(BOOL)a3;
- (void)setInteger:(int64_t)a3;
- (void)setProperty:(int)a3;
- (void)setString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAPropertyValue

- (void).cxx_destruct
{
}

- (NSString)string
{
  return self->_string;
}

- (int64_t)integer
{
  return self->_integer;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_property = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_integer = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[SECSFAPropertyValue setString:](self, "setString:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_property;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_string hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_integer;
  return v3 ^ v2 ^ [(NSString *)self->_string hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_property != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_integer != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  string = self->_string;
  if ((unint64_t)string | *((void *)v4 + 3)) {
    char v6 = -[NSString isEqual:](string, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_property;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_integer;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_string copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_property;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_integer;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_string)
  {
    char v6 = v4;
    objc_msgSend(v4, "setString:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_string)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAPropertyValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_integer];
    [v3 setObject:v4 forKey:@"integer"];
  }
  string = self->_string;
  if (string) {
    [v3 setObject:string forKey:@"string"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t property = self->_property;
    if (property >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_property);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5475E98[property];
    }
    [v3 setObject:v7 forKey:@"Property"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAPropertyValue;
  id v4 = [(SECSFAPropertyValue *)&v8 description];
  id v5 = [(SECSFAPropertyValue *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForProperty
{
  *(unsigned char *)&self->_has &= ~2u;
  self->_uint64_t property = 0;
  *(unsigned char *)&self->_has &= ~1u;
  self->_integer = 0;
  self->_string = 0;
  MEMORY[0x1F41817F8]();
}

- (int)StringAsProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"integer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"string"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)propertyAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5475E98[a3];
  }

  return v3;
}

- (BOOL)hasProperty
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasProperty:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setProperty:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t property = a3;
}

- (int)property
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_property;
  }
  else {
    return 0;
  }
}

- (void)setString:(id)a3
{
  int v4 = (NSString *)a3;
  [(SECSFAPropertyValue *)self clearOneofValuesForProperty];
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t property = 2;
  string = self->_string;
  self->_string = v4;
}

- (BOOL)hasString
{
  return self->_string != 0;
}

- (BOOL)hasInteger
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasInteger:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setInteger:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t property = 1;
  *(unsigned char *)&self->_has |= 1u;
  self->_integer = a3;
}

@end