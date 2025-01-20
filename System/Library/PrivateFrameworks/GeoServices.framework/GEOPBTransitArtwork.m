@interface GEOPBTransitArtwork
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAccessibilityString;
- (BOOL)hasArtworkType;
- (BOOL)hasArtworkUse;
- (BOOL)hasBadge;
- (BOOL)hasIcon;
- (BOOL)hasIconFallbackShield;
- (BOOL)hasRoutingIncidentBadge;
- (BOOL)hasSfSymbol;
- (BOOL)hasShield;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitArtwork)init;
- (GEOPBTransitArtwork)initWithData:(id)a3;
- (GEOPBTransitArtwork)initWithDictionary:(id)a3;
- (GEOPBTransitArtwork)initWithJSON:(id)a3;
- (GEOPBTransitIcon)icon;
- (GEOPBTransitShield)iconFallbackShield;
- (GEOPBTransitShield)shield;
- (GEOSFSymbol)sfSymbol;
- (GEOTransitTextDataSource)textDataSource;
- (NSString)accessibilityString;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)artworkTypeAsString:(int)a3;
- (id)artworkUseAsString:(int)a3;
- (id)badgeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsArtworkType:(id)a3;
- (int)StringAsArtworkUse:(id)a3;
- (int)StringAsBadge:(id)a3;
- (int)artworkSourceType;
- (int)artworkType;
- (int)artworkUse;
- (int)artworkUseType;
- (int)badge;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAccessibilityString;
- (void)_readIcon;
- (void)_readIconFallbackShield;
- (void)_readSfSymbol;
- (void)_readShield;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAccessibilityString:(id)a3;
- (void)setArtworkType:(int)a3;
- (void)setArtworkUse:(int)a3;
- (void)setBadge:(int)a3;
- (void)setHasArtworkType:(BOOL)a3;
- (void)setHasArtworkUse:(BOOL)a3;
- (void)setHasBadge:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconFallbackShield:(id)a3;
- (void)setSfSymbol:(id)a3;
- (void)setShield:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitArtwork

- (GEOPBTransitArtwork)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitArtwork;
  v2 = [(GEOPBTransitArtwork *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitArtwork)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitArtwork;
  v3 = [(GEOPBTransitArtwork *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)artworkType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_artworkType;
  }
  else {
    return 0;
  }
}

- (void)setArtworkType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_artworkType = a3;
}

- (void)setHasArtworkType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasArtworkType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)artworkTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E0398[a3];
  }

  return v3;
}

- (int)StringAsArtworkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ARTWORK_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARTWORK_TYPE_SHIELD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ARTWORK_TYPE_ICON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARTWORK_TYPE_SF_SYMBOL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)artworkUse
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_artworkUse;
  }
  else {
    return 0;
  }
}

- (void)setArtworkUse:(int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_artworkUse = a3;
}

- (void)setHasArtworkUse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasArtworkUse
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)artworkUseAsString:(int)a3
{
  if a3 < 0xD && ((0x1EFBu >> a3))
  {
    __int16 v3 = off_1E53E03B8[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsArtworkUse:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ARTWORK_USE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_LINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_SYSTEM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_TRIP"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_ACCESS_POINT"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_STATION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_MANEUVER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_HALL"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_STATION_LINE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ARTWORK_USE_VEHICLE_POSITION"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readShield
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShield_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasShield
{
  return self->_shield != 0;
}

- (GEOPBTransitShield)shield
{
  -[GEOPBTransitArtwork _readShield]((uint64_t)self);
  shield = self->_shield;

  return shield;
}

- (void)setShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_shield, a3);
}

- (void)_readIcon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcon_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (GEOPBTransitIcon)icon
{
  -[GEOPBTransitArtwork _readIcon]((uint64_t)self);
  icon = self->_icon;

  return icon;
}

- (void)setIcon:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void)_readIconFallbackShield
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconFallbackShield_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasIconFallbackShield
{
  return self->_iconFallbackShield != 0;
}

