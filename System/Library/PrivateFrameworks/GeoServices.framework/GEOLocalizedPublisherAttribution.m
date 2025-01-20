@interface GEOLocalizedPublisherAttribution
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayName;
- (BOOL)hasIconIdentifier;
- (BOOL)hasLanguage;
- (BOOL)hasLogoCenteredColorizedIdentifier;
- (BOOL)hasLogoCenteredIdentifier;
- (BOOL)hasLogoIdentifier;
- (BOOL)hasLogoWithoutPaddingIdentifier;
- (BOOL)hasSubtitle;
- (BOOL)hasThemeColorDarkMode;
- (BOOL)hasThemeColorLightMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedPublisherAttribution)init;
- (GEOLocalizedPublisherAttribution)initWithData:(id)a3;
- (GEOLocalizedPublisherAttribution)initWithDictionary:(id)a3;
- (GEOLocalizedPublisherAttribution)initWithJSON:(id)a3;
- (NSString)displayName;
- (NSString)language;
- (NSString)subtitle;
- (NSString)themeColorDarkMode;
- (NSString)themeColorLightMode;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)iconIdentifier;
- (unsigned)logoCenteredColorizedIdentifier;
- (unsigned)logoCenteredIdentifier;
- (unsigned)logoIdentifier;
- (unsigned)logoWithoutPaddingIdentifier;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readDisplayName;
- (void)_readLanguage;
- (void)_readSubtitle;
- (void)_readThemeColorDarkMode;
- (void)_readThemeColorLightMode;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasIconIdentifier:(BOOL)a3;
- (void)setHasLogoCenteredColorizedIdentifier:(BOOL)a3;
- (void)setHasLogoCenteredIdentifier:(BOOL)a3;
- (void)setHasLogoIdentifier:(BOOL)a3;
- (void)setHasLogoWithoutPaddingIdentifier:(BOOL)a3;
- (void)setIconIdentifier:(unsigned int)a3;
- (void)setLanguage:(id)a3;
- (void)setLogoCenteredColorizedIdentifier:(unsigned int)a3;
- (void)setLogoCenteredIdentifier:(unsigned int)a3;
- (void)setLogoIdentifier:(unsigned int)a3;
- (void)setLogoWithoutPaddingIdentifier:(unsigned int)a3;
- (void)setSubtitle:(id)a3;
- (void)setThemeColorDarkMode:(id)a3;
- (void)setThemeColorLightMode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocalizedPublisherAttribution

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLocalizedPublisherAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLocalizedPublisherAttribution *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_language copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_displayName copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_subtitle copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
LABEL_16:
    *(_DWORD *)(v5 + 88) = self->_logoIdentifier;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 76) = self->_iconIdentifier;
  *(_WORD *)(v5 + 96) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_16;
  }
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 84) = self->_logoCenteredIdentifier;
    *(_WORD *)(v5 + 96) |= 4u;
  }
