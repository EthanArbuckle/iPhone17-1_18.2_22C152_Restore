@interface GEOTFTrafficSnapshot
+ (BOOL)isValid:(id)a3;
+ (Class)compactSpeedsType;
+ (Class)incidentsType;
+ (Class)regionType;
+ (Class)speedsType;
- (BOOL)hasFeedId;
- (BOOL)hasFeedPublishTime;
- (BOOL)hasFeedUpdateTime;
- (BOOL)hasSnapshotId;
- (BOOL)hasTrafficVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTFTrafficSnapshot)init;
- (GEOTFTrafficSnapshot)initWithData:(id)a3;
- (GEOTFTrafficSnapshot)initWithDictionary:(id)a3;
- (GEOTFTrafficSnapshot)initWithJSON:(id)a3;
- (NSMutableArray)compactSpeeds;
- (NSMutableArray)incidents;
- (NSMutableArray)regions;
- (NSMutableArray)speeds;
- (NSString)feedId;
- (NSString)snapshotId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)compactSpeedsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)incidentsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)regionAtIndex:(unint64_t)a3;
- (id)speedsAtIndex:(unint64_t)a3;
- (int64_t)feedUpdateTime;
- (unint64_t)compactSpeedsCount;
- (unint64_t)feedPublishTime;
- (unint64_t)hash;
- (unint64_t)incidentsCount;
- (unint64_t)regionsCount;
- (unint64_t)speedsCount;
- (unsigned)trafficVersion;
- (void)_addNoFlagsCompactSpeeds:(uint64_t)a1;
- (void)_addNoFlagsIncidents:(uint64_t)a1;
- (void)_addNoFlagsRegion:(uint64_t)a1;
- (void)_addNoFlagsSpeeds:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCompactSpeeds;
- (void)_readFeedId;
- (void)_readIncidents;
- (void)_readRegions;
- (void)_readSnapshotId;
- (void)_readSpeeds;
- (void)addCompactSpeeds:(id)a3;
- (void)addIncidents:(id)a3;
- (void)addRegion:(id)a3;
- (void)addSpeeds:(id)a3;
- (void)clearCompactSpeeds;
- (void)clearIncidents;
- (void)clearRegions;
- (void)clearSpeeds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCompactSpeeds:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedPublishTime:(unint64_t)a3;
- (void)setFeedUpdateTime:(int64_t)a3;
- (void)setHasFeedPublishTime:(BOOL)a3;
- (void)setHasFeedUpdateTime:(BOOL)a3;
- (void)setHasTrafficVersion:(BOOL)a3;
- (void)setIncidents:(id)a3;
- (void)setRegions:(id)a3;
- (void)setSnapshotId:(id)a3;
- (void)setSpeeds:(id)a3;
- (void)setTrafficVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTFTrafficSnapshot

