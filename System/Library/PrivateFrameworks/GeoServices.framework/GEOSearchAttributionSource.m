@interface GEOSearchAttributionSource
- (BOOL)canLocallyHandleAction:(id *)a1 forComponent:(int)a2;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAction:(int)a3 forComponent:;
- (GEOSearchAttributionSource)init;
- (GEOSearchAttributionSource)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appAdamID;
- (id)attributionApps;
- (id)bestLocalizedAttribution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedAttributions;
- (id)sourceIdentifier;
- (id)supportedComponentActions;
- (id)webBaseActionURL;
- (uint64_t)attributionRequirementsAtIndex:(uint64_t)result;
- (uint64_t)suppressAttributionLogosAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsAttributionApps:(uint64_t)a1;
- (void)_addNoFlagsLocalizedAttribution:(uint64_t)a1;
- (void)_addNoFlagsSupportedComponentActions:(uint64_t)a1;
- (void)_readAppAdamID;
- (void)_readAttributionApps;
- (void)_readAttributionRequirements;
- (void)_readLocalizedAttributions;
- (void)_readSourceIdentifier;
- (void)_readSupportedComponentActions;
- (void)_readSuppressAttributionLogos;
- (void)_readWebBaseActionURL;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchAttributionSource

- (id)sourceIdentifier
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionSource _readSourceIdentifier]((uint64_t)a1);
    a1 = (id *)v2[12];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSourceIdentifier
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceIdentifier_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)bestLocalizedAttribution
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F1CA48];
    -[GEOSearchAttributionSource _readLocalizedAttributions]((uint64_t)a1);
    id v3 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(a1[11], "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v27 = a1;
    v4 = -[GEOSearchAttributionSource localizedAttributions](a1);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if (v10
            && (-[GEOLocalizedAttribution _readLanguage](*(void *)(*((void *)&v33 + 1) + 8 * i)),
                *(void *)(v10 + 40))
            && (-[GEOLocalizedAttribution language]((id *)v10),
                v11 = objc_claimAutoreleasedReturnValue(),
                uint64_t v12 = objc_msgSend(v11, "length", v27),
                v11,
                v12))
          {
            v13 = -[GEOLocalizedAttribution language]((id *)v10);
            [v3 addObject:v13];
          }
          else if (!v7)
          {
            id v7 = (id)v10;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }

    v14 = (void *)MEMORY[0x1E4F1CA20];
    v15 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v16 = [v14 mostPreferredLanguageOf:v3 withPreferredLanguages:v15 forUsage:1 options:0];

    v28 = (void *)v16;
    if (v16)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v17 = -[GEOSearchAttributionSource localizedAttributions](v27);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
            if (v22)
            {
              -[GEOLocalizedAttribution _readLanguage](*(void *)(*((void *)&v29 + 1) + 8 * j));
              if (*(void *)(v22 + 40))
              {
                v23 = -[GEOLocalizedAttribution language]((id *)v22);
                char v24 = [v23 isEqualToString:v28];

                if (v24)
                {
                  id v25 = (id)v22;

                  goto LABEL_31;
                }
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
    }
    id v25 = v7;
LABEL_31:
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)localizedAttributions
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionSource _readLocalizedAttributions]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLocalizedAttributions
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedAttributions_tags_392);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_addNoFlagsLocalizedAttribution:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOSearchAttributionSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSearchAttributionSource;
  v2 = [(GEOSearchAttributionSource *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsAttributionApps:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readAttributionRequirements
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributionRequirements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (uint64_t)attributionRequirementsAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOSearchAttributionSource _readAttributionRequirements](result);
    unint64_t v4 = *(void *)(v3 + 32);
    if (v4 <= a2)
    {
      id v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 24) + 4 * a2);
  }
  return result;
}

