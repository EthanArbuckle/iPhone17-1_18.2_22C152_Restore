@interface PHASESoundReductionIndex
+ (id)new;
+ (id)objectForDefault;
- (NSArray)attenuationCoefficients;
- (PHASESoundReductionIndex)init;
- (PHASESoundReductionIndex)initWithAttenuationCoefficients:(id)a3 measuredDepth:(float)a4;
- (PHASESoundReductionIndex)initWithSoundReductionIndices:(id)a3 frequencyBands:(id)a4 measuredDepth:(float)a5;
- (float)measuredDepth;
@end

@implementation PHASESoundReductionIndex

- (PHASESoundReductionIndex)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASESoundReductionIndex)initWithAttenuationCoefficients:(id)a3 measuredDepth:(float)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v38 = a3;
  v6 = (Phase::Logger *)[v38 count];
  if (!v6)
  {
    v31 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "PHASEMaterial.mm";
      __int16 v47 = 1024;
      int v48 = 144;
      v32 = "%25s:%-5d [PHASESoundReductionIndex:initWithScatteringCoefficients]: scatteringCoeffients is empty";
      v33 = v31;
      uint32_t v34 = 18;
LABEL_25:
      _os_log_impl(&dword_221E5E000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    }
LABEL_26:
    v30 = 0;
    goto LABEL_27;
  }
  if (a4 <= 0.0)
  {
    v35 = **(id **)(Phase::Logger::GetInstance(v6) + 432);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v46 = "PHASEMaterial.mm";
      __int16 v47 = 1024;
      int v48 = 153;
      __int16 v49 = 2048;
      double v50 = a4;
      v32 = "%25s:%-5d [PHASESoundReductionIndex:initWithScatteringCoefficients]: Invalid material depth: %2.2f. Values m"
            "ust be greater than zero.";
      v33 = v35;
      uint32_t v34 = 28;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v43.receiver = self;
  v43.super_class = (Class)PHASESoundReductionIndex;
  v7 = [(PHASESoundReductionIndex *)&v43 init];
  if (v7)
  {
    v37 = v7;
    v8 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = v38;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          v14 = (Phase::Logger *)[v13 value];
          if (v15 > 1.0)
          {
            v16 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v14)
                                                                                                + 432)));
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              [v13 value];
              *(_DWORD *)buf = 136315650;
              v46 = "PHASEMaterial.mm";
              __int16 v47 = 1024;
              int v48 = 168;
              __int16 v49 = 2048;
              double v50 = v17;
              _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input SRI attenuation coefficient value %2.2f. Values greater than 1 are atypical; not clamping.",
                buf,
                0x1Cu);
            }
          }
          id v18 = v13;
          [v18 value];
          float v20 = v19;
          v21 = (Phase::Logger *)[v18 value];
          v22 = v18;
          if (v23 != fmaxf(v20, 0.0))
          {
            v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v21)
                                                                                                + 432)));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              [v18 value];
              *(_DWORD *)buf = 136315650;
              v46 = "PHASEMaterial.mm";
              __int16 v47 = 1024;
              int v48 = 176;
              __int16 v49 = 2048;
              double v50 = v25;
              _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d Clamping input SRI attenuation coefficient value from %2.3f to zero.", buf, 0x1Cu);
            }

            v26 = [PHASESubband alloc];
            [v18 frequency];
            uint64_t v27 = -[PHASESubband initWithFrequency:value:](v26, "initWithFrequency:value:");

            v22 = (void *)v27;
          }
          objc_msgSend(v8, "addObject:", v22, v37);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v10);
    }

    uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    attenuationCoefficients = v37->_attenuationCoefficients;
    v37->_attenuationCoefficients = (NSArray *)v28;

    v37->_measuredDepth = a4;
    v7 = v37;
  }
  self = v7;
  v30 = self;
LABEL_27:

  return v30;
}

