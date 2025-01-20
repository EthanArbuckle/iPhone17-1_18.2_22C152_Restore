@interface GEOLocation
+ (BOOL)isValid:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)hasAccurateCourse;
- (BOOL)hasAltitude;
- (BOOL)hasCoarseMetadata;
- (BOOL)hasCourse;
- (BOOL)hasCourseAccuracy;
- (BOOL)hasCourseType;
- (BOOL)hasFormOfWay;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHeading;
- (BOOL)hasHorizontalAccuracy;
- (BOOL)hasIsMatchedLocation;
- (BOOL)hasIsShifted;
- (BOOL)hasLevelOrdinal;
- (BOOL)hasMatchQuality;
- (BOOL)hasRawCoordinate;
- (BOOL)hasRawCourse;
- (BOOL)hasReferenceFrame;
- (BOOL)hasRoadClass;
- (BOOL)hasSpeed;
- (BOOL)hasSpeedAccuracy;
- (BOOL)hasTimestamp;
- (BOOL)hasTransitID;
- (BOOL)hasTransportType;
- (BOOL)hasType;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMatchedLocation;
- (BOOL)isShifted;
- (BOOL)readFrom:(id)a3;
- (GEOCoarseLocationMetadata)coarseMetadata;
- (GEOLatLng)latLng;
- (GEOLatLng)rawCoordinate;
- (GEOLocation)init;
- (GEOLocation)initWithData:(id)a3;
- (GEOLocation)initWithDictionary:(id)a3;
- (GEOLocation)initWithGEOCoordinate:(id)a3;
- (GEOLocation)initWithGEOCoordinate:(id)a3 floorOrdinal:(int)a4;
- (GEOLocation)initWithGEOCoordinate:(id)a3 isUserLocation:(BOOL)a4;
- (GEOLocation)initWithJSON:(id)a3;
- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4;
- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4 floorOrdinal:(int)a5;
- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4 isUserLocation:(BOOL)a5 floorOrdinal:(int)a6;
- (GEOLocation)initWithLocation:(id)a3;
- (GEOLocation)initWithLocation:(id)a3 floorOrdinal:(int)a4;
- (GEOLocation)initWithLocation:(id)a3 isUserLocation:(BOOL)a4 floorOrdinal:(int)a5;
- (PBUnknownFields)unknownFields;
- (double)course;
- (double)courseAccuracy;
- (double)heading;
- (double)horizontalAccuracy;
- (double)rawCourse;
- (double)speed;
- (double)speedAccuracy;
- (double)timestamp;
- (double)verticalAccuracy;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)courseTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formOfWayAsString:(int)a3;
- (id)jsonRepresentation;
- (id)matchQualityAsString:(int)a3;
- (id)referenceFrameAsString:(int)a3;
- (id)roadClassAsString:(int)a3;
- (id)transportTypeAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsCourseType:(id)a3;
- (int)StringAsFormOfWay:(id)a3;
- (int)StringAsMatchQuality:(id)a3;
- (int)StringAsReferenceFrame:(id)a3;
- (int)StringAsRoadClass:(id)a3;
- (int)StringAsTransportType:(id)a3;
- (int)StringAsType:(id)a3;
- (int)altitude;
- (int)courseType;
- (int)formOfWay;
- (int)levelOrdinal;
- (int)matchQuality;
- (int)referenceFrame;
- (int)roadClass;
- (int)transportType;
- (int)type;
- (unint64_t)hash;
- (unint64_t)transitID;
- (void)_readCoarseMetadata;
- (void)_readLatLng;
- (void)_readRawCoordinate;
- (void)applyCoarseLocationRandomizationWithMaximumDistance:(double)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearSensitiveFieldsForCoarseLocation;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAltitude:(int)a3;
- (void)setCoarseMetadata:(id)a3;
- (void)setCourse:(double)a3;
- (void)setCourseAccuracy:(double)a3;
- (void)setCourseType:(int)a3;
- (void)setFormOfWay:(int)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasCourse:(BOOL)a3;
- (void)setHasCourseAccuracy:(BOOL)a3;
- (void)setHasCourseType:(BOOL)a3;
- (void)setHasFormOfWay:(BOOL)a3;
- (void)setHasHeading:(BOOL)a3;
- (void)setHasHorizontalAccuracy:(BOOL)a3;
- (void)setHasIsMatchedLocation:(BOOL)a3;
- (void)setHasIsShifted:(BOOL)a3;
- (void)setHasLevelOrdinal:(BOOL)a3;
- (void)setHasMatchQuality:(BOOL)a3;
- (void)setHasRawCourse:(BOOL)a3;
- (void)setHasReferenceFrame:(BOOL)a3;
- (void)setHasRoadClass:(BOOL)a3;
- (void)setHasSpeed:(BOOL)a3;
- (void)setHasSpeedAccuracy:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTransitID:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setHeading:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setIsMatchedLocation:(BOOL)a3;
- (void)setIsShifted:(BOOL)a3;
- (void)setLatLng:(id)a3;
- (void)setLevelOrdinal:(int)a3;
- (void)setMatchQuality:(int)a3;
- (void)setRawCoordinate:(id)a3;
- (void)setRawCourse:(double)a3;
- (void)setReferenceFrame:(int)a3;
- (void)setRoadClass:(int)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedAccuracy:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTransitID:(unint64_t)a3;
- (void)setTransportType:(int)a3;
- (void)setType:(int)a3;
- (void)setVerticalAccuracy:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocation

- (BOOL)readFrom:(id)a3
{
  return GEOLocationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)setVerticalAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000200u;
  self->_verticalAccuracy = a3;
}

- (void)setType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2040000u;
  self->_type = a3;
}

- (void)setIsShifted:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2100000u;
  self->_isShifted = a3;
}

- (void)setIsMatchedLocation:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2080000u;
  self->_isMatchedLocation = a3;
}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2008000u;
  self->_referenceFrame = a3;
}

- (void)setTimestamp:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000080u;
  self->_timestamp = a3;
}

- (void)setAltitude:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000400u;
  self->_altitude = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawCoordinate, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_coarseMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setRawCourse:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000010u;
  self->_rawCourse = a3;
}

- (void)setCourseAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000001u;
  self->_courseAccuracy = a3;
}

- (void)setCourse:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000002u;
  self->_course = a3;
}

- (BOOL)hasSpeedAccuracy
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)hasIsMatchedLocation
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)hasTransitID
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (BOOL)hasReferenceFrame
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (BOOL)hasIsShifted
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (void)setSpeedAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000020u;
  self->_speedAccuracy = a3;
}

- (void)setSpeed:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000040u;
  self->_speed = a3;
}

- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4
{
  return [(GEOLocation *)self initWithLatitude:0x7FFFFFFFLL longitude:a3 floorOrdinal:a4];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  v2 = [(GEOLocation *)self latLng];
  [v2 coordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (GEOLatLng)latLng
{
  -[GEOLocation _readLatLng]((uint64_t)self);
  latLng = self->_latLng;

  return latLng;
}

- (void)_readLatLng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 182) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatLng_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (GEOLatLng)rawCoordinate
{
  -[GEOLocation _readRawCoordinate]((uint64_t)self);
  rawCoordinate = self->_rawCoordinate;

  return rawCoordinate;
}

- (void)_readRawCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 183) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRawCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (GEOLocation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocation;
  id v3 = [(GEOLocation *)&v7 initWithData:a3];
  double v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    double v5 = v3;
  }

  return v4;
}

- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4 floorOrdinal:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_super v7 = [[GEOLatLng alloc] initWithLatitude:a3 longitude:a4];
  double v8 = [(GEOLocation *)self initWithLocation:v7 isUserLocation:0 floorOrdinal:v5];

  return v8;
}

- (GEOLocation)initWithLatitude:(double)a3 longitude:(double)a4 isUserLocation:(BOOL)a5 floorOrdinal:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  v9 = [[GEOLatLng alloc] initWithLatitude:a3 longitude:a4];
  v10 = [(GEOLocation *)self initWithLocation:v9 isUserLocation:v7 floorOrdinal:v6];

  return v10;
}

- (GEOLocation)initWithLocation:(id)a3 isUserLocation:(BOOL)a4 floorOrdinal:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOLocation;
  v9 = [(GEOLocation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    [(GEOLocation *)v9 setLatLng:v8];
    if (v6)
    {
      v11 = [(GEOLocation *)v10 latLng];
      [v11 setGtLog:1];
    }
    if (v5 != 0x7FFFFFFF) {
      [(GEOLocation *)v10 setLevelOrdinal:v5];
    }
    v12 = v10;
  }

  return v10;
}

- (void)setLatLng:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2800000u;
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (void)setRawCoordinate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x3000000u;
  objc_storeStrong((id *)&self->_rawCoordinate, a3);
}

