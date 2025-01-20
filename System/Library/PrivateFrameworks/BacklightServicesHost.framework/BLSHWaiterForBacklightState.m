@interface BLSHWaiterForBacklightState
- (BLSHWaiterForBacklightState)initWithBacklightState:(int64_t)a3;
- (BLSHWaiterForBacklightState)initWithPredicate:(id)a3;
- (BOOL)isAlreadyAtDesiredState;
- (BOOL)isDesiredState:(int64_t)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6;
@end

@implementation BLSHWaiterForBacklightState

- (BLSHWaiterForBacklightState)initWithBacklightState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLSHWaiterForBacklightState;
  result = [(BLSHWaiterForBacklight *)&v5 init];
  if (result) {
    result->_backlightState = a3;
  }
  return result;
}

- (BLSHWaiterForBacklightState)initWithPredicate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHWaiterForBacklightState;
  objc_super v5 = [(BLSHWaiterForBacklight *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C5E2B0](v4);
    id predicate = v5->_predicate;
    v5->_id predicate = (id)v6;
  }
  return v5;
}

- (BOOL)isDesiredState:(int64_t)a3
{
  id predicate = (uint64_t (**)(id, int64_t))self->_predicate;
  if (predicate) {
    return predicate[2](self->_predicate, a3);
  }
  else {
    return self->_backlightState == a3;
  }
}

- (BOOL)isAlreadyAtDesiredState
{
  v3 = +[BLSHBacklightHost sharedBacklightHost];
  LOBYTE(self) = -[BLSHWaiterForBacklightState isDesiredState:](self, "isDesiredState:", [v3 backlightState]);

  return (char)self;
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  if ([(BLSHWaiterForBacklightState *)self isDesiredState:a4])
  {
    [(BLSHWaiterForBacklight *)self callCompletion];
  }
}

- (void).cxx_destruct
{
}

@end