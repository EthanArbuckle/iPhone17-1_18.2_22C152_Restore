@interface GEOPDPlaceSummaryResultLayoutTemplatePair
+ (BOOL)isValid:(id)a3;
+ (Class)mapsIdType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLayoutTemplate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplate)layoutTemplate;
- (GEOPDPlaceSummaryResultLayoutTemplatePair)init;
- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithData:(id)a3;
- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithJSON:(id)a3;
- (NSArray)geoMapItemPlaceTypes;
- (NSArray)mapItemIdentifiers;
- (NSMutableArray)mapsIds;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapsIdAtIndex:(unint64_t)a3;
- (id)placeTypesAsString:(int)a3;
- (int)StringAsPlaceTypes:(id)a3;
- (int)placeTypeAtIndex:(unint64_t)a3;
- (int)placeTypes;
- (unint64_t)hash;
- (unint64_t)mapsIdsCount;
- (unint64_t)placeTypesCount;
- (void)_addNoFlagsMapsId:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLayoutTemplate;
- (void)_readMapsIds;
- (void)_readPlaceTypes;
- (void)addMapsId:(id)a3;
- (void)addPlaceType:(int)a3;
- (void)clearMapsIds;
- (void)clearPlaceTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLayoutTemplate:(id)a3;
- (void)setMapsIds:(id)a3;
- (void)setPlaceTypes:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryResultLayoutTemplatePair

- (id)mapsIdAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  mapsIds = self->_mapsIds;

  return (id)[(NSMutableArray *)mapsIds objectAtIndex:a3];
}

- (void)_readMapsIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsIds_tags_1321);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOPDPlaceSummaryLayoutTemplate)layoutTemplate
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readLayoutTemplate]((uint64_t)self);
  layoutTemplate = self->_layoutTemplate;

  return layoutTemplate;
}

- (BOOL)hasLayoutTemplate
{
  return self->_layoutTemplate != 0;
}

- (void)_readLayoutTemplate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLayoutTemplate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_addNoFlagsMapsId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPDPlaceSummaryResultLayoutTemplatePair)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  v2 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  id v3 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)&v7 initWithData:a3];
  v4 = v3;
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  [(GEOPDPlaceSummaryResultLayoutTemplatePair *)&v3 dealloc];
}

- (NSMutableArray)mapsIds
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  mapsIds = self->_mapsIds;

  return mapsIds;
}

- (void)setMapsIds:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  mapsIds = self->_mapsIds;
  self->_mapsIds = v4;
}

- (void)clearMapsIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  mapsIds = self->_mapsIds;

  [(NSMutableArray *)mapsIds removeAllObjects];
}

- (void)addMapsId:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _addNoFlagsMapsId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unint64_t)mapsIdsCount
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  mapsIds = self->_mapsIds;

  return [(NSMutableArray *)mapsIds count];
}

+ (Class)mapsIdType
{
  return (Class)objc_opt_class();
}

- (void)setLayoutTemplate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_layoutTemplate, a3);
}

- (void)_readPlaceTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)placeTypesCount
{
  return self->_placeTypes.count;
}

- (int)placeTypes
{
  return self->_placeTypes.list;
}

- (void)clearPlaceTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedInt32Clear();
}

- (void)addPlaceType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (int)placeTypeAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readPlaceTypes]((uint64_t)self);
  p_placeTypes = &self->_placeTypes;
  unint64_t count = self->_placeTypes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_placeTypes->list[a3];
}

- (void)setPlaceTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147390](&self->_placeTypes, a3, a4);
}

