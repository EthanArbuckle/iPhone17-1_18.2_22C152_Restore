@interface GEOPBOfflineTileMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (unint64_t)hash;
- (void)addTileStyleAvailability:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPBOfflineTileMetadata

- (void)addTileStyleAvailability:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPBOfflineTileMetadata;
  v4 = [(GEOPBOfflineTileMetadata *)&v8 description];
  id v5 = [(GEOPBOfflineTileMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineTileMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 8) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = *(id *)(a1 + 8);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v14);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v14);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"tileStyleAvailability"];
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
  return -[GEOPBOfflineTileMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_279;
  }
  uint64_t v4 = [a1 init];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"tileStyleAvailability"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_278;
    }
    v30 = v5;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (!v7) {
      goto LABEL_277;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    id v31 = v6;
    uint64_t v32 = v4;
    uint64_t v33 = *(void *)v37;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v34 = v8;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [GEOPBTileStyleZoomAvailability alloc];
          if (v12)
          {
            v13 = v12;
            id v14 = v11;
            uint64_t v15 = [(GEOPBTileStyleZoomAvailability *)v13 init];
            if (v15)
            {
              long long v16 = [v14 objectForKeyedSubscript:@"style"];
              objc_opt_class();
              v35 = v14;
              if (objc_opt_isKindOfClass())
              {
                id v17 = v16;
                if ([v17 isEqualToString:@"RASTER_STANDARD"])
                {
                  int v18 = 0;
                }
                else if ([v17 isEqualToString:@"VECTOR_STANDARD"])
                {
                  int v18 = 1;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER"])
                {
                  int v18 = 2;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER"])
                {
                  int v18 = 3;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER"])
                {
                  int v18 = 4;
                }
                else if ([v17 isEqualToString:@"RASTER_STANDARD_BACKGROUND"])
                {
                  int v18 = 5;
                }
                else if ([v17 isEqualToString:@"RASTER_HYBRID"])
                {
                  int v18 = 6;
                }
                else if ([v17 isEqualToString:@"RASTER_SATELLITE"])
                {
                  int v18 = 7;
                }
                else if ([v17 isEqualToString:@"RASTER_TERRAIN"])
                {
                  int v18 = 8;
                }
                else if ([v17 isEqualToString:@"VECTOR_BUILDINGS"])
                {
                  int v18 = 11;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC"])
                {
                  int v18 = 12;
                }
                else if ([v17 isEqualToString:@"VECTOR_POI"])
                {
                  int v18 = 13;
                }
                else if ([v17 isEqualToString:@"SPUTNIK_METADATA"])
                {
                  int v18 = 14;
                }
                else if ([v17 isEqualToString:@"SPUTNIK_C3M"])
                {
                  int v18 = 15;
                }
                else if ([v17 isEqualToString:@"SPUTNIK_DSM"])
                {
                  int v18 = 16;
                }
                else if ([v17 isEqualToString:@"SPUTNIK_DSM_GLOBAL"])
                {
                  int v18 = 17;
                }
                else if ([v17 isEqualToString:@"VECTOR_REALISTIC"])
                {
                  int v18 = 18;
                }
                else if ([v17 isEqualToString:@"VECTOR_LEGACY_REALISTIC"])
                {
                  int v18 = 19;
                }
                else if ([v17 isEqualToString:@"VECTOR_ROADS"])
                {
                  int v18 = 20;
                }
                else if ([v17 isEqualToString:@"RASTER_VEGETATION"])
                {
                  int v18 = 21;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_SKELETON"])
                {
                  int v18 = 22;
                }
                else if ([v17 isEqualToString:@"RASTER_COASTLINE_MASK"])
                {
                  int v18 = 23;
                }
                else if ([v17 isEqualToString:@"RASTER_HILLSHADE"])
                {
                  int v18 = 24;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_WITH_GREEN"])
                {
                  int v18 = 25;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_STATIC"])
                {
                  int v18 = 26;
                }
                else if ([v17 isEqualToString:@"RASTER_COASTLINE_DROP_MASK"])
                {
                  int v18 = 27;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL"])
                {
                  int v18 = 28;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPEED_PROFILES"])
                {
                  int v18 = 29;
                }
                else if ([v17 isEqualToString:@"VECTOR_VENUES"])
                {
                  int v18 = 30;
                }
                else if ([v17 isEqualToString:@"RASTER_DOWN_SAMPLED"])
                {
                  int v18 = 31;
                }
                else if ([v17 isEqualToString:@"RASTER_COLOR_BALANCED"])
                {
                  int v18 = 32;
                }
                else if ([v17 isEqualToString:@"RASTER_SATELLITE_NIGHT"])
                {
                  int v18 = 33;
                }
                else if ([v17 isEqualToString:@"SPUTNIK_VECTOR_BORDER"])
                {
                  int v18 = 34;
                }
                else if ([v17 isEqualToString:@"RASTER_SATELLITE_DIGITIZE"])
                {
                  int v18 = 35;
                }
                else if ([v17 isEqualToString:@"RASTER_HILLSHADE_PARKS"])
                {
                  int v18 = 36;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRANSIT"])
                {
                  int v18 = 37;
                }
                else if ([v17 isEqualToString:@"RASTER_STANDARD_BASE"])
                {
                  int v18 = 38;
                }
                else if ([v17 isEqualToString:@"RASTER_STANDARD_LABELS"])
                {
                  int v18 = 39;
                }
                else if ([v17 isEqualToString:@"RASTER_HYBRID_ROADS"])
                {
                  int v18 = 40;
                }
                else if ([v17 isEqualToString:@"RASTER_HYBRID_LABELS"])
                {
                  int v18 = 41;
                }
                else if ([v17 isEqualToString:@"FLYOVER_C3M_MESH"])
                {
                  int v18 = 42;
                }
                else if ([v17 isEqualToString:@"FLYOVER_C3M_JPEG_TEXTURE"])
                {
                  int v18 = 43;
                }
                else if ([v17 isEqualToString:@"FLYOVER_C3M_ASTC_TEXTURE"])
                {
                  int v18 = 44;
                }
                else if ([v17 isEqualToString:@"RASTER_SATELLITE_ASTC"])
                {
                  int v18 = 45;
                }
                else if ([v17 isEqualToString:@"RASTER_HYBRID_ROADS_AND_LABELS"])
                {
                  int v18 = 46;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRANSIT_SELECTION"])
                {
                  int v18 = 47;
                }
                else if ([v17 isEqualToString:@"VECTOR_COVERAGE"])
                {
                  int v18 = 48;
                }
                else if ([v17 isEqualToString:@"FLYOVER_METADATA"])
                {
                  int v18 = 52;
                }
                else if ([v17 isEqualToString:@"VECTOR_ROAD_NETWORK"])
                {
                  int v18 = 53;
                }
                else if ([v17 isEqualToString:@"VECTOR_LAND_COVER"])
                {
                  int v18 = 54;
                }
                else if ([v17 isEqualToString:@"VECTOR_DEBUG"])
                {
                  int v18 = 55;
                }
                else if ([v17 isEqualToString:@"VECTOR_STREET_POI"])
                {
                  int v18 = 56;
                }
                else if ([v17 isEqualToString:@"MUNIN_METADATA"])
                {
                  int v18 = 57;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_MERCATOR"])
                {
                  int v18 = 58;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_MODELS"])
                {
                  int v18 = 59;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_MATERIALS"])
                {
                  int v18 = 60;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_METADATA"])
                {
                  int v18 = 61;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRACKS"])
                {
                  int v18 = 62;
                }
                else if ([v17 isEqualToString:@"VECTOR_RESERVED_2"])
                {
                  int v18 = 63;
                }
                else if ([v17 isEqualToString:@"VECTOR_STREET_LANDMARKS"])
                {
                  int v18 = 64;
                }
                else if ([v17 isEqualToString:@"COARSE_LOCATION_POLYGONS"])
                {
                  int v18 = 65;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_ROADS"])
                {
                  int v18 = 66;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_STANDARD"])
                {
                  int v18 = 67;
                }
                else if ([v17 isEqualToString:@"VECTOR_POI_V2"])
                {
                  int v18 = 68;
                }
                else if ([v17 isEqualToString:@"VECTOR_POLYGON_SELECTION"])
                {
                  int v18 = 69;
                }
                else if ([v17 isEqualToString:@"VL_METADATA"])
                {
                  int v18 = 70;
                }
                else if ([v17 isEqualToString:@"VL_DATA"])
                {
                  int v18 = 71;
                }
                else if ([v17 isEqualToString:@"PROACTIVE_APP_CLIP"])
                {
                  int v18 = 72;
                }
                else if ([v17 isEqualToString:@"VECTOR_BUILDINGS_V2"])
                {
                  int v18 = 73;
                }
                else if ([v17 isEqualToString:@"POI_BUSYNESS"])
                {
                  int v18 = 74;
                }
                else if ([v17 isEqualToString:@"POI_DP_BUSYNESS"])
                {
                  int v18 = 75;
                }
                else if ([v17 isEqualToString:@"SMART_INTERFACE_SELECTION"])
                {
                  int v18 = 76;
                }
                else if ([v17 isEqualToString:@"VECTOR_ASSETS"])
                {
                  int v18 = 77;
                }
                else if ([v17 isEqualToString:@"SPR_ASSET_METADATA"])
                {
                  int v18 = 78;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_POLAR"])
                {
                  int v18 = 79;
                }
                else if ([v17 isEqualToString:@"SMART_DATA_MODE"])
                {
                  int v18 = 80;
                }
                else if ([v17 isEqualToString:@"CELLULAR_PERFORMANCE_SCORE"])
                {
                  int v18 = 81;
                }
                else if ([v17 isEqualToString:@"VECTOR_SPR_MODELS_OCCLUSION"])
                {
                  int v18 = 82;
                }
                else if ([v17 isEqualToString:@"VECTOR_TOPOGRAPHIC"])
                {
                  int v18 = 83;
                }
                else if ([v17 isEqualToString:@"VECTOR_POI_V2_UPDATE"])
                {
                  int v18 = 84;
                }
                else if ([v17 isEqualToString:@"VECTOR_LIVE_DATA_UPDATES"])
                {
                  int v18 = 85;
                }
                else if ([v17 isEqualToString:@"VECTOR_TRAFFIC_V2"])
                {
                  int v18 = 86;
                }
                else if ([v17 isEqualToString:@"VECTOR_ROAD_SELECTION"])
                {
                  int v18 = 87;
                }
                else if ([v17 isEqualToString:@"VECTOR_REGION_METADATA"])
                {
                  int v18 = 88;
                }
                else if ([v17 isEqualToString:@"RAY_TRACING"])
                {
                  int v18 = 89;
                }
                else if ([v17 isEqualToString:@"VECTOR_CONTOURS"])
                {
                  int v18 = 90;
                }
                else if ([v17 isEqualToString:@"RASTER_SATELLITE_POLAR"])
                {
                  int v18 = 91;
                }
                else if ([v17 isEqualToString:@"VMAP4_ELEVATION"])
                {
                  int v18 = 92;
                }
                else if ([v17 isEqualToString:@"VMAP4_ELEVATION_POLAR"])
                {
                  int v18 = 93;
                }
                else if ([v17 isEqualToString:@"CELLULAR_COVERAGE_PLMN"])
                {
                  int v18 = 94;
                }
                else if ([v17 isEqualToString:@"RASTER_SATELLITE_POLAR_NIGHT"])
                {
                  int v18 = 95;
                }
                else if ([v17 isEqualToString:@"UNUSED_96"])
                {
                  int v18 = 96;
                }
                else if ([v17 isEqualToString:@"UNUSED_97"])
                {
                  int v18 = 97;
                }
                else if ([v17 isEqualToString:@"UNUSED_98"])
                {
                  int v18 = 98;
                }
                else if ([v17 isEqualToString:@"UNUSED_99"])
                {
                  int v18 = 99;
                }
                else if ([v17 isEqualToString:@"UNUSED_100"])
                {
                  int v18 = 100;
                }
                else if ([v17 isEqualToString:@"UNUSED_101"])
                {
                  int v18 = 101;
                }
                else if ([v17 isEqualToString:@"UNUSED_102"])
                {
                  int v18 = 102;
                }
                else if ([v17 isEqualToString:@"UNUSED_103"])
                {
                  int v18 = 103;
                }
                else if ([v17 isEqualToString:@"UNUSED_104"])
                {
                  int v18 = 104;
                }
                else if ([v17 isEqualToString:@"UNUSED_105"])
                {
                  int v18 = 105;
                }
                else if ([v17 isEqualToString:@"UNUSED_106"])
                {
                  int v18 = 106;
                }
                else if ([v17 isEqualToString:@"UNUSED_107"])
                {
                  int v18 = 107;
                }
                else if ([v17 isEqualToString:@"UNUSED_108"])
                {
                  int v18 = 108;
                }
                else if ([v17 isEqualToString:@"UNUSED_109"])
                {
                  int v18 = 109;
                }
                else if ([v17 isEqualToString:@"UNUSED_110"])
                {
                  int v18 = 110;
                }
                else if ([v17 isEqualToString:@"UNUSED_111"])
                {
                  int v18 = 111;
                }
                else if ([v17 isEqualToString:@"UNUSED_112"])
                {
                  int v18 = 112;
                }
                else if ([v17 isEqualToString:@"UNUSED_113"])
                {
                  int v18 = 113;
                }
                else if ([v17 isEqualToString:@"UNUSED_114"])
                {
                  int v18 = 114;
                }
                else if ([v17 isEqualToString:@"UNUSED_115"])
                {
                  int v18 = 115;
                }
                else if ([v17 isEqualToString:@"UNUSED_116"])
                {
                  int v18 = 116;
                }
                else if ([v17 isEqualToString:@"UNUSED_117"])
                {
                  int v18 = 117;
                }
                else if ([v17 isEqualToString:@"UNUSED_118"])
                {
                  int v18 = 118;
                }
                else if ([v17 isEqualToString:@"UNUSED_119"])
                {
                  int v18 = 119;
                }
                else
                {
                  int v18 = 0;
                }

                id v14 = v35;
LABEL_248:
                *(unsigned char *)(v15 + 40) |= 2u;
                *(_DWORD *)(v15 + 36) = v18;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v18 = [v16 intValue];
                  goto LABEL_248;
                }
              }

              uint64_t v19 = [v14 objectForKeyedSubscript:@"zoom"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                id v20 = v19;
                uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v41;
                  do
                  {
                    for (uint64_t i = 0; i != v22; ++i)
                    {
                      if (*(void *)v41 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v25 unsignedIntValue];
                        PBRepeatedUInt32Add();
                      }
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v45 count:16];
                  }
                  while (v22);
                }

                id v6 = v31;
                uint64_t v4 = v32;
              }

              v26 = [v35 objectForKeyedSubscript:@"size"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v27 = v26;
                if ([v27 isEqualToString:@"PX128"])
                {
                  int v28 = 0;
                }
                else if ([v27 isEqualToString:@"PX256"])
                {
                  int v28 = 1;
                }
                else if ([v27 isEqualToString:@"PX512"])
                {
                  int v28 = 2;
                }
                else
                {
                  int v28 = 0;
                }

LABEL_271:
                *(unsigned char *)(v15 + 40) |= 1u;
                *(_DWORD *)(v15 + 32) = v28;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v28 = [v26 intValue];
                  goto LABEL_271;
                }
              }

              id v14 = v35;
            }
          }
          else
          {
            uint64_t v15 = 0;
          }
          -[GEOPBOfflineTileMetadata addTileStyleAvailability:](v4, (void *)v15);

          uint64_t v9 = v33;
          uint64_t v8 = v34;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (!v8)
      {
LABEL_277:

        id v5 = v30;
LABEL_278:

        break;
      }
    }
  }
LABEL_279:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBOfflineTileMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_tileStyleAvailabilitys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_tileStyleAvailabilitys;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        -[GEOPBOfflineTileMetadata addTileStyleAvailability:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    tileStyleAvailabilitys = self->_tileStyleAvailabilitys;
    if ((unint64_t)tileStyleAvailabilitys | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](tileStyleAvailabilitys, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_tileStyleAvailabilitys hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a2 + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[GEOPBOfflineTileMetadata addTileStyleAvailability:](a1, *(void **)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void).cxx_destruct
{
}

@end