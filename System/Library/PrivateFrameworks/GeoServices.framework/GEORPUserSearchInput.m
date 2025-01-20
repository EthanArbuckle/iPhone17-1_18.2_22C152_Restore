@interface GEORPUserSearchInput
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAutocompleteEntry;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasOrigin;
- (BOOL)hasPlace;
- (BOOL)hasSearchString;
- (BOOL)hasSingleLineAddressString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEOPDAutocompleteEntry)autocompleteEntry;
- (GEOPDPlace)place;
- (GEORPUserSearchInput)init;
- (GEORPUserSearchInput)initWithData:(id)a3;
- (GEORPUserSearchInput)initWithDictionary:(id)a3;
- (GEORPUserSearchInput)initWithJSON:(id)a3;
- (NSString)searchString;
- (NSString)singleLineAddressString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)originAsString:(int)a3;
- (int)StringAsOrigin:(id)a3;
- (int)origin;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAutocompleteEntry;
- (void)_readCoordinate;
- (void)_readPlace;
- (void)_readSearchString;
- (void)_readSingleLineAddressString;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAutocompleteEntry:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setOrigin:(int)a3;
- (void)setPlace:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSingleLineAddressString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPUserSearchInput

- (GEORPUserSearchInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPUserSearchInput;
  v2 = [(GEORPUserSearchInput *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPUserSearchInput)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPUserSearchInput;
  v3 = [(GEORPUserSearchInput *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchString_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEORPUserSearchInput _readSearchString]((uint64_t)self);
  searchString = self->_searchString;

  return searchString;
}

- (void)setSearchString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)_readSingleLineAddressString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSingleLineAddressString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSingleLineAddressString
{
  return self->_singleLineAddressString != 0;
}

- (NSString)singleLineAddressString
{
  -[GEORPUserSearchInput _readSingleLineAddressString]((uint64_t)self);
  singleLineAddressString = self->_singleLineAddressString;

  return singleLineAddressString;
}

- (void)setSingleLineAddressString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_singleLineAddressString, a3);
}

- (void)_readPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_3407);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPUserSearchInput _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readAutocompleteEntry
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompleteEntry_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasAutocompleteEntry
{
  return self->_autocompleteEntry != 0;
}

- (GEOPDAutocompleteEntry)autocompleteEntry
{
  -[GEORPUserSearchInput _readAutocompleteEntry]((uint64_t)self);
  autocompleteEntry = self->_autocompleteEntry;

  return autocompleteEntry;
}

- (void)setAutocompleteEntry:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_autocompleteEntry, a3);
}

- (void)_readCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPUserSearchInputReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_3408);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPUserSearchInput _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (int)origin
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_origin;
  }
  else {
    return 0;
  }
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasOrigin
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E6ED0[a3];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONTACT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CURRENT_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DROPPED_PIN"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPUserSearchInput;
  int v4 = [(GEORPUserSearchInput *)&v8 description];
  v5 = [(GEORPUserSearchInput *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPUserSearchInput _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 searchString];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"searchString";
      }
      else {
        objc_super v6 = @"search_string";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 singleLineAddressString];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"singleLineAddressString";
      }
      else {
        objc_super v8 = @"single_line_address_string";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 place];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"place"];
    }
    v12 = [(id)a1 autocompleteEntry];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"autocompleteEntry";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"autocomplete_entry";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = [(id)a1 coordinate];
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"coordinate"];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v19 = *(int *)(a1 + 68);
      if (v19 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E53E6ED0[v19];
      }
      [v4 setObject:v20 forKey:@"origin"];
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
  return -[GEORPUserSearchInput _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPUserSearchInput)initWithDictionary:(id)a3
{
  return (GEORPUserSearchInput *)-[GEORPUserSearchInput _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"searchString";
      }
      else {
        objc_super v6 = @"search_string";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setSearchString:v8];
      }
      if (a3) {
        v9 = @"singleLineAddressString";
      }
      else {
        v9 = @"single_line_address_string";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setSingleLineAddressString:v11];
      }
      v12 = [v5 objectForKeyedSubscript:@"place"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOPDPlace alloc];
        if (a3) {
          uint64_t v14 = [(GEOPDPlace *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPDPlace *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setPlace:v14];
      }
      if (a3) {
        v16 = @"autocompleteEntry";
      }
      else {
        v16 = @"autocomplete_entry";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOPDAutocompleteEntry alloc];
        if (a3) {
          uint64_t v19 = [(GEOPDAutocompleteEntry *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOPDAutocompleteEntry *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setAutocompleteEntry:v19];
      }
      v21 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v23 = [(GEOLatLng *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOLatLng *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setCoordinate:v23];
      }
      v25 = [v5 objectForKeyedSubscript:@"origin"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v25;
        if ([v26 isEqualToString:@"OTHER"])
        {
          uint64_t v27 = 0;
        }
        else if ([v26 isEqualToString:@"CONTACT"])
        {
          uint64_t v27 = 1;
        }
        else if ([v26 isEqualToString:@"CURRENT_LOCATION"])
        {
          uint64_t v27 = 2;
        }
        else if ([v26 isEqualToString:@"DROPPED_PIN"])
        {
          uint64_t v27 = 3;
        }
        else
        {
          uint64_t v27 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_45:

          goto LABEL_46;
        }
        uint64_t v27 = [v25 intValue];
      }
      [a1 setOrigin:v27];
      goto LABEL_45;
    }
  }