- (GEOPBTransitShield)iconFallbackShield
{
  -[GEOPBTransitArtwork _readIconFallbackShield]((uint64_t)self);
  iconFallbackShield = self->_iconFallbackShield;

  return iconFallbackShield;
}

- (void)setIconFallbackShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_iconFallbackShield, a3);
}

- (int)badge
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_badge;
  }
  else {
    return 0;
  }
}

- (void)setBadge:(int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_badge = a3;
}

- (void)setHasBadge:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasBadge
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)badgeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ARTWORK_BADGE_WARNING";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"ARTWORK_BADGE_UNKNOWN";
  }
  return v4;
}

- (int)StringAsBadge:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ARTWORK_BADGE_UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ARTWORK_BADGE_WARNING"];
  }

  return v4;
}

- (void)_readAccessibilityString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAccessibilityString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAccessibilityString
{
  return self->_accessibilityString != 0;
}

- (NSString)accessibilityString
{
  -[GEOPBTransitArtwork _readAccessibilityString]((uint64_t)self);
  accessibilityString = self->_accessibilityString;

  return accessibilityString;
}

- (void)setAccessibilityString:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_accessibilityString, a3);
}

- (void)_readSfSymbol
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitArtworkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSfSymbol_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSfSymbol
{
  return self->_sfSymbol != 0;
}

- (GEOSFSymbol)sfSymbol
{
  -[GEOPBTransitArtwork _readSfSymbol]((uint64_t)self);
  sfSymbol = self->_sfSymbol;

  return sfSymbol;
}

