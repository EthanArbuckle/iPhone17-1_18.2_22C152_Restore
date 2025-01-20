@interface BCSTimingMeasurement
+ (id)newTimingMeasurement:(int64_t)a3 withHandlers:(id)a4;
- (double)duration;
- (int64_t)timingMeasurementType;
- (void)begin;
- (void)end;
@end

@implementation BCSTimingMeasurement

+ (id)newTimingMeasurement:(int64_t)a3 withHandlers:(id)a4
{
  id v6 = a4;
  v7 = [BCSTimingMeasurement alloc];
  id v8 = v6;
  if (v7)
  {
    v11.receiver = v7;
    v11.super_class = (Class)BCSTimingMeasurement;
    v9 = (BCSTimingMeasurement *)objc_msgSendSuper2(&v11, sel__init);
    v7 = v9;
    if (v9)
    {
      v9->_timingMeasurementType = a3;
      objc_storeStrong((id *)&v9->_realTimeMeasurementHandlers, a4);
    }
  }

  return v7;
}

- (void)begin
{
  if (!self || !objc_getProperty(self, a2, 8, 1))
  {
    v3 = [MEMORY[0x263EFF910] date];
    v5 = v3;
    if (self)
    {
      objc_setProperty_atomic(self, v4, v3, 8);

      realTimeMeasurementHandlers = self->_realTimeMeasurementHandlers;
    }
    else
    {

      realTimeMeasurementHandlers = 0;
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__BCSTimingMeasurement_begin__block_invoke;
    v7[3] = &unk_264249A20;
    v7[4] = self;
    [(NSArray *)realTimeMeasurementHandlers enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __29__BCSTimingMeasurement_begin__block_invoke(uint64_t a1, void *a2)
{
  return [a2 timingMeasurementDidBegin:*(void *)(a1 + 32)];
}

- (void)end
{
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 8, 1);
    if (v3)
    {
      v5 = v3;
      id Property = objc_getProperty(self, v4, 16, 1);

      if (!Property)
      {
        v7 = [MEMORY[0x263EFF910] date];
        objc_setProperty_atomic(self, v8, v7, 16);

        realTimeMeasurementHandlers = self->_realTimeMeasurementHandlers;
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __27__BCSTimingMeasurement_end__block_invoke;
        v10[3] = &unk_264249A20;
        v10[4] = self;
        [(NSArray *)realTimeMeasurementHandlers enumerateObjectsUsingBlock:v10];
      }
    }
  }
}

uint64_t __27__BCSTimingMeasurement_end__block_invoke(uint64_t a1, void *a2)
{
  return [a2 timingMeasurementDidEnd:*(void *)(a1 + 32)];
}

- (double)duration
{
  if (!self) {
    return 0.0;
  }
  id v3 = objc_getProperty(self, a2, 8, 1);
  if (!v3) {
    return 0.0;
  }
  v5 = v3;
  id Property = objc_getProperty(self, v4, 16, 1);

  if (!Property) {
    return 0.0;
  }
  id v8 = objc_getProperty(self, v7, 16, 1);
  objc_msgSend(v8, "timeIntervalSinceDate:", objc_getProperty(self, v9, 8, 1));
  double v11 = v10;

  return v11;
}

- (int64_t)timingMeasurementType
{
  return self->_timingMeasurementType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realTimeMeasurementHandlers, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end