@interface GEOTileSetUsage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCount;
- (BOOL)hasStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTileSetUsage)initWithDictionary:(id)a3;
- (GEOTileSetUsage)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)styleAsString:(int)a3;
- (int)StringAsStyle:(id)a3;
- (int)style;
- (unint64_t)hash;
- (unsigned)count;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasStyle:(BOOL)a3;
- (void)setStyle:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTileSetUsage

- (int)style
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_style;
  }
  else {
    return 0;
  }
}

- (void)setStyle:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStyle
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)styleAsString:(int)a3
{
  v4 = @"RASTER_STANDARD";
  switch(a3)
  {
    case 0:
      goto LABEL_27;
    case 1:
      v4 = @"VECTOR_STANDARD";
      break;
    case 2:
      v4 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      v4 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      v4 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      v4 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      v4 = @"RASTER_HYBRID";
      break;
    case 7:
      v4 = @"RASTER_SATELLITE";
      break;
    case 8:
      v4 = @"RASTER_TERRAIN";
      break;
    case 11:
      v4 = @"VECTOR_BUILDINGS";
      break;
    case 12:
      v4 = @"VECTOR_TRAFFIC";
      break;
    case 13:
      v4 = @"VECTOR_POI";
      break;
    case 14:
      v4 = @"SPUTNIK_METADATA";
      break;
    case 15:
      v4 = @"SPUTNIK_C3M";
      break;
    case 16:
      v4 = @"SPUTNIK_DSM";
      break;
    case 17:
      v4 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 18:
      v4 = @"VECTOR_REALISTIC";
      break;
    case 19:
      v4 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 20:
      v4 = @"VECTOR_ROADS";
      break;
    case 21:
      v4 = @"RASTER_VEGETATION";
      break;
    case 22:
      v4 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 23:
      v4 = @"RASTER_COASTLINE_MASK";
      break;
    case 24:
      v4 = @"RASTER_HILLSHADE";
      break;
    case 25:
      v4 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 26:
      v4 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 27:
      v4 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 28:
      v4 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 29:
      v4 = @"VECTOR_SPEED_PROFILES";
      break;
    case 30:
      v4 = @"VECTOR_VENUES";
      break;
    case 31:
      v4 = @"RASTER_DOWN_SAMPLED";
      break;
    case 32:
      v4 = @"RASTER_COLOR_BALANCED";
      break;
    case 33:
      v4 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 34:
      v4 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 35:
      v4 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 36:
      v4 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 37:
      v4 = @"VECTOR_TRANSIT";
      break;
    case 38:
      v4 = @"RASTER_STANDARD_BASE";
      break;
    case 39:
      v4 = @"RASTER_STANDARD_LABELS";
      break;
    case 40:
      v4 = @"RASTER_HYBRID_ROADS";
      break;
    case 41:
      v4 = @"RASTER_HYBRID_LABELS";
      break;
    case 42:
      v4 = @"FLYOVER_C3M_MESH";
      break;
    case 43:
      v4 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 44:
      v4 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 45:
      v4 = @"RASTER_SATELLITE_ASTC";
      break;
    case 46:
      v4 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 47:
      v4 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 48:
      v4 = @"VECTOR_COVERAGE";
      break;
    case 52:
      v4 = @"FLYOVER_METADATA";
      break;
    case 53:
      v4 = @"VECTOR_ROAD_NETWORK";
      break;
    case 54:
      v4 = @"VECTOR_LAND_COVER";
      break;
    case 55:
      v4 = @"VECTOR_DEBUG";
      break;
    case 56:
      v4 = @"VECTOR_STREET_POI";
      break;
    case 57:
      v4 = @"MUNIN_METADATA";
      break;
    case 58:
      v4 = @"VECTOR_SPR_MERCATOR";
      break;
    case 59:
      v4 = @"VECTOR_SPR_MODELS";
      break;
    case 60:
      v4 = @"VECTOR_SPR_MATERIALS";
      break;
    case 61:
      v4 = @"VECTOR_SPR_METADATA";
      break;
    case 62:
      v4 = @"VECTOR_TRACKS";
      break;
    case 63:
      v4 = @"VECTOR_RESERVED_2";
      break;
    case 64:
      v4 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 65:
      v4 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 66:
      v4 = @"VECTOR_SPR_ROADS";
      break;
    case 67:
      v4 = @"VECTOR_SPR_STANDARD";
      break;
    case 68:
      v4 = @"VECTOR_POI_V2";
      break;
    case 69:
      v4 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 70:
      v4 = @"VL_METADATA";
      break;
    case 71:
      v4 = @"VL_DATA";
      break;
    case 72:
      v4 = @"PROACTIVE_APP_CLIP";
      break;
    case 73:
      v4 = @"VECTOR_BUILDINGS_V2";
      break;
    case 74:
      v4 = @"POI_BUSYNESS";
      break;
    case 75:
      v4 = @"POI_DP_BUSYNESS";
      break;
    case 76:
      v4 = @"SMART_INTERFACE_SELECTION";
      break;
    case 77:
      v4 = @"VECTOR_ASSETS";
      break;
    case 78:
      v4 = @"SPR_ASSET_METADATA";
      break;
    case 79:
      v4 = @"VECTOR_SPR_POLAR";
      break;
    case 80:
      v4 = @"SMART_DATA_MODE";
      break;
    case 81:
      v4 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 82:
      v4 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 83:
      v4 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 84:
      v4 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 85:
      v4 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 86:
      v4 = @"VECTOR_TRAFFIC_V2";
      break;
    case 87:
      v4 = @"VECTOR_ROAD_SELECTION";
      break;
    case 88:
      v4 = @"VECTOR_REGION_METADATA";
      break;
    case 89:
      v4 = @"RAY_TRACING";
      break;
    case 90:
      v4 = @"VECTOR_CONTOURS";
      break;
    case 91:
      v4 = @"RASTER_SATELLITE_POLAR";
      break;
    case 92:
      v4 = @"VMAP4_ELEVATION";
      break;
    case 93:
      v4 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 94:
      v4 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 95:
      v4 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 96:
      v4 = @"UNUSED_96";
      break;
    case 97:
      v4 = @"UNUSED_97";
      break;
    case 98:
      v4 = @"UNUSED_98";
      break;
    case 99:
      v4 = @"UNUSED_99";
      break;
    case 100:
      v4 = @"UNUSED_100";
      break;
    case 101:
      v4 = @"UNUSED_101";
      break;
    case 102:
      v4 = @"UNUSED_102";
      break;
    case 103:
      v4 = @"UNUSED_103";
      break;
    case 104:
      v4 = @"UNUSED_104";
      break;
    case 105:
      v4 = @"UNUSED_105";
      break;
    case 106:
      v4 = @"UNUSED_106";
      break;
    case 107:
      v4 = @"UNUSED_107";
      break;
    case 108:
      v4 = @"UNUSED_108";
      break;
    case 109:
      v4 = @"UNUSED_109";
      break;
    case 110:
      v4 = @"UNUSED_110";
      break;
    case 111:
      v4 = @"UNUSED_111";
      break;
    case 112:
      v4 = @"UNUSED_112";
      break;
    case 113:
      v4 = @"UNUSED_113";
      break;
    case 114:
      v4 = @"UNUSED_114";
      break;
    case 115:
      v4 = @"UNUSED_115";
      break;
    case 116:
      v4 = @"UNUSED_116";
      break;
    case 117:
      v4 = @"UNUSED_117";
      break;
    case 118:
      v4 = @"UNUSED_118";
      break;
    case 119:
      v4 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:
      break;
  }
  return v4;
}

