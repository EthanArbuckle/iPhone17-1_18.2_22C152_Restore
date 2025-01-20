@interface SSUMatcherWeakRef
- (SNLPSSUMatcher)matcher;
- (SSUMatcherWeakRef)initWithMatcher:(id)a3;
@end

@implementation SSUMatcherWeakRef

- (void).cxx_destruct
{
}

- (SNLPSSUMatcher)matcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matcher);
  return (SNLPSSUMatcher *)WeakRetained;
}

- (SSUMatcherWeakRef)initWithMatcher:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSUMatcherWeakRef;
  id v3 = a3;
  v4 = [(SSUMatcherWeakRef *)&v6 init];
  objc_storeWeak((id *)&v4->_matcher, v3);

  return v4;
}

@end