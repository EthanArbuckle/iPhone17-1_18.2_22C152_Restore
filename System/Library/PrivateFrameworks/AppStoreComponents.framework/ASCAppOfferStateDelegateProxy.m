@interface ASCAppOfferStateDelegateProxy
- (ASCAppOfferStateDelegate)target;
- (ASCAppOfferStateDelegateProxy)initWithTarget:(id)a3;
- (void)offer:(id)a3 didChangeState:(id)a4 withMetadata:(id)a5 flags:(int64_t)a6;
- (void)offer:(id)a3 didChangeStatusText:(id)a4;
@end

@implementation ASCAppOfferStateDelegateProxy

- (ASCAppOfferStateDelegateProxy)initWithTarget:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCAppOfferStateDelegateProxy;
  v5 = [(ASCAppOfferStateDelegateProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_target, v4);
  }

  return v6;
}

- (void)offer:(id)a3 didChangeState:(id)a4 withMetadata:(id)a5 flags:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(ASCAppOfferStateDelegateProxy *)self target];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ASCAppOfferStateDelegateProxy_offer_didChangeState_withMetadata_flags___block_invoke;
  block[3] = &unk_1E645D8D0;
  id v19 = v13;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  int64_t v23 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__ASCAppOfferStateDelegateProxy_offer_didChangeState_withMetadata_flags___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) offer:*(void *)(a1 + 40) didChangeState:*(void *)(a1 + 48) withMetadata:*(void *)(a1 + 56) flags:*(void *)(a1 + 64)];
}

- (void)offer:(id)a3 didChangeStatusText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(ASCAppOfferStateDelegateProxy *)self target];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ASCAppOfferStateDelegateProxy_offer_didChangeStatusText___block_invoke;
  block[3] = &unk_1E645D8F8;
  id v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__ASCAppOfferStateDelegateProxy_offer_didChangeStatusText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) offer:*(void *)(a1 + 40) didChangeStatusText:*(void *)(a1 + 48)];
}

- (ASCAppOfferStateDelegate)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (ASCAppOfferStateDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end