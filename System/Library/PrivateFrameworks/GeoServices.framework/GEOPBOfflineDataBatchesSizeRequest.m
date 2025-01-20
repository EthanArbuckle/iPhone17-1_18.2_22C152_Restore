@interface GEOPBOfflineDataBatchesSizeRequest
+ (BOOL)isValid:(id)a3;
+ (Class)supportedLanguageType;
- (BOOL)hasClientVersionModifier;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRegion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOMapRegion)region;
- (GEOPBOfflineDataBatchesSizeRequest)init;
- (GEOPBOfflineDataBatchesSizeRequest)initWithData:(id)a3;
- (GEOPBOfflineDataBatchesSizeRequest)initWithDictionary:(id)a3;
- (GEOPBOfflineDataBatchesSizeRequest)initWithJSON:(id)a3;
- (NSMutableArray)supportedLanguages;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)layersAsString:(int)a3;
- (id)supportedLanguageAtIndex:(unint64_t)a3;
- (int)StringAsLayers:(id)a3;
- (int)layers;
- (int)layersAtIndex:(unint64_t)a3;
- (unint64_t)clientVersionModifier;
- (unint64_t)hash;
- (unint64_t)layersCount;
- (unint64_t)supportedLanguagesCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1;
- (void)_readLayers;
- (void)_readRegion;
- (void)_readSupportedLanguages;
- (void)addLayers:(int)a3;
- (void)addSupportedLanguage:(id)a3;
- (void)clearLayers;
- (void)clearSupportedLanguages;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientVersionModifier:(unint64_t)a3;
- (void)setHasClientVersionModifier:(BOOL)a3;
- (void)setLayers:(int *)a3 count:(unint64_t)a4;
- (void)setRegion:(id)a3;
- (void)setSupportedLanguages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineDataBatchesSizeRequest

- (GEOPBOfflineDataBatchesSizeRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBOfflineDataBatchesSizeRequest;
  v2 = [(GEOPBOfflineDataBatchesSizeRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBOfflineDataBatchesSizeRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBOfflineDataBatchesSizeRequest;
  v3 = [(GEOPBOfflineDataBatchesSizeRequest *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPBOfflineDataBatchesSizeRequest;
  [(GEOPBOfflineDataBatchesSizeRequest *)&v3 dealloc];
}

- (void)_readRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataBatchesSizeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegion_tags_190);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasRegion
{
  return self->_region != 0;
}

- (GEOMapRegion)region
{
  -[GEOPBOfflineDataBatchesSizeRequest _readRegion]((uint64_t)self);
  region = self->_region;

  return region;
}

- (void)setRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_region, a3);
}

- (void)_readSupportedLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataBatchesSizeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedLanguages_tags_191);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)supportedLanguages
{
  -[GEOPBOfflineDataBatchesSizeRequest _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  supportedLanguages = self->_supportedLanguages;
  self->_supportedLanguages = v4;
}

- (void)clearSupportedLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  supportedLanguages = self->_supportedLanguages;

  [(NSMutableArray *)supportedLanguages removeAllObjects];
}

- (void)addSupportedLanguage:(id)a3
{
  id v4 = a3;
  -[GEOPBOfflineDataBatchesSizeRequest _readSupportedLanguages]((uint64_t)self);
  -[GEOPBOfflineDataBatchesSizeRequest _addNoFlagsSupportedLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)supportedLanguagesCount
{
  -[GEOPBOfflineDataBatchesSizeRequest _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return [(NSMutableArray *)supportedLanguages count];
}

- (id)supportedLanguageAtIndex:(unint64_t)a3
{
  -[GEOPBOfflineDataBatchesSizeRequest _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return (id)[(NSMutableArray *)supportedLanguages objectAtIndex:a3];
}

+ (Class)supportedLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readLayers
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBOfflineDataBatchesSizeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayers_tags_192);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)layersCount
{
  return self->_layers.count;
}

- (int)layers
{
  return self->_layers.list;
}

- (void)clearLayers
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedInt32Clear();
}

- (void)addLayers:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (int)layersAtIndex:(unint64_t)a3
{
  -[GEOPBOfflineDataBatchesSizeRequest _readLayers]((uint64_t)self);
  p_layers = &self->_layers;
  unint64_t count = self->_layers.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_layers->list[a3];
}

- (void)setLayers:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147390](&self->_layers, a3, a4);
}

- (id)layersAsString:(int)a3
{
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F7110[a3];
  }

  return v3;
}

