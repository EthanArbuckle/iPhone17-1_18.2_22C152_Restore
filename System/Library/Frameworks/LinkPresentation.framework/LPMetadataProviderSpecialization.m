@interface LPMetadataProviderSpecialization
+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
+ (id)specializedMetadataProviderForMetadata:(id)a3 withContext:(id)a4;
+ (id)specializedMetadataProviderForResourceWithContext:(id)a3;
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (LPMetadataProviderSpecialization)initWithContext:(id)a3;
- (LPMetadataProviderSpecializationContext)context;
- (LPMetadataProviderSpecializationDelegate)delegate;
- (id)createMetadataWithSpecialization:(id)a3;
- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation LPMetadataProviderSpecialization

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  v17[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v3, "allowedSpecializations", (void)v12);
      if (([v8 specialization] & v9) != 0)
      {
        v10 = [v8 specializedMetadataProviderForURLWithContext:v3];
        if (v10) {
          break;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

+ (id)specializedMetadataProviderForResourceWithContext:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      uint64_t v9 = objc_msgSend(v3, "allowedSpecializations", (void)v12);
      if (([v8 specialization] & v9) != 0)
      {
        v10 = [v8 specializedMetadataProviderForResourceWithContext:v3];
        if (v10) {
          break;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

+ (id)specializedMetadataProviderForMetadata:(id)a3 withContext:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v20[0] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      uint64_t v12 = objc_msgSend(v6, "allowedSpecializations", (void)v15);
      if (([v11 specialization] & v12) != 0)
      {
        long long v13 = [v11 specializedMetadataProviderForMetadata:v5 withContext:v6];
        if (v13) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    long long v13 = 0;
  }

  return v13;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  v22[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v8, "allowedSpecializations", (void)v17);
        if (([v14 specialization] & v15) != 0
          && ([v14 generateSpecializedMetadataForCompleteMetadata:v7 withContext:v8 completionHandler:v9] & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v11;
}

+ (unint64_t)specialization
{
  return 0;
}

- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3
{
}

- (id)createMetadataWithSpecialization:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(LPLinkMetadata);
  id v6 = [(LPMetadataProviderSpecialization *)self context];
  id v7 = [v6 postRedirectURL];
  [(LPLinkMetadata *)v5 setURL:v7];

  id v8 = [(LPMetadataProviderSpecialization *)self context];
  id v9 = [v8 originalURL];
  [(LPLinkMetadata *)v5 setOriginalURL:v9];

  [(LPLinkMetadata *)v5 setSpecialization:v4];

  return v5;
}

- (LPMetadataProviderSpecializationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPMetadataProviderSpecializationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LPMetadataProviderSpecializationContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (LPMetadataProviderSpecialization)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPMetadataProviderSpecialization;
  id v6 = [(LPMetadataProviderSpecialization *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    id v8 = v7;
  }

  return v7;
}

@end