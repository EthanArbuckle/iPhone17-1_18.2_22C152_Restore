@interface GKLoadContactResourceOperation
+ (double)mainScreenScale;
- (CNAvatarImageRenderer)monogrammer;
- (GKLoadContactResourceOperation)initWithContactId:(id)a3;
- (NSString)contactId;
- (id)imageCreationError;
- (id)makeFetchError;
- (void)main;
- (void)setMonogrammer:(id)a3;
@end

@implementation GKLoadContactResourceOperation

- (GKLoadContactResourceOperation)initWithContactId:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKLoadContactResourceOperation;
  v5 = [(GKLoadContactResourceOperation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contactId = v5->_contactId;
    v5->_contactId = (NSString *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1BB20]);
    v9 = [MEMORY[0x1E4F1BB28] defaultSettings];
    uint64_t v10 = [v8 initWithSettings:v9];
    monogrammer = v5->_monogrammer;
    v5->_monogrammer = (CNAvatarImageRenderer *)v10;
  }
  return v5;
}

- (void)main
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (([(GKLoadContactResourceOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    uint64_t v4 = *MEMORY[0x1E4F1AE28];
    v21[0] = v3;
    v21[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1AE20];
    uint64_t v22 = *MEMORY[0x1E4F1AF98];
    uint64_t v23 = v5;
    uint64_t v6 = *MEMORY[0x1E4F1ADF0];
    uint64_t v24 = v22;
    uint64_t v25 = v6;
    uint64_t v7 = *MEMORY[0x1E4F1AFA8];
    uint64_t v26 = *MEMORY[0x1E4F1ADE0];
    uint64_t v27 = v7;
    uint64_t v8 = *MEMORY[0x1E4F1AEE0];
    uint64_t v28 = *MEMORY[0x1E4F1ADC8];
    uint64_t v29 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:10];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v11 = [(GKLoadContactResourceOperation *)self contactId];
    v12 = [v10 unifiedContactWithIdentifier:v11 keysToFetch:v9 error:0];

    objc_super v13 = [v12 imageData];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4FB1818];
      v15 = [v12 imageData];
      v16 = [v14 _gkImageWithCheckedData:v15];

      if (v16)
      {
        [(GKLoadResourceOperation *)self didCompleteWithResource:v16 error:0];
LABEL_8:

        return;
      }
      v17 = [(GKLoadContactResourceOperation *)self imageCreationError];
      [(GKLoadResourceOperation *)self didCompleteWithResource:0 error:v17];
    }
    else
    {
      v16 = [(GKLoadContactResourceOperation *)self monogrammer];
      v20 = v12;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __38__GKLoadContactResourceOperation_main__block_invoke;
      v19[3] = &unk_1E5F62ED8;
      v19[4] = self;
      id v18 = (id)[v16 renderAvatarsForContacts:v17 handler:v19];
    }

    goto LABEL_8;
  }
}

void __38__GKLoadContactResourceOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 objectAtIndex:0];

  if (v3)
  {
    uint64_t v4 = [v8 objectAtIndex:0];
    +[GKLoadContactResourceOperation mainScreenScale];
    uint64_t v6 = objc_msgSend(v4, "imageForSize:scale:", 300.0, 300.0, v5);
    [*(id *)(a1 + 32) didCompleteWithResource:v6 error:0];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v4 = [v7 makeFetchError];
    [v7 didCompleteWithResource:0 error:v4];
  }
}

- (id)imageCreationError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [(GKLoadContactResourceOperation *)self contactId];
  uint64_t v4 = [v2 stringWithFormat:@"Unable to create photo with Id: %@", v3];

  double v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"GKLoadContactResourceOperationErrorDomain" code:560557415 userInfo:v6];

  return v7;
}

- (id)makeFetchError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [(GKLoadContactResourceOperation *)self contactId];
  uint64_t v4 = [v2 stringWithFormat:@"Unable to contact photo with Id: %@", v3];

  double v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"GKLoadContactResourceOperationErrorDomain" code:560557415 userInfo:v6];

  return v7;
}

+ (double)mainScreenScale
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [MEMORY[0x1E4FB1BA8] screens];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__GKLoadContactResourceOperation_mainScreenScale__block_invoke;
  v5[3] = &unk_1E5F62F00;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__GKLoadContactResourceOperation_mainScreenScale__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 scale];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v4 > *(double *)(v5 + 24)) {
    *(double *)(v5 + 24) = v4;
  }
  return result;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (CNAvatarImageRenderer)monogrammer
{
  return self->_monogrammer;
}

- (void)setMonogrammer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);

  objc_storeStrong((id *)&self->_contactId, 0);
}

@end