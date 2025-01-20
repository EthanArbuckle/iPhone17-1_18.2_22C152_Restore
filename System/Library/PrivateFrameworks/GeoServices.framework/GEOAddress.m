@interface GEOAddress
+ (BOOL)isValid:(id)a3;
+ (Class)formattedAddressLineType;
+ (id)geoAddressForPlaceData:(id)a3;
- (BOOL)_isEquivalentURLRepresentationTo:(id)a3;
- (BOOL)hasFormattedAddressType;
- (BOOL)hasStructuredAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddress)init;
- (GEOAddress)initWithAddressDictionary:(id)a3;
- (GEOAddress)initWithData:(id)a3;
- (GEOAddress)initWithDictionary:(id)a3;
- (GEOAddress)initWithJSON:(id)a3;
- (GEOAddress)initWithPostalAddress:(id)a3;
- (GEOAddress)initWithUrlRepresentation:(id)a3;
- (GEOStructuredAddress)structuredAddress;
- (NSMutableArray)formattedAddressLines;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressDictionary;
- (id)bestName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)formattedAddressLineAtIndex:(unint64_t)a3;
- (id)formattedAddressTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)postalAddress;
- (id)urlRepresentation;
- (int)StringAsFormattedAddressType:(id)a3;
- (int)formattedAddressType;
- (unint64_t)formattedAddressLinesCount;
- (unint64_t)hash;
- (void)_addNoFlagsFormattedAddressLine:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readFormattedAddressLines;
- (void)_readStructuredAddress;
- (void)addFormattedAddressLine:(id)a3;
- (void)clearFormattedAddressLines;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFormattedAddressLines:(id)a3;
- (void)setFormattedAddressType:(int)a3;
- (void)setHasFormattedAddressType:(BOOL)a3;
- (void)setStructuredAddress:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddress

- (BOOL)readFrom:(id)a3
{
  return GEOAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOAddress)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddress;
  v3 = [(GEOAddress *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredAddress, 0);
  objc_storeStrong((id *)&self->_formattedAddressLines, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setStructuredAddress:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_structuredAddress, a3);
}

- (void)setFormattedAddressLines:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  formattedAddressLines = self->_formattedAddressLines;
  self->_formattedAddressLines = v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAddress *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_formattedAddressLines;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_structuredAddress) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (unint64_t)formattedAddressLinesCount
{
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  formattedAddressLines = self->_formattedAddressLines;

  return [(NSMutableArray *)formattedAddressLines count];
}

- (id)addressDictionary
{
  if (![(GEOAddress *)self hasStructuredAddress]
    || ([(GEOAddress *)self structuredAddress],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 addressDictionary],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  }
  v5 = [(GEOAddress *)self formattedAddressLines];
  if ([v5 count]) {
    [v4 setObject:v5 forKeyedSubscript:@"FormattedAddressLines"];
  }

  return v4;
}

- (BOOL)hasStructuredAddress
{
  return self->_structuredAddress != 0;
}

- (NSMutableArray)formattedAddressLines
{
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  formattedAddressLines = self->_formattedAddressLines;

  return formattedAddressLines;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAddress *)self readAll:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_formattedAddressLines;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addFormattedAddressLine:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOStructuredAddress *)self->_structuredAddress copyWithZone:a3];
  long long v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_formattedAddressType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_15:

  return (id)v5;
}

