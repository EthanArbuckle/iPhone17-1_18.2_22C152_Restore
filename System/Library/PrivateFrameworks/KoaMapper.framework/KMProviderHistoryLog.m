@interface KMProviderHistoryLog
- (BOOL)recordChangesAcceptedWithVersion:(unint64_t)a3 historyToken:(id)a4;
- (BOOL)recordDonationStartTime;
- (KMProviderHistoryLog)initWithDirectory:(id)a3 originAppId:(id)a4;
- (id)_recordDonationEndTime;
- (id)_recordHistoryToken:(id)a3;
- (id)_recordVersion:(unint64_t)a3;
- (id)getDonationEndTime;
- (id)getDonationStartTime;
- (id)getHistoryToken;
- (unint64_t)getVersion;
@end

@implementation KMProviderHistoryLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (BOOL)recordChangesAcceptedWithVersion:(unint64_t)a3 historyToken:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v7 = _sharedQueue();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__KMProviderHistoryLog_recordChangesAcceptedWithVersion_historyToken___block_invoke;
  v10[3] = &unk_2646DB9A0;
  v10[4] = self;
  id v11 = v6;
  v12 = &v14;
  unint64_t v13 = a3;
  id v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __70__KMProviderHistoryLog_recordChangesAcceptedWithVersion_historyToken___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _recordVersion:*(void *)(a1 + 56)];
  v3 = [*(id *)(a1 + 32) _recordHistoryToken:*(void *)(a1 + 40)];
  v4 = [*(id *)(a1 + 32) _recordDonationEndTime];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  v7[0] = @"version";
  v7[1] = @"historyToken";
  v7[2] = @"donationEndTime";
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) writeUpdatedObjects:v5 forKeys:v6 error:0];
}

- (id)_recordDonationEndTime
{
  v3 = [(KVDictionaryLog *)self->_log mutableDictionaryForKey:@"donationEndTime" error:0];
  if (self->_donationStartTimeRecorded)
  {
    v4 = [MEMORY[0x263EFF910] now];
    [v3 setObject:v4 forKey:self->_originAppId];
  }
  return v3;
}

- (id)_recordHistoryToken:(id)a3
{
  id v4 = a3;
  v5 = [(KVDictionaryLog *)self->_log mutableDictionaryForKey:@"historyToken" error:0];
  id v6 = v5;
  if (v4) {
    [v5 setObject:v4 forKey:self->_originAppId];
  }
  else {
    [v5 removeObjectForKey:self->_originAppId];
  }

  return v6;
}

- (id)_recordVersion:(unint64_t)a3
{
  v5 = [(KVDictionaryLog *)self->_log mutableDictionaryForKey:@"version" error:0];
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v6 forKey:self->_originAppId];

  return v5;
}

- (id)getDonationEndTime
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v3 = _sharedQueue();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__KMProviderHistoryLog_getDonationEndTime__block_invoke;
  v6[3] = &unk_2646DB978;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__KMProviderHistoryLog_getDonationEndTime__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"donationEndTime"];
  uint64_t v2 = [v5 objectForKey:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)recordDonationStartTime
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = _sharedQueue();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__KMProviderHistoryLog_recordDonationStartTime__block_invoke;
  v5[3] = &unk_2646DB978;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __47__KMProviderHistoryLog_recordDonationStartTime__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) mutableDictionaryForKey:@"donationStartTime" error:0];
  uint64_t v2 = [MEMORY[0x263EFF910] now];
  [v3 setObject:v2 forKey:*(void *)(*(void *)(a1 + 32) + 16)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 8) writeUpdatedObject:v3 forKey:@"donationStartTime" error:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
}

- (id)getDonationStartTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = _sharedQueue();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__KMProviderHistoryLog_getDonationStartTime__block_invoke;
  v6[3] = &unk_2646DB978;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__KMProviderHistoryLog_getDonationStartTime__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"donationStartTime"];
  uint64_t v2 = [v5 objectForKey:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)getVersion
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = _sharedQueue();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__KMProviderHistoryLog_getVersion__block_invoke;
  v6[3] = &unk_2646DB978;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__KMProviderHistoryLog_getVersion__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"version"];
  uint64_t v2 = [v3 objectForKey:*(void *)(*(void *)(a1 + 32) + 16)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 unsignedLongLongValue];
}

- (id)getHistoryToken
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = _sharedQueue();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__KMProviderHistoryLog_getHistoryToken__block_invoke;
  v6[3] = &unk_2646DB978;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__KMProviderHistoryLog_getHistoryToken__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"historyToken"];
  uint64_t v2 = [v5 objectForKey:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (KMProviderHistoryLog)initWithDirectory:(id)a3 originAppId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)KMProviderHistoryLog;
  uint64_t v8 = [(KMProviderHistoryLog *)&v21 init];
  if (v8)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    uint64_t v9 = _sharedQueue();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__KMProviderHistoryLog_initWithDirectory_originAppId___block_invoke;
    v12[3] = &unk_2646DB978;
    uint64_t v14 = &v15;
    id v13 = v6;
    dispatch_sync(v9, v12);

    objc_storeStrong((id *)&v8->_log, (id)v16[5]);
    if (!v8->_log || (objc_storeStrong((id *)&v8->_originAppId, a4), !v8->_originAppId))
    {

      _Block_object_dispose(&v15, 8);
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    v8->_donationStartTimeRecorded = 0;

    _Block_object_dispose(&v15, 8);
  }
  uint64_t v10 = v8;
LABEL_7:

  return v10;
}

uint64_t __54__KMProviderHistoryLog_initWithDirectory_originAppId___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_alloc(MEMORY[0x263F51098]) initWithFilename:@"provider_log" directory:*(void *)(a1 + 32) readOnly:0 error:0];
  return MEMORY[0x270F9A758]();
}

@end