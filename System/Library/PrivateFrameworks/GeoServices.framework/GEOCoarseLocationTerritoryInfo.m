@interface GEOCoarseLocationTerritoryInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAreaDegrees;
- (BOOL)hasAreaRatio;
- (BOOL)hasCountryName;
- (BOOL)hasCountryNameStr;
- (BOOL)hasFeatureId;
- (BOOL)hasMaxDistanceMeters;
- (BOOL)hasPolygon;
- (BOOL)hasPrecise;
- (BOOL)hasRegionName;
- (BOOL)hasRegionNameStr;
- (BOOL)hasRepresentativePoint;
- (BOOL)hasRepresentativePointQuality;
- (BOOL)hasRevgeoRank;
- (BOOL)hasShouldRandomize;
- (BOOL)hasTerritoryType;
- (BOOL)isEqual:(id)a3;
- (BOOL)precise;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldRandomize;
- (GEOCoarseLocationLatLng)representativePoint;
- (GEOCoarseLocationPolygon)polygon;
- (GEOCoarseLocationTerritoryInfo)init;
- (GEOCoarseLocationTerritoryInfo)initWithData:(id)a3;
- (GEOCoarseLocationTerritoryInfo)initWithDictionary:(id)a3;
- (GEOCoarseLocationTerritoryInfo)initWithJSON:(id)a3;
- (NSString)countryNameStr;
- (NSString)regionNameStr;
- (double)areaDegrees;
- (double)areaRatio;
- (double)maxDistanceMeters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)representativePointQualityAsString:(int)a3;
- (id)territoryTypeAsString:(int)a3;
- (int)StringAsRepresentativePointQuality:(id)a3;
- (int)StringAsTerritoryType:(id)a3;
- (int)representativePointQuality;
- (int)territoryType;
- (unint64_t)coordinatesCount;
- (unint64_t)featureId;
- (unint64_t)hash;
- (unsigned)coordinates;
- (unsigned)coordinatesAtIndex:(unint64_t)a3;
- (unsigned)countryName;
- (unsigned)regionName;
- (unsigned)revgeoRank;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCoordinates;
- (void)_readCountryNameStr;
- (void)_readPolygon;
- (void)_readRegionNameStr;
- (void)addCoordinates:(unsigned int)a3;
- (void)clearCoordinates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAreaDegrees:(double)a3;
- (void)setAreaRatio:(double)a3;
- (void)setCoordinates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCountryName:(unsigned int)a3;
- (void)setCountryNameStr:(id)a3;
- (void)setFeatureId:(unint64_t)a3;
- (void)setHasAreaDegrees:(BOOL)a3;
- (void)setHasAreaRatio:(BOOL)a3;
- (void)setHasCountryName:(BOOL)a3;
- (void)setHasFeatureId:(BOOL)a3;
- (void)setHasMaxDistanceMeters:(BOOL)a3;
- (void)setHasPrecise:(BOOL)a3;
- (void)setHasRegionName:(BOOL)a3;
- (void)setHasRepresentativePoint:(BOOL)a3;
- (void)setHasRepresentativePointQuality:(BOOL)a3;
- (void)setHasRevgeoRank:(BOOL)a3;
- (void)setHasShouldRandomize:(BOOL)a3;
- (void)setHasTerritoryType:(BOOL)a3;
- (void)setMaxDistanceMeters:(double)a3;
- (void)setPolygon:(id)a3;
- (void)setPrecise:(BOOL)a3;
- (void)setRegionName:(unsigned int)a3;
- (void)setRegionNameStr:(id)a3;
- (void)setRepresentativePoint:(GEOCoarseLocationLatLng)a3;
- (void)setRepresentativePointQuality:(int)a3;
- (void)setRevgeoRank:(unsigned int)a3;
- (void)setShouldRandomize:(BOOL)a3;
- (void)setTerritoryType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCoarseLocationTerritoryInfo

- (GEOCoarseLocationTerritoryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  v2 = [(GEOCoarseLocationTerritoryInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCoarseLocationTerritoryInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  v3 = [(GEOCoarseLocationTerritoryInfo *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  [(GEOCoarseLocationTerritoryInfo *)&v3 dealloc];
}

- (int)territoryType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0) {
    return self->_territoryType;
  }
  else {
    return 0;
  }
}

- (void)setTerritoryType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  self->_territoryType = a3;
}

- (void)setHasTerritoryType:(BOOL)a3
{
  if (a3) {
    int v3 = 66048;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasTerritoryType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)territoryTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53D8128[a3];
  }

  return v3;
}

