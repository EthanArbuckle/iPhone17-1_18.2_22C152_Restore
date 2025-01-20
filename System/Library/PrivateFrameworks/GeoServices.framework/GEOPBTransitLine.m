@interface GEOPBTransitLine
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAlternateArtwork;
- (BOOL)hasArtwork;
- (BOOL)hasDisplayHints;
- (BOOL)hasGuidanceSnappingType;
- (BOOL)hasHeaderArtwork;
- (BOOL)hasLineColor;
- (BOOL)hasLineIndex;
- (BOOL)hasModeArtwork;
- (BOOL)hasMuid;
- (BOOL)hasNameDisplayString;
- (BOOL)hasPlaceDisplayStyle;
- (BOOL)hasPreferredDepartureTimeStyle;
- (BOOL)hasStyleAttributes;
- (BOOL)hasSystemIndex;
- (BOOL)hasTransitType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPBTransitArtwork)alternateArtwork;
- (GEOPBTransitArtwork)artwork;
- (GEOPBTransitArtwork)headerArtwork;
- (GEOPBTransitArtwork)modeArtwork;
- (GEOPBTransitLine)init;
- (GEOPBTransitLine)initWithData:(id)a3;
- (GEOPBTransitLine)initWithDictionary:(id)a3;
- (GEOPBTransitLine)initWithJSON:(id)a3;
- (GEOPBTransitLineDisplayHints)displayHints;
- (GEOPBTransitTimeRange)operatingHours;
- (GEOPBTransitTimeRange)operatingHoursAtIndex:(unint64_t)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSString)description;
- (NSString)lineColor;
- (NSString)nameDisplayString;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)geoTransitLineWithSystem:(id)a3 locationHint:(id)a4;
- (id)guidanceSnappingTypeAsString:(int)a3;
- (id)identifierWithLocationHint:(id)a3;
- (id)jsonRepresentation;
- (id)placeDisplayStyleAsString:(int)a3;
- (id)preferredDepartureTimeStyleAsString:(int)a3;
- (int)StringAsGuidanceSnappingType:(id)a3;
- (int)StringAsPlaceDisplayStyle:(id)a3;
- (int)StringAsPreferredDepartureTimeStyle:(id)a3;
- (int)guidanceSnappingType;
- (int)placeDisplayStyle;
- (int)preferredDepartureTimeStyle;
- (int)transitType;
- (uint64_t)_reserveOperatingHours:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)muid;
- (unint64_t)operatingHoursCount;
- (unsigned)lineIndex;
- (unsigned)systemIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlternateArtwork;
- (void)_readArtwork;
- (void)_readDisplayHints;
- (void)_readHeaderArtwork;
- (void)_readLineColor;
- (void)_readModeArtwork;
- (void)_readNameDisplayString;
- (void)_readOperatingHours;
- (void)_readStyleAttributes;
- (void)addOperatingHours:(GEOPBTransitTimeRange)a3;
- (void)clearOperatingHours;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlternateArtwork:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setDisplayHints:(id)a3;
- (void)setGuidanceSnappingType:(int)a3;
- (void)setHasGuidanceSnappingType:(BOOL)a3;
- (void)setHasLineIndex:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setHasPlaceDisplayStyle:(BOOL)a3;
- (void)setHasPreferredDepartureTimeStyle:(BOOL)a3;
- (void)setHasSystemIndex:(BOOL)a3;
- (void)setHasTransitType:(BOOL)a3;
- (void)setHeaderArtwork:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setLineIndex:(unsigned int)a3;
- (void)setModeArtwork:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setNameDisplayString:(id)a3;
- (void)setOperatingHours:(GEOPBTransitTimeRange *)a3 count:(unint64_t)a4;
- (void)setPlaceDisplayStyle:(int)a3;
- (void)setPreferredDepartureTimeStyle:(int)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setSystemIndex:(unsigned int)a3;
- (void)setTransitType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTransitLine

- (GEOPBTransitLine)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPBTransitLine;
  v2 = [(GEOPBTransitLine *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPBTransitLine)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPBTransitLine;
  v3 = [(GEOPBTransitLine *)&v7 initWithData:a3];
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
  [(GEOPBTransitLine *)self clearOperatingHours];
  v3.receiver = self;
  v3.super_class = (Class)GEOPBTransitLine;
  [(GEOPBTransitLine *)&v3 dealloc];
}

- (unsigned)lineIndex
{
  return self->_lineIndex;
}

- (void)setLineIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_lineIndex = a3;
}

- (void)setHasLineIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 131076;
  }
  else {
    int v3 = 0x20000;
  }
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLineIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (GEOPBTransitArtwork)artwork
{
  -[GEOPBTransitLine _readArtwork]((uint64_t)self);
  artwork = self->_artwork;

  return artwork;
}

- (void)setArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void)_readModeArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModeArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasModeArtwork
{
  return self->_modeArtwork != 0;
}

- (GEOPBTransitArtwork)modeArtwork
{
  -[GEOPBTransitLine _readModeArtwork]((uint64_t)self);
  modeArtwork = self->_modeArtwork;

  return modeArtwork;
}

- (void)setModeArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_modeArtwork, a3);
}

- (void)_readAlternateArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAlternateArtwork
{
  return self->_alternateArtwork != 0;
}

