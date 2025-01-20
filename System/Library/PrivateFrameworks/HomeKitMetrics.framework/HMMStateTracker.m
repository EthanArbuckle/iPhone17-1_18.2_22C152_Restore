@interface HMMStateTracker
- (BOOL)autoStopPreviousState;
- (BOOL)isStarted;
- (HMMStateData)longestState;
- (NSArray)states;
- (NSMutableArray)closedStates;
- (NSMutableDictionary)openStates;
- (id)initAutoStopPreviousState:(BOOL)a3;
- (unint64_t)longestStateDuration;
- (unint64_t)startTime;
- (unint64_t)stateEntryTransitionTime;
- (unint64_t)totalDuration;
- (unint64_t)totalStateDuration;
- (void)_exitState:(id)a3 exitTime:(unint64_t)a4 exitData:(id)a5;
- (void)endWithTime:(unint64_t)a3;
- (void)enterState:(id)a3 enterTime:(unint64_t)a4 enterData:(id)a5;
- (void)exitState:(id)a3 exitTime:(unint64_t)a4 exitData:(id)a5;
- (void)setAutoStopPreviousState:(BOOL)a3;
- (void)setClosedStates:(id)a3;
- (void)setLongestStateDuration:(unint64_t)a3;
- (void)setOpenStates:(id)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setStateEntryTransitionTime:(unint64_t)a3;
- (void)startWithTime:(unint64_t)a3;
- (void)updateStateDuration:(unint64_t)a3;
@end

@implementation HMMStateTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closedStates, 0);
  objc_storeStrong((id *)&self->_openStates, 0);
  objc_storeStrong((id *)&self->_longestState, 0);
}

- (void)setLongestStateDuration:(unint64_t)a3
{
  self->_longestStateDuration = a3;
}

- (unint64_t)longestStateDuration
{
  return self->_longestStateDuration;
}

- (void)setStateEntryTransitionTime:(unint64_t)a3
{
  self->_stateEntryTransitionTime = a3;
}

