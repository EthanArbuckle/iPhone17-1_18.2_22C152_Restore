@interface GEORPVisibleTileSet
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPVisibleTileKey)tileKeyAtIndex:(unint64_t)a3;
- (GEORPVisibleTileKey)tileKeys;
- (GEORPVisibleTileSet)initWithDictionary:(id)a3;
- (GEORPVisibleTileSet)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)styleAsString:(int)a3;
- (int)StringAsStyle:(id)a3;
- (int)style;
- (uint64_t)_reserveTileKeys:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)tileKeysCount;
- (unsigned)identifier;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addTileKey:(GEORPVisibleTileKey)a3;
- (void)clearTileKeys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasStyle:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setStyle:(int)a3;
- (void)setTileKeys:(GEORPVisibleTileKey *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPVisibleTileSet

- (void)dealloc
{
  [(GEORPVisibleTileSet *)self clearTileKeys];
  v3.receiver = self;
  v3.super_class = (Class)GEORPVisibleTileSet;
  [(GEORPVisibleTileSet *)&v3 dealloc];
}

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

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIdentifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unint64_t)tileKeysCount
{
  return self->_tileKeysCount;
}

- (GEORPVisibleTileKey)tileKeys
{
  return self->_tileKeys;
}

- (uint64_t)_reserveTileKeys:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 24);
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
    if (16 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 16 * v9, 0x16951399uLL);
    if (result)
    {
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 8) = result;
      bzero((void *)(result + 16 * *(void *)(a1 + 16)), 16 * (v9 - *(void *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (void)clearTileKeys
{
  self->_tileKeysSpace = 0;
  self->_tileKeysCount = 0;
  free(self->_tileKeys);
  self->_tileKeys = 0;
}

- (void)addTileKey:(GEORPVisibleTileKey)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  if (-[GEORPVisibleTileSet _reserveTileKeys:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_tileKeys[self->_tileKeysCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_tileKeysCount;
  }
}

- (GEORPVisibleTileKey)tileKeyAtIndex:(unint64_t)a3
{
  unint64_t tileKeysCount = self->_tileKeysCount;
  if (tileKeysCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, tileKeysCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  v10 = &self->_tileKeys[a3];
  uint64_t v11 = *(void *)&v10->var0;
  uint64_t v12 = *(void *)&v10->var2;
  result.var2 = v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setTileKeys:(GEORPVisibleTileKey *)a3 count:(unint64_t)a4
{
  if (-[GEORPVisibleTileSet _reserveTileKeys:]((uint64_t)self, a4))
  {
    memcpy(self->_tileKeys, a3, 16 * a4);
    self->_unint64_t tileKeysCount = a4;
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPVisibleTileSet;
  uint64_t v4 = [(GEORPVisibleTileSet *)&v8 description];
  unint64_t v5 = [(GEORPVisibleTileSet *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPVisibleTileSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 40);
    if ((v5 & 2) != 0)
    {
      unint64_t v6 = @"RASTER_STANDARD";
      switch(*(_DWORD *)(a1 + 36))
      {
        case 0:
          break;
        case 1:
          unint64_t v6 = @"VECTOR_STANDARD";
          break;
        case 2:
          unint64_t v6 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
          break;
        case 3:
          unint64_t v6 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
          break;
        case 4:
          unint64_t v6 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
          break;
        case 5:
          unint64_t v6 = @"RASTER_STANDARD_BACKGROUND";
          break;
        case 6:
          unint64_t v6 = @"RASTER_HYBRID";
          break;
        case 7:
          unint64_t v6 = @"RASTER_SATELLITE";
          break;
        case 8:
          unint64_t v6 = @"RASTER_TERRAIN";
          break;
        case 0xB:
          unint64_t v6 = @"VECTOR_BUILDINGS";
          break;
        case 0xC:
          unint64_t v6 = @"VECTOR_TRAFFIC";
          break;
        case 0xD:
          unint64_t v6 = @"VECTOR_POI";
          break;
        case 0xE:
          unint64_t v6 = @"SPUTNIK_METADATA";
          break;
        case 0xF:
          unint64_t v6 = @"SPUTNIK_C3M";
          break;
        case 0x10:
          unint64_t v6 = @"SPUTNIK_DSM";
          break;
        case 0x11:
          unint64_t v6 = @"SPUTNIK_DSM_GLOBAL";
          break;
        case 0x12:
          unint64_t v6 = @"VECTOR_REALISTIC";
          break;
        case 0x13:
          unint64_t v6 = @"VECTOR_LEGACY_REALISTIC";
          break;
        case 0x14:
          unint64_t v6 = @"VECTOR_ROADS";
          break;
        case 0x15:
          unint64_t v6 = @"RASTER_VEGETATION";
          break;
        case 0x16:
          unint64_t v6 = @"VECTOR_TRAFFIC_SKELETON";
          break;
        case 0x17:
          unint64_t v6 = @"RASTER_COASTLINE_MASK";
          break;
        case 0x18:
          unint64_t v6 = @"RASTER_HILLSHADE";
          break;
        case 0x19:
          unint64_t v6 = @"VECTOR_TRAFFIC_WITH_GREEN";
          break;
        case 0x1A:
          unint64_t v6 = @"VECTOR_TRAFFIC_STATIC";
          break;
        case 0x1B:
          unint64_t v6 = @"RASTER_COASTLINE_DROP_MASK";
          break;
        case 0x1C:
          unint64_t v6 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
          break;
        case 0x1D:
          unint64_t v6 = @"VECTOR_SPEED_PROFILES";
          break;
        case 0x1E:
          unint64_t v6 = @"VECTOR_VENUES";
          break;
        case 0x1F:
          unint64_t v6 = @"RASTER_DOWN_SAMPLED";
          break;
        case 0x20:
          unint64_t v6 = @"RASTER_COLOR_BALANCED";
          break;
        case 0x21:
          unint64_t v6 = @"RASTER_SATELLITE_NIGHT";
          break;
        case 0x22:
          unint64_t v6 = @"SPUTNIK_VECTOR_BORDER";
          break;
        case 0x23:
          unint64_t v6 = @"RASTER_SATELLITE_DIGITIZE";
          break;
        case 0x24:
          unint64_t v6 = @"RASTER_HILLSHADE_PARKS";
          break;
        case 0x25:
          unint64_t v6 = @"VECTOR_TRANSIT";
          break;
        case 0x26:
          unint64_t v6 = @"RASTER_STANDARD_BASE";
          break;
        case 0x27:
          unint64_t v6 = @"RASTER_STANDARD_LABELS";
          break;
        case 0x28:
          unint64_t v6 = @"RASTER_HYBRID_ROADS";
          break;
        case 0x29:
          unint64_t v6 = @"RASTER_HYBRID_LABELS";
          break;
        case 0x2A:
          unint64_t v6 = @"FLYOVER_C3M_MESH";
          break;
        case 0x2B:
          unint64_t v6 = @"FLYOVER_C3M_JPEG_TEXTURE";
          break;
        case 0x2C:
          unint64_t v6 = @"FLYOVER_C3M_ASTC_TEXTURE";
          break;
        case 0x2D:
          unint64_t v6 = @"RASTER_SATELLITE_ASTC";
          break;
        case 0x2E:
          unint64_t v6 = @"RASTER_HYBRID_ROADS_AND_LABELS";
          break;
        case 0x2F:
          unint64_t v6 = @"VECTOR_TRANSIT_SELECTION";
          break;
        case 0x30:
          unint64_t v6 = @"VECTOR_COVERAGE";
          break;
        case 0x34:
          unint64_t v6 = @"FLYOVER_METADATA";
          break;
        case 0x35:
          unint64_t v6 = @"VECTOR_ROAD_NETWORK";
          break;
        case 0x36:
          unint64_t v6 = @"VECTOR_LAND_COVER";
          break;
        case 0x37:
          unint64_t v6 = @"VECTOR_DEBUG";
          break;
        case 0x38:
          unint64_t v6 = @"VECTOR_STREET_POI";
          break;
        case 0x39:
          unint64_t v6 = @"MUNIN_METADATA";
          break;
        case 0x3A:
          unint64_t v6 = @"VECTOR_SPR_MERCATOR";
          break;
        case 0x3B:
          unint64_t v6 = @"VECTOR_SPR_MODELS";
          break;
        case 0x3C:
          unint64_t v6 = @"VECTOR_SPR_MATERIALS";
          break;
        case 0x3D:
          unint64_t v6 = @"VECTOR_SPR_METADATA";
          break;
        case 0x3E:
          unint64_t v6 = @"VECTOR_TRACKS";
          break;
        case 0x3F:
          unint64_t v6 = @"VECTOR_RESERVED_2";
          break;
        case 0x40:
          unint64_t v6 = @"VECTOR_STREET_LANDMARKS";
          break;
        case 0x41:
          unint64_t v6 = @"COARSE_LOCATION_POLYGONS";
          break;
        case 0x42:
          unint64_t v6 = @"VECTOR_SPR_ROADS";
          break;
        case 0x43:
          unint64_t v6 = @"VECTOR_SPR_STANDARD";
          break;
        case 0x44:
          unint64_t v6 = @"VECTOR_POI_V2";
          break;
        case 0x45:
          unint64_t v6 = @"VECTOR_POLYGON_SELECTION";
          break;
        case 0x46:
          unint64_t v6 = @"VL_METADATA";
          break;
        case 0x47:
          unint64_t v6 = @"VL_DATA";
          break;
        case 0x48:
          unint64_t v6 = @"PROACTIVE_APP_CLIP";
          break;
        case 0x49:
          unint64_t v6 = @"VECTOR_BUILDINGS_V2";
          break;
        case 0x4A:
          unint64_t v6 = @"POI_BUSYNESS";
          break;
        case 0x4B:
          unint64_t v6 = @"POI_DP_BUSYNESS";
          break;
        case 0x4C:
          unint64_t v6 = @"SMART_INTERFACE_SELECTION";
          break;
        case 0x4D:
          unint64_t v6 = @"VECTOR_ASSETS";
          break;
        case 0x4E:
          unint64_t v6 = @"SPR_ASSET_METADATA";
          break;
        case 0x4F:
          unint64_t v6 = @"VECTOR_SPR_POLAR";
          break;
        case 0x50:
          unint64_t v6 = @"SMART_DATA_MODE";
          break;
        case 0x51:
          unint64_t v6 = @"CELLULAR_PERFORMANCE_SCORE";
          break;
        case 0x52:
          unint64_t v6 = @"VECTOR_SPR_MODELS_OCCLUSION";
          break;
        case 0x53:
          unint64_t v6 = @"VECTOR_TOPOGRAPHIC";
          break;
        case 0x54:
          unint64_t v6 = @"VECTOR_POI_V2_UPDATE";
          break;
        case 0x55:
          unint64_t v6 = @"VECTOR_LIVE_DATA_UPDATES";
          break;
        case 0x56:
          unint64_t v6 = @"VECTOR_TRAFFIC_V2";
          break;
        case 0x57:
          unint64_t v6 = @"VECTOR_ROAD_SELECTION";
          break;
        case 0x58:
          unint64_t v6 = @"VECTOR_REGION_METADATA";
          break;
        case 0x59:
          unint64_t v6 = @"RAY_TRACING";
          break;
        case 0x5A:
          unint64_t v6 = @"VECTOR_CONTOURS";
          break;
        case 0x5B:
          unint64_t v6 = @"RASTER_SATELLITE_POLAR";
          break;
        case 0x5C:
          unint64_t v6 = @"VMAP4_ELEVATION";
          break;
        case 0x5D:
          unint64_t v6 = @"VMAP4_ELEVATION_POLAR";
          break;
        case 0x5E:
          unint64_t v6 = @"CELLULAR_COVERAGE_PLMN";
          break;
        case 0x5F:
          unint64_t v6 = @"RASTER_SATELLITE_POLAR_NIGHT";
          break;
        case 0x60:
          unint64_t v6 = @"UNUSED_96";
          break;
        case 0x61:
          unint64_t v6 = @"UNUSED_97";
          break;
        case 0x62:
          unint64_t v6 = @"UNUSED_98";
          break;
        case 0x63:
          unint64_t v6 = @"UNUSED_99";
          break;
        case 0x64:
          unint64_t v6 = @"UNUSED_100";
          break;
        case 0x65:
          unint64_t v6 = @"UNUSED_101";
          break;
        case 0x66:
          unint64_t v6 = @"UNUSED_102";
          break;
        case 0x67:
          unint64_t v6 = @"UNUSED_103";
          break;
        case 0x68:
          unint64_t v6 = @"UNUSED_104";
          break;
        case 0x69:
          unint64_t v6 = @"UNUSED_105";
          break;
        case 0x6A:
          unint64_t v6 = @"UNUSED_106";
          break;
        case 0x6B:
          unint64_t v6 = @"UNUSED_107";
          break;
        case 0x6C:
          unint64_t v6 = @"UNUSED_108";
          break;
        case 0x6D:
          unint64_t v6 = @"UNUSED_109";
          break;
        case 0x6E:
          unint64_t v6 = @"UNUSED_110";
          break;
        case 0x6F:
          unint64_t v6 = @"UNUSED_111";
          break;
        case 0x70:
          unint64_t v6 = @"UNUSED_112";
          break;
        case 0x71:
          unint64_t v6 = @"UNUSED_113";
          break;
        case 0x72:
          unint64_t v6 = @"UNUSED_114";
          break;
        case 0x73:
          unint64_t v6 = @"UNUSED_115";
          break;
        case 0x74:
          unint64_t v6 = @"UNUSED_116";
          break;
        case 0x75:
          unint64_t v6 = @"UNUSED_117";
          break;
        case 0x76:
          unint64_t v6 = @"UNUSED_118";
          break;
        case 0x77:
          unint64_t v6 = @"UNUSED_119";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 36));
          unint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      [v4 setObject:v6 forKey:@"style"];

      char v5 = *(unsigned char *)(a1 + 40);
    }
    if (v5)
    {
      uint64_t v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
      [v4 setObject:v7 forKey:@"identifier"];
    }
    if (*(void *)(a1 + 16))
    {
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 16)];
      if (*(void *)(a1 + 16))
      {
        uint64_t v9 = 0;
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = _GEORPVisibleTileKeyDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 8) + v9));
          [v8 addObject:v11];

          ++v10;
          v9 += 16;
        }
        while (v10 < *(void *)(a1 + 16));
      }
      if (a2) {
        uint64_t v12 = @"tileKey";
      }
      else {
        uint64_t v12 = @"tile_key";
      }
      [v4 setObject:v8 forKey:v12];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPVisibleTileSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPVisibleTileSet)initWithDictionary:(id)a3
{
  return (GEORPVisibleTileSet *)-[GEORPVisibleTileSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_256;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_256;
  }
  unint64_t v6 = [v5 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"RASTER_STANDARD"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"VECTOR_STANDARD"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"RASTER_HYBRID"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"RASTER_SATELLITE"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"RASTER_TERRAIN"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"VECTOR_BUILDINGS"])
    {
      uint64_t v8 = 11;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC"])
    {
      uint64_t v8 = 12;
    }
    else if ([v7 isEqualToString:@"VECTOR_POI"])
    {
      uint64_t v8 = 13;
    }
    else if ([v7 isEqualToString:@"SPUTNIK_METADATA"])
    {
      uint64_t v8 = 14;
    }
    else if ([v7 isEqualToString:@"SPUTNIK_C3M"])
    {
      uint64_t v8 = 15;
    }
    else if ([v7 isEqualToString:@"SPUTNIK_DSM"])
    {
      uint64_t v8 = 16;
    }
    else if ([v7 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
    {
      uint64_t v8 = 17;
    }
    else if ([v7 isEqualToString:@"VECTOR_REALISTIC"])
    {
      uint64_t v8 = 18;
    }
    else if ([v7 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
    {
      uint64_t v8 = 19;
    }
    else if ([v7 isEqualToString:@"VECTOR_ROADS"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"RASTER_VEGETATION"])
    {
      uint64_t v8 = 21;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
    {
      uint64_t v8 = 22;
    }
    else if ([v7 isEqualToString:@"RASTER_COASTLINE_MASK"])
    {
      uint64_t v8 = 23;
    }
    else if ([v7 isEqualToString:@"RASTER_HILLSHADE"])
    {
      uint64_t v8 = 24;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
    {
      uint64_t v8 = 25;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
    {
      uint64_t v8 = 26;
    }
    else if ([v7 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
    {
      uint64_t v8 = 27;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
    {
      uint64_t v8 = 28;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPEED_PROFILES"])
    {
      uint64_t v8 = 29;
    }
    else if ([v7 isEqualToString:@"VECTOR_VENUES"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"RASTER_DOWN_SAMPLED"])
    {
      uint64_t v8 = 31;
    }
    else if ([v7 isEqualToString:@"RASTER_COLOR_BALANCED"])
    {
      uint64_t v8 = 32;
    }
    else if ([v7 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
    {
      uint64_t v8 = 33;
    }
    else if ([v7 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
    {
      uint64_t v8 = 34;
    }
    else if ([v7 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
    {
      uint64_t v8 = 35;
    }
    else if ([v7 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
    {
      uint64_t v8 = 36;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRANSIT"])
    {
      uint64_t v8 = 37;
    }
    else if ([v7 isEqualToString:@"RASTER_STANDARD_BASE"])
    {
      uint64_t v8 = 38;
    }
    else if ([v7 isEqualToString:@"RASTER_STANDARD_LABELS"])
    {
      uint64_t v8 = 39;
    }
    else if ([v7 isEqualToString:@"RASTER_HYBRID_ROADS"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"RASTER_HYBRID_LABELS"])
    {
      uint64_t v8 = 41;
    }
    else if ([v7 isEqualToString:@"FLYOVER_C3M_MESH"])
    {
      uint64_t v8 = 42;
    }
    else if ([v7 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
    {
      uint64_t v8 = 43;
    }
    else if ([v7 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
    {
      uint64_t v8 = 44;
    }
    else if ([v7 isEqualToString:@"RASTER_SATELLITE_ASTC"])
    {
      uint64_t v8 = 45;
    }
    else if ([v7 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
    {
      uint64_t v8 = 46;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
    {
      uint64_t v8 = 47;
    }
    else if ([v7 isEqualToString:@"VECTOR_COVERAGE"])
    {
      uint64_t v8 = 48;
    }
    else if ([v7 isEqualToString:@"FLYOVER_METADATA"])
    {
      uint64_t v8 = 52;
    }
    else if ([v7 isEqualToString:@"VECTOR_ROAD_NETWORK"])
    {
      uint64_t v8 = 53;
    }
    else if ([v7 isEqualToString:@"VECTOR_LAND_COVER"])
    {
      uint64_t v8 = 54;
    }
    else if ([v7 isEqualToString:@"VECTOR_DEBUG"])
    {
      uint64_t v8 = 55;
    }
    else if ([v7 isEqualToString:@"VECTOR_STREET_POI"])
    {
      uint64_t v8 = 56;
    }
    else if ([v7 isEqualToString:@"MUNIN_METADATA"])
    {
      uint64_t v8 = 57;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_MERCATOR"])
    {
      uint64_t v8 = 58;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_MODELS"])
    {
      uint64_t v8 = 59;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_MATERIALS"])
    {
      uint64_t v8 = 60;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_METADATA"])
    {
      uint64_t v8 = 61;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRACKS"])
    {
      uint64_t v8 = 62;
    }
    else if ([v7 isEqualToString:@"VECTOR_RESERVED_2"])
    {
      uint64_t v8 = 63;
    }
    else if ([v7 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
    {
      uint64_t v8 = 64;
    }
    else if ([v7 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
    {
      uint64_t v8 = 65;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_ROADS"])
    {
      uint64_t v8 = 66;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_STANDARD"])
    {
      uint64_t v8 = 67;
    }
    else if ([v7 isEqualToString:@"VECTOR_POI_V2"])
    {
      uint64_t v8 = 68;
    }
    else if ([v7 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
    {
      uint64_t v8 = 69;
    }
    else if ([v7 isEqualToString:@"VL_METADATA"])
    {
      uint64_t v8 = 70;
    }
    else if ([v7 isEqualToString:@"VL_DATA"])
    {
      uint64_t v8 = 71;
    }
    else if ([v7 isEqualToString:@"PROACTIVE_APP_CLIP"])
    {
      uint64_t v8 = 72;
    }
    else if ([v7 isEqualToString:@"VECTOR_BUILDINGS_V2"])
    {
      uint64_t v8 = 73;
    }
    else if ([v7 isEqualToString:@"POI_BUSYNESS"])
    {
      uint64_t v8 = 74;
    }
    else if ([v7 isEqualToString:@"POI_DP_BUSYNESS"])
    {
      uint64_t v8 = 75;
    }
    else if ([v7 isEqualToString:@"SMART_INTERFACE_SELECTION"])
    {
      uint64_t v8 = 76;
    }
    else if ([v7 isEqualToString:@"VECTOR_ASSETS"])
    {
      uint64_t v8 = 77;
    }
    else if ([v7 isEqualToString:@"SPR_ASSET_METADATA"])
    {
      uint64_t v8 = 78;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_POLAR"])
    {
      uint64_t v8 = 79;
    }
    else if ([v7 isEqualToString:@"SMART_DATA_MODE"])
    {
      uint64_t v8 = 80;
    }
    else if ([v7 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
    {
      uint64_t v8 = 81;
    }
    else if ([v7 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
    {
      uint64_t v8 = 82;
    }
    else if ([v7 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
    {
      uint64_t v8 = 83;
    }
    else if ([v7 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
    {
      uint64_t v8 = 84;
    }
    else if ([v7 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
    {
      uint64_t v8 = 85;
    }
    else if ([v7 isEqualToString:@"VECTOR_TRAFFIC_V2"])
    {
      uint64_t v8 = 86;
    }
    else if ([v7 isEqualToString:@"VECTOR_ROAD_SELECTION"])
    {
      uint64_t v8 = 87;
    }
    else if ([v7 isEqualToString:@"VECTOR_REGION_METADATA"])
    {
      uint64_t v8 = 88;
    }
    else if ([v7 isEqualToString:@"RAY_TRACING"])
    {
      uint64_t v8 = 89;
    }
    else if ([v7 isEqualToString:@"VECTOR_CONTOURS"])
    {
      uint64_t v8 = 90;
    }
    else if ([v7 isEqualToString:@"RASTER_SATELLITE_POLAR"])
    {
      uint64_t v8 = 91;
    }
    else if ([v7 isEqualToString:@"VMAP4_ELEVATION"])
    {
      uint64_t v8 = 92;
    }
    else if ([v7 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
    {
      uint64_t v8 = 93;
    }
    else if ([v7 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
    {
      uint64_t v8 = 94;
    }
    else if ([v7 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
    {
      uint64_t v8 = 95;
    }
    else if ([v7 isEqualToString:@"UNUSED_96"])
    {
      uint64_t v8 = 96;
    }
    else if ([v7 isEqualToString:@"UNUSED_97"])
    {
      uint64_t v8 = 97;
    }
    else if ([v7 isEqualToString:@"UNUSED_98"])
    {
      uint64_t v8 = 98;
    }
    else if ([v7 isEqualToString:@"UNUSED_99"])
    {
      uint64_t v8 = 99;
    }
    else if ([v7 isEqualToString:@"UNUSED_100"])
    {
      uint64_t v8 = 100;
    }
    else if ([v7 isEqualToString:@"UNUSED_101"])
    {
      uint64_t v8 = 101;
    }
    else if ([v7 isEqualToString:@"UNUSED_102"])
    {
      uint64_t v8 = 102;
    }
    else if ([v7 isEqualToString:@"UNUSED_103"])
    {
      uint64_t v8 = 103;
    }
    else if ([v7 isEqualToString:@"UNUSED_104"])
    {
      uint64_t v8 = 104;
    }
    else if ([v7 isEqualToString:@"UNUSED_105"])
    {
      uint64_t v8 = 105;
    }
    else if ([v7 isEqualToString:@"UNUSED_106"])
    {
      uint64_t v8 = 106;
    }
    else if ([v7 isEqualToString:@"UNUSED_107"])
    {
      uint64_t v8 = 107;
    }
    else if ([v7 isEqualToString:@"UNUSED_108"])
    {
      uint64_t v8 = 108;
    }
    else if ([v7 isEqualToString:@"UNUSED_109"])
    {
      uint64_t v8 = 109;
    }
    else if ([v7 isEqualToString:@"UNUSED_110"])
    {
      uint64_t v8 = 110;
    }
    else if ([v7 isEqualToString:@"UNUSED_111"])
    {
      uint64_t v8 = 111;
    }
    else if ([v7 isEqualToString:@"UNUSED_112"])
    {
      uint64_t v8 = 112;
    }
    else if ([v7 isEqualToString:@"UNUSED_113"])
    {
      uint64_t v8 = 113;
    }
    else if ([v7 isEqualToString:@"UNUSED_114"])
    {
      uint64_t v8 = 114;
    }
    else if ([v7 isEqualToString:@"UNUSED_115"])
    {
      uint64_t v8 = 115;
    }
    else if ([v7 isEqualToString:@"UNUSED_116"])
    {
      uint64_t v8 = 116;
    }
    else if ([v7 isEqualToString:@"UNUSED_117"])
    {
      uint64_t v8 = 117;
    }
    else if ([v7 isEqualToString:@"UNUSED_118"])
    {
      uint64_t v8 = 118;
    }
    else if ([v7 isEqualToString:@"UNUSED_119"])
    {
      uint64_t v8 = 119;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_238;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_238:
    [a1 setStyle:v8];
  }

  uint64_t v9 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v9, "unsignedIntValue"));
  }

  if (a3) {
    unint64_t v10 = @"tileKey";
  }
  else {
    unint64_t v10 = @"tile_key";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v19 = 0;
            uint64_t v20 = 0;
            _GEORPVisibleTileKeyFromDictionaryRepresentation(v17, (uint64_t)&v19);
            objc_msgSend(a1, "addTileKey:", v19, v20);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }
  }
LABEL_256:

  return a1;
}

- (GEORPVisibleTileSet)initWithJSON:(id)a3
{
  return (GEORPVisibleTileSet *)-[GEORPVisibleTileSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPVisibleTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPVisibleTileSetReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_tileKeysCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEORPVisibleTileKeyWriteTo((uint64_t)&self->_tileKeys[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_tileKeysCount);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v10 = a3;
  [(GEORPVisibleTileSet *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v10[9] = self->_style;
    *((unsigned char *)v10 + 40) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v10[8] = self->_identifier;
    *((unsigned char *)v10 + 40) |= 1u;
  }
  if ([(GEORPVisibleTileSet *)self tileKeysCount])
  {
    [v10 clearTileKeys];
    unint64_t v5 = [(GEORPVisibleTileSet *)self tileKeysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEORPVisibleTileSet *)self tileKeyAtIndex:i];
        objc_msgSend(v10, "addTileKey:", v8, v9);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 36) = self->_style;
    *(unsigned char *)(v4 + 40) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 32) = self->_identifier;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  unint64_t tileKeysCount = self->_tileKeysCount;
  if (tileKeysCount)
  {
    -[GEORPVisibleTileSet _reserveTileKeys:](v4, tileKeysCount);
    memcpy(*(void **)(v5 + 8), self->_tileKeys, 16 * self->_tileKeysCount);
    *(void *)(v5 + 16) = self->_tileKeysCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEORPVisibleTileSet *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[5] & 2) == 0 || self->_style != *((_DWORD *)v4 + 9)) {
      goto LABEL_14;
    }
  }
  else if (((_BYTE)v4[5] & 2) != 0)
  {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (((_BYTE)v4[5] & 1) == 0 || self->_identifier != *((_DWORD *)v4 + 8)) {
      goto LABEL_14;
    }
  }
  else if ((_BYTE)v4[5])
  {
    goto LABEL_14;
  }
  unint64_t tileKeysCount = self->_tileKeysCount;
  if ((const void *)tileKeysCount != v4[2])
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  BOOL v6 = memcmp(self->_tileKeys, v4[1], 16 * tileKeysCount) == 0;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPVisibleTileSet *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_style;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ PBHashBytes();
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_identifier;
  return v4 ^ v3 ^ PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  char v4 = *((unsigned char *)v10 + 40);
  if ((v4 & 2) != 0)
  {
    self->_style = *((_DWORD *)v10 + 9);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v10 + 40);
  }
  if (v4)
  {
    self->_identifier = *((_DWORD *)v10 + 8);
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v5 = [v10 tileKeysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [v10 tileKeyAtIndex:i];
      -[GEORPVisibleTileSet addTileKey:](self, "addTileKey:", v8, v9);
    }
  }
}

@end