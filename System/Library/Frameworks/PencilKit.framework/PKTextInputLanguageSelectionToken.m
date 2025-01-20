@interface PKTextInputLanguageSelectionToken
+ (id)tokenWithStore:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PKTextInputLanguageSelectionToken

+ (id)tokenWithStore:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeWeak(v5 + 1, v4);

  return v5;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  [WeakRetained removeObserver:self];
}

- (void)dealloc
{
  [(PKTextInputLanguageSelectionToken *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputLanguageSelectionToken;
  [(PKTextInputLanguageSelectionToken *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end