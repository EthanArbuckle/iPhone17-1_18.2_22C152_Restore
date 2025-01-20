@interface BLSHEnvironmentAndSource
- (BLSHBacklightSceneHostEnvironment)environment;
- (BLSHEnvironmentAndSource)initWithEnvironment:(id)a3 environmentSource:(id)a4;
- (id)environmentSource;
@end

@implementation BLSHEnvironmentAndSource

- (BLSHEnvironmentAndSource)initWithEnvironment:(id)a3 environmentSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHEnvironmentAndSource;
  v9 = [(BLSHEnvironmentAndSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong(&v10->_environmentSource, a4);
  }

  return v10;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (id)environmentSource
{
  return self->_environmentSource;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_environmentSource, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end