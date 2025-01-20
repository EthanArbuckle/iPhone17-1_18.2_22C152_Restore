@interface GEOFormatArgument
+ (BOOL)isValid:(id)a3;
+ (Class)timestampDataType;
- (BOOL)hasArtwork;
- (BOOL)hasCountdownData;
- (BOOL)hasFormat;
- (BOOL)hasGenericCombinations;
- (BOOL)hasManeuverData;
- (BOOL)hasMeasurementData;
- (BOOL)hasNumberData;
- (BOOL)hasPrice;
- (BOOL)hasStringSubstituteData;
- (BOOL)hasToken;
- (BOOL)hasUrlData;
- (BOOL)hasValInt1;
- (BOOL)hasValInt2;
- (BOOL)hasValString;
- (BOOL)hasWaypointIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldScaleUnits;
- (GEOCountdownData)countdownData;
- (GEOFormatArgument)init;
- (GEOFormatArgument)initWithData:(id)a3;
- (GEOFormatArgument)initWithDictionary:(id)a3;
- (GEOFormatArgument)initWithJSON:(id)a3;
- (GEOGenericCombinations)genericCombinations;
- (GEOGenericStringData)stringSubstituteData;
- (GEOManeuverData)maneuverData;
- (GEOMeasurementData)measurementData;
- (GEOPBTransitArtwork)artwork;
- (GEOPrice)price;
- (GEOServerFormatTokenNumberData)numberData;
- (GEOURLData)urlData;
- (NSArray)timeStampValues;
- (NSArray)value3s;
- (NSMutableArray)timestampDatas;
- (NSString)accessibilityLabel;
- (NSString)description;
- (NSString)token;
- (NSString)valString;
- (PBUnknownFields)unknownFields;
- (double)_secondsRoundedUpToNearestMinute:(double)a3;
- (float)percentageValue;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_formatterForDurationString;
- (id)_stringForDurationSeconds:(double)a3 unitsStyle:(int64_t)a4;
- (id)_stringForPower:(double)a3 unit:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)formatAsString:(int)a3;
- (id)jsonRepresentation;
- (id)stringWithDefaultValues;
- (id)timestampDataAtIndex:(unint64_t)a3;
- (int)StringAsFormat:(id)a3;
- (int)format;
- (int)waypointIndex;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)timestampDatasCount;
- (unint64_t)valInt3sCount;
- (unsigned)valInt1;
- (unsigned)valInt2;
- (unsigned)valInt3AtIndex:(unint64_t)a3;
- (unsigned)valInt3s;
- (void)_addNoFlagsTimestampData:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtwork;
- (void)_readCountdownData;
- (void)_readGenericCombinations;
- (void)_readManeuverData;
- (void)_readMeasurementData;
- (void)_readNumberData;
- (void)_readPrice;
- (void)_readStringSubstituteData;
- (void)_readTimestampDatas;
- (void)_readToken;
- (void)_readUrlData;
- (void)_readValInt3s;
- (void)_readValString;
- (void)addTimestampData:(id)a3;
- (void)addValInt3:(unsigned int)a3;
- (void)clearTimestampDatas;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearValInt3s;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtwork:(id)a3;
- (void)setCountdownData:(id)a3;
- (void)setFormat:(int)a3;
- (void)setGenericCombinations:(id)a3;
- (void)setHasFormat:(BOOL)a3;
- (void)setHasValInt1:(BOOL)a3;
- (void)setHasValInt2:(BOOL)a3;
- (void)setHasWaypointIndex:(BOOL)a3;
- (void)setManeuverData:(id)a3;
- (void)setMeasurementData:(id)a3;
- (void)setNumberData:(id)a3;
- (void)setPrice:(id)a3;
- (void)setStringSubstituteData:(id)a3;
- (void)setTimestampDatas:(id)a3;
- (void)setToken:(id)a3;
- (void)setUrlData:(id)a3;
- (void)setValInt1:(unsigned int)a3;
- (void)setValInt2:(unsigned int)a3;
- (void)setValInt3s:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setValString:(id)a3;
- (void)setWaypointIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOFormatArgument

- (GEOFormatArgument)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOFormatArgument;
  v2 = [(GEOFormatArgument *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOFormatArgument)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOFormatArgument;
  v3 = [(GEOFormatArgument *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOFormatArgument;
  [(GEOFormatArgument *)&v3 dealloc];
}

- (void)_readToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToken_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (NSString)token
{
  -[GEOFormatArgument _readToken]((uint64_t)self);
  token = self->_token;

  return token;
}

- (void)setToken:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000u;
  objc_storeStrong((id *)&self->_token, a3);
}

- (unsigned)valInt1
{
  return self->_valInt1;
}

- (void)setValInt1:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40002u;
  self->_valInt1 = a3;
}

- (void)setHasValInt1:(BOOL)a3
{
  if (a3) {
    int v3 = 262146;
  }
  else {
    int v3 = 0x40000;
  }
  self->_flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasValInt1
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)valInt2
{
  return self->_valInt2;
}

- (void)setValInt2:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x40004u;
  self->_valInt2 = a3;
}

- (void)setHasValInt2:(BOOL)a3
{
  if (a3) {
    int v3 = 262148;
  }
  else {
    int v3 = 0x40000;
  }
  self->_flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFBFFFB | v3);
}

- (BOOL)hasValInt2
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readValInt3s
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 172) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValInt3s_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (unint64_t)valInt3sCount
{
  return self->_valInt3s.count;
}

- (unsigned)valInt3s
{
  return self->_valInt3s.list;
}

- (void)clearValInt3s
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;

  PBRepeatedUInt32Clear();
}

- (void)addValInt3:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (unsigned)valInt3AtIndex:(unint64_t)a3
{
  -[GEOFormatArgument _readValInt3s]((uint64_t)self);
  p_valInt3s = &self->_valInt3s;
  unint64_t count = self->_valInt3s.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_valInt3s->list[a3];
}

