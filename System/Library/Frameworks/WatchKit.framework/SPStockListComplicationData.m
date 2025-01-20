@interface SPStockListComplicationData
+ (BOOL)supportsSecureCoding;
- (NSArray)stockList;
- (SPStockListComplicationData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setStockList:(id)a3;
@end

@implementation SPStockListComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPStockListComplicationData;
  id v4 = a3;
  [(SPComplicationData *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stockList, @"_StockListKey", v5.receiver, v5.super_class);
}

- (SPStockListComplicationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SPStockListComplicationData;
  objc_super v5 = [(SPComplicationData *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_StockListKey"];
    stockList = v5->_stockList;
    v5->_stockList = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)stockList
{
  return self->_stockList;
}

- (void)setStockList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end