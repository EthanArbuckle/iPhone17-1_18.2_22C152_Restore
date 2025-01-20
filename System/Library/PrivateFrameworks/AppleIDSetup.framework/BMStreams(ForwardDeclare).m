@interface BMStreams(ForwardDeclare)
+ (id)ais_appleIDChildSetupSource;
+ (void)ais_appleIDChildSetupSource;
@end

@implementation BMStreams(ForwardDeclare)

+ (id)ais_appleIDChildSetupSource
{
  v0 = +[AISChildSetupBiomeEventFactory log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    +[BMStreams(ForwardDeclare) ais_appleIDChildSetupSource](v0);
  }

  v1 = BiomeLibrary();
  v2 = [v1 AppleID];
  v3 = [v2 ChildSetup];
  v4 = [v3 source];

  return v4;
}

+ (void)ais_appleIDChildSetupSource
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_247F93000, log, OS_LOG_TYPE_DEBUG, "AISChildSetupBiomeEventFactory - Loaded appleIDChildSetup stream", v1, 2u);
}

@end