- (void)setValInt3s:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;

  MEMORY[0x1F4147400](&self->_valInt3s, a3, a4);
}

- (void)_readValString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 174) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasValString
{
  return self->_valString != 0;
}

- (NSString)valString
{
  -[GEOFormatArgument _readValString]((uint64_t)self);
  valString = self->_valString;

  return valString;
}

- (void)setValString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x60000u;
  objc_storeStrong((id *)&self->_valString, a3);
}

- (void)_readPrice
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrice_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasPrice
{
  return self->_price != 0;
}

- (GEOPrice)price
{
  -[GEOFormatArgument _readPrice]((uint64_t)self);
  price = self->_price;

  return price;
}

- (void)setPrice:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x41000u;
  objc_storeStrong((id *)&self->_price, a3);
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 172) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_2321);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOFormatArgument _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40040u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readTimestampDatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimestampDatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)timestampDatas
{
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  timestampDatas = self->_timestampDatas;

  return timestampDatas;
}

- (void)setTimestampDatas:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  timestampDatas = self->_timestampDatas;
  self->_timestampDatas = v4;
}

- (void)clearTimestampDatas
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  timestampDatas = self->_timestampDatas;

  [(NSMutableArray *)timestampDatas removeAllObjects];
}

- (void)addTimestampData:(id)a3
{
  id v4 = a3;
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  -[GEOFormatArgument _addNoFlagsTimestampData:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (void)_addNoFlagsTimestampData:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)timestampDatasCount
{
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  timestampDatas = self->_timestampDatas;

  return [(NSMutableArray *)timestampDatas count];
}

- (id)timestampDataAtIndex:(unint64_t)a3
{
  -[GEOFormatArgument _readTimestampDatas]((uint64_t)self);
  timestampDatas = self->_timestampDatas;

  return (id)[(NSMutableArray *)timestampDatas objectAtIndex:a3];
}

+ (Class)timestampDataType
{
  return (Class)objc_opt_class();
}

- (void)_readCountdownData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 172) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountdownData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasCountdownData
{
  return self->_countdownData != 0;
}

- (GEOCountdownData)countdownData
{
  -[GEOFormatArgument _readCountdownData]((uint64_t)self);
  countdownData = self->_countdownData;

  return countdownData;
}

- (void)setCountdownData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40080u;
  objc_storeStrong((id *)&self->_countdownData, a3);
}

- (void)_readNumberData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNumberData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasNumberData
{
  return self->_numberData != 0;
}

- (GEOServerFormatTokenNumberData)numberData
{
  -[GEOFormatArgument _readNumberData]((uint64_t)self);
  numberData = self->_numberData;

  return (GEOServerFormatTokenNumberData *)numberData;
}

- (void)setNumberData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40800u;
  objc_storeStrong((id *)&self->_numberData, a3);
}

- (void)_readMeasurementData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMeasurementData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasMeasurementData
{
  return self->_measurementData != 0;
}

- (GEOMeasurementData)measurementData
{
  -[GEOFormatArgument _readMeasurementData]((uint64_t)self);
  measurementData = self->_measurementData;

  return measurementData;
}

- (void)setMeasurementData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40400u;
  objc_storeStrong((id *)&self->_measurementData, a3);
}

- (void)_readUrlData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 174) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrlData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasUrlData
{
  return self->_urlData != 0;
}

- (GEOURLData)urlData
{
  -[GEOFormatArgument _readUrlData]((uint64_t)self);
  urlData = self->_urlData;

  return urlData;
}

- (void)setUrlData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x50000u;
  objc_storeStrong((id *)&self->_urlData, a3);
}

- (void)_readManeuverData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readManeuverData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasManeuverData
{
  return self->_maneuverData != 0;
}

- (GEOManeuverData)maneuverData
{
  -[GEOFormatArgument _readManeuverData]((uint64_t)self);
  maneuverData = self->_maneuverData;

  return maneuverData;
}

- (void)setManeuverData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40200u;
  objc_storeStrong((id *)&self->_maneuverData, a3);
}

- (void)_readStringSubstituteData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStringSubstituteData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasStringSubstituteData
{
  return self->_stringSubstituteData != 0;
}

- (GEOGenericStringData)stringSubstituteData
{
  -[GEOFormatArgument _readStringSubstituteData]((uint64_t)self);
  stringSubstituteData = self->_stringSubstituteData;

  return stringSubstituteData;
}

- (void)setStringSubstituteData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x42000u;
  objc_storeStrong((id *)&self->_stringSubstituteData, a3);
}

- (void)_readGenericCombinations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 173) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOFormatArgumentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGenericCombinations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasGenericCombinations
{
  return self->_genericCombinations != 0;
}

- (GEOGenericCombinations)genericCombinations
{
  -[GEOFormatArgument _readGenericCombinations]((uint64_t)self);
  genericCombinations = self->_genericCombinations;

  return genericCombinations;
}

- (void)setGenericCombinations:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x40100u;
  objc_storeStrong((id *)&self->_genericCombinations, a3);
}

- (int)format
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_format;
  }
  else {
    return 0;
  }
}

- (void)setFormat:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40001u;
  self->_format = a3;
}

- (void)setHasFormat:(BOOL)a3
{
  self->_$7A3EB02FEAFF35E6843F3D548DA5361E flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000);
}

- (BOOL)hasFormat
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)formatAsString:(int)a3
{
  if a3 < 0x13 && ((0x7FF7Fu >> a3))
  {
    id v3 = off_1E53E00F0[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsFormat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISTANCE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TIMESTAMP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DURATION_SHORT_UNITS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DURATION_MEDIUM_UNITS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FREQUENCY_VALUE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FREQUENCY_RANGE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PRICE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TIMESTAMP_LIST"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"STRING"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ARTWORK"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"COUNTDOWN_LIST"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PERCENTAGE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MANEUVER"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"POWER"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"GENERIC_STRING"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"GENERIC_COMBINATIONS"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)waypointIndex
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_waypointIndex;
  }
  else {
    return -1;
  }
}

- (void)setWaypointIndex:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40008u;
  self->_waypointIndex = a3;
}

