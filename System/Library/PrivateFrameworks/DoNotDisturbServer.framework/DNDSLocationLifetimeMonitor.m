@interface DNDSLocationLifetimeMonitor
- (CLLocationManager)locationManager;
- (DNDSLifetimeMonitorDelegate)delegate;
- (DNDSLocationLifetimeMonitor)initWithMeDeviceService:(id)a3;
- (DNDSLocationLifetimeMonitorDataSource)dataSource;
- (NSArray)activeLifetimeAssertionUUIDs;
- (OS_dispatch_queue)queue;
- (unint64_t)availableRegions;
- (void)_queue_refreshMonitorForDate:(id)a3;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)meDeviceService:(id)a3 didReceiveMeDeviceStateUpdate:(id)a4;
- (void)refreshMonitorForDate:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSLocationLifetimeMonitor

- (DNDSLocationLifetimeMonitor)initWithMeDeviceService:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DNDSLocationLifetimeMonitor;
  v6 = [(DNDSLocationLifetimeMonitor *)&v23 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.donotdisturb.server.LocationLifetimeMonitor", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_meDeviceService, a3);
    [v5 addListener:v6];
    v10 = [[DNDSUntilExitLocationLifetimeMonitor alloc] initWithAggregateMonitor:v6];
    untilExitMonitor = v6->_untilExitMonitor;
    v6->_untilExitMonitor = v10;

    v12 = [[DNDSExplicitRegionLocationLifetimeMonitor alloc] initWithAggregateMonitor:v6];
    explicitRegionMonitor = v6->_explicitRegionMonitor;
    v6->_explicitRegionMonitor = v12;

    v14 = v6->_untilExitMonitor;
    v24[0] = v6->_explicitRegionMonitor;
    v24[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    children = v6->_children;
    v6->_children = (NSArray *)v15;

    v17 = [v5 meDeviceState];
    uint64_t v18 = [v17 meDeviceStatus];

    if (v18 == 2)
    {
      v19 = v6->_queue;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __55__DNDSLocationLifetimeMonitor_initWithMeDeviceService___block_invoke;
      v21[3] = &unk_1E6973540;
      v22 = v6;
      dispatch_sync(v19, v21);
    }
  }

  return v6;
}

void __55__DNDSLocationLifetimeMonitor_initWithMeDeviceService___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1E600]);
  objc_msgSend(MEMORY[0x1E4F28B50], "dnd_locationBundle");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [v7 bundlePath];
  uint64_t v4 = [v2 initWithEffectiveBundlePath:v3 delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

- (NSArray)activeLifetimeAssertionUUIDs
{
  v3 = [(DNDSExplicitRegionLocationLifetimeMonitor *)self->_explicitRegionMonitor activeLifetimeAssertionUUIDs];
  uint64_t v4 = [(DNDSUntilExitLocationLifetimeMonitor *)self->_untilExitMonitor activeLifetimeAssertionUUIDs];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (void)refreshMonitorForDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__DNDSLocationLifetimeMonitor_refreshMonitorForDate___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __53__DNDSLocationLifetimeMonitor_refreshMonitorForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshMonitorForDate:", *(void *)(a1 + 40));
}

- (unint64_t)availableRegions
{
  v3 = [(CLLocationManager *)self->_locationManager monitoredRegions];
  uint64_t v4 = [v3 count];
  unint64_t v5 = ~v4 + [(DNDSUntilExitLocationLifetimeMonitor *)self->_untilExitMonitor hasCurrentRegion] + 20;

  return v5;
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = self->_children;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "locationManager:monitoringDidFailForRegion:withError:", v8, v9, v10, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->_children;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v15, "locationManager:didDetermineState:forRegion:", v8, a4, v9, (void)v16);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_children;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "locationManager:didUpdateLocations:", v6, v7, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_children;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "locationManager:didFailWithError:", v6, v7, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)meDeviceService:(id)a3 didReceiveMeDeviceStateUpdate:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__DNDSLocationLifetimeMonitor_meDeviceService_didReceiveMeDeviceStateUpdate___block_invoke;
  v8[3] = &unk_1E69735B8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

uint64_t __77__DNDSLocationLifetimeMonitor_meDeviceService_didReceiveMeDeviceStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) meDeviceStatus];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 16);
  if (result == 2)
  {
    if (v4) {
      return result;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F1E600]);
    id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "dnd_locationBundle");
    id v7 = [v6 bundlePath];
    uint64_t v8 = [v5 initWithEffectiveBundlePath:v7 delegate:*(void *)(a1 + 40) onQueue:*(void *)(*(void *)(a1 + 40) + 8)];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = v8;

    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t result = objc_msgSend(v11, "_queue_refreshMonitorForDate:", v12);
    uint64_t v4 = v12;
  }
  else
  {
    *(void *)(v3 + 16) = 0;
  }
  return MEMORY[0x1F41817F8](result, v4);
}

- (void)_queue_refreshMonitorForDate:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(DNDSExplicitRegionLocationLifetimeMonitor *)self->_explicitRegionMonitor refreshMonitorForDate:v5];
  [(DNDSUntilExitLocationLifetimeMonitor *)self->_untilExitMonitor refreshMonitorForDate:v5];
}

- (DNDSLocationLifetimeMonitorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSLocationLifetimeMonitorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (DNDSLifetimeMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSLifetimeMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_explicitRegionMonitor, 0);
  objc_storeStrong((id *)&self->_untilExitMonitor, 0);
  objc_storeStrong((id *)&self->_meDeviceService, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end