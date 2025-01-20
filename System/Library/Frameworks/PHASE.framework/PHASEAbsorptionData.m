@interface PHASEAbsorptionData
+ (id)new;
+ (id)objectForDefault;
- (NSArray)absorptionCoefficients;
- (PHASEAbsorptionData)init;
- (PHASEAbsorptionData)initWithAbsorptionCoefficients:(id)a3;
- (PHASEAbsorptionData)initWithAbsorptionCoefficients:(id)a3 frequencyBands:(id)a4;
@end

@implementation PHASEAbsorptionData

- (PHASEAbsorptionData)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEAbsorptionData)initWithAbsorptionCoefficients:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v27 = a3;
  if ([v27 count])
  {
    v32.receiver = self;
    v32.super_class = (Class)PHASEAbsorptionData;
    v4 = [(PHASEAbsorptionData *)&v32 init];
    if (v4)
    {
      v26 = v4;
      v5 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = v27;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(id *)(*((void *)&v28 + 1) + 8 * i);
            [v10 value];
            float v12 = v11;
            v13 = (Phase::Logger *)[v10 value];
            float v14 = fminf(fmaxf(v12, 0.0), 1.0);
            v15 = v10;
            if (v16 != v14)
            {
              v17 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v13)
                                                                                                  + 432)));
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                [v10 value];
                *(_DWORD *)buf = 136315906;
                v34 = "PHASEMaterial.mm";
                __int16 v35 = 1024;
                int v36 = 304;
                __int16 v37 = 2048;
                double v38 = v18;
                __int16 v39 = 2048;
                double v40 = v14;
                _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Clamping input absorption coefficient value from %2.3f to %2.3f.", buf, 0x26u);
              }

              v19 = [PHASESubband alloc];
              [v10 frequency];
              uint64_t v20 = -[PHASESubband initWithFrequency:value:](v19, "initWithFrequency:value:");

              v15 = (void *)v20;
            }
            objc_msgSend(v5, "addObject:", v15, v26);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v41 count:16];
        }
        while (v7);
      }

      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
      absorptionCoefficients = v26->_absorptionCoefficients;
      v26->_absorptionCoefficients = (NSArray *)v21;

      v4 = v26;
    }
    self = v4;
    v23 = self;
  }
  else
  {
    v24 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "PHASEMaterial.mm";
      __int16 v35 = 1024;
      int v36 = 288;
      _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients]: absorptionCoeffients is empty", buf, 0x12u);
    }
    v23 = 0;
  }

  return v23;
}

- (PHASEAbsorptionData)initWithAbsorptionCoefficients:(id)a3 frequencyBands:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v28 = a4;
  if (![v27 count])
  {
    v22 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v36 = "PHASEMaterial.mm";
      __int16 v37 = 1024;
      int v38 = 320;
      v23 = "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients:frequencyBands]: absorptionCoeffients is empty";
LABEL_18:
      _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
    }
LABEL_22:
    uint64_t v21 = 0;
    goto LABEL_23;
  }
  if (![v28 count])
  {
    v22 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v36 = "PHASEMaterial.mm";
      __int16 v37 = 1024;
      int v38 = 327;
      v23 = "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients:frequencyBands]: frequencyBands is empty";
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  uint64_t v6 = [v27 count];
  uint64_t v7 = (Phase::Logger *)[v28 count];
  if ((Phase::Logger *)v6 != v7)
  {
    v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                        + 432)));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int v36 = "PHASEMaterial.mm";
      __int16 v37 = 1024;
      int v38 = 336;
      __int16 v39 = 2048;
      uint64_t v40 = [v27 count];
      __int16 v41 = 2048;
      uint64_t v42 = [v28 count];
      _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEAbsorptionData:initWithAbsorptionCoefficients:frequencyBands]: aborptionCoefficent count %zu must match frequencyBands count %zu", buf, 0x26u);
    }

    goto LABEL_22;
  }
  v33.receiver = self;
  v33.super_class = (Class)PHASEAbsorptionData;
  uint64_t v8 = [(PHASEAbsorptionData *)&v33 init];
  if (v8)
  {
    v26 = v8;
    v9 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v27;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v29 + 1) + 8 * i);
          [v15 floatValue];
          float v16 = [PHASESubband alloc];
          v17 = [v28 objectAtIndexedSubscript:v12 + i];
          [v17 floatValue];
          float v18 = -[PHASESubband initWithFrequency:value:](v16, "initWithFrequency:value:");

          [v9 addObject:v18];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
        v12 += i;
      }
      while (v11);
    }

    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
    absorptionCoefficients = v26->_absorptionCoefficients;
    v26->_absorptionCoefficients = (NSArray *)v19;

    uint64_t v8 = v26;
  }
  self = v8;
  uint64_t v21 = self;
LABEL_23:

  return v21;
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
  uint64_t v7 = [[PHASEAbsorptionData alloc] initWithAbsorptionCoefficients:v2];

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v7;
}

- (NSArray)absorptionCoefficients
{
  return self->_absorptionCoefficients;
}

- (void).cxx_destruct
{
}

@end