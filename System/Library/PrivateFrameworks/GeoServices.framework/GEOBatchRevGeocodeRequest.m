@interface GEOBatchRevGeocodeRequest
+ (BOOL)isValid:(id)a3;
+ (Class)locationType;
+ (Class)serviceTagType;
- (BOOL)hasDeviceCountryCode;
- (BOOL)hasDeviceSku;
- (BOOL)hasDisplayRegion;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOBatchRevGeocodeRequest)init;
- (GEOBatchRevGeocodeRequest)initWithData:(id)a3;
- (GEOBatchRevGeocodeRequest)initWithDictionary:(id)a3;
- (GEOBatchRevGeocodeRequest)initWithJSON:(id)a3;
- (NSMutableArray)locations;
- (NSMutableArray)serviceTags;
- (NSString)deviceCountryCode;
- (NSString)deviceSku;
- (NSString)displayRegion;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)additionalPlaceTypesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locationAtIndex:(unint64_t)a3;
- (id)serviceTagAtIndex:(unint64_t)a3;
- (int)StringAsAdditionalPlaceTypes:(id)a3;
- (int)additionalPlaceTypeAtIndex:(unint64_t)a3;
- (int)additionalPlaceTypes;
- (unint64_t)additionalPlaceTypesCount;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (unint64_t)serviceTagsCount;
- (unsigned)requestTypeCode;
- (void)_addNoFlagsLocation:(uint64_t)a1;
- (void)_addNoFlagsServiceTag:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAdditionalPlaceTypes;
- (void)_readDeviceCountryCode;
- (void)_readDeviceSku;
- (void)_readDisplayRegion;
- (void)_readLocations;
- (void)_readServiceTags;
- (void)addAdditionalPlaceType:(int)a3;
- (void)addLocation:(id)a3;
- (void)addServiceTag:(id)a3;
- (void)clearAdditionalPlaceTypes;
- (void)clearLocations;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearServiceTags;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAdditionalPlaceTypes:(int *)a3 count:(unint64_t)a4;
- (void)setDeviceCountryCode:(id)a3;
- (void)setDeviceSku:(id)a3;
- (void)setDisplayRegion:(id)a3;
- (void)setLocations:(id)a3;
- (void)setServiceTags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOBatchRevGeocodeRequest

- (GEOBatchRevGeocodeRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOBatchRevGeocodeRequest;
  v2 = [(GEOBatchRevGeocodeRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOBatchRevGeocodeRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOBatchRevGeocodeRequest;
  v3 = [(GEOBatchRevGeocodeRequest *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOBatchRevGeocodeRequest;
  [(GEOBatchRevGeocodeRequest *)&v3 dealloc];
}

- (void)_readLocations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocations_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)locations
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  locations = self->_locations;

  return locations;
}

- (void)setLocations:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  locations = self->_locations;
  self->_locations = v4;
}

- (void)clearLocations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  locations = self->_locations;

  [(NSMutableArray *)locations removeAllObjects];
}

- (void)addLocation:(id)a3
{
  id v4 = a3;
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  -[GEOBatchRevGeocodeRequest _addNoFlagsLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsLocation:(uint64_t)a1
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

- (unint64_t)locationsCount
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  locations = self->_locations;

  return [(NSMutableArray *)locations count];
}

- (id)locationAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  locations = self->_locations;

  return (id)[(NSMutableArray *)locations objectAtIndex:a3];
}

+ (Class)locationType
{
  return (Class)objc_opt_class();
}

- (void)_readAdditionalPlaceTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAdditionalPlaceTypes_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)additionalPlaceTypesCount
{
  return self->_additionalPlaceTypes.count;
}

- (int)additionalPlaceTypes
{
  return self->_additionalPlaceTypes.list;
}

- (void)clearAdditionalPlaceTypes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedInt32Clear();
}

