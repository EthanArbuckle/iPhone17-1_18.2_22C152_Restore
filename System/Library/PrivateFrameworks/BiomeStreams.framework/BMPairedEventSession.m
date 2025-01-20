@interface BMPairedEventSession
+ (id)openSessionsFromBookmark:(id)a3;
+ (id)sessionPublisherWithStreamPublisher:(id)a3 startingBlock:(id)a4 sessionKeyBlock:(id)a5 options:(unint64_t)a6;
- (BMPairedEventSession)initWithKey:(id)a3 startEvent:(id)a4 endEvent:(id)a5;
- (BMStoreEvent)endEvent;
- (BMStoreEvent)startEvent;
@end

@implementation BMPairedEventSession

- (BMPairedEventSession)initWithKey:(id)a3 startEvent:(id)a4 endEvent:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v9;
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v11;
  v12 = v10;
  if (!v10)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v16.receiver = self;
  v16.super_class = (Class)BMPairedEventSession;
  v14 = [(BMEventSession *)&v16 initWithKey:v8 events:v13];

  if (!v10)
  {

    if (v9) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v9) {
    goto LABEL_9;
  }
LABEL_7:

  return v14;
}

- (BMStoreEvent)startEvent
{
  v3 = [(NSArray *)self->super._events objectAtIndexedSubscript:0];
  v4 = [MEMORY[0x1E4F1CA98] null];
  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->super._events objectAtIndexedSubscript:0];
  }

  return (BMStoreEvent *)v5;
}

- (BMStoreEvent)endEvent
{
  v3 = [(NSArray *)self->super._events objectAtIndexedSubscript:1];
  v4 = [MEMORY[0x1E4F1CA98] null];
  if (v3 == v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->super._events objectAtIndexedSubscript:1];
  }

  return (BMStoreEvent *)v5;
}

+ (id)sessionPublisherWithStreamPublisher:(id)a3 startingBlock:(id)a4 sessionKeyBlock:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ((a6 & 2) != 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"BMEventSession.m", 168, @"Invalid parameter not satisfying: %@", @"(options & BMIncludeRepeatedStartEvent) == NO" object file lineNumber description];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke;
  v22[3] = &unk_1E55D8228;
  id v14 = v12;
  id v23 = v14;
  v15 = +[BMEventSession sessionPublisherWithStreamPublisher:v11 startingBlock:v14 endingBlock:v22 sessionKeyBlock:v13 options:a6];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke_2;
  v20[3] = &unk_1E55D8250;
  id v21 = v14;
  id v16 = v14;
  v17 = [v15 mapWithTransform:v20];

  return v17;
}

uint64_t __98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

BMPairedEventSession *__98__BMPairedEventSession_sessionPublisherWithStreamPublisher_startingBlock_sessionKeyBlock_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 events];
  uint64_t v5 = [v4 count];

  if (v5 == 2)
  {
    v6 = [BMPairedEventSession alloc];
    v7 = [v3 key];
    id v8 = [v3 events];
    id v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = [v3 events];
    id v11 = [v10 objectAtIndexedSubscript:1];
    id v12 = [(BMPairedEventSession *)v6 initWithKey:v7 startEvent:v9 endEvent:v11];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = [v3 events];
    v15 = [v14 objectAtIndexedSubscript:0];
    int v16 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

    v17 = [BMPairedEventSession alloc];
    v7 = [v3 key];
    id v8 = [v3 events];
    id v9 = [v8 objectAtIndexedSubscript:0];
    if (v16)
    {
      v18 = v9;
      v19 = 0;
    }
    else
    {
      v18 = 0;
      v19 = v9;
    }
    id v12 = [(BMPairedEventSession *)v17 initWithKey:v7 startEvent:v18 endEvent:v19];
  }

  return v12;
}

+ (id)openSessionsFromBookmark:(id)a3
{
  id v3 = [a3 upstreams];
  v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = +[BMEventSession openSessionsFromBookmark:v4];

  v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_63_0);

  return v6;
}

BMPairedEventSession *__49__BMPairedEventSession_openSessionsFromBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [BMPairedEventSession alloc];
  v4 = [v2 key];
  uint64_t v5 = [v2 events];

  v6 = [v5 firstObject];
  v7 = [(BMPairedEventSession *)v3 initWithKey:v4 startEvent:v6 endEvent:0];

  return v7;
}

@end