- (int)StringAsTerritoryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COUNTY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CITY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TERRITORY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COUNTRY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"POSTAL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"STATISTICAL"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DISPUTED_AREA"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_regionName = a3;
}

- (void)setHasRegionName:(BOOL)a3
{
  if (a3) {
    int v3 = 65600;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasRegionName
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unsigned)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_countryName = a3;
}

- (void)setHasCountryName:(BOOL)a3
{
  if (a3) {
    int v3 = 65568;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasCountryName
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readCoordinates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 149) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)coordinatesCount
{
  return self->_coordinates.count;
}

- (unsigned)coordinates
{
  return self->_coordinates.list;
}

- (void)clearCoordinates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  PBRepeatedUInt32Clear();
}

- (void)addCoordinates:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (unsigned)coordinatesAtIndex:(unint64_t)a3
{
  -[GEOCoarseLocationTerritoryInfo _readCoordinates]((uint64_t)self);
  p_coordinates = &self->_coordinates;
  unint64_t count = self->_coordinates.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_coordinates->list[a3];
}

- (void)setCoordinates:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;

  MEMORY[0x1F4147400](&self->_coordinates, a3, a4);
}

- (BOOL)precise
{
  return self->_precise;
}

- (void)setPrecise:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  self->_precise = a3;
}

- (void)setHasPrecise:(BOOL)a3
{
  if (a3) {
    int v3 = 66560;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasPrecise
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unint64_t)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_featureId = a3;
}

- (void)setHasFeatureId:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFeatureId
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (GEOCoarseLocationLatLng)representativePoint
{
  double lat = self->_representativePoint._lat;
  double lng = self->_representativePoint._lng;
  result._double lng = lng;
  result._double lat = lat;
  return result;
}

- (void)setRepresentativePoint:(GEOCoarseLocationLatLng)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_representativePoint = a3;
}

- (void)setHasRepresentativePoint:(BOOL)a3
{
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasRepresentativePoint
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)areaDegrees
{
  return self->_areaDegrees;
}

- (void)setAreaDegrees:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_areaDegrees = a3;
}

- (void)setHasAreaDegrees:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasAreaDegrees
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)revgeoRank
{
  return self->_revgeoRank;
}

- (void)setRevgeoRank:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_revgeoRank = a3;
}

- (void)setHasRevgeoRank:(BOOL)a3
{
  if (a3) {
    int v3 = 65792;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasRevgeoRank
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (double)areaRatio
{
  return self->_areaRatio;
}

- (void)setAreaRatio:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_areaRatio = a3;
}

- (void)setHasAreaRatio:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasAreaRatio
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)maxDistanceMeters
{
  return self->_maxDistanceMeters;
}

- (void)setMaxDistanceMeters:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_maxDistanceMeters = a3;
}

- (void)setHasMaxDistanceMeters:(BOOL)a3
{
  if (a3) {
    int v3 = 65552;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaxDistanceMeters
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)_readRegionNameStr
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 149) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegionNameStr_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRegionNameStr
{
  return self->_regionNameStr != 0;
}

- (NSString)regionNameStr
{
  -[GEOCoarseLocationTerritoryInfo _readRegionNameStr]((uint64_t)self);
  regionNameStr = self->_regionNameStr;

  return regionNameStr;
}

- (void)setRegionNameStr:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_regionNameStr, a3);
}

- (void)_readCountryNameStr
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 149) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryNameStr_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCountryNameStr
{
  return self->_countryNameStr != 0;
}

- (NSString)countryNameStr
{
  -[GEOCoarseLocationTerritoryInfo _readCountryNameStr]((uint64_t)self);
  countryNameStr = self->_countryNameStr;

  return countryNameStr;
}

- (void)setCountryNameStr:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_countryNameStr, a3);
}

- (void)_readPolygon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(unsigned char *)(a1 + 149) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPolygon_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPolygon
{
  return self->_polygon != 0;
}

