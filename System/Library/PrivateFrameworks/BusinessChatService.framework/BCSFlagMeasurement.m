@interface BCSFlagMeasurement
+ (id)newFlagMeasurement:(int64_t)a3 withHandlers:(id)a4;
- (BOOL)flag;
- (int64_t)flagMeasurementType;
- (void)setFlag:(BOOL)a3;
@end

@implementation BCSFlagMeasurement

+ (id)newFlagMeasurement:(int64_t)a3 withHandlers:(id)a4
{
  id v6 = a4;
  v7 = [BCSFlagMeasurement alloc];
  id v8 = v6;
  if (v7)
  {
    v11.receiver = v7;
    v11.super_class = (Class)BCSFlagMeasurement;
    v9 = (BCSFlagMeasurement *)objc_msgSendSuper2(&v11, sel__init);
    v7 = v9;
    if (v9)
    {
      v9->_flagMeasurementType = a3;
      objc_storeStrong((id *)&v9->_realTimeMeasurementHandlers, a4);
    }
  }

  return v7;
}

- (void)setFlag:(BOOL)a3
{
  if (!self || !self->_flagWasSet)
  {
    self->_flag = a3;
    self->_flagWasSet = 1;
    realTimeMeasurementHandlers = self->_realTimeMeasurementHandlers;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__BCSFlagMeasurement_setFlag___block_invoke;
    v4[3] = &unk_2642499F8;
    v4[4] = self;
    [(NSArray *)realTimeMeasurementHandlers enumerateObjectsUsingBlock:v4];
  }
}

void __30__BCSFlagMeasurement_setFlag___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "flagMeasurementDidChange:forMeasurement:", objc_msgSend(v3, "flag"), *(void *)(a1 + 32));
}

- (BOOL)flag
{
  return self->_flag;
}

- (int64_t)flagMeasurementType
{
  return self->_flagMeasurementType;
}

- (void).cxx_destruct
{
}

@end