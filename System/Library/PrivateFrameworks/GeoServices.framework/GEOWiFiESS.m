@interface GEOWiFiESS
+ (BOOL)isValid:(id)a3;
+ (Class)bssType;
+ (Class)ownerIdentifierType;
+ (Class)qualitiesType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasName;
- (BOOL)hasNetworkType;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasVenueGroup;
- (BOOL)hasVenueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiESS)init;
- (GEOWiFiESS)initWithData:(id)a3;
- (GEOWiFiESS)initWithDictionary:(id)a3;
- (GEOWiFiESS)initWithJSON:(id)a3;
- (NSMutableArray)bss;
- (NSMutableArray)ownerIdentifiers;
- (NSMutableArray)qualities;
- (NSString)identifier;
- (NSString)name;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributesAsString:(int)a3;
- (id)authTraitsAsString:(int)a3;
- (id)bssAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)networkTypeAsString:(int)a3;
- (id)ownerIdentifierAtIndex:(unint64_t)a3;
- (id)qualitiesAtIndex:(unint64_t)a3;
- (id)venueGroupAsString:(int)a3;
- (int)StringAsAttributes:(id)a3;
- (int)StringAsAuthTraits:(id)a3;
- (int)StringAsNetworkType:(id)a3;
- (int)StringAsVenueGroup:(id)a3;
- (int)attributes;
- (int)attributesAtIndex:(unint64_t)a3;
- (int)authTraits;
- (int)authTraitsAtIndex:(unint64_t)a3;
- (int)networkType;
- (int)venueGroup;
- (int64_t)uniqueIdentifier;
- (unint64_t)attributesCount;
- (unint64_t)authTraitsCount;
- (unint64_t)bssCount;
- (unint64_t)hash;
- (unint64_t)ownerIdentifiersCount;
- (unint64_t)qualitiesCount;
- (unsigned)venueType;
- (void)_addNoFlagsBss:(uint64_t)a1;
- (void)_addNoFlagsOwnerIdentifier:(uint64_t)a1;
- (void)_addNoFlagsQualities:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAttributes;
- (void)_readAuthTraits;
- (void)_readBss;
- (void)_readIdentifier;
- (void)_readName;
- (void)_readOwnerIdentifiers;
- (void)_readQualities;
- (void)addAttributes:(int)a3;
- (void)addAuthTraits:(int)a3;
- (void)addBss:(id)a3;
- (void)addOwnerIdentifier:(id)a3;
- (void)addQualities:(id)a3;
- (void)clearAttributes;
- (void)clearAuthTraits;
- (void)clearBss;
- (void)clearOwnerIdentifiers;
- (void)clearQualities;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributes:(int *)a3 count:(unint64_t)a4;
- (void)setAuthTraits:(int *)a3 count:(unint64_t)a4;
- (void)setBss:(id)a3;
- (void)setHasNetworkType:(BOOL)a3;
- (void)setHasUniqueIdentifier:(BOOL)a3;
- (void)setHasVenueGroup:(BOOL)a3;
- (void)setHasVenueType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setNetworkType:(int)a3;
- (void)setOwnerIdentifiers:(id)a3;
- (void)setQualities:(id)a3;
- (void)setUniqueIdentifier:(int64_t)a3;
- (void)setVenueGroup:(int)a3;
- (void)setVenueType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiESS

- (GEOWiFiESS)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiESS;
  v2 = [(GEOWiFiESS *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiESS)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiESS;
  v3 = [(GEOWiFiESS *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOWiFiESS;
  [(GEOWiFiESS *)&v3 dealloc];
}

- (void)_readIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_145);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOWiFiESS _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readBss
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBss_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)bss
{
  -[GEOWiFiESS _readBss]((uint64_t)self);
  bss = self->_bss;

  return bss;
}

- (void)setBss:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  bss = self->_bss;
  self->_bss = v4;
}

- (void)clearBss
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  bss = self->_bss;

  [(NSMutableArray *)bss removeAllObjects];
}

