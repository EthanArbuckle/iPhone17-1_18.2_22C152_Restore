@interface FHPeerPaymentForecastingSignalPersonWithAmount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHPeerPaymentForecastingSignalPersonWithAmount)init;
- (FHPeerPaymentForecastingSignalPersonWithAmount)initWithCoder:(id)a3;
- (NSDecimalNumber)amount;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
@end

@implementation FHPeerPaymentForecastingSignalPersonWithAmount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalPersonWithAmount;
  id v4 = a3;
  [(FHPeerPaymentForecastingSignalPerson *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_amount, @"amount", v5.receiver, v5.super_class);
}

- (FHPeerPaymentForecastingSignalPersonWithAmount)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHPeerPaymentForecastingSignalPersonWithAmount;
  objc_super v5 = [(FHPeerPaymentForecastingSignalPerson *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"amount"];
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v6;
  }
  return v5;
}

- (FHPeerPaymentForecastingSignalPersonWithAmount)init
{
  v5.receiver = self;
  v5.super_class = (Class)FHPeerPaymentForecastingSignalPersonWithAmount;
  v2 = [(FHPeerPaymentForecastingSignalPerson *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FHPeerPaymentForecastingSignal *)v2 setForecastingType:3];
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:&stru_27001CD40];
  v6.receiver = self;
  v6.super_class = (Class)FHPeerPaymentForecastingSignalPersonWithAmount;
  id v4 = [(FHPeerPaymentForecastingSignalPerson *)&v6 description];
  [v3 appendString:v4];

  [v3 appendFormat:@"%@: '%@'; ", @"amount", self->_amount];
  return v3;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)FHPeerPaymentForecastingSignalPersonWithAmount;
  unint64_t v3 = [(FHPeerPaymentForecastingSignalPerson *)&v7 hash];
  id v4 = [(FHPeerPaymentForecastingSignalPersonWithAmount *)self amount];
  unint64_t v5 = [v4 hash] + 43 * v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FHPeerPaymentForecastingSignalPersonWithAmount *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (unint64_t v6 = [(FHPeerPaymentForecastingSignal *)self forecastingType],
             v6 == [(FHPeerPaymentForecastingSignal *)v5 forecastingType]))
  {
    objc_super v7 = [(FHPeerPaymentForecastingSignalPersonWithAmount *)self amount];
    v8 = [(FHPeerPaymentForecastingSignalPersonWithAmount *)v5 amount];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end