- (GEOLocation)initWithGEOCoordinate:(id)a3
{
  return -[GEOLocation initWithGEOCoordinate:isUserLocation:floorOrdinal:](self, "initWithGEOCoordinate:isUserLocation:floorOrdinal:", 0, 0x7FFFFFFFLL, a3.var0, a3.var1);
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000008u;
  self->_horizontalAccuracy = a3;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader || (os_unfair_lock_assert_owner(&self->_readerLock), (*((_WORD *)&self->_flags + 1) & 0x3C0) != 0))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLocation *)self readAll:0];
    PBDataWriterWriteSubmessage();
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) != 0)
    {
      PBDataWriterWriteInt32Field();
      $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x80) != 0)
    {
      PBDataWriterWriteDoubleField();
      $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    }
    id v6 = v11;
    if ((*(_WORD *)&flags & 0x400) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v11;
      $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
      if ((*(unsigned char *)&flags & 8) == 0)
      {
LABEL_9:
        if ((*(_WORD *)&flags & 0x200) == 0) {
          goto LABEL_10;
        }
        goto LABEL_36;
      }
    }
    else if ((*(unsigned char *)&flags & 8) == 0)
    {
      goto LABEL_9;
    }
    PBDataWriterWriteDoubleField();
    id v6 = v11;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
LABEL_36:
    PBDataWriterWriteDoubleField();
    id v6 = v11;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_38;
    }
LABEL_37:
    PBDataWriterWriteDoubleField();
    id v6 = v11;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&flags & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_39;
    }
LABEL_38:
    PBDataWriterWriteDoubleField();
    id v6 = v11;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
LABEL_39:
    PBDataWriterWriteDoubleField();
    id v6 = v11;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&flags & 0x2000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_40:
    PBDataWriterWriteDoubleField();
    id v6 = v11;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0)
    {
LABEL_16:
      if (self->_coarseMetadata)
      {
        PBDataWriterWriteSubmessage();
        id v6 = v11;
      }
      $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
      if ((*(_WORD *)&v7 & 0x800) != 0)
      {
        PBDataWriterWriteInt32Field();
        id v6 = v11;
        $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
        if ((*(unsigned char *)&v7 & 0x20) == 0)
        {
LABEL_20:
          if ((*(_DWORD *)&v7 & 0x80000) == 0) {
            goto LABEL_21;
          }
          goto LABEL_44;
        }
      }
      else if ((*(unsigned char *)&v7 & 0x20) == 0)
      {
        goto LABEL_20;
      }
      PBDataWriterWriteDoubleField();
      id v6 = v11;
      $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
      if ((*(_DWORD *)&v7 & 0x80000) == 0)
      {
LABEL_21:
        if ((*(_DWORD *)&v7 & 0x100000) == 0) {
          goto LABEL_22;
        }
        goto LABEL_45;
      }
LABEL_44:
      PBDataWriterWriteBOOLField();
      id v6 = v11;
      $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
      if ((*(_DWORD *)&v7 & 0x100000) == 0)
      {
LABEL_22:
        if ((*(_WORD *)&v7 & 0x100) == 0) {
          goto LABEL_23;
        }
        goto LABEL_46;
      }
LABEL_45:
      PBDataWriterWriteBOOLField();
      id v6 = v11;
      $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
      if ((*(_WORD *)&v7 & 0x100) == 0)
      {
LABEL_23:
        if ((*(_WORD *)&v7 & 0x8000) == 0) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
LABEL_46:
      PBDataWriterWriteUint64Field();
      id v6 = v11;
      if ((*(_DWORD *)&self->_flags & 0x8000) == 0)
      {
LABEL_25:
        if (self->_rawCoordinate)
        {
          PBDataWriterWriteSubmessage();
          id v6 = v11;
        }
        $7795A3DA557233CC8B57BE35C358A0B5 v8 = self->_flags;
        if ((*(unsigned char *)&v8 & 0x10) != 0)
        {
          PBDataWriterWriteDoubleField();
          id v6 = v11;
          $7795A3DA557233CC8B57BE35C358A0B5 v8 = self->_flags;
          if ((*(_WORD *)&v8 & 0x4000) == 0)
          {
LABEL_29:
            if ((*(_WORD *)&v8 & 0x1000) == 0) {
              goto LABEL_30;
            }
            goto LABEL_50;
          }
        }
        else if ((*(_WORD *)&v8 & 0x4000) == 0)
        {
          goto LABEL_29;
        }
        PBDataWriterWriteInt32Field();
        id v6 = v11;
        $7795A3DA557233CC8B57BE35C358A0B5 v8 = self->_flags;
        if ((*(_WORD *)&v8 & 0x1000) == 0)
        {
LABEL_30:
          if ((*(_DWORD *)&v8 & 0x10000) == 0) {
            goto LABEL_31;
          }
          goto LABEL_51;
        }
LABEL_50:
        PBDataWriterWriteInt32Field();
        id v6 = v11;
        $7795A3DA557233CC8B57BE35C358A0B5 v8 = self->_flags;
        if ((*(_DWORD *)&v8 & 0x10000) == 0)
        {
LABEL_31:
          if ((*(_DWORD *)&v8 & 0x20000) == 0)
          {
LABEL_33:
            [(PBUnknownFields *)self->_unknownFields writeTo:v6];
            goto LABEL_54;
          }
LABEL_32:
          PBDataWriterWriteInt32Field();
          id v6 = v11;
          goto LABEL_33;
        }
LABEL_51:
        PBDataWriterWriteInt32Field();
        id v6 = v11;
        if ((*(_DWORD *)&self->_flags & 0x20000) == 0) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
LABEL_24:
      PBDataWriterWriteInt32Field();
      id v6 = v11;
      goto LABEL_25;
    }
LABEL_15:
    PBDataWriterWriteInt32Field();
    id v6 = v11;
    goto LABEL_16;
  }
  v9 = self->_reader;
  objc_sync_enter(v9);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v11 writeData:v10];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v9);
LABEL_54:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLocation *)self readAll:0];
    id v9 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
    v10 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v9;

    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) != 0)
    {
      *(_DWORD *)(v5 + 172) = self->_type;
      *(_DWORD *)(v5 + 180) |= 0x40000u;
      $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
      if ((*(unsigned char *)&flags & 0x80) == 0)
      {
LABEL_7:
        if ((*(_WORD *)&flags & 0x400) == 0) {
          goto LABEL_8;
        }
        goto LABEL_33;
      }
    }
    else if ((*(unsigned char *)&flags & 0x80) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 104) = self->_timestamp;
    *(_DWORD *)(v5 + 180) |= 0x80u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_8:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_34;
    }
LABEL_33:
    *(_DWORD *)(v5 + 140) = self->_altitude;
    *(_DWORD *)(v5 + 180) |= 0x400u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_10;
      }
      goto LABEL_35;
    }
LABEL_34:
    *(double *)(v5 + 56) = self->_horizontalAccuracy;
    *(_DWORD *)(v5 + 180) |= 8u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_10:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_36;
    }
LABEL_35:
    *(double *)(v5 + 120) = self->_verticalAccuracy;
    *(_DWORD *)(v5 + 180) |= 0x200u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_37;
    }
LABEL_36:
    *(double *)(v5 + 96) = self->_speed;
    *(_DWORD *)(v5 + 180) |= 0x40u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&flags & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_38;
    }
LABEL_37:
    *(double *)(v5 + 48) = self->_heading;
    *(_DWORD *)(v5 + 180) |= 4u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_39;
    }
LABEL_38:
    *(double *)(v5 + 40) = self->_course;
    *(_DWORD *)(v5 + 180) |= 2u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&flags & 0x2000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
LABEL_39:
    *(double *)(v5 + 32) = self->_courseAccuracy;
    *(_DWORD *)(v5 + 180) |= 1u;
    if ((*(_DWORD *)&self->_flags & 0x2000) == 0)
    {
LABEL_16:
      id v12 = [(GEOCoarseLocationMetadata *)self->_coarseMetadata copyWithZone:a3];
      v13 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v12;

      $7795A3DA557233CC8B57BE35C358A0B5 v14 = self->_flags;
      if ((*(_WORD *)&v14 & 0x800) != 0)
      {
        *(_DWORD *)(v5 + 144) = self->_courseType;
        *(_DWORD *)(v5 + 180) |= 0x800u;
        $7795A3DA557233CC8B57BE35C358A0B5 v14 = self->_flags;
        if ((*(unsigned char *)&v14 & 0x20) == 0)
        {
LABEL_18:
          if ((*(_DWORD *)&v14 & 0x80000) == 0) {
            goto LABEL_19;
          }
          goto LABEL_43;
        }
      }
      else if ((*(unsigned char *)&v14 & 0x20) == 0)
      {
        goto LABEL_18;
      }
      *(double *)(v5 + 88) = self->_speedAccuracy;
      *(_DWORD *)(v5 + 180) |= 0x20u;
      $7795A3DA557233CC8B57BE35C358A0B5 v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x80000) == 0)
      {
LABEL_19:
        if ((*(_DWORD *)&v14 & 0x100000) == 0) {
          goto LABEL_20;
        }
        goto LABEL_44;
      }