- (void)addBss:(id)a3
{
  id v4 = a3;
  -[GEOWiFiESS _readBss]((uint64_t)self);
  -[GEOWiFiESS _addNoFlagsBss:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsBss:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)bssCount
{
  -[GEOWiFiESS _readBss]((uint64_t)self);
  bss = self->_bss;

  return [(NSMutableArray *)bss count];
}

- (id)bssAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readBss]((uint64_t)self);
  bss = self->_bss;

  return (id)[(NSMutableArray *)bss objectAtIndex:a3];
}

+ (Class)bssType
{
  return (Class)objc_opt_class();
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOWiFiESS _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readAuthTraits
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAuthTraits_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)authTraitsCount
{
  return self->_authTraits.count;
}

- (int)authTraits
{
  return self->_authTraits.list;
}

- (void)clearAuthTraits
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  PBRepeatedInt32Clear();
}

- (void)addAuthTraits:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)authTraitsAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readAuthTraits]((uint64_t)self);
  p_authTraits = &self->_authTraits;
  unint64_t count = self->_authTraits.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_authTraits->list[a3];
}

- (void)setAuthTraits:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  MEMORY[0x1F4147390](&self->_authTraits, a3, a4);
}

- (id)authTraitsAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E1E28[a3];
  }

  return v3;
}

- (int)StringAsAuthTraits:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AUTH_TRAIT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OPEN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WEP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WPA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EAP"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readQualities
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQualities_tags_147);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)qualities
{
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  qualities = self->_qualities;

  return qualities;
}

- (void)setQualities:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  qualities = self->_qualities;
  self->_qualities = v4;
}

- (void)clearQualities
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  qualities = self->_qualities;

  [(NSMutableArray *)qualities removeAllObjects];
}

- (void)addQualities:(id)a3
{
  id v4 = a3;
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  -[GEOWiFiESS _addNoFlagsQualities:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsQualities:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)qualitiesCount
{
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  qualities = self->_qualities;

  return [(NSMutableArray *)qualities count];
}

- (id)qualitiesAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readQualities]((uint64_t)self);
  qualities = self->_qualities;

  return (id)[(NSMutableArray *)qualities objectAtIndex:a3];
}

+ (Class)qualitiesType
{
  return (Class)objc_opt_class();
}

- (void)_readAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributes_tags_148);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)attributesCount
{
  return self->_attributes.count;
}

- (int)attributes
{
  return self->_attributes.list;
}

- (void)clearAttributes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  PBRepeatedInt32Clear();
}

- (void)addAttributes:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)attributesAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readAttributes]((uint64_t)self);
  p_attributes = &self->_attributes;
  unint64_t count = self->_attributes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_attributes->list[a3];
}

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;

  MEMORY[0x1F4147390](&self->_attributes, a3, a4);
}

- (id)attributesAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E1E50[a3];
  }

  return v3;
}

- (int)StringAsAttributes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ISCAPTIVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ISMOVING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ISPUBLIC"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ISSUSPICIOUS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ISLOWQUALITY"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasUniqueIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readOwnerIdentifiers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 136) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiESSReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOwnerIdentifiers_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)ownerIdentifiers
{
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  ownerIdentifiers = self->_ownerIdentifiers;

  return ownerIdentifiers;
}

- (void)setOwnerIdentifiers:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  ownerIdentifiers = self->_ownerIdentifiers;
  self->_ownerIdentifiers = v4;
}

- (void)clearOwnerIdentifiers
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  ownerIdentifiers = self->_ownerIdentifiers;

  [(NSMutableArray *)ownerIdentifiers removeAllObjects];
}

- (void)addOwnerIdentifier:(id)a3
{
  id v4 = a3;
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  -[GEOWiFiESS _addNoFlagsOwnerIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsOwnerIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      id v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)ownerIdentifiersCount
{
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  ownerIdentifiers = self->_ownerIdentifiers;

  return [(NSMutableArray *)ownerIdentifiers count];
}

- (id)ownerIdentifierAtIndex:(unint64_t)a3
{
  -[GEOWiFiESS _readOwnerIdentifiers]((uint64_t)self);
  ownerIdentifiers = self->_ownerIdentifiers;

  return (id)[(NSMutableArray *)ownerIdentifiers objectAtIndex:a3];
}

+ (Class)ownerIdentifierType
{
  return (Class)objc_opt_class();
}

- (int)networkType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_networkType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasNetworkType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E1E80[a3];
  }

  return v3;
}

