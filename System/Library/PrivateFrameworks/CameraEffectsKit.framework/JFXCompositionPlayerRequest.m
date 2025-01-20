@interface JFXCompositionPlayerRequest
+ (id)stringFromRequestType:(unint64_t)a3;
- (JFXCompositionPlayer)player;
- (JFXCompositionPlayerRequest)initWithBlock:(id)a3 ofType:(unint64_t)a4;
- (NSString)uniqueID;
- (double)queuedTime;
- (double)startTime;
- (id)block;
- (id)completionBlock;
- (id)description;
- (unint64_t)signPostID;
- (unint64_t)type;
- (void)didBegin;
- (void)didCancel;
- (void)didComplete;
- (void)didEnqueue;
- (void)setBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setQueuedTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation JFXCompositionPlayerRequest

- (JFXCompositionPlayerRequest)initWithBlock:(id)a3 ofType:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JFXCompositionPlayerRequest;
  v7 = [(JFXCompositionPlayerRequest *)&v14 init];
  if (v7)
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    uniqueID = v7->_uniqueID;
    v7->_uniqueID = (NSString *)v9;

    v7->_type = a4;
    uint64_t v11 = MEMORY[0x237DD15A0](v6);
    id block = v7->_block;
    v7->_id block = (id)v11;
  }
  return v7;
}

+ (id)stringFromRequestType:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 0;
  }
  else {
    return (id)*((void *)&off_264C0C690 + a3 - 1);
  }
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)JFXCompositionPlayerRequest;
  v4 = [(JFXCompositionPlayerRequest *)&v11 description];
  v5 = [(JFXCompositionPlayerRequest *)self uniqueID];
  id v6 = objc_msgSend((id)objc_opt_class(), "stringFromRequestType:", -[JFXCompositionPlayerRequest type](self, "type"));
  v7 = [(JFXCompositionPlayerRequest *)self player];
  v8 = [v7 displayName];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ id %@ type %@ player %@>", v4, v5, v6, v8];

  return v9;
}

- (void)didEnqueue
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = JFXPlaybackEventSignpostPointCategory();
  unint64_t v4 = [(JFXCompositionPlayerRequest *)self signPostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      int v6 = 138412290;
      v7 = self;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v3, OS_SIGNPOST_EVENT, v5, "PlayerRequest", "enqueue %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)didBegin
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = JFXPlaybackIntervalSignpostCategory();
  unint64_t v4 = [(JFXCompositionPlayerRequest *)self signPostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      int v6 = 138543362;
      v7 = self;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PlayerRequest", "Request %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)didComplete
{
  v3 = JFXPlaybackIntervalSignpostCategory();
  unint64_t v4 = [(JFXCompositionPlayerRequest *)self signPostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)int v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v3, OS_SIGNPOST_INTERVAL_END, v5, "PlayerRequest", "succeeded", v6, 2u);
    }
  }
}

- (void)didCancel
{
  v3 = JFXPlaybackIntervalSignpostCategory();
  unint64_t v4 = [(JFXCompositionPlayerRequest *)self signPostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)int v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_234C41000, v3, OS_SIGNPOST_INTERVAL_END, v5, "PlayerRequest", "cancelled", v6, 2u);
    }
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (double)queuedTime
{
  return self->_queuedTime;
}

- (void)setQueuedTime:(double)a3
{
  self->_queuedTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (JFXCompositionPlayer)player
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_player);
  return (JFXCompositionPlayer *)WeakRetained;
}

- (void)setPlayer:(id)a3
{
}

- (unint64_t)signPostID
{
  return self->_signPostID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_player);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end