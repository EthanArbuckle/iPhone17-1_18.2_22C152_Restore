@interface BMEventSession
+ (BOOL)supportsSecureCoding;
+ (id)openSessionsFromBookmark:(id)a3;
+ (id)sessionPublisherWithStreamPublisher:(id)a3 startingBlock:(id)a4 endingBlock:(id)a5 sessionKeyBlock:(id)a6 options:(unint64_t)a7;
- (BMEventSession)initWithCoder:(id)a3;
- (BMEventSession)initWithKey:(id)a3 events:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)events;
- (NSCopying)key;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMEventSession

- (BMEventSession)initWithKey:(id)a3 events:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMEventSession;
  v9 = [(BMEventSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_storeStrong((id *)&v10->_events, a4);
  }

  return v10;
}

- (NSArray)events
{
  return (NSArray *)[(NSArray *)self->_events _pas_filteredArrayWithTest:&__block_literal_global_15];
}

BOOL __24__BMEventSession_events__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CA98];
  id v3 = a2;
  id v4 = [v2 null];

  return v4 != v3;
}

+ (id)sessionPublisherWithStreamPublisher:(id)a3 startingBlock:(id)a4 endingBlock:(id)a5 sessionKeyBlock:(id)a6 options:(unint64_t)a7
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a3;
  v15 = objc_opt_new();
  v28[0] = v15;
  v28[1] = MEMORY[0x1E4F1CBF0];
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__BMEventSession_sessionPublisherWithStreamPublisher_startingBlock_endingBlock_sessionKeyBlock_options___block_invoke;
  v23[3] = &unk_1E55D81E0;
  id v24 = v13;
  id v25 = v11;
  id v26 = v12;
  unint64_t v27 = a7;
  id v17 = v12;
  id v18 = v11;
  id v19 = v13;
  v20 = [v14 scanWithInitial:v16 nextPartialResult:v23];

  v21 = [v20 flatMapWithTransform:&__block_literal_global_7_0];

  return v21;
}

id __104__BMEventSession_sessionPublisherWithStreamPublisher_startingBlock_endingBlock_sessionKeyBlock_options___block_invoke(void *a1, void *a2, void *a3)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 objectAtIndexedSubscript:0];
  id v7 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v8 = a1[4];
  if (v8)
  {
    uint64_t v9 = (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);

    id v7 = (void *)v9;
  }
  int v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
  int v11 = (*(uint64_t (**)(void))(a1[6] + 16))();
  id v12 = [v6 objectForKeyedSubscript:v7];
  id v13 = v12;
  if (v10)
  {
    if (!v12)
    {
      v15 = [BMEventSession alloc];
      id v37 = v5;
      v16 = (void *)MEMORY[0x1E4F1C978];
      id v17 = &v37;
      goto LABEL_21;
    }
    uint64_t v14 = a1[7];
    if ((v14 & 1) == 0)
    {
      if ((v14 & 2) == 0)
      {
        if ((v14 & 4) == 0)
        {
          v15 = [BMEventSession alloc];
          id v38 = v5;
          v16 = (void *)MEMORY[0x1E4F1C978];
          id v17 = &v38;
LABEL_21:
          id v24 = [v16 arrayWithObjects:v17 count:1];
          id v25 = (void *)[v24 mutableCopy];
          id v26 = [(BMEventSession *)v15 initWithKey:v7 events:v25];
          [v6 setObject:v26 forKeyedSubscript:v7];

          goto LABEL_22;
        }
        id v18 = v12;
        v28 = [BMEventSession alloc];
        v39[0] = v5;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
        v30 = (void *)[v29 mutableCopy];
        v31 = [(BMEventSession *)v28 initWithKey:v7 events:v30];
        [v6 setObject:v31 forKeyedSubscript:v7];

LABEL_12:
        v33 = v18;
        v34[0] = v6;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        v34[1] = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];

        goto LABEL_23;
      }
LABEL_14:
      [v12[1] addObject:v5];
    }
  }
  else
  {
    if (v11)
    {
      if (v12)
      {
        [v12[1] addObject:v5];
        [v6 removeObjectForKey:v7];
        id v18 = v13;
      }
      else
      {
        if ((a1[7] & 4) == 0) {
          goto LABEL_22;
        }
        v21 = [BMEventSession alloc];
        id v36 = v5;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        v23 = (void *)[v22 mutableCopy];
        id v18 = [(BMEventSession *)v21 initWithKey:v7 events:v23];

        if (!v18) {
          goto LABEL_22;
        }
      }
      goto LABEL_12;
    }
    if (v12) {
      goto LABEL_14;
    }
    if ((a1[7] & 4) != 0)
    {
      v15 = [BMEventSession alloc];
      id v35 = v5;
      v16 = (void *)MEMORY[0x1E4F1C978];
      id v17 = &v35;
      goto LABEL_21;
    }
  }
LABEL_22:
  v32[0] = v6;
  v32[1] = MEMORY[0x1E4F1CBF0];
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v18 = 0;
LABEL_23:

  return v20;
}

id __104__BMEventSession_sessionPublisherWithStreamPublisher_startingBlock_endingBlock_sessionKeyBlock_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectAtIndexedSubscript:1];
  id v3 = [v2 bpsPublisher];

  return v3;
}

+ (id)openSessionsFromBookmark:(id)a3
{
  id v3 = [a3 upstreams];
  id v4 = [v3 objectAtIndexedSubscript:0];

  id v5 = [v4 value];
  v6 = [v5 objectAtIndexedSubscript:0];

  id v7 = [v6 allValues];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"key"];
  [v5 encodeObject:self->_events forKey:@"events"];
}

- (BMEventSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"key"];
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"events"];

  int v10 = [(BMEventSession *)self initWithKey:v5 events:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4[2] isEqual:self->_key]) {
    char v5 = [v4[1] isEqualToArray:self->_events];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (NSCopying)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end