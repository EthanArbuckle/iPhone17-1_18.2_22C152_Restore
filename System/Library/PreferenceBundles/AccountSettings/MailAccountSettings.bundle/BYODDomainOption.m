@interface BYODDomainOption
- (BYODDomainOption)initWithDictionary:(id)a3;
- (NSString)name;
- (NSString)price;
- (void)setName:(id)a3;
- (void)setPrice:(id)a3;
@end

@implementation BYODDomainOption

- (BYODDomainOption)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYODDomainOption;
  v5 = [(BYODDomainOption *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"price"];
    price = v5->_price;
    v5->_price = (NSString *)v8;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_price, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end