LABEL_9:
  uint64_t v16 = [(NSString *)self->_themeColorLightMode copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSString *)self->_themeColorDarkMode copyWithZone:a3];
  v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  __int16 v20 = (__int16)self->_flags;
  if ((v20 & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_logoCenteredColorizedIdentifier;
    *(_WORD *)(v5 + 96) |= 2u;
    __int16 v20 = (__int16)self->_flags;
  }
  if ((v20 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_logoWithoutPaddingIdentifier;
    *(_WORD *)(v5 + 96) |= 0x10u;
  }
  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_14:

  return (id)v5;
}

- (NSString)language
{
  -[GEOLocalizedPublisherAttribution _readLanguage]((uint64_t)self);
  language = self->_language;

  return language;
}

- (void)_readLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguage_tags_195);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (GEOLocalizedPublisherAttribution)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedPublisherAttribution;
  v2 = [(GEOLocalizedPublisherAttribution *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSString)themeColorLightMode
{
  -[GEOLocalizedPublisherAttribution _readThemeColorLightMode]((uint64_t)self);
  themeColorLightMode = self->_themeColorLightMode;

  return themeColorLightMode;
}

- (NSString)themeColorDarkMode
{
  -[GEOLocalizedPublisherAttribution _readThemeColorDarkMode]((uint64_t)self);
  themeColorDarkMode = self->_themeColorDarkMode;

  return themeColorDarkMode;
}

- (NSString)subtitle
{
  -[GEOLocalizedPublisherAttribution _readSubtitle]((uint64_t)self);
  subtitle = self->_subtitle;

  return subtitle;
}

- (void)mergeFrom:(id)a3
{
  v7 = a3;
  [v7 readAll:0];
  v4 = v7;
  if (v7[4])
  {
    -[GEOLocalizedPublisherAttribution setLanguage:](self, "setLanguage:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[GEOLocalizedPublisherAttribution setDisplayName:](self, "setDisplayName:");
    v4 = v7;
  }
  if (v4[5])
  {
    -[GEOLocalizedPublisherAttribution setSubtitle:](self, "setSubtitle:");
    v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 48);
  if (v5)
  {
    self->_iconIdentifier = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v5 = *((_WORD *)v4 + 48);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_logoIdentifier = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_flags |= 8u;
  if ((v4[12] & 4) != 0)
  {
LABEL_10:
    self->_logoCenteredIdentifier = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_11:
  if (v4[7])
  {
    -[GEOLocalizedPublisherAttribution setThemeColorLightMode:](self, "setThemeColorLightMode:");
    v4 = v7;
  }
  if (v4[6])
  {
    -[GEOLocalizedPublisherAttribution setThemeColorDarkMode:](self, "setThemeColorDarkMode:");
    v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 48);
  if ((v6 & 2) != 0)
  {
    self->_logoCenteredColorizedIdentifier = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v6 = *((_WORD *)v4 + 48);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_logoWithoutPaddingIdentifier = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 0x10u;
  }
}

- (void)setSubtitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (void)setLanguage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_language, a3);
}

- (void)setDisplayName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_221;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_222;
    }
    GEOLocalizedPublisherAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (unsigned)logoWithoutPaddingIdentifier
{
  return self->_logoWithoutPaddingIdentifier;
}

- (unsigned)logoIdentifier
{
  return self->_logoIdentifier;
}

- (unsigned)logoCenteredIdentifier
{
  return self->_logoCenteredIdentifier;
}

- (unsigned)logoCenteredColorizedIdentifier
{
  return self->_logoCenteredColorizedIdentifier;
}

- (unsigned)iconIdentifier
{
  return self->_iconIdentifier;
}

- (NSString)displayName
{
  -[GEOLocalizedPublisherAttribution _readDisplayName]((uint64_t)self);
  displayName = self->_displayName;

  return displayName;
}

- (void)_readThemeColorLightMode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThemeColorLightMode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readThemeColorDarkMode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readThemeColorDarkMode_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readSubtitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubtitle_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_196);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColorLightMode, 0);
  objc_storeStrong((id *)&self->_themeColorDarkMode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOLocalizedPublisherAttribution)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedPublisherAttribution;
  id v3 = [(GEOLocalizedPublisherAttribution *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    __int16 v5 = v3;
  }

  return v4;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setIconIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_iconIdentifier = a3;
}

- (void)setHasIconIdentifier:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasIconIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setLogoIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_logoIdentifier = a3;
}

- (void)setHasLogoIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLogoIdentifier
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)setLogoCenteredIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_logoCenteredIdentifier = a3;
}

- (void)setHasLogoCenteredIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLogoCenteredIdentifier
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)hasThemeColorLightMode
{
  return self->_themeColorLightMode != 0;
}

- (void)setThemeColorLightMode:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_themeColorLightMode, a3);
}

- (BOOL)hasThemeColorDarkMode
{
  return self->_themeColorDarkMode != 0;
}

- (void)setThemeColorDarkMode:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_themeColorDarkMode, a3);
}

- (void)setLogoCenteredColorizedIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_logoCenteredColorizedIdentifier = a3;
}

- (void)setHasLogoCenteredColorizedIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLogoCenteredColorizedIdentifier
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)setLogoWithoutPaddingIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_logoWithoutPaddingIdentifier = a3;
}

