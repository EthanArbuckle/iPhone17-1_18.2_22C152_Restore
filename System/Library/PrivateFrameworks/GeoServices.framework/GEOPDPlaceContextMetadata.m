@interface GEOPDPlaceContextMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceContextMetadata)init;
- (GEOPDPlaceContextMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceContextMetadata

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v190 = *MEMORY[0x1E4F143B8];
  id v178 = a2;
  if (a1)
  {
    uint64_t v177 = [a1 init];
    if (v177)
    {
      v4 = [v178 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = [v4 unsignedLongLongValue];
        *(unsigned char *)(v177 + 64) |= 0x20u;
        *(unsigned char *)(v177 + 64) |= 1u;
        *(void *)(v177 + 32) = v5;
      }

      if (a3) {
        v6 = @"placeContextMetadataType";
      }
      else {
        v6 = @"place_context_metadata_type";
      }
      v7 = [v178 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"PLACE_CONTEXT_METADATA_UNKNOWN"])
        {
          int v9 = 0;
        }
        else if ([v8 isEqualToString:@"PLACE_CONTEXT_METADATA_SEARCH"])
        {
          int v9 = 1;
        }
        else if ([v8 isEqualToString:@"PLACE_CONTEXT_METADATA_AUTOCOMPLETE"])
        {
          int v9 = 2;
        }
        else
        {
          int v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        int v9 = [v7 intValue];
      }
      *(unsigned char *)(v177 + 64) |= 0x20u;
      *(unsigned char *)(v177 + 64) |= 2u;
      *(_DWORD *)(v177 + 60) = v9;
LABEL_21:

      if (a3) {
        v10 = @"searchPlaceContextMetadata";
      }
      else {
        v10 = @"search_place_context_metadata";
      }
      v175 = [v178 objectForKeyedSubscript:v10];
      objc_opt_class();
      v11 = v175;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_164:

        if (a3) {
          v95 = @"autocompletePlaceContextMetadata";
        }
        else {
          v95 = @"autocomplete_place_context_metadata";
        }
        v174 = [v178 objectForKeyedSubscript:v95];
        objc_opt_class();
        v96 = v174;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_304;
        }
        v97 = [GEOPDAutocompletePlaceContextMetadata alloc];
        if (!v97)
        {
          uint64_t v100 = 0;
          goto LABEL_303;
        }
        v98 = v97;
        id v99 = v174;
        uint64_t v100 = [(GEOPDAutocompletePlaceContextMetadata *)v98 init];
        if (!v100)
        {
LABEL_302:

LABEL_303:
          id v168 = (id)v100;
          *(unsigned char *)(v177 + 64) |= 8u;
          *(unsigned char *)(v177 + 64) |= 0x20u;
          objc_storeStrong((id *)(v177 + 24), (id)v100);

          v96 = v174;
LABEL_304:

          goto LABEL_305;
        }
        if (a3) {
          v101 = @"matchedDisplayName";
        }
        else {
          v101 = @"matched_display_name";
        }
        v176 = v99;
        v102 = [v99 objectForKeyedSubscript:v101];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v103 = (void *)[v102 copy];
          id v104 = v103;
          *(_DWORD *)(v100 + 112) |= 0x10000u;
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          objc_storeStrong((id *)(v100 + 72), v103);
        }
        if (a3) {
          v105 = @"isDefaultName";
        }
        else {
          v105 = @"is_default_name";
        }
        v106 = [v176 objectForKeyedSubscript:v105];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v107 = [v106 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x20u;
          *(unsigned char *)(v100 + 106) = v107;
        }

        if (a3) {
          v108 = @"isProminentResult";
        }
        else {
          v108 = @"is_prominent_result";
        }
        v109 = [v176 objectForKeyedSubscript:v108];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v110 = [v109 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x80u;
          *(unsigned char *)(v100 + 108) = v110;
        }

        if (a3) {
          v111 = @"clientizationFeature";
        }
        else {
          v111 = @"clientization_feature";
        }
        v171 = [v176 objectForKeyedSubscript:v111];
        objc_opt_class();
        v112 = v171;
        if (objc_opt_isKindOfClass())
        {
          long long v186 = 0u;
          long long v187 = 0u;
          long long v184 = 0u;
          long long v185 = 0u;
          id v113 = v171;
          uint64_t v114 = [v113 countByEnumeratingWithState:&v184 objects:v189 count:16];
          if (!v114) {
            goto LABEL_210;
          }
          uint64_t v115 = *(void *)v185;
          while (1)
          {
            for (uint64_t i = 0; i != v114; ++i)
            {
              if (*(void *)v185 != v115) {
                objc_enumerationMutation(v113);
              }
              v117 = *(void **)(*((void *)&v184 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v118 = v117;
                if (([v118 isEqualToString:@"CLIENTIZATION_FEATURE_UNKNOWN"] & 1) == 0
                  && ([v118 isEqualToString:@"CLIENTIZATION_FEATURE_IS_AIRPORT"] & 1) == 0
                  && ([v118 isEqualToString:@"CLIENTIZATION_FEATURE_IS_LANDMARK"] & 1) == 0
                  && ([v118 isEqualToString:@"CLIENTIZATION_FEATURE_IS_POPULAR"] & 1) == 0)
                {
                  [v118 isEqualToString:@"CLIENTIZATION_FEATURE_SUMMARY_EXPERIENCE"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v117 intValue];
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v100 + 88));
              if ((*(unsigned char *)(v100 + 113) & 0x10) == 0)
              {
                v119 = *(void **)(v100 + 8);
                if (v119)
                {
                  id v120 = v119;
                  objc_sync_enter(v120);
                  GEOPDAutocompletePlaceContextMetadataReadSpecified(v100, *(void *)(v100 + 8), (int *)&_readClientizationFeatures_tags);
                  objc_sync_exit(v120);
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 88));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(_DWORD *)(v100 + 112) |= 0x1000u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 88));
              *(_DWORD *)(v100 + 112) |= 0x20000u;
            }
            uint64_t v114 = [v113 countByEnumeratingWithState:&v184 objects:v189 count:16];
            if (!v114)
            {
LABEL_210:

              v112 = v171;
              break;
            }
          }
        }

        if (a3) {
          v121 = @"matchedDisplayNameLanguageCode";
        }
        else {
          v121 = @"matched_display_name_language_code";
        }
        v122 = objc_msgSend(v176, "objectForKeyedSubscript:", v121, v171);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v123 = (void *)[v122 copy];
          id v124 = v123;
          *(_DWORD *)(v100 + 112) |= 0x8000u;
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          objc_storeStrong((id *)(v100 + 64), v123);
        }
        if (a3) {
          v125 = @"shouldSuppressDirectionsAction";
        }
        else {
          v125 = @"should_suppress_directions_action";
        }
        v126 = [v176 objectForKeyedSubscript:v125];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v127 = [v126 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x400u;
          *(unsigned char *)(v100 + 111) = v127;
        }

        if (a3) {
          v128 = @"isLookAroundActionAllowed";
        }
        else {
          v128 = @"is_look_around_action_allowed";
        }
        v129 = [v176 objectForKeyedSubscript:v128];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v130 = [v129 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x40u;
          *(unsigned char *)(v100 + 107) = v130;
        }

        if (a3) {
          v131 = @"alternateSearchableName";
        }
        else {
          v131 = @"alternate_searchable_name";
        }
        v132 = [v176 objectForKeyedSubscript:v131];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v182 = 0u;
          long long v183 = 0u;
          long long v180 = 0u;
          long long v181 = 0u;
          id v133 = v132;
          uint64_t v134 = [v133 countByEnumeratingWithState:&v180 objects:v188 count:16];
          if (v134)
          {
            uint64_t v135 = *(void *)v181;
            do
            {
              for (uint64_t j = 0; j != v134; ++j)
              {
                if (*(void *)v181 != v135) {
                  objc_enumerationMutation(v133);
                }
                uint64_t v137 = *(void *)(*((void *)&v180 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v138 = [GEOLocalizedString alloc];
                  if (a3) {
                    v139 = [(GEOLocalizedString *)v138 initWithJSON:v137];
                  }
                  else {
                    v139 = [(GEOLocalizedString *)v138 initWithDictionary:v137];
                  }
                  v140 = v139;
                  -[GEOPDAutocompletePlaceContextMetadata addAlternateSearchableName:](v100, v139);
                }
              }
              uint64_t v134 = [v133 countByEnumeratingWithState:&v180 objects:v188 count:16];
            }
            while (v134);
          }
        }
        if (a3) {
          v141 = @"distanceDisplayThreshold";
        }
        else {
          v141 = @"distance_display_threshold";
        }
        v142 = [v176 objectForKeyedSubscript:v141];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v143 = [v142 unsignedIntValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 1u;
          *(_DWORD *)(v100 + 92) = v143;
        }

        if (a3) {
          v144 = @"enableLookInsideActionForVenuePois";
        }
        else {
          v144 = @"enable_look_inside_action_for_venue_pois";
        }
        v145 = [v176 objectForKeyedSubscript:v144];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v146 = [v145 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x10u;
          *(unsigned char *)(v100 + 105) = v146;
        }

        if (a3) {
          v147 = @"enableChildPoisWithoutAcRank";
        }
        else {
          v147 = @"enable_child_pois_without_ac_rank";
        }
        v148 = [v176 objectForKeyedSubscript:v147];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v149 = [v148 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 8u;
          *(unsigned char *)(v100 + 104) = v149;
        }

        if (a3) {
          v150 = @"requestedShortAddressType";
        }
        else {
          v150 = @"requested_short_address_type";
        }
        v151 = [v176 objectForKeyedSubscript:v150];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v152 = v151;
          if ([v152 isEqualToString:@"REQUESTED_SHORT_ADDRESS_TYPE_DEFAULT"])
          {
            int v153 = 0;
          }
          else if ([v152 isEqualToString:@"REQUESTED_SHORT_ADDRESS_TYPE_CITY_AND_ABOVE"])
          {
            int v153 = 1;
          }
          else if ([v152 isEqualToString:@"REQUESTED_SHORT_ADDRESS_TYPE_CITY"])
          {
            int v153 = 2;
          }
          else if ([v152 isEqualToString:@"REQUESTED_SHORT_ADDRESS_TYPE_COUNTRY"])
          {
            int v153 = 3;
          }
          else
          {
            int v153 = 0;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_275;
          }
          int v153 = [v151 intValue];
        }
        *(_DWORD *)(v100 + 112) |= 0x20000u;
        *(_DWORD *)(v100 + 112) |= 2u;
        *(_DWORD *)(v100 + 96) = v153;
