@interface HFServiceStateDescriptionFormatter
- (id)stringForObjectValue:(id)a3;
- (unint64_t)descriptionContext;
- (void)setDescriptionContext:(unint64_t)a3;
@end

@implementation HFServiceStateDescriptionFormatter

- (id)stringForObjectValue:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [(id)objc_opt_class() stateClassIdentifier];
  v7 = [v5 stateTypeIdentifier];

  v8 = [v4 stringWithFormat:@"HFServiceDescription.%@, State:%@", v6, v7];

  unint64_t v9 = [(HFServiceStateDescriptionFormatter *)self descriptionContext];
  if (v9 == 1) {
    v10 = @"Control";
  }
  else {
    v10 = 0;
  }
  v11 = v10;
  if (v9 != 1
    || ([v8 stringByAppendingFormat:@", Context:%@", @"Control"],
        v12 = objc_claimAutoreleasedReturnValue(),
        _HFLocalizedStringWithDefaultValue(v12, 0, 0),
        v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v13))
  {
    v13 = _HFLocalizedStringWithDefaultValue(v8, v8, 1);
  }

  return v13;
}

- (unint64_t)descriptionContext
{
  return self->_descriptionContext;
}

- (void)setDescriptionContext:(unint64_t)a3
{
  self->_descriptionContext = a3;
}

__CFString *__59__HFServiceStateDescriptionFormatter_stringForObjectValue___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) descriptionContext] == 1) {
    return @"Control";
  }
  else {
    return 0;
  }
}

@end