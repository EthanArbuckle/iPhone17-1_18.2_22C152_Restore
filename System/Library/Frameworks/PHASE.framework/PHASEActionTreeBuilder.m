@interface PHASEActionTreeBuilder
+ (id)getParamArray:(id)a3 globalParamUIDs:(id)a4 outError:(id *)a5;
- (BOOL)addParameter:(id)a3;
- (BOOL)addRootNode:(id)a3;
- (BOOL)checkNodeForValidChannelLayouts:(id)a3 assetRegistry:(id)a4 outError:(id *)a5;
- (BOOL)processNode:(id)a3 withArray:(id)a4 assetRegistry:(id)a5 outError:(id *)a6;
- (PHASEActionTreeBuilder)init;
- (id)createParseableDictionaryWithUID:(id)a3 rootNodes:(id)a4 globalParamUIDs:(id)a5 assetRegistry:(id)a6 outError:(id *)a7;
- (id)generateNodeDictionary:(id)a3 outError:(id *)a4;
- (void)fillGeneratorNodeEntries:(id)a3 dictionary:(id)a4;
- (void)fillOutDirectivityFieldsWithParams:(id)a3 dictionary:(id)a4 isListener:(BOOL)a5;
- (void)fillOutDistanceFieldsWithParams:(id)a3 dictionary:(id)a4;
@end

@implementation PHASEActionTreeBuilder

- (PHASEActionTreeBuilder)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHASEActionTreeBuilder;
  v2 = [(PHASEActionTreeBuilder *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rootNodes = v2->_rootNodes;
    v2->_rootNodes = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    parameters = v2->_parameters;
    v2->_parameters = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mixNodes = v2->_mixNodes;
    v2->_mixNodes = v7;

    v2->_nextNodeId = 0;
    v9 = v2;
  }

  return v2;
}

- (BOOL)addRootNode:(id)a3
{
  return 1;
}

- (BOOL)addParameter:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_parameters addObject:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 inputMetaParameterDefinition];

    if (v6)
    {
      v7 = [v5 inputMetaParameterDefinition];
      BOOL v8 = [(PHASEActionTreeBuilder *)self addParameter:v7];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)fillGeneratorNodeEntries:(id)a3 dictionary:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  v7 = [v26 identifier];
  [v6 setObject:v7 forKey:@"Name"];

  BOOL v8 = GetCalibrationModeString((PHASECalibrationMode)[v26 calibrationMode]);
  [v6 setObject:v8 forKey:@"CalibrationMode"];

  v9 = (void *)0x263F08000;
  v10 = NSNumber;
  [v26 level];
  objc_super v11 = objc_msgSend(v10, "numberWithDouble:");
  [v6 setObject:v11 forKey:@"Level"];

  v12 = NSNumber;
  [v26 rate];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v6 setObject:v13 forKey:@"Rate"];

  v14 = [v26 group];
  if (v14)
  {
    v9 = [v26 group];
    v15 = [v9 identifier];
  }
  else
  {
    v15 = &stru_26D47BF58;
  }
  [v6 setObject:v15 forKey:@"Group"];
  if (v14)
  {
  }
  v16 = [v26 gainMetaParameterDefinition];

  if (v16)
  {
    v17 = [v26 gainMetaParameterDefinition];
    [(PHASEActionTreeBuilder *)self addParameter:v17];

    v18 = [v26 gainMetaParameterDefinition];
    v19 = [v18 identifier];
    [v6 setObject:v19 forKey:@"GainParameterName"];
  }
  v20 = [v26 rateMetaParameterDefinition];

  if (v20)
  {
    v21 = [v26 rateMetaParameterDefinition];
    [(PHASEActionTreeBuilder *)self addParameter:v21];

    v22 = [v26 rateMetaParameterDefinition];
    v23 = [v22 identifier];
    [v6 setObject:v23 forKey:@"RateParameterName"];
  }
  v24 = [v26 mixerDefinition];
  v25 = [v24 identifier];
  [v6 setObject:v25 forKey:@"Submix"];
}

