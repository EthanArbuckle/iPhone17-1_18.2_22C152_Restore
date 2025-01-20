@interface BPSOrderedMergeUpstreamState
+ (BOOL)supportsSecureCoding;
- (BPSOrderedMergeUpstreamState)init;
- (BPSOrderedMergeUpstreamState)initWithCoder:(id)a3;
- (BPSOrderedMergeUpstreamState)initWithNextEvent:(id)a3 lastReturnedEvent:(id)a4;
- (BPSPublisher)upstream;
- (id)lastReturnedEvent;
- (id)nextEvent;
- (void)attachUpstream:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastReturnedEvent:(id)a3;
- (void)setNextEvent:(id)a3;
@end

@implementation BPSOrderedMergeUpstreamState

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)nextEvent
{
  return self->_nextEvent;
}

- (BPSOrderedMergeUpstreamState)init
{
  return [(BPSOrderedMergeUpstreamState *)self initWithNextEvent:0 lastReturnedEvent:0];
}

- (BPSOrderedMergeUpstreamState)initWithNextEvent:(id)a3 lastReturnedEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSOrderedMergeUpstreamState;
  v9 = [(BPSOrderedMergeUpstreamState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_nextEvent, a3);
    objc_storeStrong(&v10->_lastReturnedEvent, a4);
  }

  return v10;
}

- (void)attachUpstream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastReturnedEvent, 0);
  objc_storeStrong(&self->_nextEvent, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BPSOrderedMergeUpstreamState *)self nextEvent];
  [v4 encodeObject:v5 forKey:@"nextEvent"];

  id v6 = [(BPSOrderedMergeUpstreamState *)self lastReturnedEvent];
  [v4 encodeObject:v6 forKey:@"lastReturnedEvent"];
}

- (BPSOrderedMergeUpstreamState)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B90];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  id v7 = [v5 decodeObjectOfClasses:v6 forKey:@"nextEvent"];
  id v8 = [v5 decodeObjectOfClasses:v6 forKey:@"lastReturnedEvent"];

  v9 = [(BPSOrderedMergeUpstreamState *)self initWithNextEvent:v7 lastReturnedEvent:v8];
  return v9;
}

- (void)setNextEvent:(id)a3
{
}

- (id)lastReturnedEvent
{
  return self->_lastReturnedEvent;
}

- (void)setLastReturnedEvent:(id)a3
{
}

@end