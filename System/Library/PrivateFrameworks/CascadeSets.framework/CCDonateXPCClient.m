@interface CCDonateXPCClient
- (CCDonateXPCClient)initWithClientId:(id)a3;
- (void)abortSetDonation;
- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5;
- (void)beginSetDonationWithItemType:(unsigned __int16)a3 remoteDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8;
- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)mergeDelta:(id)a3 completion:(id)a4;
- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4;
@end

@implementation CCDonateXPCClient

- (CCDonateXPCClient)initWithClientId:(id)a3
{
  return [(CCXPCClient *)self initWithRemoteObjectInterface:&unk_26FDDADF8 exportedInterface:&unk_26FDDAE80 serviceName:@"com.apple.SetStoreUpdateService" clientId:a3 interruptionCode:10 invalidationCode:9 useCase:*MEMORY[0x263F29E40]];
}

- (void)beginSetDonationWithItemType:(unsigned __int16)a3 remoteDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __110__CCDonateXPCClient_beginSetDonationWithItemType_remoteDevice_encodedDescriptors_version_validity_completion___block_invoke;
  v20[3] = &unk_26527A280;
  unsigned __int16 v25 = a3;
  id v21 = v14;
  id v22 = v15;
  id v23 = v16;
  unint64_t v24 = a6;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [(CCXPCClient *)self serviceVersionRespondingRequest:0 completion:a8 usingBlock:v20];
}

- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__CCDonateXPCClient_endSetDonationWithOptions_completion___block_invoke;
  v4[3] = &__block_descriptor_40_e45_v24__0__NSObject_CCDonateService__8___v__S_16l;
  v4[4] = a3;
  [(CCXPCClient *)self serviceRequest:1 completion:a4 usingBlock:v4];
}

- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__CCDonateXPCClient_addItemsWithContents_metaContents_completion___block_invoke;
  v12[3] = &unk_26527A210;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(CCXPCClient *)self serviceRequest:1 completion:a5 usingBlock:v12];
}

uint64_t __66__CCDonateXPCClient_addItemsWithContents_metaContents_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 addItemsWithContents:*(void *)(a1 + 32) metaContents:*(void *)(a1 + 40) completion:a3];
}

uint64_t __58__CCDonateXPCClient_endSetDonationWithOptions_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 endSetDonationWithOptions:*(void *)(a1 + 32) completion:a3];
}

uint64_t __110__CCDonateXPCClient_beginSetDonationWithItemType_remoteDevice_encodedDescriptors_version_validity_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 beginSetDonationWithItemType:*(unsigned __int16 *)(a1 + 64) remoteDevice:*(void *)(a1 + 32) encodedDescriptors:*(void *)(a1 + 40) version:*(void *)(a1 + 56) validity:*(void *)(a1 + 48) completion:a3];
}

- (void)abortSetDonation
{
}

uint64_t __37__CCDonateXPCClient_abortSetDonation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 abortSetDonation];
}

- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__CCDonateXPCClient_removeSourceItemIdentifier_completion___block_invoke;
  v8[3] = &unk_26527A238;
  id v9 = v6;
  id v7 = v6;
  [(CCXPCClient *)self serviceRequest:1 completion:a4 usingBlock:v8];
}

uint64_t __59__CCDonateXPCClient_removeSourceItemIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 removeSourceItemIdentifier:*(void *)(a1 + 32) completion:a3];
}

- (void)mergeDelta:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CCDonateXPCClient_mergeDelta_completion___block_invoke;
  v8[3] = &unk_26527A238;
  id v9 = v6;
  id v7 = v6;
  [(CCXPCClient *)self serviceRequest:1 completion:a4 usingBlock:v8];
}

uint64_t __43__CCDonateXPCClient_mergeDelta_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 mergeDelta:*(void *)(a1 + 32) completion:a3];
}

@end