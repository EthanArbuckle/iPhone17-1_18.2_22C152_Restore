@interface PHASEListener
+ (PHASEListener)new;
- (PHASEListener)init;
- (PHASEListener)initWithEngine:(PHASEEngine *)engine;
- (PHASEListener)initWithEngine:(id)a3 entityType:(unsigned int)a4;
- (__n128)velocity;
- (double)dopplerFactor;
- (double)gain;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)automaticHeadTrackingFlags;
- (void)setAutomaticHeadTrackingFlags:(unint64_t)a3;
- (void)setDopplerFactor:(double)a3;
- (void)setGain:(double)gain;
- (void)setVelocity:(PHASEListener *)self;
@end

@implementation PHASEListener

- (PHASEListener)init
{
  return 0;
}

+ (PHASEListener)new
{
  return 0;
}

- (PHASEListener)initWithEngine:(id)a3 entityType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASEListener;
  v7 = [(PHASEObject *)&v11 initWithEngine:v6 entityType:v4 shapes:0];
  v8 = v7;
  if (v7)
  {
    v7->_gain = 1.0;
    v7->_dopplerFactor = 1.0;
    *(_OWORD *)v7->_velocity = 0u;
    v9 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v7) + 432);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "PHASEListener.mm";
      __int16 v14 = 1024;
      int v15 = 58;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created %@", buf, 0x1Cu);
    }
  }

  return v8;
}

- (PHASEListener)initWithEngine:(PHASEEngine *)engine
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = engine;
  v9.receiver = self;
  v9.super_class = (Class)PHASEListener;
  v5 = [(PHASEObject *)&v9 initWithEngine:v4 entityType:2 shapes:0];
  id v6 = v5;
  if (v5)
  {
    v5->_gain = 1.0;
    v5->_dopplerFactor = 1.0;
    *(_OWORD *)v5->_velocity = 0u;
    v7 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v5) + 432);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v11 = "PHASEListener.mm";
      __int16 v12 = 1024;
      int v13 = 72;
      __int16 v14 = 2112;
      int v15 = v6;
      _os_log_impl(&dword_221E5E000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created %@", buf, 0x1Cu);
    }
  }

  return v6;
}

- (void)setAutomaticHeadTrackingFlags:(unint64_t)a3
{
  v5 = [(PHASEObject *)self engine];
  if (v5)
  {
    id v8 = v5;
    uint64_t v6 = [v5 implementation];
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 368);
      if (v7) {
        (*(void (**)(uint64_t, uint64_t, unint64_t))(*(void *)v7 + 232))(v7, [(PHASEObject *)self geoEntityHandle], a3 & 1);
      }
    }
    self->_automaticHeadTrackingFlags = a3;
    v5 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(PHASEObject *)self engine];
  uint64_t v6 = (void *)[v4 initWithEngine:v5];

  [v6 setGain:self->_gain];
  [v6 setDopplerFactor:self->_dopplerFactor];
  [v6 setVelocity:*(double *)self->_velocity];
  [(PHASEObject *)self transform];
  objc_msgSend(v6, "setTransform:");
  return v6;
}

- (void)setGain:(double)gain
{
  v28[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  double v9 = PHASEGetPropertyBounded<double>(v7, v8, gain, 0.0, 1.0);

  v10 = [(PHASEObject *)self engine];
  objc_super v11 = v10;
  if (v10)
  {
    if (self->_gain != v9)
    {
      uint64_t v12 = *(void *)([v10 implementation] + 368);
      v13.mData = (unint64_t)[(PHASEObject *)self geoEntityHandle];
      float v14 = v9;
      (*(void (**)(uint64_t, Handle64, float))(*(void *)v12 + 112))(v12, v13, v14);
      self->_gain = v9;
    }
  }
  else
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    uint64_t v27 = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v28[0] = v16;
    v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];

    v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                        + 432)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v17 objectForKeyedSubscript:v15];
      int v21 = 136315650;
      v22 = "PHASEListener.mm";
      __int16 v23 = 1024;
      int v24 = 119;
      __int16 v25 = 2080;
      uint64_t v26 = [v20 UTF8String];
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v21, 0x1Cu);
    }
  }
}

- (void)setDopplerFactor:(double)a3
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = NSStringFromSelector(a2);
  self->_dopplerFactor = PHASEGetPropertyBounded<double>(v8, v7, a3, 0.0, 1.79769313e308);
}

- (double)gain
{
  return self->_gain;
}

- (unint64_t)automaticHeadTrackingFlags
{
  return self->_automaticHeadTrackingFlags;
}

- (double)dopplerFactor
{
  return self->_dopplerFactor;
}

- (__n128)velocity
{
  return a1[9];
}

- (void)setVelocity:(PHASEListener *)self
{
  *(_OWORD *)self->_velocity = v2;
}

@end