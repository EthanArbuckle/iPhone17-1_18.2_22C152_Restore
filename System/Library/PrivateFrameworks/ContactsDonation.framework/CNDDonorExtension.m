@interface CNDDonorExtension
- (CNDDonorExtension)initWithExtension:(id)a3;
- (CNDDonorExtension)initWithExtension:(id)a3 logger:(id)a4;
- (CNDonationExtensionLogger)logger;
- (NSExtension)extension;
- (id)description;
- (void)redonateAllValuesWithReason:(unint64_t)a3;
- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4;
@end

@implementation CNDDonorExtension

- (CNDDonorExtension)initWithExtension:(id)a3
{
  id v4 = a3;
  v5 = +[CNDonationLoggerProvider defaultProvider];
  v6 = [v5 extensionLogger];

  v7 = [(CNDDonorExtension *)self initWithExtension:v4 logger:v6];
  return v7;
}

- (CNDDonorExtension)initWithExtension:(id)a3 logger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNDDonorExtension;
  v9 = [(CNDDonorExtension *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNDDonorExtension *)self extension];
  v5 = [v4 identifier];
  id v6 = (id)[v3 appendName:@"identifier" object:v5];

  id v7 = [v3 build];

  return v7;
}

- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNDDonorExtension *)self logger];
  [v8 willRenewDonation:v6];

  v9 = [(CNDDonorExtension *)self extension];
  v10 = objc_msgSend(v9, "_cnd_requestWithInputItems:", MEMORY[0x263EFFA68]);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke;
  v21[3] = &unk_2641FC540;
  v21[4] = self;
  v11 = [v10 flatMap:v21];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_2;
  v17[3] = &unk_2641FC590;
  id v12 = v6;
  id v18 = v12;
  v19 = self;
  id v20 = v7;
  id v13 = v7;
  [v11 addSuccessBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_4;
  v15[3] = &unk_2641FC300;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v11 addFailureBlock:v15];
}

id __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 extension];
  v5 = [v4 _extensionContextForUUID:v3];

  id v6 = [v5 _auxiliaryConnection];
  id v7 = (void *)MEMORY[0x263F335E0];
  id v8 = [v6 remoteObjectProxy];
  v9 = [v7 futureWithResult:v8];

  return v9;
}

void __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_3;
  v6[3] = &unk_2641FC568;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  [a2 renewExpirationDateForDonatedValue:v4 acknowledgementHandler:v6];
}

void __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_3(void *a1, void *a2, void *a3)
{
  int8x16_t v5 = (void *)a1[4];
  id v6 = a3;
  id v10 = a2;
  int8x16_t v7 = [v5 logger];
  id v8 = v7;
  uint64_t v9 = a1[5];
  if (a2) {
    [v7 didRenewDonation:v9 untilDate:v10];
  }
  else {
    [v7 didExpireDonation:v9 withError:v6];
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __79__CNDDonorExtension_renewExpirationDateForDonatedValue_acknowledgementHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 logger];
  [v5 couldNotRenewDonation:*(void *)(a1 + 40) error:v4];
}

- (void)redonateAllValuesWithReason:(unint64_t)a3
{
  id v5 = [(CNDDonorExtension *)self logger];
  [v5 willRedonateValuesWithReason:a3];

  id v6 = [(CNDDonorExtension *)self extension];
  int8x16_t v7 = objc_msgSend(v6, "_cnd_requestWithInputItems:", MEMORY[0x263EFFA68]);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke;
  v11[3] = &unk_2641FC540;
  v11[4] = self;
  id v8 = [v7 flatMap:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_2;
  v10[3] = &unk_2641FC5B8;
  v10[4] = self;
  v10[5] = a3;
  [v8 addSuccessBlock:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_3;
  v9[3] = &unk_2641FC5E0;
  v9[4] = self;
  v9[5] = a3;
  [v8 addFailureBlock:v9];
}

id __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  int8x16_t v7 = [*(id *)(a1 + 32) extension];
  id v8 = [v7 _extensionContextForUUID:v6];

  uint64_t v9 = [v8 _auxiliaryConnection];
  id v10 = (void *)MEMORY[0x263F335E0];
  v11 = [v9 remoteObjectProxy];
  id v12 = [v10 futureWithResult:v11];

  return v12;
}

void __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 redonateAllValuesWithReason:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) logger];
  [v3 didRedonateValuesWithReason:*(void *)(a1 + 40)];
}

void __49__CNDDonorExtension_redonateAllValuesWithReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 logger];
  [v5 couldNotRedonateValuesWithReason:*(void *)(a1 + 40) error:v4];
}

- (NSExtension)extension
{
  return self->_extension;
}

- (CNDonationExtensionLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end