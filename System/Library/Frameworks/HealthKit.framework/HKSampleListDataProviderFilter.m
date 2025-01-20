@interface HKSampleListDataProviderFilter
- (BOOL)acceptsDataObject:(id)a3;
- (HKSampleListDataProviderFilter)init;
- (HKSampleListDataProviderFilter)initWithPredicate:(id)a3 dataTypes:(id)a4;
@end

@implementation HKSampleListDataProviderFilter

- (HKSampleListDataProviderFilter)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKSampleListDataProviderFilter)initWithPredicate:(id)a3 dataTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKSampleListDataProviderFilter;
  v8 = [(HKSampleListDataProviderFilter *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(v6, "hk_filterRepresentationForDataTypes:", v7);
    filter = v8->_filter;
    v8->_filter = (_HKFilter *)v9;
  }
  return v8;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return [(_HKFilter *)self->_filter acceptsDataObject:a3];
}

- (void).cxx_destruct
{
}

@end