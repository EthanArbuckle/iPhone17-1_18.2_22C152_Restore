@interface _EFCombineLatestObservable
- (NSArray)observables;
- (_EFCombineLatestObservable)initWithObservables:(id)a3;
- (id)subscribe:(id)a3;
- (void)setObservables:(id)a3;
@end

@implementation _EFCombineLatestObservable

- (_EFCombineLatestObservable)initWithObservables:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFCombineLatestObservable;
  v5 = [(_EFCombineLatestObservable *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    observables = v5->_observables;
    v5->_observables = (NSArray *)v6;
  }
  return v5;
}

- (id)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [_EFCombineLatestObservableSubscription alloc];
  uint64_t v6 = [(_EFCombineLatestObservable *)self observables];
  v7 = [(_EFCombineLatestObservableSubscription *)v5 initWithObservables:v6];
  v8 = [(_EFCombineLatestObservableSubscription *)v7 subscribe:v4];

  return v8;
}

- (NSArray)observables
{
  return self->_observables;
}

- (void)setObservables:(id)a3
{
}

- (void).cxx_destruct
{
}

@end