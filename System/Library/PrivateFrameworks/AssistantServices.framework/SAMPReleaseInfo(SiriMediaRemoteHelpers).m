@interface SAMPReleaseInfo(SiriMediaRemoteHelpers)
+ (id)_af_releaseInfoWithReleaseDate:()SiriMediaRemoteHelpers;
@end

@implementation SAMPReleaseInfo(SiriMediaRemoteHelpers)

+ (id)_af_releaseInfoWithReleaseDate:()SiriMediaRemoteHelpers
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F96588];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    v7 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v8 = [v7 name];
    [v6 setTimeZoneId:v8];

    [v6 setDate:v5];
    id v9 = objc_alloc_init(a1);
    [v9 setReleaseDate:v6];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

@end