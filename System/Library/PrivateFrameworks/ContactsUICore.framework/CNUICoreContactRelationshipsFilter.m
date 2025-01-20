@interface CNUICoreContactRelationshipsFilter
- (NSString)description;
- (id)contactByFilteringOutPropertyValueOfContact:(id)a3;
- (void)filterPropertyValuesFromContact:(id)a3;
@end

@implementation CNUICoreContactRelationshipsFilter

- (id)contactByFilteringOutPropertyValueOfContact:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_13 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_13, &__block_literal_global_42);
    }
    v5 = CNGuardOSLog_cn_once_object_0_13;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_13, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactAggregateValueFilter contactByFilteringOutPropertyValueOfContact:](v5);
    }
  }
  v6 = (void *)[v4 mutableCopy];
  [(CNUICoreContactRelationshipsFilter *)self filterPropertyValuesFromContact:v6];

  return v6;
}

- (void)filterPropertyValuesFromContact:(id)a3
{
}

- (NSString)description
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end