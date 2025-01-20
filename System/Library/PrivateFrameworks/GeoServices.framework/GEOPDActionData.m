@interface GEOPDActionData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDActionData)init;
- (GEOPDActionData)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionLinks;
- (id)actionName;
- (id)actionSymbolImageName;
- (id)actionTitles;
- (id)categoryId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)winningAdamId;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsActionLink:(uint64_t)a1;
- (void)_addNoFlagsActionTitle:(uint64_t)a1;
- (void)_readActionLinks;
- (void)_readActionSymbolImageName;
- (void)_readActionTitles;
- (void)_readCategoryId;
- (void)_readWinningAdamId;
- (void)addActionLink:(uint64_t)a1;
- (void)addActionTitle:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDActionData

- (id)actionName
{
  v2 = -[GEOPDActionData actionTitles]((id *)&self->super.super.isa);
  v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (GEOPDActionData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDActionData;
  v2 = [(GEOPDActionData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDActionData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDActionData;
  v3 = [(GEOPDActionData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readActionTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionTitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)actionTitles
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDActionData _readActionTitles]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addActionTitle:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDActionData _readActionTitles](a1);
    -[GEOPDActionData _addNoFlagsActionTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsActionTitle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readActionSymbolImageName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionSymbolImageName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)actionSymbolImageName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDActionData _readActionSymbolImageName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readActionLinks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionLinks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)actionLinks
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDActionData _readActionLinks]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addActionLink:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDActionData _readActionLinks](a1);
    -[GEOPDActionData _addNoFlagsActionLink:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsActionLink:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readWinningAdamId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWinningAdamId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)winningAdamId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDActionData _readWinningAdamId]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCategoryId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)categoryId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDActionData _readCategoryId]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDActionData;
  v4 = [(GEOPDActionData *)&v8 description];
  id v5 = [(GEOPDActionData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDActionData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDActionData readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v6 = *(id *)(a1 + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v45 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (a2) {
              [v10 jsonRepresentation];
            }
            else {
            v11 = [v10 dictionaryRepresentation];
            }
            [v5 addObject:v11];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v7);
      }

      if (a2) {
        v12 = @"actionTitle";
      }
      else {
        v12 = @"action_title";
      }
      [v4 setObject:v5 forKey:v12];
    }
    v13 = -[GEOPDActionData actionSymbolImageName]((id *)a1);
    if (v13)
    {
      if (a2) {
        v14 = @"actionSymbolImageName";
      }
      else {
        v14 = @"action_symbol_image_name";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v16 = *(id *)(a1 + 24);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v41 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v40 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v15 addObject:v21];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"actionLink";
      }
      else {
        v22 = @"action_link";
      }
      [v4 setObject:v15 forKey:v22];
    }
    v23 = -[GEOPDActionData winningAdamId]((id *)a1);
    if (v23)
    {
      if (a2) {
        v24 = @"winningAdamId";
      }
      else {
        v24 = @"winning_adam_id";
      }
      [v4 setObject:v23 forKey:v24];
    }

    v25 = -[GEOPDActionData categoryId]((id *)a1);
    if (v25)
    {
      if (a2) {
        v26 = @"categoryId";
      }
      else {
        v26 = @"category_id";
      }
      [v4 setObject:v25 forKey:v26];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v27 = *(void **)(a1 + 8);
      if (v27)
      {
        id v28 = v27;
        objc_sync_enter(v28);
        GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOwnerAdamId_tags);
        objc_sync_exit(v28);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v29 = *(id *)(a1 + 56);
    if (v29)
    {
      if (a2) {
        v30 = @"ownerAdamId";
      }
      else {
        v30 = @"owner_adam_id";
      }
      [v4 setObject:v29 forKey:v30];
    }

    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __45__GEOPDActionData__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;
      }
      else
      {
        id v36 = v32;
      }
      [v4 setObject:v36 forKey:@"Unknown Fields"];
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
  return -[GEOPDActionData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_35;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_35;
      }
      GEOPDActionDataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDActionDataCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __45__GEOPDActionData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v152 = [a1 init];
  if (v152)
  {
    int v153 = a3;
    if (a3) {
      id v6 = @"actionTitle";
    }
    else {
      id v6 = @"action_title";
    }
    v140 = v5;
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v178 = 0u;
      long long v179 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v176 objects:v189 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v177;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v177 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v176 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [GEOLocalizedString alloc];
              if (v153) {
                v14 = [(GEOLocalizedString *)v13 initWithJSON:v12];
              }
              else {
                v14 = [(GEOLocalizedString *)v13 initWithDictionary:v12];
              }
              v15 = v14;
              -[GEOPDActionData addActionTitle:](v152, v14);
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v176 objects:v189 count:16];
        }
        while (v9);
      }
    }
    if (v153) {
      id v16 = @"actionSymbolImageName";
    }
    else {
      id v16 = @"action_symbol_image_name";
    }
    uint64_t v17 = [v140 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = (void *)[v17 copy];
      id v19 = v18;
      *(unsigned char *)(v152 + 84) |= 4u;
      *(unsigned char *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 32), v18);
    }
    if (v153) {
      v20 = @"actionLink";
    }
    else {
      v20 = @"action_link";
    }
    v139 = [v140 objectForKeyedSubscript:v20];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v174 = 0u;
      long long v175 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      obuint64_t j = v139;
      uint64_t v144 = [obj countByEnumeratingWithState:&v172 objects:v188 count:16];
      if (!v144) {
        goto LABEL_195;
      }
      uint64_t v142 = *(void *)v173;
      if (v153) {
        v21 = @"appAdamId";
      }
      else {
        v21 = @"app_adam_id";
      }
      if (v153) {
        v22 = @"linkType";
      }
      else {
        v22 = @"link_type";
      }
      v23 = @"quick_link_params";
      if (v153) {
        v23 = @"quickLinkParams";
      }
      v160 = v23;
      v161 = v22;
      v24 = @"symbol_image_name";
      if (v153) {
        v24 = @"symbolImageName";
      }
      v154 = v24;
      v155 = v21;
      v25 = @"appClipParams";
      if (!v153) {
        v25 = @"app_clip_params";
      }
      v159 = v25;
      v26 = @"bundle_id";
      if (v153) {
        v26 = @"bundleId";
      }
      v151 = v26;
      if (v153) {
        v27 = @"extensionParams";
      }
      else {
        v27 = @"extension_params";
      }
      v158 = v27;
      if (v153) {
        id v28 = @"vendorId";
      }
      else {
        id v28 = @"vendor_id";
      }
      id v29 = @"external_item_id";
      if (v153) {
        id v29 = @"externalItemId";
      }
      v149 = v29;
      v150 = v28;
      v30 = @"extension_type";
      if (v153) {
        v30 = @"extensionType";
      }
      v148 = v30;
      v31 = @"webLinkParams";
      if (!v153) {
        v31 = @"web_link_params";
      }
      v157 = v31;
      v32 = @"supports_embedded_web_browser";
      if (v153) {
        v32 = @"supportsEmbeddedWebBrowser";
      }
      v147 = v32;
      if (v153) {
        v33 = @"ownerProvidedRank";
      }
      else {
        v33 = @"owner_provided_rank";
      }
      v156 = v33;
      while (1)
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v173 != v142)
          {
            uint64_t v35 = v34;
            objc_enumerationMutation(obj);
            uint64_t v34 = v35;
          }
          uint64_t v146 = v34;
          id v36 = *(void **)(*((void *)&v172 + 1) + 8 * v34);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v37 = [GEOPDActionLink alloc];
            if (v37)
            {
              id v145 = v36;
              uint64_t v163 = [(GEOPDActionLink *)v37 init];
              if (v163)
              {
                v38 = [v145 objectForKeyedSubscript:v155];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v39 = (void *)[v38 copy];
                  id v40 = v39;
                  *(unsigned char *)(v163 + 52) |= 2u;
                  *(unsigned char *)(v163 + 52) |= 8u;
                  objc_storeStrong((id *)(v163 + 24), v39);
                }
                v143 = [v145 objectForKeyedSubscript:@"link"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v182 = 0u;
                  long long v183 = 0u;
                  long long v180 = 0u;
                  long long v181 = 0u;
                  id v164 = v143;
                  uint64_t v167 = [v164 countByEnumeratingWithState:&v180 objects:v190 count:16];
                  if (v167)
                  {
                    uint64_t v166 = *(void *)v181;
                    do
                    {
                      uint64_t v41 = 0;
                      do
                      {
                        if (*(void *)v181 != v166)
                        {
                          uint64_t v42 = v41;
                          objc_enumerationMutation(v164);
                          uint64_t v41 = v42;
                        }
                        uint64_t v169 = v41;
                        long long v43 = *(void **)(*((void *)&v180 + 1) + 8 * v41);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          long long v44 = [GEOPDLink alloc];
                          if (v44)
                          {
                            id v170 = v43;
                            uint64_t v171 = [(GEOPDLink *)v44 init];
                            if (v171)
                            {
                              long long v45 = [v170 objectForKeyedSubscript:v161];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v46 = v45;
                                if ([v46 isEqualToString:@"LINK_TYPE_UNKNOWN"])
                                {
                                  int v47 = 0;
                                }
                                else if ([v46 isEqualToString:@"LINK_TYPE_QUICK_LINK"])
                                {
                                  int v47 = 1;
                                }
                                else if ([v46 isEqualToString:@"LINK_TYPE_APP_CLIP"])
                                {
                                  int v47 = 2;
                                }
                                else if ([v46 isEqualToString:@"LINK_TYPE_EXTENSION"])
                                {
                                  int v47 = 3;
                                }
                                else if ([v46 isEqualToString:@"LINK_TYPE_WEB_LINK"])
                                {
                                  int v47 = 4;
                                }
                                else
                                {
                                  int v47 = 0;
                                }

LABEL_93:
                                *(unsigned char *)(v171 + 76) |= 0x80u;
                                *(unsigned char *)(v171 + 76) |= 1u;
                                *(_DWORD *)(v171 + 68) = v47;
                              }
                              else
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  int v47 = [v45 intValue];
                                  goto LABEL_93;
                                }
                              }

                              v48 = [v170 objectForKeyedSubscript:v160];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v49 = [GEOPDQuickLinkActionDataParams alloc];
                                if (v49)
                                {
                                  id v50 = v48;
                                  uint64_t v51 = [(GEOPDQuickLinkActionDataParams *)v49 init];
                                  if (v51)
                                  {
                                    v52 = [v50 objectForKeyedSubscript:@"title"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v53 = (void *)[v52 copy];
                                      id v54 = v53;
                                      *(unsigned char *)(v51 + 68) |= 8u;
                                      *(unsigned char *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 40), v53);
                                    }
                                    v55 = [v50 objectForKeyedSubscript:@"url"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v56 = (void *)[v55 copy];
                                      id v57 = v56;
                                      *(unsigned char *)(v51 + 68) |= 0x10u;
                                      *(unsigned char *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 48), v56);
                                    }
                                    v58 = [v50 objectForKeyedSubscript:v155];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v59 = (void *)[v58 copy];
                                      id v60 = v59;
                                      *(unsigned char *)(v51 + 68) |= 2u;
                                      *(unsigned char *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 24), v59);
                                    }
                                    v61 = [v50 objectForKeyedSubscript:v154];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v62 = (void *)[v61 copy];
                                      id v63 = v62;
                                      *(unsigned char *)(v51 + 68) |= 4u;
                                      *(unsigned char *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 32), v62);
                                    }
                                  }
                                }
                                else
                                {
                                  uint64_t v51 = 0;
                                }
                                id v64 = (id)v51;
                                *(unsigned char *)(v171 + 76) |= 0x20u;
                                *(unsigned char *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 40), (id)v51);
                              }
                              v65 = [v170 objectForKeyedSubscript:v159];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v66 = [GEOPDAppClipParams alloc];
                                if (v66)
                                {
                                  id v67 = v65;
                                  uint64_t v68 = [(GEOPDAppClipParams *)v66 init];
                                  if (v68)
                                  {
                                    v69 = [v67 objectForKeyedSubscript:@"title"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v70 = (void *)[v69 copy];
                                      id v71 = v70;
                                      *(unsigned char *)(v68 + 76) |= 0x10u;
                                      *(unsigned char *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 48), v70);
                                    }
                                    v72 = [v67 objectForKeyedSubscript:@"url"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v73 = (void *)[v72 copy];
                                      id v74 = v73;
                                      *(unsigned char *)(v68 + 76) |= 0x20u;
                                      *(unsigned char *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 56), v73);
                                    }
                                    v75 = [v67 objectForKeyedSubscript:v151];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v76 = (void *)[v75 copy];
                                      id v77 = v76;
                                      *(unsigned char *)(v68 + 76) |= 4u;
                                      *(unsigned char *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 32), v76);
                                    }
                                    v78 = [v67 objectForKeyedSubscript:v154];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v79 = (void *)[v78 copy];
                                      id v80 = v79;
                                      *(unsigned char *)(v68 + 76) |= 8u;
                                      *(unsigned char *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 40), v79);
                                    }
                                    v81 = [v67 objectForKeyedSubscript:v155];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v82 = (void *)[v81 copy];
                                      id v83 = v82;
                                      *(unsigned char *)(v68 + 76) |= 2u;
                                      *(unsigned char *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 24), v82);
                                    }
                                  }
                                }
                                else
                                {
                                  uint64_t v68 = 0;
                                }
                                id v84 = (id)v68;
                                *(unsigned char *)(v171 + 76) |= 8u;
                                *(unsigned char *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 24), (id)v68);
                              }
                              v168 = [v170 objectForKeyedSubscript:v158];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v85 = [GEOPDExtensionParams alloc];
                                if (v85)
                                {
                                  id v165 = v168;
                                  uint64_t v86 = [(GEOPDExtensionParams *)v85 init];
                                  if (v86)
                                  {
                                    v87 = [v165 objectForKeyedSubscript:v150];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v88 = (void *)[v87 copy];
                                      id v89 = v88;
                                      *(unsigned char *)(v86 + 84) |= 0x10u;
                                      *(unsigned char *)(v86 + 84) |= 0x20u;
                                      objc_storeStrong((id *)(v86 + 64), v88);
                                    }
                                    v90 = [v165 objectForKeyedSubscript:v149];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v91 = (void *)[v90 copy];
                                      id v92 = v91;
                                      *(unsigned char *)(v86 + 84) |= 8u;
                                      *(unsigned char *)(v86 + 84) |= 0x20u;
                                      objc_storeStrong((id *)(v86 + 56), v91);
                                    }
                                    v162 = [v165 objectForKeyedSubscript:v148];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      long long v186 = 0u;
                                      long long v187 = 0u;
                                      long long v184 = 0u;
                                      long long v185 = 0u;
                                      id v93 = v162;
                                      uint64_t v94 = [v93 countByEnumeratingWithState:&v184 objects:v191 count:16];
                                      if (!v94) {
                                        goto LABEL_151;
                                      }
                                      uint64_t v95 = *(void *)v185;
                                      while (1)
                                      {
                                        for (uint64_t j = 0; j != v94; ++j)
                                        {
                                          if (*(void *)v185 != v95) {
                                            objc_enumerationMutation(v93);
                                          }
                                          v97 = *(void **)(*((void *)&v184 + 1) + 8 * j);
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v98 = v97;
                                            if (([v98 isEqualToString:@"EXTENSION_TYPE_UNKNOWN"] & 1) == 0
                                              && ([v98 isEqualToString:@"EXTENSION_TYPE_RESERVATION"] & 1) == 0)
                                            {
                                              [v98 isEqualToString:@"EXTENSION_TYPE_QUEUING"];
                                            }
                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0) {
                                              continue;
                                            }
                                            [v97 intValue];
                                          }
                                          os_unfair_lock_lock((os_unfair_lock_t)(v86 + 80));
                                          if ((*(unsigned char *)(v86 + 84) & 2) == 0)
                                          {
                                            v99 = *(void **)(v86 + 8);
                                            if (v99)
                                            {
                                              id v100 = v99;
                                              objc_sync_enter(v100);
                                              GEOPDExtensionParamsReadSpecified(v86, *(void *)(v86 + 8), (int *)&_readExtensionTypes_tags);
                                              objc_sync_exit(v100);
                                            }
                                          }
                                          os_unfair_lock_unlock((os_unfair_lock_t)(v86 + 80));
                                          PBRepeatedInt32Add();
                                          os_unfair_lock_lock_with_options();
                                          *(unsigned char *)(v86 + 84) |= 2u;
                                          os_unfair_lock_unlock((os_unfair_lock_t)(v86 + 80));
                                          *(unsigned char *)(v86 + 84) |= 0x20u;
                                        }
                                        uint64_t v94 = [v93 countByEnumeratingWithState:&v184 objects:v191 count:16];
                                        if (!v94)
                                        {
LABEL_151:

                                          break;
                                        }
                                      }
                                    }

                                    v101 = [v165 objectForKeyedSubscript:v155];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v102 = (void *)[v101 copy];
                                      id v103 = v102;
                                      *(unsigned char *)(v86 + 84) |= 4u;
                                      *(unsigned char *)(v86 + 84) |= 0x20u;
                                      objc_storeStrong((id *)(v86 + 48), v102);
                                    }
                                  }
                                }
                                else
                                {
                                  uint64_t v86 = 0;
                                }
                                id v104 = (id)v86;
                                *(unsigned char *)(v171 + 76) |= 0x10u;
                                *(unsigned char *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 32), (id)v86);
                              }
                              v105 = [v170 objectForKeyedSubscript:v157];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v106 = [GEOPDWebLinkParams alloc];
                                if (v106)
                                {
                                  id v107 = v105;
                                  uint64_t v108 = [(GEOPDWebLinkParams *)v106 init];
                                  if (v108)
                                  {
                                    v109 = [v107 objectForKeyedSubscript:@"title"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v110 = (void *)[v109 copy];
                                      id v111 = v110;
                                      *(unsigned char *)(v108 + 64) |= 8u;
                                      *(unsigned char *)(v108 + 64) |= 0x20u;
                                      objc_storeStrong((id *)(v108 + 32), v110);
                                    }
                                    v112 = [v107 objectForKeyedSubscript:@"url"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v113 = (void *)[v112 copy];
                                      id v114 = v113;
                                      *(unsigned char *)(v108 + 64) |= 0x10u;
                                      *(unsigned char *)(v108 + 64) |= 0x20u;
                                      objc_storeStrong((id *)(v108 + 40), v113);
                                    }
                                    v115 = [v107 objectForKeyedSubscript:@"icon"];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      v116 = [GEOPDIcon alloc];
                                      if (v116) {
                                        v117 = (void *)-[GEOPDIcon _initWithDictionary:isJSON:](v116, v115, v153);
                                      }
                                      else {
                                        v117 = 0;
                                      }
                                      id v118 = v117;
                                      *(unsigned char *)(v108 + 64) |= 4u;
                                      *(unsigned char *)(v108 + 64) |= 0x20u;
                                      objc_storeStrong((id *)(v108 + 24), v117);
                                    }
                                    v119 = [v107 objectForKeyedSubscript:v147];
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      char v120 = [v119 BOOLValue];
                                      *(unsigned char *)(v108 + 64) |= 0x20u;
                                      *(unsigned char *)(v108 + 64) |= 1u;
                                      *(unsigned char *)(v108 + 60) = v120;
                                    }
                                  }
                                }
                                else
                                {
                                  uint64_t v108 = 0;
                                }
                                id v121 = (id)v108;
                                *(unsigned char *)(v171 + 76) |= 0x40u;
                                *(unsigned char *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 48), (id)v108);
                              }
                              v122 = [v170 objectForKeyedSubscript:v156];
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                int v123 = [v122 unsignedIntValue];
                                *(unsigned char *)(v171 + 76) |= 0x80u;
                                *(unsigned char *)(v171 + 76) |= 2u;
                                *(_DWORD *)(v171 + 72) = v123;
                              }
                            }
                            -[GEOPDActionLink addLink:](v163, (void *)v171);
                          }
                          else
                          {
                            uint64_t v171 = 0;
                            -[GEOPDActionLink addLink:](v163, 0);
                          }
                        }
                        uint64_t v41 = v169 + 1;
                      }
                      while (v169 + 1 != v167);
                      uint64_t v124 = [v164 countByEnumeratingWithState:&v180 objects:v190 count:16];
                      uint64_t v167 = v124;
                    }
                    while (v124);
                  }
                }
              }

              -[GEOPDActionData addActionLink:](v152, (void *)v163);
            }
            else
            {
              uint64_t v163 = 0;
              -[GEOPDActionData addActionLink:](v152, 0);
            }
          }
          uint64_t v34 = v146 + 1;
        }
        while (v146 + 1 != v144);
        uint64_t v125 = [obj countByEnumeratingWithState:&v172 objects:v188 count:16];
        uint64_t v144 = v125;
        if (!v125)
        {
LABEL_195:

          break;
        }
      }
    }

    if (v153) {
      v126 = @"winningAdamId";
    }
    else {
      v126 = @"winning_adam_id";
    }
    v127 = [v140 objectForKeyedSubscript:v126];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v128 = (void *)[v127 copy];
      id v129 = v128;
      *(unsigned char *)(v152 + 84) |= 0x40u;
      *(unsigned char *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 64), v128);
    }
    if (v153) {
      v130 = @"categoryId";
    }
    else {
      v130 = @"category_id";
    }
    v131 = [v140 objectForKeyedSubscript:v130];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v132 = (void *)[v131 copy];
      id v133 = v132;
      *(unsigned char *)(v152 + 84) |= 0x10u;
      *(unsigned char *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 48), v132);
    }
    if (v153) {
      v134 = @"ownerAdamId";
    }
    else {
      v134 = @"owner_adam_id";
    }
    v135 = [v140 objectForKeyedSubscript:v134];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v136 = (void *)[v135 copy];
      id v137 = v136;
      *(unsigned char *)(v152 + 84) |= 0x20u;
      *(unsigned char *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 56), v136);
    }
    id v5 = v140;
  }

  return v152;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDActionDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 1u))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDActionData readAll:]((uint64_t)self, 0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_actionTitles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    if (self->_actionSymbolImageName) {
      PBDataWriterWriteStringField();
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = self->_actionLinks;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_winningAdamId) {
      PBDataWriterWriteStringField();
    }
    if (self->_categoryId) {
      PBDataWriterWriteStringField();
    }
    if (self->_ownerAdamId) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDActionDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDActionData readAll:]((uint64_t)self, 0);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = self->_actionTitles;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v11) copyWithZone:a3];
        -[GEOPDActionData addActionTitle:](v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_actionSymbolImageName copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v15 = self->_actionLinks;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (void)v27);
        -[GEOPDActionData addActionLink:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_winningAdamId copyWithZone:a3];
  long long v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  uint64_t v22 = [(NSString *)self->_categoryId copyWithZone:a3];
  long long v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  uint64_t v24 = [(NSString *)self->_ownerAdamId copyWithZone:a3];
  v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDActionData readAll:]((uint64_t)self, 1),
         -[GEOPDActionData readAll:]((uint64_t)v4, 1),
         actionTitles = self->_actionTitles,
         !((unint64_t)actionTitles | v4[5]))
     || -[NSMutableArray isEqual:](actionTitles, "isEqual:"))
    && ((actionSymbolImageName = self->_actionSymbolImageName, !((unint64_t)actionSymbolImageName | v4[4]))
     || -[NSString isEqual:](actionSymbolImageName, "isEqual:"))
    && ((actionLinks = self->_actionLinks, !((unint64_t)actionLinks | v4[3]))
     || -[NSMutableArray isEqual:](actionLinks, "isEqual:"))
    && ((winningAdamId = self->_winningAdamId, !((unint64_t)winningAdamId | v4[8]))
     || -[NSString isEqual:](winningAdamId, "isEqual:"))
    && ((categoryId = self->_categoryId, !((unint64_t)categoryId | v4[6]))
     || -[NSString isEqual:](categoryId, "isEqual:")))
  {
    ownerAdamId = self->_ownerAdamId;
    if ((unint64_t)ownerAdamId | v4[7]) {
      char v11 = -[NSString isEqual:](ownerAdamId, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDActionData readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_actionTitles hash];
  NSUInteger v4 = [(NSString *)self->_actionSymbolImageName hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_actionLinks hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_winningAdamId hash];
  NSUInteger v7 = [(NSString *)self->_categoryId hash];
  return v6 ^ v7 ^ [(NSString *)self->_ownerAdamId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winningAdamId, 0);
  objc_storeStrong((id *)&self->_ownerAdamId, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);
  objc_storeStrong((id *)&self->_actionTitles, 0);
  objc_storeStrong((id *)&self->_actionSymbolImageName, 0);
  objc_storeStrong((id *)&self->_actionLinks, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end