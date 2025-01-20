@interface GKDelayOperation
- (GKDelayOperation)initWithDelay:(double)a3 andOperation:(id)a4;
- (double)delayInSec;
- (id)operation;
- (void)main;
- (void)setDelayInSec:(double)a3;
- (void)setOperation:(id)a3;
@end

@implementation GKDelayOperation

- (GKDelayOperation)initWithDelay:(double)a3 andOperation:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)GKDelayOperation;
  v7 = [(GKDelayOperation *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(GKDelayOperation *)v7 setDelayInSec:a3];
    [(GKDelayOperation *)v8 setOperation:v6];
  }

  return v8;
}

- (void)main
{
  [(GKDelayOperation *)self delayInSec];
  usleep((v3 * 1000.0 * 1000.0));
  if (([(GKDelayOperation *)self isCancelled] & 1) == 0)
  {
    v4 = (void (*)(void))*((void *)self->_operation + 2);
    v4();
  }
}

- (double)delayInSec
{
  return self->_delayInSec;
}

- (void)setDelayInSec:(double)a3
{
  self->_delayInSec = a3;
}

- (id)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end