- (GEOPBTransitArtwork)alternateArtwork
{
  -[GEOPBTransitLine _readAlternateArtwork]((uint64_t)self);
  alternateArtwork = self->_alternateArtwork;

  return alternateArtwork;
}

- (void)setAlternateArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_alternateArtwork, a3);
}

- (void)_readHeaderArtwork
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHeaderArtwork_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasHeaderArtwork
{
  return self->_headerArtwork != 0;
}

- (GEOPBTransitArtwork)headerArtwork
{
  -[GEOPBTransitLine _readHeaderArtwork]((uint64_t)self);
  headerArtwork = self->_headerArtwork;

  return headerArtwork;
}

- (void)setHeaderArtwork:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_headerArtwork, a3);
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  self->_flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasMuid
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)guidanceSnappingType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_guidanceSnappingType;
  }
  else {
    return 0;
  }
}

- (void)setGuidanceSnappingType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_guidanceSnappingType = a3;
}

- (void)setHasGuidanceSnappingType:(BOOL)a3
{
  if (a3) {
    int v3 = 131074;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$28D1F72B349555397FBEEFFE487B8B4D flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasGuidanceSnappingType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)guidanceSnappingTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E5E98[a3];
  }

  return v3;
}

- (int)StringAsGuidanceSnappingType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GUIDANCE_SNAPPING_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GUIDANCE_SNAPPING_TYPE_ROAD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GUIDANCE_SNAPPING_TYPE_RAIL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLineColor
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLineColor_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasLineColor
{
  return self->_lineColor != 0;
}

- (NSString)lineColor
{
  -[GEOPBTransitLine _readLineColor]((uint64_t)self);
  lineColor = self->_lineColor;

  return lineColor;
}

- (void)setLineColor:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_lineColor, a3);
}

- (unsigned)systemIndex
{
  return self->_systemIndex;
}

- (void)setSystemIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_systemIndex = a3;
}

- (void)setHasSystemIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 131104;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$28D1F72B349555397FBEEFFE487B8B4D flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasSystemIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)transitType
{
  return self->_transitType;
}

- (void)setTransitType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  self->_transitType = a3;
}

- (void)setHasTransitType:(BOOL)a3
{
  if (a3) {
    int v3 = 131136;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$28D1F72B349555397FBEEFFE487B8B4D flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasTransitType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)preferredDepartureTimeStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_preferredDepartureTimeStyle;
  }
  else {
    return 0;
  }
}

- (void)setPreferredDepartureTimeStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_preferredDepartureTimeStyle = a3;
}

- (void)setHasPreferredDepartureTimeStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 131088;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$28D1F72B349555397FBEEFFE487B8B4D flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasPreferredDepartureTimeStyle
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)preferredDepartureTimeStyleAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E5EB0[a3];
  }

  return v3;
}

- (int)StringAsPreferredDepartureTimeStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_TIME_STYLE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TIME_STYLE_COUNTDOWN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TIME_STYLE_STAMP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TIME_STYLE_OPERATING_HOURS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT_TIME_STYLE_STAMP_LIST"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_434);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasStyleAttributes
{
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPBTransitLine _readStyleAttributes]((uint64_t)self);
  styleAttributes = self->_styleAttributes;

  return styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void)_readOperatingHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOperatingHours_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (unint64_t)operatingHoursCount
{
  return self->_operatingHoursCount;
}

- (GEOPBTransitTimeRange)operatingHours
{
  return self->_operatingHours;
}

- (uint64_t)_reserveOperatingHours:(uint64_t)a1
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
    if (12 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0xF3DCEDC5uLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 32)), 12 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)clearOperatingHours
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_operatingHoursSpace = 0;
  self->_operatingHoursCount = 0;
  free(self->_operatingHours);
  self->_operatingHours = 0;
}

- (void)addOperatingHours:(GEOPBTransitTimeRange)a3
{
  $B85216D09A238EDB5177F50F3CAD2EB5 has = a3._has;
  uint64_t v4 = *(void *)&a3._duration;
  -[GEOPBTransitLine _readOperatingHours]((uint64_t)self);
  if (self && -[GEOPBTransitLine _reserveOperatingHours:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_operatingHours[self->_operatingHoursCount];
    *(void *)&v6->_duration = v4;
    v6->_$B85216D09A238EDB5177F50F3CAD2EB5 has = has;
    ++self->_operatingHoursCount;
  }
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (GEOPBTransitTimeRange)operatingHoursAtIndex:(unint64_t)a3
{
  -[GEOPBTransitLine _readOperatingHours]((uint64_t)self);
  unint64_t operatingHoursCount = self->_operatingHoursCount;
  if (operatingHoursCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, operatingHoursCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_operatingHours[a3];
  uint64_t v11 = *(void *)&v10->_duration;
  $B85216D09A238EDB5177F50F3CAD2EB5 has = v10->_has;
  result._duration = v11;
  result._startTime = HIDWORD(v11);
  result._$B85216D09A238EDB5177F50F3CAD2EB5 has = has;
  return result;
}

- (void)setOperatingHours:(GEOPBTransitTimeRange *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  [(GEOPBTransitLine *)self clearOperatingHours];
  if (-[GEOPBTransitLine _reserveOperatingHours:]((uint64_t)self, a4))
  {
    memcpy(self->_operatingHours, a3, 12 * a4);
    self->_unint64_t operatingHoursCount = a4;
  }
}

- (void)_readDisplayHints
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayHints_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDisplayHints
{
  return self->_displayHints != 0;
}

- (GEOPBTransitLineDisplayHints)displayHints
{
  -[GEOPBTransitLine _readDisplayHints]((uint64_t)self);
  displayHints = self->_displayHints;

  return displayHints;
}

- (void)setDisplayHints:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_displayHints, a3);
}

- (void)_readNameDisplayString
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(unsigned char *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPBTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameDisplayString_tags_435);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasNameDisplayString
{
  return self->_nameDisplayString != 0;
}

- (NSString)nameDisplayString
{
  -[GEOPBTransitLine _readNameDisplayString]((uint64_t)self);
  nameDisplayString = self->_nameDisplayString;

  return nameDisplayString;
}

- (void)setNameDisplayString:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_nameDisplayString, a3);
}

