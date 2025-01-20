@interface BPSSlidingWindowAssigner
- (BPSSlidingWindowAssigner)initWithInterval:(double)a3 slide:(double)a4 aggregator:(id)a5;
- (BPSSlidingWindowAssigner)initWithInterval:(double)a3 slide:(double)a4 timestamp:(id)a5 aggregator:(id)a6;
- (id)assignWindow:(id)a3 input:(id)a4;
- (id)assignWindowNonOverlappingIntervals:(id)a3 timestamp:(id)a4;
- (id)assignWindowOverlappingIntervals:(id)a3 timestamp:(id)a4;
- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4;
- (id)updateWindowStateNonOverlappingIntervals:(id)a3 timestamp:(id)a4 input:(id)a5;
- (id)updateWindowStateOverlappingIntervals:(id)a3 timestamp:(id)a4 input:(id)a5;
@end

@implementation BPSSlidingWindowAssigner

- (BPSSlidingWindowAssigner)initWithInterval:(double)a3 slide:(double)a4 aggregator:(id)a5
{
  return [(BPSSlidingWindowAssigner *)self initWithInterval:&__block_literal_global_9 slide:a5 timestamp:a3 aggregator:a4];
}

uint64_t __62__BPSSlidingWindowAssigner_initWithInterval_slide_aggregator___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (BPSSlidingWindowAssigner)initWithInterval:(double)a3 slide:(double)a4 timestamp:(id)a5 aggregator:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  if (a3 <= 0.0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"BPSSlidingWindowAssigner.m" lineNumber:33 description:@"Expecting interval to be greater than 0"];
  }
  if (a4 <= 0.0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"BPSSlidingWindowAssigner.m" lineNumber:34 description:@"Expecting slide to be greater than 0"];
  }
  v20.receiver = self;
  v20.super_class = (Class)BPSSlidingWindowAssigner;
  v13 = [(BPSSlidingWindowAssigner *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_interval = a3;
    v13->_slide = a4;
    uint64_t v15 = [v11 copy];
    id timestamp = v14->_timestamp;
    v14->_id timestamp = (id)v15;

    objc_storeStrong((id *)&v14->_aggregator, a6);
    v14->_identifier = 0;
  }

  return v14;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  id timestamp = self->_timestamp;
  v7 = (void (*)(void *, id))timestamp[2];
  id v8 = a3;
  v9 = v7(timestamp, a4);
  if (self->_slide >= self->_interval) {
    [(BPSSlidingWindowAssigner *)self assignWindowNonOverlappingIntervals:v8 timestamp:v9];
  }
  else {
  v10 = [(BPSSlidingWindowAssigner *)self assignWindowOverlappingIntervals:v8 timestamp:v9];
  }

  return v10;
}

- (id)assignWindowOverlappingIntervals:(id)a3 timestamp:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CAD0] set];
  id v8 = (void *)[v7 mutableCopy];

  v9 = [MEMORY[0x1E4F1CAD0] set];
  v10 = (void *)[v9 mutableCopy];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v17 = [v16 dateInterval];
        int v18 = [v17 containsDate:v6];

        if (v18)
        {
          [v8 addObject:v16];
          v19 = NSNumber;
          objc_super v20 = [v16 dateInterval];
          v21 = [v20 startDate];
          [v21 timeIntervalSinceReferenceDate];
          v22 = objc_msgSend(v19, "numberWithDouble:");
          [v10 addObject:v22];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);
  }

  [v6 timeIntervalSinceReferenceDate];
  if (v23 < 0.0) {
    double v23 = v23 + -1.0;
  }
  double v24 = self->_slide * trunc(v23 / self->_slide);
  double v25 = self->_interval + -0.0001;
  unint64_t v26 = 0x1E4F28000uLL;
  id v27 = objc_alloc(MEMORY[0x1E4F28C18]);
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v24];
  v29 = (void *)[v27 initWithStartDate:v28 duration:v25];

  if ([v29 containsDate:v6])
  {
    do
    {
      v30 = [NSNumber numberWithDouble:v24];
      char v31 = [v10 containsObject:v30];

      if ((v31 & 1) == 0)
      {
        v32 = [BPSTimeWindowProducer alloc];
        aggregator = self->_aggregator;
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
        v35 = unint64_t v34 = v26;
        v36 = [(BPSTimeWindowProducer *)v32 initWithDateInterval:v29 aggregator:aggregator identifier:v35];
        [v8 addObject:v36];

        unint64_t v26 = v34;
        ++self->_identifier;
      }
      double v24 = v24 - self->_slide;
      id v37 = objc_alloc(*(Class *)(v26 + 3096));
      v38 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v24];
      v39 = (void *)[v37 initWithStartDate:v38 duration:v25];

      v29 = v39;
    }
    while (([v39 containsDate:v6] & 1) != 0);
  }
  else
  {
    v39 = v29;
  }

  return v8;
}

- (id)assignWindowNonOverlappingIntervals:(id)a3 timestamp:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CAD0] set];
  v9 = (void *)[v8 mutableCopy];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v16 = [v15 dateInterval];
        int v17 = [v16 containsDate:v7];

        if (v17)
        {
          [v9 addObject:v15];
          double v23 = v10;
          goto LABEL_14;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  [v7 timeIntervalSinceReferenceDate];
  if (v18 < 0.0) {
    double v18 = v18 + -1.0;
  }
  double v19 = self->_slide * trunc(v18 / self->_slide);
  double v20 = self->_interval + -0.0001;
  id v21 = objc_alloc(MEMORY[0x1E4F28C18]);
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v19];
  double v23 = (void *)[v21 initWithStartDate:v22 duration:v20];

  if ([v23 containsDate:v7])
  {
    double v24 = [BPSTimeWindowProducer alloc];
    aggregator = self->_aggregator;
    unint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
    id v27 = [(BPSTimeWindowProducer *)v24 initWithDateInterval:v23 aggregator:aggregator identifier:v26];
    [v9 addObject:v27];

    ++self->_identifier;
  }
