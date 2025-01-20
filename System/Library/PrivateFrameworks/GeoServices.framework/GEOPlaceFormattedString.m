@interface GEOPlaceFormattedString
+ (BOOL)isValid:(id)a3;
- (BOOL)hasContactHome;
- (BOOL)hasContactOther;
- (BOOL)hasContactWork;
- (BOOL)hasCustom;
- (BOOL)hasHome;
- (BOOL)hasPointOfInterest;
- (BOOL)hasStreetAddress;
- (BOOL)hasUnknown;
- (BOOL)hasWork;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)contactHome;
- (GEOFormattedString)contactOther;
- (GEOFormattedString)contactWork;
- (GEOFormattedString)custom;
- (GEOFormattedString)home;
- (GEOFormattedString)pointOfInterest;
- (GEOFormattedString)streetAddress;
- (GEOFormattedString)unknown;
- (GEOFormattedString)work;
- (GEOPlaceFormattedString)init;
- (GEOPlaceFormattedString)initWithData:(id)a3;
- (GEOPlaceFormattedString)initWithDictionary:(id)a3;
- (GEOPlaceFormattedString)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readContactHome;
- (void)_readContactOther;
- (void)_readContactWork;
- (void)_readCustom;
- (void)_readHome;
- (void)_readPointOfInterest;
- (void)_readStreetAddress;
- (void)_readUnknown;
- (void)_readWork;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setContactHome:(id)a3;
- (void)setContactOther:(id)a3;
- (void)setContactWork:(id)a3;
- (void)setCustom:(id)a3;
- (void)setHome:(id)a3;
- (void)setPointOfInterest:(id)a3;
- (void)setStreetAddress:(id)a3;
- (void)setUnknown:(id)a3;
- (void)setWork:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceFormattedString

- (GEOPlaceFormattedString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceFormattedString;
  v2 = [(GEOPlaceFormattedString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceFormattedString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceFormattedString;
  v3 = [(GEOPlaceFormattedString *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readHome
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHome_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasHome
{
  return self->_home != 0;
}

- (GEOFormattedString)home
{
  -[GEOPlaceFormattedString _readHome]((uint64_t)self);
  home = self->_home;

  return home;
}

- (void)setHome:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_home, a3);
}

- (void)_readWork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWork
{
  return self->_work != 0;
}

- (GEOFormattedString)work
{
  -[GEOPlaceFormattedString _readWork]((uint64_t)self);
  work = self->_work;

  return work;
}

- (void)setWork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_work, a3);
}

- (void)_readContactWork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContactWork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasContactWork
{
  return self->_contactWork != 0;
}

- (GEOFormattedString)contactWork
{
  -[GEOPlaceFormattedString _readContactWork]((uint64_t)self);
  contactWork = self->_contactWork;

  return contactWork;
}

- (void)setContactWork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_contactWork, a3);
}

- (void)_readContactHome
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContactHome_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasContactHome
{
  return self->_contactHome != 0;
}

- (GEOFormattedString)contactHome
{
  -[GEOPlaceFormattedString _readContactHome]((uint64_t)self);
  contactHome = self->_contactHome;

  return contactHome;
}

- (void)setContactHome:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_contactHome, a3);
}

- (void)_readContactOther
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContactOther_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasContactOther
{
  return self->_contactOther != 0;
}

- (GEOFormattedString)contactOther
{
  -[GEOPlaceFormattedString _readContactOther]((uint64_t)self);
  contactOther = self->_contactOther;

  return contactOther;
}

- (void)setContactOther:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_contactOther, a3);
}

- (void)_readPointOfInterest
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPointOfInterest_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasPointOfInterest
{
  return self->_pointOfInterest != 0;
}

- (GEOFormattedString)pointOfInterest
{
  -[GEOPlaceFormattedString _readPointOfInterest]((uint64_t)self);
  pointOfInterest = self->_pointOfInterest;

  return pointOfInterest;
}

- (void)setPointOfInterest:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_pointOfInterest, a3);
}

- (void)_readStreetAddress
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStreetAddress_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasStreetAddress
{
  return self->_streetAddress != 0;
}

- (GEOFormattedString)streetAddress
{
  -[GEOPlaceFormattedString _readStreetAddress]((uint64_t)self);
  streetAddress = self->_streetAddress;

  return streetAddress;
}

- (void)setStreetAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_streetAddress, a3);
}

- (void)_readUnknown
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnknown_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUnknown
{
  return self->_unknown != 0;
}

