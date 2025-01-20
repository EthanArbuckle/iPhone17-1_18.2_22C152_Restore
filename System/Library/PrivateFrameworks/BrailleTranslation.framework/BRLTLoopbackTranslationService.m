@interface BRLTLoopbackTranslationService
- (BOOL)isLoopback;
- (BRLTLoopbackTranslationService)initWithServiceIdentifier:(id)a3 connection:(id)a4 loopbackService:(id)a5;
- (BRLTSLoopbackTranslationService)loopbackService;
- (void)setLoopbackService:(id)a3;
@end

@implementation BRLTLoopbackTranslationService

- (BRLTLoopbackTranslationService)initWithServiceIdentifier:(id)a3 connection:(id)a4 loopbackService:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BRLTLoopbackTranslationService;
  v10 = [(BRLTTranslationService *)&v13 initWithServiceIdentifier:a3 connection:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_loopbackService, a5);
  }

  return v11;
}

- (BOOL)isLoopback
{
  return 1;
}

- (BRLTSLoopbackTranslationService)loopbackService
{
  return self->_loopbackService;
}

- (void)setLoopbackService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end