- (int)placeDisplayStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_placeDisplayStyle;
  }
  else {
    return 0;
  }
}

- (void)setPlaceDisplayStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_placeDisplayStyle = a3;
}

- (void)setHasPlaceDisplayStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 131080;
  }
  else {
    int v3 = 0x20000;
  }
  self->_$28D1F72B349555397FBEEFFE487B8B4D flags = ($28D1F72B349555397FBEEFFE487B8B4D)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPlaceDisplayStyle
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)placeDisplayStyleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53E5ED8[a3];
  }

  return v3;
}

- (int)StringAsPlaceDisplayStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LINE_PLACE_DISPLAY_STYLE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LINE_PLACE_DISPLAY_STYLE_NAME_PRIMARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LINE_PLACE_DISPLAY_STYLE_NAME_SECONDARY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTransitLine;
  int v4 = [(GEOPBTransitLine *)&v8 description];
  unint64_t v5 = [(GEOPBTransitLine *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitLine _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_96;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 156) & 4) != 0)
  {
    unint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 136)];
    if (a2) {
      unint64_t v6 = @"lineIndex";
    }
    else {
      unint64_t v6 = @"line_index";
    }
    [v4 setObject:v5 forKey:v6];
  }
  uint64_t v7 = [(id)a1 artwork];
  objc_super v8 = v7;
  if (v7)
  {
    if (a2) {
      [v7 jsonRepresentation];
    }
    else {
    unint64_t v9 = [v7 dictionaryRepresentation];
    }
    [v4 setObject:v9 forKey:@"artwork"];
  }
  v10 = [(id)a1 modeArtwork];
  uint64_t v11 = v10;
  if (v10)
  {
    if (a2)
    {
      v12 = [v10 jsonRepresentation];
      v13 = @"modeArtwork";
    }
    else
    {
      v12 = [v10 dictionaryRepresentation];
      v13 = @"mode_artwork";
    }
    [v4 setObject:v12 forKey:v13];
  }
  v14 = [(id)a1 alternateArtwork];
  v15 = v14;
  if (v14)
  {
    if (a2)
    {
      v16 = [v14 jsonRepresentation];
      v17 = @"alternateArtwork";
    }
    else
    {
      v16 = [v14 dictionaryRepresentation];
      v17 = @"alternate_artwork";
    }
    [v4 setObject:v16 forKey:v17];
  }
  v18 = [(id)a1 headerArtwork];
  v19 = v18;
  if (v18)
  {
    if (a2)
    {
      v20 = [v18 jsonRepresentation];
      v21 = @"headerArtwork";
    }
    else
    {
      v20 = [v18 dictionaryRepresentation];
      v21 = @"header_artwork";
    }
    [v4 setObject:v20 forKey:v21];
  }
  int v22 = *(_DWORD *)(a1 + 156);
  if (v22)
  {
    v23 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 96)];
    [v4 setObject:v23 forKey:@"muid"];

    int v22 = *(_DWORD *)(a1 + 156);
  }
  if ((v22 & 2) != 0)
  {
    uint64_t v24 = *(int *)(a1 + 132);
    if (v24 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E53E5E98[v24];
    }
    if (a2) {
      v26 = @"guidanceSnappingType";
    }
    else {
      v26 = @"guidance_snapping_type";
    }
    [v4 setObject:v25 forKey:v26];
  }
  v27 = [(id)a1 lineColor];
  if (v27)
  {
    if (a2) {
      v28 = @"lineColor";
    }
    else {
      v28 = @"line_color";
    }
    [v4 setObject:v27 forKey:v28];
  }

  int v29 = *(_DWORD *)(a1 + 156);
  if ((v29 & 0x20) == 0)
  {
    if ((v29 & 0x40) == 0) {
      goto LABEL_44;
    }
LABEL_50:
    v32 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 152)];
    if (a2) {
      v33 = @"transitType";
    }
    else {
      v33 = @"transit_type";
    }
    [v4 setObject:v32 forKey:v33];

    if ((*(_DWORD *)(a1 + 156) & 0x10) == 0) {
      goto LABEL_61;
    }
    goto LABEL_54;
  }
  v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
  if (a2) {
    v31 = @"systemIndex";
  }
  else {
    v31 = @"system_index";
  }
  [v4 setObject:v30 forKey:v31];

  int v29 = *(_DWORD *)(a1 + 156);
  if ((v29 & 0x40) != 0) {
    goto LABEL_50;
  }
