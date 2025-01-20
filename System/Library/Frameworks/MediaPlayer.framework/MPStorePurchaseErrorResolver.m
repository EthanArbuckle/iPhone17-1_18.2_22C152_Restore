@interface MPStorePurchaseErrorResolver
- (MPStorePurchaseErrorResolver)initWithStoreAccountIdentifier:(id)a3;
- (NSNumber)storeAccountIdentifier;
- (void)resolveError:(id)a3;
@end

@implementation MPStorePurchaseErrorResolver

- (void).cxx_destruct
{
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void)resolveError:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  v7 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  unint64_t v8 = [v7 code];
  v9 = [v4 domain];
  uint64_t v10 = *MEMORY[0x1E4F15AC0];
  if (([v9 isEqualToString:*MEMORY[0x1E4F15AC0]] & 1) == 0)
  {

LABEL_11:
    [(MPAVErrorResolver *)self sendDidResolveError:v4 withResolution:0];
    goto LABEL_26;
  }
  v11 = [v7 domain];
  uint64_t v12 = *MEMORY[0x1E4F28760];
  if ([v11 isEqualToString:*MEMORY[0x1E4F28760]]) {
    BOOL v13 = v8 > 0xFFFFFFFFFFFF5BF0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13 && v8 >= 0xFFFFFFFFFFFF3CB1)
  {
    v29 = self;
    id v16 = v4;
    v17 = v16;
    if (!v16) {
      goto LABEL_18;
    }
    v18 = [v16 domain];
    int v19 = [v18 isEqualToString:v10];

    if (!v19) {
      goto LABEL_18;
    }
    v20 = [v17 userInfo];
    v21 = [v20 objectForKey:v6];

    uint64_t v22 = [v21 code];
    if (!v21) {
      goto LABEL_18;
    }
    uint64_t v23 = v22;
    v24 = [v21 domain];
    int v25 = [v24 isEqualToString:v12];

    if (v25 && (unint64_t)(v23 + 42597) < 3) {
      int v15 = 0;
    }
    else {
LABEL_18:
    }
      int v15 = 1;

    self = v29;
  }
  else
  {
    int v15 = 0;
  }

  if (!v15 || v8 + 42583 > 0xFFFFFFFFFFFFFFF8) {
    goto LABEL_11;
  }
  if (self->_storeAccountIdentifier) {
    objc_msgSend(MEMORY[0x1E4FB87B8], "specificAccountWithDSID:");
  }
  else {
  v26 = [MEMORY[0x1E4FB87B8] activeAccount];
  }
  v27 = (void *)[objc_alloc(MEMORY[0x1E4FB8758]) initWithIdentity:v26];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4FB85A8]) initWithRequestContext:v27];
  [v28 setReason:*MEMORY[0x1E4FB83A0]];
  [v28 setQualityOfService:25];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __45__MPStorePurchaseErrorResolver_resolveError___block_invoke;
  v30[3] = &unk_1E57F7170;
  v30[4] = self;
  id v31 = v4;
  [v28 performWithResponseHandler:v30];

LABEL_26:
}

void __45__MPStorePurchaseErrorResolver_resolveError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MPStorePurchaseErrorResolver_resolveError___block_invoke_2;
  block[3] = &unk_1E57FA038;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __45__MPStorePurchaseErrorResolver_resolveError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendDidResolveError:*(void *)(a1 + 40) withResolution:2 * (*(void *)(a1 + 48) == 0)];
}

- (MPStorePurchaseErrorResolver)initWithStoreAccountIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStorePurchaseErrorResolver;
  id v6 = [(MPStorePurchaseErrorResolver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storeAccountIdentifier, a3);
  }

  return v7;
}

@end