- (void)addFormattedAddressLine:(id)a3
{
  id v4 = a3;
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  -[GEOAddress _addNoFlagsFormattedAddressLine:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_readFormattedAddressLines
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedAddressLines_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_69;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_69;
    }
    GEOAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddress;
  v2 = [(GEOAddress *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOStructuredAddress)structuredAddress
{
  -[GEOAddress _readStructuredAddress]((uint64_t)self);
  structuredAddress = self->_structuredAddress;

  return structuredAddress;
}

- (void)_readStructuredAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStructuredAddress_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsFormattedAddressLine:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

+ (id)geoAddressForPlaceData:(id)a3
{
  id v3 = +[GEOAddressObject addressObjectForPlaceData:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 address];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (GEOAddress)initWithUrlRepresentation:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOAddress;
  id v5 = [(GEOAddress *)&v12 init];
  if (v5)
  {
    objc_super v6 = [v4 objectForKey:@"addr"];
    if ([v6 count])
    {
      id v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
      [(GEOAddress *)v5 setFormattedAddressLines:v7];
    }
    id v8 = [v4 objectForKey:@"straddr"];
    if (v8)
    {
      uint64_t v9 = [[GEOStructuredAddress alloc] initWithUrlRepresentation:v8];
      if (v9) {
        [(GEOAddress *)v5 setStructuredAddress:v9];
      }
    }
    uint64_t v10 = v5;
  }
  return v5;
}

- (id)urlRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(GEOAddress *)self formattedAddressLines];

  if (v4)
  {
    id v5 = [(GEOAddress *)self formattedAddressLines];
    [v3 setObject:v5 forKey:@"addr"];
  }
  if ([(GEOAddress *)self hasStructuredAddress])
  {
    objc_super v6 = [(GEOAddress *)self structuredAddress];
    id v7 = [v6 urlRepresentation];
    [v3 setObject:v7 forKey:@"straddr"];
  }

  return v3;
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  id v7 = a3;
  id v8 = [(GEOAddress *)self formattedAddressLines];
  if (v8 || ([v7 formattedAddressLines], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(GEOAddress *)self formattedAddressLines];
    id v5 = [v7 formattedAddressLines];
    if (([v4 isEqual:v5] & 1) == 0)
    {

      char v10 = 0;
      goto LABEL_11;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  if ([(GEOAddress *)self hasStructuredAddress]
    || ([v7 hasStructuredAddress] & 1) != 0)
  {
    uint64_t v11 = [(GEOAddress *)self structuredAddress];
    objc_super v12 = [v7 structuredAddress];
    char v10 = [v11 _isEquivalentURLRepresentationTo:v12];

    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  char v10 = 1;
  if (v9)
  {
LABEL_10:
  }
LABEL_11:
  if (!v8) {

  }
  return v10;
}

- (GEOAddress)initWithAddressDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOAddress;
  id v5 = [(GEOAddress *)&v10 init];
  if (v5)
  {
    objc_super v6 = [[GEOStructuredAddress alloc] initWithAddressDictionary:v4];
    [(GEOAddress *)v5 setStructuredAddress:v6];

    id v7 = [v4 objectForKeyedSubscript:@"FormattedAddressLines"];
    [(GEOAddress *)v5 setFormattedAddressLines:v7];

    id v8 = v5;
  }

  return v5;
}

- (GEOAddress)initWithPostalAddress:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAddress;
  id v5 = [(GEOAddress *)&v9 init];
  if (v5)
  {
    objc_super v6 = [[GEOStructuredAddress alloc] initWithPostalAddress:v4];
    [(GEOAddress *)v5 setStructuredAddress:v6];

    id v7 = v5;
  }

  return v5;
}

- (id)postalAddress
{
  if ([(GEOAddress *)self hasStructuredAddress])
  {
    id v3 = [(GEOAddress *)self structuredAddress];
    id v4 = [v3 postalAddress];
    id v5 = (id)[v4 mutableCopy];
  }
  else
  {
    id v5 = 0;
  }
  objc_super v6 = [(GEOAddress *)self formattedAddressLines];
  if ([v6 count])
  {
    if (!v5) {
      id v5 = objc_alloc_init((Class)getCNMutablePostalAddressClass());
    }
    id v7 = [v6 componentsJoinedByString:@"\n"];
    [v5 setFormattedAddress:v7];
  }
  id v8 = (void *)[v5 copy];

  return v8;
}

- (id)bestName
{
  v2 = [(GEOAddress *)self formattedAddressLines];
  if ([v2 count])
  {
    id v3 = [v2 firstObject];
    if ([v3 length]) {
      goto LABEL_5;
    }
  }
  id v3 = 0;
LABEL_5:

  return v3;
}

- (void)clearFormattedAddressLines
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  formattedAddressLines = self->_formattedAddressLines;

  [(NSMutableArray *)formattedAddressLines removeAllObjects];
}

- (id)formattedAddressLineAtIndex:(unint64_t)a3
{
  -[GEOAddress _readFormattedAddressLines]((uint64_t)self);
  formattedAddressLines = self->_formattedAddressLines;

  return (id)[(NSMutableArray *)formattedAddressLines objectAtIndex:a3];
}

+ (Class)formattedAddressLineType
{
  return (Class)objc_opt_class();
}

- (int)formattedAddressType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_formattedAddressType;
  }
  else {
    return 0;
  }
}