- (void)_readSpeeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpeeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (GEOTFTrafficSnapshot)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTFTrafficSnapshot;
  v2 = [(GEOTFTrafficSnapshot *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsIncidents:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v362 = *MEMORY[0x1E4F143B8];
  id v262 = a2;
  if (!a1 || (v306 = (void *)[a1 init]) == 0)
  {
    v306 = 0;
    goto LABEL_512;
  }
  v4 = [v262 objectForKeyedSubscript:@"region"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v330 = 0u;
    long long v331 = 0u;
    long long v328 = 0u;
    long long v329 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v328 objects:v351 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v329;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v329 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v328 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = (void *)[v9 copy];
            [v306 addRegion:v10];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v328 objects:v351 count:16];
      }
      while (v6);
    }
  }
  v260 = [v262 objectForKeyedSubscript:@"incidents"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v326 = 0u;
    long long v327 = 0u;
    long long v324 = 0u;
    long long v325 = 0u;
    obuint64_t j = v260;
    uint64_t v303 = [obj countByEnumeratingWithState:&v324 objects:v350 count:16];
    if (!v303) {
      goto LABEL_250;
    }
    uint64_t v300 = *(void *)v325;
    if (a3) {
      v11 = @"incidentId";
    }
    else {
      v11 = @"incident_id";
    }
    v12 = @"start_time";
    if (a3) {
      v12 = @"startTime";
    }
    v291 = v12;
    v294 = v11;
    v13 = @"updateTime";
    if (!a3) {
      v13 = @"update_time";
    }
    v288 = v13;
    v14 = @"cross_street";
    if (a3) {
      v14 = @"crossStreet";
    }
    v285 = v14;
    if (a3) {
      v15 = @"laneClosureCount";
    }
    else {
      v15 = @"lane_closure_count";
    }
    v282 = v15;
    if (a3) {
      v16 = @"endTimeReliable";
    }
    else {
      v16 = @"end_time_reliable";
    }
    v17 = @"lane_closure_type";
    if (a3) {
      v17 = @"laneClosureType";
    }
    v276 = v17;
    v279 = v16;
    if (a3) {
      v18 = @"hardBlocked";
    }
    else {
      v18 = @"hard_blocked";
    }
    v19 = @"startOffset";
    if (!a3) {
      v19 = @"start_offset";
    }
    v271 = v19;
    v273 = v18;
    v20 = @"end_offset";
    if (a3) {
      v20 = @"endOffset";
    }
    v269 = v20;
    if (a3) {
      v21 = @"minZoomLevel";
    }
    else {
      v21 = @"min_zoom_level";
    }
    v268 = v21;
    if (a3) {
      v22 = @"maxZoomLevel";
    }
    else {
      v22 = @"max_zoom_level";
    }
    v23 = @"traffic_trend";
    if (a3) {
      v23 = @"trafficTrend";
    }
    v266 = v23;
    v267 = v22;
    if (a3) {
      v24 = @"durationMin";
    }
    else {
      v24 = @"duration_min";
    }
    v25 = @"alertCCode";
    if (!a3) {
      v25 = @"alert_c_code";
    }
    v264 = v25;
    v265 = v24;
    v26 = @"navigation_alert";
    if (a3) {
      v26 = @"navigationAlert";
    }
    v263 = v26;
    while (1)
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v325 != v300)
        {
          uint64_t v28 = v27;
          objc_enumerationMutation(obj);
          uint64_t v27 = v28;
        }
        uint64_t v310 = v27;
        v29 = *(void **)(*((void *)&v324 + 1) + 8 * v27);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v30 = [GEOTFIncident alloc];
          if (v30)
          {
            id v313 = v29;
            v31 = [(GEOTFIncident *)v30 init];

            if (v31)
            {
              v32 = [v313 objectForKeyedSubscript:@"type"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v33 = v32;
                if ([v33 isEqualToString:@"ROAD_CLOSURE"])
                {
                  int v34 = 3;
                }
                else if ([v33 isEqualToString:@"LANE_CLOSURE"])
                {
                  int v34 = 4;
                }
                else if ([v33 isEqualToString:@"WEATHER"])
                {
                  int v34 = 7;
                }
                else if ([v33 isEqualToString:@"EVENT"])
                {
                  int v34 = 8;
                }
                else if ([v33 isEqualToString:@"ACCIDENT"])
                {
                  int v34 = 9;
                }
                else if ([v33 isEqualToString:@"HAZARD"])
                {
                  int v34 = 10;
                }
                else if ([v33 isEqualToString:@"ROADWORKS"])
                {
                  int v34 = 11;
                }
                else if ([v33 isEqualToString:@"RAMP_CLOSURE"])
                {
                  int v34 = 12;
                }
                else if ([v33 isEqualToString:@"OTHER"])
                {
                  int v34 = 13;
                }
                else if ([v33 isEqualToString:@"TRAFFIC"])
                {
                  int v34 = 14;
                }
                else if ([v33 isEqualToString:@"WALKING_CLOSURE"])
                {
                  int v34 = 15;
                }
                else if ([v33 isEqualToString:@"NO_THOROUGHFARE_CLOSURE"])
                {
                  int v34 = 16;
                }
                else
                {
                  int v34 = 3;
                }

LABEL_91:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x20000u;
                v31->_type = v34;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v34 = [v32 intValue];
                  goto LABEL_91;
                }
              }

              v35 = [v313 objectForKeyedSubscript:@"geoid"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v359 = 0u;
                long long v358 = 0u;
                long long v357 = 0u;
                long long v356 = 0u;
                id v36 = v35;
                uint64_t v37 = [v36 countByEnumeratingWithState:&v356 objects:v361 count:16];
                if (v37)
                {
                  uint64_t v38 = *(void *)v357;
                  do
                  {
                    for (uint64_t j = 0; j != v37; ++j)
                    {
                      if (*(void *)v357 != v38) {
                        objc_enumerationMutation(v36);
                      }
                      v40 = *(void **)(*((void *)&v356 + 1) + 8 * j);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v40 longLongValue];
                        os_unfair_lock_lock(&v31->_readerLock);
                        if ((*((unsigned char *)&v31->_flags + 2) & 0x80) == 0)
                        {
                          reader = v31->_reader;
                          if (reader)
                          {
                            v42 = reader;
                            objc_sync_enter(v42);
                            GEOTFIncidentReadSpecified((uint64_t)v31, (unint64_t)v31->_reader, (int *)&_readGeoids_tags);
                            objc_sync_exit(v42);
                          }
                        }
                        os_unfair_lock_unlock(&v31->_readerLock);
                        PBRepeatedInt64Add();
                        os_unfair_lock_lock_with_options();
                        *(_DWORD *)&v31->_flags |= 0x800000u;
                        os_unfair_lock_unlock(&v31->_readerLock);
                        *(_DWORD *)&v31->_flags |= 0x40000000u;
                      }
                    }
                    uint64_t v37 = [v36 countByEnumeratingWithState:&v356 objects:v361 count:16];
                  }
                  while (v37);
                }
              }
              v307 = [v313 objectForKeyedSubscript:@"info"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v355 = 0u;
                long long v354 = 0u;
                long long v353 = 0u;
                long long v352 = 0u;
                id v43 = v307;
                uint64_t v44 = [v43 countByEnumeratingWithState:&v352 objects:v360 count:16];
                if (v44)
                {
                  uint64_t v45 = *(void *)v353;
                  do
                  {
                    for (uint64_t k = 0; k != v44; ++k)
                    {
                      if (*(void *)v353 != v45) {
                        objc_enumerationMutation(v43);
                      }
                      v47 = *(void **)(*((void *)&v352 + 1) + 8 * k);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v48 = [GEOTFInfo alloc];
                        if (v48)
                        {
                          id v49 = v47;
                          v48 = [(GEOTFInfo *)v48 init];
                          if (v48)
                          {
                            v50 = [v49 objectForKeyedSubscript:@"language"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v51 = (void *)[v50 copy];
                              id v52 = v51;
                              *(unsigned char *)&v48->_flags |= 2u;
                              *(unsigned char *)&v48->_flags |= 4u;
                              objc_storeStrong((id *)&v48->_language, v51);
                            }
                            v53 = [v49 objectForKeyedSubscript:@"comment"];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v54 = (void *)[v53 copy];
                              id v55 = v54;
                              *(unsigned char *)&v48->_flags |= 1u;
                              *(unsigned char *)&v48->_flags |= 4u;
                              objc_storeStrong((id *)&v48->_comment, v54);
                            }
                          }
                        }
                        -[GEOTFIncident addInfo:]((uint64_t)v31, v48);
                      }
                    }
                    uint64_t v44 = [v43 countByEnumeratingWithState:&v352 objects:v360 count:16];
                  }
                  while (v44);
                }
              }
              v56 = [v313 objectForKeyedSubscript:v294];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v57 = (void *)[v56 copy];
                id v58 = v57;
                *(_DWORD *)&v31->_flags |= 0x2000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_incidentId, v57);
              }
              v59 = [v313 objectForKeyedSubscript:@"latitude"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v59 doubleValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 4u;
                v31->_latitude = v60;
              }

              v61 = [v313 objectForKeyedSubscript:@"longitude"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v61 doubleValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 8u;
                v31->_longitude = v62;
              }

              v63 = [v313 objectForKeyedSubscript:v291];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v64 = [v63 longLongValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x20u;
                v31->_startTime = v64;
              }

              v65 = [v313 objectForKeyedSubscript:v288];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v66 = [v65 longLongValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x40u;
                v31->_updateTime = v66;
              }

              v67 = [v313 objectForKeyedSubscript:@"blocked"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v68 = [v67 BOOLValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x40000u;
                v31->_blocked = v68;
              }

              v69 = [v313 objectForKeyedSubscript:@"street"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v70 = (void *)[v69 copy];
                id v71 = v70;
                *(_DWORD *)&v31->_flags |= 0x10000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_street, v70);
              }
              v72 = [v313 objectForKeyedSubscript:v285];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v73 = (void *)[v72 copy];
                id v74 = v73;
                *(_DWORD *)&v31->_flags |= 0x1000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_crossStreet, v73);
              }
              v75 = [v313 objectForKeyedSubscript:v282];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v76 = [v75 unsignedIntValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x400u;
                v31->_laneClosureCount = v76;
              }

              v77 = [v313 objectForKeyedSubscript:v279];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v78 = [v77 BOOLValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x80000u;
                v31->_endTimeReliable = v78;
              }

              v79 = [v313 objectForKeyedSubscript:v276];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v80 = v79;
                if ([v80 isEqualToString:@"LEFT_LANE"])
                {
                  int v81 = 1;
                }
                else if ([v80 isEqualToString:@"CENTER_LANE"])
                {
                  int v81 = 2;
                }
                else if ([v80 isEqualToString:@"RIGHT_LANE"])
                {
                  int v81 = 3;
                }
                else if ([v80 isEqualToString:@"SHOULDER_LANE"])
                {
                  int v81 = 4;
                }
                else if ([v80 isEqualToString:@"CARPOOL_LANE"])
                {
                  int v81 = 5;
                }
                else if ([v80 isEqualToString:@"BUS_LANE"])
                {
                  int v81 = 6;
                }
                else if ([v80 isEqualToString:@"OTHER_LANE"])
                {
                  int v81 = 7;
                }
                else if ([v80 isEqualToString:@"ON_RAMP"])
                {
                  int v81 = 8;
                }
                else if ([v80 isEqualToString:@"OFF_RAMP"])
                {
                  int v81 = 9;
                }
                else
                {
                  int v81 = 1;
                }

