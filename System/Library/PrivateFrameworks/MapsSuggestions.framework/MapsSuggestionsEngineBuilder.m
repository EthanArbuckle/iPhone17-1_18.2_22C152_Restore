@interface MapsSuggestionsEngineBuilder
+ (id)forDevice;
+ (id)simpleStrategy;
- (BOOL)hasTracker;
- (MapsSuggestionsEngineBuilder)init;
- (MapsSuggestionsFullResourceDepot)resourceDepot;
- (MapsSuggestionsLocationUpdater)locationUpdater;
- (MapsSuggestionsStrategy)strategy;
- (NSMutableArray)excludeDedupers;
- (NSMutableArray)excludeImprovers;
- (NSMutableArray)includeDedupers;
- (NSMutableArray)includeImprovers;
- (NSMutableArray)sourceClasses;
- (NSMutableDictionary)titleFormatters;
- (NSMutableSet)excludePostFilters;
- (NSMutableSet)excludePreFilters;
- (NSMutableSet)includePostFilters;
- (NSMutableSet)includePreFilters;
- (NSString)uniqueName;
- (id)build;
- (id)withDedupers:(id)a3;
- (id)withFavorites;
- (id)withImprovers:(id)a3;
- (id)withLocationUpdater:(id)a3;
- (id)withPostFilters:(id)a3;
- (id)withPreFilters:(id)a3;
- (id)withResourceDepot:(id)a3;
- (id)withSourceClasses:(id)a3;
- (id)withTitleFormatter:(id)a3 forType:(int64_t)a4;
- (id)withoutPreFilters:(id)a3;
- (id)withoutTracker;
- (void)setExcludeDedupers:(id)a3;
- (void)setExcludeImprovers:(id)a3;
- (void)setExcludePostFilters:(id)a3;
- (void)setExcludePreFilters:(id)a3;
- (void)setHasTracker:(BOOL)a3;
- (void)setIncludeDedupers:(id)a3;
- (void)setIncludeImprovers:(id)a3;
- (void)setIncludePostFilters:(id)a3;
- (void)setIncludePreFilters:(id)a3;
- (void)setLocationUpdater:(id)a3;
- (void)setResourceDepot:(id)a3;
- (void)setSourceClasses:(id)a3;
- (void)setStrategy:(id)a3;
- (void)setTitleFormatters:(id)a3;
@end

@implementation MapsSuggestionsEngineBuilder

