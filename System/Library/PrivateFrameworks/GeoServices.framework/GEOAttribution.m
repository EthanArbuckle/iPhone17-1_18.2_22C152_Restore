@interface GEOAttribution
+ (BOOL)isValid:(id)a3;
+ (Class)resourceType;
- (BOOL)hasBadge;
- (BOOL)hasBadgeChecksum;
- (BOOL)hasDataSet;
- (BOOL)hasLinkDisplayStringIndex;
- (BOOL)hasLogo;
- (BOOL)hasLogoChecksum;
- (BOOL)hasName;
- (BOOL)hasPlainTextURL;
- (BOOL)hasPlainTextURLSHA256Checksum;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAttribution)init;
- (GEOAttribution)initWithData:(id)a3;
- (GEOAttribution)initWithDictionary:(id)a3;
- (GEOAttribution)initWithJSON:(id)a3;
- (GEOTileSetRegion)regionAtIndex:(SEL)a3;
- (GEOTileSetRegion)regions;
- (NSData)plainTextURLSHA256Checksum;
- (NSMutableArray)resources;
- (NSString)badge;
- (NSString)badgeChecksum;
- (NSString)logo;
- (NSString)logoChecksum;
- (NSString)name;
- (NSString)plainTextURL;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resourceAtIndex:(unint64_t)a3;
- (uint64_t)_reserveRegions:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)regionsCount;
- (unint64_t)resourcesCount;
- (unsigned)dataSet;
- (unsigned)linkDisplayStringIndex;
- (void)_addNoFlagsResource:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readBadge;
- (void)_readBadgeChecksum;
- (void)_readLogo;
- (void)_readLogoChecksum;
- (void)_readName;
- (void)_readPlainTextURL;
- (void)_readPlainTextURLSHA256Checksum;
- (void)_readRegions;
- (void)_readResources;
- (void)_readUrl;
- (void)addRegion:(GEOTileSetRegion *)a3;
- (void)addResource:(id)a3;
- (void)clearRegions;
- (void)clearResources;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBadge:(id)a3;
- (void)setBadgeChecksum:(id)a3;
- (void)setDataSet:(unsigned int)a3;
- (void)setHasDataSet:(BOOL)a3;
- (void)setHasLinkDisplayStringIndex:(BOOL)a3;
- (void)setLinkDisplayStringIndex:(unsigned int)a3;
- (void)setLogo:(id)a3;
- (void)setLogoChecksum:(id)a3;
- (void)setName:(id)a3;
- (void)setPlainTextURL:(id)a3;
- (void)setPlainTextURLSHA256Checksum:(id)a3;
- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)setResources:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAttribution

- (GEOAttribution)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAttribution;
  v2 = [(GEOAttribution *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileSetRegion)regionAtIndex:(SEL)a3
{
  -[GEOAttribution _readRegions]((uint64_t)self);
  unint64_t regionsCount = self->_regionsCount;
  if (regionsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, regionsCount);
    v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  v13 = &self->_regions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (unint64_t)regionsCount
{
  return self->_regionsCount;
}

- (void)_readRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegions_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)resources
{
  -[GEOAttribution _readResources]((uint64_t)self);
  resources = self->_resources;

  return resources;
}

- (void)_readResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
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
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      v8 = (int *)&readAll__recursiveTag_16;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_16;
    }
    GEOAttributionReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAttributionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (uint64_t)_reserveRegions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (24 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0xA796A5AEuLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 32)), 24 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      unint64_t v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOAttribution)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAttribution;
  id v3 = [(GEOAttribution *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEOAttribution *)self clearRegions];
  v3.receiver = self;
  v3.super_class = (Class)GEOAttribution;
  [(GEOAttribution *)&v3 dealloc];
}

- (void)_readBadge
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBadge_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasBadge
{
  return self->_badge != 0;
}

- (NSString)badge
{
  -[GEOAttribution _readBadge]((uint64_t)self);
  badge = self->_badge;

  return badge;
}

- (void)setBadge:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  objc_storeStrong((id *)&self->_badge, a3);
}

- (void)_readLogo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLogo
{
  return self->_logo != 0;
}

- (NSString)logo
{
  -[GEOAttribution _readLogo]((uint64_t)self);
  logo = self->_logo;

  return logo;
}

