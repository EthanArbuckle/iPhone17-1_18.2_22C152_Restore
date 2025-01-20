@interface ATXPosterConfigurationCacheGuardedData
- (ATXPosterConfigurationCacheGuardedData)init;
@end

@implementation ATXPosterConfigurationCacheGuardedData

- (ATXPosterConfigurationCacheGuardedData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXPosterConfigurationCacheGuardedData;
  v2 = [(ATXPosterConfigurationCacheGuardedData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->observers;
    v2->observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->observers, 0);
  objc_storeStrong((id *)&self->configurations, 0);
}

@end