- (id)build
{
  uint64_t v212 = *MEMORY[0x1E4F143B8];
  GEOFindOrCreateLog();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(MapsSuggestionsEngineBuilder *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "MapsSuggestionsEngineBuilding";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  v5 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A70DF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MapsSuggestionsEngineBuilding", "", buf, 2u);
  }

  v6 = objc_alloc_init(MapsSuggestionsSimpleStrategy);
  v7 = objc_alloc_init(MapsSuggestionsUnknownFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v7];

  v8 = objc_alloc_init(MapsSuggestionsServerSideFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v8];

  v9 = objc_alloc_init(MapsSuggestionsTooFewVisitsFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v9];

  v10 = objc_alloc_init(MapsSuggestionsNoAddressFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v10];

  v11 = objc_alloc_init(MapsSuggestionsAppConnectionFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v11];

  v12 = objc_alloc_init(MapsSuggestionsExpiredFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v12];

  v13 = objc_alloc_init(MapsSuggestionsCoarseLocationFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v13];

  v14 = objc_alloc_init(MapsSuggestionsFlightDeparturesOnlyFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v14];

  v15 = objc_alloc_init(MapsSuggestionsFlightTooFarFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPreFilter:v15];

  v16 = objc_alloc_init(MapsSuggestionsAppConnectionImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v16];

  v17 = objc_alloc_init(MapsSuggestionsSinkRankImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v17];

  v18 = objc_alloc_init(MapsSuggestionsDeleteSupportImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v18];

  v19 = objc_alloc_init(MapsSuggestionsHomeWorkImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v19];

  v20 = objc_alloc_init(MapsSuggestionsFavoritesImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v20];

  v21 = objc_alloc_init(MapsSuggestionsResumeRouteImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v21];

  v22 = objc_alloc_init(MapsSuggestionsCalendarEventImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v22];

  v23 = objc_alloc_init(MapsSuggestionsFrequentLocationImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v23];

  v24 = objc_alloc_init(MapsSuggestionsParkedCarImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v24];

  v25 = objc_alloc_init(MapsSuggestionsReservationImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v25];

  v26 = objc_alloc_init(MapsSuggestionsLockscreenImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v26];

  v27 = objc_alloc_init(MapsSuggestionsHotelImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v27];

  v28 = objc_alloc_init(MapsSuggestionsCarRentalImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v28];

  v29 = objc_alloc_init(MapsSuggestionsTravelFlightImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v29];

  v30 = objc_alloc_init(MapsSuggestionsTicketedEventImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v30];

  v31 = objc_alloc_init(MapsSuggestionsRecentHistoryImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v31];

  v32 = objc_alloc_init(MapsSuggestionsPortraitImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v32];

  v33 = objc_alloc_init(MapsSuggestionsPinnedPlaceImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v33];

  v34 = objc_alloc_init(MapsSuggestionsVirtualGarageImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v34];

  v35 = objc_alloc_init(MapsSuggestionsRatingRequestImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v35];

  v36 = objc_alloc_init(_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v36];

  v37 = objc_alloc_init(MapsSuggestionsOrderStatusImprover);
  [(MapsSuggestionsSimpleStrategy *)v6 addImprover:v37];

  v38 = objc_alloc_init(MapsSuggestionsShortcutDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v38];

  v39 = objc_alloc_init(MapsSuggestionsOrderStatusDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v39];

  v40 = objc_alloc_init(_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v40];

  v41 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:1];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v41];

  v42 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:2];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v42];

  v43 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:19];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v43];

  v44 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:17];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v44];

  v45 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:8];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v45];

  v46 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:20];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v46];

  v47 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:21];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v47];

  v48 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:22];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v48];

  v49 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:24];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v49];

  v50 = [MapsSuggestionsShortcutAtMapItemDeduper alloc];
  v51 = operator new(0x18uLL);
  *(void *)&buf[16] = v51 + 3;
  v51[2] = 12;
  *(_OWORD *)v51 = xmmword_1A7227420;
  *(void *)buf = v51;
  *(void *)&buf[8] = v51 + 3;
  v52 = [(MapsSuggestionsShortcutAtMapItemDeduper *)v50 initWithSacrificedTypes:buf];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v52];

  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  v53 = objc_alloc_init(MapsSuggestionsSameRidesharingRideDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v53];

  v54 = objc_alloc_init(MapsSuggestionsHomeWorkSchoolDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v54];

  v55 = objc_alloc_init(MapsSuggestionsFrequentLocationDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v55];

  v56 = objc_alloc_init(MapsSuggestionsParkedCarDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v56];

  v57 = objc_alloc_init(MapsSuggestionsRecentHistoryDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v57];

  v58 = objc_alloc_init(MapsSuggestionsAppConnectionDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v58];

  v59 = objc_alloc_init(MapsSuggestionsAppConnectionAndRecentsDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v59];

  v60 = objc_alloc_init(MapsSuggestionsRideBookingAppConnectionDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v60];

  v61 = objc_alloc_init(MapsSuggestionsCalendarEventDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v61];

  v62 = objc_alloc_init(MapsSuggestionsReservationDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v62];

  v63 = objc_alloc_init(MapsSuggestionsResumeRouteDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v63];

  v64 = objc_alloc_init(MapsSuggestionsResumeRouteAndRestaurantDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v64];

  v65 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:10];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v65];

  v66 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:6];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v66];

  v67 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:13];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v67];

  v68 = objc_alloc_init(MapsSuggestionsFlightDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v68];

  v69 = objc_alloc_init(MapsSuggestionsVehicleSetupResumeRouteDeduper);
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v69];

  v70 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:14];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v70];

  v71 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:16];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v71];

  v72 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:13];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v72];

  v73 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:17];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v73];

  v74 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:5];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v74];

  v75 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:12];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v75];

  v76 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:4];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v76];

  v77 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:23];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v77];

  v78 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:3];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v78];

  v79 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:2];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v79];

  v80 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:1];
  [(MapsSuggestionsSimpleStrategy *)v6 addDeduper:v80];

  v81 = objc_alloc_init(MapsSuggestionsDeletedFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPostFilter:v81];

  v82 = objc_alloc_init(MapsSuggestionsTooEarlyFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPostFilter:v82];

  v83 = objc_alloc_init(MapsSuggestionsNoTitleFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPostFilter:v83];

  v84 = objc_alloc_init(MapsSuggestionsAlreadyThereFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPostFilter:v84];

  v85 = objc_alloc_init(MapsSuggestionsTooFarFilter);
  [(MapsSuggestionsSimpleStrategy *)v6 addPostFilter:v85];

  [(MapsSuggestionsEngineBuilder *)self setStrategy:v6];
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  v86 = [(MapsSuggestionsEngineBuilder *)self includePreFilters];
  uint64_t v87 = [v86 countByEnumeratingWithState:&v197 objects:v211 count:16];
  if (v87)
  {
    uint64_t v88 = *(void *)v198;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v198 != v88) {
          objc_enumerationMutation(v86);
        }
        uint64_t v90 = *(void *)(*((void *)&v197 + 1) + 8 * i);
        v91 = [(MapsSuggestionsEngineBuilder *)self strategy];
        [v91 addPreFilter:v90];
      }
      uint64_t v87 = [v86 countByEnumeratingWithState:&v197 objects:v211 count:16];
    }
    while (v87);
  }

  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  v92 = [(MapsSuggestionsEngineBuilder *)self includePostFilters];
  uint64_t v93 = [v92 countByEnumeratingWithState:&v193 objects:v210 count:16];
  if (v93)
  {
    uint64_t v94 = *(void *)v194;
    do
    {
      for (uint64_t j = 0; j != v93; ++j)
      {
        if (*(void *)v194 != v94) {
          objc_enumerationMutation(v92);
        }
        uint64_t v96 = *(void *)(*((void *)&v193 + 1) + 8 * j);
        v97 = [(MapsSuggestionsEngineBuilder *)self strategy];
        [v97 addPostFilter:v96];
      }
      uint64_t v93 = [v92 countByEnumeratingWithState:&v193 objects:v210 count:16];
    }
    while (v93);
  }

  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  v98 = [(MapsSuggestionsEngineBuilder *)self includeImprovers];
  uint64_t v99 = [v98 countByEnumeratingWithState:&v189 objects:v209 count:16];
  if (v99)
  {
    uint64_t v100 = *(void *)v190;
    do
    {
      for (uint64_t k = 0; k != v99; ++k)
      {
        if (*(void *)v190 != v100) {
          objc_enumerationMutation(v98);
        }
        uint64_t v102 = *(void *)(*((void *)&v189 + 1) + 8 * k);
        v103 = [(MapsSuggestionsEngineBuilder *)self strategy];
        [v103 addImprover:v102];
      }
      uint64_t v99 = [v98 countByEnumeratingWithState:&v189 objects:v209 count:16];
    }
    while (v99);
  }

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  v104 = [(MapsSuggestionsEngineBuilder *)self includeDedupers];
  uint64_t v105 = [v104 countByEnumeratingWithState:&v185 objects:v208 count:16];
  if (v105)
  {
    uint64_t v106 = *(void *)v186;
    do
    {
      for (uint64_t m = 0; m != v105; ++m)
      {
        if (*(void *)v186 != v106) {
          objc_enumerationMutation(v104);
        }
        uint64_t v108 = *(void *)(*((void *)&v185 + 1) + 8 * m);
        v109 = [(MapsSuggestionsEngineBuilder *)self strategy];
        [v109 addDeduper:v108];
      }
      uint64_t v105 = [v104 countByEnumeratingWithState:&v185 objects:v208 count:16];
    }
    while (v105);
  }

  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  v110 = [(MapsSuggestionsEngineBuilder *)self excludePreFilters];
  uint64_t v111 = [v110 countByEnumeratingWithState:&v181 objects:v207 count:16];
  if (v111)
  {
    uint64_t v112 = *(void *)v182;
    do
    {
      for (uint64_t n = 0; n != v111; ++n)
      {
        if (*(void *)v182 != v112) {
          objc_enumerationMutation(v110);
        }
        uint64_t v114 = *(void *)(*((void *)&v181 + 1) + 8 * n);
        v115 = [(MapsSuggestionsEngineBuilder *)self strategy];
        [v115 removeFilter:v114];
      }
      uint64_t v111 = [v110 countByEnumeratingWithState:&v181 objects:v207 count:16];
    }
    while (v111);
  }

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  v116 = [(MapsSuggestionsEngineBuilder *)self excludePostFilters];
  uint64_t v117 = [v116 countByEnumeratingWithState:&v177 objects:v206 count:16];
  if (v117)
  {
    uint64_t v118 = *(void *)v178;
    do
    {
      for (iuint64_t i = 0; ii != v117; ++ii)
      {
        if (*(void *)v178 != v118) {
          objc_enumerationMutation(v116);
        }
        uint64_t v120 = *(void *)(*((void *)&v177 + 1) + 8 * ii);
        v121 = [(MapsSuggestionsEngineBuilder *)self strategy];
        [v121 removeFilter:v120];
      }
      uint64_t v117 = [v116 countByEnumeratingWithState:&v177 objects:v206 count:16];
    }
    while (v117);
  }

  v122 = [(MapsSuggestionsEngineBuilder *)self locationUpdater];
  BOOL v123 = v122 == 0;

  if (v123)
  {
    v124 = objc_alloc_init(MapsSuggestionsDefaultLocationUpdater);
    [(MapsSuggestionsEngineBuilder *)self setLocationUpdater:v124];
  }
  if ([(MapsSuggestionsEngineBuilder *)self hasTracker])
  {
    v125 = [MapsSuggestionsETARequirements alloc];
    GEOConfigGetDouble();
    double v127 = v126;
    GEOConfigGetDouble();
    double v129 = v128;
    GEOConfigGetDouble();
    v166 = [(MapsSuggestionsETARequirements *)v125 initWithMaxAge:v127 maxDistance:v129 minAccuracy:v130];
  }
  else
  {
    v166 = 0;
  }
  v131 = [MapsSuggestionsManager alloc];
  v132 = [(MapsSuggestionsEngineBuilder *)self strategy];
  v133 = [(MapsSuggestionsEngineBuilder *)self locationUpdater];
  v134 = [(MapsSuggestionsEngineBuilder *)self resourceDepot];
  v135 = [v134 oneNetworkRequester];
  v136 = [(MapsSuggestionsEngineBuilder *)self resourceDepot];
  v137 = [v136 oneFlightUpdater];
  v138 = [(MapsSuggestionsEngineBuilder *)self resourceDepot];
  v139 = [v138 oneVirtualGarage];
  v140 = [(MapsSuggestionsManager *)v131 initWithStrategy:v132 locationUpdater:v133 network:v135 flightUpdater:v137 ETARequirements:v166 virtualGarage:v139];

  v141 = [(MapsSuggestionsEngineBuilder *)self resourceDepot];
  [v141 setOneSourceDelegate:v140];

  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  v142 = [(MapsSuggestionsEngineBuilder *)self titleFormatters];
  uint64_t v143 = [v142 countByEnumeratingWithState:&v173 objects:v205 count:16];
  if (v143)
  {
    uint64_t v144 = *(void *)v174;
    do
    {
      for (juint64_t j = 0; jj != v143; ++jj)
      {
        if (*(void *)v174 != v144) {
          objc_enumerationMutation(v142);
        }
        v146 = *(void **)(*((void *)&v173 + 1) + 8 * jj);
        v147 = [(MapsSuggestionsEngineBuilder *)self titleFormatters];
        v148 = [v147 objectForKeyedSubscript:v146];
        -[MapsSuggestionsManager setTitleFormatter:forType:](v140, v148, (void *)[v146 unsignedIntValue]);
      }
      uint64_t v143 = [v142 countByEnumeratingWithState:&v173 objects:v205 count:16];
    }
    while (v143);
  }

  v167 = v140;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  v149 = [(MapsSuggestionsEngineBuilder *)self sourceClasses];
  obuint64_t j = v149;
  uint64_t v150 = [v149 countByEnumeratingWithState:&v169 objects:v204 count:16];
  p_super = &v167->super;
  if (v150)
  {
    uint64_t v152 = *(void *)v170;
    p_super = &v167->super;
LABEL_63:
    uint64_t v153 = 0;
    while (1)
    {
      if (*(void *)v170 != v152) {
        objc_enumerationMutation(obj);
      }
      v154 = *(void **)(*((void *)&v169 + 1) + 8 * v153);
      if ((objc_msgSend(v154, "conformsToProtocol:", &unk_1EFC8C5B8, v166) & 1) == 0)
      {
        v164 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineBuilder.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 568;
          *(_WORD *)&buf[18] = 2082;
          *(void *)&buf[20] = "-[MapsSuggestionsEngineBuilder build]";
          __int16 v202 = 2082;
          v203 = "NO == [sourceClass conformsToProtocol:@protocol(MapsSuggestionsSource)]";
          _os_log_impl(&dword_1A70DF000, v164, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This is not really a Source", buf, 0x26u);
        }

        v163 = 0;
        v162 = obj;
        goto LABEL_80;
      }
      if (([v154 isEnabled] & 1) == 0) {
        break;
      }
      id v155 = objc_alloc((Class)v154);
      v156 = [(MapsSuggestionsEngineBuilder *)self resourceDepot];
      v157 = [v154 description];
      v158 = [v155 initFromResourceDepot:v156 name:v157];

      [p_super attachSource:v158];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v158 = v158;
        v159 = p_super;
        p_super = v158;
LABEL_73:
      }
      if (v150 == ++v153)
      {
        v149 = obj;
        uint64_t v150 = [obj countByEnumeratingWithState:&v169 objects:v204 count:16];
        if (v150) {
          goto LABEL_63;
        }
        goto LABEL_76;
      }
    }
    GEOFindOrCreateLog();
    v159 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
    {
      v160 = [v154 description];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v160;
      _os_log_impl(&dword_1A70DF000, v159, OS_LOG_TYPE_DEBUG, "Source %@ is disabled", buf, 0xCu);
    }
    v158 = v159;
    goto LABEL_73;
  }
