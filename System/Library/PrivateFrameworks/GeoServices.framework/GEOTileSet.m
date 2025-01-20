@interface GEOTileSet
+ (BOOL)isValid:(id)a3;
+ (Class)countryRegionAllowlistType;
+ (Class)deviceSKUAllowlistType;
+ (Class)supportedLanguageType;
+ (Class)validVersionType;
- (BOOL)hasAlternativeMultipathTCPPort;
- (BOOL)hasBaseURL;
- (BOOL)hasChecksumType;
- (BOOL)hasDataSet;
- (BOOL)hasLocalizationURL;
- (BOOL)hasMultiTileURL;
- (BOOL)hasMultiTileURLUsesStatusCodes;
- (BOOL)hasRequestStyle;
- (BOOL)hasSupportsMultipathTCP;
- (BOOL)hasUpdateBehavior;
- (BOOL)hasUseAuthProxy;
- (BOOL)isEqual:(id)a3;
- (BOOL)multiTileURLUsesStatusCodes;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsMultipathTCP;
- (BOOL)useAuthProxy;
- (GEOTileSet)init;
- (GEOTileSet)initWithData:(id)a3;
- (GEOTileSet)initWithDictionary:(id)a3;
- (GEOTileSet)initWithJSON:(id)a3;
- (NSMutableArray)countryRegionAllowlists;
- (NSMutableArray)deviceSKUAllowlists;
- (NSMutableArray)supportedLanguages;
- (NSMutableArray)validVersions;
- (NSString)baseURL;
- (NSString)localizationURL;
- (NSString)multiTileURL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)checksumTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countryRegionAllowlistAtIndex:(unint64_t)a3;
- (id)description;
- (id)deviceSKUAllowlistAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)requestStyleAsString:(int)a3;
- (id)scaleAsString:(int)a3;
- (id)sizeAsString:(int)a3;
- (id)styleAsString:(int)a3;
- (id)supportedLanguageAtIndex:(unint64_t)a3;
- (id)updateBehaviorAsString:(int)a3;
- (id)validVersionAtIndex:(unint64_t)a3;
- (int)StringAsChecksumType:(id)a3;
- (int)StringAsRequestStyle:(id)a3;
- (int)StringAsScale:(id)a3;
- (int)StringAsSize:(id)a3;
- (int)StringAsStyle:(id)a3;
- (int)StringAsUpdateBehavior:(id)a3;
- (int)checksumType;
- (int)requestStyle;
- (int)scale;
- (int)size;
- (int)style;
- (int)updateBehavior;
- (unint64_t)countryRegionAllowlistsCount;
- (unint64_t)deviceSKUAllowlistsCount;
- (unint64_t)hash;
- (unint64_t)supportedLanguagesCount;
- (unint64_t)validVersionsCount;
- (unsigned)alternativeMultipathTCPPort;
- (unsigned)dataSet;
- (void)_addNoFlagsCountryRegionAllowlist:(uint64_t)a1;
- (void)_addNoFlagsDeviceSKUAllowlist:(uint64_t)a1;
- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1;
- (void)_addNoFlagsValidVersion:(uint64_t)a1;
- (void)_readBaseURL;
- (void)_readCountryRegionAllowlists;
- (void)_readDeviceSKUAllowlists;
- (void)_readLocalizationURL;
- (void)_readMultiTileURL;
- (void)_readSupportedLanguages;
- (void)_readValidVersions;
- (void)addCountryRegionAllowlist:(id)a3;
- (void)addDeviceSKUAllowlist:(id)a3;
- (void)addSupportedLanguage:(id)a3;
- (void)addValidVersion:(id)a3;
- (void)clearCountryRegionAllowlists;
- (void)clearDeviceSKUAllowlists;
- (void)clearSupportedLanguages;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearValidVersions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlternativeMultipathTCPPort:(unsigned int)a3;
- (void)setBaseURL:(id)a3;
- (void)setChecksumType:(int)a3;
- (void)setCountryRegionAllowlists:(id)a3;
- (void)setDataSet:(unsigned int)a3;
- (void)setDeviceSKUAllowlists:(id)a3;
- (void)setHasAlternativeMultipathTCPPort:(BOOL)a3;
- (void)setHasChecksumType:(BOOL)a3;
- (void)setHasDataSet:(BOOL)a3;
- (void)setHasMultiTileURLUsesStatusCodes:(BOOL)a3;
- (void)setHasRequestStyle:(BOOL)a3;
- (void)setHasSupportsMultipathTCP:(BOOL)a3;
- (void)setHasUpdateBehavior:(BOOL)a3;
- (void)setHasUseAuthProxy:(BOOL)a3;
- (void)setLocalizationURL:(id)a3;
- (void)setMultiTileURL:(id)a3;
- (void)setMultiTileURLUsesStatusCodes:(BOOL)a3;
- (void)setRequestStyle:(int)a3;
- (void)setScale:(int)a3;
- (void)setSize:(int)a3;
- (void)setStyle:(int)a3;
- (void)setSupportedLanguages:(id)a3;
- (void)setSupportsMultipathTCP:(BOOL)a3;
- (void)setUpdateBehavior:(int)a3;
- (void)setUseAuthProxy:(BOOL)a3;
- (void)setValidVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTileSet

- (GEOTileSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTileSet;
  v2 = [(GEOTileSet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTileSet;
  v3 = [(GEOTileSet *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBaseURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaseURL_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasBaseURL
{
  return self->_baseURL != 0;
}

- (NSString)baseURL
{
  -[GEOTileSet _readBaseURL]((uint64_t)self);
  baseURL = self->_baseURL;

  return baseURL;
}

- (void)setBaseURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void)_readMultiTileURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMultiTileURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMultiTileURL
{
  return self->_multiTileURL != 0;
}

- (NSString)multiTileURL
{
  -[GEOTileSet _readMultiTileURL]((uint64_t)self);
  multiTileURL = self->_multiTileURL;

  return multiTileURL;
}

- (void)setMultiTileURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_multiTileURL, a3);
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_style = a3;
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

- (void)_readValidVersions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValidVersions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)validVersions
{
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  validVersions = self->_validVersions;

  return validVersions;
}

- (void)setValidVersions:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  validVersions = self->_validVersions;
  self->_validVersions = v4;
}

- (void)clearValidVersions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  validVersions = self->_validVersions;

  [(NSMutableArray *)validVersions removeAllObjects];
}

- (void)addValidVersion:(id)a3
{
  id v4 = a3;
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  -[GEOTileSet _addNoFlagsValidVersion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsValidVersion:(uint64_t)a1
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

- (unint64_t)validVersionsCount
{
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  validVersions = self->_validVersions;

  return [(NSMutableArray *)validVersions count];
}

- (id)validVersionAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readValidVersions]((uint64_t)self);
  validVersions = self->_validVersions;

  return (id)[(NSMutableArray *)validVersions objectAtIndex:a3];
}

+ (Class)validVersionType
{
  return (Class)objc_opt_class();
}

- (int)scale
{
  return self->_scale;
}

- (void)setScale:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_scale = a3;
}

- (id)scaleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F6298[a3];
  }

  return v3;
}

- (int)StringAsScale:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NODPI"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LODPI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HIDPI"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)size
{
  return self->_size;
}

- (void)setSize:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_size = a3;
}

- (id)sizeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F62B0[a3];
  }

  return v3;
}

- (int)StringAsSize:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PX128"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PX256"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PX512"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLocalizationURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizationURL_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLocalizationURL
{
  return self->_localizationURL != 0;
}

- (NSString)localizationURL
{
  -[GEOTileSet _readLocalizationURL]((uint64_t)self);
  localizationURL = self->_localizationURL;

  return localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_localizationURL, a3);
}

- (void)_readSupportedLanguages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSupportedLanguages_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)supportedLanguages
{
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return supportedLanguages;
}

- (void)setSupportedLanguages:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  supportedLanguages = self->_supportedLanguages;
  self->_supportedLanguages = v4;
}

- (void)clearSupportedLanguages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  supportedLanguages = self->_supportedLanguages;

  [(NSMutableArray *)supportedLanguages removeAllObjects];
}

- (void)addSupportedLanguage:(id)a3
{
  id v4 = a3;
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  -[GEOTileSet _addNoFlagsSupportedLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsSupportedLanguage:(uint64_t)a1
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

- (unint64_t)supportedLanguagesCount
{
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return [(NSMutableArray *)supportedLanguages count];
}

- (id)supportedLanguageAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readSupportedLanguages]((uint64_t)self);
  supportedLanguages = self->_supportedLanguages;

  return (id)[(NSMutableArray *)supportedLanguages objectAtIndex:a3];
}

+ (Class)supportedLanguageType
{
  return (Class)objc_opt_class();
}

- (BOOL)multiTileURLUsesStatusCodes
{
  return self->_multiTileURLUsesStatusCodes;
}

- (void)setMultiTileURLUsesStatusCodes:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_multiTileURLUsesStatusCodes = a3;
}

- (void)setHasMultiTileURLUsesStatusCodes:(BOOL)a3
{
  if (a3) {
    int v3 = 65568;
  }
  else {
    int v3 = 0x10000;
  }
  self->_flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasMultiTileURLUsesStatusCodes
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (int)updateBehavior
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 0x10) != 0) {
    return self->_updateBehavior;
  }
  else {
    return 1;
  }
}

