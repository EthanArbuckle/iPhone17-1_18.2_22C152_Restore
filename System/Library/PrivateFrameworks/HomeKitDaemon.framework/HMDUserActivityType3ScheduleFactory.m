@interface HMDUserActivityType3ScheduleFactory
- (id)scheduleFromBiomeEvent:(id)a3;
@end

@implementation HMDUserActivityType3ScheduleFactory

- (id)scheduleFromBiomeEvent:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 eventBody];

    if (v5)
    {
      v6 = [v4 eventBody];
      unsigned int v7 = [v6 state] - 2;
      if (v7 > 3) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = qword_2303E4100[v7];
      }

      v9 = [v4 eventBody];
      unsigned int v10 = [v9 changeReason] - 1;
      if (v10 > 5) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = qword_2303E4120[v10];
      }

      id v12 = objc_alloc(MEMORY[0x263EFF910]);
      [v4 timestamp];
      v13 = objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
      v5 = [[HMDUserActivityType3Schedule alloc] initWithState:v8 stateChangedReason:v11 stateChangedTime:v13];
      [(HMDUserActivityType3Schedule *)v5 setBiomeEvent:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end