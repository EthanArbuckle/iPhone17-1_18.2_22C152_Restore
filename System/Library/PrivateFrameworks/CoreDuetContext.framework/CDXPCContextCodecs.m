@interface CDXPCContextCodecs
@end

@implementation CDXPCContextCodecs

uint64_t __50___CDXPCContextCodecs_supportedClassesToUnarchive__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = (void *)supportedClassesToUnarchive_supportedClasses;
  supportedClassesToUnarchive_supportedClasses = v4;

  v6 = (void *)supportedClassesToUnarchive_supportedClasses;
  v7 = +[_CDContextValue supportedContextValueClasses];
  [v6 unionSet:v7];

  v8 = (void *)supportedClassesToUnarchive_supportedClasses;
  uint64_t v9 = *(void *)(a1 + 32);
  return [v8 unionSet:v9];
}

@end