- (void)setUpdateBehavior:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_updateBehavior = a3;
}

- (void)setHasUpdateBehavior:(BOOL)a3
{
  if (a3) {
    int v3 = 65552;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasUpdateBehavior
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)updateBehaviorAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"TILE_UPDATE_BEHAVIOR_ETAG";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"TILE_UPDATE_BEHAVIOR_FLUSH";
  }
  return v4;
}

- (int)StringAsUpdateBehavior:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TILE_UPDATE_BEHAVIOR_FLUSH"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"TILE_UPDATE_BEHAVIOR_ETAG"];
  }

  return v4;
}

- (void)_readCountryRegionAllowlists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryRegionAllowlists_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)countryRegionAllowlists
{
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  countryRegionAllowlists = self->_countryRegionAllowlists;

  return countryRegionAllowlists;
}

- (void)setCountryRegionAllowlists:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  countryRegionAllowlists = self->_countryRegionAllowlists;
  self->_countryRegionAllowlists = v4;
}

- (void)clearCountryRegionAllowlists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  countryRegionAllowlists = self->_countryRegionAllowlists;

  [(NSMutableArray *)countryRegionAllowlists removeAllObjects];
}

- (void)addCountryRegionAllowlist:(id)a3
{
  id v4 = a3;
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  -[GEOTileSet _addNoFlagsCountryRegionAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsCountryRegionAllowlist:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)countryRegionAllowlistsCount
{
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  countryRegionAllowlists = self->_countryRegionAllowlists;

  return [(NSMutableArray *)countryRegionAllowlists count];
}

- (id)countryRegionAllowlistAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readCountryRegionAllowlists]((uint64_t)self);
  countryRegionAllowlists = self->_countryRegionAllowlists;

  return (id)[(NSMutableArray *)countryRegionAllowlists objectAtIndex:a3];
}

+ (Class)countryRegionAllowlistType
{
  return (Class)objc_opt_class();
}

- (int)checksumType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_checksumType;
  }
  else {
    return 0;
  }
}

- (void)setChecksumType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_checksumType = a3;
}

- (void)setHasChecksumType:(BOOL)a3
{
  if (a3) {
    int v3 = 65538;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasChecksumType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)checksumTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"CHECKSUM_TYPE_APPENDED_MD5";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"CHECKSUM_TYPE_NONE";
  }
  return v4;
}

- (int)StringAsChecksumType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CHECKSUM_TYPE_NONE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CHECKSUM_TYPE_APPENDED_MD5"];
  }

  return v4;
}

- (unsigned)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_dataSet = a3;
}

- (void)setHasDataSet:(BOOL)a3
{
  if (a3) {
    int v3 = 65540;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDataSet
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)requestStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 8) != 0) {
    return self->_requestStyle;
  }
  else {
    return 0;
  }
}

- (void)setRequestStyle:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_requestStyle = a3;
}

- (void)setHasRequestStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 65544;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasRequestStyle
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)requestStyleAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"REQUEST_STYLE_LEGACY";
  }
  return v4;
}

- (int)StringAsRequestStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REQUEST_STYLE_LEGACY"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"];
  }

  return v4;
}

- (BOOL)useAuthProxy
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x80) != 0 && self->_useAuthProxy;
}

- (void)setUseAuthProxy:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_useAuthProxy = a3;
}

- (void)setHasUseAuthProxy:(BOOL)a3
{
  if (a3) {
    int v3 = 65664;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasUseAuthProxy
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (BOOL)supportsMultipathTCP
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(unsigned char *)&flags & 0x40) != 0 && self->_supportsMultipathTCP;
}

- (void)setSupportsMultipathTCP:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_supportsMultipathTCP = a3;
}

- (void)setHasSupportsMultipathTCP:(BOOL)a3
{
  if (a3) {
    int v3 = 65600;
  }
  else {
    int v3 = 0x10000;
  }
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasSupportsMultipathTCP
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unsigned)alternativeMultipathTCPPort
{
  return self->_alternativeMultipathTCPPort;
}

- (void)setAlternativeMultipathTCPPort:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_alternativeMultipathTCPPort = a3;
}

- (void)setHasAlternativeMultipathTCPPort:(BOOL)a3
{
  self->_$C3508E6C0C635A9429EF77D2804AA6E5 flags = ($C3508E6C0C635A9429EF77D2804AA6E5)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasAlternativeMultipathTCPPort
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readDeviceSKUAllowlists
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 129) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceSKUAllowlists_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)deviceSKUAllowlists
{
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  return deviceSKUAllowlists;
}

- (void)setDeviceSKUAllowlists:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  self->_deviceSKUAllowlists = v4;
}

- (void)clearDeviceSKUAllowlists
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  [(NSMutableArray *)deviceSKUAllowlists removeAllObjects];
}

