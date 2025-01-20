@interface ASKLoadContactResourceOperation
+ (double)mainScreenScale;
+ (id)supportedScheme;
- (ASKLoadContactResourceOperation)initWithContactId:(id)a3;
- (ASKLoadContactResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4;
- (CNAvatarImageRenderer)monogrammer;
- (NSString)contactId;
- (id)makeFetchError;
- (id)makePlatformUnsupportedError;
- (void)main;
- (void)setMonogrammer:(id)a3;
@end

@implementation ASKLoadContactResourceOperation

- (ASKLoadContactResourceOperation)initWithURLRequest:(id)a3 dataConsumer:(id)a4
{
  v5 = [a3 URL];
  v6 = [v5 host];
  v7 = [v6 stringByRemovingPercentEncoding];

  v8 = [(ASKLoadContactResourceOperation *)self initWithContactId:v7];
  return v8;
}

- (ASKLoadContactResourceOperation)initWithContactId:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASKLoadContactResourceOperation;
  v5 = [(ASKLoadContactResourceOperation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contactId = v5->_contactId;
    v5->_contactId = (NSString *)v6;

    v8 = (CNAvatarImageRenderer *)objc_alloc_init(MEMORY[0x1E4F1BB20]);
    monogrammer = v5->_monogrammer;
    v5->_monogrammer = v8;
  }
  return v5;
}

+ (id)supportedScheme
{
  return @"contactimage";
}

- (void)main
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (([(ASKLoadContactResourceOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    uint64_t v4 = *MEMORY[0x1E4F1AE28];
    v23[0] = v3;
    v23[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4F1AE20];
    uint64_t v24 = *MEMORY[0x1E4F1AF98];
    uint64_t v25 = v5;
    uint64_t v6 = *MEMORY[0x1E4F1ADF0];
    uint64_t v26 = v24;
    uint64_t v27 = v6;
    uint64_t v7 = *MEMORY[0x1E4F1AFA8];
    uint64_t v28 = *MEMORY[0x1E4F1ADE0];
    uint64_t v29 = v7;
    uint64_t v8 = *MEMORY[0x1E4F1AEE0];
    uint64_t v30 = *MEMORY[0x1E4F1ADC8];
    uint64_t v31 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:10];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    objc_super v11 = [(ASKLoadContactResourceOperation *)self contactId];
    id v21 = 0;
    v12 = [v10 unifiedContactWithIdentifier:v11 keysToFetch:v9 error:&v21];
    id v13 = v21;

    if (v13 || !v12)
    {
      [(ASKLoadResourceOperation *)self didCompleteWithResource:0 error:v13];
    }
    else
    {
      v14 = [v12 imageData];

      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4FB1818]);
        v16 = [v12 imageData];
        v17 = (void *)[v15 initWithData:v16];

        [(ASKLoadResourceOperation *)self didCompleteWithResource:v17 error:0];
      }
      else
      {
        v17 = [(ASKLoadContactResourceOperation *)self monogrammer];
        v22 = v12;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __39__ASKLoadContactResourceOperation_main__block_invoke;
        v20[3] = &unk_1E6DA89D8;
        v20[4] = self;
        id v19 = (id)[v17 renderAvatarsForContacts:v18 handler:v20];
      }
    }
  }
}

void __39__ASKLoadContactResourceOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 objectAtIndex:0];

  if (v3)
  {
    uint64_t v4 = [v8 objectAtIndex:0];
    +[ASKLoadContactResourceOperation mainScreenScale];
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

- (id)makeFetchError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [(ASKLoadContactResourceOperation *)self contactId];
  uint64_t v4 = [v2 stringWithFormat:@"Unable to contact photo with Id: %@", v3];

  double v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"ASKLoadContactResourceOperationErrorDomain" code:560557415 userInfo:v6];

  return v7;
}

- (id)makePlatformUnsupportedError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [(ASKLoadContactResourceOperation *)self contactId];
  uint64_t v4 = [v2 stringWithFormat:@"Unable to contact photo with Id: %@. This platform is not currently supported, see code comments in ASKLoadContactResourceOperation for more information", v3];

  double v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"ASKLoadContactResourceOperationErrorDomain" code:560557415 userInfo:v6];

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
  v5[2] = __50__ASKLoadContactResourceOperation_mainScreenScale__block_invoke;
  v5[3] = &unk_1E6DA8A00;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__ASKLoadContactResourceOperation_mainScreenScale__block_invoke(uint64_t a1, void *a2)
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