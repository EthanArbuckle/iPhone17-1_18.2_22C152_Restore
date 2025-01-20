@interface FKApplePayRowViewModelCollection
- (FKApplePayBarcodeRowViewModel)barcodeRowViewModel;
- (FKApplePayOrderRowViewModel)orderRowViewModel;
- (FKApplePayReceiptRowViewModel)receiptRowViewModel;
- (FKApplePayRowViewModelCollection)initWithOrderRowViewModel:(id)a3 barcodeRowViewModel:(id)a4 receiptRowViewModel:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation FKApplePayRowViewModelCollection

- (FKApplePayRowViewModelCollection)initWithOrderRowViewModel:(id)a3 barcodeRowViewModel:(id)a4 receiptRowViewModel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FKApplePayRowViewModelCollection;
  v11 = [(FKApplePayRowViewModelCollection *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    orderRowViewModel = v11->_orderRowViewModel;
    v11->_orderRowViewModel = (FKApplePayOrderRowViewModel *)v12;

    uint64_t v14 = [v9 copy];
    barcodeRowViewModel = v11->_barcodeRowViewModel;
    v11->_barcodeRowViewModel = (FKApplePayBarcodeRowViewModel *)v14;

    uint64_t v16 = [v10 copy];
    receiptRowViewModel = v11->_receiptRowViewModel;
    v11->_receiptRowViewModel = (FKApplePayReceiptRowViewModel *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(FKApplePayOrderRowViewModel *)self->_orderRowViewModel copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(FKApplePayBarcodeRowViewModel *)self->_barcodeRowViewModel copy];
  id v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(FKApplePayReceiptRowViewModel *)self->_receiptRowViewModel copy];
  id v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

- (FKApplePayOrderRowViewModel)orderRowViewModel
{
  return self->_orderRowViewModel;
}

- (FKApplePayBarcodeRowViewModel)barcodeRowViewModel
{
  return self->_barcodeRowViewModel;
}

- (FKApplePayReceiptRowViewModel)receiptRowViewModel
{
  return self->_receiptRowViewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiptRowViewModel, 0);
  objc_storeStrong((id *)&self->_barcodeRowViewModel, 0);

  objc_storeStrong((id *)&self->_orderRowViewModel, 0);
}

@end