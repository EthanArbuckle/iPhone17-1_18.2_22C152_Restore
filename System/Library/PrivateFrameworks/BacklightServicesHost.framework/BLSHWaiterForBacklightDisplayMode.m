@interface BLSHWaiterForBacklightDisplayMode
- (BLSHWaiterForBacklightDisplayMode)initWithDisplayMode:(int64_t)a3;
- (BLSHWaiterForBacklightDisplayMode)initWithPredicate:(id)a3;
- (BOOL)isAlreadyAtDesiredState;
- (BOOL)isDesiredDisplayMode:(int64_t)a3;
- (BOOL)observesUpdateToDisplayMode;
- (void)backlight:(id)a3 didUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7;
@end

@implementation BLSHWaiterForBacklightDisplayMode

- (BLSHWaiterForBacklightDisplayMode)initWithDisplayMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLSHWaiterForBacklightDisplayMode;
  result = [(BLSHWaiterForBacklight *)&v5 init];
  if (result) {
    result->_displayMode = a3;
  }
  return result;
}

- (BLSHWaiterForBacklightDisplayMode)initWithPredicate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHWaiterForBacklightDisplayMode;
  objc_super v5 = [(BLSHWaiterForBacklight *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C5E2B0](v4);
    id predicate = v5->_predicate;
    v5->_id predicate = (id)v6;
  }
  return v5;
}

- (BOOL)isDesiredDisplayMode:(int64_t)a3
{
  id predicate = (uint64_t (**)(id, int64_t))self->_predicate;
  if (predicate) {
    return predicate[2](self->_predicate, a3);
  }
  else {
    return self->_displayMode == a3;
  }
}

- (BOOL)isAlreadyAtDesiredState
{
  v3 = +[BLSHBacklightHost sharedBacklightHost];
  LOBYTE(self) = -[BLSHWaiterForBacklightDisplayMode isDesiredDisplayMode:](self, "isDesiredDisplayMode:", [v3 backlightDisplayMode]);

  return (char)self;
}

- (BOOL)observesUpdateToDisplayMode
{
  return 1;
}

- (void)backlight:(id)a3 didUpdateToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7
{
  if ([(BLSHWaiterForBacklightDisplayMode *)self isDesiredDisplayMode:a4])
  {
    [(BLSHWaiterForBacklight *)self callCompletion];
  }
}

- (void).cxx_destruct
{
}

@end