- (void)setLogo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_logo, a3);
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEOAttribution _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  -[GEOAttribution _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readBadgeChecksum
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBadgeChecksum_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasBadgeChecksum
{
  return self->_badgeChecksum != 0;
}

- (NSString)badgeChecksum
{
  -[GEOAttribution _readBadgeChecksum]((uint64_t)self);
  badgeChecksum = self->_badgeChecksum;

  return badgeChecksum;
}

- (void)setBadgeChecksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  objc_storeStrong((id *)&self->_badgeChecksum, a3);
}

- (void)_readLogoChecksum
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLogoChecksum_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLogoChecksum
{
  return self->_logoChecksum != 0;
}

- (NSString)logoChecksum
{
  -[GEOAttribution _readLogoChecksum]((uint64_t)self);
  logoChecksum = self->_logoChecksum;

  return logoChecksum;
}

- (void)setLogoChecksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  objc_storeStrong((id *)&self->_logoChecksum, a3);
}

- (void)setResources:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  resources = self->_resources;
  self->_resources = v4;
}

- (void)clearResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  resources = self->_resources;

  [(NSMutableArray *)resources removeAllObjects];
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  -[GEOAttribution _readResources]((uint64_t)self);
  -[GEOAttribution _addNoFlagsResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (unint64_t)resourcesCount
{
  -[GEOAttribution _readResources]((uint64_t)self);
  resources = self->_resources;

  return [(NSMutableArray *)resources count];
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEOAttribution _readResources]((uint64_t)self);
  resources = self->_resources;

  return (id)[(NSMutableArray *)resources objectAtIndex:a3];
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (GEOTileSetRegion)regions
{
  return self->_regions;
}

- (void)clearRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_regionsSpace = 0;
  self->_unint64_t regionsCount = 0;
  free(self->_regions);
  self->_regions = 0;
}

- (void)addRegion:(GEOTileSetRegion *)a3
{
  -[GEOAttribution _readRegions]((uint64_t)self);
  GEOTileSetRegion v5 = *a3;
  if (self && -[GEOAttribution _reserveRegions:]((uint64_t)self, 1uLL)) {
    self->_regions[self->_regionsCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  [(GEOAttribution *)self clearRegions];
  if (-[GEOAttribution _reserveRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_regions, a3, 24 * a4);
    self->_unint64_t regionsCount = a4;
  }
}

- (unsigned)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_dataSet = a3;
}

- (void)setHasDataSet:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasDataSet
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)linkDisplayStringIndex
{
  return self->_linkDisplayStringIndex;
}

- (void)setLinkDisplayStringIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_linkDisplayStringIndex = a3;
}

- (void)setHasLinkDisplayStringIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLinkDisplayStringIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readPlainTextURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlainTextURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlainTextURL
{
  return self->_plainTextURL != 0;
}

- (NSString)plainTextURL
{
  -[GEOAttribution _readPlainTextURL]((uint64_t)self);
  plainTextURL = self->_plainTextURL;

  return plainTextURL;
}

- (void)setPlainTextURL:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_plainTextURL, a3);
}

- (void)_readPlainTextURLSHA256Checksum
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlainTextURLSHA256Checksum_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasPlainTextURLSHA256Checksum
{
  return self->_plainTextURLSHA256Checksum != 0;
}

- (NSData)plainTextURLSHA256Checksum
{
  -[GEOAttribution _readPlainTextURLSHA256Checksum]((uint64_t)self);
  plainTextURLSHA256Checksum = self->_plainTextURLSHA256Checksum;

  return plainTextURLSHA256Checksum;
}