- (void)addAdditionalPlaceType:(int)a3
{
  if (self) {
    PBRepeatedInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (int)additionalPlaceTypeAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeRequest _readAdditionalPlaceTypes]((uint64_t)self);
  p_additionalPlaceTypes = &self->_additionalPlaceTypes;
  unint64_t count = self->_additionalPlaceTypes.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_additionalPlaceTypes->list[a3];
}

- (void)setAdditionalPlaceTypes:(int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147390](&self->_additionalPlaceTypes, a3, a4);
}

- (id)additionalPlaceTypesAsString:(int)a3
{
  if (a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        id v4 = @"DMA";
        break;
      case 'e':
        id v4 = @"CAT_10284_POSTAL";
        break;
      case 'f':
        id v4 = @"CAT_10285_CITY";
        break;
      case 'g':
        id v4 = @"CAT_10286_COUNTY";
        break;
      case 'h':
        id v4 = @"CAT_10287_STATE";
        break;
      case 'i':
        id v4 = @"CAT_10288_COUNTRY";
        break;
      case 'j':
        id v4 = @"CAT_10288_COUNTRY_CODE";
        break;
      case 'k':
        id v4 = @"CAT_10287_STATE_CODE";
        break;
      default:
        if (a3 == 1016)
        {
          id v4 = @"PERDU_CITY";
        }
        else
        {
LABEL_94:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_95:
        }
        break;
    }
  }
  else
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
      case '<':
      case '>':
      case '?':
      case '@':
        goto LABEL_94;
      case '+':
        id v4 = @"NEIGHBORHOOD";
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
        id v4 = @"POI";
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
      case ';':
        id v4 = @"ZCTAS";
        break;
      case '=':
        id v4 = @"CONTINENT";
        break;
      case 'A':
        id v4 = @"PHYSICAL_FEATURE";
        break;
      default:
        id v4 = @"PT_UNKNOWN";
        switch(a3)
        {
          case 0:
            goto LABEL_95;
          case 1:
            id v4 = @"COUNTRY";
            break;
          case 2:
            id v4 = @"STATE";
            break;
          case 3:
            goto LABEL_94;
          case 4:
            id v4 = @"COUNTY";
            break;
          default:
            if (a3 != 16) {
              goto LABEL_94;
            }
            id v4 = @"CITY";
            break;
        }
        break;
    }
  }
  return v4;
}

- (int)StringAsAdditionalPlaceTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PT_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COUNTY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CITY"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"TIME_ZONE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"NEIGHBORHOOD"])
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
  else if ([v3 isEqualToString:@"POI"])
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
  else if ([v3 isEqualToString:@"ZCTAS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"CONTINENT"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"PHYSICAL_FEATURE"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"PERDU_CITY"])
  {
    int v4 = 1016;
  }
  else if ([v3 isEqualToString:@"DMA"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"CAT_10284_POSTAL"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"CAT_10285_CITY"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"CAT_10286_COUNTY"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"CAT_10287_STATE_CODE"])
  {
    int v4 = 107;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDeviceCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceCountryCode
{
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOBatchRevGeocodeRequest _readDeviceCountryCode]((uint64_t)self);
  deviceCountryCode = self->_deviceCountryCode;

  return deviceCountryCode;
}

- (void)setDeviceCountryCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)_readDisplayRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayRegion_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDisplayRegion
{
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOBatchRevGeocodeRequest _readDisplayRegion]((uint64_t)self);
  displayRegion = self->_displayRegion;

  return displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readDeviceSku
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSku_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceSku
{
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOBatchRevGeocodeRequest _readDeviceSku]((uint64_t)self);
  deviceSku = self->_deviceSku;

  return deviceSku;
}

- (void)setDeviceSku:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (void)_readServiceTags
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOBatchRevGeocodeRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readServiceTags_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return serviceTags;
}

- (void)setServiceTags:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;
}

- (void)clearServiceTags
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  serviceTags = self->_serviceTags;

  [(NSMutableArray *)serviceTags removeAllObjects];
}

