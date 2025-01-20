@interface PHASESpatialMixerDefinition
+ (PHASESpatialMixerDefinition)new;
- (NSArray)spatialModelerDefinitions;
- (PHASEDirectivityModelParameters)listenerDirectivityModelParameters;
- (PHASEDirectivityModelParameters)sourceDirectivityModelParameters;
- (PHASEDistanceModelParameters)distanceModelParameters;
- (PHASESpatialMixerDefinition)init;
- (PHASESpatialMixerDefinition)initWithSpatialModelerSendDefinitions:(id)a3;
- (PHASESpatialMixerDefinition)initWithSpatialModelerSendDefinitions:(id)a3 uid:(id)a4;
- (PHASESpatialMixerDefinition)initWithSpatialPipeline:(PHASESpatialPipeline *)spatialPipeline;
- (PHASESpatialMixerDefinition)initWithSpatialPipeline:(PHASESpatialPipeline *)spatialPipeline identifier:(NSString *)identifier;
- (PHASESpatialPipeline)spatialPipeline;
- (double)listenerDopplerFactor;
- (double)sourceDopplerFactor;
- (void)setDistanceModelParameters:(PHASEDistanceModelParameters *)distanceModelParameters;
- (void)setListenerDirectivityModelParameters:(PHASEDirectivityModelParameters *)listenerDirectivityModelParameters;
- (void)setListenerDopplerFactor:(double)a3;
- (void)setSourceDirectivityModelParameters:(PHASEDirectivityModelParameters *)sourceDirectivityModelParameters;
- (void)setSourceDopplerFactor:(double)a3;
@end

@implementation PHASESpatialMixerDefinition

- (PHASESpatialMixerDefinition)init
{
  return 0;
}

+ (PHASESpatialMixerDefinition)new
{
  return 0;
}

- (PHASESpatialMixerDefinition)initWithSpatialModelerSendDefinitions:(id)a3
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v4 = (PHASESpatialPipeline *)a3;
  uint64_t v5 = 0;
  uint64_t v6 = [(PHASESpatialPipeline *)v4 countByEnumeratingWithState:&v72 objects:v83 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v73;
LABEL_3:
    uint64_t v8 = 0;
    while (2)
    {
      if (*(void *)v73 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = (Phase::Logger *)[*(id *)(*((void *)&v72 + 1) + 8 * v8) spatialModelerType];
      switch((unint64_t)v9)
      {
        case 0uLL:
          v16 = **(id **)(Phase::Logger::GetInstance(v9) + 432);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v80 = "PHASEMixer.mm";
            __int16 v81 = 1024;
            int v82 = 101;
            _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid Spatial Modeler Send Definition Type", buf, 0x12u);
          }
          v17 = 0;
          v10 = v4;
          goto LABEL_56;
        case 1uLL:
          v5 |= 1uLL;
          goto LABEL_10;
        case 2uLL:
        case 5uLL:
          v5 |= 2uLL;
          goto LABEL_10;
        case 3uLL:
        case 4uLL:
          v5 |= 4uLL;
          goto LABEL_10;
        default:
LABEL_10:
          if (v6 != ++v8) {
            continue;
          }
          uint64_t v6 = [(PHASESpatialPipeline *)v4 countByEnumeratingWithState:&v72 objects:v83 count:16];
          if (!v6) {
            goto LABEL_12;
          }
          goto LABEL_3;
      }
    }
  }
