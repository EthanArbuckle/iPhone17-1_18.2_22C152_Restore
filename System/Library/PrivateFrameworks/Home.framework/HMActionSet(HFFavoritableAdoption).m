@interface HMActionSet(HFFavoritableAdoption)
- (uint64_t)hf_effectiveShowInHomeDashboard;
- (uint64_t)hf_hasSetFavorite;
- (uint64_t)hf_hasSetShowInHomeDashboard;
- (uint64_t)hf_isFavorite;
- (uint64_t)hf_showInHomeDashboard;
- (uint64_t)hf_updateIsFavorite:()HFFavoritableAdoption;
- (uint64_t)hf_updateShowInHomeDashboard:()HFFavoritableAdoption;
@end

@implementation HMActionSet(HFFavoritableAdoption)

- (uint64_t)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_shouldBeOnForContextType:", 3);
}

- (uint64_t)hf_isFavorite
{
  NSLog(&cfstr_ActionsetCanno.isa);
  return objc_msgSend(a1, "hf_showInHomeDashboard");
}

- (uint64_t)hf_hasSetFavorite
{
  return 0;
}

- (uint64_t)hf_updateIsFavorite:()HFFavoritableAdoption
{
  NSLog(&cfstr_AttemptingToUp_1.isa);
  v0 = (void *)MEMORY[0x263F58190];
  return [v0 futureWithNoResult];
}

- (uint64_t)hf_showInHomeDashboard
{
  return objc_msgSend(a1, "hf_isOnForContextType:", 3);
}

- (uint64_t)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(a1, "hf_hasSetForContextType:", 3);
}

- (uint64_t)hf_updateShowInHomeDashboard:()HFFavoritableAdoption
{
  return objc_msgSend(a1, "hf_updateValue:forContextType:", a3, 3);
}

@end