LABEL_168:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x800u;
                v31->_laneClosureType = v81;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v81 = [v79 intValue];
                  goto LABEL_168;
                }
              }

              v82 = [v313 objectForKeyedSubscript:v273];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v83 = [v82 BOOLValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x100000u;
                v31->_hardBlocked = v83;
              }

              v84 = [v313 objectForKeyedSubscript:v271];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v84 doubleValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x10u;
                v31->_startOffset = v85;
              }

              v86 = [v313 objectForKeyedSubscript:v269];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v86 doubleValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 2u;
                v31->_endOffset = v87;
              }

              v88 = [v313 objectForKeyedSubscript:@"delay"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v88 floatValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x200u;
                v31->_delay = v89;
              }

              v90 = [v313 objectForKeyedSubscript:@"significance"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v91 = v90;
                if ([v91 isEqualToString:@"UNKNOWN_IMPACT"])
                {
                  int v92 = 0;
                }
                else if ([v91 isEqualToString:@"LOW_IMPACT"])
                {
                  int v92 = 1;
                }
                else if ([v91 isEqualToString:@"MODERATE_LOCAL_IMPACT"])
                {
                  int v92 = 2;
                }
                else if ([v91 isEqualToString:@"HIGH_LOCAL_IMPACT"])
                {
                  int v92 = 3;
                }
                else if ([v91 isEqualToString:@"MODERATE_REGIONAL_IMPACT"])
                {
                  int v92 = 4;
                }
                else if ([v91 isEqualToString:@"WIDE_REGIONAL_IMPACT"])
                {
                  int v92 = 5;
                }
                else
                {
                  int v92 = 0;
                }

LABEL_194:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x4000u;
                v31->_significance = v92;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v92 = [v90 intValue];
                  goto LABEL_194;
                }
              }

              v93 = [v313 objectForKeyedSubscript:v268];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v94 = [v93 unsignedIntValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x2000u;
                v31->_minZoomLevel = v94;
              }

              v95 = [v313 objectForKeyedSubscript:v267];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v96 = [v95 unsignedIntValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x1000u;
                v31->_maxZoomLevel = v96;
              }

              v97 = [v313 objectForKeyedSubscript:@"speed"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v97 floatValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x8000u;
                v31->_speed = v98;
              }

              v99 = [v313 objectForKeyedSubscript:@"hidden"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v100 = [v99 BOOLValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x200000u;
                v31->_hiddeuint64_t n = v100;
              }

              v101 = [v313 objectForKeyedSubscript:v266];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v102 = v101;
                if ([v102 isEqualToString:@"UNKNOWN_TREND"])
                {
                  int v103 = 0;
                }
                else if ([v102 isEqualToString:@"TRAFFIC_EASING"])
                {
                  int v103 = 1;
                }
                else if ([v102 isEqualToString:@"TRAFFIC_BUILDING_UP"])
                {
                  int v103 = 2;
                }
                else if ([v102 isEqualToString:@"TRAFFIC_STABLE"])
                {
                  int v103 = 3;
                }
                else
                {
                  int v103 = 0;
                }

LABEL_216:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x10000u;
                v31->_trafficTrend = v103;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v103 = [v101 intValue];
                  goto LABEL_216;
                }
              }

              v104 = [v313 objectForKeyedSubscript:@"color"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v105 = v104;
                if ([v105 isEqualToString:@"UNKNOWN"])
                {
                  int v106 = 0;
                }
                else if ([v105 isEqualToString:@"BLACK"])
                {
                  int v106 = 1;
                }
                else if ([v105 isEqualToString:@"RED"])
                {
                  int v106 = 2;
                }
                else if ([v105 isEqualToString:@"YELLOW"])
                {
                  int v106 = 3;
                }
                else if ([v105 isEqualToString:@"GREEN"])
                {
                  int v106 = 4;
                }
                else
                {
                  int v106 = 0;
                }

LABEL_232:
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x100u;
                v31->_color = v106;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v106 = [v104 intValue];
                  goto LABEL_232;
                }
              }

              v107 = [v313 objectForKeyedSubscript:v265];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v108 = [v107 unsignedLongLongValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 1u;
                v31->_durationMiuint64_t n = v108;
              }

              v109 = [v313 objectForKeyedSubscript:@"zilch"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v110 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v109 options:0];
                id v111 = v110;
                *(_DWORD *)&v31->_flags |= 0x20000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_zilch, v110);
              }
              v112 = [v313 objectForKeyedSubscript:v264];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v113 = [v112 unsignedIntValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x80u;
                v31->_alertCCode = v113;
              }

              v114 = [v313 objectForKeyedSubscript:v263];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v115 = [v114 BOOLValue];
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                *(_DWORD *)&v31->_flags |= 0x400000u;
                v31->_navigationAlert = v115;
              }

              v116 = [v313 objectForKeyedSubscript:@"openlr"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v117 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v116 options:0];
                id v118 = v117;
                *(_DWORD *)&v31->_flags |= 0x8000000u;
                *(_DWORD *)&v31->_flags |= 0x40000000u;
                objc_storeStrong((id *)&v31->_openlr, v117);
              }
            }
          }
          else
          {
            v31 = 0;
          }
          objc_msgSend(v306, "addIncidents:", v31, v260);
        }
        uint64_t v27 = v310 + 1;
      }
      while (v310 + 1 != v303);
      uint64_t v119 = [obj countByEnumeratingWithState:&v324 objects:v350 count:16];
      uint64_t v303 = v119;
      if (!v119)
      {
LABEL_250:

        break;
      }
    }
  }

  v270 = [v262 objectForKeyedSubscript:@"speeds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_386;
  }
  long long v322 = 0u;
  long long v323 = 0u;
  long long v320 = 0u;
  long long v321 = 0u;
  id v295 = v270;
  uint64_t v301 = [v295 countByEnumeratingWithState:&v320 objects:v349 count:16];
  if (!v301) {
    goto LABEL_385;
  }
  v120 = @"start_offset";
  id obja = *(id *)v321;
  if (a3) {
    v120 = @"startOffset";
  }
  v292 = v120;
  if (a3) {
    v121 = @"endOffset";
  }
  else {
    v121 = @"end_offset";
  }
  v122 = @"predicted_speed";
  if (a3) {
    v122 = @"predictedSpeed";
  }
  v286 = v122;
  v289 = v121;
  v123 = @"delta_minutes_in_future";
  if (a3) {
    v123 = @"deltaMinutesInFuture";
  }
  v314 = v123;
  if (a3) {
    v124 = @"speedKph";
  }
  else {
    v124 = @"speed_kph";
  }
  v125 = @"decayTimeWindowInMinutes";
  if (!a3) {
    v125 = @"decay_time_window_in_minutes";
  }
  v280 = v125;
  v283 = v124;
  v126 = @"latitude_coordinates";
  if (a3) {
    v126 = @"latitudeCoordinates";
  }
  v277 = v126;
  if (a3) {
    v127 = @"longitudeCoordinates";
  }
  else {
    v127 = @"longitude_coordinates";
  }
  v274 = v127;
  v128 = @"geo_ids";
  if (a3) {
    v128 = @"geoIds";
  }
  v272 = v128;
  do
  {
    uint64_t v129 = 0;
    do
    {
      if (*(id *)v321 != obja)
      {
        uint64_t v130 = v129;
        objc_enumerationMutation(v295);
        uint64_t v129 = v130;
      }
      uint64_t v308 = v129;
      v131 = *(void **)(*((void *)&v320 + 1) + 8 * v129);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v132 = [GEOTFRoadSpeed alloc];
        if (v132)
        {
          id v311 = v131;
          uint64_t v133 = [(GEOTFRoadSpeed *)v132 init];
          if (v133)
          {
            v134 = [v311 objectForKeyedSubscript:@"geoid"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v135 = [v134 longLongValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(void *)(v133 + 88) = v135;
            }

            v136 = [v311 objectForKeyedSubscript:v292];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v136 floatValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 0x20u;
              *(_DWORD *)(v133 + 152) = v137;
            }

            v138 = [v311 objectForKeyedSubscript:v289];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v138 floatValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 8u;
              *(_DWORD *)(v133 + 144) = v139;
            }

            v140 = [v311 objectForKeyedSubscript:@"hidden"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v141 = [v140 BOOLValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 0x40u;
              *(unsigned char *)(v133 + 156) = v141;
            }

            v304 = [v311 objectForKeyedSubscript:v286];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v346 = 0u;
              long long v347 = 0u;
              long long v344 = 0u;
              long long v345 = 0u;
              id v142 = v304;
              uint64_t v143 = [v142 countByEnumeratingWithState:&v344 objects:v361 count:16];
              if (v143)
              {
                uint64_t v144 = *(void *)v345;
                do
                {
                  uint64_t v145 = 0;
                  do
                  {
                    if (*(void *)v345 != v144) {
                      objc_enumerationMutation(v142);
                    }
                    v146 = *(void **)(*((void *)&v344 + 1) + 8 * v145);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v147 = [GEOTFPredictedSpeed alloc];
                      if (v147)
                      {
                        id v148 = v146;
                        uint64_t v149 = [(GEOTFPredictedSpeed *)v147 init];
                        if (v149)
                        {
                          v150 = [v148 objectForKeyedSubscript:v314];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            int v151 = [v150 unsignedIntValue];
                            *(unsigned char *)(v149 + 16) |= 1u;
                            *(_DWORD *)(v149 + 8) = v151;
                          }

                          v152 = [v148 objectForKeyedSubscript:@"speed"];
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            int v153 = [v152 unsignedIntValue];
                            *(unsigned char *)(v149 + 16) |= 2u;
                            *(_DWORD *)(v149 + 12) = v153;
                          }
                        }
                      }
                      else
                      {
                        uint64_t v149 = 0;
                      }
                      -[GEOTFRoadSpeed addPredictedSpeed:](v133, (void *)v149);
                    }
                    ++v145;
                  }
                  while (v143 != v145);
                  uint64_t v154 = [v142 countByEnumeratingWithState:&v344 objects:v361 count:16];
                  uint64_t v143 = v154;
                }
                while (v154);
              }
            }
            v155 = [v311 objectForKeyedSubscript:@"color"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v156 = v155;
              if ([v156 isEqualToString:@"UNKNOWN"])
              {
                int v157 = 0;
              }
              else if ([v156 isEqualToString:@"BLACK"])
              {
                int v157 = 1;
              }
              else if ([v156 isEqualToString:@"RED"])
              {
                int v157 = 2;
              }
              else if ([v156 isEqualToString:@"YELLOW"])
              {
                int v157 = 3;
              }
              else if ([v156 isEqualToString:@"GREEN"])
              {
                int v157 = 4;
              }
              else
              {
                int v157 = 0;
              }

LABEL_325:
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 1u;
              *(_DWORD *)(v133 + 132) = v157;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v157 = [v155 intValue];
                goto LABEL_325;
              }
            }

            v158 = [v311 objectForKeyedSubscript:v283];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v159 = [v158 unsignedIntValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 0x10u;
              *(_DWORD *)(v133 + 148) = v159;
            }

            v160 = [v311 objectForKeyedSubscript:@"zilch"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v161 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v160 options:0];
              id v162 = v161;
              *(_WORD *)(v133 + 160) |= 0x1000u;
              *(_WORD *)(v133 + 160) |= 0x2000u;
              objc_storeStrong((id *)(v133 + 112), v161);
            }
            v163 = [v311 objectForKeyedSubscript:v280];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v164 = [v163 unsignedIntValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 4u;
              *(_DWORD *)(v133 + 140) = v164;
            }

            v165 = [v311 objectForKeyedSubscript:@"confidence"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v165 floatValue];
              *(_WORD *)(v133 + 160) |= 0x2000u;
              *(_WORD *)(v133 + 160) |= 2u;
              *(_DWORD *)(v133 + 136) = v166;
            }

            v167 = [v311 objectForKeyedSubscript:v277];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v342 = 0u;
              long long v343 = 0u;
              long long v340 = 0u;
              long long v341 = 0u;
              id v168 = v167;
              uint64_t v169 = [v168 countByEnumeratingWithState:&v340 objects:v360 count:16];
              if (v169)
              {
                uint64_t v170 = *(void *)v341;
                do
                {
                  for (uint64_t m = 0; m != v169; ++m)
                  {
                    if (*(void *)v341 != v170) {
                      objc_enumerationMutation(v168);
                    }
                    v172 = *(void **)(*((void *)&v340 + 1) + 8 * m);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v172 floatValue];
                      os_unfair_lock_lock((os_unfair_lock_t)(v133 + 128));
                      if ((*(_WORD *)(v133 + 160) & 0x100) == 0)
                      {
                        v173 = *(void **)(v133 + 8);
                        if (v173)
                        {
                          id v174 = v173;
                          objc_sync_enter(v174);
                          GEOTFRoadSpeedReadSpecified(v133, *(void *)(v133 + 8), (int *)&_readLatitudeCoordinates_tags);
                          objc_sync_exit(v174);
                        }
                      }
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      PBRepeatedFloatAdd();
                      os_unfair_lock_lock_with_options();
                      *(_WORD *)(v133 + 160) |= 0x100u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      *(_WORD *)(v133 + 160) |= 0x2000u;
                    }
                  }
                  uint64_t v169 = [v168 countByEnumeratingWithState:&v340 objects:v360 count:16];
                }
                while (v169);
              }
            }
            v175 = [v311 objectForKeyedSubscript:v274];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v338 = 0u;
              long long v339 = 0u;
              long long v336 = 0u;
              long long v337 = 0u;
              id v176 = v175;
              uint64_t v177 = [v176 countByEnumeratingWithState:&v336 objects:&v356 count:16];
              if (v177)
              {
                uint64_t v178 = *(void *)v337;
                do
                {
                  for (uint64_t n = 0; n != v177; ++n)
                  {
                    if (*(void *)v337 != v178) {
                      objc_enumerationMutation(v176);
                    }
                    v180 = *(void **)(*((void *)&v336 + 1) + 8 * n);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v180 floatValue];
                      os_unfair_lock_lock((os_unfair_lock_t)(v133 + 128));
                      if ((*(_WORD *)(v133 + 160) & 0x200) == 0)
                      {
                        v181 = *(void **)(v133 + 8);
                        if (v181)
                        {
                          id v182 = v181;
                          objc_sync_enter(v182);
                          GEOTFRoadSpeedReadSpecified(v133, *(void *)(v133 + 8), (int *)&_readLongitudeCoordinates_tags);
                          objc_sync_exit(v182);
                        }
                      }
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      PBRepeatedFloatAdd();
                      os_unfair_lock_lock_with_options();
                      *(_WORD *)(v133 + 160) |= 0x200u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      *(_WORD *)(v133 + 160) |= 0x2000u;
                    }
                  }
                  uint64_t v177 = [v176 countByEnumeratingWithState:&v336 objects:&v356 count:16];
                }
                while (v177);
              }
            }
            v183 = [v311 objectForKeyedSubscript:v272];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v334 = 0u;
              long long v335 = 0u;
              long long v332 = 0u;
              long long v333 = 0u;
              id v184 = v183;
              uint64_t v185 = [v184 countByEnumeratingWithState:&v332 objects:&v352 count:16];
              if (v185)
              {
                uint64_t v186 = *(void *)v333;
                do
                {
                  for (iuint64_t i = 0; ii != v185; ++ii)
                  {
                    if (*(void *)v333 != v186) {
                      objc_enumerationMutation(v184);
                    }
                    v188 = *(void **)(*((void *)&v332 + 1) + 8 * ii);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v188 longLongValue];
                      os_unfair_lock_lock((os_unfair_lock_t)(v133 + 128));
                      if ((*(_WORD *)(v133 + 160) & 0x80) == 0)
                      {
                        v189 = *(void **)(v133 + 8);
                        if (v189)
                        {
                          id v190 = v189;
                          objc_sync_enter(v190);
                          GEOTFRoadSpeedReadSpecified(v133, *(void *)(v133 + 8), (int *)&_readGeoIds_tags_313);
                          objc_sync_exit(v190);
                        }
                      }
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      PBRepeatedInt64Add();
                      os_unfair_lock_lock_with_options();
                      *(_WORD *)(v133 + 160) |= 0x80u;
                      os_unfair_lock_unlock((os_unfair_lock_t)(v133 + 128));
                      *(_WORD *)(v133 + 160) |= 0x2000u;
                    }
                  }
                  uint64_t v185 = [v184 countByEnumeratingWithState:&v332 objects:&v352 count:16];
                }
                while (v185);
              }
            }
            v191 = [v311 objectForKeyedSubscript:@"openlr"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v192 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v191 options:0];
              id v193 = v192;
              *(_WORD *)(v133 + 160) |= 0x400u;
              *(_WORD *)(v133 + 160) |= 0x2000u;
              objc_storeStrong((id *)(v133 + 96), v192);
            }
          }
        }
        else
        {
          uint64_t v133 = 0;
        }
        objc_msgSend(v306, "addSpeeds:", v133, v260);
      }
      uint64_t v129 = v308 + 1;
    }
    while (v308 + 1 != v301);
    uint64_t v194 = [v295 countByEnumeratingWithState:&v320 objects:v349 count:16];
    uint64_t v301 = v194;
  }
  while (v194);
