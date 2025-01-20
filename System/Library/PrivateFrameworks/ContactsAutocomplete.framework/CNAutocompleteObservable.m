@interface CNAutocompleteObservable
- (CNAutocompleteObservable)initWithBlock:(id)a3;
- (CNObservable)observable;
- (NSString)debugDescription;
- (id)subscribe:(id)a3;
- (void)setDebugDescription:(id)a3;
- (void)setObservable:(id)a3;
@end

@implementation CNAutocompleteObservable

- (CNAutocompleteObservable)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNAutocompleteObservable;
  v5 = [(CNAutocompleteObservable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F5A480] observableWithBlock:v4];
    observable = v5->_observable;
    v5->_observable = (CNObservable *)v6;
  }
  return v5;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [(CNAutocompleteObservable *)self observable];
  uint64_t v6 = [v5 subscribe:v4];

  return v6;
}

- (NSString)debugDescription
{
  return self->_debugDescription;
}

- (void)setDebugDescription:(id)a3
{
}

- (CNObservable)observable
{
  return self->_observable;
}

- (void)setObservable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
}

@end