- (id)generateNodeDictionary:(id)a3 outError:(id *)a4
{
  uint64_t v248 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  v200 = a4;
  v201 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = self;
    mixNodes = self->_mixNodes;
    objc_super v11 = [v8 mixerDefinition];
    [(NSMutableSet *)mixNodes addObject:v11];

    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:@"sampler" forKey:@"Type"];
    [(PHASEActionTreeBuilder *)v9 fillGeneratorNodeEntries:v8 dictionary:v12];
    v13 = [v8 assetIdentifier];
    [v12 setObject:v13 forKey:@"Asset"];

    v14 = GetCullOptionString((PHASECullOption)[v8 cullOption]);
    [v12 setObject:v14 forKey:@"CullOption"];

    v15 = GetPlaybackModeString((PHASEPlaybackMode)[v8 playbackMode]);
    [v12 setObject:v15 forKey:@"PlaybackMode"];
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v16 = self;
    v17 = self->_mixNodes;
    v18 = [v8 mixerDefinition];
    [(NSMutableSet *)v17 addObject:v18];

    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:@"pushstream" forKey:@"Type"];
    [(PHASEActionTreeBuilder *)v16 fillGeneratorNodeEntries:v8 dictionary:v12];
    v19 = [v8 format];
    [v12 setObject:v19 forKey:@"Format"];

    v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "normalize"));
    [v12 setObject:v20 forKey:@"Normalize"];

    v15 = [v8 targetLKFS];
    [v12 setObject:v15 forKey:@"TargetLKFS"];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v21 = self;
    v22 = self->_mixNodes;
    v23 = [v8 mixerDefinition];
    [(NSMutableSet *)v22 addObject:v23];

    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:@"externaloutputpullstream" forKey:@"Type"];
    [(PHASEActionTreeBuilder *)v21 fillGeneratorNodeEntries:v8 dictionary:v12];
    v24 = [v8 uuid];
    v25 = [v24 UUIDString];
    [v12 setObject:v25 forKey:@"UUID"];

    id v26 = GetChannelLayoutString((Phase::ChannelLayout *)[v8 channelLayoutTag]);
    [v12 setObject:v26 forKey:@"ChannelLayoutTag"];

    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "normalize"));
    [v12 setObject:v27 forKey:@"Normalize"];

    v15 = [v8 targetLKFS];
    [v12 setObject:v15 forKey:@"TargetLKFS"];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v28 = self;
    v29 = self->_mixNodes;
    v30 = [v8 mixerDefinition];
    [(NSMutableSet *)v29 addObject:v30];

    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v12 setObject:@"pullstream" forKey:@"Type"];
    [(PHASEActionTreeBuilder *)v28 fillGeneratorNodeEntries:v8 dictionary:v12];
    v31 = [v8 format];
    [v12 setObject:v31 forKey:@"Format"];

    v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "normalize"));
    [v12 setObject:v32 forKey:@"Normalize"];

    v15 = [v8 targetLKFS];
    [v12 setObject:v15 forKey:@"TargetLKFS"];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v199 = v7;
    id v204 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v230 = 0u;
    long long v231 = 0u;
    long long v228 = 0u;
    long long v229 = 0u;
    [v199 ranges];
    v198 = self;
    obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v205 = [obj countByEnumeratingWithState:&v228 objects:v247 count:16];
    if (v205)
    {
      uint64_t v203 = *(void *)v229;
      do
      {
        for (id i = 0; i != (id)v205; id i = (char *)i + 1)
        {
          if (*(void *)v229 != v203) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v228 + 1) + 8 * i);
          v206 = NSDictionary;
          v207 = [*(id *)(v34 + 8) identifier];
          id v35 = *(id *)(v34 + 16);
          id v213 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v36 = NSNumber;
          [v35 startPoint];
          v37 = objc_msgSend(v36, "numberWithDouble:");
          [v213 setValue:v37 forKey:@"StartInputValue"];

          v38 = NSNumber;
          [v35 startPoint];
          v40 = [v38 numberWithDouble:v39];
          [v213 setValue:v40 forKey:@"StartOutputValue"];

          id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
          for (unint64_t j = 0; ; ++j)
          {
            v43 = [v35 segments];
            BOOL v44 = [v43 count] > j;

            if (!v44) {
              break;
            }
            id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v46 = NSNumber;
            v47 = [v35 segments];
            v48 = [v47 objectAtIndexedSubscript:j];
            [v48 endPoint];
            v49 = objc_msgSend(v46, "numberWithDouble:");
            [v45 setValue:v49 forKey:@"InputValue"];

            v50 = NSNumber;
            v51 = [v35 segments];
            v52 = [v51 objectAtIndexedSubscript:j];
            [v52 endPoint];
            v54 = [v50 numberWithDouble:v53];
            [v45 setValue:v54 forKey:@"OutputValue"];

            v55 = [v35 segments];
            v56 = [v55 objectAtIndexedSubscript:j];
            v57 = GetCurveTypeString((PHASECurveType)[v56 curveType]);
            [v45 setValue:v57 forKey:@"CurveType"];

            [v41 addObject:v45];
          }
          [v213 setValue:v41 forKey:@"Segments"];

          v58 = objc_msgSend(v206, "dictionaryWithObjectsAndKeys:", v207, @"SubTreeNodeName", v213, @"Envelope", 0);

          [v204 addObject:v58];
        }
        uint64_t v205 = [obj countByEnumeratingWithState:&v228 objects:v247 count:16];
      }
      while (v205);
    }

    v59 = [v199 blendParameterDefinition];
    BOOL v60 = v59 == 0;

    if (!v60)
    {
      v61 = [v199 blendParameterDefinition];
      [(PHASEActionTreeBuilder *)self addParameter:v61];

      v62 = (void *)MEMORY[0x263EFF9A0];
      v63 = [v199 identifier];
      v64 = [v199 blendParameterDefinition];
      v65 = [v64 identifier];
      objc_msgSend(v62, "dictionaryWithObjectsAndKeys:", v63, @"Name", @"blend", @"Type", v204, @"Children", v65, @"BlendParameter", 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      v66 = [v199 blendParameterDefinition];
      [(PHASEActionTreeBuilder *)v198 addParameter:v66];
LABEL_54:

      goto LABEL_12;
    }
    v105 = [v199 spatialMixerDefinitionForDistance];
    BOOL v106 = v105 == 0;

    if (!v106)
    {
      v107 = self->_mixNodes;
      v108 = [v199 spatialMixerDefinitionForDistance];
      [(NSMutableSet *)v107 addObject:v108];

      v109 = (void *)MEMORY[0x263EFF9A0];
      v66 = [v199 identifier];
      v110 = [v199 spatialMixerDefinitionForDistance];
      v111 = [v110 identifier];
      objc_msgSend(v109, "dictionaryWithObjectsAndKeys:", v66, @"Name", @"blend", @"Type", v204, @"Children", @"auto_distance", @"BlendParameter", v111, @"DistanceSubmixName", 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_54;
    }
    uint64_t v184 = *MEMORY[0x263F08320];
    uint64_t v245 = *MEMORY[0x263F08320];
    v185 = [NSString stringWithFormat:@"Improperly initialized blend node"];
    v246 = v185;
    v186 = [NSDictionary dictionaryWithObjects:&v246 forKeys:&v245 count:1];

    v188 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v187)
                                                                                         + 16)));
    if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
    {
      id v189 = [v186 objectForKeyedSubscript:v184];
      uint64_t v190 = [v189 UTF8String];
      *(_DWORD *)buf = 136315650;
      v240 = "PHASEAssetRegistry.mm";
      __int16 v241 = 1024;
      int v242 = 2286;
      __int16 v243 = 2080;
      uint64_t v244 = v190;
      _os_log_impl(&dword_221E5E000, v188, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (v200)
    {
      id *v200 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924648 userInfo:v186];
    }

    goto LABEL_95;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v208 = v7;
    id v214 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v226 = 0u;
    long long v227 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    v67 = [v208 subtrees];
    id v211 = v67;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v224 objects:v238 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v225;
      while (2)
      {
        for (uint64_t k = 0; k != v68; ++k)
        {
          if (*(void *)v225 != v69) {
            objc_enumerationMutation(v211);
          }
          v71 = *(void **)(*((void *)&v224 + 1) + 8 * k);
          v72 = [v71 subtree];
          BOOL v73 = v72 == 0;

          if (v73)
          {
            uint64_t v98 = *MEMORY[0x263F08320];
            uint64_t v236 = *MEMORY[0x263F08320];
            v99 = [NSString stringWithFormat:@"Switch node subtree is nil"];
            v237 = v99;
            v100 = [NSDictionary dictionaryWithObjects:&v237 forKeys:&v236 count:1];

            v102 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v101)
                                                                                                 + 16)));
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
            {
              id v103 = [v100 objectForKeyedSubscript:v98];
              uint64_t v104 = [v103 UTF8String];
              *(_DWORD *)buf = 136315650;
              v240 = "PHASEAssetRegistry.mm";
              __int16 v241 = 1024;
              int v242 = 2304;
              __int16 v243 = 2080;
              uint64_t v244 = v104;
              _os_log_impl(&dword_221E5E000, v102, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
            }
            if (v200)
            {
              id *v200 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924648 userInfo:v100];
            }

            goto LABEL_95;
          }
          v74 = NSDictionary;
          v75 = [v71 subtree];
          v76 = [v75 identifier];
          v77 = [v71 switchValue];
          v78 = objc_msgSend(v74, "dictionaryWithObjectsAndKeys:", v76, @"SubTreeNodeName", v77, @"SwitchValue", 0);

          [v214 addObject:v78];
        }
        v67 = v211;
        uint64_t v68 = [v211 countByEnumeratingWithState:&v224 objects:v238 count:16];
        if (v68) {
          continue;
        }
        break;
      }
    }

    v79 = [v208 switchMetaParameterDefinition];
    [(PHASEActionTreeBuilder *)self addParameter:v79];

    v80 = (void *)MEMORY[0x263EFF9A0];
    v81 = [v208 identifier];
    v82 = [v208 switchMetaParameterDefinition];
    v83 = [v82 identifier];
    objc_msgSend(v80, "dictionaryWithObjectsAndKeys:", v81, @"Name", @"switch", @"Type", v83, @"SwitchParameter", v214, @"Children", 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v209 = v7;
      id v215 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v222 = 0u;
      long long v223 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      v84 = [v209 subtrees];
      id v212 = v84;
      uint64_t v85 = [v84 countByEnumeratingWithState:&v220 objects:v235 count:16];
      if (v85)
      {
        uint64_t v86 = *(void *)v221;
        do
        {
          for (uint64_t m = 0; m != v85; ++m)
          {
            if (*(void *)v221 != v86) {
              objc_enumerationMutation(v212);
            }
            v88 = *(void **)(*((void *)&v220 + 1) + 8 * m);
            v89 = NSDictionary;
            v90 = [v88 subtree];
            v91 = [v90 identifier];
            v92 = NSNumber;
            [v88 weight];
            v93 = objc_msgSend(v92, "numberWithDouble:");
            v94 = objc_msgSend(v89, "dictionaryWithObjectsAndKeys:", v91, @"SubTreeNodeName", v93, @"Weight", 0);

            [v215 addObject:v94];
          }
          v84 = v212;
          uint64_t v85 = [v212 countByEnumeratingWithState:&v220 objects:v235 count:16];
        }
        while (v85);
      }

      v95 = (void *)MEMORY[0x263EFF9A0];
      v96 = [v209 identifier];
      v97 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v209, "uniqueSelectionQueueLength"));
      objc_msgSend(v95, "dictionaryWithObjectsAndKeys:", v96, @"Name", @"random", @"Type", v97, @"UniqueSelectionQueueLength", v215, @"Children", 0);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v112 = v7;
        id v113 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v218 = 0u;
        long long v219 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        v114 = [v112 children];
        uint64_t v115 = [v114 countByEnumeratingWithState:&v216 objects:v234 count:16];
        if (v115)
        {
          uint64_t v116 = *(void *)v217;
          do
          {
            for (uint64_t n = 0; n != v115; ++n)
            {
              if (*(void *)v217 != v116) {
                objc_enumerationMutation(v114);
              }
              v118 = [*(id *)(*((void *)&v216 + 1) + 8 * n) identifier];
              [v113 addObject:v118];
            }
            uint64_t v115 = [v114 countByEnumeratingWithState:&v216 objects:v234 count:16];
          }
          while (v115);
        }

        v119 = (void *)MEMORY[0x263EFF9A0];
        v120 = [v112 identifier];
        objc_msgSend(v119, "dictionaryWithObjectsAndKeys:", v120, @"Name", @"container", @"Type", v113, @"Children", 0);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            uint64_t v191 = *MEMORY[0x263F08320];
            uint64_t v232 = *MEMORY[0x263F08320];
            v192 = [NSString stringWithFormat:@"Unexpected object in submix array"];
            v233 = v192;
            v193 = [NSDictionary dictionaryWithObjects:&v233 forKeys:&v232 count:1];

            v195 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v194)
                                                                                                 + 16)));
            if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
            {
              id v196 = [v193 objectForKeyedSubscript:v191];
              uint64_t v197 = [v196 UTF8String];
              *(_DWORD *)buf = 136315650;
              v240 = "PHASEAssetRegistry.mm";
              __int16 v241 = 1024;
              int v242 = 2471;
              __int16 v243 = 2080;
              uint64_t v244 = v197;
              _os_log_impl(&dword_221E5E000, v195, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
            }
            id *v200 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924648 userInfo:v193];
          }
