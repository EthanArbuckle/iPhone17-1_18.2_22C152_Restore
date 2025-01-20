@interface GEOWiFiBeaconInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBeaconInfo;
- (BOOL)hasWpsConfigMethods;
- (BOOL)hasWpsDeviceNameData;
- (BOOL)hasWpsDeviceNameElement;
- (BOOL)hasWpsManufacturerElement;
- (BOOL)hasWpsModelName;
- (BOOL)hasWpsModelNumber;
- (BOOL)hasWpsPrimaryDeviceTypeCategory;
- (BOOL)hasWpsPrimaryDeviceTypeSubCategory;
- (BOOL)hasWpsResponseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiBeaconInfo)init;
- (GEOWiFiBeaconInfo)initWithData:(id)a3;
- (GEOWiFiBeaconInfo)initWithDictionary:(id)a3;
- (GEOWiFiBeaconInfo)initWithJSON:(id)a3;
- (NSData)beaconInfo;
- (NSString)wpsConfigMethods;
- (NSString)wpsDeviceNameData;
- (NSString)wpsDeviceNameElement;
- (NSString)wpsManufacturerElement;
- (NSString)wpsModelName;
- (NSString)wpsModelNumber;
- (NSString)wpsPrimaryDeviceTypeCategory;
- (NSString)wpsPrimaryDeviceTypeSubCategory;
- (NSString)wpsResponseType;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readBeaconInfo;
- (void)_readWpsConfigMethods;
- (void)_readWpsDeviceNameData;
- (void)_readWpsDeviceNameElement;
- (void)_readWpsManufacturerElement;
- (void)_readWpsModelName;
- (void)_readWpsModelNumber;
- (void)_readWpsPrimaryDeviceTypeCategory;
- (void)_readWpsPrimaryDeviceTypeSubCategory;
- (void)_readWpsResponseType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBeaconInfo:(id)a3;
- (void)setWpsConfigMethods:(id)a3;
- (void)setWpsDeviceNameData:(id)a3;
- (void)setWpsDeviceNameElement:(id)a3;
- (void)setWpsManufacturerElement:(id)a3;
- (void)setWpsModelName:(id)a3;
- (void)setWpsModelNumber:(id)a3;
- (void)setWpsPrimaryDeviceTypeCategory:(id)a3;
- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3;
- (void)setWpsResponseType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiBeaconInfo

- (GEOWiFiBeaconInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiBeaconInfo;
  v2 = [(GEOWiFiBeaconInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiBeaconInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiBeaconInfo;
  v3 = [(GEOWiFiBeaconInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBeaconInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBeaconInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasBeaconInfo
{
  return self->_beaconInfo != 0;
}

- (NSData)beaconInfo
{
  -[GEOWiFiBeaconInfo _readBeaconInfo]((uint64_t)self);
  beaconInfo = self->_beaconInfo;

  return beaconInfo;
}

- (void)setBeaconInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  objc_storeStrong((id *)&self->_beaconInfo, a3);
}

- (void)_readWpsResponseType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsResponseType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsResponseType
{
  return self->_wpsResponseType != 0;
}

- (NSString)wpsResponseType
{
  -[GEOWiFiBeaconInfo _readWpsResponseType]((uint64_t)self);
  wpsResponseType = self->_wpsResponseType;

  return wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_wpsResponseType, a3);
}

- (void)_readWpsManufacturerElement
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsManufacturerElement_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsManufacturerElement
{
  return self->_wpsManufacturerElement != 0;
}

- (NSString)wpsManufacturerElement
{
  -[GEOWiFiBeaconInfo _readWpsManufacturerElement]((uint64_t)self);
  wpsManufacturerElement = self->_wpsManufacturerElement;

  return wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_wpsManufacturerElement, a3);
}

- (void)_readWpsModelName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsModelName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsModelName
{
  return self->_wpsModelName != 0;
}

- (NSString)wpsModelName
{
  -[GEOWiFiBeaconInfo _readWpsModelName]((uint64_t)self);
  wpsModelName = self->_wpsModelName;

  return wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_wpsModelName, a3);
}

- (void)_readWpsModelNumber
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsModelNumber_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsModelNumber
{
  return self->_wpsModelNumber != 0;
}

- (NSString)wpsModelNumber
{
  -[GEOWiFiBeaconInfo _readWpsModelNumber]((uint64_t)self);
  wpsModelNumber = self->_wpsModelNumber;

  return wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_wpsModelNumber, a3);
}

