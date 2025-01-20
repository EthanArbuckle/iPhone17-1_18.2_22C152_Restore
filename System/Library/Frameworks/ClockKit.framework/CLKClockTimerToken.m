@interface CLKClockTimerToken
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsCommit;
- (BOOL)wantsHighAccuracy;
- (CLKClockTimer)owner;
- (CLKClockTimerToken)initWithID:(int64_t)a3;
- (id)description;
- (id)handler;
- (id)log;
- (int64_t)updateFrequency;
- (unint64_t)hash;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setOwner:(id)a3;
- (void)setUpdateFrequency:(int64_t)a3;
- (void)setWantsCommit:(BOOL)a3;
- (void)setWantsHighAccuracy:(BOOL)a3;
@end

@implementation CLKClockTimerToken

- (CLKClockTimerToken)initWithID:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLKClockTimerToken;
  v4 = [(CLKClockTimerToken *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    id = v4->_id;
    v4->_id = (NSNumber *)v5;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLKClockTimerToken *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(NSNumber *)v4->_id isEqual:self->_id];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_id hash];
}

- (id)description
{
  v3 = NSString;
  id = self->_id;
  if (self->_isActive) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  uint64_t v6 = CLKClockTimerFrameIntervalForUpdateFrequency[self->_updateFrequency];
  v7 = [(CLKClockTimerToken *)self log];
  objc_super v8 = v7[2]();
  unint64_t v9 = [v8 length];
  v10 = [(CLKClockTimerToken *)self log];
  v11 = v10[2]();
  v12 = v11;
  if (v9 > 0x40)
  {
    v14 = [v11 substringToIndex:64];
    uint64_t v15 = [v14 stringByAppendingString:@" ..."];
    v16 = v3;
    v17 = (void *)v15;
    v13 = [v16 stringWithFormat:@"<CLKClockTimerToken: %p, id:%@, active: %@, interval:%ld>: %@", self, id, v5, v6, v15];
  }
  else
  {
    v13 = [v3 stringWithFormat:@"<CLKClockTimerToken: %p, id:%@, active: %@, interval:%ld>: %@", self, id, v5, v6, v11];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 log];
  v4 = v3[2]();
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_21C599000, a2, OS_LOG_TYPE_ERROR, "CLKClockTimerToken with id=\"%@\" was not properly stopped", (uint8_t *)&v5, 0xCu);
}

uint64_t __29__CLKClockTimerToken_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplayLink];
}

- (int64_t)updateFrequency
{
  return self->_updateFrequency;
}

- (void)setUpdateFrequency:(int64_t)a3
{
  self->_updateFrequency = a3;
}

- (BOOL)wantsCommit
{
  return self->_wantsCommit;
}

- (void)setWantsCommit:(BOOL)a3
{
  self->_wantsCommit = a3;
}

- (BOOL)wantsHighAccuracy
{
  return self->_wantsHighAccuracy;
}

- (void)setWantsHighAccuracy:(BOOL)a3
{
  self->_wantsHighAccuracy = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (CLKClockTimer)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (CLKClockTimer *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong(&self->_log, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end