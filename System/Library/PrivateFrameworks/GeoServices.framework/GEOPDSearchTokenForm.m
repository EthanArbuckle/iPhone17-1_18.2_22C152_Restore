@interface GEOPDSearchTokenForm
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchTokenForm

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchTokenForm;
  v4 = [(GEOPDSearchTokenForm *)&v8 description];
  v5 = [(GEOPDSearchTokenForm *)self dictionaryRepresentation];
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
      [v2 setObject:v4 forKey:@"value"];
    }
    uint64_t v5 = *(int *)(a1 + 16);
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53E9A98[v5];
    }
    [v3 setObject:v6 forKey:@"type"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenFormReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_value copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 16) = self->_type;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((value = self->_value, !((unint64_t)value | *((void *)v4 + 1)))
     || -[NSString isEqual:](value, "isEqual:"))
    && self->_type == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_type) ^ [(NSString *)self->_value hash];
}

- (void).cxx_destruct
{
}

@end