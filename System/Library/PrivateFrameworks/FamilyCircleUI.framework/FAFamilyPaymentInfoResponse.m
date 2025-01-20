@interface FAFamilyPaymentInfoResponse
- (FAFamilyCreditCard)creditCard;
- (FAFamilyPaymentInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (void)setCreditCard:(id)a3;
@end

@implementation FAFamilyPaymentInfoResponse

- (FAFamilyPaymentInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)FAFamilyPaymentInfoResponse;
  v4 = [(AAResponse *)&v24 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (int)*MEMORY[0x263F259F8];
    v7 = [*(id *)((char *)&v4->super.super.isa + v6) objectForKeyedSubscript:@"payment-type"];
    if ([v7 isEqualToString:@"credit-card"])
    {
      v8 = objc_alloc_init(FAFamilyCreditCard);
      creditCard = v5->_creditCard;
      v5->_creditCard = v8;

      v10 = v5->_creditCard;
      v11 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKeyedSubscript:@"card-details"];
      [(FAFamilyCreditCard *)v10 setDetails:v11];

      v12 = v5->_creditCard;
      v13 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKeyedSubscript:@"card-footer"];
      [(FAFamilyCreditCard *)v12 setFooter:v13];

      v14 = v5->_creditCard;
      v15 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKeyedSubscript:@"payment-sub-label"];
      [(FAFamilyCreditCard *)v14 setProviderDescription:v15];

      v16 = v5->_creditCard;
      v17 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKeyedSubscript:@"credit-card-type"];
      [(FAFamilyCreditCard *)v16 setType:v17];

      v18 = v5->_creditCard;
      v19 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKeyedSubscript:@"payment-description"];
      [(FAFamilyCreditCard *)v18 setUsageNotice:v19];

      v20 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKeyedSubscript:@"credit-card-image-url"];
      if (v20)
      {
        v21 = v5->_creditCard;
        v22 = [NSURL URLWithString:v20];
        [(FAFamilyCreditCard *)v21 setImageURL:v22];
      }
    }
  }
  return v5;
}

- (FAFamilyCreditCard)creditCard
{
  return self->_creditCard;
}

- (void)setCreditCard:(id)a3
{
}

- (void).cxx_destruct
{
}

@end