LABEL_76:

  v161 = [MapsSuggestionsEngine alloc];
  v162 = [(MapsSuggestionsEngineBuilder *)self resourceDepot];
  v163 = [(MapsSuggestionsEngine *)v161 initWithEntryManager:v167 resourceDepot:v162];
LABEL_80:

  return v163;
}

- (NSMutableDictionary)titleFormatters
{
  return self->_titleFormatters;
}

- (MapsSuggestionsFullResourceDepot)resourceDepot
{
  return self->_resourceDepot;
}

- (MapsSuggestionsStrategy)strategy
{
  return self->_strategy;
}

- (MapsSuggestionsLocationUpdater)locationUpdater
{
  return self->_locationUpdater;
}

- (NSMutableSet)includePreFilters
{
  return self->_includePreFilters;
}

- (void)setStrategy:(id)a3
{
}

- (NSMutableSet)includePostFilters
{
  return self->_includePostFilters;
}

- (NSMutableArray)includeImprovers
{
  return self->_includeImprovers;
}

- (NSMutableArray)includeDedupers
{
  return self->_includeDedupers;
}

- (BOOL)hasTracker
{
  return self->_hasTracker;
}

- (NSMutableSet)excludePostFilters
{
  return self->_excludePostFilters;
}

- (id)withTitleFormatter:(id)a3 forType:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineBuilder.mm";
      __int16 v15 = 1024;
      int v16 = 488;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsEngineBuilder withTitleFormatter:forType:]";
      __int16 v19 = 2082;
      v20 = "nil == (titleFormatter)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a title formatter", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_10;
  }
  if (([v6 conformsToProtocol:&unk_1EFC8CFF8] & 1) == 0
    && ([v7 conformsToProtocol:&unk_1EFC8E9F0] & 1) == 0)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEngineBuilder.mm";
      __int16 v15 = 1024;
      int v16 = 491;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsEngineBuilder withTitleFormatter:forType:]";
      __int16 v19 = 2082;
      v20 = "! [titleFormatter conformsToProtocol:@protocol(MapsSuggestionsETATitleFormatter)] && ! [titleFormatter confo"
            "rmsToProtocol:@protocol(MapsSuggestionsDistanceTitleFormatter)]";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA and/or Distance title formatter", (uint8_t *)&v13, 0x26u);
    }