- (void)addServiceTag:(id)a3
{
  id v4 = a3;
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  -[GEOBatchRevGeocodeRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)serviceTagsCount
{
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return [(NSMutableArray *)serviceTags count];
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOBatchRevGeocodeRequest _readServiceTags]((uint64_t)self);
  serviceTags = self->_serviceTags;

  return (id)[(NSMutableArray *)serviceTags objectAtIndex:a3];
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOBatchRevGeocodeRequest;
  id v4 = [(GEOBatchRevGeocodeRequest *)&v8 description];
  id v5 = [(GEOBatchRevGeocodeRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOBatchRevGeocodeRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 64) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v6 = *(id *)(a1 + 64);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v38 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"location"];
    }
    if (*(void *)(a1 + 24))
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v14 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v15 = 0;
        do
        {
          uint64_t v16 = *(unsigned int *)(*v14 + 4 * v15);
          if ((int)v16 > 99)
          {
            switch((int)v16)
            {
              case 'd':
                v17 = @"DMA";
                break;
              case 'e':
                v17 = @"CAT_10284_POSTAL";
                break;
              case 'f':
                v17 = @"CAT_10285_CITY";
                break;
              case 'g':
                v17 = @"CAT_10286_COUNTY";
                break;
              case 'h':
                v17 = @"CAT_10287_STATE";
                break;
              case 'i':
                v17 = @"CAT_10288_COUNTRY";
                break;
              case 'j':
                v17 = @"CAT_10288_COUNTRY_CODE";
                break;
              case 'k':
                v17 = @"CAT_10287_STATE_CODE";
                break;
              default:
                if (v16 == 1016)
                {
                  v17 = @"PERDU_CITY";
                }
                else
                {
LABEL_28:
                  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
                  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                break;
            }
          }
          else
          {
            switch((int)v16)
            {
              case '#':
                v17 = @"TIME_ZONE";
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
              case '<':
              case '>':
              case '?':
              case '@':
                goto LABEL_28;
              case '+':
                v17 = @"NEIGHBORHOOD";
                break;
              case ',':
                v17 = @"OCEAN";
                break;
              case '-':
                v17 = @"AOI";
                break;
              case '.':
                v17 = @"INLAND_WATER";
                break;
              case '/':
                v17 = @"POI";
                break;
              case '0':
                v17 = @"ISLAND";
                break;
              case '1':
                v17 = @"STREET";
                break;
              case '2':
                v17 = @"ADMIN";
                break;
              case '3':
                v17 = @"POSTAL";
                break;
              case '6':
                v17 = @"INTERSECTION";
                break;
              case '7':
                v17 = @"BUILDING";
                break;
              case '9':
                v17 = @"ADDRESS";
                break;
              case ';':
                v17 = @"ZCTAS";
                break;
              case '=':
                v17 = @"CONTINENT";
                break;
              case 'A':
                v17 = @"PHYSICAL_FEATURE";
                break;
              default:
                v17 = @"PT_UNKNOWN";
                switch((int)v16)
                {
                  case 0:
                    goto LABEL_53;
                  case 1:
                    v17 = @"COUNTRY";
                    break;
                  case 2:
                    v17 = @"STATE";
                    break;
                  case 3:
                    goto LABEL_28;
                  case 4:
                    v17 = @"COUNTY";
                    break;
                  default:
                    if (v16 != 16) {
                      goto LABEL_28;
                    }
                    v17 = @"CITY";
                    break;
                }
                break;
            }
          }
LABEL_53:
          [v13 addObject:v17];

          ++v15;
          v14 = (void *)(a1 + 16);
        }
        while (v15 < *(void *)(a1 + 24));
      }
      [v4 setObject:v13 forKey:@"additionalPlaceType"];
    }
    v18 = [(id)a1 deviceCountryCode];
    if (v18)
    {
      if (a2) {
        v19 = @"deviceCountryCode";
      }
      else {
        v19 = @"device_country_code";
      }
      [v4 setObject:v18 forKey:v19];
    }

    v20 = [(id)a1 displayRegion];
    if (v20)
    {
      if (a2) {
        v21 = @"displayRegion";
      }
      else {
        v21 = @"display_region";
      }
      [v4 setObject:v20 forKey:v21];
    }

    v22 = [(id)a1 deviceSku];
    if (v22)
    {
      if (a2) {
        v23 = @"deviceSku";
      }
      else {
        v23 = @"device_sku";
      }
      [v4 setObject:v22 forKey:v23];
    }

    if ([*(id *)(a1 + 72) count])
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v25 = *(id *)(a1 + 72);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v34 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if (a2) {
              [v30 jsonRepresentation];
            }
            else {
            v31 = [v30 dictionaryRepresentation];
            }
            [v24 addObject:v31];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v27);
      }

      [v4 setObject:v24 forKey:@"serviceTag"];
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
  return -[GEOBatchRevGeocodeRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOBatchRevGeocodeRequest)initWithDictionary:(id)a3
{
  return (GEOBatchRevGeocodeRequest *)-[GEOBatchRevGeocodeRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)[a1 init];
    if (v6)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      id v47 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v57 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOLocation alloc];
                if (a3) {
                  uint64_t v15 = [(GEOLocation *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOLocation *)v14 initWithDictionary:v13];
                }
                uint64_t v16 = (void *)v15;
                [v6 addLocation:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v56 objects:v62 count:16];
          }
          while (v10);
        }

        id v5 = v47;
      }

      v17 = [v5 objectForKeyedSubscript:@"additionalPlaceType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v46 = v17;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (!v19) {
          goto LABEL_91;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v53;
        while (1)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v53 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v24 = v23;
              if ([v24 isEqualToString:@"PT_UNKNOWN"])
              {
                uint64_t v25 = 0;
              }
              else if ([v24 isEqualToString:@"COUNTRY"])
              {
                uint64_t v25 = 1;
              }
              else if ([v24 isEqualToString:@"STATE"])
              {
                uint64_t v25 = 2;
              }
              else if ([v24 isEqualToString:@"COUNTY"])
              {
                uint64_t v25 = 4;
              }
              else if ([v24 isEqualToString:@"CITY"])
              {
                uint64_t v25 = 16;
              }
              else if ([v24 isEqualToString:@"TIME_ZONE"])
              {
                uint64_t v25 = 35;
              }
              else if ([v24 isEqualToString:@"NEIGHBORHOOD"])
              {
                uint64_t v25 = 43;
              }
              else if ([v24 isEqualToString:@"OCEAN"])
              {
                uint64_t v25 = 44;
              }
              else if ([v24 isEqualToString:@"AOI"])
              {
                uint64_t v25 = 45;
              }
              else if ([v24 isEqualToString:@"INLAND_WATER"])
              {
                uint64_t v25 = 46;
              }
              else if ([v24 isEqualToString:@"POI"])
              {
                uint64_t v25 = 47;
              }
              else if ([v24 isEqualToString:@"ISLAND"])
              {
                uint64_t v25 = 48;
              }
              else if ([v24 isEqualToString:@"STREET"])
              {
                uint64_t v25 = 49;
              }
              else if ([v24 isEqualToString:@"ADMIN"])
              {
                uint64_t v25 = 50;
              }
              else if ([v24 isEqualToString:@"POSTAL"])
              {
                uint64_t v25 = 51;
              }
              else if ([v24 isEqualToString:@"INTERSECTION"])
              {
                uint64_t v25 = 54;
              }
              else if ([v24 isEqualToString:@"BUILDING"])
              {
                uint64_t v25 = 55;
              }
              else if ([v24 isEqualToString:@"ADDRESS"])
              {
                uint64_t v25 = 57;
              }
              else if ([v24 isEqualToString:@"ZCTAS"])
              {
                uint64_t v25 = 59;
              }
              else if ([v24 isEqualToString:@"CONTINENT"])
              {
                uint64_t v25 = 61;
              }
              else if ([v24 isEqualToString:@"PHYSICAL_FEATURE"])
              {
                uint64_t v25 = 65;
              }
              else if ([v24 isEqualToString:@"PERDU_CITY"])
              {
                uint64_t v25 = 1016;
              }
              else if ([v24 isEqualToString:@"DMA"])
              {
                uint64_t v25 = 100;
              }
              else if ([v24 isEqualToString:@"CAT_10284_POSTAL"])
              {
                uint64_t v25 = 101;
              }
              else if ([v24 isEqualToString:@"CAT_10285_CITY"])
              {
                uint64_t v25 = 102;
              }
              else if ([v24 isEqualToString:@"CAT_10286_COUNTY"])
              {
                uint64_t v25 = 103;
              }
              else if ([v24 isEqualToString:@"CAT_10287_STATE"])
              {
                uint64_t v25 = 104;
              }
              else if ([v24 isEqualToString:@"CAT_10288_COUNTRY"])
              {
                uint64_t v25 = 105;
              }
              else if ([v24 isEqualToString:@"CAT_10288_COUNTRY_CODE"])
              {
                uint64_t v25 = 106;
              }
              else if ([v24 isEqualToString:@"CAT_10287_STATE_CODE"])
              {
                uint64_t v25 = 107;
              }
              else
              {
                uint64_t v25 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              uint64_t v25 = [v23 intValue];
            }
            objc_msgSend(v6, "addAdditionalPlaceType:", v25, v46);
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (!v20)
          {
LABEL_91:

            v17 = v46;
            id v5 = v47;
            break;
          }
        }
      }

      if (a3) {
        uint64_t v26 = @"deviceCountryCode";
      }
      else {
        uint64_t v26 = @"device_country_code";
      }
      uint64_t v27 = objc_msgSend(v5, "objectForKeyedSubscript:", v26, v46);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = (void *)[v27 copy];
        [v6 setDeviceCountryCode:v28];
      }
      if (a3) {
        v29 = @"displayRegion";
      }
      else {
        v29 = @"display_region";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = (void *)[v30 copy];
        [v6 setDisplayRegion:v31];
      }
      if (a3) {
        v32 = @"deviceSku";
      }
      else {
        v32 = @"device_sku";
      }
      long long v33 = [v5 objectForKeyedSubscript:v32];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = (void *)[v33 copy];
        [v6 setDeviceSku:v34];
      }
      long long v35 = [v5 objectForKeyedSubscript:@"serviceTag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v49 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v48 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v42 = [GEOGeoServiceTag alloc];
                if (a3) {
                  uint64_t v43 = [(GEOGeoServiceTag *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOGeoServiceTag *)v42 initWithDictionary:v41];
                }
                v44 = (void *)v43;
                [v6 addServiceTag:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v38);
        }

        id v5 = v47;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (GEOBatchRevGeocodeRequest)initWithJSON:(id)a3
{
  return (GEOBatchRevGeocodeRequest *)-[GEOBatchRevGeocodeRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_54;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_54;
    }
    GEOBatchRevGeocodeRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v9 = self->_locations;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) readAll:1];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v10);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v13 = self->_serviceTags;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "readAll:", 1, (void)v17);
        }
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v17 = v10 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 2u:
          if (v17 == 2 && PBReaderPlaceMark() && GEOLocationIsValid((char *)a3)) {
            goto LABEL_27;
          }
          goto LABEL_56;
        case 3u:
          if (v17 != 2)
          {
            if ((v10 & 7) != 0) {
              goto LABEL_56;
            }
            while (1)
            {
              uint64_t v19 = *v4;
              uint64_t v20 = *(void *)((char *)a3 + v19);
              unint64_t v21 = v20 + 1;
              if (v20 == -1 || v21 > *(void *)((char *)a3 + *v5)) {
                break;
              }
              int v22 = *(char *)(*(void *)((char *)a3 + *v7) + v20);
              *(void *)((char *)a3 + v19) = v21;
              if (v22 < 0)
              {
                unsigned int v23 = v17++;
                if (v23 <= 8) {
                  continue;
                }
              }
              goto LABEL_41;
            }
            *((unsigned char *)a3 + *v6) = 1;
            goto LABEL_41;
          }
          if (!PBReaderPlaceMark()) {
            goto LABEL_56;
          }
