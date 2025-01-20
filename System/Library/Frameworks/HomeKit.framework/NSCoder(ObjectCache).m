@interface NSCoder(ObjectCache)
- (id)hm_decodeAndCacheStringForKey:()ObjectCache;
- (id)hm_decodeAndCacheTruncatedNameStringForKey:()ObjectCache;
- (id)hm_decodeAndCacheUUIDForKey:()ObjectCache;
- (id)hm_decodeAndCacheUUIDFromStringForKey:()ObjectCache;
- (id)hm_decodeHMAccessoryCategoryAndCacheForKey:()ObjectCache;
@end

@implementation NSCoder(ObjectCache)

- (id)hm_decodeAndCacheUUIDForKey:()ObjectCache
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  v6 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v5);

  return v6;
}

- (id)hm_decodeAndCacheStringForKey:()ObjectCache
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  v6 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v5);

  return v6;
}

- (id)hm_decodeAndCacheUUIDFromStringForKey:()ObjectCache
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
  v7 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v6);

  return v7;
}

- (id)hm_decodeHMAccessoryCategoryAndCacheForKey:()ObjectCache
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  v6 = +[HMFObjectCacheHMAccessoryCategory cachedInstanceForHMAccessoryCategory:v5];

  return v6;
}

- (id)hm_decodeAndCacheTruncatedNameStringForKey:()ObjectCache
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  v6 = (void *)MEMORY[0x1E4F654E8];
  v7 = objc_msgSend(v5, "hm_truncatedNameString");
  v8 = objc_msgSend(v6, "hmf_cachedInstanceForString:", v7);

  return v8;
}

@end