@interface BPSSessionWindowAssigner
- (BPSSessionWindowAssigner)initWithGap:(double)a3 aggregator:(id)a4;
- (BPSSessionWindowAssigner)initWithGap:(double)a3 timestamp:(id)a4 aggregator:(id)a5;
- (id)assignWindow:(id)a3 input:(id)a4;
- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4;
@end

@implementation BPSSessionWindowAssigner

- (BPSSessionWindowAssigner)initWithGap:(double)a3 aggregator:(id)a4
{
  return [(BPSSessionWindowAssigner *)self initWithGap:&__block_literal_global_3 timestamp:a4 aggregator:a3];
}

uint64_t __51__BPSSessionWindowAssigner_initWithGap_aggregator___block_invoke()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

- (BPSSessionWindowAssigner)initWithGap:(double)a3 timestamp:(id)a4 aggregator:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 <= 0.0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"BPSSessionWindowAssigner.m" lineNumber:285 description:@"Expecting gap to be greater than 0"];
  }
  v19.receiver = self;
  v19.super_class = (Class)BPSSessionWindowAssigner;
  v11 = [(BPSSessionWindowAssigner *)&v19 init];
  v12 = v11;
  if (v11)
  {
    v11->_gap = a3;
    objc_storeStrong((id *)&v11->_aggregator, a5);
    uint64_t v13 = [v9 copy];
    id timestamp = v12->_timestamp;
    v12->_id timestamp = (id)v13;

    v12->_identifier = 0;
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] distantPast];
    lastTimestamp = v12->_lastTimestamp;
    v12->_lastTimestamp = (NSDate *)v15;
  }
  return v12;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CAD0] set];
  v43 = (void *)[v9 mutableCopy];

  v44 = v8;
  id v10 = (*((void (**)(void))self->_timestamp + 2))();
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  [(NSDate *)self->_lastTimestamp timeIntervalSinceReferenceDate];
  if (v12 < v13)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"BPSSessionWindowAssigner.m" lineNumber:305 description:@"Session window expects timestamps to be monotonically increasing"];
  }
  v42 = v10;
  objc_storeStrong((id *)&self->_lastTimestamp, v10);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v41 = self;
    v17 = 0;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (!v17) {
          goto LABEL_10;
        }
        v21 = [*(id *)(*((void *)&v45 + 1) + 8 * i) identifier];
        uint64_t v22 = [v21 integerValue];
        v23 = [v17 identifier];
        uint64_t v24 = [v23 integerValue];

        if (v22 > v24)
        {
LABEL_10:
          id v25 = v20;

          v17 = v25;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v16);

    if (v17)
    {
      v26 = v43;
      [v43 addObject:v17];
      v27 = [v17 dateInterval];
      v28 = v42;
      char v29 = [v27 containsDate:v42];

      self = v41;
      if (v29) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    self = v41;
  }
  else
  {

    v17 = 0;
  }
  v28 = v42;
  v26 = v43;
LABEL_19:
  double v30 = self->_gap + -0.0001;
  v31 = [BPSSessionWindow alloc];
  v32 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v28 duration:v30];
  double gap = self->_gap;
  aggregator = self->_aggregator;
  id timestamp = self->_timestamp;
  v36 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_identifier);
  v37 = [(BPSSessionWindow *)v31 initWithDateInterval:v32 gap:timestamp timestamp:aggregator aggregator:v36 identifier:gap];
  [v26 addObject:v37];

  ++self->_identifier;
LABEL_20:
  id v38 = v26;

  return v38;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v54 = (id)objc_opt_new();
  id v51 = (id)objc_opt_new();
  v52 = self;
  v53 = v7;
  id v8 = (*((void (**)(void))self->_timestamp + 2))();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v66 count:16];
  obuint64_t j = v9;
  if (!v10)
  {

    double v12 = 0;
LABEL_15:
    v21 = v54;
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  double v12 = 0;
  uint64_t v13 = *(void *)v62;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v62 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      if (!v12) {
        goto LABEL_8;
      }
      uint64_t v16 = [*(id *)(*((void *)&v61 + 1) + 8 * i) identifier];
      uint64_t v17 = [v16 integerValue];
      uint64_t v18 = [v12 identifier];
      uint64_t v19 = [v18 integerValue];

      if (v17 > v19)
      {
LABEL_8:
        id v20 = v15;

        double v12 = v20;
      }
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  }
  while (v11);

  if (!v12) {
    goto LABEL_15;
  }
  v21 = v54;
  [v54 addObject:v12];
  uint64_t v22 = [v12 dateInterval];
  char v23 = [v22 containsDate:v8];

  if ((v23 & 1) == 0)
  {
LABEL_16:
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 duration:v52->_gap + -0.0001];
    id v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v52->_identifier);
    v26 = [BPSSessionWindowState alloc];
    v27 = [(BPSAggregator *)v52->_aggregator accumulator];
    v28 = [(BPSSessionWindowState *)v26 initWithDateInterval:v24 identifier:v25 aggregate:v27 completed:0];

    [v21 addObject:v28];
    [v51 addObject:v28];
    ++v52->_identifier;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v55 = v21;
  uint64_t v29 = [v55 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v58 != v31) {
          objc_enumerationMutation(v55);
        }
        v33 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        v34 = [v33 dateInterval];
        int v35 = [v34 containsDate:v8];

        if (v35)
        {
          v36 = [(BPSAggregator *)v52->_aggregator closure];
          v37 = [v33 aggregate];
          id v38 = ((void (**)(void, void *, void *))v36)[2](v36, v37, v53);
          [v33 setAggregate:v38];

          [v8 timeIntervalSinceReferenceDate];
          double v40 = v39;
          v41 = [v33 dateInterval];
          v42 = [v41 startDate];
          [v42 timeIntervalSinceReferenceDate];
          double v44 = v40 - v43 + v52->_gap + -0.0001;

          id v45 = objc_alloc(MEMORY[0x1E4F28C18]);
          long long v46 = [v33 dateInterval];
          long long v47 = [v46 startDate];
          long long v48 = (void *)[v45 initWithStartDate:v47 duration:v44];
          [v33 setDateInterval:v48];
        }
        else
        {
          [v33 setCompleted:1];
        }
      }
      uint64_t v30 = [v55 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v30);
  }

  id v49 = v51;
  return v49;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end