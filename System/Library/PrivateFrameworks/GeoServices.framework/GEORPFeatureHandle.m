@interface GEORPFeatureHandle
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFeatureIndex;
- (BOOL)hasFeatureTileX;
- (BOOL)hasFeatureTileY;
- (BOOL)hasFeatureTileZ;
- (BOOL)hasIdentifier;
- (BOOL)hasStyle;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeatureHandle)initWithDictionary:(id)a3;
- (GEORPFeatureHandle)initWithJSON:(id)a3;
- (GEORPFeatureHandleStyleAttribute)styleAttributeAtIndex:(unint64_t)a3;
- (GEORPFeatureHandleStyleAttribute)styleAttributes;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)styleAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsStyle:(id)a3;
- (int)StringAsType:(id)a3;
- (int)style;
- (int)type;
- (uint64_t)_reserveStyleAttributes:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)styleAttributesCount;
- (unsigned)featureIndex;
- (unsigned)featureTileX;
- (unsigned)featureTileY;
- (unsigned)featureTileZ;
- (unsigned)identifier;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addStyleAttribute:(GEORPFeatureHandleStyleAttribute)a3;
- (void)clearStyleAttributes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFeatureIndex:(unsigned int)a3;
- (void)setFeatureTileX:(unsigned int)a3;
- (void)setFeatureTileY:(unsigned int)a3;
- (void)setFeatureTileZ:(unsigned int)a3;
- (void)setHasFeatureIndex:(BOOL)a3;
- (void)setHasFeatureTileX:(BOOL)a3;
- (void)setHasFeatureTileY:(BOOL)a3;
- (void)setHasFeatureTileZ:(BOOL)a3;
- (void)setHasIdentifier:(BOOL)a3;
- (void)setHasStyle:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setStyle:(int)a3;
- (void)setStyleAttributes:(GEORPFeatureHandleStyleAttribute *)a3 count:(unint64_t)a4;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeatureHandle

- (void)dealloc
{
  [(GEORPFeatureHandle *)self clearStyleAttributes];
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeatureHandle;
  [(GEORPFeatureHandle *)&v3 dealloc];
}

- (unsigned)featureIndex
{
  return self->_featureIndex;
}

- (void)setFeatureIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_featureIndex = a3;
}

- (void)setHasFeatureIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFeatureIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)featureTileX
{
  return self->_featureTileX;
}

- (void)setFeatureTileX:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_featureTileX = a3;
}

- (void)setHasFeatureTileX:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasFeatureTileX
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)featureTileY
{
  return self->_featureTileY;
}

- (void)setFeatureTileY:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_featureTileY = a3;
}

- (void)setHasFeatureTileY:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasFeatureTileY
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)featureTileZ
{
  return self->_featureTileZ;
}

- (void)setFeatureTileZ:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_featureTileZ = a3;
}

- (void)setHasFeatureTileZ:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasFeatureTileZ
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)style
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return self->_style;
  }
  else {
    return 0;
  }
}

- (void)setStyle:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasStyle
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
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
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIdentifier
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6AD8[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POINT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POLYGON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT_NODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TRANSIT_ACCESS_POINT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TRANSIT_LINES"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_INCIDENT"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)styleAttributesCount
{
  return self->_styleAttributesCount;
}

- (GEORPFeatureHandleStyleAttribute)styleAttributes
{
  return self->_styleAttributes;
}