LABEL_12:

  v10 = [[PHASESpatialPipeline alloc] initWithFlags:v5];
  if ([(PHASESpatialPipeline *)v10 flags])
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v11 = v4;
    uint64_t v12 = [(PHASESpatialPipeline *)v11 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v69;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v69 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if ([v15 spatialModelerType] == 1)
          {
            [v15 sendLevel];
            double v19 = v18;
            v20 = [(PHASESpatialPipeline *)v10 entries];
            v21 = [v20 objectForKeyedSubscript:@"PHASEDirectPathTransmission"];
            [v21 setSendLevel:v19];

            v22 = [v15 sendMetaParameterDefinition];
            v23 = [(PHASESpatialPipeline *)v10 entries];
            v24 = [v23 objectForKeyedSubscript:@"PHASEDirectPathTransmission"];
            [v24 setSendLevelMetaParameterDefinition:v22];

            v25 = [v15 tweakParams];
            v26 = [(PHASESpatialPipeline *)v10 entries];
            v27 = [v26 objectForKeyedSubscript:@"PHASEDirectPathTransmission"];
            [v27 setTweakParams:v25];

            goto LABEL_26;
          }
        }
        uint64_t v12 = [(PHASESpatialPipeline *)v11 countByEnumeratingWithState:&v68 objects:v78 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  if (([(PHASESpatialPipeline *)v10 flags] & 2) != 0)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v28 = v4;
    uint64_t v29 = [(PHASESpatialPipeline *)v28 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v65;
      while (2)
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v65 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if ([v32 spatialModelerType] == 2 || objc_msgSend(v32, "spatialModelerType") == 5)
          {
            [v32 sendLevel];
            double v34 = v33;
            v35 = [(PHASESpatialPipeline *)v10 entries];
            v36 = [v35 objectForKeyedSubscript:@"PHASEEarlyReflections"];
            [v36 setSendLevel:v34];

            v37 = [v32 sendMetaParameterDefinition];
            v38 = [(PHASESpatialPipeline *)v10 entries];
            v39 = [v38 objectForKeyedSubscript:@"PHASEEarlyReflections"];
            [v39 setSendLevelMetaParameterDefinition:v37];

            v40 = [v32 tweakParams];
            v41 = [(PHASESpatialPipeline *)v10 entries];
            v42 = [v41 objectForKeyedSubscript:@"PHASEEarlyReflections"];
            [v42 setTweakParams:v40];

            goto LABEL_39;
          }
        }
        uint64_t v29 = [(PHASESpatialPipeline *)v28 countByEnumeratingWithState:&v64 objects:v77 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
LABEL_39:
  }
  if (([(PHASESpatialPipeline *)v10 flags] & 4) != 0)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v43 = v4;
    uint64_t v44 = [(PHASESpatialPipeline *)v43 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v61;
      while (2)
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v43);
          }
          v47 = *(void **)(*((void *)&v60 + 1) + 8 * k);
          if ([v47 spatialModelerType] == 3 || objc_msgSend(v47, "spatialModelerType") == 4)
          {
            [v47 sendLevel];
            double v49 = v48;
            v50 = [(PHASESpatialPipeline *)v10 entries];
            v51 = [v50 objectForKeyedSubscript:@"PHASELateReverb"];
            [v51 setSendLevel:v49];

            v52 = [v47 sendMetaParameterDefinition];
            v53 = [(PHASESpatialPipeline *)v10 entries];
            v54 = [v53 objectForKeyedSubscript:@"PHASELateReverb"];
            [v54 setSendLevelMetaParameterDefinition:v52];

            v55 = [v47 tweakParams];
            v56 = [(PHASESpatialPipeline *)v10 entries];
            v57 = [v56 objectForKeyedSubscript:@"PHASELateReverb"];
            [v57 setTweakParams:v55];

            goto LABEL_52;
          }
        }
        uint64_t v44 = [(PHASESpatialPipeline *)v43 countByEnumeratingWithState:&v60 objects:v76 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }
LABEL_52:
  }
  v58 = [(PHASESpatialMixerDefinition *)self initWithSpatialPipeline:v10];
  if (v58)
  {
    self = v58;
    v17 = self;
  }
  else
  {
    self = 0;
    v17 = 0;
  }
LABEL_56:

  return v17;
}

- (PHASESpatialMixerDefinition)initWithSpatialModelerSendDefinitions:(id)a3 uid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PHASESpatialMixerDefinition *)self initWithSpatialModelerSendDefinitions:v6];
  v9 = v8;
  if (v8)
  {
    [(PHASEDefinition *)v8 setIdentifier:v7];
    v10 = v9;
  }

  return v9;
}

