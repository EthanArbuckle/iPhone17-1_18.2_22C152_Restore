@interface _MKLocalSearchMerchantParameters
- (CLLocation)transactionLocation;
- (NSDate)transactionDate;
- (NSNumber)industryCode;
- (NSString)industryCategory;
- (NSString)merchantCode;
- (NSString)paymentNetwork;
- (NSString)rawMerchantCode;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(id)a3;
- (void)setMerchantCode:(id)a3;
- (void)setPaymentNetwork:(id)a3;
- (void)setRawMerchantCode:(id)a3;
- (void)setTransactionDate:(id)a3;
- (void)setTransactionLocation:(id)a3;
@end

@implementation _MKLocalSearchMerchantParameters

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_merchantCode copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_rawMerchantCode copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_paymentNetwork copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSString *)self->_industryCategory copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSNumber *)self->_industryCode copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSDate *)self->_transactionDate copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(CLLocation *)self->_transactionLocation copy];
  v18 = (void *)v4[7];
  v4[7] = v17;

  return v4;
}

- (NSString)merchantCode
{
  return self->_merchantCode;
}

- (void)setMerchantCode:(id)a3
{
}

- (NSString)rawMerchantCode
{
  return self->_rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (CLLocation)transactionLocation
{
  return self->_transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);

  objc_storeStrong((id *)&self->_merchantCode, 0);
}

@end