- (uint64_t)_reserveStyleAttributes:(uint64_t)a1
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
    if (8 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 8 * v9, 0x88EFDBD6uLL);
    if (result)
    {
      *(void *)(a1 + 24) = v9;
      *(void *)(a1 + 8) = result;
      bzero((void *)(result + 8 * *(void *)(a1 + 16)), 8 * (v9 - *(void *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (void)clearStyleAttributes
{
  self->_styleAttributesSpace = 0;
  self->_styleAttributesCount = 0;
  free(self->_styleAttributes);
  self->_styleAttributes = 0;
}

- (void)addStyleAttribute:(GEORPFeatureHandleStyleAttribute)a3
{
  if (-[GEORPFeatureHandle _reserveStyleAttributes:]((uint64_t)self, 1uLL)) {
    self->_styleAttributes[self->_styleAttributesCount++] = a3;
  }
}

- (GEORPFeatureHandleStyleAttribute)styleAttributeAtIndex:(unint64_t)a3
{
  unint64_t styleAttributesCount = self->_styleAttributesCount;
  if (styleAttributesCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, styleAttributesCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return self->_styleAttributes[a3];
}

- (void)setStyleAttributes:(GEORPFeatureHandleStyleAttribute *)a3 count:(unint64_t)a4
{
  if (-[GEORPFeatureHandle _reserveStyleAttributes:]((uint64_t)self, a4))
  {
    memcpy(self->_styleAttributes, a3, 8 * a4);
    self->_unint64_t styleAttributesCount = a4;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeatureHandle;
  unint64_t v4 = [(GEORPFeatureHandle *)&v8 description];
  unint64_t v5 = [(GEORPFeatureHandle *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeatureHandle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    unint64_t v4 = 0;
    goto LABEL_156;
  }
  [(id)a1 readAll:1];
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 60);
  if (v5)
  {
    unint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
    if (a2) {
      uint64_t v7 = @"featureIndex";
    }
    else {
      uint64_t v7 = @"feature_index";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 60);
  }
  if ((v5 & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
    if (a2) {
      unint64_t v9 = @"featureTileX";
    }
    else {
      unint64_t v9 = @"feature_tile_x";
    }
    [v4 setObject:v8 forKey:v9];

    char v5 = *(unsigned char *)(a1 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  if (a2) {
    v11 = @"featureTileY";
  }
  else {
    v11 = @"feature_tile_y";
  }
  [v4 setObject:v10 forKey:v11];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_22:
  v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 44)];
  if (a2) {
    v13 = @"featureTileZ";
  }
  else {
    v13 = @"feature_tile_z";
  }
  [v4 setObject:v12 forKey:v13];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_143;
  }
LABEL_26:
  v14 = @"RASTER_STANDARD";
  switch(*(_DWORD *)(a1 + 52))
  {
    case 0:
      break;
    case 1:
      v14 = @"VECTOR_STANDARD";
      break;
    case 2:
      v14 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      v14 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      v14 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      v14 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      v14 = @"RASTER_HYBRID";
      break;
    case 7:
      v14 = @"RASTER_SATELLITE";
      break;
    case 8:
      v14 = @"RASTER_TERRAIN";
      break;
    case 0xB:
      v14 = @"VECTOR_BUILDINGS";
      break;
    case 0xC:
      v14 = @"VECTOR_TRAFFIC";
      break;
    case 0xD:
      v14 = @"VECTOR_POI";
      break;
    case 0xE:
      v14 = @"SPUTNIK_METADATA";
      break;
    case 0xF:
      v14 = @"SPUTNIK_C3M";
      break;
    case 0x10:
      v14 = @"SPUTNIK_DSM";
      break;
    case 0x11:
      v14 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 0x12:
      v14 = @"VECTOR_REALISTIC";
      break;
    case 0x13:
      v14 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 0x14:
      v14 = @"VECTOR_ROADS";
      break;
    case 0x15:
      v14 = @"RASTER_VEGETATION";
      break;
    case 0x16:
      v14 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 0x17:
      v14 = @"RASTER_COASTLINE_MASK";
      break;
    case 0x18:
      v14 = @"RASTER_HILLSHADE";
      break;
    case 0x19:
      v14 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 0x1A:
      v14 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 0x1B:
      v14 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 0x1C:
      v14 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 0x1D:
      v14 = @"VECTOR_SPEED_PROFILES";
      break;
    case 0x1E:
      v14 = @"VECTOR_VENUES";
      break;
    case 0x1F:
      v14 = @"RASTER_DOWN_SAMPLED";
      break;
    case 0x20:
      v14 = @"RASTER_COLOR_BALANCED";
      break;
    case 0x21:
      v14 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 0x22:
      v14 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 0x23:
      v14 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 0x24:
      v14 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 0x25:
      v14 = @"VECTOR_TRANSIT";
      break;
    case 0x26:
      v14 = @"RASTER_STANDARD_BASE";
      break;
    case 0x27:
      v14 = @"RASTER_STANDARD_LABELS";
      break;
    case 0x28:
      v14 = @"RASTER_HYBRID_ROADS";
      break;
    case 0x29:
      v14 = @"RASTER_HYBRID_LABELS";
      break;
    case 0x2A:
      v14 = @"FLYOVER_C3M_MESH";
      break;
    case 0x2B:
      v14 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 0x2C:
      v14 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 0x2D:
      v14 = @"RASTER_SATELLITE_ASTC";
      break;
    case 0x2E:
      v14 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 0x2F:
      v14 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 0x30:
      v14 = @"VECTOR_COVERAGE";
      break;
    case 0x34:
      v14 = @"FLYOVER_METADATA";
      break;
    case 0x35:
      v14 = @"VECTOR_ROAD_NETWORK";
      break;
    case 0x36:
      v14 = @"VECTOR_LAND_COVER";
      break;
    case 0x37:
      v14 = @"VECTOR_DEBUG";
      break;
    case 0x38:
      v14 = @"VECTOR_STREET_POI";
      break;
    case 0x39:
      v14 = @"MUNIN_METADATA";
      break;
    case 0x3A:
      v14 = @"VECTOR_SPR_MERCATOR";
      break;
    case 0x3B:
      v14 = @"VECTOR_SPR_MODELS";
      break;
    case 0x3C:
      v14 = @"VECTOR_SPR_MATERIALS";
      break;
    case 0x3D:
      v14 = @"VECTOR_SPR_METADATA";
      break;
    case 0x3E:
      v14 = @"VECTOR_TRACKS";
      break;
    case 0x3F:
      v14 = @"VECTOR_RESERVED_2";
      break;
    case 0x40:
      v14 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 0x41:
      v14 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 0x42:
      v14 = @"VECTOR_SPR_ROADS";
      break;
    case 0x43:
      v14 = @"VECTOR_SPR_STANDARD";
      break;
    case 0x44:
      v14 = @"VECTOR_POI_V2";
      break;
    case 0x45:
      v14 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 0x46:
      v14 = @"VL_METADATA";
      break;
    case 0x47:
      v14 = @"VL_DATA";
      break;
    case 0x48:
      v14 = @"PROACTIVE_APP_CLIP";
      break;
    case 0x49:
      v14 = @"VECTOR_BUILDINGS_V2";
      break;
    case 0x4A:
      v14 = @"POI_BUSYNESS";
      break;
    case 0x4B:
      v14 = @"POI_DP_BUSYNESS";
      break;
    case 0x4C:
      v14 = @"SMART_INTERFACE_SELECTION";
      break;
    case 0x4D:
      v14 = @"VECTOR_ASSETS";
      break;
    case 0x4E:
      v14 = @"SPR_ASSET_METADATA";
      break;
    case 0x4F:
      v14 = @"VECTOR_SPR_POLAR";
      break;
    case 0x50:
      v14 = @"SMART_DATA_MODE";
      break;
    case 0x51:
      v14 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 0x52:
      v14 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 0x53:
      v14 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 0x54:
      v14 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 0x55:
      v14 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 0x56:
      v14 = @"VECTOR_TRAFFIC_V2";
      break;
    case 0x57:
      v14 = @"VECTOR_ROAD_SELECTION";
      break;
    case 0x58:
      v14 = @"VECTOR_REGION_METADATA";
      break;
    case 0x59:
      v14 = @"RAY_TRACING";
      break;
    case 0x5A:
      v14 = @"VECTOR_CONTOURS";
      break;
    case 0x5B:
      v14 = @"RASTER_SATELLITE_POLAR";
      break;
    case 0x5C:
      v14 = @"VMAP4_ELEVATION";
      break;
    case 0x5D:
      v14 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 0x5E:
      v14 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 0x5F:
      v14 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 0x60:
      v14 = @"UNUSED_96";
      break;
    case 0x61:
      v14 = @"UNUSED_97";
      break;
    case 0x62:
      v14 = @"UNUSED_98";
      break;
    case 0x63:
      v14 = @"UNUSED_99";
      break;
    case 0x64:
      v14 = @"UNUSED_100";
      break;
    case 0x65:
      v14 = @"UNUSED_101";
      break;
    case 0x66:
      v14 = @"UNUSED_102";
      break;
    case 0x67:
      v14 = @"UNUSED_103";
      break;
    case 0x68:
      v14 = @"UNUSED_104";
      break;
    case 0x69:
      v14 = @"UNUSED_105";
      break;
    case 0x6A:
      v14 = @"UNUSED_106";
      break;
    case 0x6B:
      v14 = @"UNUSED_107";
      break;
    case 0x6C:
      v14 = @"UNUSED_108";
      break;
    case 0x6D:
      v14 = @"UNUSED_109";
      break;
    case 0x6E:
      v14 = @"UNUSED_110";
      break;
    case 0x6F:
      v14 = @"UNUSED_111";
      break;
    case 0x70:
      v14 = @"UNUSED_112";
      break;
    case 0x71:
      v14 = @"UNUSED_113";
      break;
    case 0x72:
      v14 = @"UNUSED_114";
      break;
    case 0x73:
      v14 = @"UNUSED_115";
      break;
    case 0x74:
      v14 = @"UNUSED_116";
      break;
    case 0x75:
      v14 = @"UNUSED_117";
      break;
    case 0x76:
      v14 = @"UNUSED_118";
      break;
    case 0x77:
      v14 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  [v4 setObject:v14 forKey:@"style"];

  char v5 = *(unsigned char *)(a1 + 60);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_148;
    }
    goto LABEL_144;
  }
LABEL_143:
  v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v4 setObject:v15 forKey:@"identifier"];

  if ((*(unsigned char *)(a1 + 60) & 0x40) == 0) {
    goto LABEL_148;
  }
LABEL_144:
  uint64_t v16 = *(int *)(a1 + 56);
  if (v16 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E53E6AD8[v16];
  }
  [v4 setObject:v17 forKey:@"type"];

LABEL_148:
  if (*(void *)(a1 + 16))
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 16)];
    if (*(void *)(a1 + 16))
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        v21 = _GEORPFeatureHandleStyleAttributeDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 8) + v19));
        [v18 addObject:v21];

        ++v20;
        v19 += 8;
      }
      while (v20 < *(void *)(a1 + 16));
    }
    if (a2) {
      v22 = @"styleAttribute";
    }
    else {
      v22 = @"style_attribute";
    }
    [v4 setObject:v18 forKey:v22];
  }
