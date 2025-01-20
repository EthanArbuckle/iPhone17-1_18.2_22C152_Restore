@interface PHASEMedium
+ (PHASEMedium)new;
- (Handle64)geoMediumHandle;
- (NSArray)attenuationCoefficients;
- (PHASEMedium)init;
- (PHASEMedium)initWithEngine:(id)a3 attenuationCoefficients:(id)a4 speedOfSound:(float)a5;
- (PHASEMedium)initWithEngine:(id)a3 preset:(int64_t)a4 privatePreset:(int64_t)a5 attenuationCoefficients:(id)a6 speedOfSound:(float)a7;
- (PHASEMedium)initWithEngine:(id)a3 privatePreset:(int64_t)a4;
- (float)speedOfSound;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initAirWithEngine:(id)a3 temperature:(float)a4 pressure:(float)a5 humidity:(float)a6 bandcount:(int)a7;
- (id)initAirWithEngine:(id)a3 temperature:(float)a4 pressure:(float)a5 humidity:(float)a6 frequencies:(id)a7;
- (id)initWaterWithEngine:(id)a3 temperature:(float)a4 depth:(float)a5 salinity:(float)a6 pH:(float)a7 frequencies:(id)a8;
- (int64_t)preset;
- (int64_t)privatePreset;
- (void)dealloc;
- (void)setDefault;
- (void)setGeoMediumHandle:(Handle64)a3;
@end

@implementation PHASEMedium

- (PHASEMedium)init
{
  return 0;
}

+ (PHASEMedium)new
{
  return 0;
}

- (PHASEMedium)initWithEngine:(id)a3 privatePreset:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  sGetFrequencies((uint64_t)v27, 0x1FuLL);
  if (a4 == 1835291479)
  {
    Phase::Geometry::WaterUtility<double>::WaterUtility((uint64_t)v26);
    Phase::Geometry::WaterUtility<double>::SetTemperatureInCelsius((uint64_t)v26, 20.0);
    Phase::Geometry::WaterUtility<double>::SetDepthInMeters((uint64_t)v26, 10.0);
    for (uint64_t i = 0; i != 124; i += 4)
    {
      float v9 = *(float *)((char *)v27[0] + i);
      double v10 = Phase::Geometry::WaterUtility<double>::WaterAbsorptionInDecibelsPerMeter(v26, v9);
      v11 = [PHASESubband alloc];
      long double v12 = exp(v10 * -10.0 / 10.0 * 0.115129255);
      *(float *)&double v13 = v12;
      *(float *)&long double v12 = v9;
      v14 = [(PHASESubband *)v11 initWithFrequency:(double)v12 value:v13];
      [v7 addObject:v14];
    }
    double v15 = v26[22];
  }
  else
  {
    Phase::Geometry::WeatherUtility<double>::WeatherUtility((uint64_t)v26);
    Phase::Geometry::WeatherUtility<double>::SetTemperatureInCelsius((uint64_t)v26, 20.0);
    Phase::Geometry::WeatherUtility<double>::SetRelativeHumidityPercentage((uint64_t)v26, 50.0);
    for (uint64_t j = 0; j != 124; j += 4)
    {
      float v17 = *(float *)((char *)v27[0] + j);
      double v18 = Phase::Geometry::WeatherUtility<double>::AtmosphericAbsorptionInDecibelsPerMeter(v26, v17);
      v19 = [PHASESubband alloc];
      long double v20 = exp(v18 * -10.0 / 10.0 * 0.115129255);
      *(float *)&double v21 = v20;
      *(float *)&long double v20 = v17;
      v22 = [(PHASESubband *)v19 initWithFrequency:(double)v20 value:v21];
      [v7 addObject:v22];
    }
    double v15 = v26[17];
  }
  float v23 = v15;
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  *(float *)&double v15 = v23;
  v24 = [(PHASEMedium *)self initWithEngine:v6 preset:a4 privatePreset:a4 attenuationCoefficients:v7 speedOfSound:v15];

  return v24;
}

