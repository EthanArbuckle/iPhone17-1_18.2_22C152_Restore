@interface FBSComponentScene
- (BOOL)conformsToExtension:(Class)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)class;
- (Class)extension;
- (Class)superclass;
- (FBSComponentScene)initWithScene:(id)a3 extension:(Class)a4;
- (NSString)debugDescription;
- (NSString)description;
- (id)clientSettings;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)loggingIdentifier;
- (id)scene;
- (id)settings;
- (id)siblingComponentOfClass:(Class)a3;
- (unint64_t)hash;
- (void)sendActions:(id)a3;
- (void)sendPrivateActions:(id)a3;
@end

@implementation FBSComponentScene

- (id)settings
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  v3 = [WeakRetained settings];

  return v3;
}

- (FBSComponentScene)initWithScene:(id)a3 extension:(Class)a4
{
  self->_extension = a4;
  return self;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);

  return WeakRetained;
}

- (BOOL)isProxy
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)isKindOfClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  unint64_t v3 = [WeakRetained hash];

  return v3;
}

- (Class)class
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  unint64_t v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)isEqual:(id)a3
{
  p_scene = &self->_scene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(p_scene);
  char v6 = [WeakRetained isEqual:v4];

  return v6;
}

- (id)clientSettings
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  unint64_t v3 = [WeakRetained clientSettings];

  return v3;
}

- (id)scene
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);

  return WeakRetained;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (Class)superclass
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  unint64_t v3 = [WeakRetained superclass];

  return (Class)v3;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  LOBYTE(a3) = [WeakRetained isMemberOfClass:a3];

  return (char)a3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  p_scene = &self->_scene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(p_scene);
  char v6 = [WeakRetained conformsToProtocol:v4];

  return v6;
}

- (NSString)description
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  unint64_t v3 = [WeakRetained description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = NSStringFromClass(self->_extension);
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  v8 = [WeakRetained succinctDescription];
  v9 = [v3 stringWithFormat:@"<%@: %p; ex: %@> --> %@", v5, self, v6, v8];

  return (NSString *)v9;
}

- (void)sendActions:(id)a3
{
  p_scene = &self->_scene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(p_scene);
  [WeakRetained sendActions:v4];
}

- (void)sendPrivateActions:(id)a3
{
  p_scene = &self->_scene;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_scene);
  [WeakRetained sendActions:v5 toExtension:self->_extension];
}

- (id)loggingIdentifier
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  unint64_t v3 = [WeakRetained loggingIdentifier];

  return v3;
}

- (id)siblingComponentOfClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  char v6 = [WeakRetained componentForExtension:self->_extension ofClass:a3];

  return v6;
}

- (Class)extension
{
  return self->_extension;
}

- (BOOL)conformsToExtension:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_scene);
  LOBYTE(a3) = [WeakRetained conformsToExtension:a3];

  return (char)a3;
}

@end