- (int)StringAsLayers:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LAYER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LAYER_FARPOINT_METADATA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LAYER_POI_SEARCH_AND_PLACES"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LAYER_VECTOR_PARSEC_INDEX"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LAYER_REVGEO"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LAYER_VECTOR_PARSEC_DATA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LAYER_GEO_SEARCH"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LAYER_SEARCH_STATIC_CONTENT"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LAYER_VECTOR_TILE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LAYER_BROWSE_AND_CATEGORY_SEARCH"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LAYER_VECTOR_ASSET"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LAYER_SEARCH_ML_MODELS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V2"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V2_TRANSIT"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V2_TRAFFIC_INCIDENTS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LAYER_GEO_SEARCH_V2"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V3"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V3_METADATA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V3_TRANSIT"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"LAYER_ROUTING_V3_TRAFFIC_INCIDENTS"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)clientVersionModifier
{
  return self->_clientVersionModifier;
}

- (void)setClientVersionModifier:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_clientVersionModifier = a3;
}

- (void)setHasClientVersionModifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasClientVersionModifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineDataBatchesSizeRequest;
  int v4 = [(GEOPBOfflineDataBatchesSizeRequest *)&v8 description];
  id v5 = [(GEOPBOfflineDataBatchesSizeRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchesSizeRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 region];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"region"];
    }
    if (*(void *)(a1 + 56))
    {
      objc_super v8 = [(id)a1 supportedLanguages];
      if (a2) {
        v9 = @"supportedLanguage";
      }
      else {
        v9 = @"supported_language";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if (*(void *)(a1 + 24))
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v11 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v12 = 0;
        do
        {
          uint64_t v13 = *(int *)(*v11 + 4 * v12);
          if (v13 >= 0x15)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = off_1E53F7110[v13];
          }
          [v10 addObject:v14];

          ++v12;
          v11 = (void *)(a1 + 16);
        }
        while (v12 < *(void *)(a1 + 24));
      }
      [v4 setObject:v10 forKey:@"layers"];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v16 = @"clientVersionModifier";
      }
      else {
        v16 = @"client_version_modifier";
      }
      [v4 setObject:v15 forKey:v16];
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
  return -[GEOPBOfflineDataBatchesSizeRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPBOfflineDataBatchesSizeRequest)initWithDictionary:(id)a3
{
  return (GEOPBOfflineDataBatchesSizeRequest *)-[GEOPBOfflineDataBatchesRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPBOfflineDataBatchesSizeRequest)initWithJSON:(id)a3
{
  return (GEOPBOfflineDataBatchesSizeRequest *)-[GEOPBOfflineDataBatchesRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_193;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_194;
    }
    GEOPBOfflineDataBatchesSizeRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOMapRegion *)self->_region readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  int v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  objc_super v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        unint64_t v12 = *(void *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if (v16 != 2 || !PBReaderPlaceMark() || !GEOMapRegionIsValid((char *)a3)) {
            goto LABEL_56;
          }
          goto LABEL_22;
        case 2u:
          if (v16 == 2) {
            goto LABEL_24;
          }
          goto LABEL_56;
        case 3u:
          if (v16 == 2)
          {
            if (!PBReaderPlaceMark())
            {
LABEL_56:
              PBReaderRecallMark();
              return 0;
            }
LABEL_45:
            while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5))
            {
              unsigned int v29 = *((unsigned __int8 *)a3 + *v6);
              if (*((unsigned char *)a3 + *v6)) {
                break;
              }
              while (1)
              {
                uint64_t v30 = *v4;
                unint64_t v31 = *(void *)((char *)a3 + v30);
                if (v31 == -1 || v31 >= *(void *)((char *)a3 + *v5)) {
                  break;
                }
                unint64_t v32 = v31 + 1;
                int v33 = *(char *)(*(void *)((char *)a3 + *v7) + v31);
                *(void *)((char *)a3 + v30) = v32;
                if (v33 < 0)
                {
                  BOOL v14 = v29++ >= 9;
                  if (!v14) {
                    continue;
                  }
                }
                goto LABEL_45;
              }
              *((unsigned char *)a3 + *v6) = 1;
            }
LABEL_22:
            PBReaderRecallMark();
          }
          else
          {
            if ((v10 & 7) != 0) {
              goto LABEL_56;
            }
            while (1)
            {
              uint64_t v18 = *v4;
              unint64_t v19 = *(void *)((char *)a3 + v18);
              if (v19 == -1 || v19 >= *(void *)((char *)a3 + *v5)) {
                break;
              }
              unint64_t v20 = v19 + 1;
              int v21 = *(char *)(*(void *)((char *)a3 + *v7) + v19);
              *(void *)((char *)a3 + v18) = v20;
              if (v21 < 0)
              {
                unsigned int v22 = v16++;
                if (v22 <= 8) {
                  continue;
                }
              }
              goto LABEL_42;
            }
LABEL_41:
            *((unsigned char *)a3 + *v6) = 1;
          }
