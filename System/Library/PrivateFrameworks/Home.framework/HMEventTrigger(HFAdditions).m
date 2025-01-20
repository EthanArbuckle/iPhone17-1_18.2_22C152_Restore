@interface HMEventTrigger(HFAdditions)
- (uint64_t)hf_affectsCharacteristics:()HFAdditions;
- (uint64_t)hf_requiresConfirmationToRun;
@end

@implementation HMEventTrigger(HFAdditions)

- (uint64_t)hf_requiresConfirmationToRun
{
  v2 = [a1 events];
  int v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_352);

  v4 = [a1 actionSets];
  LODWORD(v2) = objc_msgSend(v4, "na_any:", &__block_literal_global_354);

  return v3 & v2;
}

- (uint64_t)hf_affectsCharacteristics:()HFAdditions
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_26C15D4B8;
  if (objc_msgSendSuper2(&v8, sel_hf_affectsCharacteristics_, v4))
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(a1, "hf_characteristicsInEvents");
    uint64_t v5 = [v4 intersectsSet:v6];
  }
  return v5;
}

@end