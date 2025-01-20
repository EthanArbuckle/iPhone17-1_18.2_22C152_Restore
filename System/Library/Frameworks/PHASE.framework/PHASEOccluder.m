@interface PHASEOccluder
+ (PHASEOccluder)new;
- (BOOL)isStatic;
- (NSArray)shapes;
- (PHASEOccluder)init;
- (PHASEOccluder)initWithEngine:(PHASEEngine *)engine shapes:(NSArray *)shapes;
- (float)materialScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIsStatic:(BOOL)a3;
- (void)setMaterialScaleFactor:(float)a3;
@end

@implementation PHASEOccluder

- (PHASEOccluder)init
{
  return 0;
}

+ (PHASEOccluder)new
{
  return 0;
}

- (PHASEOccluder)initWithEngine:(PHASEEngine *)engine shapes:(NSArray *)shapes
{
  v6 = engine;
  v7 = shapes;
  v8 = v7;
  if (v7 && [(NSArray *)v7 count])
  {
    v15.receiver = self;
    v15.super_class = (Class)PHASEOccluder;
    v9 = [(PHASEObject *)&v15 initWithEngine:v6 entityType:4 shapes:v8];
    v10 = v9;
    if (v9)
    {
      v9->_materialScaleFactor = 1.0;
      v9->_isStatic = 0;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
      v12 = v10->_shapes;
      v10->_shapes = (NSArray *)v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a PHASEOccluder with nil or empty shape array"];
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(PHASEObject *)self engine];
  v6 = [(PHASEOccluder *)self shapes];
  v7 = (void *)[v4 initWithEngine:v5 shapes:v6];

  *(float *)&double v8 = self->_materialScaleFactor;
  [v7 setMaterialScaleFactor:v8];
  [v7 setIsStatic:self->_isStatic];
  [(PHASEObject *)self transform];
  objc_msgSend(v7, "setTransform:");
  return v7;
}

- (void)setIsStatic:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x263EF8340];
  v5 = [(PHASEObject *)self engine];
  v6 = v5;
  if (v5)
  {
    if (self->_isStatic != v3)
    {
      uint64_t v7 = *(void *)([v5 implementation] + 368);
      (*(void (**)(uint64_t, uint64_t, BOOL))(*(void *)v7 + 224))(v7, [(PHASEObject *)self geoEntityHandle], v3);
      self->_isStatic = v3;
    }
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F08320];
    uint64_t v20 = *MEMORY[0x263F08320];
    v9 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v21[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

    v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v11)
                                                                                        + 432)));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v10 objectForKeyedSubscript:v8];
      int v14 = 136315650;
      objc_super v15 = "PHASEOccluder.mm";
      __int16 v16 = 1024;
      int v17 = 83;
      __int16 v18 = 2080;
      uint64_t v19 = [v13 UTF8String];
      _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (float)materialScaleFactor
{
  return self->_materialScaleFactor;
}

- (void)setMaterialScaleFactor:(float)a3
{
  self->_materialScaleFactor = a3;
}

- (BOOL)isStatic
{
  return self->_isStatic;
}

- (void).cxx_destruct
{
}

@end