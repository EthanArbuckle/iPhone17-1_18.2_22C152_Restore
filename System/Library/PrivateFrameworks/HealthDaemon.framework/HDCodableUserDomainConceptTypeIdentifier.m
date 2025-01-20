@interface HDCodableUserDomainConceptTypeIdentifier
- (BOOL)hasCode;
- (BOOL)hasSchema;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)schema;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setSchema:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableUserDomainConceptTypeIdentifier

- (BOOL)hasSchema
{
  return self->_schema != 0;
}

- (void)setCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableUserDomainConceptTypeIdentifier;
  v4 = [(HDCodableUserDomainConceptTypeIdentifier *)&v8 description];
  v5 = [(HDCodableUserDomainConceptTypeIdentifier *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  schema = self->_schema;
  if (schema) {
    [v3 setObject:schema forKey:@"schema"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_code];
    [v4 setObject:v6 forKey:@"code"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptTypeIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_schema)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_schema)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSchema:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_code;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_schema copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_code;
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
  schema = self->_schema;
  if ((unint64_t)schema | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](schema, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_code == *((void *)v4 + 1))
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
  NSUInteger v3 = [(NSString *)self->_schema hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_code;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[HDCodableUserDomainConceptTypeIdentifier setSchema:](self, "setSchema:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_code = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (int64_t)code
{
  return self->_code;
}

- (void).cxx_destruct
{
}

@end