- (GEOCoarseLocationPolygon)polygon
{
  -[GEOCoarseLocationTerritoryInfo _readPolygon]((uint64_t)self);
  polygon = self->_polygon;

  return polygon;
}

- (void)setPolygon:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_polygon, a3);
}

- (int)representativePointQuality
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x80) != 0) {
    return self->_representativePointQuality;
  }
  else {
    return 0;
  }
}

- (void)setRepresentativePointQuality:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_representativePointQuality = a3;
}

- (void)setHasRepresentativePointQuality:(BOOL)a3
{
  if (a3) {
    int v3 = 65664;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasRepresentativePointQuality
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (id)representativePointQualityAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53D8170[a3];
  }

  return v3;
}

- (int)StringAsRepresentativePointQuality:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EXCELLENT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GOOD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAIR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POOR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)shouldRandomize
{
  return self->_shouldRandomize;
}

- (void)setShouldRandomize:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  self->_shouldRandomize = a3;
}

- (void)setHasShouldRandomize:(BOOL)a3
{
  if (a3) {
    int v3 = 67584;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$76592BEDE77795F2213850FEF5437C34 flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasShouldRandomize
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  int v4 = [(GEOCoarseLocationTerritoryInfo *)&v8 description];
  v5 = [(GEOCoarseLocationTerritoryInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCoarseLocationTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_44;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = *(_DWORD *)(a1 + 148);
  if ((v5 & 0x200) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 140);
    if (v6 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 140));
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v7 = off_1E53D8128[v6];
    }
    [v4 setObject:v7 forKey:@"territoryType"];

    int v5 = *(_DWORD *)(a1 + 148);
  }
  if ((v5 & 0x40) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 128)];
    [v4 setObject:v8 forKey:@"regionName"];

    int v5 = *(_DWORD *)(a1 + 148);
  }
  if ((v5 & 0x20) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
    [v4 setObject:v9 forKey:@"countryName"];
  }
  if (*(void *)(a1 + 24))
  {
    v10 = PBRepeatedUInt32NSArray();
    [v4 setObject:v10 forKey:@"coordinates"];
  }
  int v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 0x400) != 0)
  {
    v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 144)];
    [v4 setObject:v17 forKey:@"precise"];

    int v11 = *(_DWORD *)(a1 + 148);
    if ((v11 & 8) == 0)
    {
LABEL_15:
      if ((v11 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_30;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_15;
  }
  v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
  [v4 setObject:v18 forKey:@"featureId"];

  int v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    if ((v11 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_31;
  }
LABEL_30:
  v19 = _GEOCoarseLocationLatLngDictionaryRepresentation((double *)(a1 + 40));
  [v4 setObject:v19 forKey:@"representativePoint"];

  int v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 2) == 0)
  {
LABEL_17:
    if ((v11 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }
LABEL_31:
  v20 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v4 setObject:v20 forKey:@"areaDegrees"];

  int v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 0x100) == 0)
  {
LABEL_18:
    if ((v11 & 4) == 0) {
      goto LABEL_19;
    }
LABEL_33:
    v22 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v4 setObject:v22 forKey:@"areaRatio"];

    if ((*(_DWORD *)(a1 + 148) & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_32:
  v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
  [v4 setObject:v21 forKey:@"revgeoRank"];

  int v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 4) != 0) {
    goto LABEL_33;
  }
LABEL_19:
  if ((v11 & 0x10) != 0)
  {
LABEL_20:
    v12 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
    [v4 setObject:v12 forKey:@"maxDistanceMeters"];
  }
LABEL_21:
  v13 = [(id)a1 regionNameStr];
  if (v13) {
    [v4 setObject:v13 forKey:@"regionNameStr"];
  }

  v14 = [(id)a1 countryNameStr];
  if (v14) {
    [v4 setObject:v14 forKey:@"countryNameStr"];
  }

  v15 = [(id)a1 polygon];
  v16 = v15;
  if (v15)
  {
    if (a2) {
      [v15 jsonRepresentation];
    }
    else {
    v23 = [v15 dictionaryRepresentation];
    }
    [v4 setObject:v23 forKey:@"polygon"];
  }
  int v24 = *(_DWORD *)(a1 + 148);
  if ((v24 & 0x80) != 0)
  {
    uint64_t v25 = *(int *)(a1 + 132);
    if (v25 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E53D8170[v25];
    }
    [v4 setObject:v26 forKey:@"representativePointQuality"];

    int v24 = *(_DWORD *)(a1 + 148);
  }
  if ((v24 & 0x800) != 0)
  {
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 145)];
    [v4 setObject:v27 forKey:@"shouldRandomize"];
  }