- (void)addDeviceSKUAllowlist:(id)a3
{
  id v4 = a3;
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  -[GEOTileSet _addNoFlagsDeviceSKUAllowlist:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsDeviceSKUAllowlist:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)deviceSKUAllowlistsCount
{
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  return [(NSMutableArray *)deviceSKUAllowlists count];
}

- (id)deviceSKUAllowlistAtIndex:(unint64_t)a3
{
  -[GEOTileSet _readDeviceSKUAllowlists]((uint64_t)self);
  deviceSKUAllowlists = self->_deviceSKUAllowlists;

  return (id)[(NSMutableArray *)deviceSKUAllowlists objectAtIndex:a3];
}

+ (Class)deviceSKUAllowlistType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTileSet;
  id v4 = [(GEOTileSet *)&v8 description];
  id v5 = [(GEOTileSet *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTileSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v51 = 0;
    goto LABEL_192;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(id)a1 baseURL];
  if (v5) {
    [v4 setObject:v5 forKey:@"baseURL"];
  }

  objc_super v6 = [(id)a1 multiTileURL];
  if (v6) {
    [v4 setObject:v6 forKey:@"multiTileURL"];
  }

  id v7 = @"RASTER_STANDARD";
  switch(*(_DWORD *)(a1 + 116))
  {
    case 0:
      break;
    case 1:
      id v7 = @"VECTOR_STANDARD";
      break;
    case 2:
      id v7 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
      break;
    case 3:
      id v7 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
      break;
    case 4:
      id v7 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
      break;
    case 5:
      id v7 = @"RASTER_STANDARD_BACKGROUND";
      break;
    case 6:
      id v7 = @"RASTER_HYBRID";
      break;
    case 7:
      id v7 = @"RASTER_SATELLITE";
      break;
    case 8:
      id v7 = @"RASTER_TERRAIN";
      break;
    case 0xB:
      id v7 = @"VECTOR_BUILDINGS";
      break;
    case 0xC:
      id v7 = @"VECTOR_TRAFFIC";
      break;
    case 0xD:
      id v7 = @"VECTOR_POI";
      break;
    case 0xE:
      id v7 = @"SPUTNIK_METADATA";
      break;
    case 0xF:
      id v7 = @"SPUTNIK_C3M";
      break;
    case 0x10:
      id v7 = @"SPUTNIK_DSM";
      break;
    case 0x11:
      id v7 = @"SPUTNIK_DSM_GLOBAL";
      break;
    case 0x12:
      id v7 = @"VECTOR_REALISTIC";
      break;
    case 0x13:
      id v7 = @"VECTOR_LEGACY_REALISTIC";
      break;
    case 0x14:
      id v7 = @"VECTOR_ROADS";
      break;
    case 0x15:
      id v7 = @"RASTER_VEGETATION";
      break;
    case 0x16:
      id v7 = @"VECTOR_TRAFFIC_SKELETON";
      break;
    case 0x17:
      id v7 = @"RASTER_COASTLINE_MASK";
      break;
    case 0x18:
      id v7 = @"RASTER_HILLSHADE";
      break;
    case 0x19:
      id v7 = @"VECTOR_TRAFFIC_WITH_GREEN";
      break;
    case 0x1A:
      id v7 = @"VECTOR_TRAFFIC_STATIC";
      break;
    case 0x1B:
      id v7 = @"RASTER_COASTLINE_DROP_MASK";
      break;
    case 0x1C:
      id v7 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
      break;
    case 0x1D:
      id v7 = @"VECTOR_SPEED_PROFILES";
      break;
    case 0x1E:
      id v7 = @"VECTOR_VENUES";
      break;
    case 0x1F:
      id v7 = @"RASTER_DOWN_SAMPLED";
      break;
    case 0x20:
      id v7 = @"RASTER_COLOR_BALANCED";
      break;
    case 0x21:
      id v7 = @"RASTER_SATELLITE_NIGHT";
      break;
    case 0x22:
      id v7 = @"SPUTNIK_VECTOR_BORDER";
      break;
    case 0x23:
      id v7 = @"RASTER_SATELLITE_DIGITIZE";
      break;
    case 0x24:
      id v7 = @"RASTER_HILLSHADE_PARKS";
      break;
    case 0x25:
      id v7 = @"VECTOR_TRANSIT";
      break;
    case 0x26:
      id v7 = @"RASTER_STANDARD_BASE";
      break;
    case 0x27:
      id v7 = @"RASTER_STANDARD_LABELS";
      break;
    case 0x28:
      id v7 = @"RASTER_HYBRID_ROADS";
      break;
    case 0x29:
      id v7 = @"RASTER_HYBRID_LABELS";
      break;
    case 0x2A:
      id v7 = @"FLYOVER_C3M_MESH";
      break;
    case 0x2B:
      id v7 = @"FLYOVER_C3M_JPEG_TEXTURE";
      break;
    case 0x2C:
      id v7 = @"FLYOVER_C3M_ASTC_TEXTURE";
      break;
    case 0x2D:
      id v7 = @"RASTER_SATELLITE_ASTC";
      break;
    case 0x2E:
      id v7 = @"RASTER_HYBRID_ROADS_AND_LABELS";
      break;
    case 0x2F:
      id v7 = @"VECTOR_TRANSIT_SELECTION";
      break;
    case 0x30:
      id v7 = @"VECTOR_COVERAGE";
      break;
    case 0x34:
      id v7 = @"FLYOVER_METADATA";
      break;
    case 0x35:
      id v7 = @"VECTOR_ROAD_NETWORK";
      break;
    case 0x36:
      id v7 = @"VECTOR_LAND_COVER";
      break;
    case 0x37:
      id v7 = @"VECTOR_DEBUG";
      break;
    case 0x38:
      id v7 = @"VECTOR_STREET_POI";
      break;
    case 0x39:
      id v7 = @"MUNIN_METADATA";
      break;
    case 0x3A:
      id v7 = @"VECTOR_SPR_MERCATOR";
      break;
    case 0x3B:
      id v7 = @"VECTOR_SPR_MODELS";
      break;
    case 0x3C:
      id v7 = @"VECTOR_SPR_MATERIALS";
      break;
    case 0x3D:
      id v7 = @"VECTOR_SPR_METADATA";
      break;
    case 0x3E:
      id v7 = @"VECTOR_TRACKS";
      break;
    case 0x3F:
      id v7 = @"VECTOR_RESERVED_2";
      break;
    case 0x40:
      id v7 = @"VECTOR_STREET_LANDMARKS";
      break;
    case 0x41:
      id v7 = @"COARSE_LOCATION_POLYGONS";
      break;
    case 0x42:
      id v7 = @"VECTOR_SPR_ROADS";
      break;
    case 0x43:
      id v7 = @"VECTOR_SPR_STANDARD";
      break;
    case 0x44:
      id v7 = @"VECTOR_POI_V2";
      break;
    case 0x45:
      id v7 = @"VECTOR_POLYGON_SELECTION";
      break;
    case 0x46:
      id v7 = @"VL_METADATA";
      break;
    case 0x47:
      id v7 = @"VL_DATA";
      break;
    case 0x48:
      id v7 = @"PROACTIVE_APP_CLIP";
      break;
    case 0x49:
      id v7 = @"VECTOR_BUILDINGS_V2";
      break;
    case 0x4A:
      id v7 = @"POI_BUSYNESS";
      break;
    case 0x4B:
      id v7 = @"POI_DP_BUSYNESS";
      break;
    case 0x4C:
      id v7 = @"SMART_INTERFACE_SELECTION";
      break;
    case 0x4D:
      id v7 = @"VECTOR_ASSETS";
      break;
    case 0x4E:
      id v7 = @"SPR_ASSET_METADATA";
      break;
    case 0x4F:
      id v7 = @"VECTOR_SPR_POLAR";
      break;
    case 0x50:
      id v7 = @"SMART_DATA_MODE";
      break;
    case 0x51:
      id v7 = @"CELLULAR_PERFORMANCE_SCORE";
      break;
    case 0x52:
      id v7 = @"VECTOR_SPR_MODELS_OCCLUSION";
      break;
    case 0x53:
      id v7 = @"VECTOR_TOPOGRAPHIC";
      break;
    case 0x54:
      id v7 = @"VECTOR_POI_V2_UPDATE";
      break;
    case 0x55:
      id v7 = @"VECTOR_LIVE_DATA_UPDATES";
      break;
    case 0x56:
      id v7 = @"VECTOR_TRAFFIC_V2";
      break;
    case 0x57:
      id v7 = @"VECTOR_ROAD_SELECTION";
      break;
    case 0x58:
      id v7 = @"VECTOR_REGION_METADATA";
      break;
    case 0x59:
      id v7 = @"RAY_TRACING";
      break;
    case 0x5A:
      id v7 = @"VECTOR_CONTOURS";
      break;
    case 0x5B:
      id v7 = @"RASTER_SATELLITE_POLAR";
      break;
    case 0x5C:
      id v7 = @"VMAP4_ELEVATION";
      break;
    case 0x5D:
      id v7 = @"VMAP4_ELEVATION_POLAR";
      break;
    case 0x5E:
      id v7 = @"CELLULAR_COVERAGE_PLMN";
      break;
    case 0x5F:
      id v7 = @"RASTER_SATELLITE_POLAR_NIGHT";
      break;
    case 0x60:
      id v7 = @"UNUSED_96";
      break;
    case 0x61:
      id v7 = @"UNUSED_97";
      break;
    case 0x62:
      id v7 = @"UNUSED_98";
      break;
    case 0x63:
      id v7 = @"UNUSED_99";
      break;
    case 0x64:
      id v7 = @"UNUSED_100";
      break;
    case 0x65:
      id v7 = @"UNUSED_101";
      break;
    case 0x66:
      id v7 = @"UNUSED_102";
      break;
    case 0x67:
      id v7 = @"UNUSED_103";
      break;
    case 0x68:
      id v7 = @"UNUSED_104";
      break;
    case 0x69:
      id v7 = @"UNUSED_105";
      break;
    case 0x6A:
      id v7 = @"UNUSED_106";
      break;
    case 0x6B:
      id v7 = @"UNUSED_107";
      break;
    case 0x6C:
      id v7 = @"UNUSED_108";
      break;
    case 0x6D:
      id v7 = @"UNUSED_109";
      break;
    case 0x6E:
      id v7 = @"UNUSED_110";
      break;
    case 0x6F:
      id v7 = @"UNUSED_111";
      break;
    case 0x70:
      id v7 = @"UNUSED_112";
      break;
    case 0x71:
      id v7 = @"UNUSED_113";
      break;
    case 0x72:
      id v7 = @"UNUSED_114";
      break;
    case 0x73:
      id v7 = @"UNUSED_115";
      break;
    case 0x74:
      id v7 = @"UNUSED_116";
      break;
    case 0x75:
      id v7 = @"UNUSED_117";
      break;
    case 0x76:
      id v7 = @"UNUSED_118";
      break;
    case 0x77:
      id v7 = @"UNUSED_119";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 116));
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  [v4 setObject:v7 forKey:@"style"];

  if ([*(id *)(a1 + 72) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v9 = *(id *)(a1 + 72);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v71 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          id v15 = [v14 dictionaryRepresentation];
          }

          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"validVersion"];
  }
  uint64_t v16 = *(int *)(a1 + 108);
  if (v16 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 108));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E53F6298[v16];
  }
  [v4 setObject:v17 forKey:@"scale"];

  uint64_t v18 = *(int *)(a1 + 112);
  if (v18 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 112));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E53F62B0[v18];
  }
  [v4 setObject:v19 forKey:@"size"];

  v20 = [(id)a1 localizationURL];
  if (v20) {
    [v4 setObject:v20 forKey:@"localizationURL"];
  }

  if ([*(id *)(a1 + 64) count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v22 = *(id *)(a1 + 64);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v67 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          if (a2) {
            [v27 jsonRepresentation];
          }
          else {
          id v28 = [v27 dictionaryRepresentation];
          }

          [v21 addObject:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"supportedLanguage"];
  }
  int v29 = *(_DWORD *)(a1 + 128);
  if ((v29 & 0x20) != 0)
  {
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 124)];
    [v4 setObject:v30 forKey:@"multiTileURLUsesStatusCodes"];

    int v29 = *(_DWORD *)(a1 + 128);
  }
  if ((v29 & 0x10) != 0)
  {
    int v31 = *(_DWORD *)(a1 + 120);
    if (v31)
    {
      if (v31 == 1)
      {
        v32 = @"TILE_UPDATE_BEHAVIOR_ETAG";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 120));
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v32 = @"TILE_UPDATE_BEHAVIOR_FLUSH";
    }
    if (a2) {
      v33 = @"updateBehavior";
    }
    else {
      v33 = @"update_behavior";
    }
    [v4 setObject:v32 forKey:v33];
  }
  if ([*(id *)(a1 + 32) count])
  {
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v35 = *(id *)(a1 + 32);
    uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v74 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v63;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v63 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v62 + 1) + 8 * k);
          if (a2) {
            [v40 jsonRepresentation];
          }
          else {
          id v41 = [v40 dictionaryRepresentation];
          }

          [v34 addObject:v41];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v74 count:16];
      }
      while (v37);
    }

    [v4 setObject:v34 forKey:@"countryRegionWhitelist"];
  }
  int v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 2) != 0)
  {
    int v53 = *(_DWORD *)(a1 + 96);
    if (v53)
    {
      if (v53 == 1)
      {
        v54 = @"CHECKSUM_TYPE_APPENDED_MD5";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 96));
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v54 = @"CHECKSUM_TYPE_NONE";
    }
    [v4 setObject:v54 forKey:@"checksumType"];

    int v42 = *(_DWORD *)(a1 + 128);
    if ((v42 & 4) == 0)
    {
LABEL_180:
      if ((v42 & 8) == 0) {
        goto LABEL_181;
      }
      goto LABEL_202;
    }
  }
  else if ((v42 & 4) == 0)
  {
    goto LABEL_180;
  }
  v55 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 100)];
  [v4 setObject:v55 forKey:@"dataSet"];

  int v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 8) == 0)
  {
LABEL_181:
    if ((v42 & 0x80) == 0) {
      goto LABEL_182;
    }
    goto LABEL_208;
  }
