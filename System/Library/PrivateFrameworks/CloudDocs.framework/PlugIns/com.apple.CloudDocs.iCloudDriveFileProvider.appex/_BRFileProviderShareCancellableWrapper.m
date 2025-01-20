@interface _BRFileProviderShareCancellableWrapper
- (_BRFileProviderShareCancellableWrapper)initWithCancellable:(id)a3;
- (void)invalidate;
@end

@implementation _BRFileProviderShareCancellableWrapper

- (_BRFileProviderShareCancellableWrapper)initWithCancellable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BRFileProviderShareCancellableWrapper;
  v6 = [(_BRFileProviderShareCancellableWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cancellable, a3);
  }

  return v7;
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

@end