- (BOOL)supportsAction:(int)a3 forComponent:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = -[GEOSearchAttributionSource supportedComponentActions](a1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v10 && (*(unsigned char *)(v10 + 48) & 1) != 0) {
          int v11 = *(_DWORD *)(v10 + 40);
        }
        else {
          int v11 = 0;
        }
        if (v11 == a3)
        {
          unint64_t v14 = 0;
          do
          {
            if (v10) {
              unint64_t v15 = *(void *)(v10 + 24);
            }
            else {
              unint64_t v15 = 0;
            }
            BOOL v12 = v14 < v15;
            if (v14 >= v15) {
              break;
            }
            int v16 = -[GEOComponentAction actionsAtIndex:](v10, v14++);
          }
          while (v16 != a2);
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (id)supportedComponentActions
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionSource _readSupportedComponentActions]((uint64_t)a1);
    a1 = (id *)v2[13];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSupportedComponentActions
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedComponentActions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)webBaseActionURL
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionSource _readWebBaseActionURL]((uint64_t)a1);
    a1 = (id *)v2[14];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readWebBaseActionURL
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebBaseActionURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)attributionApps
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionSource _readAttributionApps]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAttributionApps
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributionApps_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOSearchAttributionSource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSearchAttributionSource;
  id v3 = [(GEOSearchAttributionSource *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOSearchAttributionSource;
  [(GEOSearchAttributionSource *)&v3 dealloc];
}

- (void)_addNoFlagsSupportedComponentActions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      unint64_t v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readAppAdamID
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppAdamID_tags_396);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (id)appAdamID
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionSource _readAppAdamID]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSuppressAttributionLogos
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
        GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuppressAttributionLogos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (uint64_t)suppressAttributionLogosAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOSearchAttributionSource _readSuppressAttributionLogos](result);
    unint64_t v4 = *(void *)(v3 + 56);
    if (v4 <= a2)
    {
      id v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 48) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttributionSource;
  unint64_t v4 = [(GEOSearchAttributionSource *)&v8 description];
  id v5 = [(GEOSearchAttributionSource *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchAttributionSource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOSearchAttributionSource readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOSearchAttributionSource sourceIdentifier]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"sourceIdentifier"];
    }

    uint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 132)];
    [v4 setObject:v6 forKey:@"sourceVersion"];

    if ([*(id *)(a1 + 88) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v8 = *(id *)(a1 + 88);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v65 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            unint64_t v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"localizedAttribution"];
    }
    if (*(void *)(a1 + 32))
    {
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      int v16 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v17 = 0;
        do
        {
          uint64_t v18 = *(unsigned int *)(*v16 + 4 * v17);
          if ((v18 - 1) >= 6)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
            long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v19 = off_1E53E8080[(int)v18 - 1];
          }
          [v15 addObject:v19];

          ++v17;
          int v16 = (void *)(a1 + 24);
        }
        while (v17 < *(void *)(a1 + 32));
      }
      [v4 setObject:v15 forKey:@"attributionRequirements"];
    }
    if ([*(id *)(a1 + 80) count])
    {
      long long v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v21 = *(id *)(a1 + 80);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v61 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v23);
      }

      [v4 setObject:v20 forKey:@"attributionApps"];
    }
    v28 = -[GEOSearchAttributionSource webBaseActionURL]((id *)a1);
    if (v28) {
      [v4 setObject:v28 forKey:@"webBaseActionURL"];
    }

    if ([*(id *)(a1 + 104) count])
    {
      long long v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v30 = *(id *)(a1 + 104);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v57 != v33) {
              objc_enumerationMutation(v30);
            }
            long long v35 = *(void **)(*((void *)&v56 + 1) + 8 * k);
            if (a2) {
              [v35 jsonRepresentation];
            }
            else {
            long long v36 = [v35 dictionaryRepresentation];
            }
            [v29 addObject:v36];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v32);
      }

      [v4 setObject:v29 forKey:@"supportedComponentActions"];
    }
    if ((*(_WORD *)(a1 + 140) & 2) != 0)
    {
      v37 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 137)];
      [v4 setObject:v37 forKey:@"enforceAppStore"];
    }
    v38 = -[GEOSearchAttributionSource appAdamID]((id *)a1);
    if (v38) {
      [v4 setObject:v38 forKey:@"appAdamID"];
    }

    if (*(void *)(a1 + 56))
    {
      uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v40 = (void *)(a1 + 48);
      if (*(void *)(a1 + 56))
      {
        unint64_t v41 = 0;
        do
        {
          uint64_t v42 = *(int *)(*v40 + 4 * v41);
          if (v42 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v42);
            v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v43 = off_1E53E80B0[v42];
          }
          [v39 addObject:v43];

          ++v41;
          v40 = (void *)(a1 + 48);
        }
        while (v41 < *(void *)(a1 + 56));
      }
      [v4 setObject:v39 forKey:@"suppressAttributionLogos"];
    }
    __int16 v44 = *(_WORD *)(a1 + 140);
    if ((v44 & 4) != 0)
    {
      v45 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 138)];
      [v4 setObject:v45 forKey:@"requiresAttributionInPhotoViewerHeader"];

      __int16 v44 = *(_WORD *)(a1 + 140);
    }
    if (v44)
    {
      v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 136)];
      [v4 setObject:v46 forKey:@"devPlaceCardAttr"];
    }
    v47 = *(void **)(a1 + 16);
    if (v47)
    {
      v48 = [v47 dictionaryRepresentation];
      v49 = v48;
      if (a2)
      {
        v50 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __56__GEOSearchAttributionSource__dictionaryRepresentation___block_invoke;
        v54[3] = &unk_1E53D8860;
        id v51 = v50;
        id v55 = v51;
        [v49 enumerateKeysAndObjectsUsingBlock:v54];
        id v52 = v51;

        v49 = v52;
      }
      [v4 setObject:v49 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSearchAttributionSource _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_427;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_428;
      }
      GEOSearchAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOSearchAttributionSourceCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

void __56__GEOSearchAttributionSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchAttributionSourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), __int16 v6 = (__int16)self->_flags, (v6 & 0x1FF0) == 0))
  {
    if ((v6 & 0x80) != 0)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v22 = self->_attributionApps;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v22);
            }
            if (GEOAttributionAppIsDirty(*(void *)(*((void *)&v40 + 1) + 8 * i)))
            {

              goto LABEL_3;
            }
          }
          uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v40 objects:v47 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
    }
    v26 = self->_reader;
    objc_sync_enter(v26);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v27 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v27];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v26);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSearchAttributionSource readAll:]((uint64_t)self, 0);
    PBDataWriterWriteStringField();
    PBDataWriterWriteUint32Field();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = self->_localizedAttributions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v8);
    }

    if (self->_attributionRequirements.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_attributionRequirements.count);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    BOOL v12 = self->_attributionApps;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t k = 0; k != v13; ++k)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v13);
    }

    if (self->_webBaseActionURL) {
      PBDataWriterWriteStringField();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v16 = self->_supportedComponentActions;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t m = 0; m != v17; ++m)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v16);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v44 count:16];
      }
      while (v17);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_appAdamID) {
      PBDataWriterWriteStringField();
    }
    if (self->_suppressAttributionLogos.count)
    {
      unint64_t v20 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v20;
      }
      while (v20 < self->_suppressAttributionLogos.count);
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v28);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v38 = 128;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v8 = self;
    uint64_t v9 = reader;
    objc_sync_enter(v9);
    if ((*(_WORD *)&v8->_flags & 0x1000) == 0)
    {
      *(void *)((char *)v8->_reader + (int)*MEMORY[0x1E4F940E0]) = v8->_readerMarkLength;
      [(PBDataReader *)v8->_reader seekToOffset:v8->_readerMarkPos];
      GEOSearchAttributionSourceReadAllFrom(v5, v8->_reader, 0);
      os_unfair_lock_unlock(p_readerLock);
      id v10 = (id)v5;
      objc_sync_exit(v9);

      goto LABEL_35;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOSearchAttributionSource readAll:]((uint64_t)self, 0);
  uint64_t v11 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  BOOL v12 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v11;

  *(_DWORD *)(v5 + 132) = self->_sourceVersion;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v39 = self;
  uint64_t v13 = self->_localizedAttributions;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v49 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = (id)objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "copyWithZone:", a3, v38);
        -[GEOSearchAttributionSource _readLocalizedAttributions](v5);
        -[GEOSearchAttributionSource _addNoFlagsLocalizedAttribution:](v5, v17);

        os_unfair_lock_lock_with_options();
        *(_WORD *)(v5 + 140) |= 0x100u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 128));
        *(_WORD *)(v5 + 140) |= 0x1000u;
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v14);
  }

  PBRepeatedInt32Copy();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v18 = v39->_attributionApps;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * j) copyWithZone:a3];
        uint64_t v23 = v22;
        if (v5)
        {
          id v24 = v22;
          -[GEOSearchAttributionSource _readAttributionApps](v5);
          -[GEOSearchAttributionSource _addNoFlagsAttributionApps:](v5, v24);

          os_unfair_lock_lock_with_options();
          *(_WORD *)(v5 + 140) |= 0x80u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + v38));
          *(_WORD *)(v5 + 140) |= 0x1000u;
        }
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v19);
  }

  uint64_t v25 = [(NSString *)v39->_webBaseActionURL copyWithZone:a3];
  v26 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v25;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v27 = v39->_supportedComponentActions;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v41;
    long long v30 = (os_unfair_lock_s *)(v5 + v38);
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v27);
        }
        id v32 = (id)objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * k), "copyWithZone:", a3, v38);
        -[GEOSearchAttributionSource _readSupportedComponentActions](v5);
        -[GEOSearchAttributionSource _addNoFlagsSupportedComponentActions:](v5, v32);

        os_unfair_lock_lock_with_options();
        *(_WORD *)(v5 + 140) |= 0x400u;
        os_unfair_lock_unlock(v30);
        *(_WORD *)(v5 + 140) |= 0x1000u;
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v28);
  }

  if ((*(_WORD *)&v39->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 137) = v39->_enforceAppStore;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  uint64_t v33 = -[NSString copyWithZone:](v39->_appAdamID, "copyWithZone:", a3, v38);
  long long v34 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v33;

  PBRepeatedInt32Copy();
  __int16 flags = (__int16)v39->_flags;
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 138) = v39->_requiresAttributionInPhotoViewerHeader;
    *(_WORD *)(v5 + 140) |= 4u;
    __int16 flags = (__int16)v39->_flags;
  }
  if (flags)
  {
    *(unsigned char *)(v5 + 136) = v39->_devPlaceCardAttr;
    *(_WORD *)(v5 + 140) |= 1u;
  }
  long long v36 = v39->_unknownFields;
  id v10 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v36;
