@interface MPCPlayerChangeRequest
+ (id)requestWithCommandRequests:(id)a3;
+ (void)performRequest:(id)a3 completion:(id)a4;
+ (void)performRequest:(id)a3 extendedStatusCompletion:(id)a4;
+ (void)performRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
+ (void)performRequest:(id)a3 options:(unint64_t)a4 extendedStatusCompletion:(id)a5;
- (MPCPlayerChangeRequest)initWithCommandRequests:(id)a3;
- (NSArray)commands;
- (id)description;
- (unint64_t)options;
- (void)performWithCompletion:(id)a3;
- (void)performWithExtendedStatusCompletion:(id)a3;
- (void)setCommands:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation MPCPlayerChangeRequest

- (void).cxx_destruct
{
}

- (void)setCommands:(id)a3
{
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)performWithExtendedStatusCompletion:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(NSArray *)self->_commands count])
  {
    v42 = v5;
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21BB87000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PlayerChangeRequest", "", buf, 2u);
    }

    [MEMORY[0x263EFF910] date];
    v45 = self;
    v46 = (MPCPlayerCommandStatus *)objc_claimAutoreleasedReturnValue();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v10 = self->_commands;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v57;
      while (1)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v57 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v56 + 1) + 8 * v15);
          v17 = [v16 playerPath];
          if (v17
            || ([v16 controller],
                v18 = objc_claimAutoreleasedReturnValue(),
                [v18 resolvedPlayerPath],
                v17 = objc_claimAutoreleasedReturnValue(),
                v18,
                v17))
          {
            if (v13) {
              goto LABEL_14;
            }
LABEL_13:
            id v13 = v17;
            goto LABEL_14;
          }
          v20 = [MEMORY[0x263F08690] currentHandler];
          [v20 handleFailureInMethod:a2, v45, @"MPCPlayerChangeRequest.m", 143, @"Cannot perform command request without a player path [not on request, or fallback from controller] request=%@", v16 object file lineNumber description];

          v17 = 0;
          if (!v13) {
            goto LABEL_13;
          }
LABEL_14:
          if (([v13 isEqual:v17] & 1) == 0)
          {
            v19 = [MEMORY[0x263F08690] currentHandler];
            [v19 handleFailureInMethod:a2 object:v45 file:@"MPCPlayerChangeRequest.m" lineNumber:146 description:@"All requests must have the same player path."];
          }
          ++v15;
        }
        while (v12 != v15);
        uint64_t v21 = [(NSArray *)v10 countByEnumeratingWithState:&v56 objects:v61 count:16];
        uint64_t v12 = v21;
        if (!v21) {
          goto LABEL_27;
        }
      }
    }
    id v13 = 0;
LABEL_27:

    __int16 v27 = [(MPCPlayerChangeRequest *)v45 options];
    id v28 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v28 setQualityOfService:25];
    __int16 v44 = v27;
    if ((v27 & 0x100) != 0) {
      uint64_t v29 = -1;
    }
    else {
      uint64_t v29 = 1;
    }
    [v28 setMaxConcurrentOperationCount:v29];
    v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v45->_commands, "count"));
    v31 = (void *)MEMORY[0x263F086D0];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke;
    v51[3] = &unk_2643C21B0;
    id v54 = v42;
    id v32 = v30;
    id v52 = v32;
    os_signpost_id_t v55 = v7;
    id v33 = v28;
    id v53 = v33;
    v34 = [v31 blockOperationWithBlock:v51];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obj = v45->_commands;
    uint64_t v35 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      v37 = 0;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(obj);
          }
          v40 = [[MPCMediaRemoteCommandOperation alloc] initWithCommandRequest:*(void *)(*((void *)&v47 + 1) + 8 * i) options:[(MPCPlayerChangeRequest *)v45 options] sendDate:v46];
          [v32 addObject:v40];
          [v34 addDependency:v40];
          if ((v44 & 0x100) == 0)
          {
            if (v37) {
              [(MPCMediaRemoteCommandOperation *)v40 addDependency:v37];
            }
            v41 = v40;

            v37 = v41;
          }
          [v33 addOperation:v40];
        }
        uint64_t v36 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v36);
    }
    else
    {
      v37 = 0;
    }

    [v33 addOperation:v34];
    id v5 = v42;
    goto LABEL_44;
  }
  v22 = [MPCPlayerCommandStatus alloc];
  v23 = (void *)MEMORY[0x263F121D0];
  v24 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCPlayerRequestError", 1002, @"No commands provided.");
  v25 = [v23 statusWithCode:200 error:v24];
  v46 = [(MPCPlayerCommandStatus *)v22 initWithMPStatus:v25 request:0];

  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v46;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_ERROR, "[PCR] performWithExtendedStatusCompletion: | failed to perform command [no commands provided] status=%{public}@", buf, 0xCu);
  }

  if (v5)
  {
    v62 = v46;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
    (*((void (**)(id, id))v5 + 2))(v5, v13);
LABEL_44:
  }
}

