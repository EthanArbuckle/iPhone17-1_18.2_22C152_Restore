@interface __HMFActivityManager
- (__HMFActivityManager)init;
@end

@implementation __HMFActivityManager

- (__HMFActivityManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)__HMFActivityManager;
  v2 = [(__HMFActivityManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:6];
    activitiesByIdentifier = v2->_activitiesByIdentifier;
    v2->_activitiesByIdentifier = (NSMapTable *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end