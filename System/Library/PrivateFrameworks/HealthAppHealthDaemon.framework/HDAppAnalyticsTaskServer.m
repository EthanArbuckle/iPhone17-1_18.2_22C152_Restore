@interface HDAppAnalyticsTaskServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_setAccepted:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 completion:(id)a6;
- (void)remote_setAccepted:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5;
@end

@implementation HDAppAnalyticsTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x263F42A08];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F09BA8];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2701E9018];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2701EDCE8];
}

- (void)remote_setAccepted:(BOOL)a3 agreement:(id)a4 version:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  v11 = (void (**)(id, uint64_t, id))a6;
  v12 = [(HDStandardTaskServer *)self profile];
  v13 = +[HDHealthAppPlugin pluginIdentifier];
  v14 = [v12 profileExtensionWithIdentifier:v13];

  if (v14)
  {
    v15 = [(HDStandardTaskServer *)self profile];
    v16 = [v15 database];
    v17 = [MEMORY[0x263F431E0] contextForWriting];
    id v25 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __76__HDAppAnalyticsTaskServer_remote_setAccepted_agreement_version_completion___block_invoke;
    v21[3] = &unk_265358BD8;
    BOOL v24 = a3;
    id v22 = v10;
    int64_t v23 = a5;
    uint64_t v18 = [v16 performTransactionWithContext:v17 error:&v25 block:v21 inaccessibilityHandler:0];
    id v19 = v25;

    v11[2](v11, v18, v19);
  }
  else
  {
    v20 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 125, @"No extension found.");
    v11[2](v11, 0, v20);
  }
}

BOOL __76__HDAppAnalyticsTaskServer_remote_setAccepted_agreement_version_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = (void *)MEMORY[0x263EFF910];
  id v8 = a2;
  v9 = [v7 date];
  BOOL v10 = +[HDAppAnalyticsAcceptanceEntity setAcceptance:v4 agreement:v5 version:v6 modificationDate:v9 transaction:v8 error:a3];

  return v10;
}

- (void)remote_setAccepted:(BOOL)a3 currentAgreement:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, uint64_t, id))a5;
  BOOL v10 = [(HDStandardTaskServer *)self profile];
  v11 = +[HDHealthAppPlugin pluginIdentifier];
  v12 = [v10 profileExtensionWithIdentifier:v11];

  if (v12)
  {
    v13 = [v12 appAnalyticsUpdateManager];
    uint64_t v14 = [v13 currentVersionForAgreement:v8];

    v15 = [(HDStandardTaskServer *)self profile];
    v16 = [v15 database];
    v17 = [MEMORY[0x263F431E0] contextForWriting];
    id v26 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__HDAppAnalyticsTaskServer_remote_setAccepted_currentAgreement_completion___block_invoke;
    v21[3] = &unk_265358C00;
    id v22 = v12;
    BOOL v25 = a3;
    id v23 = v8;
    uint64_t v24 = v14;
    uint64_t v18 = [v16 performTransactionWithContext:v17 error:&v26 block:v21 inaccessibilityHandler:0];
    id v19 = v26;

    v9[2](v9, v18, v19);
  }
  else
  {
    v20 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 125, @"No extension found.");
    v9[2](v9, 0, v20);
  }
}

uint64_t __75__HDAppAnalyticsTaskServer_remote_setAccepted_currentAgreement_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 appAnalyticsUpdateManager];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v11 = [MEMORY[0x263EFF910] date];
  uint64_t v12 = [v7 setAccepted:v8 agreement:v10 version:v9 modificationDate:v11 transaction:v6 error:a3];

  return v12;
}

@end