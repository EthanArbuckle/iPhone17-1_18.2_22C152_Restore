@interface GEOPDSearchBrandDensity
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBrandDensity

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandDensity;
  v4 = [(GEOPDSearchBrandDensity *)&v8 description];
  v5 = [(GEOPDSearchBrandDensity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v4 = *(unsigned char *)(a1 + 28);
    if (v4)
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
      [v2 setObject:v5 forKey:@"count"];

      char v4 = *(unsigned char *)(a1 + 28);
    }
    if ((v4 & 2) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(a1 + 24);
      v6 = [NSNumber numberWithFloat:v3];
      [v2 setObject:v6 forKey:@"popularitySum"];
    }
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7) {
      [v2 setObject:v7 forKey:@"geohash"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  uint64_t v4 = [a1 init];
  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"count"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 unsignedLongLongValue];
      *(unsigned char *)(v4 + 28) |= 1u;
      *(void *)(v4 + 8) = v6;
    }

    uint64_t v7 = [v3 objectForKeyedSubscript:@"popularitySum"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      *(unsigned char *)(v4 + 28) |= 2u;
      *(_DWORD *)(v4 + 24) = v8;
    }

    v9 = [v3 objectForKeyedSubscript:@"geohash"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      id v11 = v10;
      objc_storeStrong((id *)(v4 + 16), v10);
    }
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandDensityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  if (self->_geohash)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 8) = self->_count;
    *(unsigned char *)(v5 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 24) = self->_popularitySum;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_geohash copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_popularitySum != *((float *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  geohash = self->_geohash;
  if ((unint64_t)geohash | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](geohash, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_count;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v8 ^ v3 ^ [(NSString *)self->_geohash hash];
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float popularitySum = self->_popularitySum;
  double v5 = popularitySum;
  if (popularitySum < 0.0) {
    double v5 = -popularitySum;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v8 ^ v3 ^ [(NSString *)self->_geohash hash];
}

- (void).cxx_destruct
{
}

@end