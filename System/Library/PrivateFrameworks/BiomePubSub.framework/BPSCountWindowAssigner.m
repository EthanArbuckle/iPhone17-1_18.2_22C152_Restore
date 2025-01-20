@interface BPSCountWindowAssigner
- (BPSCountWindowAssigner)initWithCapacity:(unint64_t)a3 aggregator:(id)a4;
- (id)assignWindow:(id)a3 input:(id)a4;
- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4;
@end

@implementation BPSCountWindowAssigner

- (BPSCountWindowAssigner)initWithCapacity:(unint64_t)a3 aggregator:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BPSCountWindowAssigner;
  v8 = [(BPSCountWindowAssigner *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_capacity = a3;
    objc_storeStrong((id *)&v8->_aggregator, a4);
    v9->_identifier = 0;
  }

  return v9;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      if ([v10 currentCount] < self->_capacity) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    objc_super v11 = v10;

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v12 = [BPSCountWindow alloc];
  unint64_t capacity = self->_capacity;
  aggregator = self->_aggregator;
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
  objc_super v11 = [(BPSCountWindow *)v12 initWithCapacity:capacity aggregator:aggregator identifier:v15];

  ++self->_identifier;
LABEL_12:
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];

  return v16;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      unint64_t v15 = [v14 currentCount];
      if (v15 < [v14 capacity]) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v16 = v14;

    if (v16) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v17 = [BPSCountWindowState alloc];
  unint64_t capacity = self->_capacity;
  long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
  long long v20 = [(BPSAggregator *)self->_aggregator accumulator];
  v16 = [(BPSCountWindowState *)v17 initWithCapacity:capacity currentCount:0 identifier:v19 aggregate:v20 completed:0];

  [v8 addObject:v16];
  ++self->_identifier;
  if (v16)
  {
LABEL_12:
    unint64_t v21 = [(BPSCountWindowState *)v16 currentCount];
    if (v21 < [(BPSCountWindowState *)v16 capacity])
    {
      [(BPSCountWindowState *)v16 setCurrentCount:[(BPSCountWindowState *)v16 currentCount] + 1];
      v22 = [(BPSAggregator *)self->_aggregator closure];
      uint64_t v23 = [(BPSWindowState *)v16 aggregate];
      v24 = ((void (**)(void, void *, id))v22)[2](v22, v23, v7);
      [(BPSWindowState *)v16 setAggregate:v24];

      unint64_t v25 = [(BPSCountWindowState *)v16 currentCount];
      if (v25 >= [(BPSCountWindowState *)v16 capacity]) {
        [(BPSWindowState *)v16 setCompleted:1];
      }
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end