LABEL_35:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  -[GEOSearchAttributionSource readAll:]((uint64_t)self, 1);
  -[GEOSearchAttributionSource readAll:]((uint64_t)v4, 1);
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if (self->_sourceVersion != *((_DWORD *)v4 + 33)) {
    goto LABEL_35;
  }
  localizedAttributions = self->_localizedAttributions;
  if ((unint64_t)localizedAttributions | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](localizedAttributions, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_35;
  }
  attributionApps = self->_attributionApps;
  if ((unint64_t)attributionApps | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](attributionApps, "isEqual:")) {
      goto LABEL_35;
    }
  }
  webBaseActionURL = self->_webBaseActionURL;
  if ((unint64_t)webBaseActionURL | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](webBaseActionURL, "isEqual:")) {
      goto LABEL_35;
    }
  }
  supportedComponentActions = self->_supportedComponentActions;
  if ((unint64_t)supportedComponentActions | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](supportedComponentActions, "isEqual:")) {
      goto LABEL_35;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 70);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_35;
    }
    if (self->_enforceAppStore)
    {
      if (!*((unsigned char *)v4 + 137)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 137))
    {
      goto LABEL_35;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_35;
  }
  appAdamID = self->_appAdamID;
  if ((unint64_t)appAdamID | *((void *)v4 + 9) && !-[NSString isEqual:](appAdamID, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_35;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v13 = *((_WORD *)v4 + 70);
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0) {
      goto LABEL_35;
    }
    if (self->_requiresAttributionInPhotoViewerHeader)
    {
      if (!*((unsigned char *)v4 + 138)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 138))
    {
      goto LABEL_35;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_35;
  }
  BOOL v14 = (v13 & 1) == 0;
  if (flags)
  {
    if (v13)
    {
      if (self->_devPlaceCardAttr)
      {
        if (!*((unsigned char *)v4 + 136)) {
          goto LABEL_35;
        }
      }
      else if (*((unsigned char *)v4 + 136))
      {
        goto LABEL_35;
      }
      BOOL v14 = 1;
      goto LABEL_36;
    }
LABEL_35:
    BOOL v14 = 0;
  }
LABEL_36:

  return v14;
}