- (void)setSfSymbol:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_sfSymbol, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitArtwork;
  int v4 = [(GEOPBTransitArtwork *)&v8 description];
  v5 = [(GEOPBTransitArtwork *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitArtwork _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v5 = *(_WORD *)(a1 + 88);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 76);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E0398[v6];
      }
      if (a2) {
        objc_super v8 = @"artworkType";
      }
      else {
        objc_super v8 = @"artwork_type";
      }
      [v4 setObject:v7 forKey:v8];

      __int16 v5 = *(_WORD *)(a1 + 88);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 80);
      if v9 < 0xD && ((0x1EFBu >> v9))
      {
        v10 = off_1E53E03B8[v9];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v11 = @"artworkUse";
      }
      else {
        v11 = @"artwork_use";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 shield];
    v13 = v12;
    if (v12)
    {
      if (a2) {
        [v12 jsonRepresentation];
      }
      else {
      v14 = [v12 dictionaryRepresentation];
      }
      [v4 setObject:v14 forKey:@"shield"];
    }
    v15 = [(id)a1 icon];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"icon"];
    }
    v18 = [(id)a1 iconFallbackShield];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"iconFallbackShield";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"icon_fallback_shield";
      }
      [v4 setObject:v20 forKey:v21];
    }
    if ((*(_WORD *)(a1 + 88) & 4) != 0)
    {
      int v22 = *(_DWORD *)(a1 + 84);
      if (v22)
      {
        if (v22 == 1)
        {
          v23 = @"ARTWORK_BADGE_WARNING";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 84));
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v23 = @"ARTWORK_BADGE_UNKNOWN";
      }
      [v4 setObject:v23 forKey:@"badge"];
    }
    v24 = [(id)a1 accessibilityString];
    if (v24)
    {
      if (a2) {
        v25 = @"accessibilityString";
      }
      else {
        v25 = @"accessibility_string";
      }
      [v4 setObject:v24 forKey:v25];
    }

    v26 = [(id)a1 sfSymbol];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"sfSymbol";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"sf_symbol";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = *(void **)(a1 + 16);
    if (v30)
    {
      v31 = [v30 dictionaryRepresentation];
      v32 = v31;
      if (a2)
      {
        v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __49__GEOPBTransitArtwork__dictionaryRepresentation___block_invoke;
        v37[3] = &unk_1E53D8860;
        id v34 = v33;
        id v38 = v34;
        [v32 enumerateKeysAndObjectsUsingBlock:v37];
        id v35 = v34;

        v32 = v35;
      }
      [v4 setObject:v32 forKey:@"Unknown Fields"];
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
  return -[GEOPBTransitArtwork _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPBTransitArtwork__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOPBTransitArtwork)initWithDictionary:(id)a3
{
  return (GEOPBTransitArtwork *)-[GEOPBTransitArtwork _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_91;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_91;
  }
  if (a3) {
    uint64_t v6 = @"artworkType";
  }
  else {
    uint64_t v6 = @"artwork_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"ARTWORK_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ARTWORK_TYPE_SHIELD"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"ARTWORK_TYPE_ICON"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"ARTWORK_TYPE_SF_SYMBOL"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setArtworkType:v9];
LABEL_20:

  if (a3) {
    id v10 = @"artworkUse";
  }
  else {
    id v10 = @"artwork_use";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"ARTWORK_USE_UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_LINE"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_MODE"])
    {
      uint64_t v13 = 3;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_SYSTEM"])
    {
      uint64_t v13 = 4;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_TRIP"])
    {
      uint64_t v13 = 5;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_ACCESS_POINT"])
    {
      uint64_t v13 = 6;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_STATION"])
    {
      uint64_t v13 = 7;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_MANEUVER"])
    {
      uint64_t v13 = 9;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_HALL"])
    {
      uint64_t v13 = 10;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_STATION_LINE"])
    {
      uint64_t v13 = 11;
    }
    else if ([v12 isEqualToString:@"ARTWORK_USE_VEHICLE_POSITION"])
    {
      uint64_t v13 = 12;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_51;
    }
    uint64_t v13 = [v11 intValue];
  }
  [a1 setArtworkUse:v13];
LABEL_51:

  v14 = [v5 objectForKeyedSubscript:@"shield"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOPBTransitShield alloc];
    if (a3) {
      uint64_t v16 = [(GEOPBTransitShield *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOPBTransitShield *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setShield:v16];
  }
  v18 = [v5 objectForKeyedSubscript:@"icon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = [GEOPBTransitIcon alloc];
    if (a3) {
      uint64_t v20 = [(GEOPBTransitIcon *)v19 initWithJSON:v18];
    }
    else {
      uint64_t v20 = [(GEOPBTransitIcon *)v19 initWithDictionary:v18];
    }
    v21 = (void *)v20;
    [a1 setIcon:v20];
  }
  if (a3) {
    int v22 = @"iconFallbackShield";
  }
  else {
    int v22 = @"icon_fallback_shield";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = [GEOPBTransitShield alloc];
    if (a3) {
      uint64_t v25 = [(GEOPBTransitShield *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOPBTransitShield *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [a1 setIconFallbackShield:v25];
  }
  v27 = [v5 objectForKeyedSubscript:@"badge"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"ARTWORK_BADGE_UNKNOWN"]) {
      uint64_t v29 = 0;
    }
    else {
      uint64_t v29 = [v28 isEqualToString:@"ARTWORK_BADGE_WARNING"];
    }

    goto LABEL_76;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v29 = [v27 intValue];
LABEL_76:
    [a1 setBadge:v29];
  }

  if (a3) {
    v30 = @"accessibilityString";
  }
  else {
    v30 = @"accessibility_string";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = (void *)[v31 copy];
    [a1 setAccessibilityString:v32];
  }
  if (a3) {
    v33 = @"sfSymbol";
  }
  else {
    v33 = @"sf_symbol";
  }
  id v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = [GEOSFSymbol alloc];
    if (a3) {
      uint64_t v36 = [(GEOSFSymbol *)v35 initWithJSON:v34];
    }
    else {
      uint64_t v36 = [(GEOSFSymbol *)v35 initWithDictionary:v34];
    }
    v37 = (void *)v36;
    [a1 setSfSymbol:v36];
  }
LABEL_91:

  return a1;
}

- (GEOPBTransitArtwork)initWithJSON:(id)a3
{
  return (GEOPBTransitArtwork *)-[GEOPBTransitArtwork _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_4264;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_4265;
    }
    GEOPBTransitArtworkReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitArtworkCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitArtworkIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitArtworkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitArtworkIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBTransitArtwork *)self readAll:0];
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    id v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_shield)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_icon)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if (self->_iconFallbackShield)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v9;
    }
    if (self->_accessibilityString)
    {
      PBDataWriterWriteStringField();
      id v6 = v9;
    }
    if (self->_sfSymbol)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v6 = (id *)a3;
  [(GEOPBTransitArtwork *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 16) = self->_readerMarkPos;
  *((_DWORD *)v6 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v6;
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 19) = self->_artworkType;
    *((_WORD *)v6 + 44) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 20) = self->_artworkUse;
    *((_WORD *)v6 + 44) |= 2u;
  }
  if (self->_shield)
  {
    objc_msgSend(v6, "setShield:");
    int v4 = v6;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    int v4 = v6;
  }
  if (self->_iconFallbackShield)
  {
    objc_msgSend(v6, "setIconFallbackShield:");
    int v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_badge;
    *((_WORD *)v4 + 44) |= 4u;
  }
  if (self->_accessibilityString)
  {
    objc_msgSend(v6, "setAccessibilityString:");
    int v4 = v6;
  }
  if (self->_sfSymbol)
  {
    objc_msgSend(v6, "setSfSymbol:");
    int v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitArtworkReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitArtwork *)self readAll:0];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_artworkType;
    *(_WORD *)(v5 + 88) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_artworkUse;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  id v10 = [(GEOPBTransitShield *)self->_shield copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  id v12 = [(GEOPBTransitIcon *)self->_icon copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(GEOPBTransitShield *)self->_iconFallbackShield copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_badge;
    *(_WORD *)(v5 + 88) |= 4u;
  }
  uint64_t v16 = [(NSString *)self->_accessibilityString copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  id v18 = [(GEOSFSymbol *)self->_sfSymbol copyWithZone:a3];
  v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  uint64_t v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOPBTransitArtwork *)self readAll:1];
  [v4 readAll:1];
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 44);
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_artworkType != *((_DWORD *)v4 + 19)) {
      goto LABEL_27;
    }
  }
  else if (v6)
  {
LABEL_27:
    char v13 = 0;
    goto LABEL_28;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_artworkUse != *((_DWORD *)v4 + 20)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_27;
  }
  shield = self->_shield;
  if ((unint64_t)shield | *((void *)v4 + 7) && !-[GEOPBTransitShield isEqual:](shield, "isEqual:")) {
    goto LABEL_27;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 5))
  {
    if (!-[GEOPBTransitIcon isEqual:](icon, "isEqual:")) {
      goto LABEL_27;
    }
  }
  iconFallbackShield = self->_iconFallbackShield;
  if ((unint64_t)iconFallbackShield | *((void *)v4 + 4))
  {
    if (!-[GEOPBTransitShield isEqual:](iconFallbackShield, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_badge != *((_DWORD *)v4 + 21)) {
      goto LABEL_27;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_27;
  }
  accessibilityString = self->_accessibilityString;
  if ((unint64_t)accessibilityString | *((void *)v4 + 3)
    && !-[NSString isEqual:](accessibilityString, "isEqual:"))
  {
    goto LABEL_27;
  }
  sfSymbol = self->_sfSymbol;
  if ((unint64_t)sfSymbol | *((void *)v4 + 6)) {
    char v13 = -[GEOSFSymbol isEqual:](sfSymbol, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  [(GEOPBTransitArtwork *)self readAll:1];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v4 = 2654435761 * self->_artworkType;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_artworkUse;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  unint64_t v6 = [(GEOPBTransitShield *)self->_shield hash];
  unint64_t v7 = [(GEOPBTransitIcon *)self->_icon hash];
  unint64_t v8 = [(GEOPBTransitShield *)self->_iconFallbackShield hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v9 = 2654435761 * self->_badge;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_accessibilityString hash];
  return v10 ^ [(GEOSFSymbol *)self->_sfSymbol hash];
}

- (void)mergeFrom:(id)a3
{
  id v14 = (int *)a3;
  [v14 readAll:0];
  uint64_t v4 = v14;
  __int16 v5 = *((_WORD *)v14 + 44);
  if (v5)
  {
    self->_artworkType = v14[19];
    *(_WORD *)&self->_flags |= 1u;
    __int16 v5 = *((_WORD *)v14 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_artworkUse = v14[20];
    *(_WORD *)&self->_flags |= 2u;
  }
  shield = self->_shield;
  uint64_t v7 = *((void *)v14 + 7);
  if (shield)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPBTransitShield mergeFrom:](shield, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOPBTransitArtwork setShield:](self, "setShield:");
  }
  uint64_t v4 = v14;
LABEL_11:
  icon = self->_icon;
  uint64_t v9 = *((void *)v4 + 5);
  if (icon)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOPBTransitIcon mergeFrom:](icon, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOPBTransitArtwork setIcon:](self, "setIcon:");
  }
  uint64_t v4 = v14;
LABEL_17:
  iconFallbackShield = self->_iconFallbackShield;
  uint64_t v11 = *((void *)v4 + 4);
  if (iconFallbackShield)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOPBTransitShield mergeFrom:](iconFallbackShield, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOPBTransitArtwork setIconFallbackShield:](self, "setIconFallbackShield:");
  }
  uint64_t v4 = v14;
