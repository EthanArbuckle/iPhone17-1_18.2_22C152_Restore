@interface MPSleepTimerControlCommandEvent
- (MPSleepTimerControlCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (NSNumber)fireDate;
- (NSNumber)time;
- (int64_t)stopMode;
@end

@implementation MPSleepTimerControlCommandEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_time, 0);
}

- (int64_t)stopMode
{
  return self->_stopMode;
}

- (NSNumber)fireDate
{
  return self->_fireDate;
}

- (NSNumber)time
{
  return self->_time;
}

- (MPSleepTimerControlCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPSleepTimerControlCommandEvent;
  v9 = [(MPRemoteCommandEvent *)&v16 initWithCommand:a3 mediaRemoteType:v5 options:v8];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F777B0]];
    time = v9->_time;
    v9->_time = (NSNumber *)v10;

    v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F777A8]];
    uint64_t v13 = [v12 integerValue] - 1;
    if (v13 < 3) {
      int64_t v14 = v13 + 1;
    }
    else {
      int64_t v14 = 0;
    }
    v9->_stopMode = v14;
  }
  return v9;
}

@end