LABEL_95:
          id v12 = 0;
          goto LABEL_12;
        }
        id v121 = v7;
        v122 = self;
        v123 = self->_mixNodes;
        v124 = [v121 mixerDefinition];
        [(NSMutableSet *)v123 addObject:v124];

        id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [v12 setObject:@"procedure" forKey:@"Type"];
        [(PHASEActionTreeBuilder *)v122 fillGeneratorNodeEntries:v121 dictionary:v12];
        v125 = GetCullOptionString((PHASECullOption)[v121 cullOption]);
        [v12 setObject:v125 forKey:@"CullOption"];

        v126 = GetPlaybackModeString((PHASEPlaybackMode)[v121 playbackMode]);
        [v12 setObject:v126 forKey:@"PlaybackMode"];

        v127 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v121, "maxPolyphony"));
        [v12 setObject:v127 forKey:@"ProcedureMaxPolyphony"];

        v128 = GetVoiceStealingTypeString([v121 voiceStealingType]);
        [v12 setObject:v128 forKey:@"ProcedureVoiceStealingType"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v12 setObject:@"water" forKey:@"ProcedureType"];
          id v129 = v121;
          v130 = NSNumber;
          [v129 fallRate];
          v131 = objc_msgSend(v130, "numberWithDouble:");
          [v12 setObject:v131 forKey:@"FallRate"];

          v132 = NSNumber;
          [v129 averageDropDiameter];
          v133 = objc_msgSend(v132, "numberWithDouble:");
          [v12 setObject:v133 forKey:@"AverageDropDiameter"];

          v134 = NSNumber;
          [v129 maxDropDiameter];
          v135 = objc_msgSend(v134, "numberWithDouble:");
          [v12 setObject:v135 forKey:@"MaxDropDiameter"];

          v136 = NSNumber;
          [v129 impulseShape];
          v137 = objc_msgSend(v136, "numberWithDouble:");
          [v12 setObject:v137 forKey:@"ImpulseShape"];

          v138 = NSNumber;
          [v129 impulseGainExponent];
          v139 = objc_msgSend(v138, "numberWithDouble:");
          [v12 setObject:v139 forKey:@"ImpulseGainExponent"];

          v140 = NSNumber;
          [v129 impulseGain];
          v141 = objc_msgSend(v140, "numberWithDouble:");
          [v12 setObject:v141 forKey:@"ImpulseGain"];

          v142 = NSNumber;
          [v129 chirpRiseRate];
          v143 = objc_msgSend(v142, "numberWithDouble:");
          [v12 setObject:v143 forKey:@"ChirpRiseRate"];

          v144 = NSNumber;
          [v129 baseFrequencyMultiplier];
          v145 = objc_msgSend(v144, "numberWithDouble:");
          [v12 setObject:v145 forKey:@"BaseFrequencyMultiplier"];

          v146 = NSNumber;
          [v129 bubbleGain];
          v147 = objc_msgSend(v146, "numberWithDouble:");
          [v12 setObject:v147 forKey:@"BubbleGain"];

          v148 = [v129 fallRateMetaParameterDefinition];

          if (v148)
          {
            v149 = [v129 fallRateMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v149];

            v150 = [v129 fallRateMetaParameterDefinition];
            v151 = [v150 identifier];
            [v12 setObject:v151 forKey:@"FallRateParameterName"];
          }
          v152 = [v129 averageDropDiameterMetaParameterDefinition];

          if (v152)
          {
            v153 = [v129 averageDropDiameterMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v153];

            v154 = [v129 averageDropDiameterMetaParameterDefinition];
            v155 = [v154 identifier];
            [v12 setObject:v155 forKey:@"AverageDropDiameterParameterName"];
          }
          v156 = [v129 maxDropDiameterMetaParameterDefinition];

          if (v156)
          {
            v157 = [v129 maxDropDiameterMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v157];

            v158 = [v129 maxDropDiameterMetaParameterDefinition];
            v159 = [v158 identifier];
            [v12 setObject:v159 forKey:@"MaxDropDiameterParameterName"];
          }
          v160 = [v129 impulseShapeMetaParameterDefinition];

          if (v160)
          {
            v161 = [v129 impulseShapeMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v161];

            v162 = [v129 impulseShapeMetaParameterDefinition];
            v163 = [v162 identifier];
            [v12 setObject:v163 forKey:@"ImpulseShapeParameterName"];
          }
          v164 = [v129 impulseGainExponentMetaParameterDefinition];

          if (v164)
          {
            v165 = [v129 impulseGainExponentMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v165];

            v166 = [v129 impulseGainExponentMetaParameterDefinition];
            v167 = [v166 identifier];
            [v12 setObject:v167 forKey:@"ImpulseGainExponentParameterName"];
          }
          v168 = [v129 impulseGainMetaParameterDefinition];

          if (v168)
          {
            v169 = [v129 impulseGainMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v169];

            v170 = [v129 impulseGainMetaParameterDefinition];
            v171 = [v170 identifier];
            [v12 setObject:v171 forKey:@"ImpulseGainParameterName"];
          }
          v172 = [v129 chirpRiseRateMetaParameterDefinition];

          if (v172)
          {
            v173 = [v129 chirpRiseRateMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v173];

            v174 = [v129 chirpRiseRateMetaParameterDefinition];
            v175 = [v174 identifier];
            [v12 setObject:v175 forKey:@"ChirpRiseRateParameterName"];
          }
          v176 = [v129 baseFrequencyMultiplierMetaParameterDefinition];

          if (v176)
          {
            v177 = [v129 baseFrequencyMultiplierMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v177];

            v178 = [v129 baseFrequencyMultiplierMetaParameterDefinition];
            v179 = [v178 identifier];
            [v12 setObject:v179 forKey:@"BaseFrequencyMultiplierParameterName"];
          }
          v180 = [v129 bubbleGainMetaParameterDefinition];

          if (v180)
          {
            v181 = [v129 bubbleGainMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v122 addParameter:v181];

            v182 = [v129 bubbleGainMetaParameterDefinition];
            v183 = [v182 identifier];
            [v12 setObject:v183 forKey:@"BubbleGainParameterName"];
          }
        }
      }
    }
  }