LABEL_43:
      *(unsigned char *)(v5 + 176) = self->_isMatchedLocation;
      *(_DWORD *)(v5 + 180) |= 0x80000u;
      $7795A3DA557233CC8B57BE35C358A0B5 v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x100000) == 0)
      {
LABEL_20:
        if ((*(_WORD *)&v14 & 0x100) == 0) {
          goto LABEL_21;
        }
        goto LABEL_45;
      }
LABEL_44:
      *(unsigned char *)(v5 + 177) = self->_isShifted;
      *(_DWORD *)(v5 + 180) |= 0x100000u;
      $7795A3DA557233CC8B57BE35C358A0B5 v14 = self->_flags;
      if ((*(_WORD *)&v14 & 0x100) == 0)
      {
LABEL_21:
        if ((*(_WORD *)&v14 & 0x8000) == 0) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
LABEL_45:
      *(void *)(v5 + 112) = self->_transitID;
      *(_DWORD *)(v5 + 180) |= 0x100u;
      if ((*(_DWORD *)&self->_flags & 0x8000) == 0)
      {
LABEL_23:
        id v15 = [(GEOLatLng *)self->_rawCoordinate copyWithZone:a3];
        v16 = *(void **)(v5 + 72);
        *(void *)(v5 + 72) = v15;

        $7795A3DA557233CC8B57BE35C358A0B5 v17 = self->_flags;
        if ((*(unsigned char *)&v17 & 0x10) != 0)
        {
          *(double *)(v5 + 80) = self->_rawCourse;
          *(_DWORD *)(v5 + 180) |= 0x10u;
          $7795A3DA557233CC8B57BE35C358A0B5 v17 = self->_flags;
          if ((*(_WORD *)&v17 & 0x4000) == 0)
          {
LABEL_25:
            if ((*(_WORD *)&v17 & 0x1000) == 0) {
              goto LABEL_26;
            }
            goto LABEL_49;
          }
        }
        else if ((*(_WORD *)&v17 & 0x4000) == 0)
        {
          goto LABEL_25;
        }
        *(_DWORD *)(v5 + 156) = self->_matchQuality;
        *(_DWORD *)(v5 + 180) |= 0x4000u;
        $7795A3DA557233CC8B57BE35C358A0B5 v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x1000) == 0)
        {
LABEL_26:
          if ((*(_DWORD *)&v17 & 0x10000) == 0) {
            goto LABEL_27;
          }
          goto LABEL_50;
        }
LABEL_49:
        *(_DWORD *)(v5 + 148) = self->_formOfWay;
        *(_DWORD *)(v5 + 180) |= 0x1000u;
        $7795A3DA557233CC8B57BE35C358A0B5 v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x10000) == 0)
        {
LABEL_27:
          if ((*(_DWORD *)&v17 & 0x20000) == 0)
          {
LABEL_29:
            v18 = self->_unknownFields;
            id v8 = *(id *)(v5 + 16);
            *(void *)(v5 + 16) = v18;
            goto LABEL_30;
          }
LABEL_28:
          *(_DWORD *)(v5 + 168) = self->_transportType;
          *(_DWORD *)(v5 + 180) |= 0x20000u;
          goto LABEL_29;
        }
LABEL_50:
        *(_DWORD *)(v5 + 164) = self->_roadClass;
        *(_DWORD *)(v5 + 180) |= 0x10000u;
        if ((*(_DWORD *)&self->_flags & 0x20000) == 0) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
LABEL_22:
      *(_DWORD *)(v5 + 160) = self->_referenceFrame;
      *(_DWORD *)(v5 + 180) |= 0x8000u;
      goto LABEL_23;
    }
LABEL_15:
    *(_DWORD *)(v5 + 152) = self->_levelOrdinal;
    *(_DWORD *)(v5 + 180) |= 0x2000u;
    goto LABEL_16;
  }
  $7795A3DA557233CC8B57BE35C358A0B5 v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 3) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLocationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_30:
  return (id)v5;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    $7795A3DA557233CC8B57BE35C358A0B5 v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_779;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_780;
    }
    GEOLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_latLng readAll:1];
    [(GEOCoarseLocationMetadata *)self->_coarseMetadata readAll:1];
    [(GEOLatLng *)self->_rawCoordinate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLocation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocation;
  v2 = [(GEOLocation *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    double v4 = v2;
  }

  return v3;
}

- (int)referenceFrame
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x8000) != 0) {
    return self->_referenceFrame;
  }
  else {
    return 0;
  }
}

- (GEOLocation)initWithLocation:(id)a3 floorOrdinal:(int)a4
{
  return [(GEOLocation *)self initWithLocation:a3 isUserLocation:0 floorOrdinal:0x7FFFFFFFLL];
}

- (GEOLocation)initWithLocation:(id)a3
{
  return [(GEOLocation *)self initWithLocation:a3 floorOrdinal:0x7FFFFFFFLL];
}

- (void)setHeading:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x2000004u;
  self->_heading = a3;
}

- (GEOLocation)initWithGEOCoordinate:(id)a3 isUserLocation:(BOOL)a4
{
  return -[GEOLocation initWithGEOCoordinate:isUserLocation:floorOrdinal:](self, "initWithGEOCoordinate:isUserLocation:floorOrdinal:", a4, 0x7FFFFFFFLL, a3.var0, a3.var1);
}

- (GEOLocation)initWithGEOCoordinate:(id)a3 floorOrdinal:(int)a4
{
  return [(GEOLocation *)self initWithLatitude:0 longitude:*(void *)&a4 isUserLocation:a3.var0 floorOrdinal:a3.var1];
}

- (BOOL)hasAccurateCourse
{
  BOOL v3 = [(GEOLocation *)self hasCourse];
  if (v3)
  {
    BOOL v3 = [(GEOLocation *)self hasCourseAccuracy];
    if (v3)
    {
      [(GEOLocation *)self course];
      if (v4 >= 0.0 && ([(GEOLocation *)self courseAccuracy], v5 >= 0.0))
      {
        [(GEOLocation *)self courseAccuracy];
        LOBYTE(v3) = v6 < 180.0;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (void)clearSensitiveFieldsForCoarseLocation
{
  BOOL v3 = [(GEOLocation *)self hasIsShifted];
  BOOL v4 = [(GEOLocation *)self isShifted];
  BOOL v5 = [(GEOLocation *)self hasReferenceFrame];
  uint64_t v6 = [(GEOLocation *)self referenceFrame];
  [(GEOLocation *)self clearSensitiveFields:0];
  [(GEOLocation *)self setAltitude:0];
  [(GEOLocation *)self setHasAltitude:0];
  [(GEOLocation *)self setVerticalAccuracy:-1.0];
  [(GEOLocation *)self setCourse:0.0];
  [(GEOLocation *)self setHasCourse:0];
  [(GEOLocation *)self setCourseAccuracy:0.0];
  [(GEOLocation *)self setHasCourseAccuracy:0];
  [(GEOLocation *)self setSpeed:0.0];
  [(GEOLocation *)self setHasSpeed:0];
  [(GEOLocation *)self setSpeedAccuracy:0.0];
  [(GEOLocation *)self setHasSpeedAccuracy:0];
  [(GEOLocation *)self setRawCoordinate:0];
  [(GEOLocation *)self setRawCourse:0.0];
  [(GEOLocation *)self setHasRawCourse:0];
  if (v3) {
    [(GEOLocation *)self setIsShifted:v4];
  }
  if (v5)
  {
    [(GEOLocation *)self setReferenceFrame:v6];
  }
}

- (void)applyCoarseLocationRandomizationWithMaximumDistance:(double)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(GEOLocation *)self coordinate];
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)arc4random_uniform((a3 + a3)) - a3;
  double v10 = (double)arc4random_uniform((a3 + a3)) - a3;
  long double v11 = 1.0 / GEOMapPointsPerMeterAtLatitude(v6);
  double v12 = v9 / v11 + GEOMapPointForCoordinate(v6, v8);
  long double v14 = exp(((v13 + v10 / v11) * 0.0078125 + -1048576.0) / 333772.107);
  double v15 = (atan(v14) * -2.0 + 1.57079633) * 57.2957795;
  v16 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v15, v12 * 0.0078125 * 0.000171661377 + -180.0);
  [(GEOLocation *)self setLatLng:v16];

  $7795A3DA557233CC8B57BE35C358A0B5 v17 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134283521;
    long double v20 = GEOCalculateDistanceRadius(v6, v8, v15, v12 * 0.0078125 * 0.000171661377 + -180.0, 6367000.0);
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Moved representative point by %{private}.1f meters", (uint8_t *)&v19, 0xCu);
  }

  [(GEOLocation *)self horizontalAccuracy];
  [(GEOLocation *)self setHorizontalAccuracy:sqrt((a3 + a3) * a3) + v18];
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x40000) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    int v3 = 33816576;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v3);
}

