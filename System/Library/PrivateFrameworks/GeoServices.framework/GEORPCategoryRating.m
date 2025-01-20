@interface GEORPCategoryRating
+ (BOOL)isValid:(id)a3;
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCategoryRating)init;
- (GEORPCategoryRating)initWithData:(id)a3;
- (GEORPCategoryRating)initWithDictionary:(id)a3;
- (GEORPCategoryRating)initWithJSON:(id)a3;
- (GEORPRatingValue)value;
- (NSString)key;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readKey;
- (void)_readValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCategoryRating

- (GEORPCategoryRating)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCategoryRating;
  v2 = [(GEORPCategoryRating *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCategoryRating)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCategoryRating;
  v3 = [(GEORPCategoryRating *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCategoryRatingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readKey_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  -[GEORPCategoryRating _readKey]((uint64_t)self);
  key = self->_key;

  return key;
}

- (void)setKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)_readValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCategoryRatingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValue_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (GEORPRatingValue)value
{
  -[GEORPCategoryRating _readValue]((uint64_t)self);
  value = self->_value;

  return value;
}

- (void)setValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_value, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCategoryRating;
  v4 = [(GEORPCategoryRating *)&v8 description];
  v5 = [(GEORPCategoryRating *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCategoryRating _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 key];
    if (v5) {
      [v4 setObject:v5 forKey:@"key"];
    }

    objc_super v6 = [a1 value];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"value"];
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
  return -[GEORPCategoryRating _dictionaryRepresentation:](self, 1);
}

- (GEORPCategoryRating)initWithDictionary:(id)a3
{
  return (GEORPCategoryRating *)-[GEORPCategoryRating _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"key"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setKey:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"value"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEORPRatingValue alloc];
        if (a3) {
          uint64_t v10 = [(GEORPRatingValue *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEORPRatingValue *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setValue:v10];
      }
    }
  }

  return a1;
}

- (GEORPCategoryRating)initWithJSON:(id)a3
{
  return (GEORPCategoryRating *)-[GEORPCategoryRating _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_20;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_20;
    }
    GEORPCategoryRatingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPRatingValue *)self->_value readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCategoryRatingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCategoryRatingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPCategoryRating *)self readAll:0];
    if (self->_key) {
      PBDataWriterWriteStringField();
    }
    if (self->_value) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPCategoryRating *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_key) {
    objc_msgSend(v4, "setKey:");
  }
  if (self->_value) {
    objc_msgSend(v4, "setValue:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPCategoryRating *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_key copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEORPRatingValue *)self->_value copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPCategoryRatingReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPCategoryRating *)self readAll:1],
         [v4 readAll:1],
         key = self->_key,
         !((unint64_t)key | v4[2]))
     || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[3]) {
      char v7 = -[GEORPRatingValue isEqual:](value, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEORPCategoryRating *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(GEORPRatingValue *)self->_value hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  if (v6[2]) {
    -[GEORPCategoryRating setKey:](self, "setKey:");
  }
  value = self->_value;
  uint64_t v5 = v6[3];
  if (value)
  {
    if (v5) {
      -[GEORPRatingValue mergeFrom:](value, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPCategoryRating setValue:](self, "setValue:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end