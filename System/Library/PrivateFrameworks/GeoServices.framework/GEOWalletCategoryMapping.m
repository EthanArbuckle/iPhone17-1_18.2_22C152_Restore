@interface GEOWalletCategoryMapping
+ (BOOL)isValid:(id)a3;
- (BOOL)hasStylesAttributes;
- (BOOL)hasWalletCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStyleAttributes)stylesAttributes;
- (GEOWalletCategoryMapping)init;
- (GEOWalletCategoryMapping)initWithData:(id)a3;
- (GEOWalletCategoryMapping)initWithDictionary:(id)a3;
- (GEOWalletCategoryMapping)initWithJSON:(id)a3;
- (NSString)walletCategory;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readStylesAttributes;
- (void)_readWalletCategory;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setStylesAttributes:(id)a3;
- (void)setWalletCategory:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWalletCategoryMapping

- (NSString)walletCategory
{
  -[GEOWalletCategoryMapping _readWalletCategory]((uint64_t)self);
  walletCategory = self->_walletCategory;

  return walletCategory;
}

- (void)_readWalletCategory
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
        GEOWalletCategoryMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWalletCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (GEOStyleAttributes)stylesAttributes
{
  -[GEOWalletCategoryMapping _readStylesAttributes]((uint64_t)self);
  stylesAttributes = self->_stylesAttributes;

  return stylesAttributes;
}

- (void)_readStylesAttributes
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
        GEOWalletCategoryMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStylesAttributes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (GEOWalletCategoryMapping)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWalletCategoryMapping;
  v2 = [(GEOWalletCategoryMapping *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWalletCategoryMapping)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWalletCategoryMapping;
  id v3 = [(GEOWalletCategoryMapping *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)hasWalletCategory
{
  return self->_walletCategory != 0;
}

- (void)setWalletCategory:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_walletCategory, a3);
}

- (BOOL)hasStylesAttributes
{
  return self->_stylesAttributes != 0;
}

- (void)setStylesAttributes:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_stylesAttributes, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWalletCategoryMapping;
  v4 = [(GEOWalletCategoryMapping *)&v8 description];
  v5 = [(GEOWalletCategoryMapping *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWalletCategoryMapping _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 walletCategory];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"walletCategory";
      }
      else {
        objc_super v6 = @"wallet_category";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 stylesAttributes];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"stylesAttributes";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"styles_attributes";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEOWalletCategoryMapping _dictionaryRepresentation:](self, 1);
}

- (GEOWalletCategoryMapping)initWithDictionary:(id)a3
{
  return (GEOWalletCategoryMapping *)-[GEOWalletCategoryMapping _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"walletCategory";
      }
      else {
        objc_super v6 = @"wallet_category";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setWalletCategory:v8];
      }
      if (a3) {
        v9 = @"stylesAttributes";
      }
      else {
        v9 = @"styles_attributes";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v12 = [(GEOStyleAttributes *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOStyleAttributes *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setStylesAttributes:v12];
      }
    }
  }

  return a1;
}

- (GEOWalletCategoryMapping)initWithJSON:(id)a3
{
  return (GEOWalletCategoryMapping *)-[GEOWalletCategoryMapping _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_27;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_27;
    }
    GEOWalletCategoryMappingReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOStyleAttributes *)self->_stylesAttributes readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWalletCategoryMappingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWalletCategoryMappingReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEOWalletCategoryMapping *)self readAll:0];
    if (self->_walletCategory) {
      PBDataWriterWriteStringField();
    }
    if (self->_stylesAttributes) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOWalletCategoryMapping *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_walletCategory) {
    objc_msgSend(v4, "setWalletCategory:");
  }
  if (self->_stylesAttributes) {
    objc_msgSend(v4, "setStylesAttributes:");
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
    [(GEOWalletCategoryMapping *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_walletCategory copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEOStyleAttributes *)self->_stylesAttributes copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOWalletCategoryMappingReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOWalletCategoryMapping *)self readAll:1],
         [v4 readAll:1],
         walletCategory = self->_walletCategory,
         !((unint64_t)walletCategory | v4[3]))
     || -[NSString isEqual:](walletCategory, "isEqual:")))
  {
    stylesAttributes = self->_stylesAttributes;
    if ((unint64_t)stylesAttributes | v4[2]) {
      char v7 = -[GEOStyleAttributes isEqual:](stylesAttributes, "isEqual:");
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
  [(GEOWalletCategoryMapping *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_walletCategory hash];
  return [(GEOStyleAttributes *)self->_stylesAttributes hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  if (v6[3]) {
    -[GEOWalletCategoryMapping setWalletCategory:](self, "setWalletCategory:");
  }
  stylesAttributes = self->_stylesAttributes;
  uint64_t v5 = v6[2];
  if (stylesAttributes)
  {
    if (v5) {
      -[GEOStyleAttributes mergeFrom:](stylesAttributes, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOWalletCategoryMapping setStylesAttributes:](self, "setStylesAttributes:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletCategory, 0);
  objc_storeStrong((id *)&self->_stylesAttributes, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end