@interface FKApplePayReceiptRowViewModel
- (FKApplePayReceiptRowViewModel)initWithReceiptName:(id)a3 cellConfigurationHandler:(id)a4 cellSelectionHandler:(id)a5;
- (NSString)receiptName;
- (id)cellConfigurationHandler;
- (id)cellSelectionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (void)configureCell:(id)a3;
- (void)didSelectCell;
@end

@implementation FKApplePayReceiptRowViewModel

- (FKApplePayReceiptRowViewModel)initWithReceiptName:(id)a3 cellConfigurationHandler:(id)a4 cellSelectionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FKApplePayReceiptRowViewModel;
  v11 = [(FKApplePayReceiptRowViewModel *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    receiptName = v11->_receiptName;
    v11->_receiptName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    id cellConfigurationHandler = v11->_cellConfigurationHandler;
    v11->_id cellConfigurationHandler = (id)v14;

    uint64_t v16 = [v10 copy];
    id cellSelectionHandler = v11->_cellSelectionHandler;
    v11->_id cellSelectionHandler = (id)v16;
  }
  return v11;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v5 = [(FKApplePayReceiptRowViewModel *)self cellConfigurationHandler];
  v5[2](v5, v4);
}

- (void)didSelectCell
{
  v2 = [(FKApplePayReceiptRowViewModel *)self cellSelectionHandler];
  v2[2]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(NSString *)self->_receiptName copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [self->_cellConfigurationHandler copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [self->_cellSelectionHandler copy];
  id v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (NSString)receiptName
{
  return self->_receiptName;
}

- (id)cellConfigurationHandler
{
  return self->_cellConfigurationHandler;
}

- (id)cellSelectionHandler
{
  return self->_cellSelectionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellSelectionHandler, 0);
  objc_storeStrong(&self->_cellConfigurationHandler, 0);

  objc_storeStrong((id *)&self->_receiptName, 0);
}

@end