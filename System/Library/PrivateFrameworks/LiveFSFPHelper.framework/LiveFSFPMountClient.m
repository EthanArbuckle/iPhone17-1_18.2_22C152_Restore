@interface LiveFSFPMountClient
+ (id)locallyBuildFPDomain:(id)a3 displayName:(id)a4 provider:(id)a5 how:(int)a6;
+ (id)locallyBuiltDomainStorageSuffix;
+ (id)locallyDestroyFPDomain:(id)a3 provider:(id)a4;
+ (id)newClientForProvider:(id)a3;
- (id)fixupConnectionFor:(id)a3;
@end

@implementation LiveFSFPMountClient

+ (id)locallyBuiltDomainStorageSuffix
{
  return &stru_26E048A08;
}

- (id)fixupConnectionFor:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_new();
  uint64_t v7 = (int)*MEMORY[0x263F522D0];
  v8 = *(Class *)((char *)&self->super.super.isa + v7);
  *(Class *)((char *)&self->super.super.isa + v7) = v6;

  if (*(Class *)((char *)&self->super.super.isa + v7))
  {
    objc_storeStrong((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522D8]), a3);
    [*(id *)((char *)&self->super.super.isa + v7) internalSetProviderName:v5];
    uint64_t v9 = *(uint64_t *)((char *)&self->super.super.isa + v7);
    uint64_t v10 = (int)*MEMORY[0x263F522C8];
    [*(id *)((char *)&self->super.super.isa + v10) setExportedObject:v9];
    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E050A30];
    [*(id *)((char *)&self->super.super.isa + v10) setExportedInterface:v11];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)newClientForProvider:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithProvider:v4];

  return v5;
}

+ (id)locallyBuildFPDomain:(id)a3 displayName:(id)a4 provider:(id)a5 how:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  v12 = objc_opt_new();
  v13 = v12;
  if (v12)
  {
    [v12 setProviderName:v11];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__LiveFSFPMountClient_locallyBuildFPDomain_displayName_provider_how___block_invoke;
    v17[3] = &unk_264934180;
    v17[4] = &v18;
    [v13 LiveMounterClientCreateDomain:v9 displayName:v10 how:v6 storageName:v9 reply:v17];
    id v14 = (id)v19[5];
  }
  else
  {
    id v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:12 userInfo:0];
  }
  v15 = v14;

  _Block_object_dispose(&v18, 8);
  return v15;
}

void __69__LiveFSFPMountClient_locallyBuildFPDomain_displayName_provider_how___block_invoke(uint64_t a1, void *a2)
{
}

+ (id)locallyDestroyFPDomain:(id)a3 provider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  v8 = v7;
  if (v7)
  {
    [v7 setProviderName:v6];
    [v8 destroyDomain:v5];
  }
  else
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:12 userInfo:0];
  id v9 = };

  return v9;
}

@end