LABEL_44:
          while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5))
          {
            unsigned int v24 = *((unsigned __int8 *)a3 + *v6);
            if (*((unsigned char *)a3 + *v6)) {
              break;
            }
            while (1)
            {
              uint64_t v25 = *v4;
              uint64_t v26 = *(void *)((char *)a3 + v25);
              unint64_t v27 = v26 + 1;
              if (v26 == -1 || v27 > *(void *)((char *)a3 + *v5)) {
                break;
              }
              int v28 = *(char *)(*(void *)((char *)a3 + *v7) + v26);
              *(void *)((char *)a3 + v25) = v27;
              if (v28 < 0)
              {
                BOOL v15 = v24++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_44;
            }
            *((unsigned char *)a3 + *v6) = 1;
          }
          goto LABEL_27;
        case 4u:
          if (v17 == 2) {
            goto LABEL_40;
          }
          goto LABEL_56;
        case 5u:
          if (v17 == 2) {
            goto LABEL_40;
          }
          goto LABEL_56;
        case 6u:
          if (v17 == 2) {
            goto LABEL_40;
          }
          goto LABEL_56;
        default:
          if ((v10 >> 3) == 100)
          {
            if (v17 != 2 || !PBReaderPlaceMark() || !GEOGeoServiceTagIsValid((char *)a3))
            {
LABEL_56:
              PBReaderRecallMark();
              return 0;
            }
LABEL_27:
            PBReaderRecallMark();
          }
          else
          {
LABEL_40:
            if ((PBReaderSkipValueWithTag() & 1) == 0) {
              goto LABEL_56;
            }
          }
LABEL_41:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_54;
          }
          break;
      }
    }
  }
