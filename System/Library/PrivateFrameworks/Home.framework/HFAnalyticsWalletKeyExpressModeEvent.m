@interface HFAnalyticsWalletKeyExpressModeEvent
- (HFAnalyticsWalletKeyExpressModeEvent)initWithData:(id)a3;
- (NSNumber)expressModeLocationNumber;
- (NSNumber)expressModeSelectionNumber;
- (id)payload;
- (void)setExpressModeLocationNumber:(id)a3;
- (void)setExpressModeSelectionNumber:(id)a3;
@end

@implementation HFAnalyticsWalletKeyExpressModeEvent

- (HFAnalyticsWalletKeyExpressModeEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"walletKeyExpressModeSelection"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ErrorHfanalyti_10.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"walletKeyExpressModeLocation"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    NSLog(&cfstr_ErrorHfanalyti_11.isa);
  }
  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsWalletKeyExpressModeEvent;
  v11 = [(HFAnalyticsEvent *)&v14 initWithEventType:27];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_expressModeSelectionNumber, v6);
    objc_storeStrong((id *)&v12->_expressModeLocationNumber, v9);
  }

  return v12;
}

- (id)payload
{
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsWalletKeyExpressModeEvent;
  v3 = [(HFAnalyticsEvent *)&v8 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsWalletKeyExpressModeEvent *)self expressModeSelectionNumber];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"expressModeSelection");

  v6 = [(HFAnalyticsWalletKeyExpressModeEvent *)self expressModeLocationNumber];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"expressModeLocation");

  return v4;
}

- (NSNumber)expressModeSelectionNumber
{
  return self->_expressModeSelectionNumber;
}

- (void)setExpressModeSelectionNumber:(id)a3
{
}

- (NSNumber)expressModeLocationNumber
{
  return self->_expressModeLocationNumber;
}

- (void)setExpressModeLocationNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressModeLocationNumber, 0);
  objc_storeStrong((id *)&self->_expressModeSelectionNumber, 0);
}

@end