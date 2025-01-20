@interface PHASESource
+ (PHASESource)new;
- (NSArray)shapes;
- (PHASESource)init;
- (PHASESource)initWithEngine:(PHASEEngine *)engine;
- (PHASESource)initWithEngine:(PHASEEngine *)engine shapes:(NSArray *)shapes;
- (__n128)velocity;
- (double)dopplerFactor;
- (double)gain;
- (double)spatialResolution;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDopplerFactor:(double)a3;
- (void)setGain:(double)gain;
- (void)setSpatialResolution:(double)a3;
- (void)setVelocity:(PHASESource *)self;
@end

@implementation PHASESource

- (PHASESource)init
{
  return 0;
}

+ (PHASESource)new
{
  return 0;
}

- (PHASESource)initWithEngine:(PHASEEngine *)engine
{
  v4 = engine;
  v9.receiver = self;
  v9.super_class = (Class)PHASESource;
  v5 = [(PHASEObject *)&v9 initWithEngine:v4 entityType:3 shapes:0];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    shapes = v5->_shapes;
    v5->_shapes = (NSArray *)v6;

    v5->_gain = 1.0;
    v5->_dopplerFactor = 1.0;
    v5->_spatialResolution = 1.0;
    *(_OWORD *)v5->_velocity = 0u;
  }

  return v5;
}

- (PHASESource)initWithEngine:(PHASEEngine *)engine shapes:(NSArray *)shapes
{
  uint64_t v6 = engine;
  v7 = shapes;
  v8 = v7;
  if (v7 && [(NSArray *)v7 count])
  {
    v15.receiver = self;
    v15.super_class = (Class)PHASESource;
    objc_super v9 = [(PHASEObject *)&v15 initWithEngine:v6 entityType:3 shapes:v8];
    v10 = v9;
    if (v9)
    {
      v9->_gain = 1.0;
      v9->_dopplerFactor = 1.0;
      v9->_spatialResolution = 1.0;
      *(_OWORD *)v9->_velocity = 0u;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
      v12 = v10->_shapes;
      v10->_shapes = (NSArray *)v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a volumetric PHASESource with nil or empty shape array"];
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(NSArray *)self->_shapes count])
  {
    v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    uint64_t v6 = [(PHASEObject *)self engine];
    v7 = [(PHASESource *)self shapes];
    v8 = (void *)[v5 initWithEngine:v6 shapes:v7];
  }
  else
  {
    objc_super v9 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    uint64_t v6 = [(PHASEObject *)self engine];
    v8 = (void *)[v9 initWithEngine:v6];
  }

  [v8 setGain:self->_gain];
  [v8 setDopplerFactor:self->_dopplerFactor];
  [v8 setVelocity:*(double *)self->_velocity];
  [(PHASEObject *)self transform];
  objc_msgSend(v8, "setTransform:");
  return v8;
}

- (void)setGain:(double)gain
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = [(PHASEObject *)self engine];
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    objc_super v9 = NSStringFromSelector(a2);
    double v10 = PHASEGetPropertyBounded<double>(v8, v9, gain, 0.0, 1.0);

    if (self->_gain != v10)
    {
      uint64_t v11 = *(void *)([v6 implementation] + 368);
      v12.mData = (unint64_t)[(PHASEObject *)self geoEntityHandle];
      float v13 = v10;
      (*(void (**)(uint64_t, Handle64, float))(*(void *)v11 + 104))(v11, v12, v13);
      self->_gain = v10;
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F08320];
    uint64_t v26 = *MEMORY[0x263F08320];
    objc_super v15 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v27[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];

    v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v17)
                                                                                        + 432)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v16 objectForKeyedSubscript:v14];
      int v20 = 136315650;
      v21 = "PHASESource.mm";
      __int16 v22 = 1024;
      int v23 = 116;
      __int16 v24 = 2080;
      uint64_t v25 = [v19 UTF8String];
      _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

- (void)setDopplerFactor:(double)a3
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_dopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);
}

- (void)setSpatialResolution:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "PHASESource.mm";
    __int16 v6 = 1024;
    int v7 = 140;
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d This value is deprecated. It no longer has any effect on the engine. Ignoring request.", (uint8_t *)&v4, 0x12u);
  }
}

- (double)spatialResolution
{
  return self->_spatialResolution;
}

- (double)gain
{
  return self->_gain;
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (double)dopplerFactor
{
  return self->_dopplerFactor;
}

- (__n128)velocity
{
  return a1[10];
}

- (void)setVelocity:(PHASESource *)self
{
  *(_OWORD *)self->_velocity = v2;
}

- (void).cxx_destruct
{
}

@end