@interface AMSMarketingItemAction
- (AMSBuyParams)buyParams;
- (AMSMarketingItemAction)initWithDictionary:(id)a3;
- (BOOL)isDefault;
- (BOOL)isFamily;
- (BOOL)isRecommended;
- (BOOL)isYearly;
- (NSArray)serviceComponents;
- (NSDictionary)rawValues;
- (NSNumber)price;
- (NSNumber)priceDiff;
- (NSString)callToActionLabel;
- (NSString)disclaimerText;
- (NSString)offerID;
- (NSString)priceDiffForDisplay;
- (NSString)priceForDisplay;
- (NSString)type;
- (NSString)valuePropDetail;
- (NSString)valuePropInfo;
- (NSURL)url;
- (id)_serviceComponentsFromMap:(id)a3 withNames:(id)a4;
- (id)_serviceNames;
- (id)_servicesData;
- (id)description;
- (id)dismissLabel;
- (id)freeTrialPeriod;
- (id)inAppID;
- (id)introOfferPeriod;
- (id)introOfferPrice;
- (id)introOfferPriceForDisplay;
- (id)name;
- (id)priceFormatted;
- (id)priceString;
- (id)recurringSubscriptionPeriod;
- (void)setRawValues:(id)a3;
@end

@implementation AMSMarketingItemAction

- (AMSMarketingItemAction)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMarketingItemAction;
  v6 = [(AMSMarketingItemAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawValues, a3);
  }

  return v7;
}

- (AMSBuyParams)buyParams
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA58];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [[AMSBuyParams alloc] initWithString:v4];
  return v5;
}

- (NSString)callToActionLabel
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA60];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)disclaimerText
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA68];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isDefault
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA70];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (BOOL)isFamily
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA78];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (BOOL)isRecommended
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA80];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (NSString)offerID
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA90];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSNumber)price
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 valueForKeyPath:qword_1EDC7FA98];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSNumber)priceDiff
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 valueForKeyPath:qword_1EDC7FAA0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (NSString)priceDiffForDisplay
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 valueForKeyPath:qword_1EDC7FAA8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)priceForDisplay
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 valueForKeyPath:qword_1EDC7FAB0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSArray)serviceComponents
{
  v3 = [(AMSMarketingItemAction *)self _serviceNames];
  uint64_t v4 = [(AMSMarketingItemAction *)self _servicesData];
  char v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v6 = [(AMSMarketingItemAction *)self _serviceComponentsFromMap:v4 withNames:v3];
  }

  return (NSArray *)v6;
}

- (NSString)type
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA88];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSURL)url
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FAC0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      char v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      goto LABEL_6;
    }
  }
  else
  {

    id v4 = 0;
  }
  char v5 = 0;
LABEL_6:

  return (NSURL *)v5;
}

- (NSString)valuePropDetail
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 valueForKeyPath:qword_1EDC7FAC8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)valuePropInfo
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 valueForKeyPath:qword_1EDC7FAD0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)_servicesData
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FA00];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_serviceNames
{
  v2 = [(AMSMarketingItemAction *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FAB8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_serviceComponentsFromMap:(id)a3 withNames:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__AMSMarketingItemAction__serviceComponentsFromMap_withNames___block_invoke;
  v9[3] = &unk_1E55A3968;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a4, "ams_mapWithTransformIgnoresNil:", v9);

  return v7;
}

AMSMarketingItemActionComponent *__62__AMSMarketingItemAction__serviceComponentsFromMap_withNames___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v2) {
    v3 = [[AMSMarketingItemActionComponent alloc] initWithDictionary:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)description
{
  return 0;
}

- (id)dismissLabel
{
  return 0;
}

- (id)freeTrialPeriod
{
  return 0;
}

- (id)inAppID
{
  return 0;
}

- (id)introOfferPeriod
{
  return 0;
}

- (id)introOfferPrice
{
  return 0;
}

- (id)introOfferPriceForDisplay
{
  return 0;
}

- (id)name
{
  return 0;
}

- (BOOL)isYearly
{
  return 0;
}

- (id)priceFormatted
{
  return 0;
}

- (id)priceString
{
  return 0;
}

- (id)recurringSubscriptionPeriod
{
  return 0;
}

- (NSDictionary)rawValues
{
  return self->_rawValues;
}

- (void)setRawValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end