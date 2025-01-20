@interface HFPresenceConditionNaturalLanguageOptions
- (HFPresenceConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4;
- (HFPresenceConditionNaturalLanguageOptions)initWithHome:(id)a3 formattingContext:(int64_t)a4 formattingStyle:(int64_t)a5;
- (HMHome)home;
- (void)setHome:(id)a3;
@end

@implementation HFPresenceConditionNaturalLanguageOptions

- (HFPresenceConditionNaturalLanguageOptions)initWithHome:(id)a3 formattingContext:(int64_t)a4 formattingStyle:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFPresenceConditionNaturalLanguageOptions;
  v10 = [(HFSubstringNaturalLanguageOptions *)&v13 initWithFormattingContext:a4 formattingStyle:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_home, a3);
  }

  return v11;
}

- (HFPresenceConditionNaturalLanguageOptions)initWithFormattingContext:(int64_t)a3 formattingStyle:(int64_t)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_formattingContext_formattingStyle_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPresenceCondition+NaturalLanguage.m", 109, @"%s is unavailable; use %@ instead",
    "-[HFPresenceConditionNaturalLanguageOptions initWithFormattingContext:formattingStyle:]",
    v7);

  return 0;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
}

@end