@interface HDAnalyticsWriter(HDProfile)
- (uint64_t)initWithProfile:()HDProfile;
@end

@implementation HDAnalyticsWriter(HDProfile)

- (uint64_t)initWithProfile:()HDProfile
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [a3 healthDaemon];
  v6 = [v5 primaryProfile];
  v7 = [v6 directoryPath];
  v8 = [v7 stringByAppendingPathComponent:@"Analytics"];
  v9 = [v4 fileURLWithPath:v8];
  uint64_t v10 = [a1 initWithURL:v9];

  return v10;
}

@end