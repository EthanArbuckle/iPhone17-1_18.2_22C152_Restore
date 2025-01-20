@interface AFAudioSessionAssertionRemoteAcquisitionService
- (AFAudioSessionAssertionRemoteAcquisitionService)initWithInstanceContext:(id)a3;
- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4;
@end

@implementation AFAudioSessionAssertionRemoteAcquisitionService

- (void).cxx_destruct
{
}

- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v4 && (memset(&v32, 0, sizeof(v32)), dladdr(v4, &v32)))
  {
    if (v32.dli_fname && *v32.dli_fname)
    {
      id v9 = [NSString alloc];
      v10 = (void *)[v9 initWithUTF8String:v32.dli_fname];
    }
    else
    {
      v10 = 0;
    }
    if (v32.dli_sname && *v32.dli_sname)
    {
      id v12 = [NSString alloc];
      v13 = (void *)[v12 initWithUTF8String:v32.dli_sname];
    }
    else
    {
      v13 = 0;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke;
    v29[3] = &unk_1E592A130;
    id v30 = v10;
    id v31 = v13;
    id v14 = v13;
    id v15 = v10;
    id v11 = +[AFCallSiteInfo newWithBuilder:v29];
  }
  else
  {
    id v11 = 0;
  }
  v16 = [AFAudioSessionAssertionConnection alloc];
  instanceContext = self->_instanceContext;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke_2;
  v26 = &unk_1E5924AC8;
  id v27 = v7;
  id v28 = v11;
  id v18 = v11;
  id v19 = v7;
  v20 = [v19 mutatedCopyWithMutator:&v23];
  v21 = -[AFAudioSessionAssertionConnection initWithInstanceContext:acquisitionContext:relinquishmentHandler:](v16, "initWithInstanceContext:acquisitionContext:relinquishmentHandler:", instanceContext, v20, v8, v23, v24, v25, v26);

  return v21;
}

void __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImagePath:v3];
  [v4 setSymbolName:*(void *)(a1 + 40)];
}

void __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) timestamp]) {
    [v3 setTimestamp:mach_absolute_time()];
  }
  id v4 = [*(id *)(a1 + 32) reason];

  if (!v4) {
    [v3 setReason:@"Client Acquisition"];
  }
  v5 = [*(id *)(a1 + 32) effectiveDate];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] date];
    [v3 setEffectiveDate:v6];
  }
  [*(id *)(a1 + 32) expirationDuration];
  if (v7 < 0.0) {
    [v3 setExpirationDuration:0.0];
  }
  id v8 = [*(id *)(a1 + 32) userInfo];
  id v9 = [MEMORY[0x1E4F28F80] processInfo];
  v10 = *(void **)(a1 + 40);
  id v11 = v8;
  id v12 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v13 = v10;
  id v14 = objc_alloc_init(v12);
  v19[0] = @"processIdentifier";
  id v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v9, "processIdentifier"));
  v19[1] = @"processName";
  v20[0] = v15;
  v16 = [v9 processName];
  v20[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v14 addEntriesFromDictionary:v17];

  id v18 = [v13 buildDictionaryRepresentation];

  if (v18) {
    [v14 addEntriesFromDictionary:v18];
  }
  if (v11) {
    [v14 addEntriesFromDictionary:v11];
  }

  [v3 setUserInfo:v14];
}

- (AFAudioSessionAssertionRemoteAcquisitionService)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFAudioSessionAssertionRemoteAcquisitionService;
  v5 = [(AFAudioSessionAssertionRemoteAcquisitionService *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (AFInstanceContext *)v4;
    }
    else
    {
      v6 = +[AFInstanceContext currentContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v6;
  }
  return v5;
}

@end