LABEL_385:

LABEL_386:
  if (a3) {
    v195 = @"feedUpdateTime";
  }
  else {
    v195 = @"feed_update_time";
  }
  v196 = objc_msgSend(v262, "objectForKeyedSubscript:", v195, v260);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v306, "setFeedUpdateTime:", objc_msgSend(v196, "longLongValue"));
  }

  if (a3) {
    v197 = @"feedId";
  }
  else {
    v197 = @"feed_id";
  }
  v198 = [v262 objectForKeyedSubscript:v197];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v199 = (void *)[v198 copy];
    [v306 setFeedId:v199];
  }
  if (a3) {
    v200 = @"trafficVersion";
  }
  else {
    v200 = @"traffic_version";
  }
  v201 = [v262 objectForKeyedSubscript:v200];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v306, "setTrafficVersion:", objc_msgSend(v201, "unsignedIntValue"));
  }

  if (a3) {
    v202 = @"feedPublishTime";
  }
  else {
    v202 = @"feed_publish_time";
  }
  v203 = [v262 objectForKeyedSubscript:v202];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v306, "setFeedPublishTime:", objc_msgSend(v203, "unsignedLongLongValue"));
  }

  v275 = [v262 objectForKeyedSubscript:@"compactSpeeds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v318 = 0u;
    long long v319 = 0u;
    long long v316 = 0u;
    long long v317 = 0u;
    id v293 = v275;
    id objb = (id)[v293 countByEnumeratingWithState:&v316 objects:v348 count:16];
    if (!objb) {
      goto LABEL_504;
    }
    id v296 = *(id *)v317;
    if (a3) {
      v204 = @"geoIds";
    }
    else {
      v204 = @"geo_ids";
    }
    v205 = @"start_offset";
    if (a3) {
      v205 = @"startOffset";
    }
    v287 = v205;
    v290 = v204;
    if (a3) {
      v206 = @"endOffset";
    }
    else {
      v206 = @"end_offset";
    }
    v207 = @"predictedSpeed";
    if (!a3) {
      v207 = @"predicted_speed";
    }
    v281 = v207;
    v284 = v206;
    v208 = @"delta_minutes_in_future";
    if (a3) {
      v208 = @"deltaMinutesInFuture";
    }
    v312 = v208;
    if (a3) {
      v209 = @"speedKph";
    }
    else {
      v209 = @"speed_kph";
    }
    v315 = v209;
    v210 = @"decay_time_window_in_minutes";
    if (a3) {
      v210 = @"decayTimeWindowInMinutes";
    }
    v278 = v210;
    while (1)
    {
      uint64_t v211 = 0;
      do
      {
        if (*(id *)v317 != v296)
        {
          uint64_t v212 = v211;
          objc_enumerationMutation(v293);
          uint64_t v211 = v212;
        }
        uint64_t v305 = v211;
        v213 = *(void **)(*((void *)&v316 + 1) + 8 * v211);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v214 = [GEOTFCompactRoadSpeeds alloc];
          if (v214)
          {
            id v309 = v213;
            uint64_t v215 = [(GEOTFCompactRoadSpeeds *)v214 init];
            if (v215)
            {
              v216 = [v309 objectForKeyedSubscript:v290];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v359 = 0u;
                long long v358 = 0u;
                long long v357 = 0u;
                long long v356 = 0u;
                id v217 = v216;
                uint64_t v218 = [v217 countByEnumeratingWithState:&v356 objects:v361 count:16];
                if (v218)
                {
                  uint64_t v219 = *(void *)v357;
                  do
                  {
                    for (juint64_t j = 0; jj != v218; ++jj)
                    {
                      if (*(void *)v357 != v219) {
                        objc_enumerationMutation(v217);
                      }
                      v221 = *(void **)(*((void *)&v356 + 1) + 8 * jj);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v221 longLongValue];
                        os_unfair_lock_lock((os_unfair_lock_t)(v215 + 64));
                        if ((*(_WORD *)(v215 + 96) & 0x80) == 0)
                        {
                          v222 = *(void **)(v215 + 8);
                          if (v222)
                          {
                            id v223 = v222;
                            objc_sync_enter(v223);
                            GEOTFCompactRoadSpeedsReadSpecified(v215, *(void *)(v215 + 8), (int *)&_readGeoIds_tags);
                            objc_sync_exit(v223);
                          }
                        }
                        os_unfair_lock_unlock((os_unfair_lock_t)(v215 + 64));
                        PBRepeatedInt64Add();
                        os_unfair_lock_lock_with_options();
                        *(_WORD *)(v215 + 96) |= 0x80u;
                        os_unfair_lock_unlock((os_unfair_lock_t)(v215 + 64));
                        *(_WORD *)(v215 + 96) |= 0x400u;
                      }
                    }
                    uint64_t v218 = [v217 countByEnumeratingWithState:&v356 objects:v361 count:16];
                  }
                  while (v218);
                }
              }
              v224 = [v309 objectForKeyedSubscript:v287];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v224 floatValue];
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 0x20u;
                *(_DWORD *)(v215 + 88) = v225;
              }

              v226 = [v309 objectForKeyedSubscript:v284];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v226 floatValue];
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 8u;
                *(_DWORD *)(v215 + 80) = v227;
              }

              v228 = [v309 objectForKeyedSubscript:@"hidden"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v229 = [v228 BOOLValue];
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 0x40u;
                *(unsigned char *)(v215 + 92) = v229;
              }

              v302 = [v309 objectForKeyedSubscript:v281];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v355 = 0u;
                long long v354 = 0u;
                long long v353 = 0u;
                long long v352 = 0u;
                id v230 = v302;
                uint64_t v231 = [v230 countByEnumeratingWithState:&v352 objects:v360 count:16];
                if (v231)
                {
                  uint64_t v232 = *(void *)v353;
                  do
                  {
                    uint64_t v233 = 0;
                    do
                    {
                      if (*(void *)v353 != v232) {
                        objc_enumerationMutation(v230);
                      }
                      v234 = *(void **)(*((void *)&v352 + 1) + 8 * v233);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v235 = [GEOTFCompactPredictedSpeed alloc];
                        if (v235)
                        {
                          id v236 = v234;
                          uint64_t v237 = [(GEOTFCompactPredictedSpeed *)v235 init];
                          if (v237)
                          {
                            v238 = [v236 objectForKeyedSubscript:v312];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              int v239 = [v238 unsignedIntValue];
                              *(unsigned char *)(v237 + 16) |= 1u;
                              *(_DWORD *)(v237 + 8) = v239;
                            }

                            v240 = [v236 objectForKeyedSubscript:v315];
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              int v241 = [v240 unsignedIntValue];
                              *(unsigned char *)(v237 + 16) |= 2u;
                              *(_DWORD *)(v237 + 12) = v241;
                            }
                          }
                        }
                        else
                        {
                          uint64_t v237 = 0;
                        }
                        -[GEOTFCompactRoadSpeeds addPredictedSpeed:](v215, (void *)v237);
                      }
                      ++v233;
                    }
                    while (v231 != v233);
                    uint64_t v242 = [v230 countByEnumeratingWithState:&v352 objects:v360 count:16];
                    uint64_t v231 = v242;
                  }
                  while (v242);
                }
              }
              v243 = [v309 objectForKeyedSubscript:@"color"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v244 = v243;
                if ([v244 isEqualToString:@"UNKNOWN"])
                {
                  int v245 = 0;
                }
                else if ([v244 isEqualToString:@"BLACK"])
                {
                  int v245 = 1;
                }
                else if ([v244 isEqualToString:@"RED"])
                {
                  int v245 = 2;
                }
                else if ([v244 isEqualToString:@"YELLOW"])
                {
                  int v245 = 3;
                }
                else if ([v244 isEqualToString:@"GREEN"])
                {
                  int v245 = 4;
                }
                else
                {
                  int v245 = 0;
                }

LABEL_488:
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 1u;
                *(_DWORD *)(v215 + 68) = v245;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v245 = [v243 intValue];
                  goto LABEL_488;
                }
              }

              v246 = [v309 objectForKeyedSubscript:v315];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v247 = [v246 unsignedIntValue];
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 0x10u;
                *(_DWORD *)(v215 + 84) = v247;
              }

              v248 = [v309 objectForKeyedSubscript:v278];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v249 = [v248 unsignedIntValue];
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 4u;
                *(_DWORD *)(v215 + 76) = v249;
              }

              v250 = [v309 objectForKeyedSubscript:@"confidence"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v250 floatValue];
                *(_WORD *)(v215 + 96) |= 0x400u;
                *(_WORD *)(v215 + 96) |= 2u;
                *(_DWORD *)(v215 + 72) = v251;
              }

              v252 = [v309 objectForKeyedSubscript:@"openlr"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v253 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v252 options:0];
                id v254 = v253;
                *(_WORD *)(v215 + 96) |= 0x100u;
                *(_WORD *)(v215 + 96) |= 0x400u;
                objc_storeStrong((id *)(v215 + 40), v253);
              }
            }
          }
          else
          {
            uint64_t v215 = 0;
          }
          [v306 addCompactSpeeds:v215];
        }
        uint64_t v211 = v305 + 1;
      }
      while ((id)(v305 + 1) != objb);
      uint64_t v255 = [v293 countByEnumeratingWithState:&v316 objects:v348 count:16];
      id objb = (id)v255;
      if (!v255)
      {
LABEL_504:

        break;
      }
    }
  }

  if (a3) {
    v256 = @"snapshotId";
  }
  else {
    v256 = @"snapshot_id";
  }
  v257 = [v262 objectForKeyedSubscript:v256];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v258 = (void *)[v257 copy];
    [v306 setSnapshotId:v258];
  }
