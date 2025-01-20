@interface GEOPriceDescription
- (BOOL)hasPriceDescription;
- (GEOPDPriceDescription)geoPriceDescription;
- (GEOPriceDescription)initWithGEOPDPriceDescription:(id)a3;
- (NSString)priceDescription;
- (void)setGeoPriceDescription:(id)a3;
@end

@implementation GEOPriceDescription

- (GEOPriceDescription)initWithGEOPDPriceDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPriceDescription;
  v6 = [(GEOPriceDescription *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_geoPriceDescription, a3);
  }

  return v7;
}

- (BOOL)hasPriceDescription
{
  v2 = [(GEOPriceDescription *)self geoPriceDescription];
  if (v2) {
    BOOL v3 = v2[2] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSString)priceDescription
{
  v2 = [(GEOPriceDescription *)self geoPriceDescription];
  BOOL v3 = -[GEOPDPriceDescription priceDescription](v2);

  return (NSString *)v3;
}

- (GEOPDPriceDescription)geoPriceDescription
{
  return self->_geoPriceDescription;
}

- (void)setGeoPriceDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end