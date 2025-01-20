@interface _GEOConfigChangedDelegateListener
- (NSString)description;
- (void)callListener;
@end

@implementation _GEOConfigChangedDelegateListener

- (void)callListener
{
  if (self)
  {
    WeakRetained = (char *)objc_loadWeakRetained((id *)&self->keyHelper);
    if (WeakRetained) {
      long long v4 = *(_OWORD *)(WeakRetained + 40);
    }
    else {
      long long v4 = 0uLL;
    }
    long long v8 = v4;

    id v5 = objc_loadWeakRetained((id *)&self->delegate);
    if (v5)
    {
      queue = self->queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49___GEOConfigChangedDelegateListener_callListener__block_invoke;
      block[3] = &unk_1E53D7FE8;
      id v10 = v5;
      long long v11 = v8;
      id v7 = v5;
      dispatch_async(queue, block);
    }
  }
}

- (NSString)description
{
  v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  queue = self->queue;
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  id v8 = objc_loadWeakRetained((id *)&self->keyHelper);
  v9 = [v3 stringWithFormat:@"<%@ %p: q: %@ d: %@ k: %@>", v5, self, queue, WeakRetained, v8];

  return (NSString *)v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->queue, 0);

  objc_destroyWeak((id *)&self->keyHelper);
}

@end