- (int)StringAsNetworkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)venueGroup
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_venueGroup;
  }
  else {
    return 0;
  }
}

- (void)setVenueGroup:(int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_venueGroup = a3;
}

- (void)setHasVenueGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasVenueGroup
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)venueGroupAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E1F08[a3];
  }

  return v3;
}

- (int)StringAsVenueGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VENUE_GROUP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASSEMBLY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EDUCATIONAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FACTORY_AND_INDUSTRIAL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INSTITUTIONAL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MERCANTILE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESIDENTIAL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"STORAGE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"UTILITY_AND_MISC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"VEHICULAR"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"OUTDOOR"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)venueType
{
  return self->_venueType;
}

- (void)setVenueType:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_venueType = a3;
}

- (void)setHasVenueType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasVenueType
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiESS;
  int v4 = [(GEOWiFiESS *)&v8 description];
  id v5 = [(GEOWiFiESS *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiESS _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_63;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 identifier];
  if (v5) {
    [v4 setObject:v5 forKey:@"identifier"];
  }

  if ([*(id *)(a1 + 64) count])
  {
    objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (a2) {
            [v12 jsonRepresentation];
          }
          else {
          v13 = [v12 dictionaryRepresentation];
          }
          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"bss"];
  }
  v14 = [(id)a1 name];
  if (v14) {
    [v4 setObject:v14 forKey:@"name"];
  }

  if (*(void *)(a1 + 48))
  {
    v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v16 = (void *)(a1 + 40);
    if (*(void *)(a1 + 48))
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = *(int *)(*v16 + 4 * v17);
        if (v18 >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E53E1E28[v18];
        }
        [v15 addObject:v19];

        ++v17;
        v16 = (void *)(a1 + 40);
      }
      while (v17 < *(void *)(a1 + 48));
    }
    [v4 setObject:v15 forKey:@"authTraits"];
  }
  if ([*(id *)(a1 + 96) count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v21 = *(id *)(a1 + 96);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v43 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if (a2) {
            [v26 jsonRepresentation];
          }
          else {
          v27 = [v26 dictionaryRepresentation];
          }
          [v20 addObject:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v23);
    }

    [v4 setObject:v20 forKey:@"qualities"];
  }
  if (*(void *)(a1 + 24))
  {
    v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v29 = (void *)(a1 + 16);
    if (*(void *)(a1 + 24))
    {
      unint64_t v30 = 0;
      do
      {
        uint64_t v31 = *(int *)(*v29 + 4 * v30);
        if (v31 >= 6)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = off_1E53E1E50[v31];
        }
        [v28 addObject:v32];

        ++v30;
        v29 = (void *)(a1 + 16);
      }
      while (v30 < *(void *)(a1 + 24));
    }
    [v4 setObject:v28 forKey:@"attributes"];
  }
  if (*(_WORD *)(a1 + 136))
  {
    v33 = [NSNumber numberWithLongLong:*(void *)(a1 + 104)];
    [v4 setObject:v33 forKey:@"uniqueIdentifier"];
  }
  if (*(void *)(a1 + 88))
  {
    v34 = [(id)a1 ownerIdentifiers];
    [v4 setObject:v34 forKey:@"ownerIdentifier"];
  }
  __int16 v35 = *(_WORD *)(a1 + 136);
  if ((v35 & 2) == 0)
  {
    if ((v35 & 4) == 0) {
      goto LABEL_52;
    }
LABEL_58:
    uint64_t v38 = *(int *)(a1 + 128);
    if (v38 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 128));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E53E1F08[v38];
    }
    [v4 setObject:v39 forKey:@"venueGroup"];

    if ((*(_WORD *)(a1 + 136) & 8) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  uint64_t v36 = *(int *)(a1 + 124);
  if (v36 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 124));
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = off_1E53E1E80[v36];
  }
  [v4 setObject:v37 forKey:@"networkType"];

  __int16 v35 = *(_WORD *)(a1 + 136);
  if ((v35 & 4) != 0) {
    goto LABEL_58;
  }
LABEL_52:
  if ((v35 & 8) != 0)
  {
LABEL_62:
    v40 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
    [v4 setObject:v40 forKey:@"venueType"];
  }