LABEL_44:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCoarseLocationTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCoarseLocationTerritoryInfo)initWithDictionary:(id)a3
{
  return (GEOCoarseLocationTerritoryInfo *)-[GEOCoarseLocationTerritoryInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_84;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_84;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"territoryType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STATE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"COUNTY"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"CITY"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"TERRITORY"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"COUNTRY"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"POSTAL"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"STATISTICAL"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"OTHER"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"DISPUTED_AREA"])
    {
      uint64_t v8 = 8;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    uint64_t v8 = [v6 intValue];
  }
  [a1 setTerritoryType:v8];
LABEL_27:

  v9 = [v5 objectForKeyedSubscript:@"regionName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRegionName:", objc_msgSend(v9, "unsignedIntValue"));
  }

  v10 = [v5 objectForKeyedSubscript:@"countryName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCountryName:", objc_msgSend(v10, "unsignedIntValue"));
  }

  int v11 = [v5 objectForKeyedSubscript:@"coordinates"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addCoordinates:", objc_msgSend(v17, "unsignedIntValue"));
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }
  }
  v18 = [v5 objectForKeyedSubscript:@"precise"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrecise:", objc_msgSend(v18, "BOOLValue"));
  }

  v19 = [v5 objectForKeyedSubscript:@"featureId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFeatureId:", objc_msgSend(v19, "unsignedLongLongValue"));
  }

  v20 = [v5 objectForKeyedSubscript:@"representativePoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v38 = 0.0;
    double v39 = 0.0;
    _GEOCoarseLocationLatLngFromDictionaryRepresentation(v20, &v38);
    objc_msgSend(a1, "setRepresentativePoint:", v38, v39);
  }

  v21 = [v5 objectForKeyedSubscript:@"areaDegrees"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v21 doubleValue];
    objc_msgSend(a1, "setAreaDegrees:");
  }

  v22 = [v5 objectForKeyedSubscript:@"revgeoRank"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRevgeoRank:", objc_msgSend(v22, "unsignedIntValue"));
  }

  v23 = [v5 objectForKeyedSubscript:@"areaRatio"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v23 doubleValue];
    objc_msgSend(a1, "setAreaRatio:");
  }

  int v24 = [v5 objectForKeyedSubscript:@"maxDistanceMeters"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v24 doubleValue];
    objc_msgSend(a1, "setMaxDistanceMeters:");
  }

  uint64_t v25 = [v5 objectForKeyedSubscript:@"regionNameStr"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = (void *)[v25 copy];
    [a1 setRegionNameStr:v26];
  }
  v27 = [v5 objectForKeyedSubscript:@"countryNameStr"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = (void *)[v27 copy];
    [a1 setCountryNameStr:v28];
  }
  v29 = [v5 objectForKeyedSubscript:@"polygon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOCoarseLocationPolygon alloc];
    if (a3) {
      uint64_t v31 = [(GEOCoarseLocationPolygon *)v30 initWithJSON:v29];
    }
    else {
      uint64_t v31 = [(GEOCoarseLocationPolygon *)v30 initWithDictionary:v29];
    }
    v32 = (void *)v31;
    [a1 setPolygon:v31];
  }
  v33 = [v5 objectForKeyedSubscript:@"representativePointQuality"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v33;
    if ([v34 isEqualToString:@"EXCELLENT"])
    {
      uint64_t v35 = 0;
    }
    else if ([v34 isEqualToString:@"GOOD"])
    {
      uint64_t v35 = 1;
    }
    else if ([v34 isEqualToString:@"FAIR"])
    {
      uint64_t v35 = 2;
    }
    else if ([v34 isEqualToString:@"POOR"])
    {
      uint64_t v35 = 3;
    }
    else if ([v34 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v35 = 4;
    }
    else
    {
      uint64_t v35 = 0;
    }

    goto LABEL_80;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [v33 intValue];
LABEL_80:
    [a1 setRepresentativePointQuality:v35];
  }

  v36 = [v5 objectForKeyedSubscript:@"shouldRandomize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShouldRandomize:", objc_msgSend(v36, "BOOLValue"));
  }