LABEL_156:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeatureHandle _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeatureHandle)initWithDictionary:(id)a3
{
  return (GEORPFeatureHandle *)-[GEORPFeatureHandle _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_300;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_300;
  }
  if (a3) {
    unint64_t v6 = @"featureIndex";
  }
  else {
    unint64_t v6 = @"feature_index";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFeatureIndex:", objc_msgSend(v7, "unsignedIntValue"));
  }

  if (a3) {
    objc_super v8 = @"featureTileX";
  }
  else {
    objc_super v8 = @"feature_tile_x";
  }
  unint64_t v9 = [v5 objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFeatureTileX:", objc_msgSend(v9, "unsignedIntValue"));
  }

  if (a3) {
    v10 = @"featureTileY";
  }
  else {
    v10 = @"feature_tile_y";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFeatureTileY:", objc_msgSend(v11, "unsignedIntValue"));
  }

  if (a3) {
    v12 = @"featureTileZ";
  }
  else {
    v12 = @"feature_tile_z";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFeatureTileZ:", objc_msgSend(v13, "unsignedIntValue"));
  }

  v14 = [v5 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"RASTER_STANDARD"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"VECTOR_STANDARD"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v16 = 3;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v16 = 4;
    }
    else if ([v15 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
    {
      uint64_t v16 = 5;
    }
    else if ([v15 isEqualToString:@"RASTER_HYBRID"])
    {
      uint64_t v16 = 6;
    }
    else if ([v15 isEqualToString:@"RASTER_SATELLITE"])
    {
      uint64_t v16 = 7;
    }
    else if ([v15 isEqualToString:@"RASTER_TERRAIN"])
    {
      uint64_t v16 = 8;
    }
    else if ([v15 isEqualToString:@"VECTOR_BUILDINGS"])
    {
      uint64_t v16 = 11;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC"])
    {
      uint64_t v16 = 12;
    }
    else if ([v15 isEqualToString:@"VECTOR_POI"])
    {
      uint64_t v16 = 13;
    }
    else if ([v15 isEqualToString:@"SPUTNIK_METADATA"])
    {
      uint64_t v16 = 14;
    }
    else if ([v15 isEqualToString:@"SPUTNIK_C3M"])
    {
      uint64_t v16 = 15;
    }
    else if ([v15 isEqualToString:@"SPUTNIK_DSM"])
    {
      uint64_t v16 = 16;
    }
    else if ([v15 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
    {
      uint64_t v16 = 17;
    }
    else if ([v15 isEqualToString:@"VECTOR_REALISTIC"])
    {
      uint64_t v16 = 18;
    }
    else if ([v15 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
    {
      uint64_t v16 = 19;
    }
    else if ([v15 isEqualToString:@"VECTOR_ROADS"])
    {
      uint64_t v16 = 20;
    }
    else if ([v15 isEqualToString:@"RASTER_VEGETATION"])
    {
      uint64_t v16 = 21;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
    {
      uint64_t v16 = 22;
    }
    else if ([v15 isEqualToString:@"RASTER_COASTLINE_MASK"])
    {
      uint64_t v16 = 23;
    }
    else if ([v15 isEqualToString:@"RASTER_HILLSHADE"])
    {
      uint64_t v16 = 24;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
    {
      uint64_t v16 = 25;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
    {
      uint64_t v16 = 26;
    }
    else if ([v15 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
    {
      uint64_t v16 = 27;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
    {
      uint64_t v16 = 28;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPEED_PROFILES"])
    {
      uint64_t v16 = 29;
    }
    else if ([v15 isEqualToString:@"VECTOR_VENUES"])
    {
      uint64_t v16 = 30;
    }
    else if ([v15 isEqualToString:@"RASTER_DOWN_SAMPLED"])
    {
      uint64_t v16 = 31;
    }
    else if ([v15 isEqualToString:@"RASTER_COLOR_BALANCED"])
    {
      uint64_t v16 = 32;
    }
    else if ([v15 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
    {
      uint64_t v16 = 33;
    }
    else if ([v15 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
    {
      uint64_t v16 = 34;
    }
    else if ([v15 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
    {
      uint64_t v16 = 35;
    }
    else if ([v15 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
    {
      uint64_t v16 = 36;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRANSIT"])
    {
      uint64_t v16 = 37;
    }
    else if ([v15 isEqualToString:@"RASTER_STANDARD_BASE"])
    {
      uint64_t v16 = 38;
    }
    else if ([v15 isEqualToString:@"RASTER_STANDARD_LABELS"])
    {
      uint64_t v16 = 39;
    }
    else if ([v15 isEqualToString:@"RASTER_HYBRID_ROADS"])
    {
      uint64_t v16 = 40;
    }
    else if ([v15 isEqualToString:@"RASTER_HYBRID_LABELS"])
    {
      uint64_t v16 = 41;
    }
    else if ([v15 isEqualToString:@"FLYOVER_C3M_MESH"])
    {
      uint64_t v16 = 42;
    }
    else if ([v15 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
    {
      uint64_t v16 = 43;
    }
    else if ([v15 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
    {
      uint64_t v16 = 44;
    }
    else if ([v15 isEqualToString:@"RASTER_SATELLITE_ASTC"])
    {
      uint64_t v16 = 45;
    }
    else if ([v15 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
    {
      uint64_t v16 = 46;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
    {
      uint64_t v16 = 47;
    }
    else if ([v15 isEqualToString:@"VECTOR_COVERAGE"])
    {
      uint64_t v16 = 48;
    }
    else if ([v15 isEqualToString:@"FLYOVER_METADATA"])
    {
      uint64_t v16 = 52;
    }
    else if ([v15 isEqualToString:@"VECTOR_ROAD_NETWORK"])
    {
      uint64_t v16 = 53;
    }
    else if ([v15 isEqualToString:@"VECTOR_LAND_COVER"])
    {
      uint64_t v16 = 54;
    }
    else if ([v15 isEqualToString:@"VECTOR_DEBUG"])
    {
      uint64_t v16 = 55;
    }
    else if ([v15 isEqualToString:@"VECTOR_STREET_POI"])
    {
      uint64_t v16 = 56;
    }
    else if ([v15 isEqualToString:@"MUNIN_METADATA"])
    {
      uint64_t v16 = 57;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_MERCATOR"])
    {
      uint64_t v16 = 58;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_MODELS"])
    {
      uint64_t v16 = 59;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_MATERIALS"])
    {
      uint64_t v16 = 60;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_METADATA"])
    {
      uint64_t v16 = 61;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRACKS"])
    {
      uint64_t v16 = 62;
    }
    else if ([v15 isEqualToString:@"VECTOR_RESERVED_2"])
    {
      uint64_t v16 = 63;
    }
    else if ([v15 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
    {
      uint64_t v16 = 64;
    }
    else if ([v15 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
    {
      uint64_t v16 = 65;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_ROADS"])
    {
      uint64_t v16 = 66;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_STANDARD"])
    {
      uint64_t v16 = 67;
    }
    else if ([v15 isEqualToString:@"VECTOR_POI_V2"])
    {
      uint64_t v16 = 68;
    }
    else if ([v15 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
    {
      uint64_t v16 = 69;
    }
    else if ([v15 isEqualToString:@"VL_METADATA"])
    {
      uint64_t v16 = 70;
    }
    else if ([v15 isEqualToString:@"VL_DATA"])
    {
      uint64_t v16 = 71;
    }
    else if ([v15 isEqualToString:@"PROACTIVE_APP_CLIP"])
    {
      uint64_t v16 = 72;
    }
    else if ([v15 isEqualToString:@"VECTOR_BUILDINGS_V2"])
    {
      uint64_t v16 = 73;
    }
    else if ([v15 isEqualToString:@"POI_BUSYNESS"])
    {
      uint64_t v16 = 74;
    }
    else if ([v15 isEqualToString:@"POI_DP_BUSYNESS"])
    {
      uint64_t v16 = 75;
    }
    else if ([v15 isEqualToString:@"SMART_INTERFACE_SELECTION"])
    {
      uint64_t v16 = 76;
    }
    else if ([v15 isEqualToString:@"VECTOR_ASSETS"])
    {
      uint64_t v16 = 77;
    }
    else if ([v15 isEqualToString:@"SPR_ASSET_METADATA"])
    {
      uint64_t v16 = 78;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_POLAR"])
    {
      uint64_t v16 = 79;
    }
    else if ([v15 isEqualToString:@"SMART_DATA_MODE"])
    {
      uint64_t v16 = 80;
    }
    else if ([v15 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
    {
      uint64_t v16 = 81;
    }
    else if ([v15 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
    {
      uint64_t v16 = 82;
    }
    else if ([v15 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
    {
      uint64_t v16 = 83;
    }
    else if ([v15 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
    {
      uint64_t v16 = 84;
    }
    else if ([v15 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
    {
      uint64_t v16 = 85;
    }
    else if ([v15 isEqualToString:@"VECTOR_TRAFFIC_V2"])
    {
      uint64_t v16 = 86;
    }
    else if ([v15 isEqualToString:@"VECTOR_ROAD_SELECTION"])
    {
      uint64_t v16 = 87;
    }
    else if ([v15 isEqualToString:@"VECTOR_REGION_METADATA"])
    {
      uint64_t v16 = 88;
    }
    else if ([v15 isEqualToString:@"RAY_TRACING"])
    {
      uint64_t v16 = 89;
    }
    else if ([v15 isEqualToString:@"VECTOR_CONTOURS"])
    {
      uint64_t v16 = 90;
    }
    else if ([v15 isEqualToString:@"RASTER_SATELLITE_POLAR"])
    {
      uint64_t v16 = 91;
    }
    else if ([v15 isEqualToString:@"VMAP4_ELEVATION"])
    {
      uint64_t v16 = 92;
    }
    else if ([v15 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
    {
      uint64_t v16 = 93;
    }
    else if ([v15 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
    {
      uint64_t v16 = 94;
    }
    else if ([v15 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
    {
      uint64_t v16 = 95;
    }
    else if ([v15 isEqualToString:@"UNUSED_96"])
    {
      uint64_t v16 = 96;
    }
    else if ([v15 isEqualToString:@"UNUSED_97"])
    {
      uint64_t v16 = 97;
    }
    else if ([v15 isEqualToString:@"UNUSED_98"])
    {
      uint64_t v16 = 98;
    }
    else if ([v15 isEqualToString:@"UNUSED_99"])
    {
      uint64_t v16 = 99;
    }
    else if ([v15 isEqualToString:@"UNUSED_100"])
    {
      uint64_t v16 = 100;
    }
    else if ([v15 isEqualToString:@"UNUSED_101"])
    {
      uint64_t v16 = 101;
    }
    else if ([v15 isEqualToString:@"UNUSED_102"])
    {
      uint64_t v16 = 102;
    }
    else if ([v15 isEqualToString:@"UNUSED_103"])
    {
      uint64_t v16 = 103;
    }
    else if ([v15 isEqualToString:@"UNUSED_104"])
    {
      uint64_t v16 = 104;
    }
    else if ([v15 isEqualToString:@"UNUSED_105"])
    {
      uint64_t v16 = 105;
    }
    else if ([v15 isEqualToString:@"UNUSED_106"])
    {
      uint64_t v16 = 106;
    }
    else if ([v15 isEqualToString:@"UNUSED_107"])
    {
      uint64_t v16 = 107;
    }
    else if ([v15 isEqualToString:@"UNUSED_108"])
    {
      uint64_t v16 = 108;
    }
    else if ([v15 isEqualToString:@"UNUSED_109"])
    {
      uint64_t v16 = 109;
    }
    else if ([v15 isEqualToString:@"UNUSED_110"])
    {
      uint64_t v16 = 110;
    }
    else if ([v15 isEqualToString:@"UNUSED_111"])
    {
      uint64_t v16 = 111;
    }
    else if ([v15 isEqualToString:@"UNUSED_112"])
    {
      uint64_t v16 = 112;
    }
    else if ([v15 isEqualToString:@"UNUSED_113"])
    {
      uint64_t v16 = 113;
    }
    else if ([v15 isEqualToString:@"UNUSED_114"])
    {
      uint64_t v16 = 114;
    }
    else if ([v15 isEqualToString:@"UNUSED_115"])
    {
      uint64_t v16 = 115;
    }
    else if ([v15 isEqualToString:@"UNUSED_116"])
    {
      uint64_t v16 = 116;
    }
    else if ([v15 isEqualToString:@"UNUSED_117"])
    {
      uint64_t v16 = 117;
    }
    else if ([v15 isEqualToString:@"UNUSED_118"])
    {
      uint64_t v16 = 118;
    }
    else if ([v15 isEqualToString:@"UNUSED_119"])
    {
      uint64_t v16 = 119;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_259;
    }
    uint64_t v16 = [v14 intValue];
  }
  [a1 setStyle:v16];
LABEL_259:

  v17 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIdentifier:", objc_msgSend(v17, "unsignedIntValue"));
  }

  v18 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"NONE"])
    {
      uint64_t v20 = 0;
    }
    else if ([v19 isEqualToString:@"LINE"])
    {
      uint64_t v20 = 1;
    }
    else if ([v19 isEqualToString:@"POINT"])
    {
      uint64_t v20 = 2;
    }
    else if ([v19 isEqualToString:@"POLYGON"])
    {
      uint64_t v20 = 3;
    }
    else if ([v19 isEqualToString:@"TRANSIT_NODE"])
    {
      uint64_t v20 = 4;
    }
    else if ([v19 isEqualToString:@"TRANSIT_ACCESS_POINT"])
    {
      uint64_t v20 = 5;
    }
    else if ([v19 isEqualToString:@"TRANSIT_LINE"])
    {
      uint64_t v20 = 6;
    }
    else if ([v19 isEqualToString:@"TRANSIT_LINES"])
    {
      uint64_t v20 = 7;
    }
    else if ([v19 isEqualToString:@"TRAFFIC_INCIDENT"])
    {
      uint64_t v20 = 8;
    }
    else
    {
      uint64_t v20 = 0;
    }

    goto LABEL_284;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = [v18 intValue];
LABEL_284:
    [a1 setType:v20];
  }

  if (a3) {
    v21 = @"styleAttribute";
  }
  else {
    v21 = @"style_attribute";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v31 + 1) + 8 * v27);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v30 = 0;
            _GEORPFeatureHandleStyleAttributeFromDictionaryRepresentation(v28, &v30);
            [a1 addStyleAttribute:v30];
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v25);
    }
  }
LABEL_300:

  return a1;
}

- (GEORPFeatureHandle)initWithJSON:(id)a3
{
  return (GEORPFeatureHandle *)-[GEORPFeatureHandle _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeatureHandleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeatureHandleReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
  if (self->_styleAttributesCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      PBDataWriterWriteInt32Field();
      PBDataWriterWriteInt32Field();
      PBDataWriterRecallMark();
      ++v7;
      v6 += 8;
    }
    while (v7 < self->_styleAttributesCount);
  }
}

- (void)copyTo:(id)a3
{
  objc_super v8 = a3;
  [(GEORPFeatureHandle *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v8[8] = self->_featureIndex;
    *((unsigned char *)v8 + 60) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v8[9] = self->_featureTileX;
  *((unsigned char *)v8 + 60) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v8[10] = self->_featureTileY;
  *((unsigned char *)v8 + 60) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v8[11] = self->_featureTileZ;
  *((unsigned char *)v8 + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_21:
    v8[12] = self->_identifier;
    *((unsigned char *)v8 + 60) |= 0x10u;
    if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_20:
  v8[13] = self->_style;
  *((unsigned char *)v8 + 60) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_21;
  }
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    v8[14] = self->_type;
    *((unsigned char *)v8 + 60) |= 0x40u;
  }
LABEL_9:
  if ([(GEORPFeatureHandle *)self styleAttributesCount])
  {
    [v8 clearStyleAttributes];
    unint64_t v5 = [(GEORPFeatureHandle *)self styleAttributesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v8, "addStyleAttribute:", -[GEORPFeatureHandle styleAttributeAtIndex:](self, "styleAttributeAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 32) = self->_featureIndex;
    *(unsigned char *)(v4 + 60) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 36) = self->_featureTileX;
  *(unsigned char *)(v4 + 60) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v4 + 40) = self->_featureTileY;
  *(unsigned char *)(v4 + 60) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v4 + 44) = self->_featureTileZ;
  *(unsigned char *)(v4 + 60) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v4 + 52) = self->_style;
  *(unsigned char *)(v4 + 60) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *(_DWORD *)(v4 + 48) = self->_identifier;
  *(unsigned char *)(v4 + 60) |= 0x10u;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v4 + 56) = self->_type;
    *(unsigned char *)(v4 + 60) |= 0x40u;
  }
LABEL_9:
  unint64_t styleAttributesCount = self->_styleAttributesCount;
  if (styleAttributesCount)
  {
    -[GEORPFeatureHandle _reserveStyleAttributes:](v4, styleAttributesCount);
    memcpy(*(void **)(v5 + 8), self->_styleAttributes, 8 * self->_styleAttributesCount);
    *(void *)(v5 + 16) = self->_styleAttributesCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  [(GEORPFeatureHandle *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_featureIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_featureTileX != *((_DWORD *)v4 + 9)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_featureTileY != *((_DWORD *)v4 + 10)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_featureTileZ != *((_DWORD *)v4 + 11)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) == 0 || self->_style != *((_DWORD *)v4 + 13)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_identifier != *((_DWORD *)v4 + 12)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x40) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x40) != 0)
  {
    goto LABEL_39;
  }
  unint64_t styleAttributesCount = self->_styleAttributesCount;
  if ((const void *)styleAttributesCount != v4[2])
  {
LABEL_39:
    BOOL v6 = 0;
    goto LABEL_40;
  }
  BOOL v6 = memcmp(self->_styleAttributes, v4[1], 8 * styleAttributesCount) == 0;
LABEL_40:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPFeatureHandle *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_featureIndex;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_featureTileX;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_featureTileY;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_featureTileZ;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_style;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ PBHashBytes();
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_identifier;
  if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  char v4 = *((unsigned char *)v8 + 60);
  if (v4)
  {
    self->_featureIndex = *((_DWORD *)v8 + 8);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v8 + 60);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v8 + 60) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_featureTileX = *((_DWORD *)v8 + 9);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v8 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_featureTileY = *((_DWORD *)v8 + 10);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v8 + 60);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_featureTileZ = *((_DWORD *)v8 + 11);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v8 + 60);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_style = *((_DWORD *)v8 + 13);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v8 + 60);
  if ((v4 & 0x10) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_20:
  self->_identifier = *((_DWORD *)v8 + 12);
  *(unsigned char *)&self->_flags |= 0x10u;
  if ((*((unsigned char *)v8 + 60) & 0x40) != 0)
  {
LABEL_8:
    self->_type = *((_DWORD *)v8 + 14);
    *(unsigned char *)&self->_flags |= 0x40u;
  }
LABEL_9:
  uint64_t v5 = [v8 styleAttributesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEORPFeatureHandle addStyleAttribute:](self, "addStyleAttribute:", [v8 styleAttributeAtIndex:i]);
  }
}

@end