@interface HMFFulfilledFuture
- (BOOL)isPending;
- (_HMFFutureBlockOutcome)outcomeIfSettled;
- (id)inContext:(id)a3 then:(id)a4;
- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5;
- (id)initWithValue:(id *)a1;
- (id)then:(id)a3;
- (id)then:(id)a3 orRecover:(id)a4;
- (void)getResultWithCompletion:(id)a3;
@end

@implementation HMFFulfilledFuture

- (id)initWithValue:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong(a1 + 1, a2);
    v5 = a1;
  }

  return a1;
}

- (BOOL)isPending
{
  return 0;
}

- (_HMFFutureBlockOutcome)outcomeIfSettled
{
  id v2 = self->_value;
  int64_t v3 = 1;
  result.var1 = v2;
  result.var0 = v3;
  return result;
}

- (void)getResultWithCompletion:(id)a3
{
}

- (id)then:(id)a3
{
  id v4 = (uint64_t (**)(id, id))a3;
  v5 = HMFFuture;
  uint64_t v6 = v4[2](v4, self->_value);
  if (HMFFuture)
  {
    v5 = +[HMFFuture _futureWithOutcome:v7];
  }
  else
  {
  }
  return v5;
}

- (id)inContext:(id)a3 then:(id)a4
{
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_value, a4);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  uint64_t v6 = (uint64_t (**)(id, id))a3;
  id v7 = a4;
  v8 = HMFFuture;
  uint64_t v9 = v6[2](v6, self->_value);
  if (HMFFuture)
  {
    v8 = +[HMFFuture _futureWithOutcome:v10];
  }
  else
  {
  }
  return v8;
}

- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5
{
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_value, a4);
}

- (void).cxx_destruct
{
}

@end