LABEL_42:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_54;
          }
          break;
        case 4u:
          if ((v10 & 7) != 0) {
            goto LABEL_56;
          }
          unsigned int v23 = 0;
          while (1)
          {
            uint64_t v24 = *v4;
            unint64_t v25 = *(void *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v5)) {
              goto LABEL_41;
            }
            unint64_t v26 = v25 + 1;
            int v27 = *(char *)(*(void *)((char *)a3 + *v7) + v25);
            *(void *)((char *)a3 + v24) = v26;
            if (v27 < 0 && v23++ <= 8) {
              continue;
            }
            goto LABEL_42;
          }
        default:
LABEL_24:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_56;
          }
          goto LABEL_42;
      }
    }
  }
LABEL_54:
  BOOL v34 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v34;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineDataBatchesSizeRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    unint64_t v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPBOfflineDataBatchesSizeRequest *)self readAll:0];
    if (self->_region) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_supportedLanguages;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_layers.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_layers.count);
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOPBOfflineDataBatchesSizeRequest _readRegion]((uint64_t)self);
  region = self->_region;

  return [(GEOMapRegion *)region hasGreenTeaWithValue:v3];
}

- (unsigned)requestTypeCode
{
  return 1029;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uint64_t v11 = (id *)a3;
  [(GEOPBOfflineDataBatchesSizeRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 16) = self->_readerMarkPos;
  *((_DWORD *)v11 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_region) {
    objc_msgSend(v11, "setRegion:");
  }
  if ([(GEOPBOfflineDataBatchesSizeRequest *)self supportedLanguagesCount])
  {
    [v11 clearSupportedLanguages];
    unint64_t v4 = [(GEOPBOfflineDataBatchesSizeRequest *)self supportedLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPBOfflineDataBatchesSizeRequest *)self supportedLanguageAtIndex:i];
        [v11 addSupportedLanguage:v7];
      }
    }
  }
  if ([(GEOPBOfflineDataBatchesSizeRequest *)self layersCount])
  {
    [v11 clearLayers];
    unint64_t v8 = [(GEOPBOfflineDataBatchesSizeRequest *)self layersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v11, "addLayers:", -[GEOPBOfflineDataBatchesSizeRequest layersAtIndex:](self, "layersAtIndex:", j));
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v11[5] = self->_clientVersionModifier;
    *((unsigned char *)v11 + 76) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
      GEOPBOfflineDataBatchesSizeRequestReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBOfflineDataBatchesSizeRequest *)self readAll:0];
  id v9 = [(GEOMapRegion *)self->_region copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = self->_supportedLanguages;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addSupportedLanguage:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  PBRepeatedInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 40) = self->_clientVersionModifier;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOPBOfflineDataBatchesSizeRequest *)self readAll:1];
  [v4 readAll:1];
  region = self->_region;
  if ((unint64_t)region | *((void *)v4 + 6))
  {
    if (!-[GEOMapRegion isEqual:](region, "isEqual:")) {
      goto LABEL_11;
    }
  }
  supportedLanguages = self->_supportedLanguages;
  if ((unint64_t)supportedLanguages | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](supportedLanguages, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_11;
  }
  BOOL v7 = (*((unsigned char *)v4 + 76) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) != 0 && self->_clientVersionModifier == *((void *)v4 + 5))
    {
      BOOL v7 = 1;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v7 = 0;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPBOfflineDataBatchesSizeRequest *)self readAll:1];
  unint64_t v3 = [(GEOMapRegion *)self->_region hash];
  uint64_t v4 = [(NSMutableArray *)self->_supportedLanguages hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    unint64_t v6 = 2654435761u * self->_clientVersionModifier;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  region = self->_region;
  uint64_t v6 = *((void *)v4 + 6);
  if (region)
  {
    if (v6) {
      -[GEOMapRegion mergeFrom:](region, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOPBOfflineDataBatchesSizeRequest setRegion:](self, "setRegion:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *((id *)v4 + 7);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOPBOfflineDataBatchesSizeRequest addSupportedLanguage:](self, "addSupportedLanguage:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [v4 layersCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[GEOPBOfflineDataBatchesSizeRequest addLayers:](self, "addLayers:", objc_msgSend(v4, "layersAtIndex:", j, (void)v15));
  }
  if (*((unsigned char *)v4 + 76))
  {
    self->_clientVersionModifier = *((void *)v4 + 5);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end