- (unint64_t)stateEntryTransitionTime
{
  return self->_stateEntryTransitionTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setClosedStates:(id)a3
{
}

- (NSMutableArray)closedStates
{
  return self->_closedStates;
}

- (void)setOpenStates:(id)a3
{
}

- (NSMutableDictionary)openStates
{
  return self->_openStates;
}

- (void)setAutoStopPreviousState:(BOOL)a3
{
  self->_autoStopPreviousState = a3;
}

- (BOOL)autoStopPreviousState
{
  return self->_autoStopPreviousState;
}

- (HMMStateData)longestState
{
  return self->_longestState;
}

- (unint64_t)totalStateDuration
{
  return self->_totalStateDuration;
}

- (unint64_t)totalDuration
{
  return self->_totalDuration;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (NSArray)states
{
  v2 = (void *)[(NSMutableArray *)self->_closedStates copy];
  return (NSArray *)v2;
}

- (void)updateStateDuration:(unint64_t)a3
{
  if ([(HMMStateTracker *)self stateEntryTransitionTime] < a3) {
    self->_totalStateDuration += a3 - [(HMMStateTracker *)self stateEntryTransitionTime];
  }
}

- (void)_exitState:(id)a3 exitTime:(unint64_t)a4 exitData:(id)a5
{
  id v11 = a3;
  [v11 exitTime:a4 exitData:a5];
  v9 = [(HMMStateTracker *)self closedStates];
  [v9 addObject:v11];

  unint64_t v10 = [v11 duration];
  if (v10 > [(HMMStateTracker *)self longestStateDuration])
  {
    objc_storeStrong((id *)&self->_longestState, a3);
    -[HMMStateTracker setLongestStateDuration:](self, "setLongestStateDuration:", [v11 duration]);
  }
}

- (void)exitState:(id)a3 exitTime:(unint64_t)a4 exitData:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(HMMStateTracker *)self openStates];
  id v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    [(HMMStateTracker *)self _exitState:v11 exitTime:a4 exitData:v9];
    v12 = [(HMMStateTracker *)self openStates];
    [v12 removeObjectForKey:v8];

    v13 = [(HMMStateTracker *)self openStates];
    uint64_t v14 = [v13 count];

    if (!v14) {
      [(HMMStateTracker *)self updateStateDuration:a4];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D944E970]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1D4999000, v17, OS_LOG_TYPE_ERROR, "%{public}@Exiting state %@ that hasn't been entered", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)enterState:(id)a3 enterTime:(unint64_t)a4 enterData:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (![(HMMStateTracker *)self isStarted]) {
    [(HMMStateTracker *)self startWithTime:a4];
  }
  unint64_t v10 = [(HMMStateTracker *)self openStates];
  uint64_t v11 = [v10 count];
  if ([(HMMStateTracker *)self autoStopPreviousState] && v11)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v12 = objc_msgSend(v10, "allValues", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          [(HMMStateTracker *)self _exitState:*(void *)(*((void *)&v24 + 1) + 8 * v16++) exitTime:a4 exitData:0];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v14);
    }

    [v10 removeAllObjects];
  }
  v17 = [v10 objectForKeyedSubscript:v8];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1D944E970]();
    int v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_1D4999000, v20, OS_LOG_TYPE_ERROR, "%{public}@State %@ has already been entered", buf, 0x16u);
    }
  }
  else
  {
    id v22 = [[HMMStateData alloc] initWithName:v8 enterTime:a4 enterData:v9];
    [v10 setObject:v22 forKey:v8];
    uint64_t v23 = [v10 count];
    if (v11 || !v23)
    {
      if (v11 && !v23) {
        [(HMMStateTracker *)self updateStateDuration:a4];
      }
    }
    else
    {
      [(HMMStateTracker *)self setStateEntryTransitionTime:a4];
    }
  }
}

- (void)endWithTime:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_started)
  {
    self->_started = 0;
    if ([(HMMStateTracker *)self startTime] <= a3)
    {
      self->_totalDuration = a3 - [(HMMStateTracker *)self startTime];
    }
    else
    {
      v5 = (void *)MEMORY[0x1D944E970]();
      v6 = self;
      v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v30 = v8;
        _os_log_impl(&dword_1D4999000, v7, OS_LOG_TYPE_ERROR, "%{public}@State tracker end time less than start time", buf, 0xCu);
      }
    }
    uint64_t v14 = [(HMMStateTracker *)self openStates];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v16 = [(HMMStateTracker *)self openStates];
      v17 = [v16 allValues];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([(HMMStateTracker *)self autoStopPreviousState])
            {
              [(HMMStateTracker *)self _exitState:v22 exitTime:a3 exitData:0];
            }
            else
            {
              [v22 forceExit:a3];
              uint64_t v23 = [(HMMStateTracker *)self closedStates];
              [v23 addObject:v22];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v19);
      }

      [(HMMStateTracker *)self updateStateDuration:a3];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D944E970]();
    unint64_t v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      uint64_t v13 = [(HMMStateTracker *)v10 states];
      *(_DWORD *)buf = 138543618;
      __int16 v30 = v12;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D4999000, v11, OS_LOG_TYPE_ERROR, "%{public}@Trying to end a state tracker that is already closed with states %@", buf, 0x16u);
    }
  }
}

- (void)startWithTime:(unint64_t)a3
{
  self->_startTime = a3;
  self->_started = 1;
}

- (id)initAutoStopPreviousState:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HMMStateTracker;
  v4 = [(HMMStateTracker *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_autoStopPreviousState = a3;
    v4->_started = 0;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    openStates = v5->_openStates;
    v5->_openStates = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    closedStates = v5->_closedStates;
    v5->_closedStates = (NSMutableArray *)v8;
  }
  return v5;
}

@end