- (BOOL)hasType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB7D0[a3 - 1];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GPS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WIFI"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CELL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"IP_ADDRESS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 33554560;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)altitude
{
  return self->_altitude;
}

- (void)setHasAltitude:(BOOL)a3
{
  if (a3) {
    int v3 = 33555456;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasAltitude
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 33554440;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 33554944;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFDFFFDFF | v3);
}

- (BOOL)hasVerticalAccuracy
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)speed
{
  return self->_speed;
}

- (void)setHasSpeed:(BOOL)a3
{
  if (a3) {
    int v3 = 33554496;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSpeed
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHasHeading:(BOOL)a3
{
  if (a3) {
    int v3 = 33554436;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasHeading
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)course
{
  return self->_course;
}

- (void)setHasCourse:(BOOL)a3
{
  if (a3) {
    int v3 = 33554434;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasCourse
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setHasCourseAccuracy:(BOOL)a3
{
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x2000000);
}

- (BOOL)hasCourseAccuracy
{
  return *(_DWORD *)&self->_flags & 1;
}

- (int)levelOrdinal
{
  return self->_levelOrdinal;
}

- (void)setLevelOrdinal:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2002000u;
  self->_levelOrdinal = a3;
}

- (void)setHasLevelOrdinal:(BOOL)a3
{
  if (a3) {
    int v3 = 33562624;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasLevelOrdinal
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readCoarseMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 182) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoarseMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasCoarseMetadata
{
  return self->_coarseMetadata != 0;
}

- (GEOCoarseLocationMetadata)coarseMetadata
{
  -[GEOLocation _readCoarseMetadata]((uint64_t)self);
  coarseMetadata = self->_coarseMetadata;

  return coarseMetadata;
}

- (void)setCoarseMetadata:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x2400000u;
  objc_storeStrong((id *)&self->_coarseMetadata, a3);
}

- (int)courseType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x800) != 0) {
    return self->_courseType;
  }
  else {
    return 0;
  }
}

- (void)setCourseType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2000800u;
  self->_courseType = a3;
}

- (void)setHasCourseType:(BOOL)a3
{
  if (a3) {
    int v3 = 33556480;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasCourseType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)courseTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"DEAD_RECKONING";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN";
  }
  return v4;
}

- (int)StringAsCourseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"DEAD_RECKONING"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocation;
  int v4 = [(GEOLocation *)&v8 description];
  double v5 = [(GEOLocation *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v54 = 0;
    goto LABEL_100;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  double v5 = [(id)a1 latLng];
  double v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    id v7 = [v5 dictionaryRepresentation];
    }

    [v4 setObject:v7 forKey:@"latLng"];
  }

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 0x40000) != 0)
  {
    unsigned int v9 = *(_DWORD *)(a1 + 172) - 1;
    if (v9 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 172));
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v10 = off_1E53EB7D0[v9];
    }
    [v4 setObject:v10 forKey:@"type"];

    int v8 = *(_DWORD *)(a1 + 180);
  }
  if ((v8 & 0x80) != 0)
  {
    double v15 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
    [v4 setObject:v15 forKey:@"timestamp"];

    int v8 = *(_DWORD *)(a1 + 180);
    if ((v8 & 0x400) == 0)
    {
LABEL_14:
      if ((v8 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_30;
    }
  }
  else if ((v8 & 0x400) == 0)
  {
    goto LABEL_14;
  }
  v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 140)];
  [v4 setObject:v16 forKey:@"altitude"];

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 8) == 0)
  {
LABEL_15:
    if ((v8 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  $7795A3DA557233CC8B57BE35C358A0B5 v17 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  [v4 setObject:v17 forKey:@"horizontalAccuracy"];

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 0x200) == 0)
  {
LABEL_16:
    if ((v8 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  double v18 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
  [v4 setObject:v18 forKey:@"verticalAccuracy"];

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 0x40) == 0)
  {
LABEL_17:
    if ((v8 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  int v19 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
  [v4 setObject:v19 forKey:@"speed"];

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 4) == 0)
  {
LABEL_18:
    if ((v8 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_34;
  }
LABEL_33:
  long double v20 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v4 setObject:v20 forKey:@"heading"];

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 2) == 0)
  {
LABEL_19:
    if ((v8 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v21 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v4 setObject:v21 forKey:@"course"];

  int v8 = *(_DWORD *)(a1 + 180);
  if ((v8 & 1) == 0)
  {
LABEL_20:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_35:
  v22 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  if (a2) {
    v23 = @"courseAccuracy";
  }
  else {
    v23 = @"course_accuracy";
  }
  [v4 setObject:v22 forKey:v23];

  if ((*(_DWORD *)(a1 + 180) & 0x2000) != 0)
  {
LABEL_21:
    long double v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 152)];
    if (a2) {
      double v12 = @"levelOrdinal";
    }
    else {
      double v12 = @"level_ordinal";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_25:
  double v13 = [(id)a1 coarseMetadata];
  long double v14 = v13;
  if (v13)
  {
    if (a2) {
      [v13 jsonRepresentation];
    }
    else {
    id v24 = [v13 dictionaryRepresentation];
    }

    [v4 setObject:v24 forKey:@"coarseMetadata"];
  }

  int v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x800) != 0)
  {
    int v26 = *(_DWORD *)(a1 + 144);
    if (v26)
    {
      if (v26 == 1)
      {
        v27 = @"DEAD_RECKONING";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 144));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v27 = @"UNKNOWN";
    }
    if (a2) {
      v28 = @"courseType";
    }
    else {
      v28 = @"course_type";
    }
    [v4 setObject:v27 forKey:v28];

    int v25 = *(_DWORD *)(a1 + 180);
    if ((v25 & 0x20) == 0)
    {
LABEL_44:
      if ((v25 & 0x80000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_59;
    }
  }
  else if ((v25 & 0x20) == 0)
  {
    goto LABEL_44;
  }
  v29 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
  [v4 setObject:v29 forKey:@"speedAccuracy"];

  int v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x80000) == 0)
  {
LABEL_45:
    if ((v25 & 0x100000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_60;
  }
LABEL_59:
  v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 176)];
  [v4 setObject:v30 forKey:@"isMatchedLocation"];

  int v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x100000) == 0)
  {
LABEL_46:
    if ((v25 & 0x100) == 0) {
      goto LABEL_47;
    }
    goto LABEL_61;
  }
LABEL_60:
  v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 177)];
  [v4 setObject:v31 forKey:@"isShifted"];

  int v25 = *(_DWORD *)(a1 + 180);
  if ((v25 & 0x100) == 0)
  {
LABEL_47:
    if ((v25 & 0x8000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_62;
  }
LABEL_61:
  v32 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 112)];
  [v4 setObject:v32 forKey:@"transitID"];

  if ((*(_DWORD *)(a1 + 180) & 0x8000) == 0) {
    goto LABEL_66;
  }
LABEL_62:
  uint64_t v33 = *(int *)(a1 + 160);
  if (v33 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 160));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_1E53EB7F0[v33];
  }
  [v4 setObject:v34 forKey:@"referenceFrame"];

LABEL_66:
  v35 = [(id)a1 rawCoordinate];
  v36 = v35;
  if (v35)
  {
    if (a2) {
      [v35 jsonRepresentation];
    }
    else {
    id v37 = [v35 dictionaryRepresentation];
    }

    [v4 setObject:v37 forKey:@"rawCoordinate"];
  }

  int v38 = *(_DWORD *)(a1 + 180);
  if ((v38 & 0x10) != 0)
  {
    v39 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
    [v4 setObject:v39 forKey:@"rawCourse"];

    int v38 = *(_DWORD *)(a1 + 180);
    if ((v38 & 0x4000) == 0)
    {
LABEL_73:
      if ((v38 & 0x1000) == 0) {
        goto LABEL_74;
      }
      goto LABEL_82;
    }
  }
  else if ((v38 & 0x4000) == 0)
  {
    goto LABEL_73;
  }
  uint64_t v40 = *(int *)(a1 + 156);
  if (v40 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 156));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_1E53EB808[v40];
  }
  [v4 setObject:v41 forKey:@"matchQuality"];

  int v38 = *(_DWORD *)(a1 + 180);
  if ((v38 & 0x1000) == 0)
  {
LABEL_74:
    if ((v38 & 0x10000) == 0) {
      goto LABEL_75;
    }
LABEL_87:
    uint64_t v44 = *(int *)(a1 + 164);
    if (v44 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 164));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = off_1E53EB8D8[v44];
    }
    [v4 setObject:v45 forKey:@"roadClass"];

    if ((*(_DWORD *)(a1 + 180) & 0x20000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_91;
  }
LABEL_82:
  uint64_t v42 = *(int *)(a1 + 148);
  if v42 < 0x17 && ((0x7EDDDFu >> v42))
  {
    v43 = off_1E53EB820[v42];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 148));
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v4 setObject:v43 forKey:@"formOfWay"];

  int v38 = *(_DWORD *)(a1 + 180);
  if ((v38 & 0x10000) != 0) {
    goto LABEL_87;
  }
