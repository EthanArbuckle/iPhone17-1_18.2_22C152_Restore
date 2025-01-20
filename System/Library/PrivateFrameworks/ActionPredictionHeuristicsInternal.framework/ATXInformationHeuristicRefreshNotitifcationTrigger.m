@interface ATXInformationHeuristicRefreshNotitifcationTrigger
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithCoder:(id)a3;
- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithNotification:(id)a3 type:(int64_t)a4;
- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithNotification:(id)a3 type:(int64_t)a4 coalescingInterval:(double)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_createCoalescingTimer;
- (void)_scheduleTriggerRefresh;
- (void)_start;
- (void)_stop;
- (void)_triggerRefresh;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInformationHeuristicRefreshNotitifcationTrigger

- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithNotification:(id)a3 type:(int64_t)a4
{
  return [(ATXInformationHeuristicRefreshNotitifcationTrigger *)self initWithNotification:a3 type:a4 coalescingInterval:0.0];
}

- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithNotification:(id)a3 type:(int64_t)a4 coalescingInterval:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXInformationHeuristicRefreshNotitifcationTrigger;
  v10 = [(ATXInformationHeuristicRefreshTrigger *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_notificationType = a4;
    objc_storeStrong((id *)&v10->_notificationName, a3);
    v11->_coalescingInterval = a5;
    [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v11 _createCoalescingTimer];
  }

  return v11;
}

- (void)_createCoalescingTimer
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F93B98]);
  v4 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__ATXInformationHeuristicRefreshNotitifcationTrigger__createCoalescingTimer__block_invoke;
  v7[3] = &unk_1E68A5060;
  objc_copyWeak(&v8, &location);
  v5 = (_PASSimpleCoalescingTimer *)[v3 initWithQueue:v4 operation:v7];
  coalescingTimer = self->_coalescingTimer;
  self->_coalescingTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __76__ATXInformationHeuristicRefreshNotitifcationTrigger__createCoalescingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerRefresh];
}

- (void)_scheduleTriggerRefresh
{
}

- (void)_triggerRefresh
{
  id v4 = [(ATXInformationHeuristicRefreshTrigger *)self delegate];
  id v3 = [(ATXInformationHeuristicRefreshTrigger *)self registeredHeuristics];
  [v4 informationHeuristicRefreshTrigger:self didTriggerRefreshForHeuristics:v3];
}

- (void)_start
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_observerToken)
  {
    id v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      notificationName = self->_notificationName;
      *(_DWORD *)buf = 138412290;
      v20 = notificationName;
      _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "Starting ATXInformationHeuristicRefreshNotitifcationTrigger for %@. We will now refresh heuristics when seeing this notification.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    int64_t notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      int out_token = 0;
      v10 = [(NSString *)self->_notificationName UTF8String];
      v11 = dispatch_get_global_queue(9, 0);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke_97;
      handler[3] = &unk_1E68A50B0;
      objc_copyWeak(&v15, (id *)buf);
      notify_register_dispatch(v10, &out_token, v11, handler);

      v12 = [NSNumber numberWithInt:out_token];
      id observerToken = self->_observerToken;
      self->_id observerToken = v12;

      objc_destroyWeak(&v15);
    }
    else if (!notificationType)
    {
      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v7 = self->_notificationName;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke;
      v17[3] = &unk_1E68A5088;
      objc_copyWeak(&v18, (id *)buf);
      id v8 = [v6 addObserverForName:v7 object:0 queue:0 usingBlock:v17];
      id v9 = self->_observerToken;
      self->_id observerToken = v8;

      objc_destroyWeak(&v18);
    }
    objc_destroyWeak((id *)buf);
  }
}

void __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = __atxlog_handle_gi();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[4];
      int v4 = 134218242;
      v5 = WeakRetained;
      __int16 v6 = 2114;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1D0F43000, v2, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshNotitifcationTrigger (%p): Received local notification: %{public}@. Triggering heuristics refresh.", (uint8_t *)&v4, 0x16u);
    }

    [WeakRetained _scheduleTriggerRefresh];
  }
}

void __60__ATXInformationHeuristicRefreshNotitifcationTrigger__start__block_invoke_97(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = __atxlog_handle_gi();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[4];
      int v4 = 134218242;
      v5 = WeakRetained;
      __int16 v6 = 2114;
      uint64_t v7 = v3;
      _os_log_impl(&dword_1D0F43000, v2, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshNotitifcationTrigger (%p): Received Darwin notification: %{public}@. Triggering heuristics refresh.", (uint8_t *)&v4, 0x16u);
    }

    [WeakRetained _scheduleTriggerRefresh];
  }
}

- (void)_stop
{
  id observerToken = self->_observerToken;
  if (observerToken)
  {
    int64_t notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      notify_cancel([observerToken intValue]);
    }
    else if (!notificationType)
    {
      v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:self->_observerToken];
    }
    id v6 = self->_observerToken;
    self->_id observerToken = 0;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_notificationName hash];
  int v4 = [NSNumber numberWithInteger:self->_notificationType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (ATXInformationHeuristicRefreshNotitifcationTrigger *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      id v6 = v5->_notificationName;
      notificationName = self->_notificationName;
      BOOL v8 = (notificationName == v6 || [(NSString *)notificationName isEqual:v6])
        && self->_notificationType == v5->_notificationType;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"InfoHeuristicRefreshNotitifcationTrigger for %@", self->_notificationName];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshNotitifcationTrigger;
  id v4 = a3;
  [(ATXInformationHeuristicRefreshTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_notificationType, @"notificationType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_notificationName forKey:@"notificationName"];
  [v4 encodeDouble:@"coalescingInterval" forKey:self->_coalescingInterval];
}

- (ATXInformationHeuristicRefreshNotitifcationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXInformationHeuristicRefreshNotitifcationTrigger;
  objc_super v5 = [(ATXInformationHeuristicRefreshTrigger *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 error];

    if (!v6)
    {
      uint64_t v9 = [v4 decodeIntegerForKey:@"notificationType"];
      v5->_int64_t notificationType = v9;
      if (v9 || ([v4 error], v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
      {
        uint64_t v10 = [(ATXInformationHeuristicRefreshTrigger *)v5 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"notificationName" withCoder:v4 nonNull:1];
        notificationName = v5->_notificationName;
        v5->_notificationName = (NSString *)v10;

        if (v5->_notificationName)
        {
          v12 = [v4 error];

          if (!v12)
          {
            [v4 decodeDoubleForKey:@"coalescingInterval"];
            v5->_coalescingInterval = v13;
            [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v5 _createCoalescingTimer];
            uint64_t v7 = v5;
            goto LABEL_4;
          }
        }
      }
      else
      {
        id v15 = __atxlog_handle_gi();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithCoder:](v4);
        }
      }
    }
  }
  uint64_t v7 = 0;
LABEL_4:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong(&self->_observerToken, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = [a1 error];
  OUTLINED_FUNCTION_1_2(&dword_1D0F43000, v1, v2, "ATXInformationHeuristicRefreshNotitifcationTrigger: error decoding %@ - %@", v3, v4, v5, v6, 2u);
}

@end