- (PHASESpatialMixerDefinition)initWithSpatialPipeline:(PHASESpatialPipeline *)spatialPipeline
{
  uint64_t v5 = spatialPipeline;
  v39.receiver = self;
  v39.super_class = (Class)PHASESpatialMixerDefinition;
  id v6 = [(PHASEMixerDefinition *)&v39 initInternal];
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF980] array];
    if ([(PHASESpatialPipeline *)v5 flags])
    {
      uint64_t v8 = [[PHASESpatialModelerSendDefinition alloc] initWithSpatialModelerType:1];
      v9 = [(PHASESpatialPipeline *)v5 entries];
      v10 = [v9 objectForKeyedSubscript:@"PHASEDirectPathTransmission"];

      if (!v10) {
        goto LABEL_13;
      }
      v11 = [(PHASESpatialPipeline *)v5 entries];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"PHASEDirectPathTransmission"];
      [v12 sendLevel];
      -[PHASESpatialModelerSendDefinition setSendLevel:](v8, "setSendLevel:");

      uint64_t v13 = [(PHASESpatialPipeline *)v5 entries];
      v14 = [v13 objectForKeyedSubscript:@"PHASEDirectPathTransmission"];
      v15 = [v14 sendLevelMetaParameterDefinition];
      [(PHASESpatialModelerSendDefinition *)v8 setSendMetaParameterDefinition:v15];

      [v7 addObject:v8];
    }
    if (([(PHASESpatialPipeline *)v5 flags] & 2) != 0)
    {
      v16 = [[PHASESpatialModelerSendDefinition alloc] initWithSpatialModelerType:2];
      v17 = [(PHASESpatialPipeline *)v5 entries];
      double v18 = [v17 objectForKeyedSubscript:@"PHASEEarlyReflections"];

      if (!v18) {
        goto LABEL_13;
      }
      double v19 = [(PHASESpatialPipeline *)v5 entries];
      v20 = [v19 objectForKeyedSubscript:@"PHASEEarlyReflections"];
      [v20 sendLevel];
      -[PHASESpatialModelerSendDefinition setSendLevel:](v16, "setSendLevel:");

      v21 = [(PHASESpatialPipeline *)v5 entries];
      v22 = [v21 objectForKeyedSubscript:@"PHASEEarlyReflections"];
      v23 = [v22 sendLevelMetaParameterDefinition];
      [(PHASESpatialModelerSendDefinition *)v16 setSendMetaParameterDefinition:v23];

      [v7 addObject:v16];
    }
    if (([(PHASESpatialPipeline *)v5 flags] & 4) == 0)
    {
LABEL_11:
      uint64_t v32 = [MEMORY[0x263EFF980] arrayWithArray:v7];
      spatialModelerDefinitions = v6->_spatialModelerDefinitions;
      v6->_spatialModelerDefinitions = (NSArray *)v32;

      objc_storeStrong((id *)&v6->_spatialPipeline, spatialPipeline);
      distanceModelParameters = v6->_distanceModelParameters;
      v6->_distanceModelParameters = 0;

      listenerDirectivityModelParameters = v6->_listenerDirectivityModelParameters;
      v6->_listenerDirectivityModelParameters = 0;

      sourceDirectivityModelParameters = v6->_sourceDirectivityModelParameters;
      v6->_sourceDirectivityModelParameters = 0;

      v6->_listenerDopplerFactor = 1.0;
      v6->_sourceDopplerFactor = 1.0;
      v37 = v6;

      goto LABEL_12;
    }
    v24 = [[PHASESpatialModelerSendDefinition alloc] initWithSpatialModelerType:3];
    v25 = [(PHASESpatialPipeline *)v5 entries];
    v26 = [v25 objectForKeyedSubscript:@"PHASELateReverb"];

    if (v26)
    {
      v27 = [(PHASESpatialPipeline *)v5 entries];
      v28 = [v27 objectForKeyedSubscript:@"PHASELateReverb"];
      [v28 sendLevel];
      -[PHASESpatialModelerSendDefinition setSendLevel:](v24, "setSendLevel:");

      uint64_t v29 = [(PHASESpatialPipeline *)v5 entries];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"PHASELateReverb"];
      v31 = [v30 sendLevelMetaParameterDefinition];
      [(PHASESpatialModelerSendDefinition *)v24 setSendMetaParameterDefinition:v31];

      [v7 addObject:v24];
      goto LABEL_11;
    }
LABEL_13:
    std::terminate();
  }
LABEL_12:

  return v6;
}

- (PHASESpatialMixerDefinition)initWithSpatialPipeline:(PHASESpatialPipeline *)spatialPipeline identifier:(NSString *)identifier
{
  id v6 = spatialPipeline;
  id v7 = identifier;
  uint64_t v8 = [(PHASESpatialMixerDefinition *)self initWithSpatialPipeline:v6];
  v9 = v8;
  if (v8)
  {
    [(PHASEDefinition *)v8 setIdentifier:v7];
    v10 = v9;
  }

  return v9;
}

- (void)setListenerDopplerFactor:(double)a3
{
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = NSStringFromSelector(a2);
  self->_listenerDopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);
}

- (void)setSourceDopplerFactor:(double)a3
{
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = NSStringFromSelector(a2);
  self->_sourceDopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);
}

- (PHASESpatialPipeline)spatialPipeline
{
  return self->_spatialPipeline;
}

- (PHASEDistanceModelParameters)distanceModelParameters
{
  return self->_distanceModelParameters;
}

- (void)setDistanceModelParameters:(PHASEDistanceModelParameters *)distanceModelParameters
{
}

- (PHASEDirectivityModelParameters)listenerDirectivityModelParameters
{
  return self->_listenerDirectivityModelParameters;
}

- (void)setListenerDirectivityModelParameters:(PHASEDirectivityModelParameters *)listenerDirectivityModelParameters
{
}

- (PHASEDirectivityModelParameters)sourceDirectivityModelParameters
{
  return self->_sourceDirectivityModelParameters;
}

- (void)setSourceDirectivityModelParameters:(PHASEDirectivityModelParameters *)sourceDirectivityModelParameters
{
}

- (double)listenerDopplerFactor
{
  return self->_listenerDopplerFactor;
}

- (double)sourceDopplerFactor
{
  return self->_sourceDopplerFactor;
}

- (NSArray)spatialModelerDefinitions
{
  return self->_spatialModelerDefinitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialModelerDefinitions, 0);
  objc_storeStrong((id *)&self->_sourceDirectivityModelParameters, 0);
  objc_storeStrong((id *)&self->_listenerDirectivityModelParameters, 0);
  objc_storeStrong((id *)&self->_distanceModelParameters, 0);

  objc_storeStrong((id *)&self->_spatialPipeline, 0);
}

@end