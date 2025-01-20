@interface FBSSceneSettings
+ (Class)_baseClass;
+ (Class)_diffClass;
+ (Class)_mutableClass;
+ (Class)subclassExtension;
+ (id)_settingsExtensionsForSceneExtension:(Class)a3;
+ (id)settings;
- (BOOL)_hasAdditionalDescription;
- (BOOL)_isEmptyForCoding:(BOOL)a3;
- (BOOL)_isEqualToSettings:(id)a3;
- (BOOL)isBackgrounded;
- (BOOL)isIgnoringOcclusions;
- (CGRect)bounds;
- (FBSDisplayIdentity)displayIdentity;
- (FBSSceneSettings)initWithSettings:(id)a3;
- (id)ignoreOcclusionReasons;
- (void)_appendToDescriptionBuilder:(id)a3;
@end

@implementation FBSSceneSettings

- (CGRect)bounds
{
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)subclassExtension
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (BOOL)_isEqualToSettings:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    v6 = (void *)*((void *)v4 + 9);
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  if (-[NSSet count](self->_ignoreOcclusionReasons, "count") || [v7 count]) {
    BSEqualObjects();
  }
  v10.receiver = self;
  v10.super_class = (Class)FBSSceneSettings;
  BOOL v8 = [(FBSSettings *)&v10 _isEqualToSettings:v5];

  return v8;
}

- (FBSSceneSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBSSceneSettings;
  v5 = [(FBSSettings *)&v12 initWithSettings:v4];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = [v4 ignoreOcclusionReasons];
    BOOL v8 = v7;
    if (isKindOfClass) {
      uint64_t v9 = [v7 mutableCopy];
    }
    else {
      uint64_t v9 = [v7 copy];
    }
    ignoreOcclusionReasons = v5->_ignoreOcclusionReasons;
    v5->_ignoreOcclusionReasons = (NSSet *)v9;
  }
  return v5;
}

- (id)ignoreOcclusionReasons
{
  return self->_ignoreOcclusionReasons;
}

+ (Class)_diffClass
{
  return (Class)objc_opt_class();
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return (id)[(objc_class *)a3 settingsExtensions];
}

- (FBSDisplayIdentity)displayIdentity
{
  v2 = [(FBSSceneSettings *)self displayConfiguration];
  v3 = [v2 identity];

  return (FBSDisplayIdentity *)v3;
}

+ (id)settings
{
  v2 = (void *)[objc_alloc((Class)a1) initWithSettings:0];

  return v2;
}

- (BOOL)isBackgrounded
{
  return [(FBSSceneSettings *)self isForeground] ^ 1;
}

- (BOOL)isIgnoringOcclusions
{
  return [(NSSet *)self->_ignoreOcclusionReasons count] != 0;
}

- (BOOL)_isEmptyForCoding:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FBSSceneSettings;
  BOOL v5 = -[FBSSettings _isEmptyForCoding:](&v7, sel__isEmptyForCoding_);
  if (v5 && !a3) {
    LOBYTE(v5) = [(NSSet *)self->_ignoreOcclusionReasons count] == 0;
  }
  return v5;
}

- (BOOL)_hasAdditionalDescription
{
  v2 = [(NSSet *)self->_ignoreOcclusionReasons allObjects];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_appendToDescriptionBuilder:(id)a3
{
  ignoreOcclusionReasons = self->_ignoreOcclusionReasons;
  id v4 = a3;
  id v5 = [(NSSet *)ignoreOcclusionReasons allObjects];
  [v4 appendArraySection:v5 withName:@"ignoreOcclusionReasons" skipIfEmpty:1];
}

@end