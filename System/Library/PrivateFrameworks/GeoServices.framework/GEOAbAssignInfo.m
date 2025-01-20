@interface GEOAbAssignInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbAssignId;
- (BOOL)hasCreatedAtTimestamp;
- (BOOL)hasRelativeTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAbAssignInfo)initWithDictionary:(id)a3;
- (GEOAbAssignInfo)initWithJSON:(id)a3;
- (NSString)abAssignId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)createdAtTimestamp;
- (unint64_t)hash;
- (unint64_t)relativeTimestamp;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbAssignId:(id)a3;
- (void)setCreatedAtTimestamp:(unint64_t)a3;
- (void)setHasCreatedAtTimestamp:(BOOL)a3;
- (void)setHasRelativeTimestamp:(BOOL)a3;
- (void)setRelativeTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAbAssignInfo

- (BOOL)hasAbAssignId
{
  return self->_abAssignId != 0;
}

- (NSString)abAssignId
{
  return self->_abAssignId;
}

- (void)setAbAssignId:(id)a3
{
}

- (unint64_t)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setRelativeTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_relativeTimestamp = a3;
}

- (void)setHasRelativeTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRelativeTimestamp
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAbAssignInfo;
  v4 = [(GEOAbAssignInfo *)&v8 description];
  v5 = [(GEOAbAssignInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAbAssignInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 abAssignId];
    if (v5)
    {
      if (a2) {
        v6 = @"abAssignId";
      }
      else {
        v6 = @"ab_assign_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 40);
    if ((v7 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v9 = @"relativeTimestamp";
      }
      else {
        v9 = @"relative_timestamp";
      }
      [v4 setObject:v8 forKey:v9];

      char v7 = *(unsigned char *)(a1 + 40);
    }
    if (v7)
    {
      v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v11 = @"createdAtTimestamp";
      }
      else {
        v11 = @"createdAt_Timestamp";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __45__GEOAbAssignInfo__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOAbAssignInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOAbAssignInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = *(void **)(a1 + 32);
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

- (GEOAbAssignInfo)initWithDictionary:(id)a3
{
  return (GEOAbAssignInfo *)-[GEOAbAssignInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"abAssignId";
      }
      else {
        v6 = @"ab_assign_id";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setAbAssignId:v8];
      }
      if (a3) {
        v9 = @"relativeTimestamp";
      }
      else {
        v9 = @"relative_timestamp";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRelativeTimestamp:", objc_msgSend(v10, "unsignedLongLongValue"));
      }

      if (a3) {
        v11 = @"createdAtTimestamp";
      }
      else {
        v11 = @"createdAt_Timestamp";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCreatedAtTimestamp:", objc_msgSend(v12, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOAbAssignInfo)initWithJSON:(id)a3
{
  return (GEOAbAssignInfo *)-[GEOAbAssignInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAbAssignInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAbAssignInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_abAssignId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOAbAssignInfo *)self readAll:0];
  if (self->_abAssignId) {
    objc_msgSend(v5, "setAbAssignId:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((void *)v5 + 4) = self->_relativeTimestamp;
    *((unsigned char *)v5 + 40) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((void *)v5 + 3) = self->_createdAtTimestamp;
    *((unsigned char *)v5 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_abAssignId copyWithZone:a3];
  char v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 32) = self->_relativeTimestamp;
    *(unsigned char *)(v5 + 40) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 24) = self->_createdAtTimestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOAbAssignInfo *)self readAll:1];
  [v4 readAll:1];
  abAssignId = self->_abAssignId;
  if ((unint64_t)abAssignId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](abAssignId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_relativeTimestamp != *((void *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_createdAtTimestamp != *((void *)v4 + 3)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOAbAssignInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_abAssignId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_relativeTimestamp;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_createdAtTimestamp;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v5 = (unint64_t *)a3;
  [v5 readAll:0];
  if (v5[2]) {
    -[GEOAbAssignInfo setAbAssignId:](self, "setAbAssignId:");
  }
  char v4 = *((unsigned char *)v5 + 40);
  if ((v4 & 2) != 0)
  {
    self->_relativeTimestamp = v5[4];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 40);
  }
  if (v4)
  {
    self->_createdAtTimestamp = v5[3];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAbAssignInfo *)self readAll:0];
  }
}

- (unint64_t)createdAtTimestamp
{
  return self->_createdAtTimestamp;
}

- (void)setCreatedAtTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_createdAtTimestamp = a3;
}

- (void)setHasCreatedAtTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCreatedAtTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abAssignId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end