LABEL_84:
  return a1;
}

- (GEOCoarseLocationTerritoryInfo)initWithJSON:(id)a3
{
  return (GEOCoarseLocationTerritoryInfo *)-[GEOCoarseLocationTerritoryInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_163;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_164;
    }
    GEOCoarseLocationTerritoryInfoReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOCoarseLocationPolygon *)self->_polygon readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoarseLocationTerritoryInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoarseLocationTerritoryInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOCoarseLocationTerritoryInfoIsDirty((uint64_t)self))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    int v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    goto LABEL_39;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCoarseLocationTerritoryInfo *)self readAll:0];
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_coordinates.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_coordinates.count);
  }
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
    if ((*(unsigned char *)&v8 & 8) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&v8 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&v8 & 8) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint64Field();
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 1) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterPlaceMark();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterRecallMark();
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_16;
    }
LABEL_36:
    PBDataWriterWriteDoubleField();
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 4) != 0) {
    goto LABEL_36;
  }
LABEL_16:
  if ((*(unsigned char *)&v8 & 0x10) != 0) {
LABEL_17:
  }
    PBDataWriterWriteDoubleField();
LABEL_18:
  if (self->_regionNameStr) {
    PBDataWriterWriteStringField();
  }
  if (self->_countryNameStr) {
    PBDataWriterWriteStringField();
  }
  if (self->_polygon) {
    PBDataWriterWriteSubmessage();
  }
  $76592BEDE77795F2213850FEF5437C34 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    $76592BEDE77795F2213850FEF5437C34 v9 = self->_flags;
  }
  if ((*(_WORD *)&v9 & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
LABEL_39:
}

- (void)copyTo:(id)a3
{
  int v11 = (char *)a3;
  [(GEOCoarseLocationTerritoryInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v11 + 1, self->_reader);
  *((_DWORD *)v11 + 28) = self->_readerMarkPos;
  *((_DWORD *)v11 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_3;
    }
LABEL_31:
    *((_DWORD *)v11 + 32) = self->_regionName;
    *((_DWORD *)v11 + 37) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v11 + 35) = self->_territoryType;
  *((_DWORD *)v11 + 37) |= 0x200u;
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) != 0) {
    goto LABEL_31;
  }
LABEL_3:
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_4:
    *((_DWORD *)v11 + 31) = self->_countryName;
    *((_DWORD *)v11 + 37) |= 0x20u;
  }
LABEL_5:
  if ([(GEOCoarseLocationTerritoryInfo *)self coordinatesCount])
  {
    [v11 clearCoordinates];
    unint64_t v5 = [(GEOCoarseLocationTerritoryInfo *)self coordinatesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v11, "addCoordinates:", -[GEOCoarseLocationTerritoryInfo coordinatesAtIndex:](self, "coordinatesAtIndex:", i));
    }
  }
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  $76592BEDE77795F2213850FEF5437C34 v9 = v11;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    v11[144] = self->_precise;
    *((_DWORD *)v11 + 37) |= 0x400u;
    $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
    if ((*(unsigned char *)&v8 & 8) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v8 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&v8 & 8) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v11 + 10) = self->_featureId;
  *((_DWORD *)v11 + 37) |= 8u;
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(GEOCoarseLocationLatLng *)(v11 + 40) = self->_representativePoint;
  *((_DWORD *)v11 + 37) |= 1u;
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v11 + 7) = *(void *)&self->_areaDegrees;
  *((_DWORD *)v11 + 37) |= 2u;
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v11 + 34) = self->_revgeoRank;
  *((_DWORD *)v11 + 37) |= 0x100u;
  $76592BEDE77795F2213850FEF5437C34 v8 = self->_flags;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_38:
  *((void *)v11 + 8) = *(void *)&self->_areaRatio;
  *((_DWORD *)v11 + 37) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_16:
    *((void *)v11 + 11) = *(void *)&self->_maxDistanceMeters;
    *((_DWORD *)v11 + 37) |= 0x10u;
  }