LABEL_75:
  if ((v38 & 0x20000) != 0)
  {
LABEL_91:
    uint64_t v46 = *(int *)(a1 + 168);
    if (v46 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 168));
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_1E53EB928[v46];
    }
    [v4 setObject:v47 forKey:@"transportType"];
  }
LABEL_95:
  v48 = *(void **)(a1 + 16);
  if (v48)
  {
    v49 = [v48 dictionaryRepresentation];
    v50 = v49;
    if (a2)
    {
      v51 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __41__GEOLocation__dictionaryRepresentation___block_invoke;
      v56[3] = &unk_1E53D8860;
      id v52 = v51;
      id v57 = v52;
      [v50 enumerateKeysAndObjectsUsingBlock:v56];
      id v53 = v52;

      v50 = v53;
    }
    [v4 setObject:v50 forKey:@"Unknown Fields"];
  }
  id v54 = v4;

LABEL_100:

  return v54;
}

- (id)jsonRepresentation
{
  return -[GEOLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLocation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    int v8 = [v5 base64EncodedStringWithOptions:0];
    unsigned int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    int v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLocation)initWithDictionary:(id)a3
{
  return (GEOLocation *)-[GEOLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (id)[a1 init];

    if (a1)
    {
      double v6 = [v5 objectForKeyedSubscript:@"latLng"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v8 = [(GEOLatLng *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLatLng *)v7 initWithDictionary:v6];
        }
        unsigned int v9 = (void *)v8;
        [a1 setLatLng:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"type"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"GPS"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"WIFI"])
        {
          uint64_t v12 = 2;
        }
        else if ([v11 isEqualToString:@"CELL"])
        {
          uint64_t v12 = 3;
        }
        else if ([v11 isEqualToString:@"IP_ADDRESS"])
        {
          uint64_t v12 = 4;
        }
        else
        {
          uint64_t v12 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_22;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setType:v12];
LABEL_22:

      double v13 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      long double v14 = [v5 objectForKeyedSubscript:@"altitude"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAltitude:", objc_msgSend(v14, "intValue"));
      }

      double v15 = [v5 objectForKeyedSubscript:@"horizontalAccuracy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v15 doubleValue];
        objc_msgSend(a1, "setHorizontalAccuracy:");
      }

      v16 = [v5 objectForKeyedSubscript:@"verticalAccuracy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v16 doubleValue];
        objc_msgSend(a1, "setVerticalAccuracy:");
      }

      $7795A3DA557233CC8B57BE35C358A0B5 v17 = [v5 objectForKeyedSubscript:@"speed"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v17 doubleValue];
        objc_msgSend(a1, "setSpeed:");
      }

      double v18 = [v5 objectForKeyedSubscript:@"heading"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        objc_msgSend(a1, "setHeading:");
      }

      int v19 = [v5 objectForKeyedSubscript:@"course"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v19 doubleValue];
        objc_msgSend(a1, "setCourse:");
      }

      if (a3) {
        long double v20 = @"courseAccuracy";
      }
      else {
        long double v20 = @"course_accuracy";
      }
      uint64_t v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v21 doubleValue];
        objc_msgSend(a1, "setCourseAccuracy:");
      }

      if (a3) {
        v22 = @"levelOrdinal";
      }
      else {
        v22 = @"level_ordinal";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLevelOrdinal:", objc_msgSend(v23, "intValue"));
      }

      id v24 = [v5 objectForKeyedSubscript:@"coarseMetadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v25 = [GEOCoarseLocationMetadata alloc];
        if (a3) {
          uint64_t v26 = [(GEOCoarseLocationMetadata *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOCoarseLocationMetadata *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setCoarseMetadata:v26];
      }
      if (a3) {
        v28 = @"courseType";
      }
      else {
        v28 = @"course_type";
      }
      v29 = [v5 objectForKeyedSubscript:v28];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v29;
        if ([v30 isEqualToString:@"UNKNOWN"]) {
          uint64_t v31 = 0;
        }
        else {
          uint64_t v31 = [v30 isEqualToString:@"DEAD_RECKONING"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_62;
        }
        uint64_t v31 = [v29 intValue];
      }
      [a1 setCourseType:v31];
LABEL_62:

      v32 = [v5 objectForKeyedSubscript:@"speedAccuracy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v32 doubleValue];
        objc_msgSend(a1, "setSpeedAccuracy:");
      }

      uint64_t v33 = [v5 objectForKeyedSubscript:@"isMatchedLocation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsMatchedLocation:", objc_msgSend(v33, "BOOLValue"));
      }

      v34 = [v5 objectForKeyedSubscript:@"isShifted"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsShifted:", objc_msgSend(v34, "BOOLValue"));
      }

      v35 = [v5 objectForKeyedSubscript:@"transitID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitID:", objc_msgSend(v35, "unsignedLongLongValue"));
      }

      v36 = [v5 objectForKeyedSubscript:@"referenceFrame"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v37 = v36;
        if ([v37 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v38 = 0;
        }
        else if ([v37 isEqualToString:@"WGS84"])
        {
          uint64_t v38 = 1;
        }
        else if ([v37 isEqualToString:@"CHINA_SHIFTED"])
        {
          uint64_t v38 = 2;
        }
        else
        {
          uint64_t v38 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_82;
        }
        uint64_t v38 = [v36 intValue];
      }
      [a1 setReferenceFrame:v38];
LABEL_82:

      v39 = [v5 objectForKeyedSubscript:@"rawCoordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v41 = [(GEOLatLng *)v40 initWithJSON:v39];
        }
        else {
          uint64_t v41 = [(GEOLatLng *)v40 initWithDictionary:v39];
        }
        uint64_t v42 = (void *)v41;
        [a1 setRawCoordinate:v41];
      }
      v43 = [v5 objectForKeyedSubscript:@"rawCourse"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v43 doubleValue];
        objc_msgSend(a1, "setRawCourse:");
      }

      uint64_t v44 = [v5 objectForKeyedSubscript:@"matchQuality"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v45 = v44;
        if ([v45 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v46 = 0;
        }
        else if ([v45 isEqualToString:@"STRONG"])
        {
          uint64_t v46 = 1;
        }
        else if ([v45 isEqualToString:@"AMBIGUOUS"])
        {
          uint64_t v46 = 2;
        }
        else
        {
          uint64_t v46 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_101;
        }
        uint64_t v46 = [v44 intValue];
      }
      [a1 setMatchQuality:v46];
LABEL_101:

      v47 = [v5 objectForKeyedSubscript:@"formOfWay"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v47;
        if ([v48 isEqualToString:@"FOW_UNKNOWN"])
        {
          uint64_t v49 = 0;
        }
        else if ([v48 isEqualToString:@"PART_OF_MOTORWAY"])
        {
          uint64_t v49 = 1;
        }
        else if ([v48 isEqualToString:@"PART_OF_MULTI_CARRIAGEWAY_WHICH_IS_NOT_A_MOTORWAY"])
        {
          uint64_t v49 = 2;
        }
        else if ([v48 isEqualToString:@"PART_OF_A_SINGLE_CARRIAGEWAY_DEFAULT"])
        {
          uint64_t v49 = 3;
        }
        else if ([v48 isEqualToString:@"PART_OF_A_ROUNDABOUT"])
        {
          uint64_t v49 = 4;
        }
        else if ([v48 isEqualToString:@"PART_OF_AN_ETA_PARKING_PLACE"])
        {
          uint64_t v49 = 6;
        }
        else if ([v48 isEqualToString:@"PART_OF_AN_ETA_PARKING_GARAGE_BUILDING"])
        {
          uint64_t v49 = 7;
        }
        else if ([v48 isEqualToString:@"PART_OF_AN_ETA_UNSTRUCTURED_TRAFFIC_SQUARE"])
        {
          uint64_t v49 = 8;
        }
        else if ([v48 isEqualToString:@"PART_OF_A_SLIP_ROAD"])
        {
          uint64_t v49 = 10;
        }
        else if ([v48 isEqualToString:@"PART_OF_A_SERVICE_ROAD"])
        {
          uint64_t v49 = 11;
        }
        else if ([v48 isEqualToString:@"ENTRANCE_EXIT_TO_FROM_A_CAR_PARK"])
        {
          uint64_t v49 = 12;
        }
        else if ([v48 isEqualToString:@"PART_OF_A_PEDESTRIAN_ZONE"])
        {
          uint64_t v49 = 14;
        }
        else if ([v48 isEqualToString:@"PART_OF_A_WALKWAY"])
        {
          uint64_t v49 = 15;
        }
        else if ([v48 isEqualToString:@"SPECIAL_TRAFFIC_FIGURES"])
        {
          uint64_t v49 = 17;
        }
        else if ([v48 isEqualToString:@"FOW_ETA_GALLERY"])
        {
          uint64_t v49 = 18;
        }
        else if ([v48 isEqualToString:@"FOW_STAIRS"])
        {
          uint64_t v49 = 19;
        }
        else if ([v48 isEqualToString:@"ROAD_FOR_AUTHORITIES"])
        {
          uint64_t v49 = 20;
        }
        else if ([v48 isEqualToString:@"FOW_CONNECTOR"])
        {
          uint64_t v49 = 21;
        }
        else if ([v48 isEqualToString:@"FOW_CUL_DE_SAC"])
        {
          uint64_t v49 = 22;
        }
        else
        {
          uint64_t v49 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_145;
        }
        uint64_t v49 = [v47 intValue];
      }
      [a1 setFormOfWay:v49];
LABEL_145:

      v50 = [v5 objectForKeyedSubscript:@"roadClass"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v51 = v50;
        if ([v51 isEqualToString:@"MOTORWAY_FREEWAY_OR_OTHER_MAJOR_ROAD"])
        {
          uint64_t v52 = 0;
        }
        else if ([v51 isEqualToString:@"A_MAJOR_ROAD_LESS_IMPORTANT_THAN_A_MOTORWAY"])
        {
          uint64_t v52 = 1;
        }
        else if ([v51 isEqualToString:@"OTHER_MAJOR_ROAD"])
        {
          uint64_t v52 = 2;
        }
        else if ([v51 isEqualToString:@"SECONDARY_ROAD"])
        {
          uint64_t v52 = 3;
        }
        else if ([v51 isEqualToString:@"LOCAL_CONNECTING_ROAD"])
        {
          uint64_t v52 = 4;
        }
        else if ([v51 isEqualToString:@"LOCAL_ROAD_OF_HIGH_IMPORTANCE"])
        {
          uint64_t v52 = 5;
        }
        else if ([v51 isEqualToString:@"LOCAL_ROAD"])
        {
          uint64_t v52 = 6;
        }
        else if ([v51 isEqualToString:@"LOCAL_ROAD_OF_MINOR_IMPORTANCE"])
        {
          uint64_t v52 = 7;
        }
        else if ([v51 isEqualToString:@"OTHER_ROAD"])
        {
          uint64_t v52 = 8;
        }
        else if ([v51 isEqualToString:@"UNKNOWN_ROAD"])
        {
          uint64_t v52 = 9;
        }
        else
        {
          uint64_t v52 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_171;
        }
        uint64_t v52 = [v50 intValue];
      }
      [a1 setRoadClass:v52];
LABEL_171:

      id v53 = [v5 objectForKeyedSubscript:@"transportType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v54 = v53;
        if ([v54 isEqualToString:@"AUTOMOBILE"])
        {
          uint64_t v55 = 0;
        }
        else if ([v54 isEqualToString:@"TRANSIT"])
        {
          uint64_t v55 = 1;
        }
        else if ([v54 isEqualToString:@"WALKING"])
        {
          uint64_t v55 = 2;
        }
        else if ([v54 isEqualToString:@"BICYCLE"])
        {
          uint64_t v55 = 3;
        }
        else if ([v54 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          uint64_t v55 = 4;
        }
        else if ([v54 isEqualToString:@"FERRY"])
        {
          uint64_t v55 = 5;
        }
        else if ([v54 isEqualToString:@"RIDESHARE"])
        {
          uint64_t v55 = 6;
        }
        else
        {
          uint64_t v55 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_191:

          a1 = a1;
          goto LABEL_192;
        }
        uint64_t v55 = [v53 intValue];
      }
      [a1 setTransportType:v55];
      goto LABEL_191;
    }
  }