- (PHASEMedium)initWithEngine:(id)a3 attenuationCoefficients:(id)a4 speedOfSound:(float)a5
{
  return -[PHASEMedium initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:](self, "initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:", a3, 1835286898, 1835286898, a4);
}

- (PHASEMedium)initWithEngine:(id)a3 preset:(int64_t)a4 privatePreset:(int64_t)a5 attenuationCoefficients:(id)a6 speedOfSound:(float)a7
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  obuint64_t j = a3;
  id v46 = a6;
  long double v12 = (Phase::Logger *)[v46 count];
  if (!v12)
  {
    v37 = **(id **)(Phase::Logger::GetInstance(0) + 432);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "PHASEMedium.mm";
      __int16 v54 = 1024;
      int v55 = 189;
      v38 = "%25s:%-5d [PHASEMedium:initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound]: attenuatio"
            "nCoefficients is empty";
      v39 = v37;
      uint32_t v40 = 18;
LABEL_24:
      _os_log_impl(&dword_221E5E000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
    }
LABEL_25:
    v36 = 0;
    goto LABEL_26;
  }
  if (a7 <= 0.0)
  {
    v41 = **(id **)(Phase::Logger::GetInstance(v12) + 432);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "PHASEMedium.mm";
      __int16 v54 = 1024;
      int v55 = 197;
      __int16 v56 = 2048;
      double v57 = a7;
      v38 = "%25s:%-5d [PHASEMedium:initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound]: Invalid speedOfSound: %f";
      v39 = v41;
      uint32_t v40 = 28;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v51.receiver = self;
  v51.super_class = (Class)PHASEMedium;
  double v13 = [(PHASEMedium *)&v51 init];
  if (!v13) {
    goto LABEL_19;
  }
  v44 = v13;
  location = (id *)&v13->_engine;
  objc_storeWeak((id *)&v13->_engine, obj);
  v44->_preset = a4;
  v44->_privatePreset = a5;
  v14 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v46;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(id *)(*((void *)&v47 + 1) + 8 * i);
        long double v20 = (Phase::Logger *)objc_msgSend(v19, "value", location);
        if (v21 < 0.0 || (long double v20 = (Phase::Logger *)[v19 value], v22 > 1.0))
        {
          float v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v20)
                                                                                              + 432)));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            [v19 value];
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "PHASEMedium.mm";
            __int16 v54 = 1024;
            int v55 = 219;
            __int16 v56 = 2048;
            double v57 = v24;
            _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_DEBUG, "%25s:%-5d PHASEMedium attenuation coefficient %f is out-of-range [0, 1]. Clamping...", buf, 0x1Cu);
          }
        }
        [v19 value];
        float v26 = v25;
        [v19 value];
        v27 = v19;
        if (v28 != fminf(fmaxf(v26, 0.0), 1.0))
        {
          v29 = [PHASESubband alloc];
          [v19 frequency];
          uint64_t v30 = -[PHASESubband initWithFrequency:value:](v29, "initWithFrequency:value:");

          v27 = (void *)v30;
        }
        [v14 addObject:v27];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v16);
  }

  uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithArray:v14];
  attenuationCoefficients = v44->_attenuationCoefficients;
  v44->_attenuationCoefficients = (NSArray *)v31;

  v44->_speedOfSound = a7;
  *(void *)buf = v15;
  *(float *)&buf[8] = v44->_speedOfSound;
  id WeakRetained = objc_loadWeakRetained(location);
  uint64_t v34 = [WeakRetained implementation];
  [(PHASEMedium *)v44 setGeoMediumHandle:(*(uint64_t (**)(void, unsigned char *))(**(void **)(v34 + 368) + 24))(*(void *)(v34 + 368), buf)];

  BOOL v35 = [(PHASEMedium *)v44 geoMediumHandle] == 0;
  double v13 = v44;
  if (v35)
  {
    v36 = 0;
    self = v44;
  }
  else
  {
LABEL_19:
    self = v13;
    v36 = self;
  }
