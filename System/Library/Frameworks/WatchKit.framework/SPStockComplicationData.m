@interface SPStockComplicationData
+ (BOOL)supportsSecureCoding;
- (NSString)changeInPercentText;
- (NSString)changeInPointsText;
- (NSString)changeText;
- (NSString)marketCapText;
- (NSString)priceText;
- (NSString)tickerSymbolText;
- (SPStockComplicationData)initWithCoder:(id)a3;
- (unint64_t)changeDirection;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeDirection:(unint64_t)a3;
- (void)setChangeInPercentText:(id)a3;
- (void)setChangeInPointsText:(id)a3;
- (void)setChangeText:(id)a3;
- (void)setMarketCapText:(id)a3;
- (void)setPriceText:(id)a3;
- (void)setTickerSymbolText:(id)a3;
@end

@implementation SPStockComplicationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SPStockComplicationData;
  id v4 = a3;
  [(SPComplicationData *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tickerSymbolText, @"_TickerSymbolTextKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_priceText forKey:@"_PriceTextKey"];
  [v4 encodeObject:self->_marketCapText forKey:@"_MarketCapTextKey"];
  [v4 encodeObject:self->_changeInPercentText forKey:@"_ChangeInPercentTextKey"];
  [v4 encodeObject:self->_changeInPointsText forKey:@"_ChangeInPointsTextKey"];
  [v4 encodeObject:self->_changeText forKey:@"_ChangeTextKey"];
  [v4 encodeInteger:self->_changeDirection forKey:@"_ChangeDirectionKey"];
}

- (SPStockComplicationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPStockComplicationData;
  objc_super v5 = [(SPComplicationData *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_TickerSymbolTextKey"];
    tickerSymbolText = v5->_tickerSymbolText;
    v5->_tickerSymbolText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_PriceTextKey"];
    priceText = v5->_priceText;
    v5->_priceText = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_MarketCapTextKey"];
    marketCapText = v5->_marketCapText;
    v5->_marketCapText = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ChangeInPercentTextKey"];
    changeInPercentText = v5->_changeInPercentText;
    v5->_changeInPercentText = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ChangeInPointsTextKey"];
    changeInPointsText = v5->_changeInPointsText;
    v5->_changeInPointsText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_ChangeTextKey"];
    changeText = v5->_changeText;
    v5->_changeText = (NSString *)v16;

    v5->_changeDirection = [v4 decodeIntegerForKey:@"_ChangeDirectionKey"];
  }

  return v5;
}

- (NSString)tickerSymbolText
{
  return self->_tickerSymbolText;
}

- (void)setTickerSymbolText:(id)a3
{
}

- (NSString)priceText
{
  return self->_priceText;
}

- (void)setPriceText:(id)a3
{
}

- (NSString)marketCapText
{
  return self->_marketCapText;
}

- (void)setMarketCapText:(id)a3
{
}

- (NSString)changeInPercentText
{
  return self->_changeInPercentText;
}

- (void)setChangeInPercentText:(id)a3
{
}

- (NSString)changeInPointsText
{
  return self->_changeInPointsText;
}

- (void)setChangeInPointsText:(id)a3
{
}

- (NSString)changeText
{
  return self->_changeText;
}

- (void)setChangeText:(id)a3
{
}

- (unint64_t)changeDirection
{
  return self->_changeDirection;
}

- (void)setChangeDirection:(unint64_t)a3
{
  self->_changeDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeText, 0);
  objc_storeStrong((id *)&self->_changeInPointsText, 0);
  objc_storeStrong((id *)&self->_changeInPercentText, 0);
  objc_storeStrong((id *)&self->_marketCapText, 0);
  objc_storeStrong((id *)&self->_priceText, 0);

  objc_storeStrong((id *)&self->_tickerSymbolText, 0);
}

@end