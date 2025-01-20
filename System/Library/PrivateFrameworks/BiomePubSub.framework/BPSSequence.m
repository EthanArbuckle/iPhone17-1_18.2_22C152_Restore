@interface BPSSequence
- (BOOL)finished;
- (BPSSequence)initWithEnumerator:(id)a3;
- (BPSSequence)initWithSequence:(id)a3;
- (NSEnumerator)enumerator;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (void)applyBookmark:(id)a3;
- (void)reset;
- (void)setEnumerator:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSSequence

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)finished
{
  return self->_finished;
}

- (id)nextEvent
{
  v3 = [(BPSSequence *)self enumerator];
  v4 = [v3 nextObject];

  if (v4) {
    id v5 = v4;
  }
  else {
    [(BPSSequence *)self setFinished:1];
  }

  return v4;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)bookmark
{
  v3 = [(BPSSequence *)self enumerator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(BPSSequence *)self enumerator];
    v6 = [v5 bookmark];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (void).cxx_destruct
{
}

- (BPSSequence)initWithSequence:(id)a3
{
  id v4 = a3;
  id v5 = [[BPSBookmarkableArrayEnumerator alloc] initWithArray:v4];

  v6 = [(BPSSequence *)self initWithBookmarkableEnumerator:v5];
  return v6;
}

- (BPSSequence)initWithEnumerator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BPSSequence;
  id v5 = [(BPSSequence *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BPSSequence *)v5 setEnumerator:v4];
  }

  return v6;
}

- (void)setEnumerator:(id)a3
{
}

- (void)subscribe:(id)a3
{
  id v8 = a3;
  id v4 = [(BPSSequence *)self enumerator];
  id v5 = [[_BPSSequenceInner alloc] initWithDownstream:v8 enumerator:v4];
  if (v4)
  {
    [v8 receiveSubscription:v5];
  }
  else
  {
    v6 = objc_opt_new();
    [v8 receiveSubscription:v6];

    v7 = +[BPSCompletion success];
    [v8 receiveCompletion:v7];

    [(_BPSSequenceInner *)v5 cancel];
  }
}

- (void)reset
{
  [(BPSSequence *)self setFinished:0];
  v3 = [(BPSSequence *)self enumerator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(BPSSequence *)self enumerator];
    [v5 reset];
  }
}

- (id)validateBookmark:(id)a3
{
  id v4 = a3;
  id v5 = [(BPSSequence *)self enumerator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(BPSSequence *)self enumerator];
    id v8 = [v7 validateBookmark:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)applyBookmark:(id)a3
{
  id v7 = a3;
  id v4 = [(BPSSequence *)self enumerator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(BPSSequence *)self enumerator];
    [v6 applyBookmark:v7];
  }
}

- (id)bookmarkableUpstreams
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end