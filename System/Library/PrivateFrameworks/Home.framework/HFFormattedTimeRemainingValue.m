@interface HFFormattedTimeRemainingValue
+ (id)defaultFormatter;
+ (id)valueWithRemainingDuration:(double)a3 relativeToDate:(id)a4;
- (HFFormattedTimeRemainingValue)initWithFireDate:(id)a3;
- (HFFormattedTimeRemainingValue)initWithFireDate:(id)a3 formatter:(id)a4;
- (HFStringGenerator)currentFormattedValue;
- (NSDate)value;
- (NSDateComponentsFormatter)formatter;
- (NSMapTable)observationBlocks;
- (double)_timeRemaining;
- (id)_generateFormattedValue;
- (id)observeFormattedValueChangesWithBlock:(id)a3;
- (void)_stopTimer;
- (void)_updateTimerState;
- (void)countdownTimerDidFire:(id)a3;
- (void)setCurrentFormattedValue:(id)a3;
@end

@implementation HFFormattedTimeRemainingValue

+ (id)defaultFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08780]);
  [v2 setZeroFormattingBehavior:0x10000];
  return v2;
}

+ (id)valueWithRemainingDuration:(double)a3 relativeToDate:(id)a4
{
  v5 = [a4 dateByAddingTimeInterval:a3];
  v6 = (void *)[objc_alloc((Class)a1) initWithFireDate:v5];

  return v6;
}

- (HFFormattedTimeRemainingValue)initWithFireDate:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() defaultFormatter];
  v6 = [(HFFormattedTimeRemainingValue *)self initWithFireDate:v4 formatter:v5];

  return v6;
}

- (HFFormattedTimeRemainingValue)initWithFireDate:(id)a3 formatter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFFormattedTimeRemainingValue;
  v9 = [(HFFormattedTimeRemainingValue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_formatter, a4);
  }

  return v10;
}

- (double)_timeRemaining
{
  id v2 = [(HFFormattedTimeRemainingValue *)self value];
  v3 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  double result = 0.0;
  if (v5 >= 0.0) {
    return v5;
  }
  return result;
}

- (id)_generateFormattedValue
{
  [(HFFormattedTimeRemainingValue *)self _timeRemaining];
  double v4 = v3;
  double v5 = objc_opt_new();
  [v5 setSecond:(uint64_t)v4];
  [v5 setMinute:0];
  if (v4 >= 3600.0) {
    [v5 setHour:0];
  }
  v6 = [(HFFormattedTimeRemainingValue *)self formatter];
  id v7 = [v6 stringFromDateComponents:v5];

  return v7;
}

- (HFStringGenerator)currentFormattedValue
{
  currentFormattedValue = self->_currentFormattedValue;
  if (!currentFormattedValue)
  {
    double v4 = [(HFFormattedTimeRemainingValue *)self _generateFormattedValue];
    double v5 = self->_currentFormattedValue;
    self->_currentFormattedValue = v4;

    currentFormattedValue = self->_currentFormattedValue;
  }
  return currentFormattedValue;
}

- (NSMapTable)observationBlocks
{
  observationBlocks = self->_observationBlocks;
  if (!observationBlocks)
  {
    double v4 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    double v5 = self->_observationBlocks;
    self->_observationBlocks = v4;

    observationBlocks = self->_observationBlocks;
  }
  return observationBlocks;
}

- (id)observeFormattedValueChangesWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58168]);
  v6 = [(HFFormattedTimeRemainingValue *)self observationBlocks];
  id v7 = (void *)[v4 copy];
  id v8 = _Block_copy(v7);
  [v6 setObject:v8 forKey:v5];

  [(HFFormattedTimeRemainingValue *)self _updateTimerState];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__HFFormattedTimeRemainingValue_observeFormattedValueChangesWithBlock___block_invoke;
  v10[3] = &unk_26408F7F8;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  [v5 addCancelationBlock:v10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v5;
}

void __71__HFFormattedTimeRemainingValue_observeFormattedValueChangesWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained observationBlocks];
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v2 removeObjectForKey:v3];

  [WeakRetained _updateTimerState];
}

- (void)_updateTimerState
{
  id v3 = [(HFFormattedTimeRemainingValue *)self observationBlocks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = +[HFSynchronizedTimer sharedInstance];
    [v5 addObserver:self];
  }
  else
  {
    [(HFFormattedTimeRemainingValue *)self _stopTimer];
  }
}

- (void)_stopTimer
{
  id v3 = +[HFSynchronizedTimer sharedInstance];
  [v3 removeObserver:self];
}

- (void)countdownTimerDidFire:(id)a3
{
  uint64_t v4 = [(HFFormattedTimeRemainingValue *)self _generateFormattedValue];
  [(HFFormattedTimeRemainingValue *)self setCurrentFormattedValue:v4];

  id v5 = [(HFFormattedTimeRemainingValue *)self observationBlocks];
  v6 = [v5 objectEnumerator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HFFormattedTimeRemainingValue_countdownTimerDidFire___block_invoke;
  v8[3] = &unk_26408F820;
  v8[4] = self;
  objc_msgSend(v6, "na_each:", v8);

  [(HFFormattedTimeRemainingValue *)self _timeRemaining];
  *(float *)&double v7 = v7;
  if (fabsf(*(float *)&v7) < 0.00000011921) {
    [(HFFormattedTimeRemainingValue *)self _stopTimer];
  }
}

uint64_t __55__HFFormattedTimeRemainingValue_countdownTimerDidFire___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (NSDate)value
{
  return self->_value;
}

- (NSDateComponentsFormatter)formatter
{
  return self->_formatter;
}

- (void)setCurrentFormattedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFormattedValue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_observationBlocks, 0);
}

@end