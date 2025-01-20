@interface SKGlobalSharedContextRegistry
+ (id)globalGLSharedContext;
+ (id)globalMetalDevice;
+ (void)setGlobalGLSharedContext:(id)a3;
+ (void)setGlobalMetalDevice:(id)a3;
+ (void)setPrefersOpenGL:(BOOL)a3;
@end

@implementation SKGlobalSharedContextRegistry

+ (void)setGlobalMetalDevice:(id)a3
{
}

+ (void)setPrefersOpenGL:(BOOL)a3
{
}

+ (id)globalGLSharedContext
{
  SKEnsureGlobalGLShareContext();
  v2 = (void *)_glShareContext;

  return v2;
}

+ (void)setGlobalGLSharedContext:(id)a3
{
}

+ (id)globalMetalDevice
{
  SKEnsureGlobalMetalDevice();
  v2 = (void *)_metalDevice;

  return v2;
}

@end