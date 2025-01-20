@interface HK_TPSDiscoverabilitySignal
- (HK_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3;
- (NSString)identifier;
- (void)donateSignalWithCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation HK_TPSDiscoverabilitySignal

- (HK_TPSDiscoverabilitySignal)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HK_TPSDiscoverabilitySignal;
  v5 = [(HK_TPSDiscoverabilitySignal *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void)donateSignalWithCompletion:(id)a3
{
  id v8 = [(HK_TPSDiscoverabilitySignal *)self identifier];
  v3 = BiomeLibrary();
  id v4 = [v3 Discoverability];
  v5 = [v4 Signals];

  uint64_t v6 = [v5 source];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4FE08]) initWithContentIdentifier:v8 context:0 osBuild:0 userInfo:0];
  [v6 sendEvent:v7];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end