void __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "msv_map:", &__block_literal_global_45);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
  v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21BB87000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PlayerChangeRequest", "", buf, 2u);
  }

  v6 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke_46;
  block[3] = &unk_2643C5FC8;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __62__MPCPlayerChangeRequest_performWithExtendedStatusCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 status];
}

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__MPCPlayerChangeRequest_performWithCompletion___block_invoke;
  v6[3] = &unk_2643C56A8;
  id v7 = v4;
  id v5 = v4;
  [(MPCPlayerChangeRequest *)self performWithExtendedStatusCompletion:v6];
}

void __48__MPCPlayerChangeRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    v3 = objc_msgSend(a2, "msv_firstWhere:", &__block_literal_global_7168);
    id v4 = [v3 error];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

BOOL __48__MPCPlayerChangeRequest_performWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_commands;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = MPCRemoteCommandDescriptionCopy([*(id *)(*((void *)&v15 + 1) + 8 * i) command]);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v3 componentsJoinedByString:@", "];
  id v13 = [v10 stringWithFormat:@"<%@: %p commands=(%@)>", v11, self, v12];

  return v13;
}

- (MPCPlayerChangeRequest)initWithCommandRequests:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCPlayerChangeRequest;
  uint64_t v5 = [(MPCPlayerChangeRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    commands = v5->_commands;
    v5->_commands = (NSArray *)v6;
  }
  return v5;
}

+ (id)requestWithCommandRequests:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithCommandRequests:v4];

  return v5;
}

+ (void)performRequest:(id)a3 options:(unint64_t)a4 extendedStatusCompletion:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v15[0] = v8;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    uint64_t v11 = [a1 requestWithCommandRequests:v10];
  }
  else
  {
    uint64_t v11 = [a1 requestWithCommandRequests:MEMORY[0x263EFFA68]];
  }
  [v11 setOptions:a4];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__MPCPlayerChangeRequest_performRequest_options_extendedStatusCompletion___block_invoke;
  v13[3] = &unk_2643C56A8;
  id v14 = v9;
  id v12 = v9;
  [v11 performWithExtendedStatusCompletion:v13];
}

void __74__MPCPlayerChangeRequest_performRequest_options_extendedStatusCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

+ (void)performRequest:(id)a3 extendedStatusCompletion:(id)a4
{
}

+ (void)performRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__MPCPlayerChangeRequest_performRequest_options_completion___block_invoke;
  v10[3] = &unk_2643C0748;
  id v11 = v8;
  id v9 = v8;
  [a1 performRequest:a3 options:a4 extendedStatusCompletion:v10];
}

void __60__MPCPlayerChangeRequest_performRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

+ (void)performRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__MPCPlayerChangeRequest_performRequest_completion___block_invoke;
  v8[3] = &unk_2643C0748;
  id v9 = v6;
  id v7 = v6;
  [a1 performRequest:a3 options:0 extendedStatusCompletion:v8];
}

void __52__MPCPlayerChangeRequest_performRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

@end