LABEL_44:
  if ((v29 & 0x10) != 0)
  {
LABEL_54:
    uint64_t v34 = *(int *)(a1 + 144);
    if (v34 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 144));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E53E5EB0[v34];
    }
    if (a2) {
      v36 = @"preferredDepartureTimeStyle";
    }
    else {
      v36 = @"preferred_departure_time_style";
    }
    [v4 setObject:v35 forKey:v36];
  }
LABEL_61:
  v37 = [(id)a1 styleAttributes];
  v38 = v37;
  if (v37)
  {
    if (a2)
    {
      v39 = [v37 jsonRepresentation];
      v40 = @"styleAttributes";
    }
    else
    {
      v39 = [v37 dictionaryRepresentation];
      v40 = @"style_attributes";
    }
    [v4 setObject:v39 forKey:v40];
  }
  if (*(void *)(a1 + 32))
  {
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v42 = 0;
      unint64_t v43 = 0;
      do
      {
        v44 = _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v42), a2);
        [v41 addObject:v44];

        ++v43;
        v42 += 12;
      }
      while (v43 < *(void *)(a1 + 32));
    }
    if (a2) {
      v45 = @"operatingHours";
    }
    else {
      v45 = @"operating_hours";
    }
    [v4 setObject:v41 forKey:v45];
  }
  v46 = [(id)a1 displayHints];
  v47 = v46;
  if (v46)
  {
    if (a2)
    {
      v48 = [v46 jsonRepresentation];
      v49 = @"displayHints";
    }
    else
    {
      v48 = [v46 dictionaryRepresentation];
      v49 = @"display_hints";
    }
    [v4 setObject:v48 forKey:v49];
  }
  v50 = [(id)a1 nameDisplayString];
  if (v50)
  {
    if (a2) {
      v51 = @"nameDisplayString";
    }
    else {
      v51 = @"name_display_string";
    }
    [v4 setObject:v50 forKey:v51];
  }

  if ((*(unsigned char *)(a1 + 156) & 8) != 0)
  {
    uint64_t v52 = *(int *)(a1 + 140);
    if (v52 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 140));
      v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53 = off_1E53E5ED8[v52];
    }
    if (a2) {
      v54 = @"placeDisplayStyle";
    }
    else {
      v54 = @"place_display_style";
    }
    [v4 setObject:v53 forKey:v54];
  }
  v55 = *(void **)(a1 + 16);
  if (v55)
  {
    v56 = [v55 dictionaryRepresentation];
    v57 = v56;
    if (a2)
    {
      v58 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v56, "count"));
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __46__GEOPBTransitLine__dictionaryRepresentation___block_invoke;
      v62[3] = &unk_1E53D8860;
      id v59 = v58;
      id v63 = v59;
      [v57 enumerateKeysAndObjectsUsingBlock:v62];
      id v60 = v59;

      v57 = v60;
    }
    [v4 setObject:v57 forKey:@"Unknown Fields"];
  }
LABEL_96:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitLine _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPBTransitLine__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOPBTransitLine)initWithDictionary:(id)a3
{
  return (GEOPBTransitLine *)-[GEOPBTransitLine _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        unint64_t v6 = @"lineIndex";
      }
      else {
        unint64_t v6 = @"line_index";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      unint64_t v8 = 0x1E4F28000uLL;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLineIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      unint64_t v9 = [v5 objectForKeyedSubscript:@"artwork"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v11 = [(GEOPBTransitArtwork *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOPBTransitArtwork *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setArtwork:v11];
      }
      if (a3) {
        v13 = @"modeArtwork";
      }
      else {
        v13 = @"mode_artwork";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v16 = [(GEOPBTransitArtwork *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOPBTransitArtwork *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setModeArtwork:v16];
      }
      if (a3) {
        v18 = @"alternateArtwork";
      }
      else {
        v18 = @"alternate_artwork";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v21 = [(GEOPBTransitArtwork *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOPBTransitArtwork *)v20 initWithDictionary:v19];
        }
        int v22 = (void *)v21;
        [a1 setAlternateArtwork:v21];
      }
      if (a3) {
        v23 = @"headerArtwork";
      }
      else {
        v23 = @"header_artwork";
      }
      uint64_t v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEOPBTransitArtwork alloc];
        if (a3) {
          uint64_t v26 = [(GEOPBTransitArtwork *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOPBTransitArtwork *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setHeaderArtwork:v26];
      }
      v28 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMuid:", objc_msgSend(v28, "unsignedLongLongValue"));
      }

      if (a3) {
        int v29 = @"guidanceSnappingType";
      }
      else {
        int v29 = @"guidance_snapping_type";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = v30;
        if ([v31 isEqualToString:@"GUIDANCE_SNAPPING_TYPE_NONE"])
        {
          uint64_t v32 = 0;
        }
        else if ([v31 isEqualToString:@"GUIDANCE_SNAPPING_TYPE_ROAD"])
        {
          uint64_t v32 = 1;
        }
        else if ([v31 isEqualToString:@"GUIDANCE_SNAPPING_TYPE_RAIL"])
        {
          uint64_t v32 = 2;
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
          goto LABEL_54;
        }
        uint64_t v32 = [v30 intValue];
      }
      [a1 setGuidanceSnappingType:v32];
LABEL_54:

      if (a3) {
        v33 = @"lineColor";
      }
      else {
        v33 = @"line_color";
      }
      uint64_t v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = (void *)[v34 copy];
        [a1 setLineColor:v35];
      }
      if (a3) {
        v36 = @"systemIndex";
      }
      else {
        v36 = @"system_index";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSystemIndex:", objc_msgSend(v37, "unsignedIntValue"));
      }

      if (a3) {
        v38 = @"transitType";
      }
      else {
        v38 = @"transit_type";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitType:", objc_msgSend(v39, "intValue"));
      }

      if (a3) {
        v40 = @"preferredDepartureTimeStyle";
      }
      else {
        v40 = @"preferred_departure_time_style";
      }
      v41 = [v5 objectForKeyedSubscript:v40];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v41;
        if ([v42 isEqualToString:@"TRANSIT_TIME_STYLE_UNKNOWN"])
        {
          uint64_t v43 = 0;
        }
        else if ([v42 isEqualToString:@"TRANSIT_TIME_STYLE_COUNTDOWN"])
        {
          uint64_t v43 = 1;
        }
        else if ([v42 isEqualToString:@"TRANSIT_TIME_STYLE_STAMP"])
        {
          uint64_t v43 = 2;
        }
        else if ([v42 isEqualToString:@"TRANSIT_TIME_STYLE_OPERATING_HOURS"])
        {
          uint64_t v43 = 3;
        }
        else if ([v42 isEqualToString:@"TRANSIT_TIME_STYLE_STAMP_LIST"])
        {
          uint64_t v43 = 4;
        }
        else
        {
          uint64_t v43 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_88;
        }
        uint64_t v43 = [v41 intValue];
      }
      [a1 setPreferredDepartureTimeStyle:v43];
