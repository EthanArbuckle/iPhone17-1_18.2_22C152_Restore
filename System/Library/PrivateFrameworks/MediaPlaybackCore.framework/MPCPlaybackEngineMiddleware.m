@interface MPCPlaybackEngineMiddleware
- (MPCPlaybackEngine)playbackEngine;
- (NSArray)invalidationObservers;
- (id)_stateDumpObject;
- (id)operationsForPlayerRequest:(id)a3;
- (id)operationsForRequest:(id)a3;
- (id)playerVideoView:(id)a3 chain:(id)a4;
- (id)videoOutput:(id)a3 chain:(id)a4;
- (void)setInvalidationObservers:(id)a3;
- (void)setPlaybackEngine:(id)a3;
@end

@implementation MPCPlaybackEngineMiddleware

- (void)setInvalidationObservers:(id)a3
{
}

- (id)playerVideoView:(id)a3 chain:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 nextObject];
  v8 = [v7 playerVideoView:v5 chain:v6];

  return v8;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackEngine, 0);

  objc_storeStrong((id *)&self->_invalidationObservers, 0);
}

- (id)videoOutput:(id)a3 chain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MPCPlaybackEngineMiddleware *)self playbackEngine];

  v9 = v6;
  if (v8)
  {
    v10 = [(MPCPlaybackEngineMiddleware *)self playbackEngine];
    v11 = [v10 player];
    v12 = [v11 currentItem];
    uint64_t v13 = [v12 type];

    v9 = v6;
    if (v13 == 2)
    {
      v14 = [(MPCPlaybackEngineMiddleware *)self playbackEngine];
      v9 = [v14 videoOutput];
    }
  }
  v15 = [v7 nextObject];
  v16 = [v15 videoOutput:v9 chain:v7];

  return v16;
}

- (MPCPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (id)operationsForRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MPCPlaybackEngineMiddleware *)self operationsForPlayerRequest:v4];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)operationsForPlayerRequest:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[MPCPlaybackEngineMiddlewareOperation alloc] initWithMiddleware:self playerRequest:v4];

  v8[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (NSArray)invalidationObservers
{
  return self->_invalidationObservers;
}

- (id)_stateDumpObject
{
  v13[3] = *MEMORY[0x263EF8340];
  v12[0] = @"_obj";
  v3 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v13[0] = v3;
  v12[1] = @"playbackEngine";
  uint64_t v4 = [(MPCPlaybackEngineMiddleware *)self playbackEngine];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = @"<NULL>";
  }
  v13[1] = v6;
  v12[2] = @"invalidationObservers";
  uint64_t v7 = [(MPCPlaybackEngineMiddleware *)self invalidationObservers];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"<NULL>";
  }
  v13[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

@end