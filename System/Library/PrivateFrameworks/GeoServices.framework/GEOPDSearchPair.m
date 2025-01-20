@interface GEOPDSearchPair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchPair

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchPair;
  v4 = [(GEOPDSearchPair *)&v8 description];
  v5 = [(GEOPDSearchPair *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
    [v2 setObject:v3 forKey:@"key"];

    LODWORD(v4) = *(_DWORD *)(a1 + 12);
    v5 = [NSNumber numberWithFloat:v4];
    [v2 setObject:v5 forKey:@"val"];
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
    v5 = [v3 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(_DWORD *)(v4 + 8) = [v5 intValue];
    }

    v6 = [v3 objectForKeyedSubscript:@"val"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      *(_DWORD *)(v4 + 12) = v7;
    }
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchPairReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteFloatField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_key;
  *((_DWORD *)result + 3) = LODWORD(self->_val);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_key == *((_DWORD *)v4 + 2)
    && self->_val == *((float *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  uint64_t key = self->_key;
  float val = self->_val;
  double v4 = val;
  if (val < 0.0) {
    double v4 = -val;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  return v10 ^ (2654435761 * key);
}

@end