LABEL_88:

      if (a3) {
        v44 = @"styleAttributes";
      }
      else {
        v44 = @"style_attributes";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [GEOStyleAttributes alloc];
        if (a3) {
          uint64_t v47 = [(GEOStyleAttributes *)v46 initWithJSON:v45];
        }
        else {
          uint64_t v47 = [(GEOStyleAttributes *)v46 initWithDictionary:v45];
        }
        v48 = (void *)v47;
        [a1 setStyleAttributes:v47];
      }
      if (a3) {
        v49 = @"operatingHours";
      }
      else {
        v49 = @"operating_hours";
      }
      v50 = [v5 objectForKeyedSubscript:v49];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v70 = v5;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v51 = v50;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v73 objects:v77 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v74 != v54) {
                objc_enumerationMutation(v51);
              }
              v56 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v72 = 0;
                uint64_t v71 = 0;
                _GEOPDTimeRangeFromDictionaryRepresentation(v56, (uint64_t)&v71, a3);
                unint64_t v8 = v8 & 0xFFFFFFFF00000000 | v72;
                objc_msgSend(a1, "addOperatingHours:", v71, v8);
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v73 objects:v77 count:16];
          }
          while (v53);
        }

        id v5 = v70;
      }

      if (a3) {
        v57 = @"displayHints";
      }
      else {
        v57 = @"display_hints";
      }
      v58 = [v5 objectForKeyedSubscript:v57];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v59 = [GEOPBTransitLineDisplayHints alloc];
        if (a3) {
          uint64_t v60 = [(GEOPBTransitLineDisplayHints *)v59 initWithJSON:v58];
        }
        else {
          uint64_t v60 = [(GEOPBTransitLineDisplayHints *)v59 initWithDictionary:v58];
        }
        v61 = (void *)v60;
        [a1 setDisplayHints:v60];
      }
      if (a3) {
        v62 = @"nameDisplayString";
      }
      else {
        v62 = @"name_display_string";
      }
      id v63 = [v5 objectForKeyedSubscript:v62];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v64 = (void *)[v63 copy];
        [a1 setNameDisplayString:v64];
      }
      if (a3) {
        v65 = @"placeDisplayStyle";
      }
      else {
        v65 = @"place_display_style";
      }
      v66 = [v5 objectForKeyedSubscript:v65];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v67 = v66;
        if ([v67 isEqualToString:@"LINE_PLACE_DISPLAY_STYLE_DEFAULT"])
        {
          uint64_t v68 = 0;
        }
        else if ([v67 isEqualToString:@"LINE_PLACE_DISPLAY_STYLE_NAME_PRIMARY"])
        {
          uint64_t v68 = 1;
        }
        else if ([v67 isEqualToString:@"LINE_PLACE_DISPLAY_STYLE_NAME_SECONDARY"])
        {
          uint64_t v68 = 2;
        }
        else
        {
          uint64_t v68 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_138:

          goto LABEL_139;
        }
        uint64_t v68 = [v66 intValue];
      }
      [a1 setPlaceDisplayStyle:v68];
      goto LABEL_138;
    }
  }
LABEL_139:

  return a1;
}

- (GEOPBTransitLine)initWithJSON:(id)a3
{
  return (GEOPBTransitLine *)-[GEOPBTransitLine _initWithDictionary:isJSON:](self, a3, 1);
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
      unint64_t v8 = (int *)&readAll__recursiveTag_512;
    }
    else {
      unint64_t v8 = (int *)&readAll__nonRecursiveTag_513;
    }
    GEOPBTransitLineReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPBTransitLineCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitLineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitLineReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPBTransitLineIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    goto LABEL_39;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitLine *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_artwork) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_modeArtwork) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_alternateArtwork) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_headerArtwork) {
    PBDataWriterWriteSubmessage();
  }
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    PBDataWriterWriteUint64Field();
    $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_lineColor) {
    PBDataWriterWriteStringField();
  }
  $28D1F72B349555397FBEEFFE487B8B4D v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x20) == 0)
  {
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_21;
    }