- (GEOFormattedString)unknown
{
  -[GEOPlaceFormattedString _readUnknown]((uint64_t)self);
  unknown = self->_unknown;

  return unknown;
}

- (void)setUnknown:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_unknown, a3);
}

- (void)_readCustom
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCustom_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasCustom
{
  return self->_custom != 0;
}

- (GEOFormattedString)custom
{
  -[GEOPlaceFormattedString _readCustom]((uint64_t)self);
  custom = self->_custom;

  return custom;
}

- (void)setCustom:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_custom, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceFormattedString;
  v4 = [(GEOPlaceFormattedString *)&v8 description];
  v5 = [(GEOPlaceFormattedString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceFormattedString _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 home];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"home"];
    }
    objc_super v8 = [a1 work];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"work"];
    }
    v11 = [a1 contactWork];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"contactWork";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"contact_work";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [a1 contactHome];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"contactHome";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"contact_home";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [a1 contactOther];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"contactOther";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"contact_other";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [a1 pointOfInterest];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"pointOfInterest";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"point_of_interest";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = [a1 streetAddress];
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"streetAddress";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"street_address";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = [a1 unknown];
    v32 = v31;
    if (v31)
    {
      if (a2) {
        [v31 jsonRepresentation];
      }
      else {
      v33 = [v31 dictionaryRepresentation];
      }
      [v4 setObject:v33 forKey:@"unknown"];
    }
    v34 = [a1 custom];
    v35 = v34;
    if (v34)
    {
      if (a2) {
        [v34 jsonRepresentation];
      }
      else {
      v36 = [v34 dictionaryRepresentation];
      }
      [v4 setObject:v36 forKey:@"custom"];
    }
    v37 = (void *)a1[2];
    if (v37)
    {
      v38 = [v37 dictionaryRepresentation];
      v39 = v38;
      if (a2)
      {
        v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __53__GEOPlaceFormattedString__dictionaryRepresentation___block_invoke;
        v44[3] = &unk_1E53D8860;
        id v41 = v40;
        id v45 = v41;
        [v39 enumerateKeysAndObjectsUsingBlock:v44];
        id v42 = v41;

        v39 = v42;
      }
      [v4 setObject:v39 forKey:@"Unknown Fields"];
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
  return -[GEOPlaceFormattedString _dictionaryRepresentation:](self, 1);
}

void __53__GEOPlaceFormattedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOPlaceFormattedString)initWithDictionary:(id)a3
{
  return (GEOPlaceFormattedString *)-[GEOPlaceFormattedString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"home"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setHome:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"work"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v12 = [(GEOFormattedString *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOFormattedString *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setWork:v12];
      }
      if (a3) {
        v14 = @"contactWork";
      }
      else {
        v14 = @"contact_work";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v17 = [(GEOFormattedString *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOFormattedString *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setContactWork:v17];
      }
      if (a3) {
        v19 = @"contactHome";
      }
      else {
        v19 = @"contact_home";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v22 = [(GEOFormattedString *)v21 initWithJSON:v20];
        }
        else {
          uint64_t v22 = [(GEOFormattedString *)v21 initWithDictionary:v20];
        }
        v23 = (void *)v22;
        [a1 setContactHome:v22];
      }
      if (a3) {
        v24 = @"contactOther";
      }
      else {
        v24 = @"contact_other";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v27 = [(GEOFormattedString *)v26 initWithJSON:v25];
        }
        else {
          uint64_t v27 = [(GEOFormattedString *)v26 initWithDictionary:v25];
        }
        v28 = (void *)v27;
        [a1 setContactOther:v27];
      }
      if (a3) {
        v29 = @"pointOfInterest";
      }
      else {
        v29 = @"point_of_interest";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v32 = [(GEOFormattedString *)v31 initWithJSON:v30];
        }
        else {
          uint64_t v32 = [(GEOFormattedString *)v31 initWithDictionary:v30];
        }
        v33 = (void *)v32;
        [a1 setPointOfInterest:v32];
      }
      if (a3) {
        v34 = @"streetAddress";
      }
      else {
        v34 = @"street_address";
      }
      v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v37 = [(GEOFormattedString *)v36 initWithJSON:v35];
        }
        else {
          uint64_t v37 = [(GEOFormattedString *)v36 initWithDictionary:v35];
        }
        v38 = (void *)v37;
        [a1 setStreetAddress:v37];
      }
      v39 = [v5 objectForKeyedSubscript:@"unknown"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v40 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v41 = [(GEOFormattedString *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEOFormattedString *)v40 initWithDictionary:v39];
        }
        id v42 = (void *)v41;
        [a1 setUnknown:v41];
      }
      v43 = [v5 objectForKeyedSubscript:@"custom"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v44 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v45 = [(GEOFormattedString *)v44 initWithJSON:v43];
        }
        else {
          uint64_t v45 = [(GEOFormattedString *)v44 initWithDictionary:v43];
        }
        v46 = (void *)v45;
        [a1 setCustom:v45];
      }
    }
  }

  return a1;
}