- (void)setHasWaypointIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 262152;
  }
  else {
    int v3 = 0x40000;
  }
  self->_$7A3EB02FEAFF35E6843F3D548DA5361E flags = ($7A3EB02FEAFF35E6843F3D548DA5361E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasWaypointIndex
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOFormatArgument;
  int v4 = [(GEOFormatArgument *)&v8 description];
  id v5 = [(GEOFormatArgument *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormatArgument _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 token];
    if (v5) {
      [v4 setObject:v5 forKey:@"token"];
    }

    int v6 = *(_DWORD *)(a1 + 172);
    if ((v6 & 2) != 0)
    {
      id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 160)];
      if (a2) {
        objc_super v8 = @"valInt1";
      }
      else {
        objc_super v8 = @"val_int_1";
      }
      [v4 setObject:v7 forKey:v8];

      int v6 = *(_DWORD *)(a1 + 172);
    }
    if ((v6 & 4) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 164)];
      if (a2) {
        v10 = @"valInt2";
      }
      else {
        v10 = @"val_int_2";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if (*(void *)(a1 + 32))
    {
      v11 = PBRepeatedUInt32NSArray();
      if (a2) {
        v12 = @"valInt3";
      }
      else {
        v12 = @"val_int_3";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 valString];
    if (v13)
    {
      if (a2) {
        v14 = @"valString";
      }
      else {
        v14 = @"val_string";
      }
      [v4 setObject:v13 forKey:v14];
    }

    v15 = [(id)a1 price];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"price"];
    }
    v18 = [(id)a1 artwork];
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"artwork"];
    }
    if ([*(id *)(a1 + 112) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v22 = *(id *)(a1 + 112);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v73 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v24);
      }

      if (a2) {
        v29 = @"timestampData";
      }
      else {
        v29 = @"timestamp_data";
      }
      [v4 setObject:v21 forKey:v29];
    }
    v30 = [(id)a1 countdownData];
    v31 = v30;
    if (v30)
    {
      if (a2)
      {
        v32 = [v30 jsonRepresentation];
        v33 = @"countdownData";
      }
      else
      {
        v32 = [v30 dictionaryRepresentation];
        v33 = @"countdown_data";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = [(id)a1 numberData];
    v35 = v34;
    if (v34)
    {
      if (a2)
      {
        v36 = [v34 jsonRepresentation];
        v37 = @"numberData";
      }
      else
      {
        v36 = [v34 dictionaryRepresentation];
        v37 = @"number_data";
      }
      [v4 setObject:v36 forKey:v37];
    }
    v38 = [(id)a1 measurementData];
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"measurementData";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"measurement_data";
      }
      [v4 setObject:v40 forKey:v41];
    }
    v42 = [(id)a1 urlData];
    v43 = v42;
    if (v42)
    {
      if (a2)
      {
        v44 = [v42 jsonRepresentation];
        v45 = @"urlData";
      }
      else
      {
        v44 = [v42 dictionaryRepresentation];
        v45 = @"url_data";
      }
      [v4 setObject:v44 forKey:v45];
    }
    v46 = [(id)a1 maneuverData];
    v47 = v46;
    if (v46)
    {
      if (a2)
      {
        v48 = [v46 jsonRepresentation];
        v49 = @"maneuverData";
      }
      else
      {
        v48 = [v46 dictionaryRepresentation];
        v49 = @"maneuver_data";
      }
      [v4 setObject:v48 forKey:v49];
    }
    v50 = [(id)a1 stringSubstituteData];
    v51 = v50;
    if (v50)
    {
      if (a2)
      {
        v52 = [v50 jsonRepresentation];
        v53 = @"stringSubstituteData";
      }
      else
      {
        v52 = [v50 dictionaryRepresentation];
        v53 = @"string_substitute_data";
      }
      [v4 setObject:v52 forKey:v53];
    }
    v54 = [(id)a1 genericCombinations];
    v55 = v54;
    if (v54)
    {
      if (a2)
      {
        v56 = [v54 jsonRepresentation];
        v57 = @"genericCombinations";
      }
      else
      {
        v56 = [v54 dictionaryRepresentation];
        v57 = @"generic_combinations";
      }
      [v4 setObject:v56 forKey:v57];
    }
    int v58 = *(_DWORD *)(a1 + 172);
    if (v58)
    {
      uint64_t v59 = *(int *)(a1 + 156);
      if v59 < 0x13 && ((0x7FF7Fu >> v59))
      {
        v60 = off_1E53E00F0[v59];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 156));
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v4 setObject:v60 forKey:@"format"];

      int v58 = *(_DWORD *)(a1 + 172);
    }
    if ((v58 & 8) != 0)
    {
      v61 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 168)];
      if (a2) {
        v62 = @"waypointIndex";
      }
      else {
        v62 = @"waypoint_index";
      }
      [v4 setObject:v61 forKey:v62];
    }
    v63 = *(void **)(a1 + 16);
    if (v63)
    {
      v64 = [v63 dictionaryRepresentation];
      v65 = v64;
      if (a2)
      {
        v66 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v64, "count"));
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __47__GEOFormatArgument__dictionaryRepresentation___block_invoke;
        v70[3] = &unk_1E53D8860;
        id v67 = v66;
        id v71 = v67;
        [v65 enumerateKeysAndObjectsUsingBlock:v70];
        id v68 = v67;

        v65 = v68;
      }
      [v4 setObject:v65 forKey:@"Unknown Fields"];
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
  return -[GEOFormatArgument _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOFormatArgument__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOFormatArgument)initWithDictionary:(id)a3
{
  return (GEOFormatArgument *)-[GEOFormatArgument _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_165;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_165;
  }
  int v6 = [v5 objectForKeyedSubscript:@"token"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[v6 copy];
    [a1 setToken:v7];
  }
  if (a3) {
    objc_super v8 = @"valInt1";
  }
  else {
    objc_super v8 = @"val_int_1";
  }
  v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setValInt1:", objc_msgSend(v9, "unsignedIntValue"));
  }

  if (a3) {
    id v10 = @"valInt2";
  }
  else {
    id v10 = @"val_int_2";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setValInt2:", objc_msgSend(v11, "unsignedIntValue"));
  }

  if (a3) {
    v12 = @"valInt3";
  }
  else {
    v12 = @"val_int_3";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v89 objects:v94 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v90 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addValInt3:", objc_msgSend(v19, "unsignedIntValue"));
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v89 objects:v94 count:16];
      }
      while (v16);
    }
  }
  if (a3) {
    v20 = @"valString";
  }
  else {
    v20 = @"val_string";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = (void *)[v21 copy];
    [a1 setValString:v22];
  }
  uint64_t v23 = [v5 objectForKeyedSubscript:@"price"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [GEOPrice alloc];
    if (a3) {
      uint64_t v25 = [(GEOPrice *)v24 initWithJSON:v23];
    }
    else {
      uint64_t v25 = [(GEOPrice *)v24 initWithDictionary:v23];
    }
    v26 = (void *)v25;
    [a1 setPrice:v25];
  }
  v27 = [v5 objectForKeyedSubscript:@"artwork"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v29 = [(GEOPBTransitArtwork *)v28 initWithJSON:v27];
    }
    else {
      uint64_t v29 = [(GEOPBTransitArtwork *)v28 initWithDictionary:v27];
    }
    v30 = (void *)v29;
    [a1 setArtwork:v29];
  }
  if (a3) {
    v31 = @"timestampData";
  }
  else {
    v31 = @"timestamp_data";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v83 = v32;
    id v84 = v5;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v85 objects:v93 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v86 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v85 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v39 = [GEOTimestampData alloc];
            if (a3) {
              uint64_t v40 = [(GEOTimestampData *)v39 initWithJSON:v38];
            }
            else {
              uint64_t v40 = [(GEOTimestampData *)v39 initWithDictionary:v38];
            }
            v41 = (void *)v40;
            objc_msgSend(a1, "addTimestampData:", v40, v83, v84, (void)v85);
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v85 objects:v93 count:16];
      }
      while (v35);
    }

    v32 = v83;
    id v5 = v84;
  }

  if (a3) {
    v42 = @"countdownData";
  }
  else {
    v42 = @"countdown_data";
  }
  v43 = objc_msgSend(v5, "objectForKeyedSubscript:", v42, v83, v84);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [GEOCountdownData alloc];
    if (a3) {
      uint64_t v45 = [(GEOCountdownData *)v44 initWithJSON:v43];
    }
    else {
      uint64_t v45 = [(GEOCountdownData *)v44 initWithDictionary:v43];
    }
    v46 = (void *)v45;
    [a1 setCountdownData:v45];
  }
  if (a3) {
    v47 = @"numberData";
  }
  else {
    v47 = @"number_data";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v49 = [GEONumberData alloc];
    if (a3) {
      uint64_t v50 = [(GEONumberData *)v49 initWithJSON:v48];
    }
    else {
      uint64_t v50 = [(GEONumberData *)v49 initWithDictionary:v48];
    }
    v51 = (void *)v50;
    [a1 setNumberData:v50];
  }
  if (a3) {
    v52 = @"measurementData";
  }
  else {
    v52 = @"measurement_data";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v54 = [GEOMeasurementData alloc];
    if (a3) {
      uint64_t v55 = [(GEOMeasurementData *)v54 initWithJSON:v53];
    }
    else {
      uint64_t v55 = [(GEOMeasurementData *)v54 initWithDictionary:v53];
    }
    v56 = (void *)v55;
    [a1 setMeasurementData:v55];
  }
  if (a3) {
    v57 = @"urlData";
  }
  else {
    v57 = @"url_data";
  }
  int v58 = [v5 objectForKeyedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v59 = [GEOURLData alloc];
    if (a3) {
      uint64_t v60 = [(GEOURLData *)v59 initWithJSON:v58];
    }
    else {
      uint64_t v60 = [(GEOURLData *)v59 initWithDictionary:v58];
    }
    v61 = (void *)v60;
    [a1 setUrlData:v60];
  }
  if (a3) {
    v62 = @"maneuverData";
  }
  else {
    v62 = @"maneuver_data";
  }
  v63 = [v5 objectForKeyedSubscript:v62];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = [GEOManeuverData alloc];
    if (a3) {
      uint64_t v65 = [(GEOManeuverData *)v64 initWithJSON:v63];
    }
    else {
      uint64_t v65 = [(GEOManeuverData *)v64 initWithDictionary:v63];
    }
    v66 = (void *)v65;
    [a1 setManeuverData:v65];
  }
  if (a3) {
    id v67 = @"stringSubstituteData";
  }
  else {
    id v67 = @"string_substitute_data";
  }
  id v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v69 = [GEOGenericStringData alloc];
    if (a3) {
      uint64_t v70 = [(GEOGenericStringData *)v69 initWithJSON:v68];
    }
    else {
      uint64_t v70 = [(GEOGenericStringData *)v69 initWithDictionary:v68];
    }
    id v71 = (void *)v70;
    [a1 setStringSubstituteData:v70];
  }
  if (a3) {
    long long v72 = @"genericCombinations";
  }
  else {
    long long v72 = @"generic_combinations";
  }
  long long v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v74 = [GEOGenericCombinations alloc];
    if (a3) {
      uint64_t v75 = [(GEOGenericCombinations *)v74 initWithJSON:v73];
    }
    else {
      uint64_t v75 = [(GEOGenericCombinations *)v74 initWithDictionary:v73];
    }
    v76 = (void *)v75;
    [a1 setGenericCombinations:v75];
  }
  uint64_t v77 = [v5 objectForKeyedSubscript:@"format"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v78 = v77;
    if ([v78 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v79 = 0;
    }
    else if ([v78 isEqualToString:@"DISTANCE"])
    {
      uint64_t v79 = 1;
    }
    else if ([v78 isEqualToString:@"TIMESTAMP"])
    {
      uint64_t v79 = 2;
    }
    else if ([v78 isEqualToString:@"DURATION_SHORT_UNITS"])
    {
      uint64_t v79 = 3;
    }
    else if ([v78 isEqualToString:@"DURATION_MEDIUM_UNITS"])
    {
      uint64_t v79 = 4;
    }
    else if ([v78 isEqualToString:@"FREQUENCY_VALUE"])
    {
      uint64_t v79 = 5;
    }
    else if ([v78 isEqualToString:@"FREQUENCY_RANGE"])
    {
      uint64_t v79 = 6;
    }
    else if ([v78 isEqualToString:@"PRICE"])
    {
      uint64_t v79 = 8;
    }
    else if ([v78 isEqualToString:@"TIMESTAMP_LIST"])
    {
      uint64_t v79 = 9;
    }
    else if ([v78 isEqualToString:@"STRING"])
    {
      uint64_t v79 = 10;
    }
    else if ([v78 isEqualToString:@"ARTWORK"])
    {
      uint64_t v79 = 11;
    }
    else if ([v78 isEqualToString:@"COUNTDOWN_LIST"])
    {
      uint64_t v79 = 12;
    }
    else if ([v78 isEqualToString:@"PERCENTAGE"])
    {
      uint64_t v79 = 13;
    }
    else if ([v78 isEqualToString:@"URL"])
    {
      uint64_t v79 = 14;
    }
    else if ([v78 isEqualToString:@"MANEUVER"])
    {
      uint64_t v79 = 15;
    }
    else if ([v78 isEqualToString:@"POWER"])
    {
      uint64_t v79 = 16;
    }
    else if ([v78 isEqualToString:@"GENERIC_STRING"])
    {
      uint64_t v79 = 17;
    }
    else if ([v78 isEqualToString:@"GENERIC_COMBINATIONS"])
    {
      uint64_t v79 = 18;
    }
    else
    {
      uint64_t v79 = 0;
    }

    goto LABEL_158;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v79 = [v77 intValue];
LABEL_158:
    [a1 setFormat:v79];
  }

  if (a3) {
    v80 = @"waypointIndex";
  }
  else {
    v80 = @"waypoint_index";
  }
  v81 = [v5 objectForKeyedSubscript:v80];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWaypointIndex:", objc_msgSend(v81, "intValue"));
  }

