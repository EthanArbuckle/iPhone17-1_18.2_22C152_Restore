@interface GEOPDVenueDirectoryGroup
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

@implementation GEOPDVenueDirectoryGroup

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVenueDirectoryGroup;
  v4 = [(GEOPDVenueDirectoryGroup *)&v8 description];
  v5 = [(GEOPDVenueDirectoryGroup *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 40))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v6 = @"directoryGroupingId";
      }
      else {
        v6 = @"directory_grouping_id";
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
      [v4 setObject:v9 forKey:@"label"];
    }
    if ((*(unsigned char *)(a1 + 40) & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v10 forKey:@"muid"];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__GEOPDVenueDirectoryGroup__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueDirectoryGroup _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDVenueDirectoryGroup _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOPDVenueDirectoryGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueDirectoryGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_label) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_directoryGroupingId;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v7 = [(GEOPDVenueLabel *)self->_label copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v6 + 32) = self->_muid;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 40);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_directoryGroupingId != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_14;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 3))
  {
    if (!-[GEOPDVenueLabel isEqual:](label, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 40);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_directoryGroupingId;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDVenueLabel *)self->_label hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v5 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end