- (GEOPlaceFormattedString)initWithJSON:(id)a3
{
  return (GEOPlaceFormattedString *)-[GEOPlaceFormattedString _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_4506;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_4507;
    }
    GEOPlaceFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPlaceFormattedStringCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceFormattedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceFormattedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceFormattedStringIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPlaceFormattedString *)self readAll:0];
    if (self->_home) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_work)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_contactWork)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_contactHome)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_contactOther)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_pointOfInterest)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_streetAddress)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_unknown)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_custom)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPlaceFormattedString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 24) = self->_readerMarkPos;
  *((_DWORD *)v5 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_home) {
    objc_msgSend(v5, "setHome:");
  }
  if (self->_work) {
    objc_msgSend(v5, "setWork:");
  }
  v4 = v5;
  if (self->_contactWork)
  {
    objc_msgSend(v5, "setContactWork:");
    v4 = v5;
  }
  if (self->_contactHome)
  {
    objc_msgSend(v5, "setContactHome:");
    v4 = v5;
  }
  if (self->_contactOther)
  {
    objc_msgSend(v5, "setContactOther:");
    v4 = v5;
  }
  if (self->_pointOfInterest)
  {
    objc_msgSend(v5, "setPointOfInterest:");
    v4 = v5;
  }
  if (self->_streetAddress)
  {
    objc_msgSend(v5, "setStreetAddress:");
    v4 = v5;
  }
  if (self->_unknown)
  {
    objc_msgSend(v5, "setUnknown:");
    v4 = v5;
  }
  if (self->_custom)
  {
    objc_msgSend(v5, "setCustom:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPlaceFormattedString *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_home copyWithZone:a3];
    v9 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v8;

    id v10 = [(GEOFormattedString *)self->_work copyWithZone:a3];
    v11 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v10;

    id v12 = [(GEOFormattedString *)self->_contactWork copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    id v14 = [(GEOFormattedString *)self->_contactHome copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    id v16 = [(GEOFormattedString *)self->_contactOther copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v16;

    id v18 = [(GEOFormattedString *)self->_pointOfInterest copyWithZone:a3];
    v19 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v18;

    id v20 = [(GEOFormattedString *)self->_streetAddress copyWithZone:a3];
    v21 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v20;

    id v22 = [(GEOFormattedString *)self->_unknown copyWithZone:a3];
    v23 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v22;

    id v24 = [(GEOFormattedString *)self->_custom copyWithZone:a3];
    v25 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v24;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPlaceFormattedStringReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOPlaceFormattedString *)self readAll:1];
  [v4 readAll:1];
  home = self->_home;
  if ((unint64_t)home | v4[7])
  {
    if (!-[GEOFormattedString isEqual:](home, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((work = self->_work, !((unint64_t)work | v4[11])) || -[GEOFormattedString isEqual:](work, "isEqual:"))
    && ((contactWork = self->_contactWork, !((unint64_t)contactWork | v4[5]))
     || -[GEOFormattedString isEqual:](contactWork, "isEqual:"))
    && ((contactHome = self->_contactHome, !((unint64_t)contactHome | v4[3]))
     || -[GEOFormattedString isEqual:](contactHome, "isEqual:"))
    && ((contactOther = self->_contactOther, !((unint64_t)contactOther | v4[4]))
     || -[GEOFormattedString isEqual:](contactOther, "isEqual:"))
    && ((pointOfInterest = self->_pointOfInterest, !((unint64_t)pointOfInterest | v4[8]))
     || -[GEOFormattedString isEqual:](pointOfInterest, "isEqual:"))
    && ((streetAddress = self->_streetAddress, !((unint64_t)streetAddress | v4[9]))
     || -[GEOFormattedString isEqual:](streetAddress, "isEqual:"))
    && ((unknown = self->_unknown, !((unint64_t)unknown | v4[10]))
     || -[GEOFormattedString isEqual:](unknown, "isEqual:")))
  {
    custom = self->_custom;
    if ((unint64_t)custom | v4[6]) {
      char v14 = -[GEOFormattedString isEqual:](custom, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  [(GEOPlaceFormattedString *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_home hash];
  unint64_t v4 = [(GEOFormattedString *)self->_work hash] ^ v3;
  unint64_t v5 = [(GEOFormattedString *)self->_contactWork hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOFormattedString *)self->_contactHome hash];
  unint64_t v7 = [(GEOFormattedString *)self->_contactOther hash];
  unint64_t v8 = v7 ^ [(GEOFormattedString *)self->_pointOfInterest hash];
  unint64_t v9 = v6 ^ v8 ^ [(GEOFormattedString *)self->_streetAddress hash];
  unint64_t v10 = [(GEOFormattedString *)self->_unknown hash];
  return v9 ^ v10 ^ [(GEOFormattedString *)self->_custom hash];
}

- (void)mergeFrom:(id)a3
{
  id v22 = a3;
  [v22 readAll:0];
  home = self->_home;
  uint64_t v5 = v22[7];
  if (home)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](home, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPlaceFormattedString setHome:](self, "setHome:");
  }
  work = self->_work;
  uint64_t v7 = v22[11];
  if (work)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](work, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPlaceFormattedString setWork:](self, "setWork:");
  }
  contactWork = self->_contactWork;
  uint64_t v9 = v22[5];
  if (contactWork)
  {
    if (v9) {
      -[GEOFormattedString mergeFrom:](contactWork, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOPlaceFormattedString setContactWork:](self, "setContactWork:");
  }
  contactHome = self->_contactHome;
  uint64_t v11 = v22[3];
  if (contactHome)
  {
    if (v11) {
      -[GEOFormattedString mergeFrom:](contactHome, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOPlaceFormattedString setContactHome:](self, "setContactHome:");
  }
  contactOther = self->_contactOther;
  uint64_t v13 = v22[4];
  if (contactOther)
  {
    if (v13) {
      -[GEOFormattedString mergeFrom:](contactOther, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOPlaceFormattedString setContactOther:](self, "setContactOther:");
  }
  pointOfInterest = self->_pointOfInterest;
  uint64_t v15 = v22[8];
  if (pointOfInterest)
  {
    if (v15) {
      -[GEOFormattedString mergeFrom:](pointOfInterest, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOPlaceFormattedString setPointOfInterest:](self, "setPointOfInterest:");
  }
  streetAddress = self->_streetAddress;
  uint64_t v17 = v22[9];
  if (streetAddress)
  {
    if (v17) {
      -[GEOFormattedString mergeFrom:](streetAddress, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[GEOPlaceFormattedString setStreetAddress:](self, "setStreetAddress:");
  }
  unknown = self->_unknown;
  uint64_t v19 = v22[10];
  if (unknown)
  {
    if (v19) {
      -[GEOFormattedString mergeFrom:](unknown, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOPlaceFormattedString setUnknown:](self, "setUnknown:");
  }
  custom = self->_custom;
  uint64_t v21 = v22[6];
  if (custom)
  {
    if (v21) {
      -[GEOFormattedString mergeFrom:](custom, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOPlaceFormattedString setCustom:](self, "setCustom:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4511);
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
  *(_WORD *)&self->_flags |= 0x401u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPlaceFormattedString *)self readAll:0];
    [(GEOFormattedString *)self->_home clearUnknownFields:1];
    [(GEOFormattedString *)self->_work clearUnknownFields:1];
    [(GEOFormattedString *)self->_contactWork clearUnknownFields:1];
    [(GEOFormattedString *)self->_contactHome clearUnknownFields:1];
    [(GEOFormattedString *)self->_contactOther clearUnknownFields:1];
    [(GEOFormattedString *)self->_pointOfInterest clearUnknownFields:1];
    [(GEOFormattedString *)self->_streetAddress clearUnknownFields:1];
    [(GEOFormattedString *)self->_unknown clearUnknownFields:1];
    custom = self->_custom;
    [(GEOFormattedString *)custom clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_work, 0);
  objc_storeStrong((id *)&self->_unknown, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_pointOfInterest, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_custom, 0);
  objc_storeStrong((id *)&self->_contactWork, 0);
  objc_storeStrong((id *)&self->_contactOther, 0);
  objc_storeStrong((id *)&self->_contactHome, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end