LABEL_17:
  if (self->_regionNameStr)
  {
    objc_msgSend(v11, "setRegionNameStr:");
    $76592BEDE77795F2213850FEF5437C34 v9 = v11;
  }
  if (self->_countryNameStr)
  {
    objc_msgSend(v11, "setCountryNameStr:");
    $76592BEDE77795F2213850FEF5437C34 v9 = v11;
  }
  if (self->_polygon)
  {
    objc_msgSend(v11, "setPolygon:");
    $76592BEDE77795F2213850FEF5437C34 v9 = v11;
  }
  $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 0x80) != 0)
  {
    v9[33] = self->_representativePointQuality;
    v9[37] |= 0x80u;
    $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    *((unsigned char *)v9 + 145) = self->_shouldRandomize;
    v9[37] |= 0x800u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCoarseLocationTerritoryInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCoarseLocationTerritoryInfo *)self readAll:0];
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_territoryType;
    *(_DWORD *)(v5 + 148) |= 0x200u;
    $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&flags & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_regionName;
  *(_DWORD *)(v5 + 148) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 124) = self->_countryName;
    *(_DWORD *)(v5 + 148) |= 0x20u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 144) = self->_precise;
    *(_DWORD *)(v5 + 148) |= 0x400u;
    $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
    if ((*(unsigned char *)&v10 & 8) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v10 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&v10 & 8) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(v5 + 80) = self->_featureId;
  *(_DWORD *)(v5 + 148) |= 8u;
  $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 1) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v10 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(GEOCoarseLocationLatLng *)(v5 + 40) = self->_representativePoint;
  *(_DWORD *)(v5 + 148) |= 1u;
  $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v10 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 56) = self->_areaDegrees;
  *(_DWORD *)(v5 + 148) |= 2u;
  $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    *(double *)(v5 + 64) = self->_areaRatio;
    *(_DWORD *)(v5 + 148) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_29:
  *(_DWORD *)(v5 + 136) = self->_revgeoRank;
  *(_DWORD *)(v5 + 148) |= 0x100u;
  $76592BEDE77795F2213850FEF5437C34 v10 = self->_flags;
  if ((*(unsigned char *)&v10 & 4) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((*(unsigned char *)&v10 & 0x10) != 0)
  {
LABEL_16:
    *(double *)(v5 + 88) = self->_maxDistanceMeters;
    *(_DWORD *)(v5 + 148) |= 0x10u;
  }
LABEL_17:
  uint64_t v11 = [(NSString *)self->_regionNameStr copyWithZone:a3];
  id v12 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v11;

  uint64_t v13 = [(NSString *)self->_countryNameStr copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  id v15 = [(GEOCoarseLocationPolygon *)self->_polygon copyWithZone:a3];
  v16 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v15;

  $76592BEDE77795F2213850FEF5437C34 v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_representativePointQuality;
    *(_DWORD *)(v5 + 148) |= 0x80u;
    $76592BEDE77795F2213850FEF5437C34 v17 = self->_flags;
  }
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 145) = self->_shouldRandomize;
    *(_DWORD *)(v5 + 148) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_74;
  }
  [(GEOCoarseLocationTerritoryInfo *)self readAll:1];
  [v4 readAll:1];
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 37);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_territoryType != *((_DWORD *)v4 + 35)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_regionName != *((_DWORD *)v4 + 32)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_countryName != *((_DWORD *)v4 + 31)) {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_74;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_74;
  }
  $76592BEDE77795F2213850FEF5437C34 v7 = self->_flags;
  int v8 = *((_DWORD *)v4 + 37);
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0) {
      goto LABEL_74;
    }
    if (self->_precise)
    {
      if (!*((unsigned char *)v4 + 144)) {
        goto LABEL_74;
      }
    }
    else if (*((unsigned char *)v4 + 144))
    {
      goto LABEL_74;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_featureId != *((void *)v4 + 10)) {
      goto LABEL_74;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_74;
  }
  if (*(unsigned char *)&v7)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_74;
    }
    if (*(void *)&self->_representativePoint._lat != *((void *)v4 + 5)
      || *(void *)&self->_representativePoint._lng != *((void *)v4 + 6))
    {
      goto LABEL_74;
    }
  }
  else if (v8)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_areaDegrees != *((double *)v4 + 7)) {
      goto LABEL_74;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_revgeoRank != *((_DWORD *)v4 + 34)) {
      goto LABEL_74;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_areaRatio != *((double *)v4 + 8)) {
      goto LABEL_74;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_74;
  }
  if ((*(unsigned char *)&v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_maxDistanceMeters != *((double *)v4 + 11)) {
      goto LABEL_74;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_74;
  }
  regionNameStr = self->_regionNameStr;
  if ((unint64_t)regionNameStr | *((void *)v4 + 13)
    && !-[NSString isEqual:](regionNameStr, "isEqual:"))
  {
    goto LABEL_74;
  }
  countryNameStr = self->_countryNameStr;
  if ((unint64_t)countryNameStr | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](countryNameStr, "isEqual:")) {
      goto LABEL_74;
    }
  }
  polygon = self->_polygon;
  if ((unint64_t)polygon | *((void *)v4 + 12))
  {
    if (!-[GEOCoarseLocationPolygon isEqual:](polygon, "isEqual:")) {
      goto LABEL_74;
    }
  }
  $76592BEDE77795F2213850FEF5437C34 v13 = self->_flags;
  int v14 = *((_DWORD *)v4 + 37);
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_representativePointQuality != *((_DWORD *)v4 + 33)) {
      goto LABEL_74;
    }
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    if ((v14 & 0x800) != 0)
    {
      if (self->_shouldRandomize)
      {
        if (!*((unsigned char *)v4 + 145)) {
          goto LABEL_74;
        }
      }
      else if (*((unsigned char *)v4 + 145))
      {
        goto LABEL_74;
      }
      BOOL v15 = 1;
      goto LABEL_75;
    }
