@interface _GEOConfigChangedBlockListener
- (NSString)description;
- (void)callListener;
@end

@implementation _GEOConfigChangedBlockListener

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

    id v5 = self->block;
    if (v5)
    {
      queue = self->queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46___GEOConfigChangedBlockListener_callListener__block_invoke;
      block[3] = &unk_1E53E8450;
      id v10 = v5;
      long long v11 = v8;
      id v7 = v5;
      dispatch_async(queue, block);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->block, 0);
  objc_storeStrong((id *)&self->queue, 0);

  objc_destroyWeak((id *)&self->keyHelper);
}

- (NSString)description
{
  v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  queue = self->queue;
  id v7 = (void *)MEMORY[0x18C120660](self->block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->keyHelper);
  v9 = [v3 stringWithFormat:@"<%@ %p: q: %@ b: %@ k: %@>", v5, self, queue, v7, WeakRetained];

  return (NSString *)v9;
}

@end