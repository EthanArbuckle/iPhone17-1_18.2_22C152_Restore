@interface GEOPDSearchKeyValue64Pair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchKeyValue64Pair

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchKeyValue64Pair;
  v4 = [(GEOPDSearchKeyValue64Pair *)&v8 description];
  v5 = [(GEOPDSearchKeyValue64Pair *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = v2;
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4) {
      [v2 setObject:v4 forKey:@"key"];
    }
    if (*(unsigned char *)(a1 + 24))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v3 setObject:v5 forKey:@"value"];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchKeyValue64PairReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_value;
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
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_value == *((void *)v4 + 2))
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
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_value;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
}

@end