- (void)setFormattedAddressType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_formattedAddressType = a3;
}

- (void)setHasFormattedAddressType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasFormattedAddressType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)formattedAddressTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EB630[a3];
  }

  return v3;
}

- (int)StringAsFormattedAddressType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FULL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SHORT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SPOKEN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddress;
  int v4 = [(GEOAddress *)&v8 description];
  id v5 = [(GEOAddress *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = [(id)a1 formattedAddressLines];
      [v4 setObject:v5 forKey:@"formattedAddressLine"];
    }
    objc_super v6 = [(id)a1 structuredAddress];
    id v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"structuredAddress"];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v9 = *(int *)(a1 + 52);
      if (v9 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v10 = off_1E53EB630[v9];
      }
      [v4 setObject:v10 forKey:@"formattedAddressType"];
    }
    uint64_t v11 = *(void **)(a1 + 16);
    if (v11)
    {
      objc_super v12 = [v11 dictionaryRepresentation];
      long long v13 = v12;
      if (a2)
      {
        id v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __40__GEOAddress__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        long long v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOAddress)initWithDictionary:(id)a3
{
  return (GEOAddress *)-[GEOAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"formattedAddressLine"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              objc_super v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v13 = objc_msgSend(v12, "copy", (void)v22);
                [a1 addFormattedAddressLine:v13];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v9);
        }
      }
      id v14 = [v5 objectForKeyedSubscript:@"structuredAddress"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [GEOStructuredAddress alloc];
        if (a3) {
          uint64_t v16 = [(GEOStructuredAddress *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOStructuredAddress *)v15 initWithDictionary:v14];
        }
        uint64_t v17 = (void *)v16;
        objc_msgSend(a1, "setStructuredAddress:", v16, (void)v22);
      }
      long long v18 = [v5 objectForKeyedSubscript:@"formattedAddressType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        if ([v19 isEqualToString:@"FULL"])
        {
          uint64_t v20 = 0;
        }
        else if ([v19 isEqualToString:@"SHORT"])
        {
          uint64_t v20 = 1;
        }
        else if ([v19 isEqualToString:@"SPOKEN"])
        {
          uint64_t v20 = 2;
        }
        else
        {
          uint64_t v20 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_31:

          goto LABEL_32;
        }
        uint64_t v20 = [v18 intValue];
      }
      objc_msgSend(a1, "setFormattedAddressType:", v20, (void)v22);
      goto LABEL_31;
    }
  }
LABEL_32:

  return a1;
}

- (GEOAddress)initWithJSON:(id)a3
{
  return (GEOAddress *)-[GEOAddress _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOAddress *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOAddress *)self formattedAddressLinesCount])
  {
    [v8 clearFormattedAddressLines];
    unint64_t v4 = [(GEOAddress *)self formattedAddressLinesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(GEOAddress *)self formattedAddressLineAtIndex:i];
        [v8 addFormattedAddressLine:v7];
      }
    }
  }
  if (self->_structuredAddress) {
    objc_msgSend(v8, "setStructuredAddress:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 13) = self->_formattedAddressType;
    *((unsigned char *)v8 + 56) |= 1u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOAddress *)self readAll:1];
  [v4 readAll:1];
  formattedAddressLines = self->_formattedAddressLines;
  if ((unint64_t)formattedAddressLines | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](formattedAddressLines, "isEqual:")) {
      goto LABEL_10;
    }
  }
  structuredAddress = self->_structuredAddress;
  if ((unint64_t)structuredAddress | *((void *)v4 + 4))
  {
    if (!-[GEOStructuredAddress isEqual:](structuredAddress, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_formattedAddressType == *((_DWORD *)v4 + 13))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAddress *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_formattedAddressLines hash];
  unint64_t v4 = [(GEOStructuredAddress *)self->_structuredAddress hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_formattedAddressType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOAddress addFormattedAddressLine:](self, "addFormattedAddressLine:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  structuredAddress = self->_structuredAddress;
  uint64_t v11 = *((void *)v4 + 4);
  if (structuredAddress)
  {
    if (v11) {
      -[GEOStructuredAddress mergeFrom:](structuredAddress, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOAddress setStructuredAddress:](self, "setStructuredAddress:");
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_formattedAddressType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_13);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAddress *)self readAll:0];
    structuredAddress = self->_structuredAddress;
    [(GEOStructuredAddress *)structuredAddress clearUnknownFields:1];
  }
}

@end