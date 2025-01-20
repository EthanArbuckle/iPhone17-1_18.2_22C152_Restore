@interface GEOPDQuickLinkItem
+ (id)quickLinksForPlaceData:(id)a3;
+ (id)secondaryQuickLinksForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDQuickLinkItem)init;
- (GEOPDQuickLinkItem)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appAdamId;
- (id)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)symbolImageName;
- (id)title;
- (id)url;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)linkType;
- (unint64_t)hash;
- (void)_readAppAdamId;
- (void)_readBundleId;
- (void)_readSymbolImageName;
- (void)_readTitle;
- (void)_readUrl;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setAppAdamId:(uint64_t)a1;
- (void)setBundleId:(uint64_t)a1;
- (void)setUrl:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDQuickLinkItem

+ (id)quickLinksForPlaceData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__GEOPDQuickLinkItem_PlaceDataExtras__quickLinksForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:40 usingBlock:v10];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __62__GEOPDQuickLinkItem_PlaceDataExtras__quickLinksForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  v9 = a2;
  -[GEOPDComponentValue quickLink](v9);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  id v4 = -[GEOPDQuickLink quickLinkItems](v3);
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    -[GEOPDComponentValue quickLink](v9);
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    id v8 = -[GEOPDQuickLink quickLinkItems](v7);
    [v6 addObjectsFromArray:v8];
  }
}

+ (id)secondaryQuickLinksForPlaceData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__GEOPDQuickLinkItem_PlaceDataExtras__secondaryQuickLinksForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:40 usingBlock:v10];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __71__GEOPDQuickLinkItem_PlaceDataExtras__secondaryQuickLinksForPlaceData___block_invoke(uint64_t a1, void *a2)
{
  v9 = a2;
  -[GEOPDComponentValue quickLink](v9);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  id v4 = -[GEOPDQuickLink secondaryQuickLinkItems](v3);
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    -[GEOPDComponentValue quickLink](v9);
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    id v8 = -[GEOPDQuickLink secondaryQuickLinkItems](v7);
    [v6 addObjectsFromArray:v8];
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 84) |= 4u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDQuickLinkItem readAll:](a1, 0);
  }
}

- (GEOPDQuickLinkItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDQuickLinkItem;
  v2 = [(GEOPDQuickLinkItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDQuickLinkItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDQuickLinkItem;
  v3 = [(GEOPDQuickLinkItem *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_7984);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDQuickLinkItem _readTitle]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_7985);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDQuickLinkItem _readUrl]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setUrl:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x80u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)_readAppAdamId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppAdamId_tags_7986);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)appAdamId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDQuickLinkItem _readAppAdamId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAppAdamId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 8u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readBundleId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBundleId_tags_7987);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)bundleId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDQuickLinkItem _readBundleId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setBundleId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 84) |= 0x10u;
    *(_WORD *)(a1 + 84) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)linkType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 84);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    if (v2) {
      return *(unsigned int *)(v1 + 76);
    }
    else {
      return 1;
    }
  }
  return result;
}

