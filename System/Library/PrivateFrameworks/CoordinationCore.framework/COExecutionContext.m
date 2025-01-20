@interface COExecutionContext
- (BOOL)isEqual:(id)a3;
- (BOOL)leaderElectionConfigured;
- (COExecutionContext)init;
- (COExecutionContext)initWithDispatchQueue:(id)a3;
- (COExecutionContext)initWithMetadata:(id)a3;
- (NSDictionary)metadata;
- (id)analyticsRecorder;
- (id)constituentForMe;
- (id)dispatchQueue;
- (id)label;
- (id)meshControllerDescription;
- (id)meshName;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)networkActivityFactory;
- (id)objectForKey:(id)a3;
- (void)assertDispatchQueue;
- (void)dispatchAsync:(id)a3;
- (void)dispatchSync:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation COExecutionContext

- (COExecutionContext)initWithDispatchQueue:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COExecutionContext;
  v5 = [(COExecutionContext *)&v9 init];
  if (v5)
  {
    dispatch_queue_set_specific(v4, "queueSpecificInfo", v4, 0);
    v10 = @"dispatchQueue";
    v11[0] = v4;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v6;
  }
  return v5;
}

- (COExecutionContext)init
{
  return [(COExecutionContext *)self initWithDispatchQueue:MEMORY[0x263EF83A0]];
}

- (COExecutionContext)initWithMetadata:(id)a3
{
  id v4 = a3;
  v5 = [(COExecutionContext *)self init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 copy];
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v7;
  }
  return v6;
}

- (void)dispatchSync:(id)a3
{
  block = (void (**)(void))a3;
  id v4 = dispatch_get_specific("queueSpecificInfo");
  v5 = [(NSDictionary *)self->_metadata objectForKey:@"dispatchQueue"];
  if (!v5)
  {
    v5 = MEMORY[0x263EF83A0];
    id v6 = MEMORY[0x263EF83A0];
  }
  if (v5 == v4) {
    block[2]();
  }
  else {
    dispatch_sync(v5, block);
  }
}

- (void)dispatchAsync:(id)a3
{
  metadata = self->_metadata;
  id v4 = a3;
  v5 = [(NSDictionary *)metadata objectForKey:@"dispatchQueue"];
  id v6 = v5;
  if (v5)
  {
    queue = v5;
  }
  else
  {
    queue = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
  }

  dispatch_async(queue, v4);
}

- (void)assertDispatchQueue
{
  v2 = [(NSDictionary *)self->_metadata objectForKey:@"dispatchQueue"];
  dispatch_assert_queue_V2(v2);
}

- (id)constituentForMe
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"COExecutionContextMeshMeConstituentKey"];

  return v3;
}

- (BOOL)leaderElectionConfigured
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"COExecutionContextClusterOptions"];
  char v4 = [v3 unsignedIntegerValue];

  return v4 & 1;
}

- (id)analyticsRecorder
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"analyticsEventRecorder"];

  return v3;
}

- (id)networkActivityFactory
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"COExecutionContextNetworkActivityFactoryKey"];

  return v3;
}

- (id)dispatchQueue
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"dispatchQueue"];

  return v3;
}

- (id)label
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"COExecutionContextMeshLabelKey"];

  return v3;
}

- (id)meshName
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"COExecutionContextMeshNameKey"];

  return v3;
}

- (id)meshControllerDescription
{
  v2 = [(COExecutionContext *)self metadata];
  v3 = [v2 objectForKey:@"COExecutionContextMeshControllerKey"];

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(COExecutionContext *)self metadata];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(COExecutionContext *)+[COMutableExecutionContext allocWithZone:a3] init];
  v5 = [(COExecutionContext *)self metadata];
  id v6 = (void *)[v5 mutableCopy];
  [(COExecutionContext *)v4 setMetadata:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COExecutionContext *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(COExecutionContext *)self metadata];
      id v7 = [(COExecutionContext *)v5 metadata];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end