LABEL_12:

  return v12;
}

- (BOOL)processNode:(id)a3 withArray:(id)a4 assetRegistry:(id)a5 outError:(id *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6) {
    *a6 = 0;
  }
  if ([(PHASEActionTreeBuilder *)self checkNodeForValidChannelLayouts:v10 assetRegistry:v12 outError:a6])
  {
    v13 = [(PHASEActionTreeBuilder *)self generateNodeDictionary:v10 outError:a6];
    if (v13)
    {
      [v11 addObject:v13];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v14 = objc_msgSend(v10, "children", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v14);
            }
            if (![(PHASEActionTreeBuilder *)self processNode:*(void *)(*((void *)&v20 + 1) + 8 * i) withArray:v11 assetRegistry:v12 outError:a6])
            {
              BOOL v18 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
      BOOL v18 = 1;
LABEL_16:
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)getParamArray:(id)a3 globalParamUIDs:(id)a4 outError:(id *)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v61 = a3;
  id v66 = a4;
  id v62 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a5) {
    *a5 = 0;
  }
  BOOL v60 = a5;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = v61;
  uint64_t v67 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v67)
  {
    uint64_t v65 = *(void *)v75;
    while (2)
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v75 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v68 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v7 = [v68 identifier];
        char v8 = [v66 containsObject:v7];

        if ((v8 & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v64 = v68;
            id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v10 = [v64 envelope];
            id v11 = [v10 segments];

            uint64_t v12 = [v11 countByEnumeratingWithState:&v70 objects:v86 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v71;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v71 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                  uint64_t v16 = NSDictionary;
                  v17 = NSNumber;
                  [v15 endPoint];
                  BOOL v18 = objc_msgSend(v17, "numberWithDouble:");
                  v19 = NSNumber;
                  [v15 endPoint];
                  long long v21 = [v19 numberWithDouble:v20];
                  long long v22 = GetCurveTypeString((PHASECurveType)[v15 curveType]);
                  long long v23 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v18, @"InputValue", v21, @"OutputValue", v22, @"CurveType", 0);

                  [v9 addObject:v23];
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v70 objects:v86 count:16];
              }
              while (v12);
            }

            v24 = NSDictionary;
            uint64_t v25 = NSNumber;
            id v26 = [v64 envelope];
            [v26 startPoint];
            v27 = objc_msgSend(v25, "numberWithDouble:");
            v28 = NSNumber;
            v29 = [v64 envelope];
            [v29 startPoint];
            v31 = [v28 numberWithDouble:v30];
            v32 = objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v27, @"StartInputValue", v31, @"StartOutputValue", v9, @"Segments", 0);

            v33 = NSDictionary;
            uint64_t v34 = [v64 identifier];
            id v35 = [v64 inputMetaParameterDefinition];
            v36 = [v35 identifier];
            v37 = objc_msgSend(v33, "dictionaryWithObjectsAndKeys:", @"mapped_range", @"Type", v34, @"Name", v36, @"LinkedInputParameter", @"float", @"InputType", @"float", @"OutputType", v32, @"Envelope", 0);

            [v62 addObject:v37];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v38 = v68;
              double v39 = NSDictionary;
              v40 = [v38 identifier];
              id v41 = NSNumber;
              [v38 minimum];
              v42 = objc_msgSend(v41, "numberWithDouble:");
              v43 = NSNumber;
              [v38 maximum];
              BOOL v44 = objc_msgSend(v43, "numberWithDouble:");
              id v45 = [v38 value];
              objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v40, @"Name", @"input", @"Type", @"float", @"InputType", v42, @"RangeMin", v44, @"RangeMax", v45, @"DefaultValue", 0);
              id v9 = (id)objc_claimAutoreleasedReturnValue();

              [v62 addObject:v9];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v60)
                {
                  uint64_t v52 = *MEMORY[0x263F08320];
                  uint64_t v84 = *MEMORY[0x263F08320];
                  double v53 = [NSString stringWithFormat:@"Unexpected object in metaparameter array"];
                  uint64_t v85 = v53;
                  v54 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];

                  v56 = **(id **)(Phase::Logger::GetInstance(v55) + 16);
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    id v57 = [v54 objectForKeyedSubscript:v52];
                    uint64_t v58 = [v57 UTF8String];
                    *(_DWORD *)buf = 136315650;
                    v79 = "PHASEAssetRegistry.mm";
                    __int16 v80 = 1024;
                    int v81 = 2613;
                    __int16 v82 = 2080;
                    uint64_t v83 = v58;
                    _os_log_impl(&dword_221E5E000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
                  }
                  *BOOL v60 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924648 userInfo:v54];
                }
                id v51 = 0;
                v50 = v62;
                goto LABEL_31;
              }
              id v46 = v68;
              v47 = NSDictionary;
              v48 = [v46 identifier];
              v49 = [v46 value];
              objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, @"Name", @"input", @"Type", @"string", @"InputType", v49, @"DefaultValue", 0);
              id v9 = (id)objc_claimAutoreleasedReturnValue();

              [v62 addObject:v9];
            }
          }
        }
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
      if (v67) {
        continue;
      }
      break;
    }
  }

  v50 = v62;
  id v51 = v62;
