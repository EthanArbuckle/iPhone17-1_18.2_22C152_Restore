@interface BPSLast
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BOOL)returned;
- (BPSLast)initWithUpstream:(id)a3;
- (BPSPublisher)upstream;
- (id)bookmarkableUpstreams;
- (id)lastEvent;
- (id)nextEvent;
- (id)upstreamPublishers;
- (void)reset;
- (void)setLastEvent:(id)a3;
- (void)setReturned:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSLast

- (BPSLast)initWithUpstream:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BPSLast;
  v6 = [(BPSLast *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upstream, a3);
    id lastEvent = v7->_lastEvent;
    v7->_id lastEvent = 0;

    v7->_returned = 0;
  }

  return v7;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v6 = [[_BPSLastInnser alloc] initWithDownstream:v4];

  id v5 = [(BPSLast *)self upstream];
  [v5 subscribe:v6];
}

- (id)upstreamPublishers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSLast *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)nextEvent
{
  v3 = [(BPSLast *)self upstream];
  id v4 = [v3 nextEvent];

  if (v4)
  {
    do
    {
      [(BPSLast *)self setLastEvent:v4];
      id v5 = [(BPSLast *)self upstream];
      uint64_t v6 = [v5 nextEvent];

      id v4 = (void *)v6;
    }
    while (v6);
  }
  v7 = [(BPSLast *)self upstream];
  if ([v7 completed])
  {
    BOOL v8 = [(BPSLast *)self returned];

    if (!v8)
    {
      [(BPSLast *)self setReturned:1];
      v9 = [(BPSLast *)self lastEvent];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v9 = 0;
LABEL_8:
  return v9;
}

- (void)reset
{
  [(BPSLast *)self setLastEvent:0];
  [(BPSLast *)self setReturned:0];
  v3.receiver = self;
  v3.super_class = (Class)BPSLast;
  [(BPSPublisher *)&v3 reset];
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)lastEvent
{
  return self->_lastEvent;
}

- (void)setLastEvent:(id)a3
{
}

- (BOOL)returned
{
  return self->_returned;
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5 = a4;
  uint64_t v6 = [BPSLast alloc];
  v7 = [v5 objectAtIndexedSubscript:0];

  BOOL v8 = [(BPSLast *)v6 initWithUpstream:v7];
  return v8;
}

- (id)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BPSLast *)self upstream];
  v5[0] = v2;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end