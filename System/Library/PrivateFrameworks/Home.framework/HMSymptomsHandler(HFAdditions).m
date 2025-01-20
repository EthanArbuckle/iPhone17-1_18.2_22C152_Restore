@interface HMSymptomsHandler(HFAdditions)
+ (id)hf_symptomArraySortComparator;
+ (id)hf_symptomTypesSortedByPriority;
+ (void)initialize;
- (id)hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay;
- (id)hf_symptomsSortedByPriority;
@end

@implementation HMSymptomsHandler(HFAdditions)

+ (id)hf_symptomArraySortComparator
{
  v0 = objc_msgSend((id)objc_opt_class(), "hf_symptomTypesSortedByPriority");
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__HMSymptomsHandler_HFAdditions__hf_symptomArraySortComparator__block_invoke;
  aBlock[3] = &unk_264091688;
  id v5 = v0;
  id v1 = v0;
  v2 = _Block_copy(aBlock);

  return v2;
}

+ (id)hf_symptomTypesSortedByPriority
{
  if (_MergedGlobals_238 != -1) {
    dispatch_once(&_MergedGlobals_238, &__block_literal_global_83);
  }
  v0 = (void *)qword_26AB2EF08;
  return v0;
}

+ (void)initialize
{
  if (objc_opt_class() == a1 && HFPreferencesInternalDebuggingEnabled())
  {
    uint64_t v1 = objc_opt_class();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__HMSymptomsHandler_HFAdditions__initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v1;
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, block);
    }
  }
}

- (id)hf_symptomsSortedByPriority
{
  uint64_t v1 = [a1 symptoms];
  v2 = [v1 allObjects];
  v3 = objc_msgSend((id)objc_opt_class(), "hf_symptomArraySortComparator");
  v4 = [v2 sortedArrayUsingComparator:v3];

  return v4;
}

- (id)hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay
{
  v2 = objc_msgSend(a1, "hf_fakeSymptomsImplementationUsedForDebuggingPleaseDontTouchThisItIsFragileSwizzlingIsBadMKay");
  v3 = (void *)[v2 mutableCopy];

  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 home];
  v6 = objc_msgSend(v5, "hf_mediaProfileContainerForSymptomsHandler:", a1);

  v7 = objc_msgSend(v6, "hf_fakeDebugSymptoms");
  [v3 unionSet:v7];

  return v3;
}

@end