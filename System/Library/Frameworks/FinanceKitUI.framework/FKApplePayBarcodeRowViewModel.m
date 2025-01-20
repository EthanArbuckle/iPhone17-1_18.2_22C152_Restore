@interface FKApplePayBarcodeRowViewModel
- (FKApplePayBarcodeRowViewModel)initWithCellConfigurationHandler:(id)a3;
- (id)cellConfigurationHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (void)configureCell:(id)a3;
@end

@implementation FKApplePayBarcodeRowViewModel

- (FKApplePayBarcodeRowViewModel)initWithCellConfigurationHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKApplePayBarcodeRowViewModel;
  v5 = [(FKApplePayBarcodeRowViewModel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id cellConfigurationHandler = v5->_cellConfigurationHandler;
    v5->_id cellConfigurationHandler = (id)v6;
  }
  return v5;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v5 = [(FKApplePayBarcodeRowViewModel *)self cellConfigurationHandler];
  v5[2](v5, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [self->_cellConfigurationHandler copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)cellConfigurationHandler
{
  return self->_cellConfigurationHandler;
}

- (void).cxx_destruct
{
}

@end