- (id)placeTypesAsString:(int)a3
{
  switch(a3)
  {
    case '#':
      id v4 = @"TIME_ZONE";
      break;
    case '$':
    case '%':
    case '&':
    case '\'':
    case '(':
    case ')':
    case '*':
    case '4':
    case '5':
    case '8':
    case ':':
    case ';':
    case '<':
    case '>':
LABEL_13:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      break;
    case '+':
      id v4 = @"SUB_LOCALITY";
      break;
    case ',':
      id v4 = @"OCEAN";
      break;
    case '-':
      id v4 = @"AOI";
      break;
    case '.':
      id v4 = @"INLAND_WATER";
      break;
    case '/':
      id v4 = @"BUSINESS";
      break;
    case '0':
      id v4 = @"ISLAND";
      break;
    case '1':
      id v4 = @"STREET";
      break;
    case '2':
      id v4 = @"ADMIN";
      break;
    case '3':
      id v4 = @"POSTAL";
      break;
    case '6':
      id v4 = @"INTERSECTION";
      break;
    case '7':
      id v4 = @"BUILDING";
      break;
    case '9':
      id v4 = @"ADDRESS";
      break;
    case '=':
      id v4 = @"CONTINENT";
      break;
    case '?':
      id v4 = @"REGION";
      break;
    case '@':
      id v4 = @"DIVISION";
      break;
    case 'A':
      id v4 = @"PHYSICAL_FEATURE";
      break;
    default:
      id v4 = @"UNKNOWN_PLACE_TYPE";
      switch(a3)
      {
        case 0:
          goto LABEL_14;
        case 1:
          id v4 = @"COUNTRY";
          break;
        case 2:
          id v4 = @"ADMINISTRATIVE_AREA";
          break;
        case 3:
          goto LABEL_13;
        case 4:
          id v4 = @"SUB_ADMINISTRATIVE_AREA";
          break;
        default:
          if (a3 != 16) {
            goto LABEL_13;
          }
          id v4 = @"LOCALITY";
          break;
      }
      break;
  }
  return v4;
}

