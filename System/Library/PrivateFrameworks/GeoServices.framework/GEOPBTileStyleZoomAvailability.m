@interface GEOPBTileStyleZoomAvailability
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)zoomAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBTileStyleZoomAvailability

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPBTileStyleZoomAvailability;
  [(GEOPBTileStyleZoomAvailability *)&v3 dealloc];
}

- (uint64_t)zoomAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = *(void *)(result + 16);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 8) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBTileStyleZoomAvailability;
  unint64_t v4 = [(GEOPBTileStyleZoomAvailability *)&v8 description];
  v5 = [(GEOPBTileStyleZoomAvailability *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 40) & 2) != 0)
    {
      uint64_t v3 = @"RASTER_STANDARD";
      switch(*(_DWORD *)(a1 + 36))
      {
        case 0:
          break;
        case 1:
          uint64_t v3 = @"VECTOR_STANDARD";
          break;
        case 2:
          uint64_t v3 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
          break;
        case 3:
          uint64_t v3 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
          break;
        case 4:
          uint64_t v3 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
          break;
        case 5:
          uint64_t v3 = @"RASTER_STANDARD_BACKGROUND";
          break;
        case 6:
          uint64_t v3 = @"RASTER_HYBRID";
          break;
        case 7:
          uint64_t v3 = @"RASTER_SATELLITE";
          break;
        case 8:
          uint64_t v3 = @"RASTER_TERRAIN";
          break;
        case 0xB:
          uint64_t v3 = @"VECTOR_BUILDINGS";
          break;
        case 0xC:
          uint64_t v3 = @"VECTOR_TRAFFIC";
          break;
        case 0xD:
          uint64_t v3 = @"VECTOR_POI";
          break;
        case 0xE:
          uint64_t v3 = @"SPUTNIK_METADATA";
          break;
        case 0xF:
          uint64_t v3 = @"SPUTNIK_C3M";
          break;
        case 0x10:
          uint64_t v3 = @"SPUTNIK_DSM";
          break;
        case 0x11:
          uint64_t v3 = @"SPUTNIK_DSM_GLOBAL";
          break;
        case 0x12:
          uint64_t v3 = @"VECTOR_REALISTIC";
          break;
        case 0x13:
          uint64_t v3 = @"VECTOR_LEGACY_REALISTIC";
          break;
        case 0x14:
          uint64_t v3 = @"VECTOR_ROADS";
          break;
        case 0x15:
          uint64_t v3 = @"RASTER_VEGETATION";
          break;
        case 0x16:
          uint64_t v3 = @"VECTOR_TRAFFIC_SKELETON";
          break;
        case 0x17:
          uint64_t v3 = @"RASTER_COASTLINE_MASK";
          break;
        case 0x18:
          uint64_t v3 = @"RASTER_HILLSHADE";
          break;
        case 0x19:
          uint64_t v3 = @"VECTOR_TRAFFIC_WITH_GREEN";
          break;
        case 0x1A:
          uint64_t v3 = @"VECTOR_TRAFFIC_STATIC";
          break;
        case 0x1B:
          uint64_t v3 = @"RASTER_COASTLINE_DROP_MASK";
          break;
        case 0x1C:
          uint64_t v3 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
          break;
        case 0x1D:
          uint64_t v3 = @"VECTOR_SPEED_PROFILES";
          break;
        case 0x1E:
          uint64_t v3 = @"VECTOR_VENUES";
          break;
        case 0x1F:
          uint64_t v3 = @"RASTER_DOWN_SAMPLED";
          break;
        case 0x20:
          uint64_t v3 = @"RASTER_COLOR_BALANCED";
          break;
        case 0x21:
          uint64_t v3 = @"RASTER_SATELLITE_NIGHT";
          break;
        case 0x22:
          uint64_t v3 = @"SPUTNIK_VECTOR_BORDER";
          break;
        case 0x23:
          uint64_t v3 = @"RASTER_SATELLITE_DIGITIZE";
          break;
        case 0x24:
          uint64_t v3 = @"RASTER_HILLSHADE_PARKS";
          break;
        case 0x25:
          uint64_t v3 = @"VECTOR_TRANSIT";
          break;
        case 0x26:
          uint64_t v3 = @"RASTER_STANDARD_BASE";
          break;
        case 0x27:
          uint64_t v3 = @"RASTER_STANDARD_LABELS";
          break;
        case 0x28:
          uint64_t v3 = @"RASTER_HYBRID_ROADS";
          break;
        case 0x29:
          uint64_t v3 = @"RASTER_HYBRID_LABELS";
          break;
        case 0x2A:
          uint64_t v3 = @"FLYOVER_C3M_MESH";
          break;
        case 0x2B:
          uint64_t v3 = @"FLYOVER_C3M_JPEG_TEXTURE";
          break;
        case 0x2C:
          uint64_t v3 = @"FLYOVER_C3M_ASTC_TEXTURE";
          break;
        case 0x2D:
          uint64_t v3 = @"RASTER_SATELLITE_ASTC";
          break;
        case 0x2E:
          uint64_t v3 = @"RASTER_HYBRID_ROADS_AND_LABELS";
          break;
        case 0x2F:
          uint64_t v3 = @"VECTOR_TRANSIT_SELECTION";
          break;
        case 0x30:
          uint64_t v3 = @"VECTOR_COVERAGE";
          break;
        case 0x34:
          uint64_t v3 = @"FLYOVER_METADATA";
          break;
        case 0x35:
          uint64_t v3 = @"VECTOR_ROAD_NETWORK";
          break;
        case 0x36:
          uint64_t v3 = @"VECTOR_LAND_COVER";
          break;
        case 0x37:
          uint64_t v3 = @"VECTOR_DEBUG";
          break;
        case 0x38:
          uint64_t v3 = @"VECTOR_STREET_POI";
          break;
        case 0x39:
          uint64_t v3 = @"MUNIN_METADATA";
          break;
        case 0x3A:
          uint64_t v3 = @"VECTOR_SPR_MERCATOR";
          break;
        case 0x3B:
          uint64_t v3 = @"VECTOR_SPR_MODELS";
          break;
        case 0x3C:
          uint64_t v3 = @"VECTOR_SPR_MATERIALS";
          break;
        case 0x3D:
          uint64_t v3 = @"VECTOR_SPR_METADATA";
          break;
        case 0x3E:
          uint64_t v3 = @"VECTOR_TRACKS";
          break;
        case 0x3F:
          uint64_t v3 = @"VECTOR_RESERVED_2";
          break;
        case 0x40:
          uint64_t v3 = @"VECTOR_STREET_LANDMARKS";
          break;
        case 0x41:
          uint64_t v3 = @"COARSE_LOCATION_POLYGONS";
          break;
        case 0x42:
          uint64_t v3 = @"VECTOR_SPR_ROADS";
          break;
        case 0x43:
          uint64_t v3 = @"VECTOR_SPR_STANDARD";
          break;
        case 0x44:
          uint64_t v3 = @"VECTOR_POI_V2";
          break;
        case 0x45:
          uint64_t v3 = @"VECTOR_POLYGON_SELECTION";
          break;
        case 0x46:
          uint64_t v3 = @"VL_METADATA";
          break;
        case 0x47:
          uint64_t v3 = @"VL_DATA";
          break;
        case 0x48:
          uint64_t v3 = @"PROACTIVE_APP_CLIP";
          break;
        case 0x49:
          uint64_t v3 = @"VECTOR_BUILDINGS_V2";
          break;
        case 0x4A:
          uint64_t v3 = @"POI_BUSYNESS";
          break;
        case 0x4B:
          uint64_t v3 = @"POI_DP_BUSYNESS";
          break;
        case 0x4C:
          uint64_t v3 = @"SMART_INTERFACE_SELECTION";
          break;
        case 0x4D:
          uint64_t v3 = @"VECTOR_ASSETS";
          break;
        case 0x4E:
          uint64_t v3 = @"SPR_ASSET_METADATA";
          break;
        case 0x4F:
          uint64_t v3 = @"VECTOR_SPR_POLAR";
          break;
        case 0x50:
          uint64_t v3 = @"SMART_DATA_MODE";
          break;
        case 0x51:
          uint64_t v3 = @"CELLULAR_PERFORMANCE_SCORE";
          break;
        case 0x52:
          uint64_t v3 = @"VECTOR_SPR_MODELS_OCCLUSION";
          break;
        case 0x53:
          uint64_t v3 = @"VECTOR_TOPOGRAPHIC";
          break;
        case 0x54:
          uint64_t v3 = @"VECTOR_POI_V2_UPDATE";
          break;
        case 0x55:
          uint64_t v3 = @"VECTOR_LIVE_DATA_UPDATES";
          break;
        case 0x56:
          uint64_t v3 = @"VECTOR_TRAFFIC_V2";
          break;
        case 0x57:
          uint64_t v3 = @"VECTOR_ROAD_SELECTION";
          break;
        case 0x58:
          uint64_t v3 = @"VECTOR_REGION_METADATA";
          break;
        case 0x59:
          uint64_t v3 = @"RAY_TRACING";
          break;
        case 0x5A:
          uint64_t v3 = @"VECTOR_CONTOURS";
          break;
        case 0x5B:
          uint64_t v3 = @"RASTER_SATELLITE_POLAR";
          break;
        case 0x5C:
          uint64_t v3 = @"VMAP4_ELEVATION";
          break;
        case 0x5D:
          uint64_t v3 = @"VMAP4_ELEVATION_POLAR";
          break;
        case 0x5E:
          uint64_t v3 = @"CELLULAR_COVERAGE_PLMN";
          break;
        case 0x5F:
          uint64_t v3 = @"RASTER_SATELLITE_POLAR_NIGHT";
          break;
        case 0x60:
          uint64_t v3 = @"UNUSED_96";
          break;
        case 0x61:
          uint64_t v3 = @"UNUSED_97";
          break;
        case 0x62:
          uint64_t v3 = @"UNUSED_98";
          break;
        case 0x63:
          uint64_t v3 = @"UNUSED_99";
          break;
        case 0x64:
          uint64_t v3 = @"UNUSED_100";
          break;
        case 0x65:
          uint64_t v3 = @"UNUSED_101";
          break;
        case 0x66:
          uint64_t v3 = @"UNUSED_102";
          break;
        case 0x67:
          uint64_t v3 = @"UNUSED_103";
          break;
        case 0x68:
          uint64_t v3 = @"UNUSED_104";
          break;
        case 0x69:
          uint64_t v3 = @"UNUSED_105";
          break;
        case 0x6A:
          uint64_t v3 = @"UNUSED_106";
          break;
        case 0x6B:
          uint64_t v3 = @"UNUSED_107";
          break;
        case 0x6C:
          uint64_t v3 = @"UNUSED_108";
          break;
        case 0x6D:
          uint64_t v3 = @"UNUSED_109";
          break;
        case 0x6E:
          uint64_t v3 = @"UNUSED_110";
          break;
        case 0x6F:
          uint64_t v3 = @"UNUSED_111";
          break;
        case 0x70:
          uint64_t v3 = @"UNUSED_112";
          break;
        case 0x71:
          uint64_t v3 = @"UNUSED_113";
          break;
        case 0x72:
          uint64_t v3 = @"UNUSED_114";
          break;
        case 0x73:
          uint64_t v3 = @"UNUSED_115";
          break;
        case 0x74:
          uint64_t v3 = @"UNUSED_116";
          break;
        case 0x75:
          uint64_t v3 = @"UNUSED_117";
          break;
        case 0x76:
          uint64_t v3 = @"UNUSED_118";
          break;
        case 0x77:
          uint64_t v3 = @"UNUSED_119";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 36));
          uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v2 setObject:v3 forKey:@"style"];
    }
    if (*(void *)(a1 + 16))
    {
      unint64_t v4 = PBRepeatedUInt32NSArray();
      [v2 setObject:v4 forKey:@"zoom"];
    }
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v5 = *(int *)(a1 + 32);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v6 = off_1E53F71B8[v5];
      }
      [v2 setObject:v6 forKey:@"size"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTileStyleZoomAvailabilityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_zooms.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_zooms.count);
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 36) = self->_style;
    *(unsigned char *)(v4 + 40) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 32) = self->_size;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_style != *((_DWORD *)v4 + 9)) {
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_12;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_size != *((_DWORD *)v4 + 8)) {
      goto LABEL_12;
    }
    BOOL v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_style;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_size;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

@end