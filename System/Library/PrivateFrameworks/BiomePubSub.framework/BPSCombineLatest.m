@interface BPSCombineLatest
- (BOOL)completed;
- (BOOL)nextIsB;
- (BPSCombineLatest)initWithA:(id)a3 b:(id)a4;
- (BPSPublisher)a;
- (BPSPublisher)b;
- (id)latestA;
- (id)latestB;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)reset;
- (void)setLatestA:(id)a3;
- (void)setLatestB:(id)a3;
- (void)setNextIsB:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSCombineLatest

- (BPSCombineLatest)initWithA:(id)a3 b:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSCombineLatest;
  v9 = [(BPSCombineLatest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_a, a3);
    objc_storeStrong((id *)&v10->_b, a4);
    v10->_nextIsB = 0;
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v9 = [(_BPSAbstractCombineLatest *)[_BPSCombineLatest2Inner alloc] initWithDownstream:v4 upstreamCount:2];
  v5 = [[_BPSAbstractCombineLatestSide alloc] initWithIndex:0 combiner:v9];
  v6 = [[_BPSAbstractCombineLatestSide alloc] initWithIndex:1 combiner:v9];
  id v7 = [(BPSCombineLatest *)self a];
  [v7 subscribe:v5];

  id v8 = [(BPSCombineLatest *)self b];
  [v8 subscribe:v6];

  [v4 receiveSubscription:v9];
}

- (id)upstreamPublishers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BPSCombineLatest *)self a];
  v7[0] = v3;
  id v4 = [(BPSCombineLatest *)self b];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)nextEvent
{
  BOOL v3 = [(BPSCombineLatest *)self nextIsB];
  [(BPSCombineLatest *)self setNextIsB:[(BPSCombineLatest *)self nextIsB] ^ 1];
  if (v3) {
    [(BPSCombineLatest *)self b];
  }
  else {
  id v4 = [(BPSCombineLatest *)self a];
  }
  v5 = [v4 nextEvent];
  if (v5)
  {
    if (v3) {
      [(BPSCombineLatest *)self setLatestB:v5];
    }
    else {
      [(BPSCombineLatest *)self setLatestA:v5];
    }
    uint64_t v6 = [(BPSCombineLatest *)self latestA];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [(BPSCombineLatest *)self latestB];

      if (v8)
      {
        v9 = [BPSTuple alloc];
        v10 = [(BPSCombineLatest *)self latestA];
        v11 = [(BPSCombineLatest *)self latestB];
        objc_super v12 = [(BPSTuple *)v9 initWithFirst:v10 second:v11];
        v13 = v4;
        v14 = v5;
LABEL_21:

        goto LABEL_23;
      }
    }
  }
  BOOL v15 = [(BPSCombineLatest *)self nextIsB];
  [(BPSCombineLatest *)self setNextIsB:[(BPSCombineLatest *)self nextIsB] ^ 1];
  if (v15) {
    [(BPSCombineLatest *)self b];
  }
  else {
  v13 = [(BPSCombineLatest *)self a];
  }

  v14 = [v13 nextEvent];

  if (v14)
  {
    if (v15) {
      [(BPSCombineLatest *)self setLatestB:v14];
    }
    else {
      [(BPSCombineLatest *)self setLatestA:v14];
    }
    uint64_t v16 = [(BPSCombineLatest *)self latestA];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(BPSCombineLatest *)self latestB];

      if (v18)
      {
        v19 = [BPSTuple alloc];
        v10 = [(BPSCombineLatest *)self latestA];
        v11 = [(BPSCombineLatest *)self latestB];
        objc_super v12 = [(BPSTuple *)v19 initWithFirst:v10 second:v11];
        goto LABEL_21;
      }
    }
  }
  objc_super v12 = 0;
LABEL_23:

  return v12;
}

- (BOOL)completed
{
  id v4 = [(BPSCombineLatest *)self a];
  if (([v4 completed] & 1) == 0)
  {

LABEL_5:
    id v7 = [(BPSCombineLatest *)self a];
    if ([v7 completed])
    {
    }
    else
    {
      v2 = [(BPSCombineLatest *)self b];
      int v8 = [v2 completed];

      if (!v8) {
        return 0;
      }
    }
    v9 = [(BPSCombineLatest *)self a];
    int v10 = [v9 completed];
    if (v10
      && ([(BPSCombineLatest *)self latestA], (v2 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v6 = 1;
    }
    else
    {
      v11 = [(BPSCombineLatest *)self b];
      if ([v11 completed])
      {
        objc_super v12 = [(BPSCombineLatest *)self latestB];
        BOOL v6 = v12 == 0;
      }
      else
      {
        BOOL v6 = 0;
      }

      if (!v10) {
        goto LABEL_18;
      }
    }

LABEL_18:
    return v6;
  }
  v2 = [(BPSCombineLatest *)self b];
  char v5 = [v2 completed];

  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
  return 1;
}

- (void)reset
{
  [(BPSCombineLatest *)self setLatestA:0];
  [(BPSCombineLatest *)self setLatestB:0];
  [(BPSCombineLatest *)self setNextIsB:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSCombineLatest;
  [(BPSPublisher *)&v3 reset];
}

- (BPSPublisher)a
{
  return self->_a;
}

- (BPSPublisher)b
{
  return self->_b;
}

- (id)latestA
{
  return self->_latestA;
}

- (void)setLatestA:(id)a3
{
}

- (id)latestB
{
  return self->_latestB;
}

- (void)setLatestB:(id)a3
{
}

- (BOOL)nextIsB
{
  return self->_nextIsB;
}

- (void)setNextIsB:(BOOL)a3
{
  self->_nextIsB = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_latestB, 0);
  objc_storeStrong(&self->_latestA, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end