LABEL_512:

  return v306;
}

- (GEOTFTrafficSnapshot)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTFTrafficSnapshot;
  id v3 = [(GEOTFTrafficSnapshot *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)regions
{
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  regions = self->_regions;

  return regions;
}

- (void)setRegions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  regions = self->_regions;
  self->_regions = v4;
}

- (void)clearRegions
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  regions = self->_regions;

  [(NSMutableArray *)regions removeAllObjects];
}

- (void)addRegion:(id)a3
{
  id v4 = a3;
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsRegion:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsRegion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      id v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)regionsCount
{
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  regions = self->_regions;

  return [(NSMutableArray *)regions count];
}

- (id)regionAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readRegions]((uint64_t)self);
  regions = self->_regions;

  return (id)[(NSMutableArray *)regions objectAtIndex:a3];
}

+ (Class)regionType
{
  return (Class)objc_opt_class();
}

- (void)_readIncidents
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIncidents_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)incidents
{
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  incidents = self->_incidents;

  return incidents;
}

- (void)setIncidents:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  incidents = self->_incidents;
  self->_incidents = v4;
}

- (void)clearIncidents
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  incidents = self->_incidents;

  [(NSMutableArray *)incidents removeAllObjects];
}

- (void)addIncidents:(id)a3
{
  id v4 = a3;
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsIncidents:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (unint64_t)incidentsCount
{
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  incidents = self->_incidents;

  return [(NSMutableArray *)incidents count];
}

- (id)incidentsAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readIncidents]((uint64_t)self);
  incidents = self->_incidents;

  return (id)[(NSMutableArray *)incidents objectAtIndex:a3];
}