LABEL_31:

  return v51;
}

- (void)fillOutDistanceFieldsWithParams:(id)a3 dictionary:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v30 = v6;
  v31 = v5;
  if (v5)
  {
    v7 = [v5 fadeOutParameters];

    if (v7)
    {
      char v8 = NSNumber;
      id v9 = [v5 fadeOutParameters];
      [v9 cullDistance];
      id v10 = objc_msgSend(v8, "numberWithDouble:");
      [v30 setObject:v10 forKey:@"FadeOutCullDistance"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v30 setObject:@"geometric_spreading" forKey:@"DistanceModelType"];
      id v11 = v5;
      uint64_t v12 = NSNumber;
      [v11 rolloffFactor];
      uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
      [v30 setObject:v13 forKey:@"RolloffFactor"];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v30 setObject:@"envelope" forKey:@"DistanceModelType"];
        id v29 = v5;
        id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v15 = [v29 envelope];
        uint64_t v16 = [v15 segments];

        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v33 != v18) {
                objc_enumerationMutation(v16);
              }
              double v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              long long v21 = (void *)MEMORY[0x263EFF9A0];
              long long v22 = NSNumber;
              [v20 endPoint];
              long long v23 = objc_msgSend(v22, "numberWithDouble:");
              v24 = NSNumber;
              [v20 endPoint];
              id v26 = [v24 numberWithDouble:v25];
              v27 = GetCurveTypeString((PHASECurveType)[v20 curveType]);
              v28 = objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v23, @"Distance", v26, @"Gain", v27, @"CurveType", 0, v29);

              [v14 addObject:v28];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v17);
        }

        [v30 setObject:v14 forKey:@"EnvelopeSegments"];
      }
    }
  }
  else
  {
    [v6 setObject:@"none" forKey:@"DistanceModelType"];
  }
}