LABEL_10:

    goto LABEL_11;
  }
  v8 = [(MapsSuggestionsEngineBuilder *)self titleFormatters];
  v9 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v7 forKeyedSubscript:v9];

LABEL_11:
  v11 = self;

  return v11;
}

- (id)withFavorites
{
  v3 = [(MapsSuggestionsEngineBuilder *)self sourceClasses];
  char v4 = [v3 containsObject:objc_opt_class()];

  if ((v4 & 1) == 0)
  {
    v5 = [(MapsSuggestionsEngineBuilder *)self sourceClasses];
    [v5 addObject:objc_opt_class()];
  }
  return self;
}

- (id)withSourceClasses:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        v10 = [(MapsSuggestionsEngineBuilder *)self sourceClasses];
        int v11 = [v10 containsObject:v9];

        if (v11)
        {
          GEOFindOrCreateLog();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            int v13 = [v9 description];
            *(_DWORD *)buf = v15;
            uint64_t v21 = v13;
            _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "Engine already contains source %@", buf, 0xCu);
          }
        }
        else
        {
          if (!v4) {
            goto LABEL_13;
          }
          v12 = [(MapsSuggestionsEngineBuilder *)self sourceClasses];
          [v12 addObject:v9];
        }

LABEL_13:
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  return self;
}