- (void)setPlainTextURLSHA256Checksum:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_plainTextURLSHA256Checksum, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAttribution;
  id v4 = [(GEOAttribution *)&v8 description];
  GEOTileSetRegion v5 = [(GEOAttribution *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    GEOTileSetRegion v5 = [(id)a1 badge];
    if (v5) {
      [v4 setObject:v5 forKey:@"badge"];
    }

    unint64_t v6 = [(id)a1 logo];
    if (v6) {
      [v4 setObject:v6 forKey:@"logo"];
    }

    objc_super v7 = [(id)a1 name];
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    objc_super v8 = [(id)a1 url];
    if (v8) {
      [v4 setObject:v8 forKey:@"url"];
    }

    unint64_t v9 = [(id)a1 badgeChecksum];
    if (v9) {
      [v4 setObject:v9 forKey:@"badgeChecksum"];
    }

    uint64_t v10 = [(id)a1 logoChecksum];
    if (v10) {
      [v4 setObject:v10 forKey:@"logoChecksum"];
    }

    if ([*(id *)(a1 + 104) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v12 = *(id *)(a1 + 104);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v14);
      }

      [v4 setObject:v11 forKey:@"resource"];
    }
    if (*(void *)(a1 + 32))
    {
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 32))
      {
        uint64_t v20 = 0;
        unint64_t v21 = 0;
        do
        {
          v22 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v20));
          [v19 addObject:v22];

          ++v21;
          v20 += 24;
        }
        while (v21 < *(void *)(a1 + 32));
      }
      [v4 setObject:v19 forKey:@"region"];
    }
    __int16 v23 = *(_WORD *)(a1 + 140);
    if (v23)
    {
      v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
      [v4 setObject:v24 forKey:@"dataSet"];

      __int16 v23 = *(_WORD *)(a1 + 140);
    }
    if ((v23 & 2) != 0)
    {
      v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
      [v4 setObject:v25 forKey:@"linkDisplayStringIndex"];
    }
    v26 = [(id)a1 plainTextURL];
    if (v26) {
      [v4 setObject:v26 forKey:@"plainTextURL"];
    }

    v27 = [(id)a1 plainTextURLSHA256Checksum];
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 base64EncodedStringWithOptions:0];
        [v4 setObject:v29 forKey:@"plainTextURLSHA256Checksum"];
      }
      else
      {
        [v4 setObject:v27 forKey:@"plainTextURLSHA256Checksum"];
      }
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
        v37[2] = __44__GEOAttribution__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOAttribution)initWithDictionary:(id)a3
{
  return (GEOAttribution *)-[GEOAttribution _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      unint64_t v6 = [v5 objectForKeyedSubscript:@"badge"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setBadge:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"logo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v9 = (void *)[v8 copy];
        [a1 setLogo:v9];
      }
      id v10 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setName:v11];
      }
      id v12 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = (void *)[v12 copy];
        [a1 setUrl:v13];
      }
      uint64_t v14 = [v5 objectForKeyedSubscript:@"badgeChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = (void *)[v14 copy];
        [a1 setBadgeChecksum:v15];
      }
      v16 = [v5 objectForKeyedSubscript:@"logoChecksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setLogoChecksum:v17];
      }
      v18 = [v5 objectForKeyedSubscript:@"resource"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v42 = v18;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v52 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v25 = [GEOResource alloc];
                if (a3) {
                  uint64_t v26 = [(GEOResource *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEOResource *)v25 initWithDictionary:v24];
                }
                v27 = (void *)v26;
                [a1 addResource:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v51 objects:v56 count:16];
          }
          while (v21);
        }

        v18 = v42;
      }

      v28 = [v5 objectForKeyedSubscript:@"region"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v48 != v32) {
                objc_enumerationMutation(v29);
              }
              id v34 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v45 = 0uLL;
                uint64_t v46 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v34, &v45);
                long long v43 = v45;
                uint64_t v44 = v46;
                [a1 addRegion:&v43];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v31);
        }
      }
      id v35 = [v5 objectForKeyedSubscript:@"dataSet"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDataSet:", objc_msgSend(v35, "unsignedIntValue"));
      }

      v36 = [v5 objectForKeyedSubscript:@"linkDisplayStringIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLinkDisplayStringIndex:", objc_msgSend(v36, "unsignedIntValue"));
      }

      v37 = [v5 objectForKeyedSubscript:@"plainTextURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = (void *)[v37 copy];
        [a1 setPlainTextURL:v38];
      }
      long long v39 = [v5 objectForKeyedSubscript:@"plainTextURLSHA256Checksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v39 options:0];
        [a1 setPlainTextURLSHA256Checksum:v40];
      }
    }
  }

  return a1;
}

