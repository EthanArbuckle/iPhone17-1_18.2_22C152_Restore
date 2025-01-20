@interface HKHealthWrapCodableValue
- (BOOL)hasBytes;
- (BOOL)hasInteger;
- (BOOL)hasString;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bytes;
- (NSString)string;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)integer;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytes:(id)a3;
- (void)setHasInteger:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setInteger:(int64_t)a3;
- (void)setString:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKHealthWrapCodableValue

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E58C9428[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ValueTypeNull"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ValueTypeBytes"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ValueTypeString"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ValueTypeInteger"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasBytes
{
  return self->_bytes != 0;
}

- (BOOL)hasString
{
  return self->_string != 0;
}

- (void)setInteger:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_integer = a3;
}

- (void)setHasInteger:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInteger
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKHealthWrapCodableValue;
  int v4 = [(HKHealthWrapCodableValue *)&v8 description];
  v5 = [(HKHealthWrapCodableValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v4 = self->_type - 1;
    if (v4 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E58C9428[v4];
    }
    [v3 setObject:v5 forKey:@"type"];
  }
  bytes = self->_bytes;
  if (bytes) {
    [v3 setObject:bytes forKey:@"bytes"];
  }
  string = self->_string;
  if (string) {
    [v3 setObject:string forKey:@"string"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_integer];
    [v3 setObject:v8 forKey:@"integer"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodableValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bytes) {
    PBDataWriterWriteDataField();
  }
  if (self->_string) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_type;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_bytes)
  {
    objc_msgSend(v4, "setBytes:");
    id v4 = v5;
  }
  if (self->_string)
  {
    objc_msgSend(v5, "setString:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_integer;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_bytes copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  uint64_t v9 = [(NSString *)self->_string copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_integer;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  bytes = self->_bytes;
  if ((unint64_t)bytes | *((void *)v4 + 2) && !-[NSData isEqual:](bytes, "isEqual:")) {
    goto LABEL_15;
  }
  string = self->_string;
  if ((unint64_t)string | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](string, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_integer != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_bytes hash];
  NSUInteger v5 = [(NSString *)self->_string hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_integer;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[HKHealthWrapCodableValue setBytes:](self, "setBytes:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[HKHealthWrapCodableValue setString:](self, "setString:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_integer = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (int64_t)integer
{
  return self->_integer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_bytes, 0);
}

@end