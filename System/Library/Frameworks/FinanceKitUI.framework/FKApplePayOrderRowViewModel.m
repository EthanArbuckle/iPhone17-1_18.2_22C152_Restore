@interface FKApplePayOrderRowViewModel
- (FKApplePayOrderRowViewModel)initWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5 cellConfigurationHandler:(id)a6;
- (NSString)fulfillmentIdentifier;
- (NSString)orderIdentifier;
- (NSString)orderTypeIdentifier;
- (id)cellConfigurationHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (void)configureCell:(id)a3;
@end

@implementation FKApplePayOrderRowViewModel

- (FKApplePayOrderRowViewModel)initWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5 cellConfigurationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKApplePayOrderRowViewModel;
  v14 = [(FKApplePayOrderRowViewModel *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    orderTypeIdentifier = v14->_orderTypeIdentifier;
    v14->_orderTypeIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    orderIdentifier = v14->_orderIdentifier;
    v14->_orderIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    fulfillmentIdentifier = v14->_fulfillmentIdentifier;
    v14->_fulfillmentIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    id cellConfigurationHandler = v14->_cellConfigurationHandler;
    v14->_id cellConfigurationHandler = (id)v21;
  }
  return v14;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v5 = [(FKApplePayOrderRowViewModel *)self cellConfigurationHandler];
  v5[2](v5, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NSString *)self->_orderTypeIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_orderIdentifier copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_fulfillmentIdentifier copy];
  id v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [self->_cellConfigurationHandler copy];
  id v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (NSString)orderTypeIdentifier
{
  return self->_orderTypeIdentifier;
}

- (NSString)orderIdentifier
{
  return self->_orderIdentifier;
}

- (NSString)fulfillmentIdentifier
{
  return self->_fulfillmentIdentifier;
}

- (id)cellConfigurationHandler
{
  return self->_cellConfigurationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_fulfillmentIdentifier, 0);
  objc_storeStrong((id *)&self->_orderIdentifier, 0);

  objc_storeStrong((id *)&self->_orderTypeIdentifier, 0);
}

@end