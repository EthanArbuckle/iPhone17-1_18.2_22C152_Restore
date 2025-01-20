@interface MPCAssistantCommand
- (void)sendCommand:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendCommandWithResult:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendPlaybackArchive:(id)a3 toDestination:(id)a4 completion:(id)a5;
- (void)sendPlaybackArchive:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 completion:(id)a5;
- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendPlaybackQueue:(id)a3 toDestination:(id)a4 completion:(id)a5;
- (void)sendPlaybackQueue:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 completion:(id)a5;
- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6;
@end

@implementation MPCAssistantCommand

- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(MPCAssistantCommandInternal);
  [(MPCAssistantCommandInternal *)v13 sendPlaybackArchiveWithResult:v12 toDestination:v11 withOptions:v10 completion:v9];
}

- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(MPCAssistantCommandInternal);
  [(MPCAssistantCommandInternal *)v13 sendPlaybackQueueWithResult:v12 toDestination:v11 withOptions:v10 completion:v9];
}

- (void)sendCommandWithResult:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_alloc_init(MPCAssistantCommandInternal);
  [(MPCAssistantCommandInternal *)v12 sendCommandWithResult:v8 toDestination:v11 withOptions:v10 completion:v9];
}

- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 completion:(id)a5
{
}

- (void)sendPlaybackArchive:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__MPCAssistantCommand_sendPlaybackArchive_toDestination_withOptions_completion___block_invoke;
  v12[3] = &unk_2643C5B28;
  id v13 = v10;
  id v11 = v10;
  [(MPCAssistantCommand *)self sendPlaybackArchiveWithResult:a3 toDestination:a4 withOptions:a5 completion:v12];
}

void __80__MPCAssistantCommand_sendPlaybackArchive_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 error];
  v4 = [v3 returnStatuses];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)sendPlaybackArchive:(id)a3 toDestination:(id)a4 completion:(id)a5
{
}

- (void)sendPlaybackQueue:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__MPCAssistantCommand_sendPlaybackQueue_toDestination_withOptions_completion___block_invoke;
  v12[3] = &unk_2643C5B28;
  id v13 = v10;
  id v11 = v10;
  [(MPCAssistantCommand *)self sendPlaybackQueueWithResult:a3 toDestination:a4 withOptions:a5 completion:v12];
}

void __78__MPCAssistantCommand_sendPlaybackQueue_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 error];
  v4 = [v3 returnStatuses];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 completion:(id)a5
{
}

- (void)sendPlaybackQueue:(id)a3 toDestination:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__MPCAssistantCommand_sendPlaybackQueue_toDestination_completion___block_invoke;
  v10[3] = &unk_2643C5B28;
  id v11 = v8;
  id v9 = v8;
  [(MPCAssistantCommand *)self sendPlaybackQueueWithResult:a3 toDestination:a4 completion:v10];
}

void __66__MPCAssistantCommand_sendPlaybackQueue_toDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 error];
  v4 = [v3 returnStatuses];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)sendCommand:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__MPCAssistantCommand_sendCommand_toDestination_withOptions_completion___block_invoke;
  v12[3] = &unk_2643C5B28;
  id v13 = v10;
  id v11 = v10;
  [(MPCAssistantCommand *)self sendCommandWithResult:v8 toDestination:a4 withOptions:a5 completion:v12];
}

void __72__MPCAssistantCommand_sendCommand_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 error];
  v4 = [v3 returnStatuses];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

@end