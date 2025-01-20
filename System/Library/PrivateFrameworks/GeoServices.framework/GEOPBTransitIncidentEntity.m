@interface GEOPBTransitIncidentEntity
- (BOOL)hasNextStopIDs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSSet)nextStopIDs;
- (NSString)description;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)filter;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitIncidentEntity

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitIncidentEntity;
  v4 = [(GEOPBTransitIncidentEntity *)&v8 description];
  v5 = [(GEOPBTransitIncidentEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 24);
      if (v5)
      {
        v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
    }
  }
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v6 = @"affectedMuid";
      }
      else {
        v6 = @"affected_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = *(id *)(a1 + 24);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"filter"];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __56__GEOPBTransitIncidentEntity__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)filter
{
  if (a1)
  {
    a1 = (id *)a1[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitIncidentEntity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitIncidentEntity _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPBTransitIncidentEntity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
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
  return GEOPBTransitIncidentEntityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_filter)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_affectedMuid;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(GEOPBTransitIncidentEntityFilter *)self->_filter copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_affectedMuid != *((void *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  filter = self->_filter;
  if ((unint64_t)filter | *((void *)v4 + 3)) {
    char v6 = -[GEOPBTransitIncidentEntityFilter isEqual:](filter, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    unint64_t v2 = 2654435761u * self->_affectedMuid;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(GEOPBTransitIncidentEntityFilter *)self->_filter hash] ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (unint64_t)muid
{
  if (self) {
    return *(void *)(self + 16);
  }
  return self;
}

- (BOOL)hasNextStopIDs
{
  if (!self || !self->_filter) {
    return 0;
  }
  unint64_t v2 = -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
  if (v2) {
    BOOL v3 = v2[3] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSSet)nextStopIDs
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = *(void *)(v4 + 24);
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (void *)[v3 initWithCapacity:v6];

  for (unint64_t i = 0; ; ++i)
  {
    v9 = -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
    unint64_t v10 = v9 ? v9[3] : 0;

    if (i >= v10) {
      break;
    }
    v11 = NSNumber;
    v12 = -[GEOPBTransitIncidentEntity filter]((id *)&self->super.super.isa);
    v13 = objc_msgSend(v11, "numberWithUnsignedLongLong:", -[GEOPBTransitIncidentEntityFilter nextStopMuidAtIndex:]((uint64_t)v12, i));
    [v7 addObject:v13];
  }
  id v14 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];

  return (NSSet *)v14;
}

@end