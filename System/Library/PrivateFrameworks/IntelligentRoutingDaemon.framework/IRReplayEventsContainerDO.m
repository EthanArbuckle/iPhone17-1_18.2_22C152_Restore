@interface IRReplayEventsContainerDO
+ (BOOL)supportsSecureCoding;
+ (id)replayEventsContainerDOWithReplayEvents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReplayEventsContainerDO:(id)a3;
- (IRReplayEventsContainerDO)initWithCoder:(id)a3;
- (IRReplayEventsContainerDO)initWithReplayEvents:(id)a3;
- (NSSet)replayEvents;
- (id)copyWithReplacementReplayEvents:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRReplayEventsContainerDO

- (IRReplayEventsContainerDO)initWithReplayEvents:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRReplayEventsContainerDO;
  v6 = [(IRReplayEventsContainerDO *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_replayEvents, a3);
  }

  return v7;
}

+ (id)replayEventsContainerDOWithReplayEvents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithReplayEvents:v4];

  return v5;
}

- (id)copyWithReplacementReplayEvents:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReplayEvents:v3];

  return v4;
}

- (BOOL)isEqualToReplayEventsContainerDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (int v6 = self->_replayEvents != 0,
        [v4 replayEvents],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    char v11 = 0;
  }
  else
  {
    replayEvents = self->_replayEvents;
    if (replayEvents)
    {
      v10 = [v5 replayEvents];
      char v11 = [(NSSet *)replayEvents isEqual:v10];
    }
    else
    {
      char v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRReplayEventsContainerDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRReplayEventsContainerDO *)self isEqualToReplayEventsContainerDO:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_replayEvents hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRReplayEventsContainerDO)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  int v8 = [v4 decodeObjectOfClasses:v7 forKey:@"replayEvents"];

  if (v8 || ([v4 error], v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    self = [(IRReplayEventsContainerDO *)self initWithReplayEvents:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  replayEvents = self->_replayEvents;
  if (replayEvents) {
    [a3 encodeObject:replayEvents forKey:@"replayEvents"];
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRReplayEventsContainerDO | replayEvents:%@>", self->_replayEvents];

  return v2;
}

- (NSSet)replayEvents
{
  return self->_replayEvents;
}

- (void).cxx_destruct
{
}

@end