@interface GEOPDSearchTokenSpan
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchTokenSpan

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTokenSpan;
  v4 = [(GEOPDSearchTokenSpan *)&v8 description];
  v5 = [(GEOPDSearchTokenSpan *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchTokenSpan _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 8)];
    if (a2) {
      v6 = @"beginIndex";
    }
    else {
      v6 = @"begin_index";
    }
    if (a2) {
      v7 = @"endIndex";
    }
    else {
      v7 = @"end_index";
    }
    [v4 setObject:v5 forKey:v6];

    objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 12)];
    [v4 setObject:v8 forKey:v7];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchTokenSpan _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenSpanReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_beginIndex;
  *((_DWORD *)result + 3) = self->_endIndex;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_beginIndex == v4[2]
    && self->_endIndex == v4[3];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_endIndex) ^ (2654435761 * self->_beginIndex);
}

@end