@interface GEOPDSearchBrandTrigger
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchBrandTrigger

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchBrandTrigger;
  v4 = [(GEOPDSearchBrandTrigger *)&v8 description];
  v5 = [(GEOPDSearchBrandTrigger *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = v2;
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4) {
      [v2 setObject:v4 forKey:@"trigger"];
    }
    v5 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v3 setObject:v5 forKey:@"relevance"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandTriggerReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_trigger copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_relevance;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((trigger = self->_trigger, !((unint64_t)trigger | *((void *)v4 + 2)))
     || -[NSString isEqual:](trigger, "isEqual:"))
    && self->_relevance == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_trigger hash];
  double relevance = self->_relevance;
  double v5 = -relevance;
  if (relevance >= 0.0) {
    double v5 = self->_relevance;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  double v10 = fabs(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void).cxx_destruct
{
}

@end