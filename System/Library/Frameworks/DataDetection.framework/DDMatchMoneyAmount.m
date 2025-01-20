@interface DDMatchMoneyAmount
- (DDMatchMoneyAmount)initWithDDScannerResult:(id)a3;
- (NSString)currency;
- (double)amount;
@end

@implementation DDMatchMoneyAmount

- (DDMatchMoneyAmount)initWithDDScannerResult:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DDMatchMoneyAmount;
  v5 = [(DDMatch *)&v12 initWithDDScannerResult:v4];
  if (v5)
  {
    id v10 = 0;
    double v11 = 0.0;
    int v6 = [v4 getMoneyAmount:&v11 currency:&v10];
    id v7 = v10;
    id v8 = v10;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_currency, v7);
      v5->_amount = v11;
    }
  }
  return v5;
}

- (NSString)currency
{
  return self->_currency;
}

- (double)amount
{
  return self->_amount;
}

- (void).cxx_destruct
{
}

@end