- (void)setHasLogoWithoutPaddingIdentifier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLogoWithoutPaddingIdentifier
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocalizedPublisherAttribution;
  v4 = [(GEOLocalizedPublisherAttribution *)&v8 description];
  __int16 v5 = [(GEOLocalizedPublisherAttribution *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedPublisherAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_24;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = [(id)a1 language];
  if (v5) {
    [v4 setObject:v5 forKey:@"language"];
  }

  __int16 v6 = [(id)a1 displayName];
  if (v6) {
    [v4 setObject:v6 forKey:@"displayName"];
  }

  objc_super v7 = [(id)a1 subtitle];
  if (v7) {
    [v4 setObject:v7 forKey:@"subtitle"];
  }

  __int16 v8 = *(_WORD *)(a1 + 96);
  if ((v8 & 1) == 0)
  {
    if ((v8 & 8) == 0) {
      goto LABEL_10;
    }
LABEL_28:
    v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
    [v4 setObject:v23 forKey:@"logoIdentifier"];

    if ((*(_WORD *)(a1 + 96) & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v22 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
  [v4 setObject:v22 forKey:@"iconIdentifier"];

  __int16 v8 = *(_WORD *)(a1 + 96);
  if ((v8 & 8) != 0) {
    goto LABEL_28;
  }
LABEL_10:
  if ((v8 & 4) != 0)
  {
LABEL_11:
    uint64_t v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    [v4 setObject:v9 forKey:@"logoCenteredIdentifier"];
  }
LABEL_12:
  v10 = [(id)a1 themeColorLightMode];
  if (v10) {
    [v4 setObject:v10 forKey:@"themeColorLightMode"];
  }

  uint64_t v11 = [(id)a1 themeColorDarkMode];
  if (v11) {
    [v4 setObject:v11 forKey:@"themeColorDarkMode"];
  }

  __int16 v12 = *(_WORD *)(a1 + 96);
  if ((v12 & 2) != 0)
  {
    uint64_t v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 80)];
    [v4 setObject:v13 forKey:@"logoCenteredColorizedIdentifier"];

    __int16 v12 = *(_WORD *)(a1 + 96);
  }
  if ((v12 & 0x10) != 0)
  {
    v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v14 forKey:@"logoWithoutPaddingIdentifier"];
  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    uint64_t v16 = [v15 dictionaryRepresentation];
    v17 = v16;
    if (a2)
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __62__GEOLocalizedPublisherAttribution__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E53D8860;
      id v19 = v18;
      id v25 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v24];
      id v20 = v19;

      v17 = v20;
    }
    [v4 setObject:v17 forKey:@"Unknown Fields"];
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalizedPublisherAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOLocalizedPublisherAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    __int16 v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    __int16 v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLocalizedPublisherAttribution)initWithDictionary:(id)a3
{
  return (GEOLocalizedPublisherAttribution *)-[GEOLocalizedPublisherAttribution _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"language"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setLanguage:v5];
      }
      __int16 v6 = [v3 objectForKeyedSubscript:@"displayName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setDisplayName:v7];
      }
      __int16 v8 = [v3 objectForKeyedSubscript:@"subtitle"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (void *)[v8 copy];
        [a1 setSubtitle:v9];
      }
      id v10 = [v3 objectForKeyedSubscript:@"iconIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIconIdentifier:", objc_msgSend(v10, "unsignedIntValue"));
      }

      uint64_t v11 = [v3 objectForKeyedSubscript:@"logoIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLogoIdentifier:", objc_msgSend(v11, "unsignedIntValue"));
      }

      __int16 v12 = [v3 objectForKeyedSubscript:@"logoCenteredIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLogoCenteredIdentifier:", objc_msgSend(v12, "unsignedIntValue"));
      }

      uint64_t v13 = [v3 objectForKeyedSubscript:@"themeColorLightMode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setThemeColorLightMode:v14];
      }
      v15 = [v3 objectForKeyedSubscript:@"themeColorDarkMode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = (void *)[v15 copy];
        [a1 setThemeColorDarkMode:v16];
      }
      v17 = [v3 objectForKeyedSubscript:@"logoCenteredColorizedIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLogoCenteredColorizedIdentifier:", objc_msgSend(v17, "unsignedIntValue"));
      }

      uint64_t v18 = [v3 objectForKeyedSubscript:@"logoWithoutPaddingIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLogoWithoutPaddingIdentifier:", objc_msgSend(v18, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOLocalizedPublisherAttribution)initWithJSON:(id)a3
{
  return (GEOLocalizedPublisherAttribution *)-[GEOLocalizedPublisherAttribution _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizedPublisherAttributionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizedPublisherAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xFC0) == 0)
    {
      __int16 v8 = self->_reader;
      objc_sync_enter(v8);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v10 writeData:v9];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_26;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLocalizedPublisherAttribution *)self readAll:0];
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  id v5 = v10;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    PBDataWriterWriteUint32Field();
    id v5 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  id v5 = v10;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    id v5 = v10;
  }