- (NSMutableArray)sourceClasses
{
  return self->_sourceClasses;
}

- (id)withoutPreFilters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MapsSuggestionsEngineBuilder *)self excludePreFilters];

  if (!v5)
  {
    long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    [(MapsSuggestionsEngineBuilder *)self setExcludePreFilters:v6];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [(MapsSuggestionsEngineBuilder *)self excludePreFilters];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          v14 = [(MapsSuggestionsEngineBuilder *)self excludePreFilters];
          [v14 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [(MapsSuggestionsEngineBuilder *)self includePreFilters];
  [v15 minusSet:v7];

  return self;
}

- (NSMutableSet)excludePreFilters
{
  return self->_excludePreFilters;
}

- (void)setExcludePreFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDepot, 0);
  objc_storeStrong((id *)&self->_titleFormatters, 0);
  objc_storeStrong((id *)&self->_excludeDedupers, 0);
  objc_storeStrong((id *)&self->_excludeImprovers, 0);
  objc_storeStrong((id *)&self->_excludePostFilters, 0);
  objc_storeStrong((id *)&self->_excludePreFilters, 0);
  objc_storeStrong((id *)&self->_includeDedupers, 0);
  objc_storeStrong((id *)&self->_includeImprovers, 0);
  objc_storeStrong((id *)&self->_includePostFilters, 0);
  objc_storeStrong((id *)&self->_includePreFilters, 0);
  objc_storeStrong((id *)&self->_sourceClasses, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
}

