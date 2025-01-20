@interface CNVisualSimilarity
+ (BOOL)isData:(id)a3 similarTo:(id)a4;
+ (BOOL)isFingerprint:(id)a3 similarTo:(id)a4;
+ (BOOL)isFingerprint:(id)a3 similarTo:(id)a4 threshold:(double)a5;
+ (id)fingerprintForData:(id)a3;
+ (id)fingerprintForImageRequestHandler:(id)a3;
+ (id)log;
@end

@implementation CNVisualSimilarity

+ (id)log
{
  if (log_cn_once_token_0_1 != -1) {
    dispatch_once(&log_cn_once_token_0_1, &__block_literal_global_36);
  }
  v2 = (void *)log_cn_once_object_0_1;

  return v2;
}

uint64_t __25__CNVisualSimilarity_log__block_invoke()
{
  log_cn_once_object_0_1 = (uint64_t)os_log_create("com.apple.contacts", "vision");

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isData:(id)a3 similarTo:(id)a4
{
  id v6 = a4;
  v7 = [a1 fingerprintForData:a3];
  v8 = [a1 fingerprintForData:v6];

  LOBYTE(a1) = [a1 isFingerprint:v7 similarTo:v8];
  return (char)a1;
}

+ (id)fingerprintForData:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F45890];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = (void *)[v6 initWithData:v5 options:MEMORY[0x1E4F1CC08]];

  v8 = [a1 fingerprintForImageRequestHandler:v7];

  return v8;
}

+ (id)fingerprintForImageRequestHandler:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F45748]);
  id v5 = (void *)MEMORY[0x192FD3A40]([v4 setRevision:1]);
  v16[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v15 = 0;
  char v7 = [v3 performRequests:v6 error:&v15];
  id v8 = v15;

  if ((v7 & 1) == 0)
  {
    v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CNVisualSimilarity fingerprintForImageRequestHandler:]((uint64_t)v8, v9);
    }
  }
  v10 = [v4 results];
  v11 = [v10 firstObject];

  v12 = [v11 fingerprintHashes];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))()) {
    v13 = 0;
  }
  else {
    v13 = [[CNVisualFingerprint alloc] initWithVNFingerprintHashes:v12];
  }

  return v13;
}

+ (BOOL)isFingerprint:(id)a3 similarTo:(id)a4
{
  return [a1 isFingerprint:a3 similarTo:a4 threshold:10.0];
}

+ (BOOL)isFingerprint:(id)a3 similarTo:(id)a4 threshold:(double)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = [a3 hashData];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v14 = objc_msgSend(v7, "hashData", 0);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v23 != v17) {
                objc_enumerationMutation(v14);
              }
              double v19 = (double)objc_msgSend(v13, "_cn_distanceFromData:", *(void *)(*((void *)&v22 + 1) + 8 * j));
              if (v19 < a5)
              {

                BOOL v20 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16, v19);
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      BOOL v20 = 0;
    }
    while (v10);
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_19:

  return v20;
}

+ (void)fingerprintForImageRequestHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Could not generate fingerprint: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end