- (unint64_t)hash
{
  -[GEOSearchAttributionSource readAll:]((uint64_t)self, 1);
  NSUInteger v16 = [(NSString *)self->_sourceIdentifier hash];
  unsigned int sourceVersion = self->_sourceVersion;
  uint64_t v4 = [(NSMutableArray *)self->_localizedAttributions hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = [(NSMutableArray *)self->_attributionApps hash];
  NSUInteger v7 = [(NSString *)self->_webBaseActionURL hash];
  uint64_t v8 = [(NSMutableArray *)self->_supportedComponentActions hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_enforceAppStore;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_appAdamID hash];
  uint64_t v11 = PBRepeatedInt32Hash();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v13 = 2654435761 * self->_requiresAttributionInPhotoViewerHeader;
    if (flags) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v14 = 0;
    return (2654435761 * sourceVersion) ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v14 = 2654435761 * self->_devPlaceCardAttr;
  return (2654435761 * sourceVersion) ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webBaseActionURL, 0);
  objc_storeStrong((id *)&self->_supportedComponentActions, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedAttributions, 0);
  objc_storeStrong((id *)&self->_attributionApps, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)canLocallyHandleAction:(id *)a1 forComponent:(int)a2
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = -[GEOSearchAttributionSource supportedComponentActions](a1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
      if (v8)
      {
        if ((*(unsigned char *)(v8 + 48) & 1) != 0 && *(_DWORD *)(v8 + 40) == 1) {
          break;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
    if (!*(void *)(v8 + 24))
    {
LABEL_17:
      BOOL v9 = *(unsigned char *)(v8 + 44) != 0;
      goto LABEL_18;
    }
    unint64_t v10 = 0;
    while (v10 < *(void *)(v8 + 24))
    {
      int v11 = -[GEOComponentAction actionsAtIndex:](v8, v10++);
      if (v11 == a2) {
        goto LABEL_17;
      }
    }
  }
LABEL_12:
  BOOL v9 = 0;
LABEL_18:

  return v9;
}

@end