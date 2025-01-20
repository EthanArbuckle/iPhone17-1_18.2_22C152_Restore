@interface _HFItemUpdateFutureWrapper
+ (id)futuresFromWrappers:(id)a3;
+ (id)wrapperWithFuture:(id)a3 item:(id)a4 isInternal:(BOOL)a5;
- (BOOL)isInternal;
- (HFItem)item;
- (HFItemUpdateOutcome)outcome;
- (NAFuture)future;
- (void)setFuture:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setOutcome:(id)a3;
@end

@implementation _HFItemUpdateFutureWrapper

- (void)setOutcome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_future, 0);
}

+ (id)wrapperWithFuture:(id)a3 item:(id)a4 isInternal:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)objc_opt_class());
  [v9 setFuture:v7];
  [v9 setItem:v8];
  [v9 setIsInternal:v5];
  objc_initWeak(&location, v9);
  v10 = [v9 future];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64___HFItemUpdateFutureWrapper_wrapperWithFuture_item_isInternal___block_invoke;
  v13[3] = &unk_2640956D8;
  objc_copyWeak(&v14, &location);
  id v11 = (id)[v10 addSuccessBlock:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setItem:(id)a3
{
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void)setFuture:(id)a3
{
}

+ (id)futuresFromWrappers:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_110);
}

- (NAFuture)future
{
  return self->_future;
}

- (HFItem)item
{
  return self->_item;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (HFItemUpdateOutcome)outcome
{
  return self->_outcome;
}

@end