- (int)StringAsStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RASTER_STANDARD"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VECTOR_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RASTER_TERRAIN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"VECTOR_BUILDINGS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_METADATA"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_C3M"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_DSM"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"VECTOR_REALISTIC"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROADS"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RASTER_VEGETATION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"RASTER_COASTLINE_MASK"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"RASTER_HILLSHADE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPEED_PROFILES"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"VECTOR_VENUES"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"RASTER_DOWN_SAMPLED"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"RASTER_COLOR_BALANCED"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRANSIT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_BASE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"RASTER_STANDARD_LABELS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_ROADS"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_LABELS"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_MESH"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_ASTC"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"VECTOR_COVERAGE"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"FLYOVER_METADATA"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROAD_NETWORK"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"VECTOR_LAND_COVER"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"VECTOR_DEBUG"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"VECTOR_STREET_POI"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"MUNIN_METADATA"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MERCATOR"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MODELS"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MATERIALS"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_METADATA"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRACKS"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"VECTOR_RESERVED_2"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_ROADS"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_STANDARD"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI_V2"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"VL_METADATA"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"VL_DATA"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_APP_CLIP"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"VECTOR_BUILDINGS_V2"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"POI_BUSYNESS"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"POI_DP_BUSYNESS"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"SMART_INTERFACE_SELECTION"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"VECTOR_ASSETS"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"SPR_ASSET_METADATA"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_POLAR"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"SMART_DATA_MODE"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"VECTOR_TRAFFIC_V2"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"VECTOR_ROAD_SELECTION"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"VECTOR_REGION_METADATA"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"RAY_TRACING"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"VECTOR_CONTOURS"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_POLAR"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"VMAP4_ELEVATION"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"UNUSED_96"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"UNUSED_97"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"UNUSED_98"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"UNUSED_99"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"UNUSED_100"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"UNUSED_101"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"UNUSED_102"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"UNUSED_103"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"UNUSED_104"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"UNUSED_105"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"UNUSED_106"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"UNUSED_107"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"UNUSED_108"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"UNUSED_109"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"UNUSED_110"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"UNUSED_111"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"UNUSED_112"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"UNUSED_113"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"UNUSED_114"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"UNUSED_115"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"UNUSED_116"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"UNUSED_117"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"UNUSED_118"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"UNUSED_119"])
  {
    int v4 = 119;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTileSetUsage;
  int v4 = [(GEOTileSetUsage *)&v8 description];
  v5 = [(GEOTileSetUsage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = *(unsigned char *)(a1 + 16);
    if ((v3 & 2) != 0)
    {
      int v4 = @"RASTER_STANDARD";
      switch(*(_DWORD *)(a1 + 12))
      {
        case 0:
          break;
        case 1:
          int v4 = @"VECTOR_STANDARD";
          break;
        case 2:
          int v4 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
          break;
        case 3:
          int v4 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
          break;
        case 4:
          int v4 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
          break;
        case 5:
          int v4 = @"RASTER_STANDARD_BACKGROUND";
          break;
        case 6:
          int v4 = @"RASTER_HYBRID";
          break;
        case 7:
          int v4 = @"RASTER_SATELLITE";
          break;
        case 8:
          int v4 = @"RASTER_TERRAIN";
          break;
        case 0xB:
          int v4 = @"VECTOR_BUILDINGS";
          break;
        case 0xC:
          int v4 = @"VECTOR_TRAFFIC";
          break;
        case 0xD:
          int v4 = @"VECTOR_POI";
          break;
        case 0xE:
          int v4 = @"SPUTNIK_METADATA";
          break;
        case 0xF:
          int v4 = @"SPUTNIK_C3M";
          break;
        case 0x10:
          int v4 = @"SPUTNIK_DSM";
          break;
        case 0x11:
          int v4 = @"SPUTNIK_DSM_GLOBAL";
          break;
        case 0x12:
          int v4 = @"VECTOR_REALISTIC";
          break;
        case 0x13:
          int v4 = @"VECTOR_LEGACY_REALISTIC";
          break;
        case 0x14:
          int v4 = @"VECTOR_ROADS";
          break;
        case 0x15:
          int v4 = @"RASTER_VEGETATION";
          break;
        case 0x16:
          int v4 = @"VECTOR_TRAFFIC_SKELETON";
          break;
        case 0x17:
          int v4 = @"RASTER_COASTLINE_MASK";
          break;
        case 0x18:
          int v4 = @"RASTER_HILLSHADE";
          break;
        case 0x19:
          int v4 = @"VECTOR_TRAFFIC_WITH_GREEN";
          break;
        case 0x1A:
          int v4 = @"VECTOR_TRAFFIC_STATIC";
          break;
        case 0x1B:
          int v4 = @"RASTER_COASTLINE_DROP_MASK";
          break;
        case 0x1C:
          int v4 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
          break;
        case 0x1D:
          int v4 = @"VECTOR_SPEED_PROFILES";
          break;
        case 0x1E:
          int v4 = @"VECTOR_VENUES";
          break;
        case 0x1F:
          int v4 = @"RASTER_DOWN_SAMPLED";
          break;
        case 0x20:
          int v4 = @"RASTER_COLOR_BALANCED";
          break;
        case 0x21:
          int v4 = @"RASTER_SATELLITE_NIGHT";
          break;
        case 0x22:
          int v4 = @"SPUTNIK_VECTOR_BORDER";
          break;
        case 0x23:
          int v4 = @"RASTER_SATELLITE_DIGITIZE";
          break;
        case 0x24:
          int v4 = @"RASTER_HILLSHADE_PARKS";
          break;
        case 0x25:
          int v4 = @"VECTOR_TRANSIT";
          break;
        case 0x26:
          int v4 = @"RASTER_STANDARD_BASE";
          break;
        case 0x27:
          int v4 = @"RASTER_STANDARD_LABELS";
          break;
        case 0x28:
          int v4 = @"RASTER_HYBRID_ROADS";
          break;
        case 0x29:
          int v4 = @"RASTER_HYBRID_LABELS";
          break;
        case 0x2A:
          int v4 = @"FLYOVER_C3M_MESH";
          break;
        case 0x2B:
          int v4 = @"FLYOVER_C3M_JPEG_TEXTURE";
          break;
        case 0x2C:
          int v4 = @"FLYOVER_C3M_ASTC_TEXTURE";
          break;
        case 0x2D:
          int v4 = @"RASTER_SATELLITE_ASTC";
          break;
        case 0x2E:
          int v4 = @"RASTER_HYBRID_ROADS_AND_LABELS";
          break;
        case 0x2F:
          int v4 = @"VECTOR_TRANSIT_SELECTION";
          break;
        case 0x30:
          int v4 = @"VECTOR_COVERAGE";
          break;
        case 0x34:
          int v4 = @"FLYOVER_METADATA";
          break;
        case 0x35:
          int v4 = @"VECTOR_ROAD_NETWORK";
          break;
        case 0x36:
          int v4 = @"VECTOR_LAND_COVER";
          break;
        case 0x37:
          int v4 = @"VECTOR_DEBUG";
          break;
        case 0x38:
          int v4 = @"VECTOR_STREET_POI";
          break;
        case 0x39:
          int v4 = @"MUNIN_METADATA";
          break;
        case 0x3A:
          int v4 = @"VECTOR_SPR_MERCATOR";
          break;
        case 0x3B:
          int v4 = @"VECTOR_SPR_MODELS";
          break;
        case 0x3C:
          int v4 = @"VECTOR_SPR_MATERIALS";
          break;
        case 0x3D:
          int v4 = @"VECTOR_SPR_METADATA";
          break;
        case 0x3E:
          int v4 = @"VECTOR_TRACKS";
          break;
        case 0x3F:
          int v4 = @"VECTOR_RESERVED_2";
          break;
        case 0x40:
          int v4 = @"VECTOR_STREET_LANDMARKS";
          break;
        case 0x41:
          int v4 = @"COARSE_LOCATION_POLYGONS";
          break;
        case 0x42:
          int v4 = @"VECTOR_SPR_ROADS";
          break;
        case 0x43:
          int v4 = @"VECTOR_SPR_STANDARD";
          break;
        case 0x44:
          int v4 = @"VECTOR_POI_V2";
          break;
        case 0x45:
          int v4 = @"VECTOR_POLYGON_SELECTION";
          break;
        case 0x46:
          int v4 = @"VL_METADATA";
          break;
        case 0x47:
          int v4 = @"VL_DATA";
          break;
        case 0x48:
          int v4 = @"PROACTIVE_APP_CLIP";
          break;
        case 0x49:
          int v4 = @"VECTOR_BUILDINGS_V2";
          break;
        case 0x4A:
          int v4 = @"POI_BUSYNESS";
          break;
        case 0x4B:
          int v4 = @"POI_DP_BUSYNESS";
          break;
        case 0x4C:
          int v4 = @"SMART_INTERFACE_SELECTION";
          break;
        case 0x4D:
          int v4 = @"VECTOR_ASSETS";
          break;
        case 0x4E:
          int v4 = @"SPR_ASSET_METADATA";
          break;
        case 0x4F:
          int v4 = @"VECTOR_SPR_POLAR";
          break;
        case 0x50:
          int v4 = @"SMART_DATA_MODE";
          break;
        case 0x51:
          int v4 = @"CELLULAR_PERFORMANCE_SCORE";
          break;
        case 0x52:
          int v4 = @"VECTOR_SPR_MODELS_OCCLUSION";
          break;
        case 0x53:
          int v4 = @"VECTOR_TOPOGRAPHIC";
          break;
        case 0x54:
          int v4 = @"VECTOR_POI_V2_UPDATE";
          break;
        case 0x55:
          int v4 = @"VECTOR_LIVE_DATA_UPDATES";
          break;
        case 0x56:
          int v4 = @"VECTOR_TRAFFIC_V2";
          break;
        case 0x57:
          int v4 = @"VECTOR_ROAD_SELECTION";
          break;
        case 0x58:
          int v4 = @"VECTOR_REGION_METADATA";
          break;
        case 0x59:
          int v4 = @"RAY_TRACING";
          break;
        case 0x5A:
          int v4 = @"VECTOR_CONTOURS";
          break;
        case 0x5B:
          int v4 = @"RASTER_SATELLITE_POLAR";
          break;
        case 0x5C:
          int v4 = @"VMAP4_ELEVATION";
          break;
        case 0x5D:
          int v4 = @"VMAP4_ELEVATION_POLAR";
          break;
        case 0x5E:
          int v4 = @"CELLULAR_COVERAGE_PLMN";
          break;
        case 0x5F:
          int v4 = @"RASTER_SATELLITE_POLAR_NIGHT";
          break;
        case 0x60:
          int v4 = @"UNUSED_96";
          break;
        case 0x61:
          int v4 = @"UNUSED_97";
          break;
        case 0x62:
          int v4 = @"UNUSED_98";
          break;
        case 0x63:
          int v4 = @"UNUSED_99";
          break;
        case 0x64:
          int v4 = @"UNUSED_100";
          break;
        case 0x65:
          int v4 = @"UNUSED_101";
          break;
        case 0x66:
          int v4 = @"UNUSED_102";
          break;
        case 0x67:
          int v4 = @"UNUSED_103";
          break;
        case 0x68:
          int v4 = @"UNUSED_104";
          break;
        case 0x69:
          int v4 = @"UNUSED_105";
          break;
        case 0x6A:
          int v4 = @"UNUSED_106";
          break;
        case 0x6B:
          int v4 = @"UNUSED_107";
          break;
        case 0x6C:
          int v4 = @"UNUSED_108";
          break;
        case 0x6D:
          int v4 = @"UNUSED_109";
          break;
        case 0x6E:
          int v4 = @"UNUSED_110";
          break;
        case 0x6F:
          int v4 = @"UNUSED_111";
          break;
        case 0x70:
          int v4 = @"UNUSED_112";
          break;
        case 0x71:
          int v4 = @"UNUSED_113";
          break;
        case 0x72:
          int v4 = @"UNUSED_114";
          break;
        case 0x73:
          int v4 = @"UNUSED_115";
          break;
        case 0x74:
          int v4 = @"UNUSED_116";
          break;
        case 0x75:
          int v4 = @"UNUSED_117";
          break;
        case 0x76:
          int v4 = @"UNUSED_118";
          break;
        case 0x77:
          int v4 = @"UNUSED_119";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 12));
          int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v2 setObject:v4 forKey:@"style"];

      char v3 = *(unsigned char *)(a1 + 16);
    }
    if (v3)
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      [v2 setObject:v5 forKey:@"count"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOTileSetUsage)initWithDictionary:(id)a3
{
  return (GEOTileSetUsage *)-[GEOTileSetUsage _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_242;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_242;
  }
  int v4 = [v3 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"RASTER_STANDARD"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"VECTOR_STANDARD"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"RASTER_HYBRID"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"RASTER_SATELLITE"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"RASTER_TERRAIN"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"VECTOR_BUILDINGS"])
    {
      uint64_t v6 = 11;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC"])
    {
      uint64_t v6 = 12;
    }
    else if ([v5 isEqualToString:@"VECTOR_POI"])
    {
      uint64_t v6 = 13;
    }
    else if ([v5 isEqualToString:@"SPUTNIK_METADATA"])
    {
      uint64_t v6 = 14;
    }
    else if ([v5 isEqualToString:@"SPUTNIK_C3M"])
    {
      uint64_t v6 = 15;
    }
    else if ([v5 isEqualToString:@"SPUTNIK_DSM"])
    {
      uint64_t v6 = 16;
    }
    else if ([v5 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
    {
      uint64_t v6 = 17;
    }
    else if ([v5 isEqualToString:@"VECTOR_REALISTIC"])
    {
      uint64_t v6 = 18;
    }
    else if ([v5 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
    {
      uint64_t v6 = 19;
    }
    else if ([v5 isEqualToString:@"VECTOR_ROADS"])
    {
      uint64_t v6 = 20;
    }
    else if ([v5 isEqualToString:@"RASTER_VEGETATION"])
    {
      uint64_t v6 = 21;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
    {
      uint64_t v6 = 22;
    }
    else if ([v5 isEqualToString:@"RASTER_COASTLINE_MASK"])
    {
      uint64_t v6 = 23;
    }
    else if ([v5 isEqualToString:@"RASTER_HILLSHADE"])
    {
      uint64_t v6 = 24;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
    {
      uint64_t v6 = 25;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
    {
      uint64_t v6 = 26;
    }
    else if ([v5 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
    {
      uint64_t v6 = 27;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
    {
      uint64_t v6 = 28;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPEED_PROFILES"])
    {
      uint64_t v6 = 29;
    }
    else if ([v5 isEqualToString:@"VECTOR_VENUES"])
    {
      uint64_t v6 = 30;
    }
    else if ([v5 isEqualToString:@"RASTER_DOWN_SAMPLED"])
    {
      uint64_t v6 = 31;
    }
    else if ([v5 isEqualToString:@"RASTER_COLOR_BALANCED"])
    {
      uint64_t v6 = 32;
    }
    else if ([v5 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
    {
      uint64_t v6 = 33;
    }
    else if ([v5 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
    {
      uint64_t v6 = 34;
    }
    else if ([v5 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
    {
      uint64_t v6 = 35;
    }
    else if ([v5 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
    {
      uint64_t v6 = 36;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRANSIT"])
    {
      uint64_t v6 = 37;
    }
    else if ([v5 isEqualToString:@"RASTER_STANDARD_BASE"])
    {
      uint64_t v6 = 38;
    }
    else if ([v5 isEqualToString:@"RASTER_STANDARD_LABELS"])
    {
      uint64_t v6 = 39;
    }
    else if ([v5 isEqualToString:@"RASTER_HYBRID_ROADS"])
    {
      uint64_t v6 = 40;
    }
    else if ([v5 isEqualToString:@"RASTER_HYBRID_LABELS"])
    {
      uint64_t v6 = 41;
    }
    else if ([v5 isEqualToString:@"FLYOVER_C3M_MESH"])
    {
      uint64_t v6 = 42;
    }
    else if ([v5 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
    {
      uint64_t v6 = 43;
    }
    else if ([v5 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
    {
      uint64_t v6 = 44;
    }
    else if ([v5 isEqualToString:@"RASTER_SATELLITE_ASTC"])
    {
      uint64_t v6 = 45;
    }
    else if ([v5 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
    {
      uint64_t v6 = 46;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
    {
      uint64_t v6 = 47;
    }
    else if ([v5 isEqualToString:@"VECTOR_COVERAGE"])
    {
      uint64_t v6 = 48;
    }
    else if ([v5 isEqualToString:@"FLYOVER_METADATA"])
    {
      uint64_t v6 = 52;
    }
    else if ([v5 isEqualToString:@"VECTOR_ROAD_NETWORK"])
    {
      uint64_t v6 = 53;
    }
    else if ([v5 isEqualToString:@"VECTOR_LAND_COVER"])
    {
      uint64_t v6 = 54;
    }
    else if ([v5 isEqualToString:@"VECTOR_DEBUG"])
    {
      uint64_t v6 = 55;
    }
    else if ([v5 isEqualToString:@"VECTOR_STREET_POI"])
    {
      uint64_t v6 = 56;
    }
    else if ([v5 isEqualToString:@"MUNIN_METADATA"])
    {
      uint64_t v6 = 57;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_MERCATOR"])
    {
      uint64_t v6 = 58;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_MODELS"])
    {
      uint64_t v6 = 59;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_MATERIALS"])
    {
      uint64_t v6 = 60;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_METADATA"])
    {
      uint64_t v6 = 61;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRACKS"])
    {
      uint64_t v6 = 62;
    }
    else if ([v5 isEqualToString:@"VECTOR_RESERVED_2"])
    {
      uint64_t v6 = 63;
    }
    else if ([v5 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
    {
      uint64_t v6 = 64;
    }
    else if ([v5 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
    {
      uint64_t v6 = 65;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_ROADS"])
    {
      uint64_t v6 = 66;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_STANDARD"])
    {
      uint64_t v6 = 67;
    }
    else if ([v5 isEqualToString:@"VECTOR_POI_V2"])
    {
      uint64_t v6 = 68;
    }
    else if ([v5 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
    {
      uint64_t v6 = 69;
    }
    else if ([v5 isEqualToString:@"VL_METADATA"])
    {
      uint64_t v6 = 70;
    }
    else if ([v5 isEqualToString:@"VL_DATA"])
    {
      uint64_t v6 = 71;
    }
    else if ([v5 isEqualToString:@"PROACTIVE_APP_CLIP"])
    {
      uint64_t v6 = 72;
    }
    else if ([v5 isEqualToString:@"VECTOR_BUILDINGS_V2"])
    {
      uint64_t v6 = 73;
    }
    else if ([v5 isEqualToString:@"POI_BUSYNESS"])
    {
      uint64_t v6 = 74;
    }
    else if ([v5 isEqualToString:@"POI_DP_BUSYNESS"])
    {
      uint64_t v6 = 75;
    }
    else if ([v5 isEqualToString:@"SMART_INTERFACE_SELECTION"])
    {
      uint64_t v6 = 76;
    }
    else if ([v5 isEqualToString:@"VECTOR_ASSETS"])
    {
      uint64_t v6 = 77;
    }
    else if ([v5 isEqualToString:@"SPR_ASSET_METADATA"])
    {
      uint64_t v6 = 78;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_POLAR"])
    {
      uint64_t v6 = 79;
    }
    else if ([v5 isEqualToString:@"SMART_DATA_MODE"])
    {
      uint64_t v6 = 80;
    }
    else if ([v5 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
    {
      uint64_t v6 = 81;
    }
    else if ([v5 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
    {
      uint64_t v6 = 82;
    }
    else if ([v5 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
    {
      uint64_t v6 = 83;
    }
    else if ([v5 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
    {
      uint64_t v6 = 84;
    }
    else if ([v5 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
    {
      uint64_t v6 = 85;
    }
    else if ([v5 isEqualToString:@"VECTOR_TRAFFIC_V2"])
    {
      uint64_t v6 = 86;
    }
    else if ([v5 isEqualToString:@"VECTOR_ROAD_SELECTION"])
    {
      uint64_t v6 = 87;
    }
    else if ([v5 isEqualToString:@"VECTOR_REGION_METADATA"])
    {
      uint64_t v6 = 88;
    }
    else if ([v5 isEqualToString:@"RAY_TRACING"])
    {
      uint64_t v6 = 89;
    }
    else if ([v5 isEqualToString:@"VECTOR_CONTOURS"])
    {
      uint64_t v6 = 90;
    }
    else if ([v5 isEqualToString:@"RASTER_SATELLITE_POLAR"])
    {
      uint64_t v6 = 91;
    }
    else if ([v5 isEqualToString:@"VMAP4_ELEVATION"])
    {
      uint64_t v6 = 92;
    }
    else if ([v5 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
    {
      uint64_t v6 = 93;
    }
    else if ([v5 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
    {
      uint64_t v6 = 94;
    }
    else if ([v5 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
    {
      uint64_t v6 = 95;
    }
    else if ([v5 isEqualToString:@"UNUSED_96"])
    {
      uint64_t v6 = 96;
    }
    else if ([v5 isEqualToString:@"UNUSED_97"])
    {
      uint64_t v6 = 97;
    }
    else if ([v5 isEqualToString:@"UNUSED_98"])
    {
      uint64_t v6 = 98;
    }
    else if ([v5 isEqualToString:@"UNUSED_99"])
    {
      uint64_t v6 = 99;
    }
    else if ([v5 isEqualToString:@"UNUSED_100"])
    {
      uint64_t v6 = 100;
    }
    else if ([v5 isEqualToString:@"UNUSED_101"])
    {
      uint64_t v6 = 101;
    }
    else if ([v5 isEqualToString:@"UNUSED_102"])
    {
      uint64_t v6 = 102;
    }
    else if ([v5 isEqualToString:@"UNUSED_103"])
    {
      uint64_t v6 = 103;
    }
    else if ([v5 isEqualToString:@"UNUSED_104"])
    {
      uint64_t v6 = 104;
    }
    else if ([v5 isEqualToString:@"UNUSED_105"])
    {
      uint64_t v6 = 105;
    }
    else if ([v5 isEqualToString:@"UNUSED_106"])
    {
      uint64_t v6 = 106;
    }
    else if ([v5 isEqualToString:@"UNUSED_107"])
    {
      uint64_t v6 = 107;
    }
    else if ([v5 isEqualToString:@"UNUSED_108"])
    {
      uint64_t v6 = 108;
    }
    else if ([v5 isEqualToString:@"UNUSED_109"])
    {
      uint64_t v6 = 109;
    }
    else if ([v5 isEqualToString:@"UNUSED_110"])
    {
      uint64_t v6 = 110;
    }
    else if ([v5 isEqualToString:@"UNUSED_111"])
    {
      uint64_t v6 = 111;
    }
    else if ([v5 isEqualToString:@"UNUSED_112"])
    {
      uint64_t v6 = 112;
    }
    else if ([v5 isEqualToString:@"UNUSED_113"])
    {
      uint64_t v6 = 113;
    }
    else if ([v5 isEqualToString:@"UNUSED_114"])
    {
      uint64_t v6 = 114;
    }
    else if ([v5 isEqualToString:@"UNUSED_115"])
    {
      uint64_t v6 = 115;
    }
    else if ([v5 isEqualToString:@"UNUSED_116"])
    {
      uint64_t v6 = 116;
    }
    else if ([v5 isEqualToString:@"UNUSED_117"])
    {
      uint64_t v6 = 117;
    }
    else if ([v5 isEqualToString:@"UNUSED_118"])
    {
      uint64_t v6 = 118;
    }
    else if ([v5 isEqualToString:@"UNUSED_119"])
    {
      uint64_t v6 = 119;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_238;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_238:
    [a1 setStyle:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"count"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCount:", objc_msgSend(v7, "unsignedIntValue"));
  }

LABEL_242:
  return a1;
}

- (GEOTileSetUsage)initWithJSON:(id)a3
{
  return (GEOTileSetUsage *)-[GEOTileSetUsage _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTileSetUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTileSetUsageReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOTileSetUsage *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_style;
    *((unsigned char *)v5 + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[2] = self->_count;
    *((unsigned char *)v5 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_style;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_count;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOTileSetUsage *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_style != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_count != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTileSetUsage *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_style;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_count;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_style = *((_DWORD *)v5 + 3);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
  }
  if (v4)
  {
    self->_count = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end