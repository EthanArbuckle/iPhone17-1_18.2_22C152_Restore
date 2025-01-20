@interface HKCompoundFilter
@end

@implementation HKCompoundFilter

uint64_t __64___HKCompoundFilter_HealthDaemon__filterIgnoringPrivateMetadata__block_invoke(uint64_t a1, void *a2)
{
  return [a2 filterIgnoringPrivateMetadata];
}

uint64_t __73___HKCompoundFilter_HealthDaemon__filterIgnoringActivityCacheIndexFilter__block_invoke(uint64_t a1, void *a2)
{
  return [a2 filterIgnoringActivityCacheIndexFilter];
}

uint64_t __79___HKCompoundFilter_HealthDaemon___filterByApplyingTransformationToSubfilters___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __62___HKCompoundFilter__HKBuilders__builder_filterWithDataTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v3, "builder_filterWithDataTypes:", *(void *)(a1 + 32));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

@end