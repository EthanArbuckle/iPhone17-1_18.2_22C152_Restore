@interface BPSZip
- (BOOL)completed;
- (BOOL)nextIsB;
- (BPSPublisher)a;
- (BPSPublisher)b;
- (BPSZip)initWithA:(id)a3 b:(id)a4;
- (NSMutableArray)eventsA;
- (NSMutableArray)eventsB;
- (id)_tryConstructResultTuple;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)reset;
- (void)setEventsA:(id)a3;
- (void)setEventsB:(id)a3;
- (void)setNextIsB:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSZip

- (BPSZip)initWithA:(id)a3 b:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BPSZip;
  v9 = [(BPSZip *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_a, a3);
    objc_storeStrong((id *)&v10->_b, a4);
    v10->_nextIsB = 0;
    uint64_t v11 = objc_opt_new();
    eventsA = v10->_eventsA;
    v10->_eventsA = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    eventsB = v10->_eventsB;
    v10->_eventsB = (NSMutableArray *)v13;
  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v9 = [(_BPSAbstractZip *)[_BPSZip2Inner alloc] initWithDownstream:v4 upstreamCount:2];

  v5 = [(BPSZip *)self a];
  v6 = [[_BPSAbstractZipSide alloc] initWithIndex:0 zip:v9];
  [v5 subscribe:v6];

  id v7 = [(BPSZip *)self b];
  id v8 = [[_BPSAbstractZipSide alloc] initWithIndex:1 zip:v9];
  [v7 subscribe:v8];
}

- (id)_tryConstructResultTuple
{
  v3 = [(BPSZip *)self eventsA];
  if (![v3 count])
  {
    v9 = 0;
    goto LABEL_5;
  }
  id v4 = [(BPSZip *)self eventsB];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = [(BPSZip *)self eventsA];
    v3 = [v6 objectAtIndexedSubscript:0];

    id v7 = [(BPSZip *)self eventsB];
    id v8 = [v7 objectAtIndexedSubscript:0];

    v9 = [[BPSTuple alloc] initWithFirst:v3 second:v8];
    v10 = [(BPSZip *)self eventsA];
    [v10 removeObjectAtIndex:0];

    uint64_t v11 = [(BPSZip *)self eventsB];
    [v11 removeObjectAtIndex:0];

LABEL_5:
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  return v9;
}

- (id)upstreamPublishers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BPSZip *)self a];
  v7[0] = v3;
  id v4 = [(BPSZip *)self b];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (id)nextEvent
{
  BOOL v3 = [(BPSZip *)self nextIsB];
  [(BPSZip *)self setNextIsB:[(BPSZip *)self nextIsB] ^ 1];
  if (v3) {
    [(BPSZip *)self b];
  }
  else {
  id v4 = [(BPSZip *)self a];
  }
  uint64_t v5 = [v4 nextEvent];
  if (!v5) {
    goto LABEL_10;
  }
  if (v3) {
    [(BPSZip *)self eventsB];
  }
  else {
  v6 = [(BPSZip *)self eventsA];
  }
  [v6 addObject:v5];

  uint64_t v7 = [(BPSZip *)self _tryConstructResultTuple];
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = v5;
    v10 = v4;
  }
  else
  {
LABEL_10:
    BOOL v11 = [(BPSZip *)self nextIsB];
    [(BPSZip *)self setNextIsB:[(BPSZip *)self nextIsB] ^ 1];
    if (v11) {
      [(BPSZip *)self b];
    }
    else {
    v10 = [(BPSZip *)self a];
    }

    v9 = [v10 nextEvent];

    if (!v9)
    {
      id v8 = 0;
      goto LABEL_20;
    }
    if (v11) {
      [(BPSZip *)self eventsB];
    }
    else {
    v12 = [(BPSZip *)self eventsA];
    }
    [v12 addObject:v9];

    id v8 = [(BPSZip *)self _tryConstructResultTuple];
  }

LABEL_20:
  return v8;
}

- (void)reset
{
  [(BPSZip *)self setNextIsB:0];
  BOOL v3 = objc_opt_new();
  [(BPSZip *)self setEventsA:v3];

  id v4 = objc_opt_new();
  [(BPSZip *)self setEventsB:v4];

  v5.receiver = self;
  v5.super_class = (Class)BPSZip;
  [(BPSPublisher *)&v5 reset];
}

- (BOOL)completed
{
  BOOL v3 = [(BPSZip *)self a];
  char v4 = [v3 completed];

  if (v4) {
    return 1;
  }
  v6 = [(BPSZip *)self b];
  char v7 = [v6 completed];

  return v7;
}

- (BPSPublisher)a
{
  return self->_a;
}

- (BPSPublisher)b
{
  return self->_b;
}

- (BOOL)nextIsB
{
  return self->_nextIsB;
}

- (void)setNextIsB:(BOOL)a3
{
  self->_nextIsB = a3;
}

- (NSMutableArray)eventsA
{
  return self->_eventsA;
}

- (void)setEventsA:(id)a3
{
}

- (NSMutableArray)eventsB
{
  return self->_eventsB;
}

- (void)setEventsB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsB, 0);
  objc_storeStrong((id *)&self->_eventsA, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end