+ (Class)incidentsType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)speeds
{
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  speeds = self->_speeds;

  return speeds;
}

- (void)setSpeeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  speeds = self->_speeds;
  self->_speeds = v4;
}

- (void)clearSpeeds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  speeds = self->_speeds;

  [(NSMutableArray *)speeds removeAllObjects];
}

- (void)addSpeeds:(id)a3
{
  id v4 = a3;
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsSpeeds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsSpeeds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)speedsCount
{
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  speeds = self->_speeds;

  return [(NSMutableArray *)speeds count];
}

- (id)speedsAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readSpeeds]((uint64_t)self);
  speeds = self->_speeds;

  return (id)[(NSMutableArray *)speeds objectAtIndex:a3];
}

+ (Class)speedsType
{
  return (Class)objc_opt_class();
}

- (int64_t)feedUpdateTime
{
  return self->_feedUpdateTime;
}

- (void)setFeedUpdateTime:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_feedUpdateTime = a3;
}

- (void)setHasFeedUpdateTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 514;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasFeedUpdateTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readFeedId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeedId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (NSString)feedId
{
  -[GEOTFTrafficSnapshot _readFeedId]((uint64_t)self);
  feedId = self->_feedId;

  return feedId;
}

- (void)setFeedId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (unsigned)trafficVersion
{
  return self->_trafficVersion;
}

