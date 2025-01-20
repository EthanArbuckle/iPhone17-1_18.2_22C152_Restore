@interface HUServiceDetailsAssociatedServiceTypeItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsAssociatedServiceTypeItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v3 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v4 = [v3 homeKitObject];

  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "na_setWithSafeObject:", v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v7 = v4;
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;

    v10 = (void *)MEMORY[0x1E4F2EA88];
    v11 = objc_msgSend(v9, "hf_effectiveServiceType");
    v12 = objc_msgSend(v10, "hf_userFriendlyLocalizedCapitalizedDescription:", v11);
  }
  else
  {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    v12 = 0;
  }
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  v13 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsTypeTitle", @"HUServiceDetailsTypeTitle", 1);
  [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  v14 = [NSString stringWithFormat:@"AccessoryDetails.DisplayAs"];
  [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  v15 = (void *)MEMORY[0x1E4F7A0D8];
  v16 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
  v17 = [v15 futureWithResult:v16];

  return v17;
}

@end