LABEL_202:
  int v56 = *(_DWORD *)(a1 + 104);
  if (v56)
  {
    if (v56 == 1)
    {
      v57 = @"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 104));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v57 = @"REQUEST_STYLE_LEGACY";
  }
  [v4 setObject:v57 forKey:@"requestStyle"];

  int v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 0x80) == 0)
  {
LABEL_182:
    if ((v42 & 0x40) == 0) {
      goto LABEL_183;
    }
LABEL_209:
    v59 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 125)];
    [v4 setObject:v59 forKey:@"supportsMultipathTCP"];

    if ((*(_DWORD *)(a1 + 128) & 1) == 0) {
      goto LABEL_185;
    }
    goto LABEL_184;
  }
LABEL_208:
  v58 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 126)];
  [v4 setObject:v58 forKey:@"useAuthProxy"];

  int v42 = *(_DWORD *)(a1 + 128);
  if ((v42 & 0x40) != 0) {
    goto LABEL_209;
  }
LABEL_183:
  if (v42)
  {
LABEL_184:
    v43 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v43 forKey:@"alternativeMultipathTCPPort"];
  }
LABEL_185:
  if (*(void *)(a1 + 40))
  {
    v44 = [(id)a1 deviceSKUAllowlists];
    [v4 setObject:v44 forKey:@"deviceSKUWhitelist"];
  }
  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    v46 = [v45 dictionaryRepresentation];
    v47 = v46;
    if (a2)
    {
      v48 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __40__GEOTileSet__dictionaryRepresentation___block_invoke;
      v60[3] = &unk_1E53D8860;
      id v49 = v48;
      id v61 = v49;
      [v47 enumerateKeysAndObjectsUsingBlock:v60];
      id v50 = v49;

      v47 = v50;
    }
    [v4 setObject:v47 forKey:@"Unknown Fields"];
  }
  id v51 = v4;

LABEL_192:

  return v51;
}