LABEL_23:
  if ((v4[22] & 4) != 0)
  {
    self->_badge = v4[21];
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((void *)v4 + 3))
  {
    -[GEOPBTransitArtwork setAccessibilityString:](self, "setAccessibilityString:");
    uint64_t v4 = v14;
  }
  sfSymbol = self->_sfSymbol;
  uint64_t v13 = *((void *)v4 + 6);
  if (sfSymbol)
  {
    if (!v13) {
      goto LABEL_33;
    }
    -[GEOSFSymbol mergeFrom:](sfSymbol, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_33;
    }
    -[GEOPBTransitArtwork setSfSymbol:](self, "setSfSymbol:");
  }
  uint64_t v4 = v14;
LABEL_33:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitArtworkReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4269);
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
  *(_WORD *)&self->_flags |= 0x208u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitArtwork *)self readAll:0];
    [(GEOPBTransitShield *)self->_shield clearUnknownFields:1];
    [(GEOPBTransitIcon *)self->_icon clearUnknownFields:1];
    [(GEOPBTransitShield *)self->_iconFallbackShield clearUnknownFields:1];
    sfSymbol = self->_sfSymbol;
    [(GEOSFSymbol *)sfSymbol clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_sfSymbol, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconFallbackShield, 0);
  objc_storeStrong((id *)&self->_accessibilityString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (int)artworkSourceType
{
  int v2 = [(GEOPBTransitArtwork *)self artworkType];
  if (v2 > 3) {
    return 1;
  }
  else {
    return dword_18A63E8D0[v2];
  }
}

- (int)artworkUseType
{
  int v2 = [(GEOPBTransitArtwork *)self artworkUse] - 1;
  if (v2 > 0xB) {
    return 0;
  }
  else {
    return dword_18A63E810[v2];
  }
}

- (BOOL)hasRoutingIncidentBadge
{
  BOOL v3 = [(GEOPBTransitArtwork *)self hasBadge];
  if (v3) {
    LOBYTE(v3) = [(GEOPBTransitArtwork *)self badge] == 1;
  }
  return v3;
}

- (GEOTransitTextDataSource)textDataSource
{
  return 0;
}

@end