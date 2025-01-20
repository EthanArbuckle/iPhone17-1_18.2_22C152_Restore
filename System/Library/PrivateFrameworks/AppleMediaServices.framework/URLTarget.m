@interface URLTarget
+ (id)targetWithBundle:(id)a3 scheme:(id)a4 secureScheme:(id)a5;
- (NSString)bundleID;
- (NSString)normalScheme;
- (NSString)secureScheme;
- (URLTarget)initWithBundle:(id)a3 scheme:(id)a4 secureScheme:(id)a5;
- (int64_t)defaultIndex;
- (void)setBundleID:(id)a3;
- (void)setDefaultIndex:(int64_t)a3;
- (void)setNormalScheme:(id)a3;
- (void)setSecureScheme:(id)a3;
@end

@implementation URLTarget

- (URLTarget)initWithBundle:(id)a3 scheme:(id)a4 secureScheme:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)URLTarget;
  v12 = [(URLTarget *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v13->_normalScheme, a4);
    objc_storeStrong((id *)&v13->_secureScheme, a5);
  }

  return v13;
}

+ (id)targetWithBundle:(id)a3 scheme:(id)a4 secureScheme:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithBundle:v10 scheme:v9 secureScheme:v8];

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int64_t)defaultIndex
{
  return self->_defaultIndex;
}

- (void)setDefaultIndex:(int64_t)a3
{
  self->_defaultIndex = a3;
}

- (NSString)normalScheme
{
  return self->_normalScheme;
}

- (void)setNormalScheme:(id)a3
{
}

- (NSString)secureScheme
{
  return self->_secureScheme;
}

- (void)setSecureScheme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureScheme, 0);
  objc_storeStrong((id *)&self->_normalScheme, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end