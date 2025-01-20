@interface HMTelevisionProfile(HFAdditions)
- (id)hf_mediaSourceComparator;
- (uint64_t)hf_offersAutomation;
@end

@implementation HMTelevisionProfile(HFAdditions)

- (id)hf_mediaSourceComparator
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [a1 mediaSourceDisplayOrder];
  v3 = HFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = a1;
    _os_log_debug_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEBUG, "No media source display order for television profile: %@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HMTelevisionProfile_HFAdditions__hf_mediaSourceComparator__block_invoke;
  aBlock[3] = &unk_264093FF0;
  id v8 = v2;
  id v4 = v2;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (uint64_t)hf_offersAutomation
{
  return 1;
}

@end