@interface CNUICoreContactAggregateValueFilter
- (CNUICoreContactAggregateValueFilter)init;
- (CNUICoreContactAggregateValueFilter)initWithValueFilters:(id)a3;
- (NSArray)valueFilters;
- (NSString)description;
- (id)contactByFilteringOutPropertyValueOfContact:(id)a3;
- (void)filterPropertyValuesFromContact:(id)a3;
@end

@implementation CNUICoreContactAggregateValueFilter

- (CNUICoreContactAggregateValueFilter)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactAggregateValueFilter)initWithValueFilters:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
    }
    v6 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactAggregateValueFilter initWithValueFilters:](v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNUICoreContactAggregateValueFilter;
  v7 = [(CNUICoreContactAggregateValueFilter *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_valueFilters, a3);
    v9 = v8;
  }

  return v8;
}

- (id)contactByFilteringOutPropertyValueOfContact:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
    }
    id v5 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactAggregateValueFilter contactByFilteringOutPropertyValueOfContact:](v5);
    }
  }
  v6 = (void *)[v4 mutableCopy];
  [(CNUICoreContactAggregateValueFilter *)self filterPropertyValuesFromContact:v6];

  return v6;
}

- (void)filterPropertyValuesFromContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUICoreContactAggregateValueFilter *)self valueFilters];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CNUICoreContactAggregateValueFilter_filterPropertyValuesFromContact___block_invoke;
  v7[3] = &unk_2640170C8;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "_cn_each:", v7);
}

uint64_t __71__CNUICoreContactAggregateValueFilter_filterPropertyValuesFromContact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 filterPropertyValuesFromContact:*(void *)(a1 + 32)];
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUICoreContactAggregateValueFilter *)self valueFilters];
  id v5 = (id)[v3 appendName:@"valueFilters" object:v4];

  id v6 = [v3 build];

  return (NSString *)v6;
}

- (NSArray)valueFilters
{
  return self->_valueFilters;
}

- (void).cxx_destruct
{
}

- (void)initWithValueFilters:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘valueFilters’ must be nonnull", v1, 2u);
}

- (void)contactByFilteringOutPropertyValueOfContact:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘contact’ must be nonnull", v1, 2u);
}

@end