LABEL_14:

  return v9;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  id timestamp = self->_timestamp;
  id v7 = (void (*)(void *, id))timestamp[2];
  id v8 = a4;
  id v9 = a3;
  id v10 = v7(timestamp, v8);
  if (self->_slide >= self->_interval) {
    [(BPSSlidingWindowAssigner *)self updateWindowStateNonOverlappingIntervals:v9 timestamp:v10 input:v8];
  }
  else {
  uint64_t v11 = [(BPSSlidingWindowAssigner *)self updateWindowStateOverlappingIntervals:v9 timestamp:v10 input:v8];
  }

  return v11;
}

- (id)updateWindowStateOverlappingIntervals:(id)a3 timestamp:(id)a4 input:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v45 = a5;
  v46 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v16 = [v15 dateInterval];
        int v17 = [v16 containsDate:v9];

        if (v17)
        {
          double v18 = [(BPSAggregator *)self->_aggregator closure];
          double v19 = [v15 aggregate];
          double v20 = ((void (**)(void, void *, id))v18)[2](v18, v19, v45);
          [v15 setAggregate:v20];

          id v21 = NSNumber;
          v22 = [v15 dateInterval];
          double v23 = [v22 startDate];
          [v23 timeIntervalSinceReferenceDate];
          double v24 = objc_msgSend(v21, "numberWithDouble:");
          [v46 addObject:v24];
        }
        else
        {
          [v15 setCompleted:1];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v12);
  }

  [v9 timeIntervalSinceReferenceDate];
  if (v25 < 0.0) {
    double v25 = v25 + -1.0;
  }
  double v26 = self->_slide * trunc(v25 / self->_slide);
  id v44 = (id)objc_opt_new();
  double v27 = self->_interval + -0.0001;
  id v28 = objc_alloc(MEMORY[0x1E4F28C18]);
  long long v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v26];
  long long v30 = (void *)[v28 initWithStartDate:v29 duration:v27];

  if ([v30 containsDate:v9])
  {
    do
    {
      long long v31 = [NSNumber numberWithDouble:v26];
      char v32 = [v46 containsObject:v31];

      if ((v32 & 1) == 0)
      {
        v33 = [BPSTimeWindowState alloc];
        uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
        v35 = [(BPSAggregator *)self->_aggregator accumulator];
        v36 = [(BPSTimeWindowState *)v33 initWithDateInterval:v30 identifier:v34 aggregate:v35 completed:0];

        id v37 = [(BPSAggregator *)self->_aggregator closure];
        v38 = [(BPSWindowState *)v36 aggregate];
        v39 = ((void (**)(void, void *, id))v37)[2](v37, v38, v45);
        [(BPSWindowState *)v36 setAggregate:v39];

        [v44 addObject:v36];
        ++self->_identifier;
      }
      double v26 = v26 - self->_slide;
      id v40 = objc_alloc(MEMORY[0x1E4F28C18]);
      v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v26];
      long long v42 = (void *)[v40 initWithStartDate:v41 duration:v27];

      long long v30 = v42;
    }
    while (([v42 containsDate:v9] & 1) != 0);
  }
  else
  {
    long long v42 = v30;
  }

  return v44;
}

- (id)updateWindowStateNonOverlappingIntervals:(id)a3 timestamp:(id)a4 input:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v36 = a5;
  id obj = v8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v39 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      v16 = [v15 dateInterval];
      int v17 = [v16 containsDate:v9];

      if (v17)
      {
        double v18 = [(BPSAggregator *)self->_aggregator closure];
        double v19 = [v15 aggregate];
        double v20 = ((void (**)(void, void *, id))v18)[2](v18, v19, v36);
        [v15 setAggregate:v20];

        id v21 = v15;
        uint64_t v12 = v21;
      }
      else
      {
        [v15 setCompleted:1];
      }
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  }
  while (v11);
  if (v12)
  {
    v22 = objc_opt_new();
  }
  else
  {
LABEL_13:
    [v9 timeIntervalSinceReferenceDate];
    if (v23 < 0.0) {
      double v23 = v23 + -1.0;
    }
    double v24 = self->_slide * trunc(v23 / self->_slide);
    v22 = objc_opt_new();
    double v25 = self->_interval + -0.0001;
    id v26 = objc_alloc(MEMORY[0x1E4F28C18]);
    double v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v24];
    uint64_t v12 = (void *)[v26 initWithStartDate:v27 duration:v25];

    if ([v12 containsDate:v9])
    {
      id v28 = [BPSTimeWindowState alloc];
      long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
      long long v30 = [(BPSAggregator *)self->_aggregator accumulator];
      long long v31 = [(BPSTimeWindowState *)v28 initWithDateInterval:v12 identifier:v29 aggregate:v30 completed:0];

      char v32 = [(BPSAggregator *)self->_aggregator closure];
      v33 = [(BPSWindowState *)v31 aggregate];
      uint64_t v34 = ((void (**)(void, void *, id))v32)[2](v32, v33, v36);
      [(BPSWindowState *)v31 setAggregate:v34];

      [v22 addObject:v31];
      ++self->_identifier;
    }
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end