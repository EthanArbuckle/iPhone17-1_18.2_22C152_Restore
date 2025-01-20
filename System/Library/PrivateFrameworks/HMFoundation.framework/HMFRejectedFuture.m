@interface HMFRejectedFuture
- (BOOL)isPending;
- (_HMFFutureBlockOutcome)outcomeIfSettled;
- (id)inContext:(id)a3 recover:(id)a4;
- (id)inContext:(id)a3 then:(id)a4 orRecover:(id)a5;
- (id)initWithError:(id *)a1;
- (id)recover:(id)a3;
- (id)then:(id)a3 orRecover:(id)a4;
- (void)getResultWithCompletion:(id)a3;
@end

@implementation HMFRejectedFuture

- (id)initWithError:(id *)a1
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
  v2 = self->_error;
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
  }
  v5 = v4;

  int64_t v6 = 2;
  v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)getResultWithCompletion:(id)a3
{
}

- (id)recover:(id)a3
{
  id v4 = (uint64_t (**)(id, NSError *))a3;
  v5 = HMFFuture;
  uint64_t v6 = v4[2](v4, self->_error);
  if (HMFFuture)
  {
    v5 = +[HMFFuture _futureWithOutcome:v7];
  }
  else
  {
  }
  return v5;
}

- (id)inContext:(id)a3 recover:(id)a4
{
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_error, a4);
}

- (id)then:(id)a3 orRecover:(id)a4
{
  id v6 = a3;
  v7 = (uint64_t (**)(id, NSError *))a4;
  v8 = HMFFuture;
  uint64_t v9 = v7[2](v7, self->_error);
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
  return +[HMFFuture _inContext:transform:with:]((uint64_t)HMFFuture, a3, self->_error, a5);
}

- (void).cxx_destruct
{
}

@end