- (id)jsonRepresentation
{
  return -[GEOTileSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOTileSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTileSet)initWithDictionary:(id)a3
{
  return (GEOTileSet *)-[GEOTileSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v113 = a2;
  if (!a1) {
    goto LABEL_413;
  }
  id v5 = (id)[a1 init];

  if (!v5)
  {
    a1 = 0;
    goto LABEL_413;
  }
  objc_super v6 = [v113 objectForKeyedSubscript:@"baseURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[v6 copy];
    [v5 setBaseURL:v7];
  }
  objc_super v8 = [v113 objectForKeyedSubscript:@"multiTileURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (void *)[v8 copy];
    [v5 setMultiTileURL:v9];
  }
  id v10 = [v113 objectForKeyedSubscript:@"style"];
  objc_opt_class();
  v120 = v5;
  int v119 = a3;
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"RASTER_STANDARD"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"VECTOR_STANDARD"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
    {
      uint64_t v12 = 4;
    }
    else if ([v11 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
    {
      uint64_t v12 = 5;
    }
    else if ([v11 isEqualToString:@"RASTER_HYBRID"])
    {
      uint64_t v12 = 6;
    }
    else if ([v11 isEqualToString:@"RASTER_SATELLITE"])
    {
      uint64_t v12 = 7;
    }
    else if ([v11 isEqualToString:@"RASTER_TERRAIN"])
    {
      uint64_t v12 = 8;
    }
    else if ([v11 isEqualToString:@"VECTOR_BUILDINGS"])
    {
      uint64_t v12 = 11;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC"])
    {
      uint64_t v12 = 12;
    }
    else if ([v11 isEqualToString:@"VECTOR_POI"])
    {
      uint64_t v12 = 13;
    }
    else if ([v11 isEqualToString:@"SPUTNIK_METADATA"])
    {
      uint64_t v12 = 14;
    }
    else if ([v11 isEqualToString:@"SPUTNIK_C3M"])
    {
      uint64_t v12 = 15;
    }
    else if ([v11 isEqualToString:@"SPUTNIK_DSM"])
    {
      uint64_t v12 = 16;
    }
    else if ([v11 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
    {
      uint64_t v12 = 17;
    }
    else if ([v11 isEqualToString:@"VECTOR_REALISTIC"])
    {
      uint64_t v12 = 18;
    }
    else if ([v11 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
    {
      uint64_t v12 = 19;
    }
    else if ([v11 isEqualToString:@"VECTOR_ROADS"])
    {
      uint64_t v12 = 20;
    }
    else if ([v11 isEqualToString:@"RASTER_VEGETATION"])
    {
      uint64_t v12 = 21;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
    {
      uint64_t v12 = 22;
    }
    else if ([v11 isEqualToString:@"RASTER_COASTLINE_MASK"])
    {
      uint64_t v12 = 23;
    }
    else if ([v11 isEqualToString:@"RASTER_HILLSHADE"])
    {
      uint64_t v12 = 24;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
    {
      uint64_t v12 = 25;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
    {
      uint64_t v12 = 26;
    }
    else if ([v11 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
    {
      uint64_t v12 = 27;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
    {
      uint64_t v12 = 28;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPEED_PROFILES"])
    {
      uint64_t v12 = 29;
    }
    else if ([v11 isEqualToString:@"VECTOR_VENUES"])
    {
      uint64_t v12 = 30;
    }
    else if ([v11 isEqualToString:@"RASTER_DOWN_SAMPLED"])
    {
      uint64_t v12 = 31;
    }
    else if ([v11 isEqualToString:@"RASTER_COLOR_BALANCED"])
    {
      uint64_t v12 = 32;
    }
    else if ([v11 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
    {
      uint64_t v12 = 33;
    }
    else if ([v11 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
    {
      uint64_t v12 = 34;
    }
    else if ([v11 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
    {
      uint64_t v12 = 35;
    }
    else if ([v11 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
    {
      uint64_t v12 = 36;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRANSIT"])
    {
      uint64_t v12 = 37;
    }
    else if ([v11 isEqualToString:@"RASTER_STANDARD_BASE"])
    {
      uint64_t v12 = 38;
    }
    else if ([v11 isEqualToString:@"RASTER_STANDARD_LABELS"])
    {
      uint64_t v12 = 39;
    }
    else if ([v11 isEqualToString:@"RASTER_HYBRID_ROADS"])
    {
      uint64_t v12 = 40;
    }
    else if ([v11 isEqualToString:@"RASTER_HYBRID_LABELS"])
    {
      uint64_t v12 = 41;
    }
    else if ([v11 isEqualToString:@"FLYOVER_C3M_MESH"])
    {
      uint64_t v12 = 42;
    }
    else if ([v11 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
    {
      uint64_t v12 = 43;
    }
    else if ([v11 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
    {
      uint64_t v12 = 44;
    }
    else if ([v11 isEqualToString:@"RASTER_SATELLITE_ASTC"])
    {
      uint64_t v12 = 45;
    }
    else if ([v11 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
    {
      uint64_t v12 = 46;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
    {
      uint64_t v12 = 47;
    }
    else if ([v11 isEqualToString:@"VECTOR_COVERAGE"])
    {
      uint64_t v12 = 48;
    }
    else if ([v11 isEqualToString:@"FLYOVER_METADATA"])
    {
      uint64_t v12 = 52;
    }
    else if ([v11 isEqualToString:@"VECTOR_ROAD_NETWORK"])
    {
      uint64_t v12 = 53;
    }
    else if ([v11 isEqualToString:@"VECTOR_LAND_COVER"])
    {
      uint64_t v12 = 54;
    }
    else if ([v11 isEqualToString:@"VECTOR_DEBUG"])
    {
      uint64_t v12 = 55;
    }
    else if ([v11 isEqualToString:@"VECTOR_STREET_POI"])
    {
      uint64_t v12 = 56;
    }
    else if ([v11 isEqualToString:@"MUNIN_METADATA"])
    {
      uint64_t v12 = 57;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_MERCATOR"])
    {
      uint64_t v12 = 58;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_MODELS"])
    {
      uint64_t v12 = 59;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_MATERIALS"])
    {
      uint64_t v12 = 60;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_METADATA"])
    {
      uint64_t v12 = 61;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRACKS"])
    {
      uint64_t v12 = 62;
    }
    else if ([v11 isEqualToString:@"VECTOR_RESERVED_2"])
    {
      uint64_t v12 = 63;
    }
    else if ([v11 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
    {
      uint64_t v12 = 64;
    }
    else if ([v11 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
    {
      uint64_t v12 = 65;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_ROADS"])
    {
      uint64_t v12 = 66;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_STANDARD"])
    {
      uint64_t v12 = 67;
    }
    else if ([v11 isEqualToString:@"VECTOR_POI_V2"])
    {
      uint64_t v12 = 68;
    }
    else if ([v11 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
    {
      uint64_t v12 = 69;
    }
    else if ([v11 isEqualToString:@"VL_METADATA"])
    {
      uint64_t v12 = 70;
    }
    else if ([v11 isEqualToString:@"VL_DATA"])
    {
      uint64_t v12 = 71;
    }
    else if ([v11 isEqualToString:@"PROACTIVE_APP_CLIP"])
    {
      uint64_t v12 = 72;
    }
    else if ([v11 isEqualToString:@"VECTOR_BUILDINGS_V2"])
    {
      uint64_t v12 = 73;
    }
    else if ([v11 isEqualToString:@"POI_BUSYNESS"])
    {
      uint64_t v12 = 74;
    }
    else if ([v11 isEqualToString:@"POI_DP_BUSYNESS"])
    {
      uint64_t v12 = 75;
    }
    else if ([v11 isEqualToString:@"SMART_INTERFACE_SELECTION"])
    {
      uint64_t v12 = 76;
    }
    else if ([v11 isEqualToString:@"VECTOR_ASSETS"])
    {
      uint64_t v12 = 77;
    }
    else if ([v11 isEqualToString:@"SPR_ASSET_METADATA"])
    {
      uint64_t v12 = 78;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_POLAR"])
    {
      uint64_t v12 = 79;
    }
    else if ([v11 isEqualToString:@"SMART_DATA_MODE"])
    {
      uint64_t v12 = 80;
    }
    else if ([v11 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
    {
      uint64_t v12 = 81;
    }
    else if ([v11 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
    {
      uint64_t v12 = 82;
    }
    else if ([v11 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
    {
      uint64_t v12 = 83;
    }
    else if ([v11 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
    {
      uint64_t v12 = 84;
    }
    else if ([v11 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
    {
      uint64_t v12 = 85;
    }
    else if ([v11 isEqualToString:@"VECTOR_TRAFFIC_V2"])
    {
      uint64_t v12 = 86;
    }
    else if ([v11 isEqualToString:@"VECTOR_ROAD_SELECTION"])
    {
      uint64_t v12 = 87;
    }
    else if ([v11 isEqualToString:@"VECTOR_REGION_METADATA"])
    {
      uint64_t v12 = 88;
    }
    else if ([v11 isEqualToString:@"RAY_TRACING"])
    {
      uint64_t v12 = 89;
    }
    else if ([v11 isEqualToString:@"VECTOR_CONTOURS"])
    {
      uint64_t v12 = 90;
    }
    else if ([v11 isEqualToString:@"RASTER_SATELLITE_POLAR"])
    {
      uint64_t v12 = 91;
    }
    else if ([v11 isEqualToString:@"VMAP4_ELEVATION"])
    {
      uint64_t v12 = 92;
    }
    else if ([v11 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
    {
      uint64_t v12 = 93;
    }
    else if ([v11 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
    {
      uint64_t v12 = 94;
    }
    else if ([v11 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
    {
      uint64_t v12 = 95;
    }
    else if ([v11 isEqualToString:@"UNUSED_96"])
    {
      uint64_t v12 = 96;
    }
    else if ([v11 isEqualToString:@"UNUSED_97"])
    {
      uint64_t v12 = 97;
    }
    else if ([v11 isEqualToString:@"UNUSED_98"])
    {
      uint64_t v12 = 98;
    }
    else if ([v11 isEqualToString:@"UNUSED_99"])
    {
      uint64_t v12 = 99;
    }
    else if ([v11 isEqualToString:@"UNUSED_100"])
    {
      uint64_t v12 = 100;
    }
    else if ([v11 isEqualToString:@"UNUSED_101"])
    {
      uint64_t v12 = 101;
    }
    else if ([v11 isEqualToString:@"UNUSED_102"])
    {
      uint64_t v12 = 102;
    }
    else if ([v11 isEqualToString:@"UNUSED_103"])
    {
      uint64_t v12 = 103;
    }
    else if ([v11 isEqualToString:@"UNUSED_104"])
    {
      uint64_t v12 = 104;
    }
    else if ([v11 isEqualToString:@"UNUSED_105"])
    {
      uint64_t v12 = 105;
    }
    else if ([v11 isEqualToString:@"UNUSED_106"])
    {
      uint64_t v12 = 106;
    }
    else if ([v11 isEqualToString:@"UNUSED_107"])
    {
      uint64_t v12 = 107;
    }
    else if ([v11 isEqualToString:@"UNUSED_108"])
    {
      uint64_t v12 = 108;
    }
    else if ([v11 isEqualToString:@"UNUSED_109"])
    {
      uint64_t v12 = 109;
    }
    else if ([v11 isEqualToString:@"UNUSED_110"])
    {
      uint64_t v12 = 110;
    }
    else if ([v11 isEqualToString:@"UNUSED_111"])
    {
      uint64_t v12 = 111;
    }
    else if ([v11 isEqualToString:@"UNUSED_112"])
    {
      uint64_t v12 = 112;
    }
    else if ([v11 isEqualToString:@"UNUSED_113"])
    {
      uint64_t v12 = 113;
    }
    else if ([v11 isEqualToString:@"UNUSED_114"])
    {
      uint64_t v12 = 114;
    }
    else if ([v11 isEqualToString:@"UNUSED_115"])
    {
      uint64_t v12 = 115;
    }
    else if ([v11 isEqualToString:@"UNUSED_116"])
    {
      uint64_t v12 = 116;
    }
    else if ([v11 isEqualToString:@"UNUSED_117"])
    {
      uint64_t v12 = 117;
    }
    else if ([v11 isEqualToString:@"UNUSED_118"])
    {
      uint64_t v12 = 118;
    }
    else if ([v11 isEqualToString:@"UNUSED_119"])
    {
      uint64_t v12 = 119;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_244;
    }
    uint64_t v12 = [v10 intValue];
  }
  [v5 setStyle:v12];
LABEL_244:

  v13 = [v113 objectForKeyedSubscript:@"validVersion"];
  unint64_t v14 = 0x1E4F1C000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v112 = v13;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v134 objects:v149 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v135;
      uint64_t v116 = *(void *)v135;
      id v117 = v15;
      do
      {
        uint64_t v19 = 0;
        uint64_t v118 = v17;
        do
        {
          if (*(void *)v135 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v134 + 1) + 8 * v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [GEOTileSetVersion alloc];
            if (v21)
            {
              id v22 = v21;
              id v23 = v20;
              uint64_t v24 = [(GEOTileSetVersion *)v22 init];
              if (v24)
              {
                uint64_t v25 = [v23 objectForKeyedSubscript:@"identifier"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v26 = [v25 unsignedIntValue];
                  *(unsigned char *)(v24 + 96) |= 0x20u;
                  *(_DWORD *)(v24 + 84) = v26;
                }

                v27 = [v23 objectForKeyedSubscript:@"availableTiles"];
                objc_opt_class();
                id v121 = v23;
                if (objc_opt_isKindOfClass())
                {
                  unint64_t v28 = v14;
                  uint64_t v29 = v19;
                  long long v144 = 0u;
                  long long v145 = 0u;
                  long long v142 = 0u;
                  long long v143 = 0u;
                  id v30 = v27;
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v142 objects:v152 count:16];
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    uint64_t v33 = *(void *)v143;
                    do
                    {
                      for (uint64_t i = 0; i != v32; ++i)
                      {
                        if (*(void *)v143 != v33) {
                          objc_enumerationMutation(v30);
                        }
                        id v35 = *(void **)(*((void *)&v142 + 1) + 8 * i);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          long long v150 = 0uLL;
                          uint64_t v151 = 0;
                          _GEOTileSetRegionFromDictionaryRepresentation(v35, &v150);
                          -[GEOTileSetVersion _readAvailableTiles](v24);
                          if (-[GEOTileSetVersion _reserveAvailableTiles:](v24, 1uLL))
                          {
                            uint64_t v36 = *(void *)(v24 + 24) + 24 * *(void *)(v24 + 32);
                            *(_OWORD *)uint64_t v36 = v150;
                            *(void *)(v36 + 16) = v151;
                            ++*(void *)(v24 + 32);
                          }
                          os_unfair_lock_lock_with_options();
                          *(unsigned char *)(v24 + 96) |= 8u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v24 + 80));
                          *(unsigned char *)(v24 + 96) |= 0x20u;
                        }
                      }
                      uint64_t v32 = [v30 countByEnumeratingWithState:&v142 objects:v152 count:16];
                    }
                    while (v32);
                  }

                  uint64_t v18 = v116;
                  uint64_t v19 = v29;
                  unint64_t v14 = v28;
                  id v23 = v121;
                  id v15 = v117;
                  uint64_t v17 = v118;
                }

                uint64_t v37 = [v23 objectForKeyedSubscript:@"timeToLiveSeconds"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v38 = [v37 unsignedIntValue];
                  *(unsigned char *)(v24 + 96) |= 0x20u;
                  *(unsigned char *)(v24 + 96) |= 2u;
                  *(_DWORD *)(v24 + 92) = v38;
                }

                v39 = [v23 objectForKeyedSubscript:@"genericTile"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v114 = v39;
                  uint64_t v115 = v19;
                  long long v140 = 0u;
                  long long v141 = 0u;
                  long long v138 = 0u;
                  long long v139 = 0u;
                  id v40 = v39;
                  uint64_t v41 = [v40 countByEnumeratingWithState:&v138 objects:&v150 count:16];
                  if (!v41) {
                    goto LABEL_299;
                  }
                  uint64_t v42 = v41;
                  uint64_t v43 = *(void *)v139;
                  while (1)
                  {
                    for (uint64_t j = 0; j != v42; ++j)
                    {
                      if (*(void *)v139 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      v45 = *(void **)(*((void *)&v138 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v46 = v45;
                        v47 = [v46 objectForKeyedSubscript:@"tileType"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v48 = v47;
                          if ([v48 isEqualToString:@"WATER"])
                          {
                            unsigned int v49 = 1;
                          }
                          else if ([v48 isEqualToString:@"NO_TILE"])
                          {
                            unsigned int v49 = 2;
                          }
                          else
                          {
                            unsigned int v49 = 1;
                          }

                          uint64_t v50 = 0x400000000;
LABEL_286:
                          uint64_t v51 = v50 | v49;
                        }
                        else
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            unsigned int v49 = [v47 intValue];
                            uint64_t v50 = 0;
                            goto LABEL_286;
                          }
                          uint64_t v51 = 0;
                        }

                        v52 = [v46 objectForKeyedSubscript:@"textureIndex"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v51 |= 0x200000000uLL;
                          uint64_t v53 = [v52 unsignedIntValue];
                        }
                        else
                        {
                          uint64_t v53 = 0;
                        }

                        v54 = [v46 objectForKeyedSubscript:@"resourceIndex"];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v51 |= 0x100000000uLL;
                          unsigned int v55 = [v54 unsignedIntValue];
                        }
                        else
                        {
                          unsigned int v55 = 0;
                        }

                        -[GEOTileSetVersion _readGenericTiles](v24);
                        if (-[GEOTileSetVersion _reserveGenericTiles:](v24, 1uLL))
                        {
                          int v56 = (unint64_t *)(*(void *)(v24 + 48) + 16 * *(void *)(v24 + 56));
                          *int v56 = v55 | (unint64_t)(v53 << 32);
                          v56[1] = v51;
                          ++*(void *)(v24 + 56);
                        }
                        os_unfair_lock_lock_with_options();
                        *(unsigned char *)(v24 + 96) |= 0x10u;
                        os_unfair_lock_unlock((os_unfair_lock_t)(v24 + 80));
                        *(unsigned char *)(v24 + 96) |= 0x20u;
                        continue;
                      }
                    }
                    uint64_t v42 = [v40 countByEnumeratingWithState:&v138 objects:&v150 count:16];
                    if (!v42)
                    {
LABEL_299:

                      unint64_t v14 = 0x1E4F1C000uLL;
                      id v15 = v117;
                      uint64_t v17 = v118;
                      uint64_t v19 = v115;
                      uint64_t v18 = v116;
                      id v23 = v121;
                      v39 = v114;
                      break;
                    }
                  }
                }

                v57 = [v23 objectForKeyedSubscript:@"supportedLanguagesVersion"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v58 = [v57 unsignedIntValue];
                  *(unsigned char *)(v24 + 96) |= 0x20u;
                  *(unsigned char *)(v24 + 96) |= 1u;
                  *(_DWORD *)(v24 + 88) = v58;
                }
              }
            }
            else
            {
              uint64_t v24 = 0;
            }
            id v5 = v120;
            objc_msgSend(v120, "addValidVersion:", v24, v112);

            a3 = v119;
          }
          ++v19;
        }
        while (v19 != v17);
        uint64_t v59 = [v15 countByEnumeratingWithState:&v134 objects:v149 count:16];
        uint64_t v17 = v59;
      }
      while (v59);
    }

    v13 = v112;
  }

  v60 = [v113 objectForKeyedSubscript:@"scale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = v60;
    if ([v61 isEqualToString:@"NODPI"])
    {
      uint64_t v62 = 0;
    }
    else if ([v61 isEqualToString:@"LODPI"])
    {
      uint64_t v62 = 1;
    }
    else if ([v61 isEqualToString:@"HIDPI"])
    {
      uint64_t v62 = 2;
    }
    else
    {
      uint64_t v62 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_322;
    }
    uint64_t v62 = [v60 intValue];
  }
  objc_msgSend(v5, "setScale:", v62, v112);
LABEL_322:

  long long v63 = [v113 objectForKeyedSubscript:@"size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v64 = v63;
    if ([v64 isEqualToString:@"PX128"])
    {
      uint64_t v65 = 0;
    }
    else if ([v64 isEqualToString:@"PX256"])
    {
      uint64_t v65 = 1;
    }
    else if ([v64 isEqualToString:@"PX512"])
    {
      uint64_t v65 = 2;
    }
    else
    {
      uint64_t v65 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_334;
    }
    uint64_t v65 = [v63 intValue];
  }
  objc_msgSend(v5, "setSize:", v65, v112);
LABEL_334:

  long long v66 = [v113 objectForKeyedSubscript:@"localizationURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v67 = (void *)[v66 copy];
    [v5 setLocalizationURL:v67];
  }
  long long v68 = [v113 objectForKeyedSubscript:@"supportedLanguage"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v69 = v68;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v130 objects:v148 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v131;
      do
      {
        for (uint64_t k = 0; k != v71; ++k)
        {
          if (*(void *)v131 != v72) {
            objc_enumerationMutation(v69);
          }
          uint64_t v74 = *(void *)(*((void *)&v130 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v75 = [GEOLanguage alloc];
            if (a3) {
              uint64_t v76 = [(GEOLanguage *)v75 initWithJSON:v74];
            }
            else {
              uint64_t v76 = [(GEOLanguage *)v75 initWithDictionary:v74];
            }
            uint64_t v77 = (void *)v76;
            objc_msgSend(v5, "addSupportedLanguage:", v76, v112);
          }
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v130 objects:v148 count:16];
      }
      while (v71);
    }
  }
  v78 = [v113 objectForKeyedSubscript:@"multiTileURLUsesStatusCodes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setMultiTileURLUsesStatusCodes:", objc_msgSend(v78, "BOOLValue"));
  }

  if (a3) {
    v79 = @"updateBehavior";
  }
  else {
    v79 = @"update_behavior";
  }
  v80 = objc_msgSend(v113, "objectForKeyedSubscript:", v79, v112);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v81 = v80;
    if ([v81 isEqualToString:@"TILE_UPDATE_BEHAVIOR_FLUSH"]) {
      uint64_t v82 = 0;
    }
    else {
      uint64_t v82 = [v81 isEqualToString:@"TILE_UPDATE_BEHAVIOR_ETAG"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_363;
    }
    uint64_t v82 = [v80 intValue];
  }
  [v5 setUpdateBehavior:v82];
LABEL_363:

  v83 = [v113 objectForKeyedSubscript:@"countryRegionWhitelist"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v84 = v83;
    uint64_t v85 = [v84 countByEnumeratingWithState:&v126 objects:v147 count:16];
    if (v85)
    {
      uint64_t v86 = v85;
      uint64_t v87 = *(void *)v127;
      do
      {
        for (uint64_t m = 0; m != v86; ++m)
        {
          if (*(void *)v127 != v87) {
            objc_enumerationMutation(v84);
          }
          uint64_t v89 = *(void *)(*((void *)&v126 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v90 = [GEOCountryRegionTuple alloc];
            if (a3) {
              uint64_t v91 = [(GEOCountryRegionTuple *)v90 initWithJSON:v89];
            }
            else {
              uint64_t v91 = [(GEOCountryRegionTuple *)v90 initWithDictionary:v89];
            }
            v92 = (void *)v91;
            [v5 addCountryRegionAllowlist:v91];
          }
        }
        uint64_t v86 = [v84 countByEnumeratingWithState:&v126 objects:v147 count:16];
      }
      while (v86);
    }
  }
  v93 = [v113 objectForKeyedSubscript:@"checksumType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v94 = v93;
    if ([v94 isEqualToString:@"CHECKSUM_TYPE_NONE"]) {
      uint64_t v95 = 0;
    }
    else {
      uint64_t v95 = [v94 isEqualToString:@"CHECKSUM_TYPE_APPENDED_MD5"];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_385;
    }
    uint64_t v95 = [v93 intValue];
  }
  [v5 setChecksumType:v95];
LABEL_385:

  v96 = [v113 objectForKeyedSubscript:@"dataSet"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setDataSet:", objc_msgSend(v96, "unsignedIntValue"));
  }

  v97 = [v113 objectForKeyedSubscript:@"requestStyle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v98 = v97;
    if ([v98 isEqualToString:@"REQUEST_STYLE_LEGACY"]) {
      uint64_t v99 = 0;
    }
    else {
      uint64_t v99 = [v98 isEqualToString:@"REQUEST_STYLE_HEADER_PARAMS_VERSION_BASED_HMAC_AUTH"];
    }

    goto LABEL_394;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v99 = [v97 intValue];
LABEL_394:
    [v5 setRequestStyle:v99];
  }

  v100 = [v113 objectForKeyedSubscript:@"useAuthProxy"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setUseAuthProxy:", objc_msgSend(v100, "BOOLValue"));
  }

  v101 = [v113 objectForKeyedSubscript:@"supportsMultipathTCP"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setSupportsMultipathTCP:", objc_msgSend(v101, "BOOLValue"));
  }

  v102 = [v113 objectForKeyedSubscript:@"alternativeMultipathTCPPort"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v5, "setAlternativeMultipathTCPPort:", objc_msgSend(v102, "unsignedIntValue"));
  }

  v103 = [v113 objectForKeyedSubscript:@"deviceSKUWhitelist"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v104 = v103;
    uint64_t v105 = [v104 countByEnumeratingWithState:&v122 objects:v146 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = *(void *)v123;
      do
      {
        for (uint64_t n = 0; n != v106; ++n)
        {
          if (*(void *)v123 != v107) {
            objc_enumerationMutation(v104);
          }
          v109 = *(void **)(*((void *)&v122 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v110 = (void *)[v109 copy];
            [v5 addDeviceSKUAllowlist:v110];
          }
        }
        uint64_t v106 = [v104 countByEnumeratingWithState:&v122 objects:v146 count:16];
      }
      while (v106);
    }
  }
  a1 = v5;

LABEL_413:
  return a1;
}

- (GEOTileSet)initWithJSON:(id)a3
{
  return (GEOTileSet *)-[GEOTileSet _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_185_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_186_0;
    }
    GEOTileSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTileSetCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTileSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTileSetIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v24 = self->_reader;
    objc_sync_enter(v24);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v25 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v25];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v24);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTileSet *)self readAll:0];
    if (self->_baseURL) {
      PBDataWriterWriteStringField();
    }
    if (self->_multiTileURL) {
      PBDataWriterWriteStringField();
    }
    PBDataWriterWriteInt32Field();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v6 = self->_validVersions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v39;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v7);
    }

    PBDataWriterWriteInt32Field();
    PBDataWriterWriteInt32Field();
    if (self->_localizationURL) {
      PBDataWriterWriteStringField();
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = self->_supportedLanguages;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v35;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v11);
    }

    $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = self->_countryRegionAllowlists;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v16);
    }

    $C3508E6C0C635A9429EF77D2804AA6E5 v19 = self->_flags;
    if ((*(unsigned char *)&v19 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      $C3508E6C0C635A9429EF77D2804AA6E5 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      $C3508E6C0C635A9429EF77D2804AA6E5 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      $C3508E6C0C635A9429EF77D2804AA6E5 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      $C3508E6C0C635A9429EF77D2804AA6E5 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      $C3508E6C0C635A9429EF77D2804AA6E5 v19 = self->_flags;
    }
    if (*(unsigned char *)&v19) {
      PBDataWriterWriteUint32Field();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v20 = self->_deviceSKUAllowlists;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v27;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteStringField();
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
      }
      while (v21);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v26);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v22 = (id *)a3;
  [(GEOTileSet *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v22 + 1, self->_reader);
  *((_DWORD *)v22 + 20) = self->_readerMarkPos;
  *((_DWORD *)v22 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_baseURL) {
    objc_msgSend(v22, "setBaseURL:");
  }
  if (self->_multiTileURL) {
    objc_msgSend(v22, "setMultiTileURL:");
  }
  *((_DWORD *)v22 + 29) = self->_style;
  if ([(GEOTileSet *)self validVersionsCount])
  {
    [v22 clearValidVersions];
    unint64_t v4 = [(GEOTileSet *)self validVersionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTileSet *)self validVersionAtIndex:i];
        [v22 addValidVersion:v7];
      }
    }
  }
  *((_DWORD *)v22 + 27) = self->_scale;
  *((_DWORD *)v22 + 28) = self->_size;
  if (self->_localizationURL) {
    objc_msgSend(v22, "setLocalizationURL:");
  }
  if ([(GEOTileSet *)self supportedLanguagesCount])
  {
    [v22 clearSupportedLanguages];
    unint64_t v8 = [(GEOTileSet *)self supportedLanguagesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTileSet *)self supportedLanguageAtIndex:j];
        [v22 addSupportedLanguage:v11];
      }
    }
  }
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *((unsigned char *)v22 + 124) = self->_multiTileURLUsesStatusCodes;
    *((_DWORD *)v22 + 32) |= 0x20u;
    $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v22 + 30) = self->_updateBehavior;
    *((_DWORD *)v22 + 32) |= 0x10u;
  }
  if ([(GEOTileSet *)self countryRegionAllowlistsCount])
  {
    [v22 clearCountryRegionAllowlists];
    unint64_t v13 = [(GEOTileSet *)self countryRegionAllowlistsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOTileSet *)self countryRegionAllowlistAtIndex:k];
        [v22 addCountryRegionAllowlist:v16];
      }
    }
  }
  $C3508E6C0C635A9429EF77D2804AA6E5 v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 2) != 0)
  {
    *((_DWORD *)v22 + 24) = self->_checksumType;
    *((_DWORD *)v22 + 32) |= 2u;
    $C3508E6C0C635A9429EF77D2804AA6E5 v17 = self->_flags;
    if ((*(unsigned char *)&v17 & 4) == 0)
    {
LABEL_25:
      if ((*(unsigned char *)&v17 & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&v17 & 4) == 0)
  {
    goto LABEL_25;
  }
  *((_DWORD *)v22 + 25) = self->_dataSet;
  *((_DWORD *)v22 + 32) |= 4u;
  $C3508E6C0C635A9429EF77D2804AA6E5 v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 8) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v17 & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v22 + 26) = self->_requestStyle;
  *((_DWORD *)v22 + 32) |= 8u;
  $C3508E6C0C635A9429EF77D2804AA6E5 v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x80) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v17 & 0x40) == 0) {
      goto LABEL_28;
    }
LABEL_41:
    *((unsigned char *)v22 + 125) = self->_supportsMultipathTCP;
    *((_DWORD *)v22 + 32) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_40:
  *((unsigned char *)v22 + 126) = self->_useAuthProxy;
  *((_DWORD *)v22 + 32) |= 0x80u;
  $C3508E6C0C635A9429EF77D2804AA6E5 v17 = self->_flags;
  if ((*(unsigned char *)&v17 & 0x40) != 0) {
    goto LABEL_41;
  }
LABEL_28:
  if (*(unsigned char *)&v17)
  {
LABEL_29:
    *((_DWORD *)v22 + 23) = self->_alternativeMultipathTCPPort;
    *((_DWORD *)v22 + 32) |= 1u;
  }
LABEL_30:
  if ([(GEOTileSet *)self deviceSKUAllowlistsCount])
  {
    [v22 clearDeviceSKUAllowlists];
    unint64_t v18 = [(GEOTileSet *)self deviceSKUAllowlistsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(GEOTileSet *)self deviceSKUAllowlistAtIndex:m];
        [v22 addDeviceSKUAllowlist:v21];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 2) & 1) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTileSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_45;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTileSet *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_baseURL copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_multiTileURL copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  *(_DWORD *)(v5 + 116) = self->_style;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v13 = self->_validVersions;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v13);
        }
        $C3508E6C0C635A9429EF77D2804AA6E5 v17 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addValidVersion:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v14);
  }

  *(_DWORD *)(v5 + 108) = self->_scale;
  *(_DWORD *)(v5 + 112) = self->_size;
  uint64_t v18 = [(NSString *)self->_localizationURL copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v20 = self->_supportedLanguages;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addSupportedLanguage:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v21);
  }

  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 124) = self->_multiTileURLUsesStatusCodes;
    *(_DWORD *)(v5 + 128) |= 0x20u;
    $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_updateBehavior;
    *(_DWORD *)(v5 + 128) |= 0x10u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v26 = self->_countryRegionAllowlists;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v26);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addCountryRegionAllowlist:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v27);
  }

  $C3508E6C0C635A9429EF77D2804AA6E5 v31 = self->_flags;
  if ((*(unsigned char *)&v31 & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_checksumType;
    *(_DWORD *)(v5 + 128) |= 2u;
    $C3508E6C0C635A9429EF77D2804AA6E5 v31 = self->_flags;
    if ((*(unsigned char *)&v31 & 4) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v31 & 8) == 0) {
        goto LABEL_33;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&v31 & 4) == 0)
  {
    goto LABEL_32;
  }
  *(_DWORD *)(v5 + 100) = self->_dataSet;
  *(_DWORD *)(v5 + 128) |= 4u;
  $C3508E6C0C635A9429EF77D2804AA6E5 v31 = self->_flags;
  if ((*(unsigned char *)&v31 & 8) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v31 & 0x80) == 0) {
      goto LABEL_34;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 104) = self->_requestStyle;
  *(_DWORD *)(v5 + 128) |= 8u;
  $C3508E6C0C635A9429EF77D2804AA6E5 v31 = self->_flags;
  if ((*(unsigned char *)&v31 & 0x80) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v31 & 0x40) == 0) {
      goto LABEL_35;
    }
LABEL_50:
    *(unsigned char *)(v5 + 125) = self->_supportsMultipathTCP;
    *(_DWORD *)(v5 + 128) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_49:
  *(unsigned char *)(v5 + 126) = self->_useAuthProxy;
  *(_DWORD *)(v5 + 128) |= 0x80u;
  $C3508E6C0C635A9429EF77D2804AA6E5 v31 = self->_flags;
  if ((*(unsigned char *)&v31 & 0x40) != 0) {
    goto LABEL_50;
  }
LABEL_35:
  if (*(unsigned char *)&v31)
  {
LABEL_36:
    *(_DWORD *)(v5 + 92) = self->_alternativeMultipathTCPPort;
    *(_DWORD *)(v5 + 128) |= 1u;
  }
LABEL_37:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v32 = self->_deviceSKUAllowlists;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(v32);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * m), "copyWithZone:", a3, (void)v39);
        [(id)v5 addDeviceSKUAllowlist:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v33);
  }

  long long v37 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v37;
LABEL_45:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_69;
  }
  [(GEOTileSet *)self readAll:1];
  [v4 readAll:1];
  baseURL = self->_baseURL;
  if ((unint64_t)baseURL | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](baseURL, "isEqual:")) {
      goto LABEL_69;
    }
  }
  multiTileURL = self->_multiTileURL;
  if ((unint64_t)multiTileURL | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](multiTileURL, "isEqual:")) {
      goto LABEL_69;
    }
  }
  if (self->_style != *((_DWORD *)v4 + 29)) {
    goto LABEL_69;
  }
  validVersions = self->_validVersions;
  if ((unint64_t)validVersions | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](validVersions, "isEqual:")) {
      goto LABEL_69;
    }
  }
  if (self->_scale != *((_DWORD *)v4 + 27)) {
    goto LABEL_69;
  }
  if (self->_size != *((_DWORD *)v4 + 28)) {
    goto LABEL_69;
  }
  localizationURL = self->_localizationURL;
  if ((unint64_t)localizationURL | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](localizationURL, "isEqual:")) {
      goto LABEL_69;
    }
  }
  supportedLanguages = self->_supportedLanguages;
  if ((unint64_t)supportedLanguages | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](supportedLanguages, "isEqual:")) {
      goto LABEL_69;
    }
  }
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  int v11 = *((_DWORD *)v4 + 32);
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0) {
      goto LABEL_69;
    }
    if (self->_multiTileURLUsesStatusCodes)
    {
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)v4 + 124))
    {
      goto LABEL_69;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_updateBehavior != *((_DWORD *)v4 + 30)) {
      goto LABEL_69;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_69;
  }
  countryRegionAllowlists = self->_countryRegionAllowlists;
  if ((unint64_t)countryRegionAllowlists | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](countryRegionAllowlists, "isEqual:")) {
      goto LABEL_69;
    }
    $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
    int v11 = *((_DWORD *)v4 + 32);
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_checksumType != *((_DWORD *)v4 + 24)) {
      goto LABEL_69;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dataSet != *((_DWORD *)v4 + 25)) {
      goto LABEL_69;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_requestStyle != *((_DWORD *)v4 + 26)) {
      goto LABEL_69;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0) {
      goto LABEL_69;
    }
    if (self->_useAuthProxy)
    {
      if (!*((unsigned char *)v4 + 126)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)v4 + 126))
    {
      goto LABEL_69;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_69;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v11 & 0x40) != 0)
    {
      if (self->_supportsMultipathTCP)
      {
        if (!*((unsigned char *)v4 + 125)) {
          goto LABEL_69;
        }
        goto LABEL_62;
      }
      if (!*((unsigned char *)v4 + 125)) {
        goto LABEL_62;
      }
    }
