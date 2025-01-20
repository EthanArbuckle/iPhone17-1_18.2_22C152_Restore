@interface HFChildServiceFilter
- (HFChildServiceFilter)initWithChildServiceTypes:(id)a3;
- (NSSet)childServiceTypes;
- (id)filteredChildServicesForParentService:(id)a3;
@end

@implementation HFChildServiceFilter

- (void).cxx_destruct
{
}

- (HFChildServiceFilter)initWithChildServiceTypes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFChildServiceFilter;
  v5 = [(HFChildServiceFilter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    childServiceTypes = v5->_childServiceTypes;
    v5->_childServiceTypes = (NSSet *)v6;
  }
  return v5;
}

- (id)filteredChildServicesForParentService:(id)a3
{
  id v4 = objc_msgSend(a3, "hf_childServices");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__HFChildServiceFilter_filteredChildServicesForParentService___block_invoke;
  v7[3] = &unk_26408E0E8;
  v7[4] = self;
  v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

BOOL __62__HFChildServiceFilter_filteredChildServicesForParentService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) childServiceTypes];
  if (!v4) {
    goto LABEL_3;
  }
  v5 = (void *)v4;
  uint64_t v6 = [*(id *)(a1 + 32) childServiceTypes];
  v7 = [v3 serviceType];
  int v8 = [v6 containsObject:v7];

  if (!v8) {
    BOOL v9 = 0;
  }
  else {
LABEL_3:
  }
    BOOL v9 = [v3 configurationState] != 2;

  return v9;
}

- (NSSet)childServiceTypes
{
  return self->_childServiceTypes;
}

@end