LABEL_192:

  return a1;
}

- (GEOLocation)initWithJSON:(id)a3
{
  return (GEOLocation *)-[GEOLocation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocationIsValid((char *)a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLocation _readLatLng]((uint64_t)self);
  if ([(GEOLatLng *)self->_latLng hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLocation _readRawCoordinate]((uint64_t)self);
  rawCoordinate = self->_rawCoordinate;

  return [(GEOLatLng *)rawCoordinate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOLocation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 32) = self->_readerMarkPos;
  *((_DWORD *)v8 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v8 setLatLng:self->_latLng];
  int v4 = v8;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    *((_DWORD *)v8 + 43) = self->_type;
    *((_DWORD *)v8 + 45) |= 0x40000u;
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&flags & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v8[13] = *(id *)&self->_timestamp;
  *((_DWORD *)v8 + 45) |= 0x80u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v8 + 35) = self->_altitude;
  *((_DWORD *)v8 + 45) |= 0x400u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  v8[7] = *(id *)&self->_horizontalAccuracy;
  *((_DWORD *)v8 + 45) |= 8u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  v8[15] = *(id *)&self->_verticalAccuracy;
  *((_DWORD *)v8 + 45) |= 0x200u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  v8[12] = *(id *)&self->_speed;
  *((_DWORD *)v8 + 45) |= 0x40u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  v8[6] = *(id *)&self->_heading;
  *((_DWORD *)v8 + 45) |= 4u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  v8[5] = *(id *)&self->_course;
  *((_DWORD *)v8 + 45) |= 2u;
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_40:
  v8[4] = *(id *)&self->_courseAccuracy;
  *((_DWORD *)v8 + 45) |= 1u;
  if ((*(_DWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_11:
    *((_DWORD *)v8 + 38) = self->_levelOrdinal;
    *((_DWORD *)v8 + 45) |= 0x2000u;
  }
LABEL_12:
  if (self->_coarseMetadata)
  {
    objc_msgSend(v8, "setCoarseMetadata:");
    int v4 = v8;
  }
  $7795A3DA557233CC8B57BE35C358A0B5 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_courseType;
    *((_DWORD *)v4 + 45) |= 0x800u;
    $7795A3DA557233CC8B57BE35C358A0B5 v6 = self->_flags;
    if ((*(unsigned char *)&v6 & 0x20) == 0)
    {
LABEL_16:
      if ((*(_DWORD *)&v6 & 0x80000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  v4[11] = *(id *)&self->_speedAccuracy;
  *((_DWORD *)v4 + 45) |= 0x20u;
  $7795A3DA557233CC8B57BE35C358A0B5 v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v4 + 176) = self->_isMatchedLocation;
  *((_DWORD *)v4 + 45) |= 0x80000u;
  $7795A3DA557233CC8B57BE35C358A0B5 v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v4 + 177) = self->_isShifted;
  *((_DWORD *)v4 + 45) |= 0x100000u;
  $7795A3DA557233CC8B57BE35C358A0B5 v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_46:
  v4[14] = self->_transitID;
  *((_DWORD *)v4 + 45) |= 0x100u;
  if ((*(_DWORD *)&self->_flags & 0x8000) != 0)
  {
LABEL_20:
    *((_DWORD *)v4 + 40) = self->_referenceFrame;
    *((_DWORD *)v4 + 45) |= 0x8000u;
  }
LABEL_21:
  if (self->_rawCoordinate)
  {
    objc_msgSend(v8, "setRawCoordinate:");
    int v4 = v8;
  }
  $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
  if ((*(unsigned char *)&v7 & 0x10) != 0)
  {
    v4[10] = *(id *)&self->_rawCourse;
    *((_DWORD *)v4 + 45) |= 0x10u;
    $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
    if ((*(_WORD *)&v7 & 0x4000) == 0)
    {
LABEL_25:
      if ((*(_WORD *)&v7 & 0x1000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v4 + 39) = self->_matchQuality;
  *((_DWORD *)v4 + 45) |= 0x4000u;
  $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 37) = self->_formOfWay;
  *((_DWORD *)v4 + 45) |= 0x1000u;
  $7795A3DA557233CC8B57BE35C358A0B5 v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_51:
  *((_DWORD *)v4 + 41) = self->_roadClass;
  *((_DWORD *)v4 + 45) |= 0x10000u;
  if ((*(_DWORD *)&self->_flags & 0x20000) != 0)
  {
LABEL_28:
    *((_DWORD *)v4 + 42) = self->_transportType;
    *((_DWORD *)v4 + 45) |= 0x20000u;
  }
LABEL_29:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_121;
  }
  [(GEOLocation *)self readAll:1];
  [v4 readAll:1];
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((void *)v4 + 8))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:")) {
      goto LABEL_121;
    }
  }
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  int v7 = *((_DWORD *)v4 + 45);
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_type != *((_DWORD *)v4 + 43)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_timestamp != *((double *)v4 + 13)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_altitude != *((_DWORD *)v4 + 35)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_horizontalAccuracy != *((double *)v4 + 7)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_verticalAccuracy != *((double *)v4 + 15)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_speed != *((double *)v4 + 12)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_heading != *((double *)v4 + 6)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_course != *((double *)v4 + 5)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_121;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v7 & 1) == 0 || self->_courseAccuracy != *((double *)v4 + 4)) {
      goto LABEL_121;
    }
  }
  else if (v7)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_levelOrdinal != *((_DWORD *)v4 + 38)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_121;
  }
  coarseMetadata = self->_coarseMetadata;
  if ((unint64_t)coarseMetadata | *((void *)v4 + 3))
  {
    if (!-[GEOCoarseLocationMetadata isEqual:](coarseMetadata, "isEqual:")) {
      goto LABEL_121;
    }
    $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
    int v7 = *((_DWORD *)v4 + 45);
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_courseType != *((_DWORD *)v4 + 36)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_121;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_speedAccuracy != *((double *)v4 + 11)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0) {
      goto LABEL_121;
    }
    if (self->_isMatchedLocation)
    {
      if (!*((unsigned char *)v4 + 176)) {
        goto LABEL_121;
      }
    }
    else if (*((unsigned char *)v4 + 176))
    {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0) {
      goto LABEL_121;
    }
    if (self->_isShifted)
    {
      if (!*((unsigned char *)v4 + 177)) {
        goto LABEL_121;
      }
    }
    else if (*((unsigned char *)v4 + 177))
    {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_transitID != *((void *)v4 + 14)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 40)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_121;
  }
  rawCoordinate = self->_rawCoordinate;
  if ((unint64_t)rawCoordinate | *((void *)v4 + 9))
  {
    if (-[GEOLatLng isEqual:](rawCoordinate, "isEqual:"))
    {
      $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
      int v7 = *((_DWORD *)v4 + 45);
      goto LABEL_96;
    }
LABEL_121:
    BOOL v10 = 0;
    goto LABEL_122;
  }