LABEL_69:
    char v14 = 0;
    goto LABEL_70;
  }
  if ((v11 & 0x40) != 0) {
    goto LABEL_69;
  }
LABEL_62:
  if (*(unsigned char *)&flags)
  {
    if ((v11 & 1) == 0 || self->_alternativeMultipathTCPPort != *((_DWORD *)v4 + 23)) {
      goto LABEL_69;
    }
  }
  else if (v11)
  {
    goto LABEL_69;
  }
  deviceSKUAllowlists = self->_deviceSKUAllowlists;
  if ((unint64_t)deviceSKUAllowlists | *((void *)v4 + 5)) {
    char v14 = -[NSMutableArray isEqual:](deviceSKUAllowlists, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_70:

  return v14;
}

- (unint64_t)hash
{
  [(GEOTileSet *)self readAll:1];
  NSUInteger v23 = [(NSString *)self->_baseURL hash];
  NSUInteger v3 = [(NSString *)self->_multiTileURL hash];
  uint64_t style = self->_style;
  NSUInteger v22 = v3;
  uint64_t v4 = [(NSMutableArray *)self->_validVersions hash];
  uint64_t scale = self->_scale;
  uint64_t size = self->_size;
  NSUInteger v7 = [(NSString *)self->_localizationURL hash];
  uint64_t v8 = [(NSMutableArray *)self->_supportedLanguages hash];
  $C3508E6C0C635A9429EF77D2804AA6E5 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_multiTileURLUsesStatusCodes;
    if ((*(unsigned char *)&flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v11 = 2654435761 * self->_updateBehavior;
      goto LABEL_6;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  uint64_t v12 = [(NSMutableArray *)self->_countryRegionAllowlists hash];
  $C3508E6C0C635A9429EF77D2804AA6E5 v13 = self->_flags;
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    uint64_t v14 = 2654435761 * self->_checksumType;
    if ((*(unsigned char *)&v13 & 4) != 0)
    {
LABEL_8:
      uint64_t v15 = 2654435761 * self->_dataSet;
      if ((*(unsigned char *)&v13 & 8) != 0) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&v13 & 4) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
LABEL_9:
    uint64_t v16 = 2654435761 * self->_requestStyle;
    if ((*(unsigned char *)&v13 & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
LABEL_10:
    uint64_t v17 = 2654435761 * self->_useAuthProxy;
    if ((*(unsigned char *)&v13 & 0x40) != 0) {
      goto LABEL_11;
    }
LABEL_17:
    uint64_t v18 = 0;
    if (*(unsigned char *)&v13) {
      goto LABEL_12;
    }
LABEL_18:
    uint64_t v19 = 0;
    return v22 ^ v23 ^ v4 ^ (2654435761 * style) ^ (2654435761 * scale) ^ (2654435761 * size) ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSMutableArray *)self->_deviceSKUAllowlists hash];
  }
LABEL_16:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v13 & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_11:
  uint64_t v18 = 2654435761 * self->_supportsMultipathTCP;
  if ((*(unsigned char *)&v13 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  uint64_t v19 = 2654435761 * self->_alternativeMultipathTCPPort;
  return v22 ^ v23 ^ v4 ^ (2654435761 * style) ^ (2654435761 * scale) ^ (2654435761 * size) ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSMutableArray *)self->_deviceSKUAllowlists hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEOTileSet setBaseURL:](self, "setBaseURL:");
  }
  if (*((void *)v4 + 7)) {
    -[GEOTileSet setMultiTileURL:](self, "setMultiTileURL:");
  }
  self->_uint64_t style = *((_DWORD *)v4 + 29);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = *((id *)v4 + 9);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTileSet *)self addValidVersion:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v7);
  }

  self->_uint64_t scale = *((_DWORD *)v4 + 27);
  self->_uint64_t size = *((_DWORD *)v4 + 28);
  if (*((void *)v4 + 6)) {
    -[GEOTileSet setLocalizationURL:](self, "setLocalizationURL:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = *((id *)v4 + 8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOTileSet *)self addSupportedLanguage:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v12);
  }

  int v15 = *((_DWORD *)v4 + 32);
  if ((v15 & 0x20) != 0)
  {
    self->_multiTileURLUsesStatusCodes = *((unsigned char *)v4 + 124);
    *(_DWORD *)&self->_flags |= 0x20u;
    int v15 = *((_DWORD *)v4 + 32);
  }
  if ((v15 & 0x10) != 0)
  {
    self->_updateBehavior = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = *((id *)v4 + 4);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        [(GEOTileSet *)self addCountryRegionAllowlist:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v18);
  }

  int v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 2) != 0)
  {
    self->_checksumType = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_flags |= 2u;
    int v21 = *((_DWORD *)v4 + 32);
    if ((v21 & 4) == 0)
    {
LABEL_34:
      if ((v21 & 8) == 0) {
        goto LABEL_35;
      }
      goto LABEL_49;
    }
  }
  else if ((v21 & 4) == 0)
  {
    goto LABEL_34;
  }
  self->_dataSet = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_flags |= 4u;
  int v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 8) == 0)
  {
LABEL_35:
    if ((v21 & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_requestStyle = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_flags |= 8u;
  int v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 0x80) == 0)
  {
LABEL_36:
    if ((v21 & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_useAuthProxy = *((unsigned char *)v4 + 126);
  *(_DWORD *)&self->_flags |= 0x80u;
  int v21 = *((_DWORD *)v4 + 32);
  if ((v21 & 0x40) == 0)
  {
LABEL_37:
    if ((v21 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_51:
  self->_supportsMultipathTCP = *((unsigned char *)v4 + 125);
  *(_DWORD *)&self->_flags |= 0x40u;
  if (*((_DWORD *)v4 + 32))
  {
LABEL_38:
    self->_alternativeMultipathTCPPort = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_flags |= 1u;
  }
LABEL_39:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = *((id *)v4 + 5);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        -[GEOTileSet addDeviceSKUAllowlist:](self, "addDeviceSKUAllowlist:", *(void *)(*((void *)&v27 + 1) + 8 * m), (void)v27);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v24);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 1) & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTileSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_190_0);
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x10100u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTileSet *)self readAll:0];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v7 = self->_validVersions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * v11);
          if (v12)
          {
            os_unfair_lock_lock_with_options();
            *(unsigned char *)(v12 + 96) |= 4u;
            *(unsigned char *)(v12 + 96) |= 0x20u;
            os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 80));
            uint64_t v13 = *(void **)(v12 + 16);
            *(void *)(v12 + 16) = 0;

            -[GEOTileSetVersion readAll:](v12, 0);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v9);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = self->_supportedLanguages;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v18++) clearUnknownFields:1];
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v16);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v19 = self->_countryRegionAllowlists;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v23++), "clearUnknownFields:", 1, (void)v24);
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v21);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validVersions, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_multiTileURL, 0);
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_deviceSKUAllowlists, 0);
  objc_storeStrong((id *)&self->_countryRegionAllowlists, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end