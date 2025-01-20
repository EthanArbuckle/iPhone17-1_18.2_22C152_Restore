@interface BPSCorrelateHandler
+ (id)directStreamsAssociationWithBlock:(id)a3;
- (BPSCorrelateHandler)initWithInitialContext:(id)a3;
- (id)context;
- (id)correlateWithCurrentEvent:(id)a3;
- (void)receiveCurrentEvent:(id)a3;
- (void)receivePriorEvent:(id)a3;
- (void)setContext:(id)a3;
- (void)updateContext:(id)a3;
@end

@implementation BPSCorrelateHandler

- (BPSCorrelateHandler)initWithInitialContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSCorrelateHandler;
  v6 = [(BPSCorrelateHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_context, a3);
  }

  return v7;
}

- (void)receivePriorEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];
}

- (void)receiveCurrentEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];
}

- (id)correlateWithCurrentEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];

  return 0;
}

- (void)updateContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)directStreamsAssociationWithBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[BPSDirectAssocationCorrelateHandler alloc] initWithCorrelating:v3];

  return v4;
}

@end