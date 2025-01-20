@interface BPSCompletion
+ (id)failureWithError:(id)a3;
+ (id)success;
- (BPSCompletion)initWithState:(int64_t)a3 error:(id)a4;
- (NSError)error;
- (id)description;
- (int64_t)state;
@end

@implementation BPSCompletion

- (void).cxx_destruct
{
}

- (int64_t)state
{
  return self->_state;
}

- (NSError)error
{
  return self->_error;
}

+ (id)success
{
  v2 = (void *)[objc_alloc((Class)a1) initWithState:0 error:0];
  return v2;
}

- (BPSCompletion)initWithState:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BPSCompletion;
  v8 = [(BPSCompletion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

+ (id)failureWithError:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 domain];

  v6 = v4;
  if (v5 != @"BiomePubSubError")
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12[0] = v4;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v6 = [v7 errorWithDomain:@"BiomePubSubError" code:0 userInfo:v8];
  }
  v9 = (void *)[objc_alloc((Class)a1) initWithState:1 error:v6];

  return v9;
}

- (id)description
{
  int64_t v3 = [(BPSCompletion *)self state];
  id v4 = NSString;
  if (v3)
  {
    v5 = [(BPSCompletion *)self error];
    v6 = [v4 stringWithFormat:@"failure (%@)", v5];
  }
  else
  {
    v6 = [NSString stringWithFormat:@"success"];
  }
  return v6;
}

@end