- (PHASESoundReductionIndex)initWithSoundReductionIndices:(id)a3 frequencyBands:(id)a4 measuredDepth:(float)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v34 = a4;
  if (![v33 count])
  {
    float v25 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v42 = "PHASEMaterial.mm";
      __int16 v43 = 1024;
      int v44 = 196;
      v26 = "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: soundReduct"
            "ionIndices is empty";
LABEL_19:
      uint64_t v27 = v25;
      uint32_t v28 = 18;
LABEL_20:
      _os_log_impl(&dword_221E5E000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
LABEL_26:
    v24 = 0;
    goto LABEL_27;
  }
  if (![v34 count])
  {
    float v25 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v42 = "PHASEMaterial.mm";
      __int16 v43 = 1024;
      int v44 = 203;
      v26 = "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: frequencyBands is empty";
      goto LABEL_19;
    }
    goto LABEL_26;
  }
  uint64_t v8 = [v33 count];
  id v9 = (Phase::Logger *)[v34 count];
  if ((Phase::Logger *)v8 != v9)
  {
    v29 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v42 = "PHASEMaterial.mm";
      __int16 v43 = 1024;
      int v44 = 212;
      __int16 v45 = 2048;
      double v46 = COERCE_DOUBLE([v33 count]);
      __int16 v47 = 2048;
      uint64_t v48 = [v34 count];
      _os_log_impl(&dword_221E5E000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: soundReductionIndices count %zu must match frequencyBands count %zu", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (a5 <= 0.0)
  {
    v30 = **(id **)(Phase::Logger::GetInstance(v9) + 432);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315650;
    long long v42 = "PHASEMaterial.mm";
    __int16 v43 = 1024;
    int v44 = 221;
    __int16 v45 = 2048;
    double v46 = a5;
    v26 = "%25s:%-5d [PHASESoundReductionIndex:initWithSoundReductionIndices:frequencyBands:measuredDepth]: Invalid mater"
          "ial depth: %2.2f. Values must be greater than zero.";
    uint64_t v27 = v30;
    uint32_t v28 = 28;
    goto LABEL_20;
  }
  v39.receiver = self;
  v39.super_class = (Class)PHASESoundReductionIndex;
  uint64_t v10 = [(PHASESoundReductionIndex *)&v39 init];
  if (v10)
  {
    v32 = v10;
    uint64_t v11 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v33;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v35 + 1) + 8 * i);
          [v17 floatValue];
          expf((float)((float)(fmaxf(v18, 0.0) * -10.0) / 10.0) * 0.11513);
          float v19 = [PHASESubband alloc];
          float v20 = [v34 objectAtIndexedSubscript:v14 + i];
          [v20 floatValue];
          v21 = -[PHASESubband initWithFrequency:value:](v19, "initWithFrequency:value:");

          [v11 addObject:v21];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        v14 += i;
      }
      while (v13);
    }

    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
    attenuationCoefficients = v32->_attenuationCoefficients;
    v32->_attenuationCoefficients = (NSArray *)v22;

    v32->_measuredDepth = a5;
    uint64_t v10 = v32;
  }
  self = v10;
  v24 = self;
LABEL_27:

  return v24;
}

+ (id)objectForDefault
{
  sGetFrequencies((uint64_t)__p);
  v2 = objc_opt_new();
  for (uint64_t i = 0; i != 124; i += 4)
  {
    v4 = [PHASESubband alloc];
    LODWORD(v5) = *(_DWORD *)((char *)__p[0] + i);
    LODWORD(v6) = 1.0;
    v7 = [(PHASESubband *)v4 initWithFrequency:v5 value:v6];
    [v2 addObject:v7];
  }
  uint64_t v8 = [PHASESoundReductionIndex alloc];
  LODWORD(v9) = 1041865114;
  uint64_t v10 = [(PHASESoundReductionIndex *)v8 initWithAttenuationCoefficients:v2 measuredDepth:v9];

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v10;
}

- (NSArray)attenuationCoefficients
{
  return self->_attenuationCoefficients;
}

- (float)measuredDepth
{
  return self->_measuredDepth;
}

- (void).cxx_destruct
{
}

@end