LABEL_36:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  PBDataWriterWriteUint32Field();
  $28D1F72B349555397FBEEFFE487B8B4D v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x40) != 0) {
    goto LABEL_36;
  }
LABEL_21:
  if ((*(unsigned char *)&v7 & 0x10) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_styleAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_operatingHoursCount)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPBTransitTimeRangeWriteTo((uint64_t)&self->_operatingHours[v8]);
      PBDataWriterRecallMark();
      ++v9;
      ++v8;
    }
    while (v9 < self->_operatingHoursCount);
  }
  if (self->_displayHints) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_nameDisplayString) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_39:
}

- (void)copyTo:(id)a3
{
  v13 = (id *)a3;
  [(GEOPBTransitLine *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 30) = self->_readerMarkPos;
  *((_DWORD *)v13 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v13;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v13 + 34) = self->_lineIndex;
    *((_DWORD *)v13 + 39) |= 4u;
  }
  if (self->_artwork)
  {
    objc_msgSend(v13, "setArtwork:");
    id v4 = v13;
  }
  if (self->_modeArtwork)
  {
    objc_msgSend(v13, "setModeArtwork:");
    id v4 = v13;
  }
  if (self->_alternateArtwork)
  {
    objc_msgSend(v13, "setAlternateArtwork:");
    id v4 = v13;
  }
  if (self->_headerArtwork)
  {
    objc_msgSend(v13, "setHeaderArtwork:");
    id v4 = v13;
  }
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    v4[12] = self->_muid;
    *((_DWORD *)v4 + 39) |= 1u;
    $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_guidanceSnappingType;
    *((_DWORD *)v4 + 39) |= 2u;
  }
  if (self->_lineColor)
  {
    objc_msgSend(v13, "setLineColor:");
    id v4 = v13;
  }
  $28D1F72B349555397FBEEFFE487B8B4D v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 37) = self->_systemIndex;
    *((_DWORD *)v4 + 39) |= 0x20u;
    $28D1F72B349555397FBEEFFE487B8B4D v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 0x40) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v6 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)v4 + 38) = self->_transitType;
  *((_DWORD *)v4 + 39) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 36) = self->_preferredDepartureTimeStyle;
    *((_DWORD *)v4 + 39) |= 0x10u;
  }