- (void)setTrafficVersion:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_trafficVersiouint64_t n = a3;
}

- (void)setHasTrafficVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 516;
  }
  else {
    __int16 v3 = 512;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasTrafficVersion
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)feedPublishTime
{
  return self->_feedPublishTime;
}

- (void)setFeedPublishTime:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_feedPublishTime = a3;
}

- (void)setHasFeedPublishTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasFeedPublishTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readCompactSpeeds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCompactSpeeds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)compactSpeeds
{
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  compactSpeeds = self->_compactSpeeds;

  return compactSpeeds;
}

- (void)setCompactSpeeds:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  compactSpeeds = self->_compactSpeeds;
  self->_compactSpeeds = v4;
}

- (void)clearCompactSpeeds
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  compactSpeeds = self->_compactSpeeds;

  [(NSMutableArray *)compactSpeeds removeAllObjects];
}

- (void)addCompactSpeeds:(id)a3
{
  id v4 = a3;
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  -[GEOTFTrafficSnapshot _addNoFlagsCompactSpeeds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsCompactSpeeds:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)compactSpeedsCount
{
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  compactSpeeds = self->_compactSpeeds;

  return [(NSMutableArray *)compactSpeeds count];
}

- (id)compactSpeedsAtIndex:(unint64_t)a3
{
  -[GEOTFTrafficSnapshot _readCompactSpeeds]((uint64_t)self);
  compactSpeeds = self->_compactSpeeds;

  return (id)[(NSMutableArray *)compactSpeeds objectAtIndex:a3];
}

+ (Class)compactSpeedsType
{
  return (Class)objc_opt_class();
}

- (void)_readSnapshotId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTFTrafficSnapshotReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSnapshotId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasSnapshotId
{
  return self->_snapshotId != 0;
}

- (NSString)snapshotId
{
  -[GEOTFTrafficSnapshot _readSnapshotId]((uint64_t)self);
  snapshotId = self->_snapshotId;

  return snapshotId;
}

- (void)setSnapshotId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_snapshotId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTFTrafficSnapshot;
  id v4 = [(GEOTFTrafficSnapshot *)&v8 description];
  id v5 = [(GEOTFTrafficSnapshot *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFTrafficSnapshot _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 56))
    {
      id v5 = [(id)a1 regions];
      [v4 setObject:v5 forKey:@"region"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v51 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = [v12 dictionaryRepresentation];
            }
            [v6 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v9);
      }

      [v4 setObject:v6 forKey:@"incidents"];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v15 = *(id *)(a1 + 72);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v47 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v14 addObject:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v17);
      }

      [v4 setObject:v14 forKey:@"speeds"];
    }
    if ((*(_WORD *)(a1 + 96) & 2) != 0)
    {
      v22 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
      if (a2) {
        v23 = @"feedUpdateTime";
      }
      else {
        v23 = @"feed_update_time";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [(id)a1 feedId];
    if (v24)
    {
      if (a2) {
        v25 = @"feedId";
      }
      else {
        v25 = @"feed_id";
      }
      [v4 setObject:v24 forKey:v25];
    }

    __int16 v26 = *(_WORD *)(a1 + 96);
    if ((v26 & 4) != 0)
    {
      uint64_t v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        uint64_t v28 = @"trafficVersion";
      }
      else {
        uint64_t v28 = @"traffic_version";
      }
      [v4 setObject:v27 forKey:v28];

      __int16 v26 = *(_WORD *)(a1 + 96);
    }
    if (v26)
    {
      v29 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v30 = @"feedPublishTime";
      }
      else {
        v30 = @"feed_publish_time";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v32 = *(id *)(a1 + 16);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v43;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v43 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void **)(*((void *)&v42 + 1) + 8 * k);
            if (a2) {
              [v37 jsonRepresentation];
            }
            else {
            uint64_t v38 = objc_msgSend(v37, "dictionaryRepresentation", (void)v42);
            }
            objc_msgSend(v31, "addObject:", v38, (void)v42);
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v54 count:16];
        }
        while (v34);
      }

      [v4 setObject:v31 forKey:@"compactSpeeds"];
    }
    v39 = objc_msgSend((id)a1, "snapshotId", (void)v42);
    if (v39)
    {
      if (a2) {
        v40 = @"snapshotId";
      }
      else {
        v40 = @"snapshot_id";
      }
      [v4 setObject:v39 forKey:v40];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTFTrafficSnapshot _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTFTrafficSnapshot)initWithDictionary:(id)a3
{
  return (GEOTFTrafficSnapshot *)-[GEOTFTrafficSnapshot _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOTFTrafficSnapshot)initWithJSON:(id)a3
{
  return (GEOTFTrafficSnapshot *)-[GEOTFTrafficSnapshot _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_388;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_389;
    }
    GEOTFTrafficSnapshotReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTFTrafficSnapshotCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTFTrafficSnapshotIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFTrafficSnapshotReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTFTrafficSnapshotIsDirty((uint64_t)self) & 1) == 0)
  {
    v23 = self->_reader;
    objc_sync_enter(v23);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v24 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v24];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTFTrafficSnapshot *)self readAll:0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v6 = self->_regions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v7);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v10 = self->_incidents;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v11);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = self->_speeds;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v42 count:16];
      }
      while (v15);
    }

    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt64Field();
    }
    if (self->_feedId) {
      PBDataWriterWriteStringField();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v19 = self->_compactSpeeds;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t m = 0; m != v20; ++m)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v19);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v41 count:16];
      }
      while (v20);
    }

    if (self->_snapshotId) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v22 = (id *)a3;
  [(GEOTFTrafficSnapshot *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v22 + 1, self->_reader);
  *((_DWORD *)v22 + 20) = self->_readerMarkPos;
  *((_DWORD *)v22 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTFTrafficSnapshot *)self regionsCount])
  {
    [v22 clearRegions];
    unint64_t v4 = [(GEOTFTrafficSnapshot *)self regionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTFTrafficSnapshot *)self regionAtIndex:i];
        [v22 addRegion:v7];
      }
    }
  }
  if ([(GEOTFTrafficSnapshot *)self incidentsCount])
  {
    [v22 clearIncidents];
    unint64_t v8 = [(GEOTFTrafficSnapshot *)self incidentsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTFTrafficSnapshot *)self incidentsAtIndex:j];
        [v22 addIncidents:v11];
      }
    }
  }
  if ([(GEOTFTrafficSnapshot *)self speedsCount])
  {
    [v22 clearSpeeds];
    unint64_t v12 = [(GEOTFTrafficSnapshot *)self speedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOTFTrafficSnapshot *)self speedsAtIndex:k];
        [v22 addSpeeds:v15];
      }
    }
  }
  uint64_t v16 = v22;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v22[5] = self->_feedUpdateTime;
    *((_WORD *)v22 + 48) |= 2u;
  }
  if (self->_feedId)
  {
    objc_msgSend(v22, "setFeedId:");
    uint64_t v16 = v22;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v16 + 23) = self->_trafficVersion;
    *((_WORD *)v16 + 48) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    v16[4] = self->_feedPublishTime;
    *((_WORD *)v16 + 48) |= 1u;
  }
  if ([(GEOTFTrafficSnapshot *)self compactSpeedsCount])
  {
    [v22 clearCompactSpeeds];
    unint64_t v18 = [(GEOTFTrafficSnapshot *)self compactSpeedsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(GEOTFTrafficSnapshot *)self compactSpeedsAtIndex:m];
        [v22 addCompactSpeeds:v21];
      }
    }
  }
  if (self->_snapshotId) {
    objc_msgSend(v22, "setSnapshotId:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTFTrafficSnapshotReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_40;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTFTrafficSnapshot *)self readAll:0];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v9 = self->_regions;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addRegion:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v10);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v14 = self->_incidents;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addIncidents:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v15);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  unint64_t v19 = self->_speeds;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSpeeds:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v20);
  }

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_feedUpdateTime;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  uint64_t v24 = [(NSString *)self->_feedId copyWithZone:a3];
  long long v25 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v24;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_trafficVersion;
    *(_WORD *)(v5 + 96) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 32) = self->_feedPublishTime;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v27 = self->_compactSpeeds;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v27);
        }
        long long v31 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * m), "copyWithZone:", a3, (void)v34);
        [(id)v5 addCompactSpeeds:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v28);
  }

  uint64_t v32 = [(NSString *)self->_snapshotId copyWithZone:a3];
  id v8 = *(id *)(v5 + 64);
  *(void *)(v5 + 64) = v32;
