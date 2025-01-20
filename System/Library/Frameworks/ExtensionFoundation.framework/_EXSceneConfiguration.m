@interface _EXSceneConfiguration
- (Class)sceneClass;
- (Class)sceneDelegateClass;
- (NSString)role;
- (NSString)sceneDelegateClassName;
- (_EXPromise)initializationPromise;
- (_EXSceneConfiguration)initWithParameters:(id)a3;
- (_EXSceneSessionParameters)parameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initializationParametersOfClass:(Class)a3 error:(id *)a4;
- (void)setSceneClass:(Class)a3;
- (void)setSceneDelegateClass:(Class)a3;
- (void)setSceneDelegateClassName:(id)a3;
@end

@implementation _EXSceneConfiguration

- (_EXSceneConfiguration)initWithParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXSceneConfiguration;
  v6 = [(_EXSceneConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_parameters, a3);
  }

  return v7;
}

- (NSString)role
{
  return [(_EXSceneSessionParameters *)self->_parameters sceneIdentifier];
}

- (_EXPromise)initializationPromise
{
  return [(_EXSceneSessionParameters *)self->_parameters initializationParametersPromise];
}

- (Class)sceneDelegateClass
{
  sceneDelegateClass = (NSString *)self->_sceneDelegateClass;
  if (!sceneDelegateClass)
  {
    sceneDelegateClass = self->_sceneDelegateClassName;
    if (sceneDelegateClass)
    {
      NSClassFromString(sceneDelegateClass);
      v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
      Class v5 = self->_sceneDelegateClass;
      self->_sceneDelegateClass = v4;

      sceneDelegateClass = (NSString *)self->_sceneDelegateClass;
    }
  }

  return (Class)sceneDelegateClass;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[_EXSceneConfiguration alloc] initWithParameters:self->_parameters];
  [(_EXSceneConfiguration *)v4 setSceneDelegateClass:[(_EXSceneConfiguration *)self sceneDelegateClass]];
  Class v5 = [(_EXSceneConfiguration *)self sceneDelegateClassName];
  v6 = (void *)[v5 copy];
  [(_EXSceneConfiguration *)v4 setSceneDelegateClassName:v6];

  [(_EXSceneConfiguration *)v4 setSceneClass:[(_EXSceneConfiguration *)self sceneClass]];
  return v4;
}

- (id)initializationParametersOfClass:(Class)a3 error:(id *)a4
{
  v6 = [(_EXSceneSessionParameters *)self->_parameters initializationParametersPromise];
  v7 = v6;
  if (a3 && v6)
  {
    v8 = [v6 resolveObjectOfClass:a3 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.extensionKit.errorDomain" code:8 userInfo:MEMORY[0x1E4F1CC08]];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_EXSceneSessionParameters)parameters
{
  return (_EXSceneSessionParameters *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)sceneDelegateClassName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSceneDelegateClassName:(id)a3
{
}

- (void)setSceneDelegateClass:(Class)a3
{
}

- (Class)sceneClass
{
  return self->_sceneClass;
}

- (void)setSceneClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClass, 0);
  objc_storeStrong((id *)&self->_sceneDelegateClass, 0);
  objc_storeStrong((id *)&self->_sceneDelegateClassName, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end