LABEL_26:

  return v36;
}

- (id)initAirWithEngine:(id)a3 temperature:(float)a4 pressure:(float)a5 humidity:(float)a6 bandcount:(int)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long double v12 = (Phase::Logger *)a3;
  double v13 = v12;
  if ((a7 - 32) <= 0xFFFFFFE2)
  {
    v14 = **(id **)(Phase::Logger::GetInstance(v12) + 432);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315650;
      *(void *)&__p[4] = "PHASEMedium.mm";
      *(_WORD *)&__p[12] = 1024;
      *(_DWORD *)&__p[14] = 255;
      __int16 v28 = 1024;
      int v29 = a7;
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium:initAirWithEngine:temperature:pressure:humidity:bandcount]: bandcount %d is out-of-range [3, 31]. Clamping...", __p, 0x18u);
    }
    if (a7 <= 3) {
      int v15 = 3;
    }
    else {
      int v15 = a7;
    }
    a7 = ((31 - v15) & ((31 - v15) >> 31)) + v15;
  }
  sGetFrequencies((uint64_t)__p, a7);
  uint64_t v16 = objc_opt_new();
  if (a7 >= 1)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 4 * a7;
    do
    {
      id v22 = objc_alloc(NSNumber);
      LODWORD(v23) = *(_DWORD *)(*(void *)__p + v20);
      float v24 = (void *)[v22 initWithFloat:v23];
      [v16 addObject:v24];

      v20 += 4;
    }
    while (v21 != v20);
  }
  *(float *)&double v17 = a4;
  *(float *)&double v18 = a5;
  *(float *)&double v19 = a6;
  id v25 = [(PHASEMedium *)self initAirWithEngine:v13 temperature:v16 pressure:v17 humidity:v18 frequencies:v19];

  if (*(void *)__p)
  {
    *(void *)&__p[8] = *(void *)__p;
    operator delete(*(void **)__p);
  }

  return v25;
}

- (id)initAirWithEngine:(id)a3 temperature:(float)a4 pressure:(float)a5 humidity:(float)a6 frequencies:(id)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v35 = a3;
  long double v12 = (Phase::Logger *)a7;
  double v13 = v12;
  if (a5 < 5.0)
  {
    v14 = **(id **)(Phase::Logger::GetInstance(v12) + 432);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "PHASEMedium.mm";
      __int16 v43 = 1024;
      int v44 = 282;
      __int16 v45 = 2048;
      double v46 = a5;
      _os_log_impl(&dword_221E5E000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium:initAirWithEngine:temperature:pressure:humidity:frequencies]: Pressure %2.2f must be > 0.001 (1 Pa). Clamping...", buf, 0x1Cu);
    }
    a5 = fmaxf(a5, 5.0);
  }
  int v15 = (Phase::Logger *)[(Phase::Logger *)v13 count];
  if ((unint64_t)v15 < 3
    || (int v15 = (Phase::Logger *)[(Phase::Logger *)v13 count], (unint64_t)v15 >= 0x20))
  {
    uint64_t v16 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v15)
                                                                                        + 432)));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      double v17 = COERCE_DOUBLE([(Phase::Logger *)v13 count]);
      *(_DWORD *)buf = 136315650;
      v42 = "PHASEMedium.mm";
      __int16 v43 = 1024;
      int v44 = 291;
      __int16 v45 = 2048;
      double v46 = v17;
      _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium:initAirWithEngine:temperature:pressure:humidity:frequencies]: frequencies.count %zu is out-of-range [3, 31].", buf, 0x1Cu);
    }

    double v18 = 0;
    goto LABEL_22;
  }
  Phase::Geometry::WeatherUtility<double>::WeatherUtility((uint64_t)buf);
  Phase::Geometry::WeatherUtility<double>::SetTemperatureInCelsius((uint64_t)buf, a4);
  double v20 = Phase::Controller::sClamp<double>(v19, (float)(a5 * 1000.0), v47, v48);
  if (v20 != v49)
  {
    double v49 = v20;
    char v50 = 1;
LABEL_13:
    Phase::Geometry::WeatherUtility<double>::InitInternal((uint64_t)buf);
    goto LABEL_14;
  }
  if (v50) {
    goto LABEL_13;
  }