LABEL_40:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  [(GEOTFTrafficSnapshot *)self readAll:1];
  [v4 readAll:1];
  regions = self->_regions;
  if ((unint64_t)regions | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](regions, "isEqual:")) {
      goto LABEL_30;
    }
  }
  incidents = self->_incidents;
  if ((unint64_t)incidents | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](incidents, "isEqual:")) {
      goto LABEL_30;
    }
  }
  speeds = self->_speeds;
  if ((unint64_t)speeds | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](speeds, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 48);
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_feedUpdateTime != *((void *)v4 + 5)) {
      goto LABEL_30;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_30;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
    {
LABEL_30:
      char v13 = 0;
      goto LABEL_31;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 48);
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_trafficVersion != *((_DWORD *)v4 + 23)) {
      goto LABEL_30;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_30;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_feedPublishTime != *((void *)v4 + 4)) {
      goto LABEL_30;
    }
  }
  else if (v9)
  {
    goto LABEL_30;
  }
  compactSpeeds = self->_compactSpeeds;
  if ((unint64_t)compactSpeeds | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](compactSpeeds, "isEqual:"))
  {
    goto LABEL_30;
  }
  snapshotId = self->_snapshotId;
  if ((unint64_t)snapshotId | *((void *)v4 + 8)) {
    char v13 = -[NSString isEqual:](snapshotId, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_31:

  return v13;
}

- (unint64_t)hash
{
  [(GEOTFTrafficSnapshot *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_regions hash];
  uint64_t v4 = [(NSMutableArray *)self->_incidents hash];
  uint64_t v5 = [(NSMutableArray *)self->_speeds hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_feedUpdateTime;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_feedId hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_trafficVersion;
    if (flags) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v10 = 2654435761u * self->_feedPublishTime;
LABEL_9:
  uint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_compactSpeeds hash];
  return v11 ^ [(NSString *)self->_snapshotId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTFTrafficSnapshot *)self addRegion:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = *((id *)v4 + 6);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOTFTrafficSnapshot *)self addIncidents:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = *((id *)v4 + 9);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOTFTrafficSnapshot *)self addSpeeds:*(void *)(*((void *)&v30 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }

  if ((*((_WORD *)v4 + 48) & 2) != 0)
  {
    self->_feedUpdateTime = *((void *)v4 + 5);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 3)) {
    -[GEOTFTrafficSnapshot setFeedId:](self, "setFeedId:");
  }
  __int16 v20 = *((_WORD *)v4 + 48);
  if ((v20 & 4) != 0)
  {
    self->_trafficVersiouint64_t n = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v20 = *((_WORD *)v4 + 48);
  }
  if (v20)
  {
    self->_feedPublishTime = *((void *)v4 + 4);
    *(_WORD *)&self->_flags |= 1u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = *((id *)v4 + 2);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[GEOTFTrafficSnapshot addCompactSpeeds:](self, "addCompactSpeeds:", *(void *)(*((void *)&v26 + 1) + 8 * m), (void)v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }

  if (*((void *)v4 + 8)) {
    -[GEOTFTrafficSnapshot setSnapshotId:](self, "setSnapshotId:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speeds, 0);
  objc_storeStrong((id *)&self->_snapshotId, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_compactSpeeds, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end