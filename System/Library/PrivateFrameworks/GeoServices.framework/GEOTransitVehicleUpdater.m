@interface GEOTransitVehicleUpdater
- (BOOL)isActive;
- (GEOTransitVehicleUpdater)initWithDelegate:(id)a3;
- (GEOTransitVehicleUpdaterDelegate)delegate;
- (NSSet)tripIDs;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTripIDs:(id)a3;
@end

@implementation GEOTransitVehicleUpdater

- (void)setTripIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = (NSSet *)a3;
  tripIDs = self->_tripIDs;
  if (tripIDs == v5 || [(NSSet *)tripIDs isEqualToSet:v5])
  {
    v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134218242;
      uint64_t v14 = [(NSSet *)v5 count];
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Setting %lu identical tripIds for %@, no action required", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(NSSet *)v5 count];
      BOOL v10 = [(GEOTransitVehicleUpdater *)self isActive];
      v11 = @"No";
      int v13 = 134218755;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      if (v10) {
        v11 = @"Yes";
      }
      v16 = self;
      __int16 v17 = 2113;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Setting %lu tripIds for %@ to %{private}@ (active:%@)", (uint8_t *)&v13, 0x2Au);
    }

    v12 = +[GEOTransitVehicleUpdateRequester sharedInstance];
    v7 = v12;
    if (self->_active)
    {
      [v12 unregisterVehicleUpdater:self];
      objc_storeStrong((id *)&self->_tripIDs, a3);
      [v7 registerVehicleUpdater:self];
    }
    else
    {
      objc_storeStrong((id *)&self->_tripIDs, a3);
    }
  }
}

- (GEOTransitVehicleUpdater)initWithDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: delegate != ((void *)0)", buf, 2u);
    }
    v6 = 0;
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitVehicleUpdater;
  v5 = [(GEOTransitVehicleUpdater *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
    self = (GEOTransitVehicleUpdater *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v10 = v6;
      _os_log_impl(&dword_188D96000, &self->super, OS_LOG_TYPE_INFO, "Created %@", buf, 0xCu);
    }
LABEL_5:
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "Deallocing %@", buf, 0xCu);
  }

  id v4 = +[GEOTransitVehicleUpdateRequester sharedInstance];
  [v4 unregisterVehicleUpdater:self];

  v5.receiver = self;
  v5.super_class = (Class)GEOTransitVehicleUpdater;
  [(GEOTransitVehicleUpdater *)&v5 dealloc];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOTransitVehicleUpdate");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = @"inactive";
    if (v3) {
      v6 = @"active";
    }
    int v9 = 138412546;
    BOOL v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@", (uint8_t *)&v9, 0x16u);
  }

  v7 = +[GEOTransitVehicleUpdateRequester sharedInstance];
  uint64_t v8 = v7;
  self->_active = v3;
  if (v3) {
    [v7 registerVehicleUpdater:self];
  }
  else {
    [v7 unregisterVehicleUpdater:self];
  }
}

- (GEOTransitVehicleUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOTransitVehicleUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)tripIDs
{
  return self->_tripIDs;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripIDs, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end