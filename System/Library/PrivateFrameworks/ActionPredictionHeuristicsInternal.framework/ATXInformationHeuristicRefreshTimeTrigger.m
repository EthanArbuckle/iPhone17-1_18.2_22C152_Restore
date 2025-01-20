@interface ATXInformationHeuristicRefreshTimeTrigger
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicRefreshTimeTrigger)initWithCoder:(id)a3;
- (ATXInformationHeuristicRefreshTimeTrigger)initWithFireDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)fireDate;
- (id)description;
- (unint64_t)hash;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInformationHeuristicRefreshTimeTrigger

- (ATXInformationHeuristicRefreshTimeTrigger)initWithFireDate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXInformationHeuristicRefreshTimeTrigger;
  v5 = [(ATXInformationHeuristicRefreshTrigger *)&v10 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v7;
  }
  return v5;
}

- (void)_start
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_source)
  {
    [(NSDate *)self->_fireDate timeIntervalSinceNow];
    double v4 = v3;
    v5 = __atxlog_handle_gi();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4 <= 0.0)
    {
      if (v6)
      {
        fireDate = self->_fireDate;
        v16 = [(ATXInformationHeuristicRefreshTrigger *)self registeredHeuristics];
        *(_DWORD *)buf = 134218498;
        v20 = self;
        __int16 v21 = 2112;
        v22 = fireDate;
        __int16 v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Past [%@]. Will not start. %@", buf, 0x20u);
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v7 = self->_fireDate;
        v8 = [(ATXInformationHeuristicRefreshTrigger *)self registeredHeuristics];
        *(_DWORD *)buf = 134218498;
        v20 = self;
        __int16 v21 = 2112;
        v22 = v7;
        __int16 v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Start [%@]. %@", buf, 0x20u);
      }
      objc_initWeak((id *)buf, self);
      v9 = dispatch_get_global_queue(25, 0);
      objc_super v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v9);
      source = self->_source;
      self->_source = v10;

      v12 = self->_source;
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
      v14 = self->_source;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __51__ATXInformationHeuristicRefreshTimeTrigger__start__block_invoke;
      handler[3] = &unk_1E68A5060;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_source_set_event_handler(v14, handler);
      dispatch_resume((dispatch_object_t)self->_source);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __51__ATXInformationHeuristicRefreshTimeTrigger__start__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_opt_new();
    [v2 timeIntervalSinceDate:WeakRetained[4]];
    uint64_t v4 = v3;
    v5 = __atxlog_handle_gi();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = WeakRetained[4];
      uint64_t v7 = [WeakRetained registeredHeuristics];
      int v10 = 134218754;
      v11 = WeakRetained;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Fired [%@] %0.1fs after date. Triggering heuristics refresh. %@", (uint8_t *)&v10, 0x2Au);
    }
    v8 = [WeakRetained delegate];
    v9 = [WeakRetained registeredHeuristics];
    [v8 informationHeuristicRefreshTrigger:WeakRetained didTriggerRefreshForHeuristics:v9];
  }
}

- (void)_stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_source)
  {
    uint64_t v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      fireDate = self->_fireDate;
      v5 = [(ATXInformationHeuristicRefreshTrigger *)self registeredHeuristics];
      int v7 = 134218498;
      v8 = self;
      __int16 v9 = 2112;
      int v10 = fireDate;
      __int16 v11 = 2112;
      __int16 v12 = v5;
      _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshTimeTrigger (%p): Stopped [%@]. %@.", (uint8_t *)&v7, 0x20u);
    }
    dispatch_source_cancel((dispatch_source_t)self->_source);
    source = self->_source;
    self->_source = 0;
  }
}

- (unint64_t)hash
{
  return [(NSDate *)self->_fireDate hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXInformationHeuristicRefreshTimeTrigger *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  fireDate = self->_fireDate;
  if (fireDate == v4->_fireDate) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSDate isEqual:](fireDate, "isEqual:");
  }
LABEL_7:

  return v6;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"InfoHeuristicRefreshTimeTrigger at %@", self->_fireDate];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshTimeTrigger;
  id v4 = a3;
  [(ATXInformationHeuristicRefreshTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fireDate, @"fireDate", v5.receiver, v5.super_class);
}

- (ATXInformationHeuristicRefreshTimeTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXInformationHeuristicRefreshTimeTrigger;
  objc_super v5 = [(ATXInformationHeuristicRefreshTrigger *)&v12 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  char v6 = [v4 error];

  if (v6) {
    goto LABEL_3;
  }
  uint64_t v9 = [(ATXInformationHeuristicRefreshTrigger *)v5 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"fireDate" withCoder:v4 nonNull:1];
  fireDate = v5->_fireDate;
  v5->_fireDate = (NSDate *)v9;

  if (!v5->_fireDate
    || ([v4 error], __int16 v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
LABEL_3:
    int v7 = 0;
  }
  else
  {
    int v7 = v5;
  }

  return v7;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end