LABEL_165:
  return a1;
}

- (GEOFormatArgument)initWithJSON:(id)a3
{
  return (GEOFormatArgument *)-[GEOFormatArgument _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2418;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2419;
    }
    GEOFormatArgumentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOFormatArgumentCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormatArgumentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormatArgumentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOFormatArgumentIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOFormatArgument *)self readAll:0];
    if (self->_token) {
      PBDataWriterWriteStringField();
    }
    $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_valInt3s.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_valInt3s.count);
    }
    if (self->_valString) {
      PBDataWriterWriteStringField();
    }
    if (self->_price) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_artwork) {
      PBDataWriterWriteSubmessage();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v8 = self->_timestampDatas;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if (self->_countdownData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_numberData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_measurementData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_urlData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_maneuverData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_stringSubstituteData) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_genericCombinations) {
      PBDataWriterWriteSubmessage();
    }
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = self->_flags;
    if (*(unsigned char *)&v12)
    {
      PBDataWriterWriteInt32Field();
      $7A3EB02FEAFF35E6843F3D548DA5361E v12 = self->_flags;
    }
    if ((*(unsigned char *)&v12 & 8) != 0) {
      PBDataWriterWriteInt32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
  }
}

- (void)copyTo:(id)a3
{
  id v14 = (id *)a3;
  [(GEOFormatArgument *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v14 + 1, self->_reader);
  *((_DWORD *)v14 + 36) = self->_readerMarkPos;
  *((_DWORD *)v14 + 37) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_token) {
    objc_msgSend(v14, "setToken:");
  }
  $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v14 + 40) = self->_valInt1;
    *((_DWORD *)v14 + 43) |= 2u;
    $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *((_DWORD *)v14 + 41) = self->_valInt2;
    *((_DWORD *)v14 + 43) |= 4u;
  }
  if ([(GEOFormatArgument *)self valInt3sCount])
  {
    [v14 clearValInt3s];
    unint64_t v5 = [(GEOFormatArgument *)self valInt3sCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v14, "addValInt3:", -[GEOFormatArgument valInt3AtIndex:](self, "valInt3AtIndex:", i));
    }
  }
  if (self->_valString) {
    objc_msgSend(v14, "setValString:");
  }
  if (self->_price) {
    objc_msgSend(v14, "setPrice:");
  }
  if (self->_artwork) {
    objc_msgSend(v14, "setArtwork:");
  }
  if ([(GEOFormatArgument *)self timestampDatasCount])
  {
    [v14 clearTimestampDatas];
    unint64_t v8 = [(GEOFormatArgument *)self timestampDatasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(GEOFormatArgument *)self timestampDataAtIndex:j];
        [v14 addTimestampData:v11];
      }
    }
  }
  if (self->_countdownData) {
    objc_msgSend(v14, "setCountdownData:");
  }
  $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  if (self->_numberData)
  {
    objc_msgSend(v14, "setNumberData:");
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  }
  if (self->_measurementData)
  {
    objc_msgSend(v14, "setMeasurementData:");
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  }
  if (self->_urlData)
  {
    objc_msgSend(v14, "setUrlData:");
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  }
  if (self->_maneuverData)
  {
    objc_msgSend(v14, "setManeuverData:");
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  }
  if (self->_stringSubstituteData)
  {
    objc_msgSend(v14, "setStringSubstituteData:");
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  }
  if (self->_genericCombinations)
  {
    objc_msgSend(v14, "setGenericCombinations:");
    $7A3EB02FEAFF35E6843F3D548DA5361E v12 = v14;
  }
  $7A3EB02FEAFF35E6843F3D548DA5361E v13 = self->_flags;
  if (*(unsigned char *)&v13)
  {
    *((_DWORD *)v12 + 39) = self->_format;
    *((_DWORD *)v12 + 43) |= 1u;
    $7A3EB02FEAFF35E6843F3D548DA5361E v13 = self->_flags;
  }
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    *((_DWORD *)v12 + 42) = self->_waypointIndex;
    *((_DWORD *)v12 + 43) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOFormatArgumentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOFormatArgument *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_token copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v9;

  $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_valInt1;
    *(_DWORD *)(v5 + 172) |= 2u;
    $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_valInt2;
    *(_DWORD *)(v5 + 172) |= 4u;
  }
  PBRepeatedUInt32Copy();
  uint64_t v12 = [(NSString *)self->_valString copyWithZone:a3];
  $7A3EB02FEAFF35E6843F3D548DA5361E v13 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v12;

  id v14 = [(GEOPrice *)self->_price copyWithZone:a3];
  long long v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  id v16 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  long long v17 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v16;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v18 = self->_timestampDatas;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (void)v40);
        [(id)v5 addTimestampData:v22];
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v19);
  }

  id v23 = [(GEOCountdownData *)self->_countdownData copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v23;

  id v25 = [(GEONumberData *)self->_numberData copyWithZone:a3];
  v26 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v25;

  id v27 = [(GEOMeasurementData *)self->_measurementData copyWithZone:a3];
  v28 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v27;

  id v29 = [(GEOURLData *)self->_urlData copyWithZone:a3];
  v30 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v29;

  id v31 = [(GEOManeuverData *)self->_maneuverData copyWithZone:a3];
  v32 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v31;

  id v33 = [(GEOGenericStringData *)self->_stringSubstituteData copyWithZone:a3];
  uint64_t v34 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v33;

  id v35 = [(GEOGenericCombinations *)self->_genericCombinations copyWithZone:a3];
  uint64_t v36 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v35;

  $7A3EB02FEAFF35E6843F3D548DA5361E v37 = self->_flags;
  if (*(unsigned char *)&v37)
  {
    *(_DWORD *)(v5 + 156) = self->_format;
    *(_DWORD *)(v5 + 172) |= 1u;
    $7A3EB02FEAFF35E6843F3D548DA5361E v37 = self->_flags;
  }
  if ((*(unsigned char *)&v37 & 8) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_waypointIndex;
    *(_DWORD *)(v5 + 172) |= 8u;
  }
  uint64_t v38 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v38;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  [(GEOFormatArgument *)self readAll:1];
  [v4 readAll:1];
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](token, "isEqual:")) {
      goto LABEL_46;
    }
  }
  $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 43);
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_valInt1 != *((_DWORD *)v4 + 40)) {
      goto LABEL_46;
    }
  }
  else if ((v7 & 2) != 0)
  {
LABEL_46:
    BOOL v21 = 0;
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_valInt2 != *((_DWORD *)v4 + 41)) {
      goto LABEL_46;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_46;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_46;
  }
  valString = self->_valString;
  if ((unint64_t)valString | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](valString, "isEqual:")) {
      goto LABEL_46;
    }
  }
  price = self->_price;
  if ((unint64_t)price | *((void *)v4 + 12))
  {
    if (!-[GEOPrice isEqual:](price, "isEqual:")) {
      goto LABEL_46;
    }
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 6))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
      goto LABEL_46;
    }
  }
  timestampDatas = self->_timestampDatas;
  if ((unint64_t)timestampDatas | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](timestampDatas, "isEqual:")) {
      goto LABEL_46;
    }
  }
  countdownData = self->_countdownData;
  if ((unint64_t)countdownData | *((void *)v4 + 7))
  {
    if (!-[GEOCountdownData isEqual:](countdownData, "isEqual:")) {
      goto LABEL_46;
    }
  }
  numberData = self->_numberData;
  if ((unint64_t)numberData | *((void *)v4 + 11))
  {
    if (!-[GEONumberData isEqual:](numberData, "isEqual:")) {
      goto LABEL_46;
    }
  }
  measurementData = self->_measurementData;
  if ((unint64_t)measurementData | *((void *)v4 + 10))
  {
    if (!-[GEOMeasurementData isEqual:](measurementData, "isEqual:")) {
      goto LABEL_46;
    }
  }
  urlData = self->_urlData;
  if ((unint64_t)urlData | *((void *)v4 + 16))
  {
    if (!-[GEOURLData isEqual:](urlData, "isEqual:")) {
      goto LABEL_46;
    }
  }
  maneuverData = self->_maneuverData;
  if ((unint64_t)maneuverData | *((void *)v4 + 9))
  {
    if (!-[GEOManeuverData isEqual:](maneuverData, "isEqual:")) {
      goto LABEL_46;
    }
  }
  stringSubstituteData = self->_stringSubstituteData;
  if ((unint64_t)stringSubstituteData | *((void *)v4 + 13))
  {
    if (!-[GEOGenericStringData isEqual:](stringSubstituteData, "isEqual:")) {
      goto LABEL_46;
    }
  }
  genericCombinations = self->_genericCombinations;
  if ((unint64_t)genericCombinations | *((void *)v4 + 8))
  {
    if (!-[GEOGenericCombinations isEqual:](genericCombinations, "isEqual:")) {
      goto LABEL_46;
    }
  }
  $7A3EB02FEAFF35E6843F3D548DA5361E v19 = self->_flags;
  int v20 = *((_DWORD *)v4 + 43);
  if (*(unsigned char *)&v19)
  {
    if ((v20 & 1) == 0 || self->_format != *((_DWORD *)v4 + 39)) {
      goto LABEL_46;
    }
  }
  else if (v20)
  {
    goto LABEL_46;
  }
  BOOL v21 = (*((_DWORD *)v4 + 43) & 8) == 0;
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_waypointIndex != *((_DWORD *)v4 + 42)) {
      goto LABEL_46;
    }
    BOOL v21 = 1;
  }