- (void)fillOutDirectivityFieldsWithParams:(id)a3 dictionary:(id)a4 isListener:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v52 = v8;
  double v53 = v7;
  if (v7)
  {
    BOOL v51 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v5) {
        id v9 = @"ListenerDirectivityModelType";
      }
      else {
        id v9 = @"SourceDirectivityModelType";
      }
      [v52 setObject:@"cardioid" forKey:v9];
      id v54 = v7;
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      obuint64_t j = [v54 subbandParameters];
      uint64_t v11 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v63 != v12) {
              objc_enumerationMutation(obj);
            }
            id v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            uint64_t v15 = (void *)MEMORY[0x263EFF9A0];
            uint64_t v16 = NSNumber;
            [v14 frequency];
            uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
            uint64_t v18 = NSNumber;
            [v14 pattern];
            v19 = objc_msgSend(v18, "numberWithDouble:");
            double v20 = NSNumber;
            [v14 sharpness];
            long long v21 = objc_msgSend(v20, "numberWithDouble:");
            long long v22 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v17, @"Frequency", v19, @"Pattern", v21, @"Sharpness", 0);

            [v10 addObject:v22];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        }
        while (v11);
      }

      if (v51) {
        long long v23 = @"ListenerCardioidDirectivitySubbands";
      }
      else {
        long long v23 = @"SourceCardioidDirectivitySubbands";
      }
      [v52 setObject:v10 forKey:v23];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v5) {
          double v25 = @"ListenerDirectivityModelType";
        }
        else {
          double v25 = @"SourceDirectivityModelType";
        }
        [v52 setObject:@"cone" forKey:v25];
        id v50 = v7;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id obja = objc_alloc_init(MEMORY[0x263EFF980]);
        id v55 = [v50 subbandParameters];
        uint64_t v26 = [v55 countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v59 != v27) {
                objc_enumerationMutation(v55);
              }
              id v29 = *(void **)(*((void *)&v58 + 1) + 8 * j);
              double v30 = (void *)MEMORY[0x263EFF9A0];
              v31 = NSNumber;
              [v29 frequency];
              long long v32 = objc_msgSend(v31, "numberWithDouble:");
              long long v33 = NSNumber;
              [v29 innerAngle];
              long long v34 = objc_msgSend(v33, "numberWithDouble:");
              long long v35 = NSNumber;
              [v29 outerAngle];
              v36 = objc_msgSend(v35, "numberWithDouble:");
              uint64_t v37 = NSNumber;
              [v29 outerGain];
              id v38 = objc_msgSend(v37, "numberWithDouble:");
              double v39 = objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v32, @"Frequency", v34, @"InnerAngle", v36, @"OuterAngle", v38, @"OuterGain", 0, v50);

              [obja addObject:v39];
            }
            uint64_t v26 = [v55 countByEnumeratingWithState:&v58 objects:v66 count:16];
          }
          while (v26);
        }

        if (v51) {
          v40 = @"ListenerConeDirectivitySubbands";
        }
        else {
          v40 = @"SourceConeDirectivitySubbands";
        }
        [v52 setObject:obja forKey:v40];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v5) {
            id v41 = @"ListenerDirectivityModelType";
          }
          else {
            id v41 = @"SourceDirectivityModelType";
          }
          [v52 setObject:@"sphericalcap" forKey:v41];
          id v42 = v7;
          v43 = (void *)MEMORY[0x263EFF9A0];
          BOOL v44 = NSNumber;
          [v42 sphereRadius];
          id v45 = objc_msgSend(v44, "numberWithDouble:");
          id v46 = NSNumber;
          [v42 capOpeningAngle];
          v47 = objc_msgSend(v46, "numberWithDouble:");
          v48 = objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v45, @"SphereRadius", v47, @"CapOpeningAngle", 0);

          if (v51) {
            v49 = @"ListenerSphericalCapDirectivityParameters";
          }
          else {
            v49 = @"SourceSphericalCapDirectivityParameters";
          }
          [v52 setObject:v48 forKey:v49];
        }
      }
    }
  }
  else
  {
    if (v5) {
      v24 = @"ListenerDirectivityModelType";
    }
    else {
      v24 = @"SourceDirectivityModelType";
    }
    [v8 setObject:@"none" forKey:v24];
  }
}

- (BOOL)checkNodeForValidChannelLayouts:(id)a3 assetRegistry:(id)a4 outError:(id *)a5
{
  v67[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_38;
  }
  id v9 = v7;
  id v10 = [v9 mixerDefinition];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    double v20 = [v9 mixerDefinition];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) == 0)
    {
LABEL_37:

LABEL_38:
      BOOL v54 = 1;
      goto LABEL_39;
    }
    uint64_t v12 = [v9 mixerDefinition];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v9;
      long long v23 = [v22 assetIdentifier];
      uint64_t v25 = objc_msgSend(v8, "getSoundAssetInfo:", Phase::GetStringHashId(v23, v24));

      if (!v25)
      {
LABEL_14:

LABEL_36:
        goto LABEL_37;
      }
      int v26 = *(_DWORD *)(v25 + 36);
      uint64_t v27 = [v12 inputChannelLayout];
      int v28 = [v27 layoutTag];

      if (v26 == v28) {
        goto LABEL_36;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        v43 = [v9 format];
        BOOL v44 = [v43 channelLayout];
        int v45 = [v44 layoutTag];
        id v46 = [v12 inputChannelLayout];
        int v47 = [v46 layoutTag];

        if (v45 == v47) {
          goto LABEL_36;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        id v55 = [v12 inputChannelLayout];
        int v56 = [v55 layoutTag];

        if (v56 == 6553601) {
          goto LABEL_36;
        }
      }
    }
    uint64_t v48 = *MEMORY[0x263F08320];
    v49 = objc_msgSend(NSString, "stringWithFormat:", @"Channel layout mismatch between generator node and ambient mixer.", *MEMORY[0x263F08320]);
    long long v59 = v49;
    v36 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];

    BOOL v51 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v50)
                                                                                        + 16)));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v52 = [v36 objectForKeyedSubscript:v48];
      uint64_t v53 = [v52 UTF8String];
      *(_DWORD *)buf = 136315650;
      long long v61 = "PHASEAssetRegistry.mm";
      __int16 v62 = 1024;
      int v63 = 2844;
      __int16 v64 = 2080;
      uint64_t v65 = v53;
      _os_log_impl(&dword_221E5E000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (!a5) {
      goto LABEL_33;
    }
    v40 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924646 userInfo:v36];
    goto LABEL_32;
  }
  uint64_t v12 = [v9 mixerDefinition];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    id v14 = [v13 assetIdentifier];
    uint64_t v16 = objc_msgSend(v8, "getSoundAssetInfo:", Phase::GetStringHashId(v14, v15));

    if (v16)
    {
      int v17 = *(_DWORD *)(v16 + 36);
      uint64_t v18 = [v12 inputChannelLayout];
      int v19 = [v18 layoutTag];

      if (v17 == v19) {
        goto LABEL_36;
      }
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v29 = [v9 format];
    double v30 = [v29 channelLayout];
    int v31 = [v30 layoutTag];
    long long v32 = [v12 inputChannelLayout];
    int v33 = [v32 layoutTag];

    if (v31 == v33) {
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_36;
    }
    id v41 = [v12 inputChannelLayout];
    int v42 = [v41 layoutTag];

    if (v42 == 6553601) {
      goto LABEL_36;
    }
  }
LABEL_17:
  uint64_t v34 = *MEMORY[0x263F08320];
  uint64_t v66 = *MEMORY[0x263F08320];
  long long v35 = [NSString stringWithFormat:@"Channel layout mismatch between generator node and channel mixer."];
  v67[0] = v35;
  v36 = [NSDictionary dictionaryWithObjects:v67 forKeys:&v66 count:1];

  id v38 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v37)
                                                                                      + 16)));
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = [v36 objectForKeyedSubscript:v34];
    *(_DWORD *)buf = 136315650;
    long long v61 = "PHASEAssetRegistry.mm";
    __int16 v62 = 1024;
    int v63 = 2793;
    __int16 v64 = 2080;
    uint64_t v65 = [v39 UTF8String];
    _os_log_impl(&dword_221E5E000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
  }
  if (!a5) {
    goto LABEL_33;
  }
  v40 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924646 userInfo:v36];
LABEL_32:
  *a5 = v40;
LABEL_33:

  BOOL v54 = 0;
LABEL_39:

  return v54;
}