LABEL_21:
  if (self->_styleAttributes) {
    objc_msgSend(v13, "setStyleAttributes:");
  }
  if ([(GEOPBTransitLine *)self operatingHoursCount])
  {
    [v13 clearOperatingHours];
    unint64_t v7 = [(GEOPBTransitLine *)self operatingHoursCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(GEOPBTransitLine *)self operatingHoursAtIndex:i];
        objc_msgSend(v13, "addOperatingHours:", v10, v11);
      }
    }
  }
  if (self->_displayHints) {
    objc_msgSend(v13, "setDisplayHints:");
  }
  v12 = v13;
  if (self->_nameDisplayString)
  {
    objc_msgSend(v13, "setNameDisplayString:");
    v12 = v13;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v12 + 35) = self->_placeDisplayStyle;
    *((_DWORD *)v12 + 39) |= 8u;
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
    if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPBTransitLineReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPBTransitLine *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_lineIndex;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
  id v9 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  id v11 = [(GEOPBTransitArtwork *)self->_modeArtwork copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  id v13 = [(GEOPBTransitArtwork *)self->_alternateArtwork copyWithZone:a3];
  v14 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v13;

  id v15 = [(GEOPBTransitArtwork *)self->_headerArtwork copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v15;

  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    *(void *)(v5 + 96) = self->_muid;
    *(_DWORD *)(v5 + 156) |= 1u;
    $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_guidanceSnappingType;
    *(_DWORD *)(v5 + 156) |= 2u;
  }
  uint64_t v18 = [(NSString *)self->_lineColor copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  $28D1F72B349555397FBEEFFE487B8B4D v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 0x20) == 0)
  {
    if ((*(unsigned char *)&v20 & 0x40) == 0) {
      goto LABEL_13;
    }
LABEL_22:
    *(_DWORD *)(v5 + 152) = self->_transitType;
    *(_DWORD *)(v5 + 156) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  *(_DWORD *)(v5 + 148) = self->_systemIndex;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  $28D1F72B349555397FBEEFFE487B8B4D v20 = self->_flags;
  if ((*(unsigned char *)&v20 & 0x40) != 0) {
    goto LABEL_22;
  }
LABEL_13:
  if ((*(unsigned char *)&v20 & 0x10) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 144) = self->_preferredDepartureTimeStyle;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
LABEL_15:
  id v21 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
  int v22 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v21;

  unint64_t operatingHoursCount = self->_operatingHoursCount;
  if (operatingHoursCount)
  {
    -[GEOPBTransitLine _reserveOperatingHours:](v5, operatingHoursCount);
    memcpy(*(void **)(v5 + 24), self->_operatingHours, 12 * self->_operatingHoursCount);
    *(void *)(v5 + 32) = self->_operatingHoursCount;
  }
  id v24 = [(GEOPBTransitLineDisplayHints *)self->_displayHints copyWithZone:a3];
  v25 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v24;

  uint64_t v26 = [(NSString *)self->_nameDisplayString copyWithZone:a3];
  v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_placeDisplayStyle;
    *(_DWORD *)(v5 + 156) |= 8u;
  }
  v28 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v28;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  [(GEOPBTransitLine *)self readAll:1];
  [v4 readAll:1];
  int v5 = *((_DWORD *)v4 + 39);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((v5 & 4) == 0 || self->_lineIndex != *((_DWORD *)v4 + 34)) {
      goto LABEL_47;
    }
  }
  else if ((v5 & 4) != 0)
  {
    goto LABEL_47;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | (unint64_t)v4[7] && !-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")) {
    goto LABEL_47;
  }
  modeArtwork = self->_modeArtwork;
  if ((unint64_t)modeArtwork | (unint64_t)v4[11])
  {
    if (!-[GEOPBTransitArtwork isEqual:](modeArtwork, "isEqual:")) {
      goto LABEL_47;
    }
  }
  alternateArtwork = self->_alternateArtwork;
  if ((unint64_t)alternateArtwork | (unint64_t)v4[6])
  {
    if (!-[GEOPBTransitArtwork isEqual:](alternateArtwork, "isEqual:")) {
      goto LABEL_47;
    }
  }
  headerArtwork = self->_headerArtwork;
  if ((unint64_t)headerArtwork | (unint64_t)v4[9])
  {
    if (!-[GEOPBTransitArtwork isEqual:](headerArtwork, "isEqual:")) {
      goto LABEL_47;
    }
  }
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  int v11 = *((_DWORD *)v4 + 39);
  if (*(unsigned char *)&flags)
  {
    if ((v11 & 1) == 0 || (const void *)self->_muid != v4[12]) {
      goto LABEL_47;
    }
  }
  else if (v11)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_guidanceSnappingType != *((_DWORD *)v4 + 33)) {
      goto LABEL_47;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_47;
  }
  lineColor = self->_lineColor;
  if ((unint64_t)lineColor | (unint64_t)v4[10])
  {
    if (!-[NSString isEqual:](lineColor, "isEqual:")) {
      goto LABEL_47;
    }
    $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
    int v11 = *((_DWORD *)v4 + 39);
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_systemIndex != *((_DWORD *)v4 + 37)) {
      goto LABEL_47;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_transitType != *((_DWORD *)v4 + 38)) {
      goto LABEL_47;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_preferredDepartureTimeStyle != *((_DWORD *)v4 + 36)) {
      goto LABEL_47;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  styleAttributes = self->_styleAttributes;
  if (!((unint64_t)styleAttributes | (unint64_t)v4[14])
    || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
  {
    unint64_t operatingHoursCount = self->_operatingHoursCount;
    if ((const void *)operatingHoursCount == v4[4] && !memcmp(self->_operatingHours, v4[3], 12 * operatingHoursCount))
    {
      displayHints = self->_displayHints;
      if (!((unint64_t)displayHints | (unint64_t)v4[8])
        || -[GEOPBTransitLineDisplayHints isEqual:](displayHints, "isEqual:"))
      {
        nameDisplayString = self->_nameDisplayString;
        if (!((unint64_t)nameDisplayString | (unint64_t)v4[13])
          || -[NSString isEqual:](nameDisplayString, "isEqual:"))
        {
          if ((*(unsigned char *)&self->_flags & 8) == 0)
          {
            BOOL v15 = (*((_DWORD *)v4 + 39) & 8) == 0;
            goto LABEL_48;
          }
          if ((*((_DWORD *)v4 + 39) & 8) != 0 && self->_placeDisplayStyle == *((_DWORD *)v4 + 35))
          {
            BOOL v15 = 1;
            goto LABEL_48;
          }
        }
      }
    }
  }
LABEL_47:
  BOOL v15 = 0;
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  [(GEOPBTransitLine *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v22 = 2654435761 * self->_lineIndex;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v21 = [(GEOPBTransitArtwork *)self->_artwork hash];
  unint64_t v20 = [(GEOPBTransitArtwork *)self->_modeArtwork hash];
  unint64_t v19 = [(GEOPBTransitArtwork *)self->_alternateArtwork hash];
  unint64_t v18 = [(GEOPBTransitArtwork *)self->_headerArtwork hash];
  $28D1F72B349555397FBEEFFE487B8B4D flags = self->_flags;
  if (*(unsigned char *)&flags)
  {
    unint64_t v17 = 2654435761u * self->_muid;
    if ((*(unsigned char *)&flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
LABEL_6:
      uint64_t v16 = 2654435761 * self->_guidanceSnappingType;
      goto LABEL_9;
    }
  }
  uint64_t v16 = 0;
LABEL_9:
  NSUInteger v14 = [(NSString *)self->_lineColor hash];
  $28D1F72B349555397FBEEFFE487B8B4D v4 = self->_flags;
  if ((*(unsigned char *)&v4 & 0x20) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v5 = 2654435761 * self->_systemIndex;
  if ((*(unsigned char *)&v4 & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v6 = 2654435761 * self->_transitType;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_12:
    uint64_t v7 = 2654435761 * self->_preferredDepartureTimeStyle;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
LABEL_16:
  unint64_t v8 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  uint64_t v9 = PBHashBytes();
  unint64_t v10 = [(GEOPBTransitLineDisplayHints *)self->_displayHints hash];
  NSUInteger v11 = [(NSString *)self->_nameDisplayString hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    uint64_t v12 = 2654435761 * self->_placeDisplayStyle;
  }
  else {
    uint64_t v12 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  v25 = (unsigned int *)a3;
  [v25 readAll:0];
  $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
  if ((v25[39] & 4) != 0)
  {
    self->_lineIndex = v25[34];
    *(_DWORD *)&self->_flags |= 4u;
  }
  artwork = self->_artwork;
  uint64_t v6 = *((void *)v25 + 7);
  if (artwork)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPBTransitArtwork mergeFrom:](artwork, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPBTransitLine setArtwork:](self, "setArtwork:");
  }
  $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
LABEL_9:
  modeArtwork = self->_modeArtwork;
  uint64_t v8 = *((void *)v4 + 11);
  if (modeArtwork)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPBTransitArtwork mergeFrom:](modeArtwork, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPBTransitLine setModeArtwork:](self, "setModeArtwork:");
  }
  $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
LABEL_15:
  alternateArtwork = self->_alternateArtwork;
  uint64_t v10 = *((void *)v4 + 6);
  if (alternateArtwork)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPBTransitArtwork mergeFrom:](alternateArtwork, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPBTransitLine setAlternateArtwork:](self, "setAlternateArtwork:");
  }
  $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
LABEL_21:
  headerArtwork = self->_headerArtwork;
  uint64_t v12 = *((void *)v4 + 9);
  if (headerArtwork)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPBTransitArtwork mergeFrom:](headerArtwork, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPBTransitLine setHeaderArtwork:](self, "setHeaderArtwork:");
  }
  $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
LABEL_27:
  unsigned int v13 = v4[39];
  if (v13)
  {
    self->_muid = *((void *)v4 + 12);
    *(_DWORD *)&self->_flags |= 1u;
    unsigned int v13 = v4[39];
  }
  if ((v13 & 2) != 0)
  {
    self->_guidanceSnappingType = v4[33];
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 10))
  {
    -[GEOPBTransitLine setLineColor:](self, "setLineColor:");
    $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
  }
  unsigned int v14 = v4[39];
  if ((v14 & 0x20) != 0)
  {
    self->_systemIndex = v4[37];
    *(_DWORD *)&self->_flags |= 0x20u;
    unsigned int v14 = v4[39];
    if ((v14 & 0x40) == 0)
    {
LABEL_35:
      if ((v14 & 0x10) == 0) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  self->_transitType = v4[38];
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((v4[39] & 0x10) != 0)
  {
LABEL_36:
    self->_preferredDepartureTimeStyle = v4[36];
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_37:
  styleAttributes = self->_styleAttributes;
  uint64_t v16 = *((void *)v4 + 14);
  if (styleAttributes)
  {
    if (!v16) {
      goto LABEL_46;
    }
    -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_46;
    }
    -[GEOPBTransitLine setStyleAttributes:](self, "setStyleAttributes:");
  }
  $28D1F72B349555397FBEEFFE487B8B4D v4 = v25;
LABEL_46:
  uint64_t v17 = [v4 operatingHoursCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t i = 0; i != v18; ++i)
    {
      uint64_t v20 = [v25 operatingHoursAtIndex:i];
      -[GEOPBTransitLine addOperatingHours:](self, "addOperatingHours:", v20, v21);
    }
  }
  displayHints = self->_displayHints;
  v23 = v25;
  uint64_t v24 = *((void *)v25 + 8);
  if (displayHints)
  {
    if (!v24) {
      goto LABEL_55;
    }
    -[GEOPBTransitLineDisplayHints mergeFrom:](displayHints, "mergeFrom:");
  }
  else
  {
    if (!v24) {
      goto LABEL_55;
    }
    -[GEOPBTransitLine setDisplayHints:](self, "setDisplayHints:");
  }
  v23 = v25;
LABEL_55:
  if (*((void *)v23 + 13))
  {
    -[GEOPBTransitLine setNameDisplayString:](self, "setNameDisplayString:");
    v23 = v25;
  }
  if ((v23[39] & 8) != 0)
  {
    self->_placeDisplayStyle = v23[35];
    *(_DWORD *)&self->_flags |= 8u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOPBTransitLineReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_517);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x20080u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPBTransitLine *)self readAll:0];
    [(GEOPBTransitArtwork *)self->_artwork clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_modeArtwork clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_alternateArtwork clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_headerArtwork clearUnknownFields:1];
    [(GEOStyleAttributes *)self->_styleAttributes clearUnknownFields:1];
    displayHints = self->_displayHints;
    [(GEOPBTransitLineDisplayHints *)displayHints clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_nameDisplayString, 0);
  objc_storeStrong((id *)&self->_modeArtwork, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_headerArtwork, 0);
  objc_storeStrong((id *)&self->_displayHints, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_alternateArtwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)geoTransitLineWithSystem:(id)a3 locationHint:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  uint64_t v8 = -[_GEOTransitLine initWithLine:system:locationHint:]([_GEOTransitLine alloc], "initWithLine:system:locationHint:", self, v7, var0, var1);

  return v8;
}

- (id)identifierWithLocationHint:(id)a3
{
  BOOL v3 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [(GEOPBTransitLine *)self muid], 0, a3.var0, a3.var1);

  return v3;
}

@end