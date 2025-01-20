@interface _DKPRMetadataEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)hasIndex;
- (uint64_t)index;
- (uint64_t)key;
- (uint64_t)setIndex:(uint64_t)result;
- (uint64_t)value;
- (unint64_t)hash;
- (void)setKey:(uint64_t)a1;
- (void)setValue:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _DKPRMetadataEntry

- (uint64_t)value
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setKey:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)setIndex:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 1u;
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    -[_DKPRMetadataEntry writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_value) {
    -[_DKPRMetadataEntry writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (uint64_t)hasIndex
{
  if (result) {
    return *(unsigned char *)(result + 32) & 1;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DKPRMetadataEntry;
  id v4 = [(_DKPRMetadataEntry *)&v8 description];
  v5 = [(_DKPRMetadataEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value)
  {
    v7 = [(_DKPRValue *)value dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_index];
    [v4 setObject:v8 forKey:@"index"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRMetadataEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(_DKPRValue *)self->_value copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_index;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_10;
    }
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 3))
  {
    if (!-[_DKPRValue isEqual:](value, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_index == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  unint64_t v4 = [(_DKPRValue *)self->_value hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_index;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (uint64_t)key
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)index
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRMetadataEntry writeTo:]", "_DKPRMetadataEntry.m", 121, "nil != self->_key");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_DKPRMetadataEntry writeTo:]", "_DKPRMetadataEntry.m", 126, "self->_value != nil");
}

@end