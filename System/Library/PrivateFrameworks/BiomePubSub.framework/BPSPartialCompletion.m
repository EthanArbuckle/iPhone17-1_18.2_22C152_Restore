@interface BPSPartialCompletion
+ (id)withState:(int64_t)a3;
+ (id)withState:(int64_t)a3 error:(id)a4;
+ (id)withState:(int64_t)a3 value:(id)a4;
- (BPSPartialCompletion)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5;
- (NSError)error;
- (id)value;
- (int64_t)state;
@end

@implementation BPSPartialCompletion

- (BPSPartialCompletion)initWithState:(int64_t)a3 value:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BPSPartialCompletion;
  v11 = [(BPSPartialCompletion *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_state = a3;
    objc_storeStrong(&v11->_value, a4);
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

+ (id)withState:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithState:a3 value:v6 error:0];

  return v7;
}

+ (id)withState:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithState:a3 value:0 error:v6];

  return v7;
}

+ (id)withState:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithState:a3 value:0 error:0];
  return v3;
}

- (int64_t)state
{
  return self->_state;
}

- (id)value
{
  return self->_value;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

@end