LABEL_275:

        if (a3) {
          v154 = @"shouldEnableCallAction";
        }
        else {
          v154 = @"should_enable_call_action";
        }
        v155 = [v176 objectForKeyedSubscript:v154];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v156 = [v155 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x100u;
          *(unsigned char *)(v100 + 109) = v156;
        }

        if (a3) {
          v157 = @"shouldEnableWebsiteAction";
        }
        else {
          v157 = @"should_enable_website_action";
        }
        v158 = [v176 objectForKeyedSubscript:v157];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v159 = [v158 BOOLValue];
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x200u;
          *(unsigned char *)(v100 + 110) = v159;
        }

        if (a3) {
          v160 = @"inferredCategory";
        }
        else {
          v160 = @"inferred_category";
        }
        v161 = [v176 objectForKeyedSubscript:v160];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v162 = (void *)[v161 copy];
          id v163 = v162;
          *(_DWORD *)(v100 + 112) |= 0x4000u;
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          objc_storeStrong((id *)(v100 + 56), v162);
        }
        if (a3) {
          v164 = @"taxonomyTypeForClientization";
        }
        else {
          v164 = @"taxonomy_type_for_clientization";
        }
        v165 = [v176 objectForKeyedSubscript:v164];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v166 = v165;
          if ([v166 isEqualToString:@"CATEGORY_TAXONOMY_TYPE_DEFAULT"]) {
            int v167 = 0;
          }
          else {
            int v167 = [v166 isEqualToString:@"CATEGORY_TAXONOMY_TYPE_MODERN"];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_301:

            id v99 = v176;
            goto LABEL_302;
          }
          int v167 = [v165 intValue];
        }
        *(_DWORD *)(v100 + 112) |= 0x20000u;
        *(_DWORD *)(v100 + 112) |= 4u;
        *(_DWORD *)(v100 + 100) = v167;
        goto LABEL_301;
      }
      v12 = [GEOPDSearchPlaceContextMetadata alloc];
      if (!v12)
      {
        uint64_t v15 = 0;
        goto LABEL_163;
      }
      v13 = v12;
      id v14 = v175;
      uint64_t v15 = [(GEOPDSearchPlaceContextMetadata *)v13 init];
      if (!v15)
      {
LABEL_162:

LABEL_163:
        id v94 = (id)v15;
        *(unsigned char *)(v177 + 64) |= 0x10u;
        *(unsigned char *)(v177 + 64) |= 0x20u;
        objc_storeStrong((id *)(v177 + 40), (id)v15);

        v11 = v175;
        goto LABEL_164;
      }
      if (a3) {
        v16 = @"matchedDisplayName";
      }
      else {
        v16 = @"matched_display_name";
      }
      v17 = [v14 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v17 copy];
        id v19 = v18;
        *(_WORD *)(v15 + 108) |= 0x100u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 56), v18);
      }
      if (a3) {
        v20 = @"isDefaultName";
      }
      else {
        v20 = @"is_default_name";
      }
      v21 = [v14 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v22 = [v21 BOOLValue];
        *(_WORD *)(v15 + 108) |= 0x1000u;
        *(_WORD *)(v15 + 108) |= 2u;
        *(unsigned char *)(v15 + 104) = v22;
      }

      if (a3) {
        v23 = @"normalizedQuery";
      }
      else {
        v23 = @"normalized_query";
      }
      v24 = [v14 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = (void *)[v24 copy];
        id v26 = v25;
        *(_WORD *)(v15 + 108) |= 0x400u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 72), v25);
      }
      if (a3) {
        v27 = @"interpretedCategory";
      }
      else {
        v27 = @"interpreted_category";
      }
      v28 = [v14 objectForKeyedSubscript:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = (void *)[v28 copy];
        id v30 = v29;
        *(_WORD *)(v15 + 108) |= 0x40u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 40), v29);
      }
      if (a3) {
        v31 = @"matchedDisplayNameLanguageCode";
      }
      else {
        v31 = @"matched_display_name_language_code";
      }
      v32 = [v14 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v33 = (void *)[v32 copy];
        id v34 = v33;
        *(_WORD *)(v15 + 108) |= 0x80u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 48), v33);
      }
      if (a3) {
        v35 = @"alternateSearchableName";
      }
      else {
        v35 = @"alternate_searchable_name";
      }
      v36 = [v14 objectForKeyedSubscript:v35];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v182 = 0u;
        long long v183 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v180 objects:v188 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v181;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v181 != v39) {
                objc_enumerationMutation(v37);
              }
              uint64_t v41 = *(void *)(*((void *)&v180 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v42 = [GEOLocalizedString alloc];
                if (a3) {
                  v43 = [(GEOLocalizedString *)v42 initWithJSON:v41];
                }
                else {
                  v43 = [(GEOLocalizedString *)v42 initWithDictionary:v41];
                }
                v44 = v43;
                -[GEOPDSearchPlaceContextMetadata addAlternateSearchableName:](v15, v43);
              }
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v180 objects:v188 count:16];
          }
          while (v38);
        }
      }
      if (a3) {
        v45 = @"secondaryNameOverrideLanguage";
      }
      else {
        v45 = @"secondary_name_override_language";
      }
      v46 = [v14 objectForKeyedSubscript:v45];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v47 = (void *)[v46 copy];
        id v48 = v47;
        *(_WORD *)(v15 + 108) |= 0x800u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 80), v47);
      }
      if (a3) {
        v49 = @"taxonomyTypeForClientization";
      }
      else {
        v49 = @"taxonomy_type_for_clientization";
      }
      v50 = [v14 objectForKeyedSubscript:v49];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v51 = v50;
        if ([v51 isEqualToString:@"CATEGORY_TAXONOMY_TYPE_DEFAULT"]) {
          int v52 = 0;
        }
        else {
          int v52 = [v51 isEqualToString:@"CATEGORY_TAXONOMY_TYPE_MODERN"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_85:

          if (a3) {
            v53 = @"contextualPhotoMetadata";
          }
          else {
            v53 = @"contextual_photo_metadata";
          }
          v54 = [v14 objectForKeyedSubscript:v53];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v55 = [GEOPDContextualPhotoMetadata alloc];
            if (v55)
            {
              id v172 = v54;
              uint64_t v56 = [(GEOPDContextualPhotoMetadata *)v55 init];
              if (v56)
              {
                if (a3) {
                  v57 = @"contextualPhotoLabel";
                }
                else {
                  v57 = @"contextual_photo_label";
                }
                v58 = [v172 objectForKeyedSubscript:v57];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v186 = 0u;
                  long long v187 = 0u;
                  long long v184 = 0u;
                  long long v185 = 0u;
                  id v59 = v58;
                  uint64_t v60 = [v59 countByEnumeratingWithState:&v184 objects:v189 count:16];
                  if (v60)
                  {
                    uint64_t v61 = *(void *)v185;
                    do
                    {
                      for (uint64_t m = 0; m != v60; ++m)
                      {
                        if (*(void *)v185 != v61) {
                          objc_enumerationMutation(v59);
                        }
                        v63 = *(void **)(*((void *)&v184 + 1) + 8 * m);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v64 = (void *)[v63 copy];
                          -[GEOPDContextualPhotoMetadata addContextualPhotoLabel:](v56, v64);
                        }
                      }
                      uint64_t v60 = [v59 countByEnumeratingWithState:&v184 objects:v189 count:16];
                    }
                    while (v60);
                  }
                }
                if (a3) {
                  v65 = @"maxNumContextualPhotos";
                }
                else {
                  v65 = @"max_num_contextual_photos";
                }
                v66 = [v172 objectForKeyedSubscript:v65];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v67 = [v66 unsignedIntValue];
                  *(unsigned char *)(v56 + 36) |= 1u;
                  *(_DWORD *)(v56 + 24) = v67;
                }

                if (a3) {
                  v68 = @"maxNumPhotos";
                }
                else {
                  v68 = @"max_num_photos";
                }
                v69 = [v172 objectForKeyedSubscript:v68];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v70 = [v69 unsignedIntValue];
                  *(unsigned char *)(v56 + 36) |= 2u;
                  *(_DWORD *)(v56 + 28) = v70;
                }

                if (a3) {
                  v71 = @"shouldLimitToPoisWithVendorTopPhoto";
                }
                else {
                  v71 = @"should_limit_to_pois_with_vendor_top_photo";
                }
                v72 = [v172 objectForKeyedSubscript:v71];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  char v73 = [v72 BOOLValue];
                  *(unsigned char *)(v56 + 36) |= 0x10u;
                  *(unsigned char *)(v56 + 34) = v73;
                }

                if (a3) {
                  v74 = @"shouldApplyContextualizationSearch";
                }
                else {
                  v74 = @"should_apply_contextualization_search";
                }
                v75 = [v172 objectForKeyedSubscript:v74];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  char v76 = [v75 BOOLValue];
                  *(unsigned char *)(v56 + 36) |= 8u;
                  *(unsigned char *)(v56 + 33) = v76;
                }

                if (a3) {
                  v77 = @"shouldApplyContextualizationPlacecard";
                }
                else {
                  v77 = @"should_apply_contextualization_placecard";
                }
                v78 = [v172 objectForKeyedSubscript:v77];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  char v79 = [v78 BOOLValue];
                  *(unsigned char *)(v56 + 36) |= 4u;
                  *(unsigned char *)(v56 + 32) = v79;
                }
              }
            }
            else
            {
              uint64_t v56 = 0;
            }
            id v80 = (id)v56;
            *(_WORD *)(v15 + 108) |= 0x20u;
            *(_WORD *)(v15 + 108) |= 0x1000u;
            objc_storeStrong((id *)(v15 + 32), (id)v56);
          }
          if (a3) {
            v81 = @"nearbyPlacesMetadata";
          }
          else {
            v81 = @"nearby_places_metadata";
          }
          v82 = [v14 objectForKeyedSubscript:v81];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v83 = [GEOPDNearbyPlacesMetadata alloc];
            if (v83)
            {
              id v173 = v82;
              v83 = [(GEOPDNearbyPlacesMetadata *)v83 init];
              if (v83)
              {
                if (a3) {
                  v84 = @"encryptedNearbyPlacesMuid";
                }
                else {
                  v84 = @"encrypted_nearby_places_muid";
                }
                v170 = [v173 objectForKeyedSubscript:v84];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v186 = 0u;
                  long long v187 = 0u;
                  long long v184 = 0u;
                  long long v185 = 0u;
                  id v85 = v170;
                  uint64_t v86 = [v85 countByEnumeratingWithState:&v184 objects:v189 count:16];
                  if (v86)
                  {
                    uint64_t v87 = *(void *)v185;
                    do
                    {
                      for (uint64_t n = 0; n != v86; ++n)
                      {
                        if (*(void *)v185 != v87) {
                          objc_enumerationMutation(v85);
                        }
                        v89 = *(void **)(*((void *)&v184 + 1) + 8 * n);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v89 unsignedLongLongValue];
                          PBRepeatedUInt64Add();
                        }
                      }
                      uint64_t v86 = [v85 countByEnumeratingWithState:&v184 objects:v189 count:16];
                    }
                    while (v86);
                  }
                }
              }
            }
            v90 = v83;
            *(_WORD *)(v15 + 108) |= 0x200u;
            *(_WORD *)(v15 + 108) |= 0x1000u;
            objc_storeStrong((id *)(v15 + 64), v83);
          }
          if (a3) {
            v91 = @"shouldPartiallyClientizeResult";
          }
          else {
            v91 = @"should_partially_clientize_result";
          }
          v92 = objc_msgSend(v14, "objectForKeyedSubscript:", v91, v170);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v93 = [v92 BOOLValue];
            *(_WORD *)(v15 + 108) |= 0x1000u;
            *(_WORD *)(v15 + 108) |= 4u;
            *(unsigned char *)(v15 + 105) = v93;
          }

          goto LABEL_162;
        }
        int v52 = [v50 intValue];
      }
      *(_WORD *)(v15 + 108) |= 0x1000u;
      *(_WORD *)(v15 + 108) |= 1u;
      *(_DWORD *)(v15 + 100) = v52;
      goto LABEL_85;
    }
  }
  uint64_t v177 = 0;
