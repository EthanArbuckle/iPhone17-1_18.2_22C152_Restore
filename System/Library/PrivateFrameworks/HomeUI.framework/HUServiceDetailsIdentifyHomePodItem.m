@interface HUServiceDetailsIdentifyHomePodItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsIdentifyHomePodItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  uint64_t v5 = *MEMORY[0x1E4F68B10];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  objc_opt_class();
  v6 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [v8 mediaProfileContainer];
    if ((([MEMORY[0x1E4F692A8] isHomePod:v9] & 1) != 0
       || [MEMORY[0x1E4F692A8] isHomePodMediaSystem:v9])
      && objc_msgSend(v9, "hf_isReachable")
      && [v9 hasValidSettings])
    {
      v10 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsIdentifyHomePodButton", @"HUServiceDetailsIdentifyHomePodButton", 1);
      v11 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsIdentifyHomePodFooter", @"HUServiceDetailsIdentifyHomePodFooter", 1);
      [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      [v4 setObject:v11 forKeyedSubscript:@"HUServiceDetailsIdentifyHomePodFooterResultKey"];
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v5];
    }
  }
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  v13 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v14 = [v12 futureWithResult:v13];

  return v14;
}

@end