- (void)_readWpsPrimaryDeviceTypeCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsPrimaryDeviceTypeCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  -[GEOWiFiBeaconInfo _readWpsPrimaryDeviceTypeCategory]((uint64_t)self);
  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;

  return wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeCategory, a3);
}

- (void)_readWpsPrimaryDeviceTypeSubCategory
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsPrimaryDeviceTypeSubCategory_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  -[GEOWiFiBeaconInfo _readWpsPrimaryDeviceTypeSubCategory]((uint64_t)self);
  wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;

  return wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeSubCategory, a3);
}

- (void)_readWpsDeviceNameElement
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsDeviceNameElement_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsDeviceNameElement
{
  return self->_wpsDeviceNameElement != 0;
}

- (NSString)wpsDeviceNameElement
{
  -[GEOWiFiBeaconInfo _readWpsDeviceNameElement]((uint64_t)self);
  wpsDeviceNameElement = self->_wpsDeviceNameElement;

  return wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_wpsDeviceNameElement, a3);
}

- (void)_readWpsDeviceNameData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsDeviceNameData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsDeviceNameData
{
  return self->_wpsDeviceNameData != 0;
}

- (NSString)wpsDeviceNameData
{
  -[GEOWiFiBeaconInfo _readWpsDeviceNameData]((uint64_t)self);
  wpsDeviceNameData = self->_wpsDeviceNameData;

  return wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_wpsDeviceNameData, a3);
}

- (void)_readWpsConfigMethods
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBeaconInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWpsConfigMethods_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWpsConfigMethods
{
  return self->_wpsConfigMethods != 0;
}

- (NSString)wpsConfigMethods
{
  -[GEOWiFiBeaconInfo _readWpsConfigMethods]((uint64_t)self);
  wpsConfigMethods = self->_wpsConfigMethods;

  return wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_wpsConfigMethods, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiBeaconInfo;
  v4 = [(GEOWiFiBeaconInfo *)&v8 description];
  v5 = [(GEOWiFiBeaconInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiBeaconInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 beaconInfo];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"beaconInfo"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"beaconInfo"];
      }
    }

    objc_super v8 = [a1 wpsResponseType];
    if (v8) {
      [v4 setObject:v8 forKey:@"wpsResponseType"];
    }

    v9 = [a1 wpsManufacturerElement];
    if (v9) {
      [v4 setObject:v9 forKey:@"wpsManufacturerElement"];
    }

    v10 = [a1 wpsModelName];
    if (v10) {
      [v4 setObject:v10 forKey:@"wpsModelName"];
    }

    v11 = [a1 wpsModelNumber];
    if (v11) {
      [v4 setObject:v11 forKey:@"wpsModelNumber"];
    }

    v12 = [a1 wpsPrimaryDeviceTypeCategory];
    if (v12) {
      [v4 setObject:v12 forKey:@"wpsPrimaryDeviceTypeCategory"];
    }

    v13 = [a1 wpsPrimaryDeviceTypeSubCategory];
    if (v13) {
      [v4 setObject:v13 forKey:@"wpsPrimaryDeviceTypeSubCategory"];
    }

    v14 = [a1 wpsDeviceNameElement];
    if (v14) {
      [v4 setObject:v14 forKey:@"wpsDeviceNameElement"];
    }

    v15 = [a1 wpsDeviceNameData];
    if (v15) {
      [v4 setObject:v15 forKey:@"wpsDeviceNameData"];
    }

    v16 = [a1 wpsConfigMethods];
    if (v16) {
      [v4 setObject:v16 forKey:@"wpsConfigMethods"];
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
  return -[GEOWiFiBeaconInfo _dictionaryRepresentation:](self, 1);
}

- (GEOWiFiBeaconInfo)initWithDictionary:(id)a3
{
  return (GEOWiFiBeaconInfo *)-[GEOWiFiBeaconInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"beaconInfo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
        [a1 setBeaconInfo:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"wpsResponseType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setWpsResponseType:v7];
      }
      objc_super v8 = [v3 objectForKeyedSubscript:@"wpsManufacturerElement"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setWpsManufacturerElement:v9];
      }
      v10 = [v3 objectForKeyedSubscript:@"wpsModelName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setWpsModelName:v11];
      }
      v12 = [v3 objectForKeyedSubscript:@"wpsModelNumber"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setWpsModelNumber:v13];
      }
      v14 = [v3 objectForKeyedSubscript:@"wpsPrimaryDeviceTypeCategory"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setWpsPrimaryDeviceTypeCategory:v15];
      }
      v16 = [v3 objectForKeyedSubscript:@"wpsPrimaryDeviceTypeSubCategory"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setWpsPrimaryDeviceTypeSubCategory:v17];
      }
      v18 = [v3 objectForKeyedSubscript:@"wpsDeviceNameElement"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (void *)[v18 copy];
        [a1 setWpsDeviceNameElement:v19];
      }
      v20 = [v3 objectForKeyedSubscript:@"wpsDeviceNameData"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setWpsDeviceNameData:v21];
      }
      v22 = [v3 objectForKeyedSubscript:@"wpsConfigMethods"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (void *)[v22 copy];
        [a1 setWpsConfigMethods:v23];
      }
    }
  }

  return a1;
}