LABEL_47:

  return v21;
}

- (unint64_t)hash
{
  [(GEOFormatArgument *)self readAll:1];
  NSUInteger v22 = [(NSString *)self->_token hash];
  $7A3EB02FEAFF35E6843F3D548DA5361E flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    uint64_t v21 = 2654435761 * self->_valInt1;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&flags & 4) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_valInt2;
      goto LABEL_6;
    }
  }
  uint64_t v20 = 0;
LABEL_6:
  uint64_t v19 = PBRepeatedUInt32Hash();
  NSUInteger v18 = [(NSString *)self->_valString hash];
  unint64_t v17 = [(GEOPrice *)self->_price hash];
  unint64_t v16 = [(GEOPBTransitArtwork *)self->_artwork hash];
  uint64_t v4 = [(NSMutableArray *)self->_timestampDatas hash];
  unint64_t v5 = [(GEOCountdownData *)self->_countdownData hash];
  unint64_t v6 = [(GEONumberData *)self->_numberData hash];
  unint64_t v7 = [(GEOMeasurementData *)self->_measurementData hash];
  unint64_t v8 = [(GEOURLData *)self->_urlData hash];
  unint64_t v9 = [(GEOManeuverData *)self->_maneuverData hash];
  unint64_t v10 = [(GEOGenericStringData *)self->_stringSubstituteData hash];
  unint64_t v11 = [(GEOGenericCombinations *)self->_genericCombinations hash];
  $7A3EB02FEAFF35E6843F3D548DA5361E v12 = self->_flags;
  if (*(unsigned char *)&v12)
  {
    uint64_t v13 = 2654435761 * self->_format;
    if ((*(unsigned char *)&v12 & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v14 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&v12 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v14 = 2654435761 * self->_waypointIndex;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 15)) {
    -[GEOFormatArgument setToken:](self, "setToken:");
  }
  int v5 = *((_DWORD *)v4 + 43);
  if ((v5 & 2) != 0)
  {
    self->_valInt1 = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_flags |= 2u;
    int v5 = *((_DWORD *)v4 + 43);
  }
  if ((v5 & 4) != 0)
  {
    self->_valInt2 = *((_DWORD *)v4 + 41);
    *(_DWORD *)&self->_flags |= 4u;
  }
  uint64_t v6 = [v4 valInt3sCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[GEOFormatArgument addValInt3:](self, "addValInt3:", [v4 valInt3AtIndex:i]);
  }
  if (*((void *)v4 + 17)) {
    -[GEOFormatArgument setValString:](self, "setValString:");
  }
  price = self->_price;
  uint64_t v10 = *((void *)v4 + 12);
  if (price)
  {
    if (v10) {
      -[GEOPrice mergeFrom:](price, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEOFormatArgument setPrice:](self, "setPrice:");
  }
  artwork = self->_artwork;
  uint64_t v12 = *((void *)v4 + 6);
  if (artwork)
  {
    if (v12) {
      -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[GEOFormatArgument setArtwork:](self, "setArtwork:");
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = *((id *)v4 + 14);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOFormatArgument addTimestampData:](self, "addTimestampData:", *(void *)(*((void *)&v33 + 1) + 8 * j), (void)v33);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v15);
  }

  countdownData = self->_countdownData;
  uint64_t v19 = *((void *)v4 + 7);
  if (countdownData)
  {
    if (v19) {
      -[GEOCountdownData mergeFrom:](countdownData, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[GEOFormatArgument setCountdownData:](self, "setCountdownData:");
  }
  numberData = self->_numberData;
  uint64_t v21 = *((void *)v4 + 11);
  if (numberData)
  {
    if (v21) {
      -[GEONumberData mergeFrom:](numberData, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOFormatArgument setNumberData:](self, "setNumberData:");
  }
  measurementData = self->_measurementData;
  uint64_t v23 = *((void *)v4 + 10);
  if (measurementData)
  {
    if (v23) {
      -[GEOMeasurementData mergeFrom:](measurementData, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOFormatArgument setMeasurementData:](self, "setMeasurementData:");
  }
  urlData = self->_urlData;
  uint64_t v25 = *((void *)v4 + 16);
  if (urlData)
  {
    if (v25) {
      -[GEOURLData mergeFrom:](urlData, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[GEOFormatArgument setUrlData:](self, "setUrlData:");
  }
  maneuverData = self->_maneuverData;
  uint64_t v27 = *((void *)v4 + 9);
  if (maneuverData)
  {
    if (v27) {
      -[GEOManeuverData mergeFrom:](maneuverData, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[GEOFormatArgument setManeuverData:](self, "setManeuverData:");
  }
  stringSubstituteData = self->_stringSubstituteData;
  uint64_t v29 = *((void *)v4 + 13);
  if (stringSubstituteData)
  {
    if (v29) {
      -[GEOGenericStringData mergeFrom:](stringSubstituteData, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[GEOFormatArgument setStringSubstituteData:](self, "setStringSubstituteData:");
  }
  genericCombinations = self->_genericCombinations;
  uint64_t v31 = *((void *)v4 + 8);
  if (genericCombinations)
  {
    if (v31) {
      -[GEOGenericCombinations mergeFrom:](genericCombinations, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[GEOFormatArgument setGenericCombinations:](self, "setGenericCombinations:");
  }
  int v32 = *((_DWORD *)v4 + 43);
  if (v32)
  {
    self->_format = *((_DWORD *)v4 + 39);
    *(_DWORD *)&self->_flags |= 1u;
    int v32 = *((_DWORD *)v4 + 43);
  }
  if ((v32 & 8) != 0)
  {
    self->_waypointIndex = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 8u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      int v5 = reader;
      objc_sync_enter(v5);
      GEOFormatArgumentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2423);
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
  *(_DWORD *)&self->_flags |= 0x40010u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOFormatArgument *)self readAll:0];
    [(GEOPrice *)self->_price clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_artwork clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_timestampDatas;
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

    [(GEOCountdownData *)self->_countdownData clearUnknownFields:1];
    [(GEONumberData *)self->_numberData clearUnknownFields:1];
    [(GEOMeasurementData *)self->_measurementData clearUnknownFields:1];
    [(GEOURLData *)self->_urlData clearUnknownFields:1];
    [(GEOManeuverData *)self->_maneuverData clearUnknownFields:1];
    [(GEOGenericStringData *)self->_stringSubstituteData clearUnknownFields:1];
    [(GEOGenericCombinations *)self->_genericCombinations clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valString, 0);
  objc_storeStrong((id *)&self->_urlData, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_timestampDatas, 0);
  objc_storeStrong((id *)&self->_stringSubstituteData, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_numberData, 0);
  objc_storeStrong((id *)&self->_measurementData, 0);
  objc_storeStrong((id *)&self->_maneuverData, 0);
  objc_storeStrong((id *)&self->_genericCombinations, 0);
  objc_storeStrong((id *)&self->_countdownData, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (int64_t)type
{
  int v2 = [(GEOFormatArgument *)self format] - 1;
  if (v2 > 0x11) {
    return 0;
  }
  else {
    return qword_18A63E368[v2];
  }
}

- (NSArray)value3s
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOFormatArgument valInt3sCount](self, "valInt3sCount"));
  if ([(GEOFormatArgument *)self valInt3sCount])
  {
    unint64_t v4 = 0;
    do
    {
      int v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOFormatArgument valInt3AtIndex:](self, "valInt3AtIndex:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(GEOFormatArgument *)self valInt3sCount]);
  }
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return (NSArray *)v6;
}

- (float)percentageValue
{
  int v2 = [(GEOFormatArgument *)self numberData];
  [v2 value];
  float v4 = v3;

  return v4;
}

- (NSArray)timeStampValues
{
  int v2 = [(GEOFormatArgument *)self timestampDatas];
  float v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)shouldScaleUnits
{
  float v3 = [(GEOFormatArgument *)self measurementData];
  if ([v3 hasEnableUnitScaling])
  {
    float v4 = [(GEOFormatArgument *)self measurementData];
    char v5 = [v4 enableUnitScaling];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (NSString)accessibilityLabel
{
  float v3 = [(GEOFormatArgument *)self artworkValue];
  float v4 = [v3 accessibilityText];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(GEOFormatArgument *)self stringValue];
  }
  uint64_t v7 = v6;

  return (NSString *)v7;
}

- (id)stringWithDefaultValues
{
  int v3 = [(GEOFormatArgument *)self format];
  if (v3 == 16)
  {
    id v6 = [(GEOFormatArgument *)self numberData];

    if (v6)
    {
      uint64_t v7 = [(GEOFormatArgument *)self numberData];
      [v7 value];
      double v9 = v8;
      uint64_t v10 = [MEMORY[0x1E4F291F0] kilowatts];
      uint64_t v11 = [(GEOFormatArgument *)self _stringForPower:v10 unit:v9];

      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (v3 == 4)
  {
    [(GEOFormatArgument *)self _secondsRoundedUpToNearestMinute:(double)[(GEOFormatArgument *)self valInt1]];
    float v4 = self;
    uint64_t v5 = 3;
    goto LABEL_9;
  }
  if (v3 != 3)
  {
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  [(GEOFormatArgument *)self _secondsRoundedUpToNearestMinute:(double)[(GEOFormatArgument *)self valInt1]];
  float v4 = self;
  uint64_t v5 = 2;
LABEL_9:
  uint64_t v11 = -[GEOFormatArgument _stringForDurationSeconds:unitsStyle:](v4, "_stringForDurationSeconds:unitsStyle:", v5);
LABEL_10:

  return v11;
}

- (double)_secondsRoundedUpToNearestMinute:(double)a3
{
  return ceil(a3 / 60.0) * 60.0;
}

- (id)_stringForDurationSeconds:(double)a3 unitsStyle:(int64_t)a4
{
  id v6 = [(GEOFormatArgument *)self _formatterForDurationString];
  [v6 setUnitsStyle:a4];
  uint64_t v7 = [v6 stringFromTimeInterval:a3];
  if ([v7 length])
  {
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"," withString:&stru_1ED51F370];

    uint64_t v7 = (void *)v8;
  }

  return v7;
}

- (id)_formatterForDurationString
{
  if (qword_1EB29FFE0 != -1) {
    dispatch_once(&qword_1EB29FFE0, &__block_literal_global_137);
  }
  int v2 = (void *)_MergedGlobals_279;

  return v2;
}

uint64_t __67__GEOFormatArgument_GEOServicesExtras___formatterForDurationString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)_MergedGlobals_279;
  _MergedGlobals_279 = (uint64_t)v0;

  [(id)_MergedGlobals_279 setZeroFormattingBehavior:14];
  [(id)_MergedGlobals_279 setAllowedUnits:112];
  int v2 = (void *)_MergedGlobals_279;

  return [v2 setMaximumUnitCount:2];
}

- (id)_stringForPower:(double)a3 unit:(id)a4
{
  uint64_t v5 = qword_1EB29FFF0;
  id v6 = a4;
  if (v5 != -1) {
    dispatch_once(&qword_1EB29FFF0, &__block_literal_global_10_1);
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E28]) initWithDoubleValue:v6 unit:a3];

  uint64_t v8 = [(id)qword_1EB29FFE8 stringFromMeasurement:v7];

  return v8;
}

void __61__GEOFormatArgument_GEOServicesExtras___stringForPower_unit___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E30]);
  v1 = (void *)qword_1EB29FFE8;
  qword_1EB29FFE8 = (uint64_t)v0;
}

@end