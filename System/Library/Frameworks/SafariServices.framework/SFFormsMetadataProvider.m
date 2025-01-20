@interface SFFormsMetadataProvider
- (SFFormsMetadataProvider)initWithFrameHandleToFormsDictionary:(id)a3;
- (unint64_t)formCount;
- (void)enumerateFormsUsingBlock:(id)a3;
@end

@implementation SFFormsMetadataProvider

- (SFFormsMetadataProvider)initWithFrameHandleToFormsDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFormsMetadataProvider;
  v5 = [(SFFormsMetadataProvider *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    frameHandleToForms = v5->_frameHandleToForms;
    v5->_frameHandleToForms = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (unint64_t)formCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSDictionary *)self->_frameHandleToForms allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)enumerateFormsUsingBlock:(id)a3
{
  id v4 = a3;
  frameHandleToForms = self->_frameHandleToForms;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SFFormsMetadataProvider_enumerateFormsUsingBlock___block_invoke;
  v7[3] = &unk_1E5C725E0;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)frameHandleToForms enumerateKeysAndObjectsUsingBlock:v7];
}

void __52__SFFormsMetadataProvider_enumerateFormsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
      if (*a4) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end