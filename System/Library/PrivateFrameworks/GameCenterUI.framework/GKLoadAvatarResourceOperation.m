@interface GKLoadAvatarResourceOperation
- (GKLoadAvatarResourceOperation)initWithPlayerId:(id)a3;
- (NSString)playerId;
- (id)makePlayerFetchError;
- (void)main;
@end

@implementation GKLoadAvatarResourceOperation

- (GKLoadAvatarResourceOperation)initWithPlayerId:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKLoadAvatarResourceOperation;
  v5 = [(GKLoadAvatarResourceOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playerId = v5->_playerId;
    v5->_playerId = (NSString *)v6;
  }
  return v5;
}

- (void)main
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (([(GKLoadAvatarResourceOperation *)self isCancelled] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v4 = [v3 profileServicePrivate];
    v5 = [(GKLoadAvatarResourceOperation *)self playerId];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__GKLoadAvatarResourceOperation_main__block_invoke;
    v7[3] = &unk_1E5F657B8;
    v7[4] = self;
    [v4 getProfilesForPlayerIDs:v6 handler:v7];
  }
}

void __37__GKLoadAvatarResourceOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      [*(id *)(a1 + 32) didCompleteWithResource:0 error:v6];
    }
    else
    {
      if ([v5 count]
        && ([v5 objectAtIndex:0],
            v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        v8 = [v5 objectAtIndex:0];
        objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F63788]) initWithInternalRepresentation:v8];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __37__GKLoadAvatarResourceOperation_main__block_invoke_2;
        v12[3] = &unk_1E5F65790;
        v12[4] = *(void *)(a1 + 32);
        id v13 = v9;
        id v10 = v9;
        [v10 loadPhotoForSize:1 withCompletionHandler:v12];
      }
      else
      {
        v11 = *(void **)(a1 + 32);
        v8 = [v11 makePlayerFetchError];
        [v11 didCompleteWithResource:0 error:v8];
      }
    }
  }
}

uint64_t __37__GKLoadAvatarResourceOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__GKLoadAvatarResourceOperation_main__block_invoke_3;
    v6[3] = &unk_1E5F65328;
    id v5 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    return [v5 monogramImageWithPhotoSize:1 handler:v6];
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    return [v3 didCompleteWithResource:a2 error:0];
  }
}

uint64_t __37__GKLoadAvatarResourceOperation_main__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didCompleteWithResource:a2 error:0];
}

- (id)makePlayerFetchError
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v3 = [(GKLoadAvatarResourceOperation *)self playerId];
  id v4 = [v2 stringWithFormat:@"Unable to load player with Id: %@", v3];

  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"GKLoadAvatarResourceOperationErrorDomain" code:560557415 userInfo:v6];

  return v7;
}

- (NSString)playerId
{
  return self->_playerId;
}

- (void).cxx_destruct
{
}

@end