LABEL_14:
  Phase::Geometry::WeatherUtility<double>::SetRelativeHumidityPercentage((uint64_t)buf, a6);
  double v21 = v51;
  id v22 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v23 = v13;
  uint64_t v24 = [(Phase::Logger *)v23 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v23);
        }
        id v27 = *(id *)(*((void *)&v36 + 1) + 8 * v26);
        [v27 floatValue];
        long double v29 = Phase::Geometry::WeatherUtility<double>::AtmosphericAbsorptionInDecibelsPerMeter((double *)buf, v28);
        exp(v29 * -10.0 / 10.0 * 0.115129255);
        uint64_t v30 = [PHASESubband alloc];
        [v27 floatValue];
        uint64_t v31 = -[PHASESubband initWithFrequency:value:](v30, "initWithFrequency:value:");
        [v22 addObject:v31];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(Phase::Logger *)v23 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v24);
  }

  v32 = [MEMORY[0x263EFF8C0] arrayWithArray:v22];
  *(float *)&double v33 = v21;
  self = [(PHASEMedium *)self initWithEngine:v35 attenuationCoefficients:v32 speedOfSound:v33];

  double v18 = self;
LABEL_22:

  return v18;
}

- (id)initWaterWithEngine:(id)a3 temperature:(float)a4 depth:(float)a5 salinity:(float)a6 pH:(float)a7 frequencies:(id)a8
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v15 = a8;
  Phase::Geometry::WaterUtility<double>::WaterUtility((uint64_t)v58);
  uint64_t v16 = (objc_class *)objc_opt_class();
  double v17 = NSStringFromClass(v16);
  double v18 = NSStringFromSelector(a2);
  float v19 = PHASEGetPropertyBounded<float>(v17, v18, a4, 0.0, 50.0);

  double v20 = (objc_class *)objc_opt_class();
  double v21 = NSStringFromClass(v20);
  id v22 = NSStringFromSelector(a2);
  float v23 = PHASEGetPropertyBounded<float>(v21, v22, a5, 0.0, 10000.0);

  uint64_t v24 = (objc_class *)objc_opt_class();
  uint64_t v25 = NSStringFromClass(v24);
  uint64_t v26 = NSStringFromSelector(a2);
  float v27 = PHASEGetPropertyBounded<float>(v25, v26, a6, 0.0, 50.0);

  float v28 = (objc_class *)objc_opt_class();
  long double v29 = NSStringFromClass(v28);
  uint64_t v30 = NSStringFromSelector(a2);
  float v31 = PHASEGetPropertyBounded<float>(v29, v30, a7, 7.0, 9.0);

  Phase::Geometry::WaterUtility<double>::SetTemperatureInCelsius((uint64_t)v58, v19);
  Phase::Geometry::WaterUtility<double>::SetDepthInMeters((uint64_t)v58, v23);
  double v34 = Phase::Controller::sClamp<double>(v32, v27, v58[10], v58[11]);
  if (v34 == v59)
  {
    if (!v60) {
      goto LABEL_5;
    }
  }
  else
  {
    double v59 = v34;
    char v60 = 1;
  }
  Phase::Geometry::WaterUtility<double>::InitInternal((uint64_t)v58);
LABEL_5:
  double inited = Phase::Controller::sClamp<double>(v33, v31, v61, v62);
  if (inited != v63)
  {
    double v63 = inited;
    char v64 = 1;
LABEL_8:
    double inited = Phase::Geometry::WaterUtility<double>::InitInternal((uint64_t)v58);
    goto LABEL_9;
  }
  if (v64) {
    goto LABEL_8;
  }
