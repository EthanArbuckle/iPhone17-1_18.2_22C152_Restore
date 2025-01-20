@interface LPFaceTimeInviteMetadataProviderSpecialization
+ (id)specializedMetadataProviderForURLWithContext:(id)a3;
+ (unint64_t)specialization;
- (void)completeWithMetadata:(id)a3;
- (void)start;
@end

@implementation LPFaceTimeInviteMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 1024;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3 = a3;
  v4 = [v3 postRedirectURL];
  int v5 = objc_msgSend(v4, "_lp_isFaceTimeInviteURL");

  if (v5) {
    v6 = [(LPMetadataProviderSpecialization *)[LPFaceTimeInviteMetadataProviderSpecialization alloc] initWithContext:v3];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)start
{
  id v8 = [(LPMetadataProviderSpecialization *)self context];
  id v3 = [v8 originalURL];
  char v4 = objc_msgSend(v3, "_lp_isFaceTimeInviteURL");

  if (v4)
  {
    v9 = objc_alloc_init(LPFaceTimeInviteMetadata);
    int v5 = [(LPMetadataProviderSpecialization *)self context];
    v6 = [v5 originalURL];
    v7 = objc_msgSend(v6, "_lp_faceTimeInviteTitle");
    [(LPFaceTimeInviteMetadata *)v9 setTitle:v7];

    [(LPFaceTimeInviteMetadataProviderSpecialization *)self completeWithMetadata:v9];
  }
}

- (void)completeWithMetadata:(id)a3
{
  id v4 = a3;
  int v5 = [(LPMetadataProviderSpecialization *)self createMetadataWithSpecialization:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__LPFaceTimeInviteMetadataProviderSpecialization_completeWithMetadata___block_invoke;
  v7[3] = &unk_1E5B04E18;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __71__LPFaceTimeInviteMetadataProviderSpecialization_completeWithMetadata___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 metadataProviderSpecialization:*(void *)(a1 + 32) didCompleteWithMetadata:*(void *)(a1 + 40)];
}

@end