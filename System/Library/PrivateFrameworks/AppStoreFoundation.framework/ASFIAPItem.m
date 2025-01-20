@interface ASFIAPItem
- (NSDate)originalPurchaseDate;
- (NSDate)purchaseDate;
- (NSNumber)quantity;
- (NSString)originalTransactionID;
- (NSString)productID;
- (NSString)transactionID;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation ASFIAPItem

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(ASFIAPItem);
  uint64_t v6 = [(NSDate *)self->_originalPurchaseDate copyWithZone:a3];
  originalPurchaseDate = v5->_originalPurchaseDate;
  v5->_originalPurchaseDate = (NSDate *)v6;

  uint64_t v8 = [(NSString *)self->_originalTransactionID copyWithZone:a3];
  originalTransactionID = v5->_originalTransactionID;
  v5->_originalTransactionID = (NSString *)v8;

  uint64_t v10 = [(NSDate *)self->_purchaseDate copyWithZone:a3];
  purchaseDate = v5->_purchaseDate;
  v5->_purchaseDate = (NSDate *)v10;

  uint64_t v12 = [(NSString *)self->_productID copyWithZone:a3];
  productID = v5->_productID;
  v5->_productID = (NSString *)v12;

  uint64_t v14 = [(NSNumber *)self->_quantity copyWithZone:a3];
  quantity = v5->_quantity;
  v5->_quantity = (NSNumber *)v14;

  uint64_t v16 = [(NSString *)self->_transactionID copyWithZone:a3];
  transactionID = v5->_transactionID;
  v5->_transactionID = (NSString *)v16;

  return v5;
}

- (NSDate)originalPurchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)originalTransactionID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)productID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)quantity
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)transactionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_originalTransactionID, 0);
  objc_storeStrong((id *)&self->_originalPurchaseDate, 0);
}

@end