- (GEOWiFiBeaconInfo)initWithJSON:(id)a3
{
  return (GEOWiFiBeaconInfo *)-[GEOWiFiBeaconInfo _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_62;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_62;
    }
    GEOWiFiBeaconInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiBeaconInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiBeaconInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7FF) == 0))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiBeaconInfo *)self readAll:0];
    if (self->_beaconInfo) {
      PBDataWriterWriteDataField();
    }
    if (self->_wpsResponseType) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsManufacturerElement) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsModelName) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsModelNumber) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsPrimaryDeviceTypeCategory) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsPrimaryDeviceTypeSubCategory) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsDeviceNameElement) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsDeviceNameData) {
      PBDataWriterWriteStringField();
    }
    if (self->_wpsConfigMethods) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v5 = (id *)a3;
  [(GEOWiFiBeaconInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 24) = self->_readerMarkPos;
  *((_DWORD *)v5 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_beaconInfo) {
    objc_msgSend(v5, "setBeaconInfo:");
  }
  if (self->_wpsResponseType) {
    objc_msgSend(v5, "setWpsResponseType:");
  }
  v4 = v5;
  if (self->_wpsManufacturerElement)
  {
    objc_msgSend(v5, "setWpsManufacturerElement:");
    v4 = v5;
  }
  if (self->_wpsModelName)
  {
    objc_msgSend(v5, "setWpsModelName:");
    v4 = v5;
  }
  if (self->_wpsModelNumber)
  {
    objc_msgSend(v5, "setWpsModelNumber:");
    v4 = v5;
  }
  if (self->_wpsPrimaryDeviceTypeCategory)
  {
    objc_msgSend(v5, "setWpsPrimaryDeviceTypeCategory:");
    v4 = v5;
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory)
  {
    objc_msgSend(v5, "setWpsPrimaryDeviceTypeSubCategory:");
    v4 = v5;
  }
  if (self->_wpsDeviceNameElement)
  {
    objc_msgSend(v5, "setWpsDeviceNameElement:");
    v4 = v5;
  }
  if (self->_wpsDeviceNameData)
  {
    objc_msgSend(v5, "setWpsDeviceNameData:");
    v4 = v5;
  }
  if (self->_wpsConfigMethods)
  {
    objc_msgSend(v5, "setWpsConfigMethods:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiBeaconInfo *)self readAll:0];
    uint64_t v8 = [(NSData *)self->_beaconInfo copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_wpsResponseType copyWithZone:a3];
    v11 = (void *)v5[11];
    v5[11] = v10;

    uint64_t v12 = [(NSString *)self->_wpsManufacturerElement copyWithZone:a3];
    v13 = (void *)v5[6];
    v5[6] = v12;

    uint64_t v14 = [(NSString *)self->_wpsModelName copyWithZone:a3];
    v15 = (void *)v5[7];
    v5[7] = v14;

    uint64_t v16 = [(NSString *)self->_wpsModelNumber copyWithZone:a3];
    v17 = (void *)v5[8];
    v5[8] = v16;

    uint64_t v18 = [(NSString *)self->_wpsPrimaryDeviceTypeCategory copyWithZone:a3];
    v19 = (void *)v5[9];
    v5[9] = v18;

    uint64_t v20 = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory copyWithZone:a3];
    v21 = (void *)v5[10];
    v5[10] = v20;

    uint64_t v22 = [(NSString *)self->_wpsDeviceNameElement copyWithZone:a3];
    v23 = (void *)v5[5];
    v5[5] = v22;

    uint64_t v24 = [(NSString *)self->_wpsDeviceNameData copyWithZone:a3];
    v25 = (void *)v5[4];
    v5[4] = v24;

    uint64_t v26 = [(NSString *)self->_wpsConfigMethods copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v26;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOWiFiBeaconInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOWiFiBeaconInfo *)self readAll:1];
  [v4 readAll:1];
  beaconInfo = self->_beaconInfo;
  if ((unint64_t)beaconInfo | v4[2])
  {
    if (!-[NSData isEqual:](beaconInfo, "isEqual:")) {
      goto LABEL_22;
    }
  }
  wpsResponseType = self->_wpsResponseType;
  if ((unint64_t)wpsResponseType | v4[11] && !-[NSString isEqual:](wpsResponseType, "isEqual:")) {
    goto LABEL_22;
  }
  if (((wpsManufacturerElement = self->_wpsManufacturerElement, !((unint64_t)wpsManufacturerElement | v4[6]))
     || -[NSString isEqual:](wpsManufacturerElement, "isEqual:"))
    && ((wpsModelName = self->_wpsModelName, !((unint64_t)wpsModelName | v4[7]))
     || -[NSString isEqual:](wpsModelName, "isEqual:"))
    && ((wpsModelNumber = self->_wpsModelNumber, !((unint64_t)wpsModelNumber | v4[8]))
     || -[NSString isEqual:](wpsModelNumber, "isEqual:"))
    && ((wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory,
         !((unint64_t)wpsPrimaryDeviceTypeCategory | v4[9]))
     || -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:"))
    && ((wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory,
         !((unint64_t)wpsPrimaryDeviceTypeSubCategory | v4[10]))
     || -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:"))
    && ((wpsDeviceNameElement = self->_wpsDeviceNameElement, !((unint64_t)wpsDeviceNameElement | v4[5]))
     || -[NSString isEqual:](wpsDeviceNameElement, "isEqual:"))
    && ((wpsDeviceNameData = self->_wpsDeviceNameData, !((unint64_t)wpsDeviceNameData | v4[4]))
     || -[NSString isEqual:](wpsDeviceNameData, "isEqual:")))
  {
    wpsConfigMethods = self->_wpsConfigMethods;
    if ((unint64_t)wpsConfigMethods | v4[3]) {
      char v15 = -[NSString isEqual:](wpsConfigMethods, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  [(GEOWiFiBeaconInfo *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_beaconInfo hash];
  NSUInteger v4 = [(NSString *)self->_wpsResponseType hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_wpsManufacturerElement hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_wpsModelName hash];
  NSUInteger v7 = [(NSString *)self->_wpsModelNumber hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_wpsPrimaryDeviceTypeCategory hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory hash];
  NSUInteger v10 = [(NSString *)self->_wpsDeviceNameElement hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_wpsDeviceNameData hash];
  return v9 ^ v11 ^ [(NSString *)self->_wpsConfigMethods hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOWiFiBeaconInfo setBeaconInfo:](self, "setBeaconInfo:");
  }
  if (v4[11]) {
    -[GEOWiFiBeaconInfo setWpsResponseType:](self, "setWpsResponseType:");
  }
  if (v4[6]) {
    -[GEOWiFiBeaconInfo setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  }
  if (v4[7]) {
    -[GEOWiFiBeaconInfo setWpsModelName:](self, "setWpsModelName:");
  }
  if (v4[8]) {
    -[GEOWiFiBeaconInfo setWpsModelNumber:](self, "setWpsModelNumber:");
  }
  if (v4[9]) {
    -[GEOWiFiBeaconInfo setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  }
  if (v4[10]) {
    -[GEOWiFiBeaconInfo setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  }
  if (v4[5]) {
    -[GEOWiFiBeaconInfo setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  }
  if (v4[4]) {
    -[GEOWiFiBeaconInfo setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  }
  if (v4[3]) {
    -[GEOWiFiBeaconInfo setWpsConfigMethods:](self, "setWpsConfigMethods:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wpsResponseType, 0);
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeSubCategory, 0);
  objc_storeStrong((id *)&self->_wpsPrimaryDeviceTypeCategory, 0);
  objc_storeStrong((id *)&self->_wpsModelNumber, 0);
  objc_storeStrong((id *)&self->_wpsModelName, 0);
  objc_storeStrong((id *)&self->_wpsManufacturerElement, 0);
  objc_storeStrong((id *)&self->_wpsDeviceNameElement, 0);
  objc_storeStrong((id *)&self->_wpsDeviceNameData, 0);
  objc_storeStrong((id *)&self->_wpsConfigMethods, 0);
  objc_storeStrong((id *)&self->_beaconInfo, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end