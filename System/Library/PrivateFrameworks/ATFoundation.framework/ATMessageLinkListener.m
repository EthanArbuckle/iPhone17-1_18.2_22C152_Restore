@interface ATMessageLinkListener
- (ATMessageLinkListenerDelegate)delegate;
- (BOOL)start;
- (void)setDelegate:(id)a3;
- (void)stop;
@end

@implementation ATMessageLinkListener

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (ATMessageLinkListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATMessageLinkListenerDelegate *)WeakRetained;
}

- (void)stop
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"ATMessageLinkListener.m", 21, @"Subclass %@ must implement -%@ defined in %@.", v6, v7, @"[ATMessageLinkListener class]" object file lineNumber description];
  }
}

- (BOOL)start
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"ATMessageLinkListener.m", 16, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[ATMessageLinkListener class]" object file lineNumber description];
  }
  return 0;
}

@end