- (int)StringAsPlaceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADMINISTRATIVE_AREA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCALITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"SUB_LOCALITY"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"OCEAN"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"AOI"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"INLAND_WATER"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"ISLAND"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"STREET"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"ADMIN"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"INTERSECTION"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"BUILDING"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"REGION"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"DIVISION"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
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
  v8.super_class = (Class)GEOPDPlaceSummaryResultLayoutTemplatePair;
  int v4 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)&v8 description];
  id v5 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryResultLayoutTemplatePair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 48) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v26 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"mapsId";
      }
      else {
        v13 = @"maps_id";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = [(id)a1 layoutTemplate];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"layoutTemplate";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"layout_template";
      }
      [v4 setObject:v16 forKey:v17];
    }
    if (*(void *)(a1 + 24))
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v19 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v20 = 0;
        do
        {
          uint64_t v21 = *(unsigned int *)(*v19 + 4 * v20);
          switch((int)v21)
          {
            case '#':
              v22 = @"TIME_ZONE";
              break;
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '4':
            case '5':
            case '8':
            case ':':
            case ';':
            case '<':
            case '>':
LABEL_31:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
            case '+':
              v22 = @"SUB_LOCALITY";
              break;
            case ',':
              v22 = @"OCEAN";
              break;
            case '-':
              v22 = @"AOI";
              break;
            case '.':
              v22 = @"INLAND_WATER";
              break;
            case '/':
              v22 = @"BUSINESS";
              break;
            case '0':
              v22 = @"ISLAND";
              break;
            case '1':
              v22 = @"STREET";
              break;
            case '2':
              v22 = @"ADMIN";
              break;
            case '3':
              v22 = @"POSTAL";
              break;
            case '6':
              v22 = @"INTERSECTION";
              break;
            case '7':
              v22 = @"BUILDING";
              break;
            case '9':
              v22 = @"ADDRESS";
              break;
            case '=':
              v22 = @"CONTINENT";
              break;
            case '?':
              v22 = @"REGION";
              break;
            case '@':
              v22 = @"DIVISION";
              break;
            case 'A':
              v22 = @"PHYSICAL_FEATURE";
              break;
            default:
              v22 = @"UNKNOWN_PLACE_TYPE";
              switch((int)v21)
              {
                case 0:
                  goto LABEL_50;
                case 1:
                  v22 = @"COUNTRY";
                  break;
                case 2:
                  v22 = @"ADMINISTRATIVE_AREA";
                  break;
                case 3:
                  goto LABEL_31;
                case 4:
                  v22 = @"SUB_ADMINISTRATIVE_AREA";
                  break;
                default:
                  if (v21 != 16) {
                    goto LABEL_31;
                  }
                  v22 = @"LOCALITY";
                  break;
              }
              break;
          }
LABEL_50:
          [v18 addObject:v22];

          ++v20;
          v19 = (void *)(a1 + 16);
        }
        while (v20 < *(void *)(a1 + 24));
      }
      if (a2) {
        v23 = @"placeType";
      }
      else {
        v23 = @"place_type";
      }
      [v4 setObject:v18 forKey:v23];
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
  return -[GEOPDPlaceSummaryResultLayoutTemplatePair _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryResultLayoutTemplatePair *)-[GEOPDPlaceSummaryResultLayoutTemplatePair _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)[a1 init];
    if (v6)
    {
      if (a3) {
        uint64_t v7 = @"mapsId";
      }
      else {
        uint64_t v7 = @"maps_id";
      }
      uint64_t v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      id v35 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v41 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v15 = [GEOPDMapsIdentifier alloc];
                if (a3) {
                  uint64_t v16 = [(GEOPDMapsIdentifier *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEOPDMapsIdentifier *)v15 initWithDictionary:v14];
                }
                v17 = (void *)v16;
                [v6 addMapsId:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
          }
          while (v11);
        }

        id v5 = v35;
      }

      if (a3) {
        v18 = @"layoutTemplate";
      }
      else {
        v18 = @"layout_template";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v20 = [GEOPDPlaceSummaryLayoutTemplate alloc];
        if (a3) {
          uint64_t v21 = [(GEOPDPlaceSummaryLayoutTemplate *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOPDPlaceSummaryLayoutTemplate *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [v6 setLayoutTemplate:v21];
      }
      if (a3) {
        v23 = @"placeType";
      }
      else {
        v23 = @"place_type";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v34 = v24;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (!v26) {
          goto LABEL_89;
        }
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v37;
        while (1)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void **)(*((void *)&v36 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v31 = v30;
              if ([v31 isEqualToString:@"UNKNOWN_PLACE_TYPE"])
              {
                uint64_t v32 = 0;
              }
              else if ([v31 isEqualToString:@"COUNTRY"])
              {
                uint64_t v32 = 1;
              }
              else if ([v31 isEqualToString:@"ADMINISTRATIVE_AREA"])
              {
                uint64_t v32 = 2;
              }
              else if ([v31 isEqualToString:@"SUB_ADMINISTRATIVE_AREA"])
              {
                uint64_t v32 = 4;
              }
              else if ([v31 isEqualToString:@"LOCALITY"])
              {
                uint64_t v32 = 16;
              }
              else if ([v31 isEqualToString:@"TIME_ZONE"])
              {
                uint64_t v32 = 35;
              }
              else if ([v31 isEqualToString:@"SUB_LOCALITY"])
              {
                uint64_t v32 = 43;
              }
              else if ([v31 isEqualToString:@"OCEAN"])
              {
                uint64_t v32 = 44;
              }
              else if ([v31 isEqualToString:@"AOI"])
              {
                uint64_t v32 = 45;
              }
              else if ([v31 isEqualToString:@"INLAND_WATER"])
              {
                uint64_t v32 = 46;
              }
              else if ([v31 isEqualToString:@"BUSINESS"])
              {
                uint64_t v32 = 47;
              }
              else if ([v31 isEqualToString:@"ISLAND"])
              {
                uint64_t v32 = 48;
              }
              else if ([v31 isEqualToString:@"STREET"])
              {
                uint64_t v32 = 49;
              }
              else if ([v31 isEqualToString:@"ADMIN"])
              {
                uint64_t v32 = 50;
              }
              else if ([v31 isEqualToString:@"POSTAL"])
              {
                uint64_t v32 = 51;
              }
              else if ([v31 isEqualToString:@"INTERSECTION"])
              {
                uint64_t v32 = 54;
              }
              else if ([v31 isEqualToString:@"BUILDING"])
              {
                uint64_t v32 = 55;
              }
              else if ([v31 isEqualToString:@"ADDRESS"])
              {
                uint64_t v32 = 57;
              }
              else if ([v31 isEqualToString:@"CONTINENT"])
              {
                uint64_t v32 = 61;
              }
              else if ([v31 isEqualToString:@"REGION"])
              {
                uint64_t v32 = 63;
              }
              else if ([v31 isEqualToString:@"DIVISION"])
              {
                uint64_t v32 = 64;
              }
              else if ([v31 isEqualToString:@"PHYSICAL_FEATURE"])
              {
                uint64_t v32 = 65;
              }
              else
              {
                uint64_t v32 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v32 = [v30 intValue];
            }
            objc_msgSend(v6, "addPlaceType:", v32, v34);
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (!v27)
          {
LABEL_89:

            v24 = v34;
            id v5 = v35;
            break;
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (GEOPDPlaceSummaryResultLayoutTemplatePair)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryResultLayoutTemplatePair *)-[GEOPDPlaceSummaryResultLayoutTemplatePair _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_1335;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1336;
    }
    GEOPDPlaceSummaryResultLayoutTemplatePairReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryResultLayoutTemplatePairCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryResultLayoutTemplatePairIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryResultLayoutTemplatePairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceSummaryResultLayoutTemplatePairIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self readAll:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = self->_mapsIds;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if (self->_layoutTemplate) {
      PBDataWriterWriteSubmessage();
    }
    p_placeTypes = &self->_placeTypes;
    if (p_placeTypes->count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < p_placeTypes->count);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readLayoutTemplate]((uint64_t)self);
  if ([(GEOPDPlaceSummaryLayoutTemplate *)self->_layoutTemplate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOPDPlaceSummaryResultLayoutTemplatePair _readMapsIds]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_mapsIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  unint64_t v11 = (id *)a3;
  [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDPlaceSummaryResultLayoutTemplatePair *)self mapsIdsCount])
  {
    [v11 clearMapsIds];
    unint64_t v4 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self mapsIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self mapsIdAtIndex:i];
        [v11 addMapsId:v7];
      }
    }
  }
  if (self->_layoutTemplate) {
    objc_msgSend(v11, "setLayoutTemplate:");
  }
  if ([(GEOPDPlaceSummaryResultLayoutTemplatePair *)self placeTypesCount])
  {
    [v11 clearPlaceTypes];
    unint64_t v8 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self placeTypesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v11, "addPlaceType:", -[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypeAtIndex:](self, "placeTypeAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceSummaryResultLayoutTemplatePairReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self readAll:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v8 = self->_mapsIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addMapsId:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOPDPlaceSummaryLayoutTemplate *)self->_layoutTemplate copyWithZone:a3];
  long long v14 = (void *)v5[5];
  v5[5] = v13;

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDPlaceSummaryResultLayoutTemplatePair *)self readAll:1],
         [v4 readAll:1],
         mapsIds = self->_mapsIds,
         !((unint64_t)mapsIds | v4[6]))
     || -[NSMutableArray isEqual:](mapsIds, "isEqual:"))
    && ((layoutTemplate = self->_layoutTemplate, !((unint64_t)layoutTemplate | v4[5]))
     || -[GEOPDPlaceSummaryLayoutTemplate isEqual:](layoutTemplate, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_mapsIds hash];
  unint64_t v4 = [(GEOPDPlaceSummaryLayoutTemplate *)self->_layoutTemplate hash] ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4[6];
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
        -[GEOPDPlaceSummaryResultLayoutTemplatePair addMapsId:](self, "addMapsId:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  layoutTemplate = self->_layoutTemplate;
  id v11 = v4[5];
  if (layoutTemplate)
  {
    if (v11) {
      -[GEOPDPlaceSummaryLayoutTemplate mergeFrom:](layoutTemplate, "mergeFrom:");
    }
  }
  else if (v11)
  {
    [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self setLayoutTemplate:"setLayoutTemplate:"];
  }
  uint64_t v12 = objc_msgSend(v4, "placeTypesCount", (void)v15);
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t j = 0; j != v13; ++j)
      -[GEOPDPlaceSummaryResultLayoutTemplatePair addPlaceType:](self, "addPlaceType:", [v4 placeTypeAtIndex:j]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsIds, 0);
  objc_storeStrong((id *)&self->_layoutTemplate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSArray)mapItemIdentifiers
{
  uint64_t v3 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self mapsIds];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__72;
    uint64_t v13 = __Block_byref_object_dispose__72;
    id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[GEOPDPlaceSummaryResultLayoutTemplatePair mapsIdsCount](self, "mapsIdsCount"));
    id v5 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self mapsIds];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__GEOPDPlaceSummaryResultLayoutTemplatePair_Extras__mapItemIdentifiers__block_invoke;
    v8[3] = &unk_1E53DF048;
    v8[4] = &v9;
    [v5 enumerateObjectsUsingBlock:v8];

    uint64_t v6 = (void *)[(id)v10[5] copy];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

void __71__GEOPDPlaceSummaryResultLayoutTemplatePair_Extras__mapItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (NSArray)geoMapItemPlaceTypes
{
  unint64_t v3 = [(GEOPDPlaceSummaryResultLayoutTemplatePair *)self placeTypesCount];
  if (v3)
  {
    unint64_t v4 = v3;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", _MapItemPlaceTypeForPDPlaceType(-[GEOPDPlaceSummaryResultLayoutTemplatePair placeTypeAtIndex:](self, "placeTypeAtIndex:", i)));
      [v5 addObject:v7];
    }
    uint64_t v8 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSArray *)v8;
}

@end