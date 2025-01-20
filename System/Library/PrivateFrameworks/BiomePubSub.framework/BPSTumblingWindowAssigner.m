@interface BPSTumblingWindowAssigner
- (BPSTumblingWindowAssigner)initWithInterval:(double)a3 aggregator:(id)a4;
- (BPSTumblingWindowAssigner)initWithInterval:(double)a3 timestamp:(id)a4 aggregator:(id)a5;
- (id)assignWindow:(id)a3 input:(id)a4;
- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4;
@end

@implementation BPSTumblingWindowAssigner

- (BPSTumblingWindowAssigner)initWithInterval:(double)a3 aggregator:(id)a4
{
  return [(BPSTumblingWindowAssigner *)self initWithInterval:&__block_literal_global_2 timestamp:a4 aggregator:a3];
}

uint64_t __57__BPSTumblingWindowAssigner_initWithInterval_aggregator___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (BPSTumblingWindowAssigner)initWithInterval:(double)a3 timestamp:(id)a4 aggregator:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 <= 0.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"BPSTumblingWindowAssigner.m" lineNumber:30 description:@"Expecting interval to be greater than 0"];
  }
  v17.receiver = self;
  v17.super_class = (Class)BPSTumblingWindowAssigner;
  v11 = [(BPSTumblingWindowAssigner *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_interval = a3;
    uint64_t v13 = [v9 copy];
    id timestamp = v12->_timestamp;
    v12->_id timestamp = (id)v13;

    objc_storeStrong((id *)&v12->_aggregator, a5);
    v12->_identifier = 0;
  }

  return v12;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (*((void (**)(void))self->_timestamp + 2))();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
      uint64_t v13 = [v12 dateInterval];
      char v14 = [v13 containsDate:v6];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (v15) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_9:
  }
  [v6 timeIntervalSinceReferenceDate];
  if (v16 < 0.0) {
    double v16 = v16 + -1.0;
  }
  double interval = self->_interval;
  double v18 = interval * trunc(v16 / interval);
  double v19 = interval + -0.0001;
  v20 = [BPSTimeWindowProducer alloc];
  id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v18];
  v23 = (void *)[v21 initWithStartDate:v22 duration:v19];
  aggregator = self->_aggregator;
  v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
  v15 = [(BPSTimeWindowProducer *)v20 initWithDateInterval:v23 aggregator:aggregator identifier:v25];

  ++self->_identifier;
LABEL_14:
  v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];

  return v26;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v41 = a4;
  id v7 = (*((void (**)(void))self->_timestamp + 2))();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v44;
    do
    {
      uint64_t v13 = 0;
      uint64_t v42 = v10;
      do
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v8);
        }
        char v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
        v15 = [v14 dateInterval];
        int v16 = [v15 containsDate:v7];

        if (v16)
        {
          objc_super v17 = [(BPSAggregator *)self->_aggregator closure];
          double v18 = [v14 aggregate];
          ((void (**)(void, void *, id))v17)[2](v17, v18, v41);
          uint64_t v19 = v12;
          v20 = v11;
          id v21 = v7;
          id v22 = v8;
          v24 = v23 = self;
          [v14 setAggregate:v24];

          self = v23;
          id v8 = v22;
          id v7 = v21;

          uint64_t v11 = v14;
          uint64_t v12 = v19;
          uint64_t v10 = v42;
        }
        else
        {
          [v14 setCompleted:1];
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  v25 = objc_opt_new();
  if (!v11)
  {
    [v7 timeIntervalSinceReferenceDate];
    if (v26 < 0.0) {
      double v26 = v26 + -1.0;
    }
    double interval = self->_interval;
    double v28 = interval * trunc(v26 / interval);
    double v29 = interval + -0.0001;
    id v30 = objc_alloc(MEMORY[0x1E4F28C18]);
    long long v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v28];
    v32 = (void *)[v30 initWithStartDate:v31 duration:v29];

    uint64_t v33 = [BPSTimeWindowState alloc];
    v34 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
    v35 = [(BPSAggregator *)self->_aggregator accumulator];
    uint64_t v11 = [(BPSTimeWindowState *)v33 initWithDateInterval:v32 identifier:v34 aggregate:v35 completed:0];

    v36 = [(BPSAggregator *)self->_aggregator closure];
    v37 = [(BPSWindowState *)v11 aggregate];
    ((void (**)(void, void *, id))v36)[2](v36, v37, v41);
    v39 = v38 = self;
    [(BPSWindowState *)v11 setAggregate:v39];

    [v25 addObject:v11];
    ++v38->_identifier;
  }
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end