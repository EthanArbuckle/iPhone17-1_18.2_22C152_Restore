@interface AMSPaymentRequest
+ (BOOL)supportsSecureCoding;
- (AMSPaymentContentItem)salableInfo;
- (AMSPaymentContentItem)secondarySalableInfo;
- (AMSPaymentRequest)init;
- (AMSPaymentRequest)initWithCoder:(id)a3;
- (BOOL)drawBackground;
- (BOOL)drawBottomDivider;
- (NSArray)paymentContentItems;
- (NSArray)secondaryContentItems;
- (NSString)dialogCancelButtonLabel;
- (NSString)dialogDefaultButtonLabel;
- (NSString)dialogOtherButtonLabel;
- (NSString)localizedNavigationTitle;
- (void)encodeWithCoder:(id)a3;
- (void)setDialogCancelButtonLabel:(id)a3;
- (void)setDialogDefaultButtonLabel:(id)a3;
- (void)setDialogOtherButtonLabel:(id)a3;
- (void)setDrawBackground:(BOOL)a3;
- (void)setDrawBottomDivider:(BOOL)a3;
- (void)setLocalizedNavigationTitle:(id)a3;
- (void)setPaymentContentItems:(id)a3;
- (void)setSalableInfo:(id)a3;
- (void)setSecondaryContentItems:(id)a3;
- (void)setSecondarySalableInfo:(id)a3;
@end

@implementation AMSPaymentRequest

- (AMSPaymentRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSPaymentRequest;
  result = [(AMSPaymentRequest *)&v3 init];
  if (result) {
    *(_WORD *)&result->_drawBackground = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(AMSPaymentRequest *)self paymentContentItems];
  [v9 encodeObject:v4 forKey:@"paymentContentItems"];

  v5 = [(AMSPaymentRequest *)self localizedNavigationTitle];
  [v9 encodeObject:v5 forKey:@"localizedNavigationTitle"];

  v6 = [(AMSPaymentRequest *)self salableInfo];
  [v9 encodeObject:v6 forKey:@"salableInfo"];

  v7 = [(AMSPaymentRequest *)self secondaryContentItems];
  [v9 encodeObject:v7 forKey:@"secondaryContentItems"];

  v8 = [(AMSPaymentRequest *)self secondarySalableInfo];
  [v9 encodeObject:v8 forKey:@"secondarySalableInfo"];

  objc_msgSend(v9, "encodeBool:forKey:", -[AMSPaymentRequest drawBackground](self, "drawBackground"), @"drawBackground");
  objc_msgSend(v9, "encodeBool:forKey:", -[AMSPaymentRequest drawBottomDivider](self, "drawBottomDivider"), @"drawBottomDivider");
}

- (AMSPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AMSPaymentRequest;
  v5 = [(AMSPaymentRequest *)&v23 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"paymentContentItems"];
    paymentContentItems = v5->_paymentContentItems;
    v5->_paymentContentItems = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedNavigationTitle"];
    localizedNavigationTitle = v5->_localizedNavigationTitle;
    v5->_localizedNavigationTitle = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salableInfo"];
    salableInfo = v5->_salableInfo;
    v5->_salableInfo = (AMSPaymentContentItem *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"secondaryContentItems"];
    secondaryContentItems = v5->_secondaryContentItems;
    v5->_secondaryContentItems = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondarySalableInfo"];
    secondarySalableInfo = v5->_secondarySalableInfo;
    v5->_secondarySalableInfo = (AMSPaymentContentItem *)v20;

    v5->_drawBackground = [v4 decodeBoolForKey:@"drawBackground"];
    v5->_drawBottomDivider = [v4 decodeBoolForKey:@"drawBottomDivider"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)dialogCancelButtonLabel
{
  return self->_dialogCancelButtonLabel;
}

- (void)setDialogCancelButtonLabel:(id)a3
{
}

- (NSString)dialogDefaultButtonLabel
{
  return self->_dialogDefaultButtonLabel;
}

- (void)setDialogDefaultButtonLabel:(id)a3
{
}

- (NSString)dialogOtherButtonLabel
{
  return self->_dialogOtherButtonLabel;
}

- (void)setDialogOtherButtonLabel:(id)a3
{
}

- (AMSPaymentContentItem)salableInfo
{
  return self->_salableInfo;
}

- (void)setSalableInfo:(id)a3
{
}

- (AMSPaymentContentItem)secondarySalableInfo
{
  return self->_secondarySalableInfo;
}

- (void)setSecondarySalableInfo:(id)a3
{
}

- (NSArray)paymentContentItems
{
  return self->_paymentContentItems;
}

- (void)setPaymentContentItems:(id)a3
{
}

- (NSArray)secondaryContentItems
{
  return self->_secondaryContentItems;
}

- (void)setSecondaryContentItems:(id)a3
{
}

- (NSString)localizedNavigationTitle
{
  return self->_localizedNavigationTitle;
}

- (void)setLocalizedNavigationTitle:(id)a3
{
}

- (BOOL)drawBackground
{
  return self->_drawBackground;
}

- (void)setDrawBackground:(BOOL)a3
{
  self->_drawBackground = a3;
}

- (BOOL)drawBottomDivider
{
  return self->_drawBottomDivider;
}

- (void)setDrawBottomDivider:(BOOL)a3
{
  self->_drawBottomDivider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNavigationTitle, 0);
  objc_storeStrong((id *)&self->_secondaryContentItems, 0);
  objc_storeStrong((id *)&self->_paymentContentItems, 0);
  objc_storeStrong((id *)&self->_secondarySalableInfo, 0);
  objc_storeStrong((id *)&self->_salableInfo, 0);
  objc_storeStrong((id *)&self->_dialogOtherButtonLabel, 0);
  objc_storeStrong((id *)&self->_dialogDefaultButtonLabel, 0);
  objc_storeStrong((id *)&self->_dialogCancelButtonLabel, 0);
}

@end