LABEL_74:
    BOOL v15 = 0;
    goto LABEL_75;
  }
  BOOL v15 = (*((_DWORD *)v4 + 37) & 0x800) == 0;
LABEL_75:

  return v15;
}

- (unint64_t)hash
{
  [(GEOCoarseLocationTerritoryInfo *)self readAll:1];
  $76592BEDE77795F2213850FEF5437C34 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
    uint64_t v34 = 0;
    if ((*(unsigned char *)&flags & 0x40) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v33 = 0;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v34 = 2654435761 * self->_territoryType;
  if ((*(unsigned char *)&flags & 0x40) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v33 = 2654435761 * self->_regionName;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_4:
    uint64_t v32 = 2654435761 * self->_countryName;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v32 = 0;
LABEL_8:
  uint64_t v31 = PBRepeatedUInt32Hash();
  $76592BEDE77795F2213850FEF5437C34 v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
    uint64_t v30 = 2654435761 * self->_precise;
    if ((*(unsigned char *)&v4 & 8) != 0)
    {
LABEL_10:
      unint64_t v29 = 2654435761u * self->_featureId;
      if (*(unsigned char *)&v4) {
        goto LABEL_11;
      }
LABEL_18:
      uint64_t v28 = 0;
      if ((*(unsigned char *)&v4 & 2) != 0) {
        goto LABEL_12;
      }
LABEL_19:
      unint64_t v9 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_10;
    }
  }
  unint64_t v29 = 0;
  if ((*(unsigned char *)&v4 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v28 = PBHashBytes();
  $76592BEDE77795F2213850FEF5437C34 v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_19;
  }
LABEL_12:
  double areaDegrees = self->_areaDegrees;
  double v6 = -areaDegrees;
  if (areaDegrees >= 0.0) {
    double v6 = self->_areaDegrees;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_22:
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    uint64_t v10 = 2654435761 * self->_revgeoRank;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_24;
    }
LABEL_29:
    unint64_t v15 = 0;
    goto LABEL_32;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v4 & 4) == 0) {
    goto LABEL_29;
  }
LABEL_24:
  double areaRatio = self->_areaRatio;
  double v12 = -areaRatio;
  if (areaRatio >= 0.0) {
    double v12 = self->_areaRatio;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_32:
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
    double maxDistanceMeters = self->_maxDistanceMeters;
    double v18 = -maxDistanceMeters;
    if (maxDistanceMeters >= 0.0) {
      double v18 = self->_maxDistanceMeters;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_regionNameStr hash];
  NSUInteger v22 = [(NSString *)self->_countryNameStr hash];
  unint64_t v23 = [(GEOCoarseLocationPolygon *)self->_polygon hash];
  $76592BEDE77795F2213850FEF5437C34 v24 = self->_flags;
  if ((*(unsigned char *)&v24 & 0x80) != 0)
  {
    uint64_t v25 = 2654435761 * self->_representativePointQuality;
    if ((*(_WORD *)&v24 & 0x800) != 0) {
      goto LABEL_42;
    }
LABEL_44:
    uint64_t v26 = 0;
    return v33 ^ v34 ^ v32 ^ v30 ^ v29 ^ v28 ^ v9 ^ v10 ^ v31 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v25 ^ v26;
  }
  uint64_t v25 = 0;
  if ((*(_WORD *)&v24 & 0x800) == 0) {
    goto LABEL_44;
  }
LABEL_42:
  uint64_t v26 = 2654435761 * self->_shouldRandomize;
  return v33 ^ v34 ^ v32 ^ v30 ^ v29 ^ v28 ^ v9 ^ v10 ^ v31 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  long double v13 = (char *)a3;
  [v13 readAll:0];
  int v4 = *((_DWORD *)v13 + 37);
  if ((v4 & 0x200) != 0)
  {
    self->_territoryType = *((_DWORD *)v13 + 35);
    *(_DWORD *)&self->_flags |= 0x200u;
    int v4 = *((_DWORD *)v13 + 37);
    if ((v4 & 0x40) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_regionName = *((_DWORD *)v13 + 32);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v13 + 37) & 0x20) != 0)
  {
LABEL_4:
    self->_countryName = *((_DWORD *)v13 + 31);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_5:
  uint64_t v5 = [v13 coordinatesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOCoarseLocationTerritoryInfo addCoordinates:](self, "addCoordinates:", [v13 coordinatesAtIndex:i]);
  }
  double v8 = v13;
  int v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 0x400) != 0)
  {
    self->_precise = v13[144];
    *(_DWORD *)&self->_flags |= 0x400u;
    int v9 = *((_DWORD *)v13 + 37);
    if ((v9 & 8) == 0)
    {
LABEL_10:
      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_28;
    }
  }
  else if ((v9 & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_featureId = *((void *)v13 + 10);
  *(_DWORD *)&self->_flags |= 8u;
  int v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 1) == 0)
  {
LABEL_11:
    if ((v9 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_representativePoint = *(GEOCoarseLocationLatLng *)(v13 + 40);
  *(_DWORD *)&self->_flags |= 1u;
  int v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 2) == 0)
  {
LABEL_12:
    if ((v9 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double areaDegrees = *((double *)v13 + 7);
  *(_DWORD *)&self->_flags |= 2u;
  int v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 0x100) == 0)
  {
LABEL_13:
    if ((v9 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_revgeoRank = *((_DWORD *)v13 + 34);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 4) == 0)
  {
LABEL_14:
    if ((v9 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  self->_double areaRatio = *((double *)v13 + 8);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v13 + 37) & 0x10) != 0)
  {
LABEL_15:
    self->_double maxDistanceMeters = *((double *)v13 + 11);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_16:
  if (*((void *)v13 + 13))
  {
    -[GEOCoarseLocationTerritoryInfo setRegionNameStr:](self, "setRegionNameStr:");
    double v8 = v13;
  }
  if (*((void *)v8 + 9))
  {
    -[GEOCoarseLocationTerritoryInfo setCountryNameStr:](self, "setCountryNameStr:");
    double v8 = v13;
  }
  polygon = self->_polygon;
  uint64_t v11 = *((void *)v8 + 12);
  if (polygon)
  {
    if (!v11) {
      goto LABEL_36;
    }
    -[GEOCoarseLocationPolygon mergeFrom:](polygon, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_36;
    }
    -[GEOCoarseLocationTerritoryInfo setPolygon:](self, "setPolygon:");
  }
  double v8 = v13;
LABEL_36:
  int v12 = *((_DWORD *)v8 + 37);
  if ((v12 & 0x80) != 0)
  {
    self->_representativePointQuality = *((_DWORD *)v8 + 33);
    *(_DWORD *)&self->_flags |= 0x80u;
    int v12 = *((_DWORD *)v8 + 37);
  }
  if ((v12 & 0x800) != 0)
  {
    self->_shouldRandomize = v8[145];
    *(_DWORD *)&self->_flags |= 0x800u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionNameStr, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_countryNameStr, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end