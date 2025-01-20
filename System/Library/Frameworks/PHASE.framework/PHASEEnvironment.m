@interface PHASEEnvironment
+ (id)new;
- (NSArray)shapes;
- (PHASEEnvironment)init;
- (PHASEEnvironment)initWithEngine:(id)a3 shapes:(id)a4;
- (PHASEMedium)medium;
- (float)mediumScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMedium:(id)a3;
- (void)setMediumScaleFactor:(float)a3;
@end

@implementation PHASEEnvironment

- (PHASEEnvironment)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEEnvironment)initWithEngine:(id)a3 shapes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 count])
  {
    v16.receiver = self;
    v16.super_class = (Class)PHASEEnvironment;
    v9 = [(PHASEObject *)&v16 initWithEngine:v6 entityType:5 shapes:v8];
    v10 = v9;
    if (v9)
    {
      medium = v9->_medium;
      v9->_medium = 0;

      v10->_mediumScaleFactor = 1.0;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
      shapes = v10->_shapes;
      v10->_shapes = (NSArray *)v12;
    }
    self = v10;
    v14 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"Cannot create a PHASEEnvironment with nil or empty shape array"];
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(PHASEObject *)self engine];
  id v6 = [(PHASEEnvironment *)self shapes];
  id v7 = (void *)[v4 initWithEngine:v5 shapes:v6];

  [v7 setMedium:self->_medium];
  *(float *)&double v8 = self->_mediumScaleFactor;
  [v7 setMediumScaleFactor:v8];
  [(PHASEObject *)self transform];
  objc_msgSend(v7, "setTransform:");
  return v7;
}

- (PHASEMedium)medium
{
  return self->_medium;
}

- (void)setMedium:(id)a3
{
}

- (float)mediumScaleFactor
{
  return self->_mediumScaleFactor;
}

- (void)setMediumScaleFactor:(float)a3
{
  self->_mediumScaleFactor = a3;
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medium, 0);

  objc_storeStrong((id *)&self->_shapes, 0);
}

@end