- (GEOAttribution)initWithJSON:(id)a3
{
  return (GEOAttribution *)-[GEOAttribution _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAttributionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FF8) == 0))
  {
    uint64_t v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAttribution *)self readAll:0];
    if (self->_badge) {
      PBDataWriterWriteStringField();
    }
    if (self->_logo) {
      PBDataWriterWriteStringField();
    }
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    if (self->_badgeChecksum) {
      PBDataWriterWriteStringField();
    }
    if (self->_logoChecksum) {
      PBDataWriterWriteStringField();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v6 = self->_resources;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    if (self->_regionsCount)
    {
      uint64_t v10 = 0;
      unint64_t v11 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v11;
        v10 += 24;
      }
      while (v11 < self->_regionsCount);
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_plainTextURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_plainTextURLSHA256Checksum) {
      PBDataWriterWriteDataField();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOAttribution *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 30) = self->_readerMarkPos;
  *((_DWORD *)v4 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_badge) {
    objc_msgSend(v4, "setBadge:");
  }
  if (self->_logo) {
    objc_msgSend(v4, "setLogo:");
  }
  if (self->_name) {
    objc_msgSend(v4, "setName:");
  }
  if (self->_url) {
    objc_msgSend(v4, "setUrl:");
  }
  if (self->_badgeChecksum) {
    objc_msgSend(v4, "setBadgeChecksum:");
  }
  if (self->_logoChecksum) {
    objc_msgSend(v4, "setLogoChecksum:");
  }
  if ([(GEOAttribution *)self resourcesCount])
  {
    [v4 clearResources];
    unint64_t v5 = [(GEOAttribution *)self resourcesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOAttribution *)self resourceAtIndex:i];
        [v4 addResource:v8];
      }
    }
  }
  if ([(GEOAttribution *)self regionsCount])
  {
    [v4 clearRegions];
    unint64_t v9 = [(GEOAttribution *)self regionsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        [(GEOAttribution *)self regionAtIndex:j];
        [v4 addRegion:v13];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *((_DWORD *)v4 + 33) = self->_dataSet;
    *((_WORD *)v4 + 70) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 34) = self->_linkDisplayStringIndex;
    *((_WORD *)v4 + 70) |= 2u;
  }
  if (self->_plainTextURL) {
    objc_msgSend(v4, "setPlainTextURL:");
  }
  if (self->_plainTextURLSHA256Checksum) {
    objc_msgSend(v4, "setPlainTextURLSHA256Checksum:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAttribution *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_badge copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  uint64_t v11 = [(NSString *)self->_logo copyWithZone:a3];
  id v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  uint64_t v13 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  uint64_t v15 = [(NSString *)self->_url copyWithZone:a3];
  long long v16 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v15;

  uint64_t v17 = [(NSString *)self->_badgeChecksum copyWithZone:a3];
  long long v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  uint64_t v19 = [(NSString *)self->_logoChecksum copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v19;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v21 = self->_resources;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "copyWithZone:", a3, (void)v34);
        [(id)v5 addResource:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  unint64_t regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    -[GEOAttribution _reserveRegions:](v5, regionsCount);
    memcpy(*(void **)(v5 + 24), self->_regions, 24 * self->_regionsCount);
    *(void *)(v5 + 32) = self->_regionsCount;
  }
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 132) = self->_dataSet;
    *(_WORD *)(v5 + 140) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_linkDisplayStringIndex;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  uint64_t v28 = -[NSString copyWithZone:](self->_plainTextURL, "copyWithZone:", a3, (void)v34);
  id v29 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v28;

  uint64_t v30 = [(NSData *)self->_plainTextURLSHA256Checksum copyWithZone:a3];
  uint64_t v31 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v30;

  uint64_t v32 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v32;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOAttribution *)self readAll:1];
  [v4 readAll:1];
  badge = self->_badge;
  if ((unint64_t)badge | (unint64_t)v4[7])
  {
    if (!-[NSString isEqual:](badge, "isEqual:")) {
      goto LABEL_18;
    }
  }
  logo = self->_logo;
  if ((unint64_t)logo | (unint64_t)v4[9])
  {
    if (!-[NSString isEqual:](logo, "isEqual:")) {
      goto LABEL_18;
    }
  }
  name = self->_name;
  if ((unint64_t)name | (unint64_t)v4[10])
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_18;
    }
  }
  url = self->_url;
  if ((unint64_t)url | (unint64_t)v4[14])
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_18;
    }
  }
  badgeChecksum = self->_badgeChecksum;
  if ((unint64_t)badgeChecksum | (unint64_t)v4[6])
  {
    if (!-[NSString isEqual:](badgeChecksum, "isEqual:")) {
      goto LABEL_18;
    }
  }
  logoChecksum = self->_logoChecksum;
  if ((unint64_t)logoChecksum | (unint64_t)v4[8])
  {
    if (!-[NSString isEqual:](logoChecksum, "isEqual:")) {
      goto LABEL_18;
    }
  }
  resources = self->_resources;
  if ((unint64_t)resources | (unint64_t)v4[13])
  {
    if (!-[NSMutableArray isEqual:](resources, "isEqual:")) {
      goto LABEL_18;
    }
  }
  unint64_t regionsCount = self->_regionsCount;
  if ((const void *)regionsCount != v4[4] || memcmp(self->_regions, v4[3], 24 * regionsCount)) {
    goto LABEL_18;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v16 = *((_WORD *)v4 + 70);
  if (flags)
  {
    if ((v16 & 1) == 0 || self->_dataSet != *((_DWORD *)v4 + 33)) {
      goto LABEL_18;
    }
  }
  else if (v16)
  {
    goto LABEL_18;
  }
  if ((flags & 2) == 0)
  {
    if ((v16 & 2) == 0) {
      goto LABEL_30;
    }
LABEL_18:
    char v13 = 0;
    goto LABEL_19;
  }
  if ((v16 & 2) == 0 || self->_linkDisplayStringIndex != *((_DWORD *)v4 + 34)) {
    goto LABEL_18;
  }
LABEL_30:
  plainTextURL = self->_plainTextURL;
  if ((unint64_t)plainTextURL | (unint64_t)v4[12]
    && !-[NSString isEqual:](plainTextURL, "isEqual:"))
  {
    goto LABEL_18;
  }
  plainTextURLSHA256Checksum = self->_plainTextURLSHA256Checksum;
  if ((unint64_t)plainTextURLSHA256Checksum | (unint64_t)v4[11]) {
    char v13 = -[NSData isEqual:](plainTextURLSHA256Checksum, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_19:

  return v13;
}

- (unint64_t)hash
{
  [(GEOAttribution *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_badge hash];
  NSUInteger v4 = [(NSString *)self->_logo hash];
  NSUInteger v5 = [(NSString *)self->_name hash];
  NSUInteger v6 = [(NSString *)self->_url hash];
  NSUInteger v7 = [(NSString *)self->_badgeChecksum hash];
  NSUInteger v8 = [(NSString *)self->_logoChecksum hash];
  uint64_t v9 = [(NSMutableArray *)self->_resources hash];
  uint64_t v10 = PBHashBytes();
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v12 = 2654435761 * self->_dataSet;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = 2654435761 * self->_linkDisplayStringIndex;
LABEL_6:
  NSUInteger v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v15 = v12 ^ v13 ^ [(NSString *)self->_plainTextURL hash];
  return v14 ^ v15 ^ [(NSData *)self->_plainTextURLSHA256Checksum hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 7)) {
    -[GEOAttribution setBadge:](self, "setBadge:");
  }
  if (*((void *)v4 + 9)) {
    -[GEOAttribution setLogo:](self, "setLogo:");
  }
  if (*((void *)v4 + 10)) {
    -[GEOAttribution setName:](self, "setName:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOAttribution setUrl:](self, "setUrl:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOAttribution setBadgeChecksum:](self, "setBadgeChecksum:");
  }
  if (*((void *)v4 + 8)) {
    -[GEOAttribution setLogoChecksum:](self, "setLogoChecksum:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v4 + 13);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOAttribution *)self addResource:*(void *)(*((void *)&v15 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 regionsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
    {
      if (v4) {
        [v4 regionAtIndex:j];
      }
      else {
        memset(v14, 0, sizeof(v14));
      }
      [(GEOAttribution *)self addRegion:v14];
    }
  }
  __int16 v13 = *((_WORD *)v4 + 70);
  if (v13)
  {
    self->_dataSet = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v13 = *((_WORD *)v4 + 70);
  }
  if ((v13 & 2) != 0)
  {
    self->_linkDisplayStringIndex = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 12)) {
    -[GEOAttribution setPlainTextURL:](self, "setPlainTextURL:");
  }
  if (*((void *)v4 + 11)) {
    -[GEOAttribution setPlainTextURLSHA256Checksum:](self, "setPlainTextURLSHA256Checksum:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOAttributionReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_3);
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAttribution *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_resources;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_plainTextURL, 0);
  objc_storeStrong((id *)&self->_plainTextURLSHA256Checksum, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logo, 0);
  objc_storeStrong((id *)&self->_logoChecksum, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_badgeChecksum, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end