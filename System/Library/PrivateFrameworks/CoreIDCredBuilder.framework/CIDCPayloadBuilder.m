@interface CIDCPayloadBuilder
- (CIDCPayloadBuilder)initWithDelegate:(id)a3;
- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)payloadBuilder;
- (void)buildPayloadWithDetails:(id)a3 completion:(id)a4;
- (void)setPayloadBuilder:(id)a3;
@end

@implementation CIDCPayloadBuilder

- (CIDCPayloadBuilder)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CIDCPayloadBuilder;
  v5 = [(CIDCPayloadBuilder *)&v8 init];
  if (v5)
  {
    v6 = [[_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder alloc] initWithDelegate:v4 payloadBuilder:v5];
    [(CIDCPayloadBuilder *)v5 setPayloadBuilder:v6];
  }
  return v5;
}

- (void)buildPayloadWithDetails:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(CIDCPayloadBuilder *)self payloadBuilder];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CIDCPayloadBuilder_buildPayloadWithDetails_completion___block_invoke;
  v10[3] = &unk_264770900;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 buildPayloadWithDetails:v7 completionHandler:v10];
}

uint64_t __57__CIDCPayloadBuilder_buildPayloadWithDetails_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)payloadBuilder
{
  return self->_payloadBuilder;
}

- (void)setPayloadBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end