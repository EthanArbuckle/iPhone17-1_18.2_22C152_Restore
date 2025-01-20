@interface CRKUnionAssertionProvider
+ (id)activeIDSClassSessionAssertionProviderWithPrefix:(id)a3;
- (CRKUnionAssertionProvider)initWithAssertionProviders:(id)a3;
- (NSArray)assertionProviders;
- (id)acquireAssertion;
@end

@implementation CRKUnionAssertionProvider

+ (id)activeIDSClassSessionAssertionProviderWithPrefix:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"%@.active-ids-class-session", a3];
  v4 = [CRKUnionAssertionProvider alloc];
  v5 = objc_opt_new();
  v12[0] = v5;
  v6 = [CRKOSTransactionAssertionProvider alloc];
  v7 = objc_opt_new();
  v8 = [(CRKOSTransactionAssertionProvider *)v6 initWithReverseDNSReason:v3 primitives:v7];
  v12[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v10 = [(CRKUnionAssertionProvider *)v4 initWithAssertionProviders:v9];

  return v10;
}

- (CRKUnionAssertionProvider)initWithAssertionProviders:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKUnionAssertionProvider;
  v5 = [(CRKUnionAssertionProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assertionProviders = v5->_assertionProviders;
    v5->_assertionProviders = (NSArray *)v6;
  }
  return v5;
}

- (id)acquireAssertion
{
  v2 = [(CRKUnionAssertionProvider *)self assertionProviders];
  v3 = objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_81);

  id v4 = (void *)[objc_alloc(MEMORY[0x263F39C78]) initWithCancellables:v3];

  return v4;
}

uint64_t __45__CRKUnionAssertionProvider_acquireAssertion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 acquireAssertion];
}

- (NSArray)assertionProviders
{
  return self->_assertionProviders;
}

- (void).cxx_destruct
{
}

@end