- (id)createParseableDictionaryWithUID:(id)a3 rootNodes:(id)a4 globalParamUIDs:(id)a5 assetRegistry:(id)a6 outError:(id *)a7
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  id v118 = a3;
  id v116 = a4;
  id v119 = a5;
  id v126 = a6;
  self->_nextNodeId = 0;
  id v127 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a7) {
    *a7 = 0;
  }
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  obuint64_t j = v116;
  uint64_t v12 = [obj countByEnumeratingWithState:&v140 objects:v158 count:16];
  if (!v12)
  {
LABEL_11:
    v124 = self;
    uint64_t v115 = a7;

    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v113 = objc_alloc_init(MEMORY[0x263EFF980]);
    v114 = self->_mixNodes;
    uint64_t v15 = a7;
    uint64_t v108 = [(NSMutableSet *)v114 countByEnumeratingWithState:&v136 objects:v157 count:16];
    if (!v108)
    {
LABEL_52:

      v90 = [(NSMutableSet *)v124->_parameters allObjects];
      v114 = +[PHASEActionTreeBuilder getParamArray:v90 globalParamUIDs:v119 outError:v115];

      if (!v114)
      {
        v114 = 0;
        goto LABEL_61;
      }
      uint64_t v15 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v118, @"Name", v114, @"Parameters", v113, @"Submixes", v127, @"Nodes", 0);
LABEL_62:

      v91 = v113;
      goto LABEL_63;
    }
    uint64_t v111 = *(void *)v137;
LABEL_13:
    uint64_t v117 = 0;
    while (1)
    {
      if (*(void *)v137 != v111) {
        objc_enumerationMutation(v114);
      }
      v123 = *(void **)(*((void *)&v136 + 1) + 8 * v117);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v121 = v123;
        id v120 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        uint64_t v16 = [v121 spatialPipeline];
        id v112 = [v16 entries];

        uint64_t v106 = [v112 countByEnumeratingWithState:&v132 objects:v156 count:16];
        if (v106)
        {
          uint64_t v107 = *(void *)v133;
          do
          {
            for (uint64_t i = 0; i != v106; ++i)
            {
              if (*(void *)v133 != v107) {
                objc_enumerationMutation(v112);
              }
              int v17 = *(NSString **)(*((void *)&v132 + 1) + 8 * i);
              uint64_t v18 = [v121 spatialPipeline];
              int v19 = [v18 entries];
              v109 = v17;
              double v20 = [v19 objectForKeyedSubscript:v17];
              LODWORD(v17) = v20 == 0;

              if (v17) {
                std::terminate();
              }
              char v21 = [v121 spatialPipeline];
              id v22 = [v21 entries];
              long long v23 = [v22 objectForKeyedSubscript:v109];

              id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              long long v130 = 0u;
              long long v131 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              uint64_t v25 = [v23 tweakParams];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v128 objects:v155 count:16];
              if (v26)
              {
                uint64_t v27 = *(void *)v129;
                while (2)
                {
                  for (uint64_t j = 0; j != v26; ++j)
                  {
                    if (*(void *)v129 != v27) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v29 = *(void *)(*((void *)&v128 + 1) + 8 * j);
                    double v30 = [v23 tweakParams];
                    int v31 = [v30 objectForKeyedSubscript:v29];

                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v24 setObject:v31 forKeyedSubscript:v29];
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        uint64_t v92 = *MEMORY[0x263F08320];
                        uint64_t v153 = *MEMORY[0x263F08320];
                        v93 = [NSString stringWithFormat:@"Unexpected object in tweak param struct.  Must be a number or parameter."];
                        v154 = v93;
                        v94 = [NSDictionary dictionaryWithObjects:&v154 forKeys:&v153 count:1];

                        v96 = **(id **)(Phase::Logger::GetInstance(v95) + 16);
                        if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                        {
                          id v97 = [v94 objectForKeyedSubscript:v92];
                          uint64_t v98 = [v97 UTF8String];
                          *(_DWORD *)buf = 136315650;
                          v148 = "PHASEAssetRegistry.mm";
                          __int16 v149 = 1024;
                          int v150 = 2915;
                          __int16 v151 = 2080;
                          uint64_t v152 = v98;
                          _os_log_impl(&dword_221E5E000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
                        }
                        if (v115)
                        {
                          *uint64_t v115 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924648 userInfo:v94];
                        }

                        goto LABEL_60;
                      }
                      id v32 = v31;
                      int v33 = [v32 identifier];
                      uint64_t v34 = [NSString stringWithFormat:@"%@%@", @"metaparam_", v29];
                      [v24 setObject:v33 forKeyedSubscript:v34];

                      [(PHASEActionTreeBuilder *)v124 addParameter:v32];
                    }
                  }
                  uint64_t v26 = [v25 countByEnumeratingWithState:&v128 objects:v155 count:16];
                  if (v26) {
                    continue;
                  }
                  break;
                }
              }

              long long v35 = (void *)MEMORY[0x263EFF9A0];
              v36 = GetSpatialCategoryStringFromSpatialCategoryKey(v109);
              uint64_t v37 = NSNumber;
              [v23 sendLevel];
              id v38 = objc_msgSend(v37, "numberWithDouble:");
              uint64_t v39 = [NSNumber numberWithDouble:1.0];
              v40 = [NSNumber numberWithDouble:1.0];
              id v41 = objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, @"Category", v38, @"Send", v39, @"SendHF", v40, @"SendLF", v24, @"TweakParams", 0);

              int v42 = [v23 sendLevelMetaParameterDefinition];
              LOBYTE(v39) = v42 == 0;

              if ((v39 & 1) == 0)
              {
                v43 = [v23 sendLevelMetaParameterDefinition];
                BOOL v44 = [v43 identifier];
                [v41 setObject:v44 forKey:@"SendParameterName"];

                int v45 = [v23 sendLevelMetaParameterDefinition];
                [(PHASEActionTreeBuilder *)v124 addParameter:v45];
              }
              [v120 addObject:v41];
            }
            uint64_t v106 = [v112 countByEnumeratingWithState:&v132 objects:v156 count:16];
          }
          while (v106);
        }

        id v46 = (void *)MEMORY[0x263EFF9A0];
        uint64_t v47 = [v121 identifier];
        uint64_t v48 = NSNumber;
        [v121 gain];
        v49 = objc_msgSend(v48, "numberWithDouble:");
        id v50 = objc_msgSend(v46, "dictionaryWithObjectsAndKeys:", v47, @"Name", @"spatial", @"Type", v49, @"Gain", v120, @"SpatialCategories", 0);

        BOOL v51 = [v121 gainMetaParameterDefinition];
        LOBYTE(v47) = v51 == 0;

        if ((v47 & 1) == 0)
        {
          id v52 = [v121 gainMetaParameterDefinition];
          uint64_t v53 = [v52 identifier];
          [v50 setObject:v53 forKey:@"GainParameterName"];

          BOOL v54 = [v121 gainMetaParameterDefinition];
          [(PHASEActionTreeBuilder *)v124 addParameter:v54];
        }
        id v55 = [v121 distanceModelParameters];
        [(PHASEActionTreeBuilder *)v124 fillOutDistanceFieldsWithParams:v55 dictionary:v50];

        int v56 = [v121 listenerDirectivityModelParameters];
        [(PHASEActionTreeBuilder *)v124 fillOutDirectivityFieldsWithParams:v56 dictionary:v50 isListener:1];

        id v57 = [v121 sourceDirectivityModelParameters];
        [(PHASEActionTreeBuilder *)v124 fillOutDirectivityFieldsWithParams:v57 dictionary:v50 isListener:0];

        uint64_t v58 = NSNumber;
        [v121 listenerDopplerFactor];
        long long v59 = objc_msgSend(v58, "numberWithDouble:");
        [v50 setObject:v59 forKey:@"ListenerDopplerFactor"];

        long long v60 = NSNumber;
        [v121 sourceDopplerFactor];
        long long v61 = objc_msgSend(v60, "numberWithDouble:");
        [v50 setObject:v61 forKey:@"SourceDopplerFactor"];

        [v113 addObject:v50];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v62 = v123;
          int v63 = (void *)MEMORY[0x263EFF9A0];
          uint64_t v64 = [v62 identifier];
          uint64_t v65 = NSNumber;
          [v62 gain];
          uint64_t v66 = objc_msgSend(v65, "numberWithDouble:");
          uint64_t v67 = [v62 inputChannelLayout];
          uint64_t v68 = GetChannelLayoutString((Phase::ChannelLayout *)[v67 layoutTag]);
          objc_msgSend(v63, "dictionaryWithObjectsAndKeys:", v64, @"Name", @"channel", @"Type", v66, @"Gain", v68, @"ChannelLayout", 0);
          id v120 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v69 = [v62 gainMetaParameterDefinition];
          LOBYTE(v64) = v69 == 0;

          if ((v64 & 1) == 0)
          {
            long long v70 = [v62 gainMetaParameterDefinition];
            long long v71 = [v70 identifier];
            [v120 setObject:v71 forKey:@"GainParameterName"];

            long long v72 = [v62 gainMetaParameterDefinition];
            [(PHASEActionTreeBuilder *)v124 addParameter:v72];
          }
          [v113 addObject:v120];
          goto LABEL_50;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v15) {
            goto LABEL_62;
          }
          uint64_t v100 = *MEMORY[0x263F08320];
          uint64_t v144 = *MEMORY[0x263F08320];
          v101 = [NSString stringWithFormat:@"Unexpected object in submix array"];
          v145 = v101;
          id v121 = [NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];

          id v103 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v102)
                                                                                               + 16)));
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            id v104 = [v121 objectForKeyedSubscript:v100];
            uint64_t v105 = [v104 UTF8String];
            *(_DWORD *)buf = 136315650;
            v148 = "PHASEAssetRegistry.mm";
            __int16 v149 = 1024;
            int v150 = 3021;
            __int16 v151 = 2080;
            uint64_t v152 = v105;
            _os_log_impl(&dword_221E5E000, v103, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
          }
          *uint64_t v115 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924648 userInfo:v121];
