@interface GEOPDTransitIncidentFilter
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

@implementation GEOPDTransitIncidentFilter

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitIncidentFilter;
  v4 = [(GEOPDTransitIncidentFilter *)&v8 description];
  v5 = [(GEOPDTransitIncidentFilter *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitIncidentFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = [v5 dictionaryRepresentation];
      v7 = v6;
      if (a2)
      {
        objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __56__GEOPDTransitIncidentFilter__dictionaryRepresentation___block_invoke;
        v12[3] = &unk_1E53D8860;
        id v9 = v8;
        id v13 = v9;
        [v7 enumerateKeysAndObjectsUsingBlock:v12];
        id v10 = v9;

        v7 = v10;
      }
      [v4 setObject:v7 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitIncidentFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDTransitIncidentFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitIncidentFilterReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

- (void).cxx_destruct
{
}

@end