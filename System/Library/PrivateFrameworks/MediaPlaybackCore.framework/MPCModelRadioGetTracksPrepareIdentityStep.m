@interface MPCModelRadioGetTracksPrepareIdentityStep
- (id)nextStepWithIdentityProperties:(id)a3 delegatedIdentityProperties:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MPCModelRadioGetTracksPrepareIdentityStep

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__29888;
  v26[4] = __Block_byref_object_dispose__29889;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__29888;
  v24[4] = __Block_byref_object_dispose__29889;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__29888;
  v22[4] = __Block_byref_object_dispose__29889;
  id v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  v5 = dispatch_group_create();
  v6 = dispatch_queue_create("com.apple.MediaPlaybackCore.MPCModelRadioGetTracksPrepareIdentityStep", 0);
  v7 = [(ICRadioGetTracksRequest *)self->super._request requestContext];
  v8 = [v7 identityStore];
  dispatch_group_enter(v5);
  v9 = [v7 identity];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke;
  v19[3] = &unk_2643C53A0;
  v19[4] = v5;
  v19[5] = v6;
  v19[6] = v7;
  v19[7] = v22;
  v19[8] = v24;
  v19[9] = v20;
  [v8 getPropertiesForUserIdentity:v9 completionHandler:v19];

  v10 = [v7 delegatedIdentity];
  if (v10)
  {
    dispatch_group_enter(v5);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_2643C53A0;
    v18[4] = v5;
    v18[5] = v6;
    v18[6] = v7;
    v18[7] = v26;
    v18[8] = v24;
    v18[9] = v20;
    [v8 getPropertiesForUserIdentity:v10 completionHandler:v18];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_5;
  v12[3] = &unk_2643C53C8;
  v12[4] = self;
  id v13 = v4;
  v14 = v20;
  v15 = v24;
  v16 = v22;
  v17 = v26;
  id v11 = v4;
  dispatch_group_notify(v5, v6, v12);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_2643C5378;
  id v13 = v5;
  id v14 = v6;
  long long v9 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_group_async(v7, v8, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(NSObject **)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_4;
  v12[3] = &unk_2643C5378;
  id v13 = v5;
  id v14 = v6;
  long long v9 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 48);
  long long v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_group_async(v7, v8, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[5];
  int v3 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
  id v4 = (void *)a1[4];
  if (v3) {
    [v4 nextStepWithIdentityProperties:*(void *)(*(void *)(a1[8] + 8) + 40) delegatedIdentityProperties:*(void *)(*(void *)(a1[9] + 8) + 40)];
  }
  else {
  id v5 = [v4 nextStepWithError:*(void *)(*(void *)(a1[7] + 8) + 40)];
  }
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isDelegated];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    if (v3) {
      return;
    }
    id v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [v13 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x263F08608]];
    v7 = NSString;
    v8 = [*(id *)(a1 + 48) identity];
    long long v9 = [v7 stringWithFormat:@"Unable to get radio tracks [invalid delegate user identity] - userIdentity=%@ - properties%@", v8, *(void *)(a1 + 32)];
    [v13 setObject:v9 forKeyedSubscript:*MEMORY[0x263F07F80]];

    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7400 userInfo:v13];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v6 = v13;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

void __74__MPCModelRadioGetTracksPrepareIdentityStep_performWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = v2;
    id v5 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v4;
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [v12 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x263F08608]];
    id v6 = NSString;
    v7 = [*(id *)(a1 + 48) identity];
    v8 = [v6 stringWithFormat:@"Unable to get radio tracks [invalid user identity] - userIdentity=%@ - properties%@", v7, *(void *)(a1 + 32)];
    [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x263F07F80]];

    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7400 userInfo:v12];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    id v5 = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

- (id)nextStepWithIdentityProperties:(id)a3 delegatedIdentityProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MPCModelRadioGetTracksStep *)[MPCModelRadioGetTracksRequestStep alloc] initWithPreviousStep:self];
  uint64_t v9 = [v6 copy];

  delegatedIdentityProperties = v8->super._delegatedIdentityProperties;
  v8->super._delegatedIdentityProperties = (ICUserIdentityProperties *)v9;

  uint64_t v11 = [v7 copy];
  identityProperties = v8->super._identityProperties;
  v8->super._identityProperties = (ICUserIdentityProperties *)v11;

  return v8;
}

@end