LABEL_305:

  return v177;
}

- (GEOPDPlaceContextMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceContextMetadata;
  v2 = [(GEOPDPlaceContextMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceContextMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceContextMetadata;
  v3 = [(GEOPDPlaceContextMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceContextMetadata;
  v4 = [(GEOPDPlaceContextMetadata *)&v8 description];
  uint64_t v5 = [(GEOPDPlaceContextMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPlaceContextMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 64);
    if (v5)
    {
      objc_super v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v6 forKey:@"muid"];

      char v5 = *(unsigned char *)(a1 + 64);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v7 = *(int *)(a1 + 60);
      if (v7 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53E3EF0[v7];
      }
      if (a2) {
        int v9 = @"placeContextMetadataType";
      }
      else {
        int v9 = @"place_context_metadata_type";
      }
      [v4 setObject:v8 forKey:v9];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPDPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchPlaceContextMetadata_tags);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v12 = *(id *)(a1 + 40);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        id v14 = [v12 jsonRepresentation];
        uint64_t v15 = @"searchPlaceContextMetadata";
      }
      else
      {
        id v14 = [v12 dictionaryRepresentation];
        uint64_t v15 = @"search_place_context_metadata";
      }
      [v4 setObject:v14 forKey:v15];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAutocompletePlaceContextMetadata_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v18 = *(id *)(a1 + 24);
    id v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"autocompletePlaceContextMetadata";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"autocomplete_place_context_metadata";
      }
      [v4 setObject:v20 forKey:v21];
    }
    char v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __55__GEOPDPlaceContextMetadata__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEOPDPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_7508;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_7509;
      }
      GEOPDPlaceContextMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      -[GEOPDSearchPlaceContextMetadata readAll:](*(void *)(a1 + 40), 1);
      -[GEOPDAutocompletePlaceContextMetadata readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __55__GEOPDPlaceContextMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceContextMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_10;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_10;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    searchPlaceContextMetadata = self->_searchPlaceContextMetadata;
    if (searchPlaceContextMetadata)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&searchPlaceContextMetadata->_readerLock);
      int v7 = *(_WORD *)&searchPlaceContextMetadata->_flags & 0x1FF0;
      os_unfair_lock_unlock(&searchPlaceContextMetadata->_readerLock);
      if (v7) {
        goto LABEL_10;
      }
      char flags = (char)self->_flags;
    }
  }
  if ((flags & 8) == 0
    || (autocompletePlaceContextMetadata = (os_unfair_lock_s *)self->_autocompletePlaceContextMetadata) == 0
    || (os_unfair_lock_lock_with_options(),
        os_unfair_lock_assert_owner(autocompletePlaceContextMetadata + 22),
        int v9 = autocompletePlaceContextMetadata[28]._os_unfair_lock_opaque & 0x3F000,
        os_unfair_lock_unlock(autocompletePlaceContextMetadata + 22),
        !v9))
  {
    id v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v14 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
    goto LABEL_20;
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 0);
  char v10 = (char)self->_flags;
  if (v10)
  {
    PBDataWriterWriteUint64Field();
    char v10 = (char)self->_flags;
  }
  id v11 = v14;
  if ((v10 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v11 = v14;
  }
  if (self->_searchPlaceContextMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v11 = v14;
  }
  if (self->_autocompletePlaceContextMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v11 = v14;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v11];
LABEL_20:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    int v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceContextMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 0);
  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 32) = self->_muid;
    *(unsigned char *)(v5 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_placeContextMetadataType;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v10 = [(GEOPDSearchPlaceContextMetadata *)self->_searchPlaceContextMetadata copyWithZone:a3];
  id v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEOPDAutocompletePlaceContextMetadata *)self->_autocompletePlaceContextMetadata copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  id v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_muid != *((void *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_placeContextMetadataType != *((_DWORD *)v4 + 15)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_16;
  }
  searchPlaceContextMetadata = self->_searchPlaceContextMetadata;
  if ((unint64_t)searchPlaceContextMetadata | *((void *)v4 + 5)
    && !-[GEOPDSearchPlaceContextMetadata isEqual:](searchPlaceContextMetadata, "isEqual:"))
  {
    goto LABEL_16;
  }
  autocompletePlaceContextMetadata = self->_autocompletePlaceContextMetadata;
  if ((unint64_t)autocompletePlaceContextMetadata | *((void *)v4 + 3)) {
    char v7 = -[GEOPDAutocompletePlaceContextMetadata isEqual:](autocompletePlaceContextMetadata, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v3 = 2654435761u * self->_muid;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_placeContextMetadataType;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(GEOPDSearchPlaceContextMetadata *)self->_searchPlaceContextMetadata hash];
  return v5 ^ [(GEOPDAutocompletePlaceContextMetadata *)self->_autocompletePlaceContextMetadata hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 4u;
    *(unsigned char *)(a1 + 64) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDPlaceContextMetadata readAll:](a1, 0);
      -[GEOPDSearchPlaceContextMetadata clearUnknownFields:](*(void *)(a1 + 40), 1);
      uint64_t v5 = *(void *)(a1 + 24);
      -[GEOPDAutocompletePlaceContextMetadata clearUnknownFields:](v5, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPlaceContextMetadata, 0);
  objc_storeStrong((id *)&self->_autocompletePlaceContextMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end