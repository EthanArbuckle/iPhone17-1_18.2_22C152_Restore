@interface GEOPDSearchKeyValueDoublePair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchKeyValueDoublePair

- (uint64_t)_initWithDictionary:(uint64_t)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"key"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[v4 copy];
        id v6 = v5;
        objc_storeStrong((id *)(a1 + 8), v5);
      }
      v7 = [v3 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        *(unsigned char *)(a1 + 24) |= 1u;
        *(void *)(a1 + 16) = v8;
      }
    }
  }

  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchKeyValueDoublePair;
  v4 = [(GEOPDSearchKeyValueDoublePair *)&v8 description];
  v5 = [(GEOPDSearchKeyValueDoublePair *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4) {
      [v2 setObject:v4 forKey:@"key"];
    }
    if (*(unsigned char *)(a1 + 24))
    {
      v5 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      [v3 setObject:v5 forKey:@"value"];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchKeyValueDoublePairReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteDoubleField();
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
    *(double *)(v5 + 16) = self->_value;
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
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_value == *((double *)v4 + 2))
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
  if (*(unsigned char *)&self->_flags)
  {
    double value = self->_value;
    double v6 = -value;
    if (value >= 0.0) {
      double v6 = self->_value;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
}

@end