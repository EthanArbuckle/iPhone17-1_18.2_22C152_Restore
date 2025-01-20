@interface AMSUIDynamicImpressionItem
- (AMSUIDynamicImpressionItem)initWithFrame:(CGRect)a3 impressionMetrics:(id)a4;
- (AMSUIDynamicImpressionMetrics)impressionMetrics;
- (CGRect)frame;
- (void)setFrame:(CGRect)a3;
- (void)setImpressionMetrics:(id)a3;
@end

@implementation AMSUIDynamicImpressionItem

- (AMSUIDynamicImpressionItem)initWithFrame:(CGRect)a3 impressionMetrics:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v10 = (void *)getAMSUIDDynamicImpressionItemClass_softClass;
  uint64_t v18 = getAMSUIDDynamicImpressionItemClass_softClass;
  if (!getAMSUIDDynamicImpressionItemClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getAMSUIDDynamicImpressionItemClass_block_invoke;
    v14[3] = &unk_2643E33D8;
    v14[4] = &v15;
    __getAMSUIDDynamicImpressionItemClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);
  v12 = (AMSUIDynamicImpressionItem *)objc_msgSend([v11 alloc], "initWithFrame:impressionMetrics:", v9, x, y, width, height);

  return v12;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (AMSUIDynamicImpressionMetrics)impressionMetrics
{
  return self->_impressionMetrics;
}

- (void)setImpressionMetrics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end