LABEL_96:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rawCourse != *((double *)v4 + 10)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_matchQuality != *((_DWORD *)v4 + 39)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_formOfWay != *((_DWORD *)v4 + 37)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_roadClass != *((_DWORD *)v4 + 41)) {
      goto LABEL_121;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_121;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_transportType != *((_DWORD *)v4 + 42)) {
      goto LABEL_121;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v7 & 0x20000) == 0;
  }
LABEL_122:

  return v10;
}

- (unint64_t)hash
{
  [(GEOLocation *)self readAll:1];
  unint64_t v70 = [(GEOLatLng *)self->_latLng hash];
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    uint64_t v69 = 2654435761 * self->_type;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v69 = 0;
  if ((*(unsigned char *)&flags & 0x80) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestamp = self->_timestamp;
  double v5 = -timestamp;
  if (timestamp >= 0.0) {
    double v5 = self->_timestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    uint64_t v68 = 2654435761 * self->_altitude;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_13;
    }
LABEL_18:
    unint64_t v13 = 0;
    goto LABEL_21;
  }
  uint64_t v68 = 0;
  if ((*(unsigned char *)&flags & 8) == 0) {
    goto LABEL_18;
  }
LABEL_13:
  double horizontalAccuracy = self->_horizontalAccuracy;
  double v10 = -horizontalAccuracy;
  if (horizontalAccuracy >= 0.0) {
    double v10 = self->_horizontalAccuracy;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_21:
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    double verticalAccuracy = self->_verticalAccuracy;
    double v16 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0) {
      double v16 = self->_verticalAccuracy;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    double speed = self->_speed;
    double v21 = -speed;
    if (speed >= 0.0) {
      double v21 = self->_speed;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    double heading = self->_heading;
    double v26 = -heading;
    if (heading >= 0.0) {
      double v26 = self->_heading;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    double course = self->_course;
    double v31 = -course;
    if (course >= 0.0) {
      double v31 = self->_course;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if (*(unsigned char *)&flags)
  {
    double courseAccuracy = self->_courseAccuracy;
    double v36 = -courseAccuracy;
    if (courseAccuracy >= 0.0) {
      double v36 = self->_courseAccuracy;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v67 = v13;
  unint64_t v65 = v34;
  if ((*(_WORD *)&flags & 0x2000) != 0) {
    uint64_t v64 = 2654435761 * self->_levelOrdinal;
  }
  else {
    uint64_t v64 = 0;
  }
  unint64_t v63 = [(GEOCoarseLocationMetadata *)self->_coarseMetadata hash];
  $7795A3DA557233CC8B57BE35C358A0B5 v39 = self->_flags;
  if ((*(_WORD *)&v39 & 0x800) != 0) {
    uint64_t v62 = 2654435761 * self->_courseType;
  }
  else {
    uint64_t v62 = 0;
  }
  unint64_t v66 = v19;
  if ((*(unsigned char *)&v39 & 0x20) != 0)
  {
    double speedAccuracy = self->_speedAccuracy;
    double v42 = -speedAccuracy;
    if (speedAccuracy >= 0.0) {
      double v42 = self->_speedAccuracy;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  if ((*(_DWORD *)&v39 & 0x80000) != 0)
  {
    uint64_t v61 = 2654435761 * self->_isMatchedLocation;
    if ((*(_DWORD *)&v39 & 0x100000) != 0) {
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((*(_DWORD *)&v39 & 0x100000) != 0)
    {
LABEL_77:
      uint64_t v59 = 2654435761 * self->_isShifted;
      goto LABEL_80;
    }
  }
  uint64_t v59 = 0;
LABEL_80:
  if ((*(_WORD *)&v39 & 0x100) != 0) {
    unint64_t v45 = 2654435761u * self->_transitID;
  }
  else {
    unint64_t v45 = 0;
  }
  if ((*(_WORD *)&v39 & 0x8000) != 0) {
    uint64_t v46 = 2654435761 * self->_referenceFrame;
  }
  else {
    uint64_t v46 = 0;
  }
  unint64_t v47 = [(GEOLatLng *)self->_rawCoordinate hash];
  $7795A3DA557233CC8B57BE35C358A0B5 v48 = self->_flags;
  if ((*(unsigned char *)&v48 & 0x10) != 0)
  {
    double rawCourse = self->_rawCourse;
    double v51 = -rawCourse;
    if (rawCourse >= 0.0) {
      double v51 = self->_rawCourse;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  if ((*(_WORD *)&v48 & 0x4000) != 0)
  {
    uint64_t v54 = 2654435761 * self->_matchQuality;
    if ((*(_WORD *)&v48 & 0x1000) != 0)
    {
LABEL_96:
      uint64_t v55 = 2654435761 * self->_formOfWay;
      if ((*(_DWORD *)&v48 & 0x10000) != 0) {
        goto LABEL_97;
      }
LABEL_101:
      uint64_t v56 = 0;
      if ((*(_DWORD *)&v48 & 0x20000) != 0) {
        goto LABEL_98;
      }
LABEL_102:
      uint64_t v57 = 0;
      return v69 ^ v70 ^ v8 ^ v68 ^ v67 ^ v14 ^ v66 ^ v24 ^ v29 ^ v65 ^ v64 ^ v63 ^ v62 ^ v40 ^ v61 ^ v60 ^ v45 ^ v46 ^ v47 ^ v49 ^ v54 ^ v55 ^ v56 ^ v57;
    }
  }
  else
  {
    uint64_t v54 = 0;
    if ((*(_WORD *)&v48 & 0x1000) != 0) {
      goto LABEL_96;
    }
  }
  uint64_t v55 = 0;
  if ((*(_DWORD *)&v48 & 0x10000) == 0) {
    goto LABEL_101;
  }
LABEL_97:
  uint64_t v56 = 2654435761 * self->_roadClass;
  if ((*(_DWORD *)&v48 & 0x20000) == 0) {
    goto LABEL_102;
  }
LABEL_98:
  uint64_t v57 = 2654435761 * self->_transportType;
  return v69 ^ v70 ^ v8 ^ v68 ^ v67 ^ v14 ^ v66 ^ v24 ^ v29 ^ v65 ^ v64 ^ v63 ^ v62 ^ v40 ^ v61 ^ v60 ^ v45 ^ v46 ^ v47 ^ v49 ^ v54 ^ v55 ^ v56 ^ v57;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v14 = a3;
  [v14 readAll:0];
  id v4 = v14;
  latLng = self->_latLng;
  uint64_t v6 = v14[8];
  if (latLng)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLocation setLatLng:](self, "setLatLng:");
  }
  id v4 = v14;
LABEL_7:
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x40000) != 0)
  {
    self->_type = *((_DWORD *)v4 + 43);
    *(_DWORD *)&self->_flags |= 0x40000u;
    int v7 = *((_DWORD *)v4 + 45);
    if ((v7 & 0x80) == 0)
    {
LABEL_9:
      if ((v7 & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  self->_double timestamp = (double)v4[13];
  *(_DWORD *)&self->_flags |= 0x80u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x400) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_altitude = *((_DWORD *)v4 + 35);
  *(_DWORD *)&self->_flags |= 0x400u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 8) == 0)
  {
LABEL_11:
    if ((v7 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double horizontalAccuracy = (double)v4[7];
  *(_DWORD *)&self->_flags |= 8u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x200) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double verticalAccuracy = (double)v4[15];
  *(_DWORD *)&self->_flags |= 0x200u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double speed = (double)v4[12];
  *(_DWORD *)&self->_flags |= 0x40u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 4) == 0)
  {
LABEL_14:
    if ((v7 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double heading = (double)v4[6];
  *(_DWORD *)&self->_flags |= 4u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 2) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double course = (double)v4[5];
  *(_DWORD *)&self->_flags |= 2u;
  int v7 = *((_DWORD *)v4 + 45);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_29:
  self->_double courseAccuracy = (double)v4[4];
  *(_DWORD *)&self->_flags |= 1u;
  if ((*((_DWORD *)v4 + 45) & 0x2000) != 0)
  {
LABEL_17:
    self->_levelOrdinal = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 0x2000u;
  }
LABEL_18:
  coarseMetadata = self->_coarseMetadata;
  uint64_t v9 = v4[3];
  if (coarseMetadata)
  {
    if (!v9) {
      goto LABEL_34;
    }
    -[GEOCoarseLocationMetadata mergeFrom:](coarseMetadata, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_34;
    }
    -[GEOLocation setCoarseMetadata:](self, "setCoarseMetadata:");
  }
  id v4 = v14;
LABEL_34:
  int v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x800) != 0)
  {
    self->_courseType = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 0x800u;
    int v10 = *((_DWORD *)v4 + 45);
    if ((v10 & 0x20) == 0)
    {
LABEL_36:
      if ((v10 & 0x80000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_46;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_36;
  }
  self->_double speedAccuracy = (double)v4[11];
  *(_DWORD *)&self->_flags |= 0x20u;
  int v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x80000) == 0)
  {
LABEL_37:
    if ((v10 & 0x100000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_isMatchedLocation = *((unsigned char *)v4 + 176);
  *(_DWORD *)&self->_flags |= 0x80000u;
  int v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x100000) == 0)
  {
LABEL_38:
    if ((v10 & 0x100) == 0) {
      goto LABEL_39;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_isShifted = *((unsigned char *)v4 + 177);
  *(_DWORD *)&self->_flags |= 0x100000u;
  int v10 = *((_DWORD *)v4 + 45);
  if ((v10 & 0x100) == 0)
  {
LABEL_39:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_48:
  self->_transitID = v4[14];
  *(_DWORD *)&self->_flags |= 0x100u;
  if ((*((_DWORD *)v4 + 45) & 0x8000) != 0)
  {
LABEL_40:
    self->_referenceFrame = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_flags |= 0x8000u;
  }
LABEL_41:
  rawCoordinate = self->_rawCoordinate;
  uint64_t v12 = v4[9];
  if (rawCoordinate)
  {
    if (!v12) {
      goto LABEL_53;
    }
    -[GEOLatLng mergeFrom:](rawCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_53;
    }
    -[GEOLocation setRawCoordinate:](self, "setRawCoordinate:");
  }
  id v4 = v14;
LABEL_53:
  int v13 = *((_DWORD *)v4 + 45);
  if ((v13 & 0x10) != 0)
  {
    self->_double rawCourse = (double)v4[10];
    *(_DWORD *)&self->_flags |= 0x10u;
    int v13 = *((_DWORD *)v4 + 45);
    if ((v13 & 0x4000) == 0)
    {
LABEL_55:
      if ((v13 & 0x1000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_64;
    }
  }
  else if ((v13 & 0x4000) == 0)
  {
    goto LABEL_55;
  }
  self->_matchQuality = *((_DWORD *)v4 + 39);
  *(_DWORD *)&self->_flags |= 0x4000u;
  int v13 = *((_DWORD *)v4 + 45);
  if ((v13 & 0x1000) == 0)
  {
LABEL_56:
    if ((v13 & 0x10000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_formOfWay = *((_DWORD *)v4 + 37);
  *(_DWORD *)&self->_flags |= 0x1000u;
  int v13 = *((_DWORD *)v4 + 45);
  if ((v13 & 0x10000) == 0)
  {
LABEL_57:
    if ((v13 & 0x20000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_65:
  self->_roadClass = *((_DWORD *)v4 + 41);
  *(_DWORD *)&self->_flags |= 0x10000u;
  if ((*((_DWORD *)v4 + 45) & 0x20000) != 0)
  {
LABEL_58:
    self->_transportType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_flags |= 0x20000u;
  }
LABEL_59:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 2) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      double v5 = reader;
      objc_sync_enter(v5);
      GEOLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_784);
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
  *(_DWORD *)&self->_flags |= 0x2200000u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLocation *)self readAll:0];
    [(GEOLatLng *)self->_latLng clearUnknownFields:1];
    [(GEOCoarseLocationMetadata *)self->_coarseMetadata clearUnknownFields:1];
    rawCoordinate = self->_rawCoordinate;
    [(GEOLatLng *)rawCoordinate clearUnknownFields:1];
  }
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setHasSpeedAccuracy:(BOOL)a3
{
  if (a3) {
    int v3 = 33554464;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)isMatchedLocation
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x80000) != 0 && self->_isMatchedLocation;
}

- (void)setHasIsMatchedLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 34078720;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v3);
}

- (BOOL)isShifted
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x100000) != 0 && self->_isShifted;
}

- (void)setHasIsShifted:(BOOL)a3
{
  if (a3) {
    int v3 = 34603008;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v3);
}

- (unint64_t)transitID
{
  return self->_transitID;
}

- (void)setTransitID:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x2000100u;
  self->_transitID = a3;
}

- (void)setHasTransitID:(BOOL)a3
{
  if (a3) {
    int v3 = 33554688;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  if (a3) {
    int v3 = 33587200;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB7F0[a3];
  }

  return v3;
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WGS84"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHINA_SHIFTED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRawCoordinate
{
  return self->_rawCoordinate != 0;
}

- (double)rawCourse
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  double result = -1.0;
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_rawCourse;
  }
  return result;
}

- (void)setHasRawCourse:(BOOL)a3
{
  if (a3) {
    int v3 = 33554448;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasRawCourse
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)matchQuality
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x4000) != 0) {
    return self->_matchQuality;
  }
  else {
    return 0;
  }
}

- (void)setMatchQuality:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2004000u;
  self->_matchQuality = a3;
}

- (void)setHasMatchQuality:(BOOL)a3
{
  if (a3) {
    int v3 = 33570816;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasMatchQuality
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (id)matchQualityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB808[a3];
  }

  return v3;
}

- (int)StringAsMatchQuality:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STRONG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AMBIGUOUS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)formOfWay
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0) {
    return self->_formOfWay;
  }
  else {
    return 0;
  }
}

- (void)setFormOfWay:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2001000u;
  self->_formOfWay = a3;
}

- (void)setHasFormOfWay:(BOOL)a3
{
  if (a3) {
    int v3 = 33558528;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasFormOfWay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)formOfWayAsString:(int)a3
{
  if a3 < 0x17 && ((0x7EDDDFu >> a3))
  {
    int v3 = off_1E53EB820[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsFormOfWay:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FOW_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PART_OF_MOTORWAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PART_OF_MULTI_CARRIAGEWAY_WHICH_IS_NOT_A_MOTORWAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PART_OF_A_SINGLE_CARRIAGEWAY_DEFAULT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PART_OF_A_ROUNDABOUT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PART_OF_AN_ETA_PARKING_PLACE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PART_OF_AN_ETA_PARKING_GARAGE_BUILDING"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PART_OF_AN_ETA_UNSTRUCTURED_TRAFFIC_SQUARE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PART_OF_A_SLIP_ROAD"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PART_OF_A_SERVICE_ROAD"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ENTRANCE_EXIT_TO_FROM_A_CAR_PARK"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PART_OF_A_PEDESTRIAN_ZONE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PART_OF_A_WALKWAY"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPECIAL_TRAFFIC_FIGURES"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FOW_ETA_GALLERY"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FOW_STAIRS"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ROAD_FOR_AUTHORITIES"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FOW_CONNECTOR"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"FOW_CUL_DE_SAC"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)roadClass
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x10000) != 0) {
    return self->_roadClass;
  }
  else {
    return 9;
  }
}

- (void)setRoadClass:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2010000u;
  self->_roadClass = a3;
}

- (void)setHasRoadClass:(BOOL)a3
{
  if (a3) {
    int v3 = 33619968;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasRoadClass
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (id)roadClassAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB8D8[a3];
  }

  return v3;
}

- (int)StringAsRoadClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MOTORWAY_FREEWAY_OR_OTHER_MAJOR_ROAD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"A_MAJOR_ROAD_LESS_IMPORTANT_THAN_A_MOTORWAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OTHER_MAJOR_ROAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SECONDARY_ROAD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCAL_CONNECTING_ROAD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LOCAL_ROAD_OF_HIGH_IMPORTANCE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LOCAL_ROAD"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LOCAL_ROAD_OF_MINOR_IMPORTANCE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OTHER_ROAD"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_ROAD"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)transportType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $7795A3DA557233CC8B57BE35C358A0B5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x20000) != 0) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x2020000u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    int v3 = 33685504;
  }
  else {
    int v3 = 0x2000000;
  }
  self->_$7795A3DA557233CC8B57BE35C358A0B5 flags = ($7795A3DA557233CC8B57BE35C358A0B5)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasTransportType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53EB928[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end