LABEL_63:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiESS _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiESS)initWithDictionary:(id)a3
{
  return (GEOWiFiESS *)-[GEOWiFiESS _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    objc_super v6 = 0;
    goto LABEL_174;
  }
  objc_super v6 = (void *)[a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = (void *)[v7 copy];
      [v6 setIdentifier:v8];
    }
    uint64_t v9 = [v5 objectForKeyedSubscript:@"bss"];
    objc_opt_class();
    id v67 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v66 = v9;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v92 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v85;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v85 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v84 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [GEOWiFiBSS alloc];
              if (a3) {
                uint64_t v17 = [(GEOWiFiBSS *)v16 initWithJSON:v15];
              }
              else {
                uint64_t v17 = [(GEOWiFiBSS *)v16 initWithDictionary:v15];
              }
              uint64_t v18 = (void *)v17;
              objc_msgSend(v6, "addBss:", v17, v66);
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v84 objects:v92 count:16];
        }
        while (v12);
      }

      uint64_t v9 = v66;
    }

    v19 = [v5 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = (void *)[v19 copy];
      [v6 setName:v20];
    }
    id v21 = [v5 objectForKeyedSubscript:@"authTraits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v66 = v21;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v91 count:16];
      if (!v23) {
        goto LABEL_45;
      }
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v81;
      while (1)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v81 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v80 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = v27;
            if ([v28 isEqualToString:@"UNKNOWN_AUTH_TRAIT"])
            {
              uint64_t v29 = 0;
            }
            else if ([v28 isEqualToString:@"OPEN"])
            {
              uint64_t v29 = 1;
            }
            else if ([v28 isEqualToString:@"WEP"])
            {
              uint64_t v29 = 2;
            }
            else if ([v28 isEqualToString:@"WPA"])
            {
              uint64_t v29 = 3;
            }
            else if ([v28 isEqualToString:@"EAP"])
            {
              uint64_t v29 = 4;
            }
            else
            {
              uint64_t v29 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            uint64_t v29 = [v27 intValue];
          }
          objc_msgSend(v6, "addAuthTraits:", v29, v66);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v80 objects:v91 count:16];
        if (!v24)
        {
LABEL_45:

          id v21 = v66;
          id v5 = v67;
          break;
        }
      }
    }

    unint64_t v30 = [v5 objectForKeyedSubscript:@"qualities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      v66 = v30;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v90 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v77;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v77 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v76 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v37 = [GEOWiFiQualityProfile alloc];
              if (a3) {
                uint64_t v38 = [(GEOWiFiQualityProfile *)v37 initWithJSON:v36];
              }
              else {
                uint64_t v38 = [(GEOWiFiQualityProfile *)v37 initWithDictionary:v36];
              }
              v39 = (void *)v38;
              objc_msgSend(v6, "addQualities:", v38, v66);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v76 objects:v90 count:16];
        }
        while (v33);
      }

      unint64_t v30 = v66;
      id v5 = v67;
    }

    v40 = [v5 objectForKeyedSubscript:@"attributes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v66 = v40;
      id v41 = v40;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v89 count:16];
      if (!v42) {
        goto LABEL_86;
      }
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v73;
      while (1)
      {
        for (uint64_t m = 0; m != v43; ++m)
        {
          if (*(void *)v73 != v44) {
            objc_enumerationMutation(v41);
          }
          long long v46 = *(void **)(*((void *)&v72 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v47 = v46;
            if ([v47 isEqualToString:@"UNKNOWN"])
            {
              uint64_t v48 = 0;
            }
            else if ([v47 isEqualToString:@"ISCAPTIVE"])
            {
              uint64_t v48 = 1;
            }
            else if ([v47 isEqualToString:@"ISMOVING"])
            {
              uint64_t v48 = 2;
            }
            else if ([v47 isEqualToString:@"ISPUBLIC"])
            {
              uint64_t v48 = 3;
            }
            else if ([v47 isEqualToString:@"ISSUSPICIOUS"])
            {
              uint64_t v48 = 4;
            }
            else if ([v47 isEqualToString:@"ISLOWQUALITY"])
            {
              uint64_t v48 = 5;
            }
            else
            {
              uint64_t v48 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            uint64_t v48 = [v46 intValue];
          }
          objc_msgSend(v6, "addAttributes:", v48, v66);
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v72 objects:v89 count:16];
        if (!v43)
        {
LABEL_86:

          v40 = v66;
          id v5 = v67;
          break;
        }
      }
    }

    long long v49 = [v5 objectForKeyedSubscript:@"uniqueIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setUniqueIdentifier:", objc_msgSend(v49, "longLongValue"));
    }

    v50 = [v5 objectForKeyedSubscript:@"ownerIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v51 = v50;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v68 objects:v88 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v69;
        do
        {
          for (uint64_t n = 0; n != v53; ++n)
          {
            if (*(void *)v69 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v68 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v57 = (void *)[v56 copy];
              [v6 addOwnerIdentifier:v57];
            }
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v68 objects:v88 count:16];
        }
        while (v53);
      }
    }
    v58 = [v5 objectForKeyedSubscript:@"networkType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v59 = v58;
      if ([v59 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
      {
        uint64_t v60 = 0;
      }
      else if ([v59 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
      {
        uint64_t v60 = 1;
      }
      else if ([v59 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
      {
        uint64_t v60 = 2;
      }
      else if ([v59 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
      {
        uint64_t v60 = 3;
      }
      else if ([v59 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
      {
        uint64_t v60 = 4;
      }
      else if ([v59 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
      {
        uint64_t v60 = 5;
      }
      else if ([v59 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
      {
        uint64_t v60 = 6;
      }
      else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
      {
        uint64_t v60 = 7;
      }
      else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
      {
        uint64_t v60 = 8;
      }
      else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
      {
        uint64_t v60 = 9;
      }
      else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
      {
        uint64_t v60 = 10;
      }
      else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
      {
        uint64_t v60 = 11;
      }
      else
      {
        if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
        {
          uint64_t v60 = 12;
        }
        else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
        {
          uint64_t v60 = 13;
        }
        else if ([v59 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
        {
          uint64_t v60 = 14;
        }
        else if ([v59 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
        {
          uint64_t v60 = 15;
        }
        else if ([v59 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
        {
          uint64_t v60 = 16;
        }
        else
        {
          uint64_t v60 = 0;
        }
        id v5 = v67;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_141;
      }
      uint64_t v60 = [v58 intValue];
    }
    objc_msgSend(v6, "setNetworkType:", v60, v66);
LABEL_141:

    v61 = [v5 objectForKeyedSubscript:@"venueGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v62 = v61;
      if ([v62 isEqualToString:@"UNKNOWN_VENUE_GROUP"])
      {
        uint64_t v63 = 0;
      }
      else if ([v62 isEqualToString:@"ASSEMBLY"])
      {
        uint64_t v63 = 1;
      }
      else if ([v62 isEqualToString:@"BUSINESS"])
      {
        uint64_t v63 = 2;
      }
      else if ([v62 isEqualToString:@"EDUCATIONAL"])
      {
        uint64_t v63 = 3;
      }
      else if ([v62 isEqualToString:@"FACTORY_AND_INDUSTRIAL"])
      {
        uint64_t v63 = 4;
      }
      else if ([v62 isEqualToString:@"INSTITUTIONAL"])
      {
        uint64_t v63 = 5;
      }
      else if ([v62 isEqualToString:@"MERCANTILE"])
      {
        uint64_t v63 = 6;
      }
      else if ([v62 isEqualToString:@"RESIDENTIAL"])
      {
        uint64_t v63 = 7;
      }
      else if ([v62 isEqualToString:@"STORAGE"])
      {
        uint64_t v63 = 8;
      }
      else if ([v62 isEqualToString:@"UTILITY_AND_MISC"])
      {
        uint64_t v63 = 9;
      }
      else if ([v62 isEqualToString:@"VEHICULAR"])
      {
        uint64_t v63 = 10;
      }
      else if ([v62 isEqualToString:@"OUTDOOR"])
      {
        uint64_t v63 = 11;
      }
      else
      {
        uint64_t v63 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_171:

        v64 = [v5 objectForKeyedSubscript:@"venueType"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v6, "setVenueType:", objc_msgSend(v64, "unsignedIntValue"));
        }

        goto LABEL_174;
      }
      uint64_t v63 = [v61 intValue];
    }
    objc_msgSend(v6, "setVenueGroup:", v63, v66);
    goto LABEL_171;
  }
LABEL_174:

  return v6;
}

- (GEOWiFiESS)initWithJSON:(id)a3
{
  return (GEOWiFiESS *)-[GEOWiFiESS _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_170;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_171;
    }
    GEOWiFiESSReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiESSCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiESSIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiESSReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiESSIsDirty((uint64_t)self) & 1) == 0)
  {
    id v21 = self->_reader;
    objc_sync_enter(v21);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v22];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiESS *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    objc_super v6 = self->_bss;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v7);
    }

    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_authTraits.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_authTraits.count);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = self->_qualities;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v12);
    }

    if (self->_attributes.count)
    {
      unint64_t v15 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v15 < self->_attributes.count);
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt64Field();
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = self->_ownerIdentifiers;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v17);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOWiFiESS _readBss]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_bss;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  long long v23 = (id *)a3;
  [(GEOWiFiESS *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v23 + 1, self->_reader);
  *((_DWORD *)v23 + 28) = self->_readerMarkPos;
  *((_DWORD *)v23 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v23, "setIdentifier:");
  }
  if ([(GEOWiFiESS *)self bssCount])
  {
    [v23 clearBss];
    unint64_t v4 = [(GEOWiFiESS *)self bssCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWiFiESS *)self bssAtIndex:i];
        [v23 addBss:v7];
      }
    }
  }
  if (self->_name) {
    objc_msgSend(v23, "setName:");
  }
  if ([(GEOWiFiESS *)self authTraitsCount])
  {
    [v23 clearAuthTraits];
    unint64_t v8 = [(GEOWiFiESS *)self authTraitsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v23, "addAuthTraits:", -[GEOWiFiESS authTraitsAtIndex:](self, "authTraitsAtIndex:", j));
    }
  }
  if ([(GEOWiFiESS *)self qualitiesCount])
  {
    [v23 clearQualities];
    unint64_t v11 = [(GEOWiFiESS *)self qualitiesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        long long v14 = [(GEOWiFiESS *)self qualitiesAtIndex:k];
        [v23 addQualities:v14];
      }
    }
  }
  if ([(GEOWiFiESS *)self attributesCount])
  {
    [v23 clearAttributes];
    unint64_t v15 = [(GEOWiFiESS *)self attributesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        objc_msgSend(v23, "addAttributes:", -[GEOWiFiESS attributesAtIndex:](self, "attributesAtIndex:", m));
    }
  }
  if (*(_WORD *)&self->_flags)
  {
    v23[13] = self->_uniqueIdentifier;
    *((_WORD *)v23 + 68) |= 1u;
  }
  if ([(GEOWiFiESS *)self ownerIdentifiersCount])
  {
    [v23 clearOwnerIdentifiers];
    unint64_t v18 = [(GEOWiFiESS *)self ownerIdentifiersCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
      {
        id v21 = [(GEOWiFiESS *)self ownerIdentifierAtIndex:n];
        [v23 addOwnerIdentifier:v21];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v23 + 31) = self->_networkType;
    *((_WORD *)v23 + 68) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_29:
      if ((flags & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_29;
  }
  *((_DWORD *)v23 + 32) = self->_venueGroup;
  *((_WORD *)v23 + 68) |= 4u;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_30:
    *((_DWORD *)v23 + 33) = self->_venueType;
    *((_WORD *)v23 + 68) |= 8u;
  }
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiESS *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
    BOOL v10 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v9;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    unint64_t v11 = self->_bss;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v11);
          }
          unint64_t v15 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * i) copyWithZone:a3];
          [(id)v5 addBss:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [(NSString *)self->_name copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v16;

    PBRepeatedInt32Copy();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    unint64_t v18 = self->_qualities;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * j) copyWithZone:a3];
          [(id)v5 addQualities:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v19);
    }

    PBRepeatedInt32Copy();
    if (*(_WORD *)&self->_flags)
    {
      *(void *)(v5 + 104) = self->_uniqueIdentifier;
      *(_WORD *)(v5 + 136) |= 1u;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v23 = self->_ownerIdentifiers;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v23);
          }
          long long v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * k), "copyWithZone:", a3, (void)v30);
          [(id)v5 addOwnerIdentifier:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v24);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 124) = self->_networkType;
      *(_WORD *)(v5 + 136) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_30:
        if ((flags & 8) == 0) {
          return (id)v5;
        }