LABEL_9:
  long long v36 = (Phase::Logger *)objc_msgSend(v15, "count", inited);
  if ((unint64_t)v36 >= 3 && (long long v36 = (Phase::Logger *)[v15 count], (unint64_t)v36 < 0x20))
  {
    double v40 = v65;
    long long v37 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = v15;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v55 != v43) {
            objc_enumerationMutation(v41);
          }
          id v45 = *(id *)(*((void *)&v54 + 1) + 8 * i);
          [v45 floatValue];
          long double v47 = Phase::Geometry::WaterUtility<double>::WaterAbsorptionInDecibelsPerMeter(v58, v46);
          exp(v47 * -10.0 / 10.0 * 0.115129255);
          double v48 = [PHASESubband alloc];
          [v45 floatValue];
          double v49 = -[PHASESubband initWithFrequency:value:](v48, "initWithFrequency:value:");
          [v37 addObject:v49];
        }
        uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v42);
    }

    char v50 = [MEMORY[0x263EFF8C0] arrayWithArray:v37];
    *(float *)&double v51 = v40;
    self = [(PHASEMedium *)self initWithEngine:v53 attenuationCoefficients:v50 speedOfSound:v51];

    long long v39 = self;
  }
  else
  {
    long long v37 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v36)
                                                                                        + 432)));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = [v15 count];
      *(_DWORD *)buf = 136315650;
      v68 = "PHASEMedium.mm";
      __int16 v69 = 1024;
      int v70 = 346;
      __int16 v71 = 2048;
      uint64_t v72 = v38;
      _os_log_impl(&dword_221E5E000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEMedium initWaterEWithEngine:temperature:depth:salinity:pH:frequencies]: Frequencies %lu out-of-range [3, 31].", buf, 0x1Cu);
    }
    long long v39 = 0;
  }

  return v39;
}

- (void)setDefault
{
  v19[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)([WeakRetained implementation] + 368);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v5 + 216))(v5, [(PHASEMedium *)self geoMediumHandle]);
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F08320];
    uint64_t v18 = *MEMORY[0x263F08320];
    v7 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v19[0] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];

    double v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v8 objectForKeyedSubscript:v6];
      int v12 = 136315650;
      double v13 = "PHASEMedium.mm";
      __int16 v14 = 1024;
      int v15 = 373;
      __int16 v16 = 2080;
      uint64_t v17 = [v11 UTF8String];
      _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  int64_t v6 = [(PHASEMedium *)self preset];
  int64_t v7 = [(PHASEMedium *)self privatePreset];
  v8 = [(PHASEMedium *)self attenuationCoefficients];
  [(PHASEMedium *)self speedOfSound];
  float v9 = objc_msgSend(v4, "initWithEngine:preset:privatePreset:attenuationCoefficients:speedOfSound:", WeakRetained, v6, v7, v8);

  return v9;
}

- (void)dealloc
{
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_engine);
    uint64_t v6 = *(void *)([v5 implementation] + 368);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v6 + 288))(v6, [(PHASEMedium *)self geoMediumHandle]);
  }
  v7.receiver = self;
  v7.super_class = (Class)PHASEMedium;
  [(PHASEMedium *)&v7 dealloc];
}

- (Handle64)geoMediumHandle
{
  return self->_geoMediumHandle;
}

- (void)setGeoMediumHandle:(Handle64)a3
{
  self->_geoMediumHandle = a3;
}

- (int64_t)preset
{
  return self->_preset;
}

- (int64_t)privatePreset
{
  return self->_privatePreset;
}

- (NSArray)attenuationCoefficients
{
  return self->_attenuationCoefficients;
}

- (float)speedOfSound
{
  return self->_speedOfSound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attenuationCoefficients, 0);

  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end