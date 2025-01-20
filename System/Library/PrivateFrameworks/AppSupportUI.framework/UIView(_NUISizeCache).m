@interface UIView(_NUISizeCache)
- (uint64_t)nukeContentLayoutSizeCacheFromOrbit;
@end

@implementation UIView(_NUISizeCache)

- (uint64_t)nukeContentLayoutSizeCacheFromOrbit
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  IfNeeded->_sizeCache.__end_ = IfNeeded->_sizeCache.__begin_;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = (void *)[(objc_object *)a1 subviews];
  uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) nukeContentLayoutSizeCacheFromOrbit];
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

@end