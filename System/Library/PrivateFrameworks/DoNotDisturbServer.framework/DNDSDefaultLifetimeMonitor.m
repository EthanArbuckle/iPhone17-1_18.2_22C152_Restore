@interface DNDSDefaultLifetimeMonitor
+ (Class)lifetimeClass;
- (id)updateForModeAssertions:(id)a3 date:(id)a4;
@end

@implementation DNDSDefaultLifetimeMonitor

+ (Class)lifetimeClass
{
  return (Class)objc_opt_class();
}

- (id)updateForModeAssertions:(id)a3 date:(id)a4
{
  id v5 = a3;
  v6 = [(DNDSBaseLifetimeMonitor *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = DNDSLogDefaultLifetimeMonitor;
  if (os_log_type_enabled((os_log_t)DNDSLogDefaultLifetimeMonitor, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Refreshing monitor", v12, 2u);
  }
  v8 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_3);

  v9 = [DNDSLifetimeMonitorResult alloc];
  v10 = [(DNDSLifetimeMonitorResult *)v9 initWithActiveUUIDs:v8 expiredUUIDs:MEMORY[0x1E4F1CBF0]];

  return v10;
}

uint64_t __59__DNDSDefaultLifetimeMonitor_updateForModeAssertions_date___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

@end