- (id)withoutTracker
{
  return self;
}

+ (id)forDevice
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v16 = objc_alloc_init(MapsSuggestionsEngineBuilder);
  [(MapsSuggestionsEngineBuilder *)v16 setLocationUpdater:0];
  [(MapsSuggestionsEngineBuilder *)v16 setHasTracker:1];
  v2 = objc_alloc_init(MapsSuggestionsDefaultTitleFormatter);
  v3 = objc_alloc_init(MapsSuggestionsHomeWorkTitleFormatter);
  long long v15 = objc_alloc_init(MapsSuggestionsHotelTitleFormatter);
  id v4 = objc_alloc_init(MapsSuggestionsFrequentLocationTitleFormatter);
  uint64_t v5 = objc_alloc_init(MapsSuggestionsResumeRouteTitleFormatter);
  long long v6 = objc_alloc_init(MapsSuggestionsParkedCarTitleFormatter);
  id v7 = objc_alloc_init(MapsSuggestionsCarRentalTitleFormatter);
  uint64_t v8 = objc_alloc_init(MapsSuggestionsFlightTitleFormatter);
  uint64_t v9 = objc_alloc_init(MapsSuggestionsOrderStatusTitleFormatter);
  v17[0] = &unk_1EFC89D20;
  v17[1] = &unk_1EFC89D38;
  uint64_t v18 = (uint64_t)v3;
  uint64_t v19 = (uint64_t)v3;
  v17[2] = &unk_1EFC89D50;
  v17[3] = &unk_1EFC89D68;
  long long v20 = v4;
  uint64_t v21 = v2;
  v17[4] = &unk_1EFC89D80;
  v17[5] = &unk_1EFC89D98;
  uint64_t v22 = v9;
  uint64_t v23 = v5;
  v17[6] = &unk_1EFC89DB0;
  v17[7] = &unk_1EFC89DC8;
  v24 = v6;
  v25 = v15;
  v17[8] = &unk_1EFC89DE0;
  v17[9] = &unk_1EFC89DF8;
  v26 = v7;
  v27 = v8;
  v17[10] = &unk_1EFC89E10;
  v17[11] = &unk_1EFC89E28;
  v28 = v2;
  v29 = v2;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:v17 count:12];
  uint64_t v11 = (void *)[v10 mutableCopy];

  [(MapsSuggestionsEngineBuilder *)v16 setTitleFormatters:v11];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:2];
  char v13 = (void *)[v12 mutableCopy];
  [(MapsSuggestionsEngineBuilder *)v16 setSourceClasses:v13];

  return v16;
}

- (void)setHasTracker:(BOOL)a3
{
  self->_hasTracker = a3;
}

- (void)setTitleFormatters:(id)a3
{
}

- (void)setSourceClasses:(id)a3
{
}

- (MapsSuggestionsEngineBuilder)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "Nov 16 2024";
    __int16 v11 = 2080;
    v12 = "17:28:39";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_INFO, "Using MapsSuggestionsEngine built on %s %s", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsEngineBuilder;
  id v4 = [(MapsSuggestionsEngineBuilder *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [[MapsSuggestionsSelfBuildingResourceDepot alloc] initWithName:@"EngineBuilderResourceDepot"];
    resourceDepot = v4->_resourceDepot;
    v4->_resourceDepot = (MapsSuggestionsFullResourceDepot *)v5;
  }
  return v4;
}

- (id)withLocationUpdater:(id)a3
{
  return self;
}

