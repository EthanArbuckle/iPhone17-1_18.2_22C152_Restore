@interface CalCancellableSearch
- (CalCancellableSearch)initWithCancellationBlock:(id)a3;
- (id)cancellationBlock;
- (void)cancel;
- (void)setCancellationBlock:(id)a3;
@end

@implementation CalCancellableSearch

- (CalCancellableSearch)initWithCancellationBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CalCancellableSearch;
  v5 = [(CalCancellableSearch *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CalCancellableSearch *)v5 setCancellationBlock:v4];
  }

  return v6;
}

- (void)cancel
{
  v3 = [(CalCancellableSearch *)self cancellationBlock];

  if (v3)
  {
    id v4 = [(CalCancellableSearch *)self cancellationBlock];
    v4[2]();
  }
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end