@interface PHASEScatteringData
+ (id)new;
+ (id)objectForDefault;
- (NSArray)scatteringCoefficients;
- (PHASEScatteringData)init;
- (PHASEScatteringData)initWithScatteringCoefficients:(id)a3;
- (PHASEScatteringData)initWithScatteringCoefficients:(id)a3 frequencyBands:(id)a4;
@end

@implementation PHASEScatteringData

- (PHASEScatteringData)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEScatteringData)initWithScatteringCoefficients:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v22 = a3;
  if ([v22 count])
  {
    v27.receiver = self;
    v27.super_class = (Class)PHASEScatteringData;
    v4 = [(PHASEScatteringData *)&v27 init];
    if (v4)
    {
      v5 = objc_opt_new();
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v6 = v22;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v24;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(id *)(*((void *)&v23 + 1) + 8 * v9);
            [v10 value];
            float v12 = v11;
            [v10 value];
            v13 = v10;
            if (v14 != fminf(fmaxf(v12, 0.0), 1.0))
            {
              v15 = [PHASESubband alloc];
              [v10 frequency];
              uint64_t v16 = -[PHASESubband initWithFrequency:value:](v15, "initWithFrequency:value:");

              v13 = (void *)v16;
            }
            [v5 addObject:v13];

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v7);
      }

      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
      scatteringCoefficients = v4->_scatteringCoefficients;
      v4->_scatteringCoefficients = (NSArray *)v17;
    }
    self = v4;
    v19 = self;
  }
  else
  {
    v20 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "PHASEMaterial.mm";
      __int16 v31 = 1024;
      int v32 = 399;
      _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients]: scatteringCoeffients is empty", buf, 0x12u);
    }
    v19 = 0;
  }

  return v19;
}

- (PHASEScatteringData)initWithScatteringCoefficients:(id)a3 frequencyBands:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v29 = a4;
  if (![v28 count])
  {
    long long v23 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "PHASEMaterial.mm";
      __int16 v38 = 1024;
      int v39 = 431;
      long long v24 = "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients:frequencyBands]: scatteringCoeffients is empty";
LABEL_19:
      _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x12u);
    }
LABEL_23:
    id v22 = 0;
    goto LABEL_24;
  }
  if (![v29 count])
  {
    long long v23 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "PHASEMaterial.mm";
      __int16 v38 = 1024;
      int v39 = 438;
      long long v24 = "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients:frequencyBands]: frequencyBands is empty";
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  uint64_t v6 = [v28 count];
  uint64_t v7 = (Phase::Logger *)[v29 count];
  if ((Phase::Logger *)v6 != v7)
  {
    long long v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v37 = "PHASEMaterial.mm";
      __int16 v38 = 1024;
      int v39 = 447;
      __int16 v40 = 2048;
      uint64_t v41 = [v28 count];
      __int16 v42 = 2048;
      uint64_t v43 = [v29 count];
      _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEScatteringData:initWithScatteringCoefficients:frequencyBands]: scatteringsCoefficent count %zu must match frequencyBands count %zu", buf, 0x26u);
    }

    goto LABEL_23;
  }
  v34.receiver = self;
  v34.super_class = (Class)PHASEScatteringData;
  uint64_t v8 = [(PHASEScatteringData *)&v34 init];
  if (v8)
  {
    objc_super v27 = v8;
    uint64_t v9 = [v28 count];
    if (v9 != [v29 count])
    {
      id v22 = 0;
      self = v27;
      goto LABEL_24;
    }
    id v10 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v28;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v30 + 1) + 8 * i);
          [v16 floatValue];
          uint64_t v17 = [PHASESubband alloc];
          v18 = [v29 objectAtIndexedSubscript:v13 + i];
          [v18 floatValue];
          v19 = -[PHASESubband initWithFrequency:value:](v17, "initWithFrequency:value:");

          [v10 addObject:v19];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
        v13 += i;
      }
      while (v12);
    }

    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithArray:v10];
    scatteringCoefficients = v27->_scatteringCoefficients;
    v27->_scatteringCoefficients = (NSArray *)v20;

    uint64_t v8 = v27;
  }
  self = v8;
  id v22 = self;
LABEL_24:

  return v22;
}

+ (id)objectForDefault
{
  sGetFrequencies((uint64_t)__p);
  v2 = objc_opt_new();
  for (uint64_t i = 0; i != 124; i += 4)
  {
    v4 = [PHASESubband alloc];
    LODWORD(v5) = *(_DWORD *)((char *)__p[0] + i);
    uint64_t v6 = [(PHASESubband *)v4 initWithFrequency:v5 value:0.0];
    [v2 addObject:v6];
  }
  uint64_t v7 = [[PHASEScatteringData alloc] initWithScatteringCoefficients:v2];

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v7;
}

- (NSArray)scatteringCoefficients
{
  return self->_scatteringCoefficients;
}

- (void).cxx_destruct
{
}

@end