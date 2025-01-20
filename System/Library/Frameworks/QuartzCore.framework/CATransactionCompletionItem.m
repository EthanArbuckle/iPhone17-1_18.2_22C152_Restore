@interface CATransactionCompletionItem
+ (id)completionItem;
- (CATransactionCompletionItem)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CATransactionCompletionItem

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(CATransactionCompletionItem *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CATransactionCompletionItem;
  [(CATransactionCompletionItem *)&v3 dealloc];
}

- (void)invalidate
{
  priv = (dispatch_block_t *)self->_priv;
  if (priv)
  {
    CA::Transaction::Continuation::unref(priv);
    self->_priv = 0;
  }
}

- (CATransactionCompletionItem)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CATransactionCompletionItem;
  result = [(CATransactionCompletionItem *)&v6 init];
  if (result)
  {
    uint64_t v3 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v3)
    {
      uint64_t v4 = (void *)(v3 + 88);
      while (1)
      {
        uint64_t v4 = (void *)*v4;
        if (!v4) {
          break;
        }
        v5 = (atomic_uint *)v4[1];
        if (v5)
        {
          atomic_fetch_add(v5, 1u);
          result->_priv = v5;
          break;
        }
      }
    }
    if (!result->_priv)
    {

      return 0;
    }
  }
  return result;
}

+ (id)completionItem
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

@end