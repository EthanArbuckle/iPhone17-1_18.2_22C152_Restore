@interface SHServiceStateHandlerUtilities
+ (void)registerBundleAttributionForAuditToken:(id *)a3;
+ (void)registerMusicRecognitionBundleAttribution;
@end

@implementation SHServiceStateHandlerUtilities

+ (void)registerBundleAttributionForAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v4[0] = *(_OWORD *)a3->var0;
  v4[1] = v3;
  +[STDynamicActivityAttributionPublisher setCurrentAttributionStringWithFormat:@"%@" auditToken:v4];
}

+ (void)registerMusicRecognitionBundleAttribution
{
}

@end