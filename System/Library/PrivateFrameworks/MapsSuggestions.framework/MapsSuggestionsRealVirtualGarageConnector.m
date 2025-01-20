@interface MapsSuggestionsRealVirtualGarageConnector
- (MapsSuggestionsVirtualGarageConnectorDelegate)delegate;
- (NSString)uniqueName;
- (void)closeVGConnection;
- (void)fetchStateOfChargeForVehicleWithIdentifier:(id)a3 handler:(id)a4;
- (void)fetchUnpairedVehiclesWithHandler:(id)a3;
- (void)openVGConnection;
- (void)setDelegate:(id)a3;
- (void)startObservingVG;
- (void)stopObservingVG;
- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4;
@end

@implementation MapsSuggestionsRealVirtualGarageConnector

- (void)setDelegate:(id)a3
{
}

- (void)openVGConnection
{
  id v3 = [MEMORY[0x1E4FB3E40] sharedService];
  [v3 openForClient:self];
}

- (void)closeVGConnection
{
  id v3 = [MEMORY[0x1E4FB3E40] sharedService];
  [v3 closeForClient:self];
}

- (void)startObservingVG
{
  id v3 = [MEMORY[0x1E4FB3E40] sharedService];
  [v3 registerObserver:self];
}

- (void)stopObservingVG
{
  id v3 = [MEMORY[0x1E4FB3E40] sharedService];
  [v3 unregisterObserver:self];
}

- (void)fetchUnpairedVehiclesWithHandler:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FB3E40];
  id v4 = a3;
  id v5 = [v3 sharedService];
  [v5 virtualGarageGetListOfUnpairedVehiclesWithReply:v4];
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MapsSuggestionsRealVirtualGarageConnector *)self delegate];
  if (v8)
  {
    if (objc_opt_respondsToSelector()) {
      [v8 virtualGarageDidUpdateUnpairedVehicles:v7];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      v11 = "MapsSuggestionsRealVirtualGarageConnector.m";
      __int16 v12 = 1026;
      int v13 = 63;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsRealVirtualGarageConnector virtualGarage:didUpdateUnpairedVehicles:]";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)fetchStateOfChargeForVehicleWithIdentifier:(id)a3 handler:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB3E40];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedService];
  [v8 virtualGarageGetLatestStateOfVehicleWithIdentifier:v7 syncAcrossDevices:0 withReply:v6];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsVirtualGarageConnectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MapsSuggestionsVirtualGarageConnectorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end