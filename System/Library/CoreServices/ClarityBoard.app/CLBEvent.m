@interface CLBEvent
+ (id)eventWithType:(int64_t)a3 context:(id)a4;
- (CLBOpenApplicationRequest)openApplicationRequest;
- (id)context;
- (int64_t)type;
- (void)setContext:(id)a3;
@end

@implementation CLBEvent

+ (id)eventWithType:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  v8 = (void *)v7[2];
  v7[1] = a3;
  v7[2] = v6;

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (CLBOpenApplicationRequest)openApplicationRequest
{
  v2 = [(CLBEvent *)self context];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return (CLBOpenApplicationRequest *)v6;
}

@end