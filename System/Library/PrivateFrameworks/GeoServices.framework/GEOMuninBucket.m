@interface GEOMuninBucket
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBucketID;
- (BOOL)hasBucketURL;
- (BOOL)hasLodLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMuninBucket)initWithDictionary:(id)a3;
- (GEOMuninBucket)initWithJSON:(id)a3;
- (NSString)bucketURL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)bucketID;
- (unsigned)lodLevel;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBucketID:(unsigned int)a3;
- (void)setBucketURL:(id)a3;
- (void)setHasBucketID:(BOOL)a3;
- (void)setHasLodLevel:(BOOL)a3;
- (void)setLodLevel:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMuninBucket

- (unsigned)bucketID
{
  return self->_bucketID;
}

- (void)setBucketID:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_bucketID = a3;
}

- (void)setHasBucketID:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBucketID
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasBucketURL
{
  return self->_bucketURL != 0;
}

- (NSString)bucketURL
{
  return self->_bucketURL;
}

- (void)setBucketURL:(id)a3
{
}

- (unsigned)lodLevel
{
  return self->_lodLevel;
}

- (void)setLodLevel:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_lodLevel = a3;
}

- (void)setHasLodLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLodLevel
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMuninBucket;
  v4 = [(GEOMuninBucket *)&v8 description];
  v5 = [(GEOMuninBucket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMuninBucket _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v4 setObject:v5 forKey:@"bucketID"];
    }
    v6 = [(id)a1 bucketURL];
    if (v6) {
      [v4 setObject:v6 forKey:@"bucketURL"];
    }

    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
      [v4 setObject:v7 forKey:@"lodLevel"];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __44__GEOMuninBucket__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEOMuninBucket _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOMuninBucket__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOMuninBucket)initWithDictionary:(id)a3
{
  return (GEOMuninBucket *)-[GEOMuninBucket _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"bucketID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBucketID:", objc_msgSend(v4, "unsignedIntValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"bucketURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = (void *)[v5 copy];
        [a1 setBucketURL:v6];
      }
      v7 = [v3 objectForKeyedSubscript:@"lodLevel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLodLevel:", objc_msgSend(v7, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOMuninBucket)initWithJSON:(id)a3
{
  return (GEOMuninBucket *)-[GEOMuninBucket _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMuninBucketIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMuninBucketReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_bucketURL) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOMuninBucket *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[6] = self->_bucketID;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  if (self->_bucketURL)
  {
    objc_msgSend(v5, "setBucketURL:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_lodLevel;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_bucketID;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_bucketURL copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_lodLevel;
    *(unsigned char *)(v6 + 32) |= 2u;
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
  [(GEOMuninBucket *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_bucketID != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  bucketURL = self->_bucketURL;
  if ((unint64_t)bucketURL | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bucketURL, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_lodLevel != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOMuninBucket *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_bucketID;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_bucketURL hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_lodLevel;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (unsigned int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[8])
  {
    self->_bucketID = v5[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 2))
  {
    -[GEOMuninBucket setBucketURL:](self, "setBucketURL:");
    NSUInteger v4 = v5;
  }
  if ((v4[8] & 2) != 0)
  {
    self->_lodLevel = v4[7];
    *(unsigned char *)&self->_flags |= 2u;
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
    [(GEOMuninBucket *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketURL, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end