- (void)setLocationUpdater:(id)a3
{
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (id)withResourceDepot:(id)a3
{
  return self;
}

- (id)withPreFilters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MapsSuggestionsEngineBuilder *)self includePreFilters];

  if (!v5)
  {
    long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    [(MapsSuggestionsEngineBuilder *)self setIncludePreFilters:v6];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [(MapsSuggestionsEngineBuilder *)self includePreFilters];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          v14 = [(MapsSuggestionsEngineBuilder *)self includePreFilters];
          [v14 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [(MapsSuggestionsEngineBuilder *)self excludePreFilters];
  [v15 minusSet:v7];

  return self;
}

- (id)withPostFilters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MapsSuggestionsEngineBuilder *)self includePostFilters];

  if (!v5)
  {
    long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    [(MapsSuggestionsEngineBuilder *)self setIncludePostFilters:v6];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [(MapsSuggestionsEngineBuilder *)self includePostFilters];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          v14 = [(MapsSuggestionsEngineBuilder *)self includePostFilters];
          [v14 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [(MapsSuggestionsEngineBuilder *)self excludePostFilters];
  [v15 minusSet:v7];

  return self;
}

- (id)withImprovers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MapsSuggestionsEngineBuilder *)self includeImprovers];

  if (!v5)
  {
    long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    [(MapsSuggestionsEngineBuilder *)self setIncludeImprovers:v6];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [(MapsSuggestionsEngineBuilder *)self includeImprovers];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          v14 = [(MapsSuggestionsEngineBuilder *)self includeImprovers];
          [v14 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [(MapsSuggestionsEngineBuilder *)self excludeImprovers];
  [v15 removeObjectsInArray:v7];

  return self;
}

- (id)withDedupers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MapsSuggestionsEngineBuilder *)self includeDedupers];

  if (!v5)
  {
    long long v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    [(MapsSuggestionsEngineBuilder *)self setIncludeDedupers:v6];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [(MapsSuggestionsEngineBuilder *)self includeDedupers];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          v14 = [(MapsSuggestionsEngineBuilder *)self includeDedupers];
          [v14 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  long long v15 = [(MapsSuggestionsEngineBuilder *)self excludeDedupers];
  [v15 removeObjectsInArray:v7];

  return self;
}

+ (id)simpleStrategy
{
  v2 = objc_alloc_init(MapsSuggestionsSimpleStrategy);
  v3 = objc_alloc_init(MapsSuggestionsUnknownFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v3];

  id v4 = objc_alloc_init(MapsSuggestionsServerSideFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v4];

  uint64_t v5 = objc_alloc_init(MapsSuggestionsTooFewVisitsFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v5];

  long long v6 = objc_alloc_init(MapsSuggestionsNoAddressFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v6];

  id v7 = objc_alloc_init(MapsSuggestionsAppConnectionFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v7];

  uint64_t v8 = objc_alloc_init(MapsSuggestionsExpiredFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v8];

  uint64_t v9 = objc_alloc_init(MapsSuggestionsCoarseLocationFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v9];

  uint64_t v10 = objc_alloc_init(MapsSuggestionsFlightDeparturesOnlyFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v10];

  uint64_t v11 = objc_alloc_init(MapsSuggestionsFlightTooFarFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPreFilter:v11];

  v12 = objc_alloc_init(MapsSuggestionsAppConnectionImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v12];

  char v13 = objc_alloc_init(MapsSuggestionsSinkRankImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v13];

  v14 = objc_alloc_init(MapsSuggestionsDeleteSupportImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v14];

  long long v15 = objc_alloc_init(MapsSuggestionsHomeWorkImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v15];

  long long v16 = objc_alloc_init(MapsSuggestionsFavoritesImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v16];

  long long v17 = objc_alloc_init(MapsSuggestionsResumeRouteImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v17];

  long long v18 = objc_alloc_init(MapsSuggestionsCalendarEventImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v18];

  long long v19 = objc_alloc_init(MapsSuggestionsFrequentLocationImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v19];

  long long v20 = objc_alloc_init(MapsSuggestionsParkedCarImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v20];

  uint64_t v21 = objc_alloc_init(MapsSuggestionsReservationImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v21];

  uint64_t v22 = objc_alloc_init(MapsSuggestionsLockscreenImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v22];

  uint64_t v23 = objc_alloc_init(MapsSuggestionsHotelImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v23];

  v24 = objc_alloc_init(MapsSuggestionsCarRentalImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v24];

  v25 = objc_alloc_init(MapsSuggestionsTravelFlightImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v25];

  v26 = objc_alloc_init(MapsSuggestionsTicketedEventImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v26];

  v27 = objc_alloc_init(MapsSuggestionsRecentHistoryImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v27];

  v28 = objc_alloc_init(MapsSuggestionsPortraitImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v28];

  v29 = objc_alloc_init(MapsSuggestionsPinnedPlaceImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v29];

  uint64_t v30 = objc_alloc_init(MapsSuggestionsVirtualGarageImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v30];

  v31 = objc_alloc_init(MapsSuggestionsRatingRequestImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v31];

  v32 = objc_alloc_init(_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v32];

  v33 = objc_alloc_init(MapsSuggestionsOrderStatusImprover);
  [(MapsSuggestionsSimpleStrategy *)v2 addImprover:v33];

  v34 = objc_alloc_init(MapsSuggestionsShortcutDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v34];

  v35 = objc_alloc_init(MapsSuggestionsOrderStatusDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v35];

  v36 = objc_alloc_init(_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v36];

  v37 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:1];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v37];

  v38 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:2];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v38];

  v39 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:19];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v39];

  v40 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:17];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v40];

  v41 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:8];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v41];

  v42 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:20];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v42];

  v43 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:21];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v43];

  v44 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:22];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v44];

  v45 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:24];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v45];

  v46 = [MapsSuggestionsShortcutAtMapItemDeduper alloc];
  v47 = operator new(0x18uLL);
  v84 = v47 + 3;
  v85 = (char *)(v47 + 3);
  v47[2] = 12;
  *(_OWORD *)v47 = xmmword_1A7227420;
  __p = v47;
  v48 = [(MapsSuggestionsShortcutAtMapItemDeduper *)v46 initWithSacrificedTypes:&__p];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v48];

  if (__p)
  {
    v84 = __p;
    operator delete(__p);
  }
  v49 = objc_alloc_init(MapsSuggestionsSameRidesharingRideDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v49];

  v50 = objc_alloc_init(MapsSuggestionsHomeWorkSchoolDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v50];

  v51 = objc_alloc_init(MapsSuggestionsFrequentLocationDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v51];

  v52 = objc_alloc_init(MapsSuggestionsParkedCarDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v52];

  v53 = objc_alloc_init(MapsSuggestionsRecentHistoryDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v53];

  v54 = objc_alloc_init(MapsSuggestionsAppConnectionDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v54];

  v55 = objc_alloc_init(MapsSuggestionsAppConnectionAndRecentsDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v55];

  v56 = objc_alloc_init(MapsSuggestionsRideBookingAppConnectionDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v56];

  v57 = objc_alloc_init(MapsSuggestionsCalendarEventDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v57];

  v58 = objc_alloc_init(MapsSuggestionsReservationDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v58];

  v59 = objc_alloc_init(MapsSuggestionsResumeRouteDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v59];

  v60 = objc_alloc_init(MapsSuggestionsResumeRouteAndRestaurantDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v60];

  v61 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:10];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v61];

  v62 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:6];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v62];

  v63 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:13];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v63];

  v64 = objc_alloc_init(MapsSuggestionsFlightDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v64];

  v65 = objc_alloc_init(MapsSuggestionsVehicleSetupResumeRouteDeduper);
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v65];

  v66 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:14];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v66];

  v67 = [[MapsSuggestionsUniqueIdentifierDeduper alloc] initWithType:16];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v67];

  v68 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:13];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v68];

  v69 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:17];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v69];

  v70 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:5];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v70];

  v71 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:12];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v71];

  v72 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:4];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v72];

  v73 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:23];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v73];

  v74 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:3];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v74];

  v75 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:2];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v75];

  v76 = [[MapsSuggestionsGEOMapItemDeduper alloc] initWithSacrificedType:1];
  [(MapsSuggestionsSimpleStrategy *)v2 addDeduper:v76];

  v77 = objc_alloc_init(MapsSuggestionsDeletedFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPostFilter:v77];

  v78 = objc_alloc_init(MapsSuggestionsTooEarlyFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPostFilter:v78];

  v79 = objc_alloc_init(MapsSuggestionsNoTitleFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPostFilter:v79];

  v80 = objc_alloc_init(MapsSuggestionsAlreadyThereFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPostFilter:v80];

  v81 = objc_alloc_init(MapsSuggestionsTooFarFilter);
  [(MapsSuggestionsSimpleStrategy *)v2 addPostFilter:v81];

  return v2;
}

- (void)setIncludePreFilters:(id)a3
{
}

- (void)setIncludePostFilters:(id)a3
{
}

- (void)setIncludeImprovers:(id)a3
{
}

- (void)setIncludeDedupers:(id)a3
{
}

- (void)setExcludePostFilters:(id)a3
{
}

- (NSMutableArray)excludeImprovers
{
  return self->_excludeImprovers;
}

- (void)setExcludeImprovers:(id)a3
{
}

- (NSMutableArray)excludeDedupers
{
  return self->_excludeDedupers;
}

- (void)setExcludeDedupers:(id)a3
{
}

- (void)setResourceDepot:(id)a3
{
}

@end