LABEL_31:
        *(_DWORD *)(v5 + 132) = self->_venueType;
        *(_WORD *)(v5 + 136) |= 8u;
        return (id)v5;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_30;
    }
    *(_DWORD *)(v5 + 128) = self->_venueGroup;
    *(_WORD *)(v5 + 136) |= 4u;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_31;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOWiFiESSReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  [(GEOWiFiESS *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_34;
    }
  }
  bss = self->_bss;
  if ((unint64_t)bss | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](bss, "isEqual:")) {
      goto LABEL_34;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_34;
  }
  qualities = self->_qualities;
  if ((unint64_t)qualities | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](qualities, "isEqual:")) {
      goto LABEL_34;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_34;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 68);
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_uniqueIdentifier != *((void *)v4 + 13)) {
      goto LABEL_34;
    }
  }
  else if (v10)
  {
    goto LABEL_34;
  }
  ownerIdentifiers = self->_ownerIdentifiers;
  if ((unint64_t)ownerIdentifiers | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](ownerIdentifiers, "isEqual:"))
    {
LABEL_34:
      BOOL v12 = 0;
      goto LABEL_35;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v10 = *((_WORD *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_networkType != *((_DWORD *)v4 + 31)) {
      goto LABEL_34;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_venueGroup != *((_DWORD *)v4 + 32)) {
      goto LABEL_34;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_34;
  }
  BOOL v12 = (v10 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_venueType != *((_DWORD *)v4 + 33)) {
      goto LABEL_34;
    }
    BOOL v12 = 1;
  }
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  [(GEOWiFiESS *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_bss hash];
  NSUInteger v5 = [(NSString *)self->_name hash];
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = [(NSMutableArray *)self->_qualities hash];
  uint64_t v8 = PBRepeatedInt32Hash();
  if (*(_WORD *)&self->_flags) {
    uint64_t v9 = 2654435761 * self->_uniqueIdentifier;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(NSMutableArray *)self->_ownerIdentifiers hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v12 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v13 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  }
  uint64_t v12 = 2654435761 * self->_networkType;
  if ((flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v13 = 2654435761 * self->_venueGroup;
  if ((flags & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v14 = 2654435761 * self->_venueType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 9)) {
    -[GEOWiFiESS setIdentifier:](self, "setIdentifier:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = *((id *)v4 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOWiFiESS *)self addBss:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 10)) {
    -[GEOWiFiESS setName:](self, "setName:");
  }
  uint64_t v10 = [v4 authTraitsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOWiFiESS addAuthTraits:](self, "addAuthTraits:", [v4 authTraitsAtIndex:j]);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = *((id *)v4 + 12);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOWiFiESS *)self addQualities:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [v4 attributesCount];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t m = 0; m != v19; ++m)
      -[GEOWiFiESS addAttributes:](self, "addAttributes:", [v4 attributesAtIndex:m]);
  }
  if (*((_WORD *)v4 + 68))
  {
    self->_uniqueIdentifier = *((void *)v4 + 13);
    *(_WORD *)&self->_flags |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v21 = *((id *)v4 + 11);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (uint64_t n = 0; n != v23; ++n)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        -[GEOWiFiESS addOwnerIdentifier:](self, "addOwnerIdentifier:", *(void *)(*((void *)&v27 + 1) + 8 * n), (void)v27);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v23);
  }

  __int16 v26 = *((_WORD *)v4 + 68);
  if ((v26 & 2) == 0)
  {
    if ((v26 & 4) == 0) {
      goto LABEL_36;
    }
LABEL_40:
    self->_venueGroup = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 4u;
    if ((*((_WORD *)v4 + 68) & 8) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  self->_networkType = *((_DWORD *)v4 + 31);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v26 = *((_WORD *)v4 + 68);
  if ((v26 & 4) != 0) {
    goto LABEL_40;
  }
LABEL_36:
  if ((v26 & 8) != 0)
  {
LABEL_37:
    self->_venueType = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_38:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualities, 0);
  objc_storeStrong((id *)&self->_ownerIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bss, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end