LABEL_13:
  if (self->_themeColorLightMode)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  if (self->_themeColorDarkMode)
  {
    PBDataWriterWriteStringField();
    id v5 = v10;
  }
  __int16 v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v5 = v10;
    __int16 v7 = (__int16)self->_flags;
  }
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v5 = v10;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_26:
}

- (void)copyTo:(id)a3
{
  __int16 v7 = (id *)a3;
  [(GEOLocalizedPublisherAttribution *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 16) = self->_readerMarkPos;
  *((_DWORD *)v7 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_language) {
    objc_msgSend(v7, "setLanguage:");
  }
  if (self->_displayName) {
    objc_msgSend(v7, "setDisplayName:");
  }
  v4 = v7;
  if (self->_subtitle)
  {
    objc_msgSend(v7, "setSubtitle:");
    v4 = v7;
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *((_DWORD *)v4 + 19) = self->_iconIdentifier;
    *((_WORD *)v4 + 48) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 22) = self->_logoIdentifier;
  *((_WORD *)v4 + 48) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 21) = self->_logoCenteredIdentifier;
    *((_WORD *)v4 + 48) |= 4u;
  }
LABEL_11:
  if (self->_themeColorLightMode)
  {
    objc_msgSend(v7, "setThemeColorLightMode:");
    v4 = v7;
  }
  if (self->_themeColorDarkMode)
  {
    objc_msgSend(v7, "setThemeColorDarkMode:");
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_logoCenteredColorizedIdentifier;
    *((_WORD *)v4 + 48) |= 2u;
    __int16 v6 = (__int16)self->_flags;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_logoWithoutPaddingIdentifier;
    *((_WORD *)v4 + 48) |= 0x10u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  [(GEOLocalizedPublisherAttribution *)self readAll:1];
  [v4 readAll:1];
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_36;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_36;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_36;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 48);
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_iconIdentifier != *((_DWORD *)v4 + 19)) {
      goto LABEL_36;
    }
  }
  else if (v9)
  {
LABEL_36:
    BOOL v14 = 0;
    goto LABEL_37;
  }
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_logoIdentifier != *((_DWORD *)v4 + 22)) {
      goto LABEL_36;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_logoCenteredIdentifier != *((_DWORD *)v4 + 21)) {
      goto LABEL_36;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_36;
  }
  themeColorLightMode = self->_themeColorLightMode;
  if ((unint64_t)themeColorLightMode | *((void *)v4 + 7)
    && !-[NSString isEqual:](themeColorLightMode, "isEqual:"))
  {
    goto LABEL_36;
  }
  themeColorDarkMode = self->_themeColorDarkMode;
  if ((unint64_t)themeColorDarkMode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](themeColorDarkMode, "isEqual:")) {
      goto LABEL_36;
    }
  }
  __int16 v12 = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 48);
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_logoCenteredColorizedIdentifier != *((_DWORD *)v4 + 20)) {
      goto LABEL_36;
    }
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_36;
  }
  BOOL v14 = (v13 & 0x10) == 0;
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_logoWithoutPaddingIdentifier != *((_DWORD *)v4 + 23)) {
      goto LABEL_36;
    }
    BOOL v14 = 1;
  }
LABEL_37:

  return v14;
}

- (unint64_t)hash
{
  [(GEOLocalizedPublisherAttribution *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_displayName hash];
  NSUInteger v5 = [(NSString *)self->_subtitle hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    uint64_t v7 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v7 = 2654435761 * self->_iconIdentifier;
  if ((flags & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_logoIdentifier;
  if ((flags & 4) != 0)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_logoCenteredIdentifier;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v9 = 0;
LABEL_8:
  NSUInteger v10 = [(NSString *)self->_themeColorLightMode hash];
  NSUInteger v11 = [(NSString *)self->_themeColorDarkMode hash];
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 2) != 0)
  {
    uint64_t v13 = 2654435761 * self->_logoCenteredColorizedIdentifier;
    if ((v12 & 0x10) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((v12 & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v14 = 2654435761 * self->_logoWithoutPaddingIdentifier;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOLocalizedPublisherAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_226);
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
  *(_WORD *)&self->_flags |= 0x820u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLocalizedPublisherAttribution *)self readAll:0];
  }
}

@end