LABEL_60:

LABEL_61:
          uint64_t v15 = 0;
          goto LABEL_62;
        }
        id v73 = v123;
        [v73 orientation];
        long long v122 = v74;
        long long v75 = [NSNumber numberWithFloat:*(double *)&v74];
        v146[0] = v75;
        HIDWORD(v76) = DWORD1(v122);
        LODWORD(v76) = DWORD1(v122);
        long long v77 = [NSNumber numberWithFloat:v76];
        v146[1] = v77;
        v78 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v122), DWORD2(v122))));
        v146[2] = v78;
        v79 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v122), HIDWORD(v122))));
        v146[3] = v79;
        id v120 = [MEMORY[0x263EFF8C0] arrayWithObjects:v146 count:4];

        __int16 v80 = (void *)MEMORY[0x263EFF9A0];
        int v81 = [v73 identifier];
        __int16 v82 = NSNumber;
        [v73 gain];
        uint64_t v83 = objc_msgSend(v82, "numberWithDouble:");
        uint64_t v84 = [v73 inputChannelLayout];
        uint64_t v85 = GetChannelLayoutString((Phase::ChannelLayout *)[(id)v84 layoutTag]);
        id v50 = objc_msgSend(v80, "dictionaryWithObjectsAndKeys:", v81, @"Name", @"ambient", @"Type", v83, @"Gain", v120, @"Orientation", v85, @"ChannelLayout", 0);

        uint64_t v86 = [v73 gainMetaParameterDefinition];
        LOBYTE(v84) = v86 == 0;

        if ((v84 & 1) == 0)
        {
          v87 = [v73 gainMetaParameterDefinition];
          uint64_t v88 = [v87 identifier];
          [v50 setObject:v88 forKey:@"GainParameterName"];

          v89 = [v73 gainMetaParameterDefinition];
          [(PHASEActionTreeBuilder *)v124 addParameter:v89];
        }
        [v113 addObject:v50];
      }

LABEL_50:
      ++v117;
      uint64_t v15 = v115;
      if (v117 == v108)
      {
        uint64_t v108 = [(NSMutableSet *)v114 countByEnumeratingWithState:&v136 objects:v157 count:16];
        if (v108) {
          goto LABEL_13;
        }
        goto LABEL_52;
      }
    }
  }
  uint64_t v13 = *(void *)v141;
LABEL_5:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v141 != v13) {
      objc_enumerationMutation(obj);
    }
    if (![(PHASEActionTreeBuilder *)self processNode:*(void *)(*((void *)&v140 + 1) + 8 * v14) withArray:v127 assetRegistry:v126 outError:a7])break; {
    if (v12 == ++v14)
    }
    {
      uint64_t v12 = [obj countByEnumeratingWithState:&v140 objects:v158 count:16];
      if (!v12) {
        goto LABEL_11;
      }
      goto LABEL_5;
    }
  }
  uint64_t v15 = 0;
  v91 = obj;
LABEL_63:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixNodes, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_rootNodes, 0);
}

@end