- (void)_readSymbolImageName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 84) & 0x20) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolImageName_tags_7988);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)symbolImageName
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDQuickLinkItem _readSymbolImageName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDQuickLinkItem;
  id v4 = [(GEOPDQuickLinkItem *)&v8 description];
  uint64_t v5 = [(GEOPDQuickLinkItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQuickLinkItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDQuickLinkItem readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDQuickLinkItem title]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"title"];
    }

    objc_super v6 = -[GEOPDQuickLinkItem url]((id *)a1);
    if (v6) {
      [v4 setObject:v6 forKey:@"url"];
    }

    objc_super v7 = -[GEOPDQuickLinkItem appAdamId]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"appAdamId";
      }
      else {
        objc_super v8 = @"app_adam_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = -[GEOPDQuickLinkItem bundleId]((id *)a1);
    if (v9)
    {
      if (a2) {
        v10 = @"bundleId";
      }
      else {
        v10 = @"bundle_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    __int16 v11 = *(_WORD *)(a1 + 84);
    if (v11)
    {
      uint64_t v12 = *(int *)(a1 + 76);
      if (v12 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53E3FA8[v12];
      }
      if (a2) {
        v14 = @"linkType";
      }
      else {
        v14 = @"link_type";
      }
      [v4 setObject:v13 forKey:v14];

      __int16 v11 = *(_WORD *)(a1 + 84);
    }
    if ((v11 & 2) != 0)
    {
      unsigned int v15 = *(_DWORD *)(a1 + 80) - 1;
      if (v15 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 80));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53E3FC0[v15];
      }
      [v4 setObject:v16 forKey:@"relationship"];
    }
    v17 = -[GEOPDQuickLinkItem symbolImageName]((id *)a1);
    if (v17)
    {
      if (a2) {
        v18 = @"symbolImageName";
      }
      else {
        v18 = @"symbol_image_name";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __48__GEOPDQuickLinkItem__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDQuickLinkItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7992;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7993;
      }
      GEOPDQuickLinkItemReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __48__GEOPDQuickLinkItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_49;
  }
  objc_super v7 = [v5 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    id v9 = v8;
    *(_WORD *)(v6 + 84) |= 0x40u;
    *(_WORD *)(v6 + 84) |= 0x100u;
    objc_storeStrong((id *)(v6 + 48), v8);
  }
  id v10 = [v5 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v11 = (void *)[v10 copy];
    -[GEOPDQuickLinkItem setUrl:](v6, v11);
  }
  if (a3) {
    uint64_t v12 = @"appAdamId";
  }
  else {
    uint64_t v12 = @"app_adam_id";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)[v13 copy];
    -[GEOPDQuickLinkItem setAppAdamId:](v6, v14);
  }
  if (a3) {
    unsigned int v15 = @"bundleId";
  }
  else {
    unsigned int v15 = @"bundle_id";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (void *)[v16 copy];
    -[GEOPDQuickLinkItem setBundleId:](v6, v17);
  }
  if (a3) {
    v18 = @"linkType";
  }
  else {
    v18 = @"link_type";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"UNKNOWN"])
    {
      int v21 = 0;
    }
    else if ([v20 isEqualToString:@"LINK_TYPE_QUICK_LINK"])
    {
      int v21 = 1;
    }
    else if ([v20 isEqualToString:@"LINK_TYPE_APP_CLIP_LINK"])
    {
      int v21 = 2;
    }
    else
    {
      int v21 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_31;
    }
    int v21 = [v19 intValue];
  }
  *(_WORD *)(v6 + 84) |= 0x100u;
  *(_WORD *)(v6 + 84) |= 1u;
  *(_DWORD *)(v6 + 76) = v21;
LABEL_31:

  v22 = [v5 objectForKeyedSubscript:@"relationship"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v22;
    if ([v23 isEqualToString:@"RELATIONSHIP_OWNER"])
    {
      int v24 = 1;
    }
    else if ([v23 isEqualToString:@"RELATIONSHIP_AUTHORIZED"])
    {
      int v24 = 2;
    }
    else if ([v23 isEqualToString:@"RELATIONSHIP_OTHER"])
    {
      int v24 = 3;
    }
    else
    {
      int v24 = 1;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v24 = [v22 intValue];
LABEL_42:
    *(_WORD *)(v6 + 84) |= 0x100u;
    *(_WORD *)(v6 + 84) |= 2u;
    *(_DWORD *)(v6 + 80) = v24;
  }

  if (a3) {
    v25 = @"symbolImageName";
  }
  else {
    v25 = @"symbol_image_name";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = (void *)[v26 copy];
    id v28 = v27;
    *(_WORD *)(v6 + 84) |= 0x20u;
    *(_WORD *)(v6 + 84) |= 0x100u;
    objc_storeStrong((id *)(v6 + 40), v27);
  }
LABEL_49:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDQuickLinkItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F8) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_bundleId)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_symbolImageName)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDQuickLinkItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_url copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  uint64_t v13 = [(NSString *)self->_appAdamId copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_bundleId copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 76) = self->_linkType;
    *(_WORD *)(v5 + 84) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_relationship;
    *(_WORD *)(v5 + 84) |= 2u;
  }
  uint64_t v18 = [(NSString *)self->_symbolImageName copyWithZone:a3];
  v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  id v20 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v20;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 1);
  -[GEOPDQuickLinkItem readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_22;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_22;
    }
  }
  appAdamId = self->_appAdamId;
  if ((unint64_t)appAdamId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appAdamId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 42);
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_linkType != *((_DWORD *)v4 + 19)) {
      goto LABEL_22;
    }
  }
  else if (v10)
  {
LABEL_22:
    char v12 = 0;
    goto LABEL_23;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_relationship != *((_DWORD *)v4 + 20)) {
      goto LABEL_22;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_22;
  }
  symbolImageName = self->_symbolImageName;
  if ((unint64_t)symbolImageName | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](symbolImageName, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  -[GEOPDQuickLinkItem readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  NSUInteger v5 = [(NSString *)self->_appAdamId hash];
  NSUInteger v6 = [(NSString *)self->_bundleId hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v8 = 2654435761 * self->_linkType;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ [(NSString *)self->_symbolImageName hash];
  }
  uint64_t v8 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_relationship;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ [(NSString *)self->_symbolImageName hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end