LABEL_54:
  BOOL v29 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v29;
}

- (BOOL)readFrom:(id)a3
{
  return GEOBatchRevGeocodeRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7F) == 0))
  {
    BOOL v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    int v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOBatchRevGeocodeRequest *)self readAll:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = self->_locations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    if (self->_additionalPlaceTypes.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_additionalPlaceTypes.count);
    }
    if (self->_deviceCountryCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_displayRegion) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceSku) {
      PBDataWriterWriteStringField();
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_serviceTags;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  if ([(NSMutableArray *)self->_locations count])
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSMutableArray *)self->_locations objectAtIndexedSubscript:v5];
      if (GEOLocationHasSensitiveFields((uint64_t)v6))
      {
        uint64_t v7 = (_DWORD *)[v6 copy];
        GEOLocationClearSensitiveFields(v7);
        [(NSMutableArray *)self->_locations replaceObjectAtIndex:v5 withObject:v7];
      }
      else
      {
        [v6 clearSensitiveFields:a3];
      }

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_locations count]);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOBatchRevGeocodeRequest _readLocations]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_locations;
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

- (unsigned)requestTypeCode
{
  return 49;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  long long v15 = (id *)a3;
  [(GEOBatchRevGeocodeRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 20) = self->_readerMarkPos;
  *((_DWORD *)v15 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOBatchRevGeocodeRequest *)self locationsCount])
  {
    [v15 clearLocations];
    unint64_t v4 = [(GEOBatchRevGeocodeRequest *)self locationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOBatchRevGeocodeRequest *)self locationAtIndex:i];
        [v15 addLocation:v7];
      }
    }
  }
  if ([(GEOBatchRevGeocodeRequest *)self additionalPlaceTypesCount])
  {
    [v15 clearAdditionalPlaceTypes];
    unint64_t v8 = [(GEOBatchRevGeocodeRequest *)self additionalPlaceTypesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        objc_msgSend(v15, "addAdditionalPlaceType:", -[GEOBatchRevGeocodeRequest additionalPlaceTypeAtIndex:](self, "additionalPlaceTypeAtIndex:", j));
    }
  }
  if (self->_deviceCountryCode) {
    objc_msgSend(v15, "setDeviceCountryCode:");
  }
  if (self->_displayRegion) {
    objc_msgSend(v15, "setDisplayRegion:");
  }
  if (self->_deviceSku) {
    objc_msgSend(v15, "setDeviceSku:");
  }
  if ([(GEOBatchRevGeocodeRequest *)self serviceTagsCount])
  {
    [v15 clearServiceTags];
    unint64_t v11 = [(GEOBatchRevGeocodeRequest *)self serviceTagsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        long long v14 = [(GEOBatchRevGeocodeRequest *)self serviceTagAtIndex:k];
        [v15 addServiceTag:v14];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOBatchRevGeocodeRequestReadAllFrom((uint64_t)v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOBatchRevGeocodeRequest *)self readAll:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v8 = self->_locations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        [v5 addLocation:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  PBRepeatedInt32Copy();
  uint64_t v13 = [(NSString *)self->_deviceCountryCode copyWithZone:a3];
  long long v14 = (void *)v5[5];
  v5[5] = v13;

  uint64_t v15 = [(NSString *)self->_displayRegion copyWithZone:a3];
  int v16 = (void *)v5[7];
  v5[7] = v15;

  uint64_t v17 = [(NSString *)self->_deviceSku copyWithZone:a3];
  long long v18 = (void *)v5[6];
  v5[6] = v17;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v19 = self->_serviceTags;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        [v5 addServiceTag:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOBatchRevGeocodeRequest *)self readAll:1],
         [v4 readAll:1],
         locations = self->_locations,
         !((unint64_t)locations | v4[8]))
     || -[NSMutableArray isEqual:](locations, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((deviceCountryCode = self->_deviceCountryCode, !((unint64_t)deviceCountryCode | v4[5]))
     || -[NSString isEqual:](deviceCountryCode, "isEqual:"))
    && ((displayRegion = self->_displayRegion, !((unint64_t)displayRegion | v4[7]))
     || -[NSString isEqual:](displayRegion, "isEqual:"))
    && ((deviceSku = self->_deviceSku, !((unint64_t)deviceSku | v4[6]))
     || -[NSString isEqual:](deviceSku, "isEqual:")))
  {
    serviceTags = self->_serviceTags;
    if ((unint64_t)serviceTags | v4[9]) {
      char v10 = -[NSMutableArray isEqual:](serviceTags, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  [(GEOBatchRevGeocodeRequest *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_locations hash];
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  NSUInteger v5 = [(NSString *)self->_deviceCountryCode hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_displayRegion hash];
  NSUInteger v7 = [(NSString *)self->_deviceSku hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_serviceTags hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v4[8];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOBatchRevGeocodeRequest *)self addLocation:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 additionalPlaceTypesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOBatchRevGeocodeRequest addAdditionalPlaceType:](self, "addAdditionalPlaceType:", [v4 additionalPlaceTypeAtIndex:j]);
  }
  if (v4[5]) {
    -[GEOBatchRevGeocodeRequest setDeviceCountryCode:](self, "setDeviceCountryCode:");
  }
  if (v4[7]) {
    -[GEOBatchRevGeocodeRequest setDisplayRegion:](self, "setDisplayRegion:");
  }
  if (v4[6]) {
    -[GEOBatchRevGeocodeRequest setDeviceSku:](self, "setDeviceSku:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v4[9];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOBatchRevGeocodeRequest addServiceTag:](self, "addServiceTag:", *(void *)(*((void *)&v18 + 1) + 8 * k), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end