@interface SCNImageSource
- (BOOL)isOpaque;
- (BOOL)isPremultiplied;
- (id)textureSource;
- (void)connectToProxy:(__C3DImageProxy *)a3;
- (void)textureSource;
@end

@implementation SCNImageSource

- (id)textureSource
{
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[SCNImageSource textureSource](a2);
  }
  return 0;
}

- (BOOL)isOpaque
{
  return 1;
}

- (BOOL)isPremultiplied
{
  return 1;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  C3DImageProxySetSource((uint64_t)a3, self, 0);
  v4[0] = xmmword_26BF72288;
  v4[1] = *(_OWORD *)&off_26BF72298;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (void)textureSource
{
  NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: SCNImageSource astract method invoked %@", v3, v4, v5, v6, v7);
}

@end