@interface _UIKeyboardChangedInformationWithManualFence
+ (id)animationFence;
+ (void)popFence;
+ (void)pushFence:(id)a3;
@end

@implementation _UIKeyboardChangedInformationWithManualFence

+ (void)pushFence:(id)a3
{
  id v3 = a3;
  v4 = (void *)_fenceList;
  id v7 = v3;
  if (!_fenceList)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    v6 = (void *)_fenceList;
    _fenceList = v5;

    id v3 = v7;
    v4 = (void *)_fenceList;
  }
  [v4 addObject:v3];
}

+ (void)popFence
{
}

+ (id)animationFence
{
  return (id)[(id)_fenceList lastObject];
}

@end