LABEL_46:

  return a1;
}

- (GEORPUserSearchInput)initWithJSON:(id)a3
{
  return (GEORPUserSearchInput *)-[GEORPUserSearchInput _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3431;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3432;
    }
    GEORPUserSearchInputReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDPlace *)self->_place readAll:1];
    [(GEOPDAutocompleteEntry *)self->_autocompleteEntry readAll:1];
    [(GEOLatLng *)self->_coordinate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPUserSearchInputIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPUserSearchInputReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPUserSearchInputIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPUserSearchInput *)self readAll:0];
    if (self->_searchString) {
      PBDataWriterWriteStringField();
    }
    if (self->_singleLineAddressString) {
      PBDataWriterWriteStringField();
    }
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_autocompleteEntry) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_coordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPUserSearchInput _readAutocompleteEntry]((uint64_t)self);
  if ([(GEOPDAutocompleteEntry *)self->_autocompleteEntry hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPUserSearchInput _readCoordinate]((uint64_t)self);
  if ([(GEOLatLng *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPUserSearchInput _readPlace]((uint64_t)self);
  place = self->_place;

  return [(GEOPDPlace *)place hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPUserSearchInput *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_searchString) {
    objc_msgSend(v5, "setSearchString:");
  }
  if (self->_singleLineAddressString) {
    objc_msgSend(v5, "setSingleLineAddressString:");
  }
  int v4 = v5;
  if (self->_place)
  {
    objc_msgSend(v5, "setPlace:");
    int v4 = v5;
  }
  if (self->_autocompleteEntry)
  {
    objc_msgSend(v5, "setAutocompleteEntry:");
    int v4 = v5;
  }
  if (self->_coordinate)
  {
    objc_msgSend(v5, "setCoordinate:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 17) = self->_origin;
    *((unsigned char *)v4 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPUserSearchInputReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPUserSearchInput *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_searchString copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_singleLineAddressString copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEOPDPlace *)self->_place copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  id v15 = [(GEOPDAutocompleteEntry *)self->_autocompleteEntry copyWithZone:a3];
  v16 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v15;

  id v17 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_origin;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEORPUserSearchInput *)self readAll:1];
  [v4 readAll:1];
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](searchString, "isEqual:")) {
      goto LABEL_16;
    }
  }
  singleLineAddressString = self->_singleLineAddressString;
  if ((unint64_t)singleLineAddressString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](singleLineAddressString, "isEqual:")) {
      goto LABEL_16;
    }
  }
  place = self->_place;
  if ((unint64_t)place | *((void *)v4 + 4))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:")) {
      goto LABEL_16;
    }
  }
  autocompleteEntry = self->_autocompleteEntry;
  if ((unint64_t)autocompleteEntry | *((void *)v4 + 2))
  {
    if (!-[GEOPDAutocompleteEntry isEqual:](autocompleteEntry, "isEqual:")) {
      goto LABEL_16;
    }
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_16;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 72) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) != 0 && self->_origin == *((_DWORD *)v4 + 17))
    {
      BOOL v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  [(GEORPUserSearchInput *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  NSUInteger v4 = [(NSString *)self->_singleLineAddressString hash];
  unint64_t v5 = [(GEOPDPlace *)self->_place hash];
  unint64_t v6 = [(GEOPDAutocompleteEntry *)self->_autocompleteEntry hash];
  unint64_t v7 = [(GEOLatLng *)self->_coordinate hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_origin;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v11 = a3;
  [v11 readAll:0];
  NSUInteger v4 = v11;
  if (v11[5])
  {
    -[GEORPUserSearchInput setSearchString:](self, "setSearchString:");
    NSUInteger v4 = v11;
  }
  if (v4[6])
  {
    -[GEORPUserSearchInput setSingleLineAddressString:](self, "setSingleLineAddressString:");
    NSUInteger v4 = v11;
  }
  place = self->_place;
  uint64_t v6 = v4[4];
  if (place)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPUserSearchInput setPlace:](self, "setPlace:");
  }
  NSUInteger v4 = v11;
LABEL_11:
  autocompleteEntry = self->_autocompleteEntry;
  uint64_t v8 = v4[2];
  if (autocompleteEntry)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOPDAutocompleteEntry mergeFrom:](autocompleteEntry, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPUserSearchInput setAutocompleteEntry:](self, "setAutocompleteEntry:");
  }
  NSUInteger v4 = v11;
LABEL_17:
  coordinate = self->_coordinate;
  uint64_t v10 = v4[3];
  if (coordinate)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEORPUserSearchInput setCoordinate:](self, "setCoordinate:");
  }
  NSUInteger v4 = v11;
LABEL_23:
  if (v4[9])
  {
    self->_origin = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleLineAddressString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end