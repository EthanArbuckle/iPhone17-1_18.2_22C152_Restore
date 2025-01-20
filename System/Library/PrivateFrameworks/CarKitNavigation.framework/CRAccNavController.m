@interface CRAccNavController
- (CRAccNavComponent)component;
- (CRAccNavController)initWithComponent:(id)a3 delegate:(id)a4;
- (CRAccNavControllerDelegate)delegate;
- (CRAccNavInfoCache)sentLaneGuidances;
- (CRAccNavInfoCache)sentManeuvers;
- (CRAccNavRouteGuidance)routeGuidance;
- (NSUUID)uuid;
- (id)description;
- (void)_sendNavInfoFromIndex:(id)a3 fromSource:(id)a4 cache:(id)a5;
- (void)delegateUpdatedLaneGuidance:(id)a3;
- (void)delegateUpdatedLaneGuidances;
- (void)delegateUpdatedManeuver:(id)a3;
- (void)delegateUpdatedManeuvers;
- (void)delegateUpdatedRouteGuidance;
- (void)resendInfo;
- (void)reset;
- (void)sendInfo;
- (void)sendLaneGuidances;
- (void)sendManeuvers;
- (void)setRouteGuidance:(id)a3;
- (void)setSentLaneGuidances:(id)a3;
- (void)setSentManeuvers:(id)a3;
@end

@implementation CRAccNavController

- (CRAccNavController)initWithComponent:(id)a3 delegate:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CRAccNavController;
  v9 = [(CRAccNavController *)&v21 init];
  if (v9)
  {
    v10 = CarNavLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v7 configDescription];
      *(_DWORD *)buf = 138544130;
      v23 = v9;
      __int16 v24 = 2114;
      id v25 = v8;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_24986C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ init! delegate=%{public}@ component=%{public}@ config=%{public}@", buf, 0x2Au);
    }
    objc_storeStrong((id *)&v9->_component, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v12 = [CRAccNavInfoCache alloc];
    v13 = [v7 component];
    uint64_t v14 = -[CRAccNavInfoCache initWithCountLimit:](v12, "initWithCountLimit:", objc_msgSend(v13, "maxCapacity_GuidanceManeuver"));
    sentManeuvers = v9->_sentManeuvers;
    v9->_sentManeuvers = (CRAccNavInfoCache *)v14;

    v16 = [CRAccNavInfoCache alloc];
    v17 = [v7 component];
    uint64_t v18 = -[CRAccNavInfoCache initWithCountLimit:](v16, "initWithCountLimit:", objc_msgSend(v17, "maxCapacity_LaneGuidance"));
    sentLaneGuidances = v9->_sentLaneGuidances;
    v9->_sentLaneGuidances = (CRAccNavInfoCache *)v18;

    [(CRAccNavController *)v9 reset];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRAccNavController *)self component];
  v6 = [v5 uuid];
  id v7 = [v3 stringWithFormat:@"<%@: %p component=%@>", v4, self, v6];

  return v7;
}

- (NSUUID)uuid
{
  v2 = [(CRAccNavController *)self component];
  v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (void)sendInfo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_24986C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ sendInfo", (uint8_t *)&v7, 0xCu);
  }

  [(CRAccNavController *)self sendManeuvers];
  [(CRAccNavController *)self sendLaneGuidances];
  uint64_t v4 = [(CRAccNavController *)self delegate];
  v5 = [(CRAccNavController *)self routeGuidance];
  v6 = [(CRAccNavController *)self uuid];
  [v4 sendInfo:v5 toComponentUID:v6];
}

- (void)resendInfo
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CRAccNavController *)self sentManeuvers];
    uint64_t v5 = [v4 count];
    v6 = [(CRAccNavController *)self sentLaneGuidances];
    uint64_t v7 = [v6 count];
    id v8 = [(CRAccNavController *)self routeGuidance];
    uint64_t v9 = @"YES";
    *(_DWORD *)buf = 138544130;
    v53 = self;
    if (!v8) {
      uint64_t v9 = @"NO";
    }
    __int16 v54 = 2048;
    uint64_t v55 = v5;
    __int16 v56 = 2048;
    uint64_t v57 = v7;
    __int16 v58 = 2114;
    v59 = v9;
    _os_log_impl(&dword_24986C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ resendInfo sentManeuvers.count=%ld sentLaneGuidances.count=%ld routeGuidance=%{public}@", buf, 0x2Au);
  }
  v10 = [(CRAccNavController *)self delegate];
  v11 = [(CRAccNavController *)self component];
  v12 = +[CRAccNavRouteGuidance resetForComponent:v11];
  v13 = [(CRAccNavController *)self uuid];
  [v10 sendInfo:v12 toComponentUID:v13];

  uint64_t v14 = [(CRAccNavController *)self delegate];
  v15 = [(CRAccNavController *)self component];
  v16 = [(CRAccNavController *)self delegate];
  uint64_t v17 = [v16 sourceName];
  uint64_t v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"Unknown";
  }
  v20 = [(CRAccNavController *)self delegate];
  objc_super v21 = +[CRAccNavRouteGuidance loadingForComponent:sourceName:sourceSupported:](CRAccNavRouteGuidance, "loadingForComponent:sourceName:sourceSupported:", v15, v19, [v20 sourceSupported]);
  v22 = [(CRAccNavController *)self uuid];
  [v14 sendInfo:v21 toComponentUID:v22];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v23 = [(CRAccNavController *)self sentManeuvers];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v29 = [(CRAccNavController *)self delegate];
        uint64_t v30 = [(CRAccNavController *)self uuid];
        [v29 sendInfo:v28 toComponentUID:v30];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v25);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v31 = [(CRAccNavController *)self sentLaneGuidances];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v42 + 1) + 8 * j);
        v37 = [(CRAccNavController *)self delegate];
        v38 = [(CRAccNavController *)self uuid];
        [v37 sendInfo:v36 toComponentUID:v38];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v33);
  }

  v39 = [(CRAccNavController *)self delegate];
  v40 = [(CRAccNavController *)self routeGuidance];
  v41 = [(CRAccNavController *)self uuid];
  [v39 sendInfo:v40 toComponentUID:v41];
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_24986C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reset", (uint8_t *)&v10, 0xCu);
  }

  [(CRAccNavController *)self setRouteGuidance:0];
  uint64_t v4 = [(CRAccNavController *)self sentManeuvers];
  [v4 removeAllObjects];

  uint64_t v5 = [(CRAccNavController *)self sentLaneGuidances];
  [v5 removeAllObjects];

  v6 = [(CRAccNavController *)self delegate];
  uint64_t v7 = [(CRAccNavController *)self component];
  id v8 = +[CRAccNavRouteGuidance resetForComponent:v7];
  uint64_t v9 = [(CRAccNavController *)self uuid];
  [v6 sendInfo:v8 toComponentUID:v9];
}

- (void)delegateUpdatedRouteGuidance
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_24986C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated routeguidance", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v4 = [(CRAccNavController *)self delegate];
  uint64_t v5 = [v4 routeGuidanceProviding];
  v6 = [(CRAccNavController *)self component];
  uint64_t v7 = [v5 navInfoWithComponent:v6];
  [(CRAccNavController *)self setRouteGuidance:v7];

  [(CRAccNavController *)self sendManeuvers];
  [(CRAccNavController *)self sendLaneGuidances];
  id v8 = [(CRAccNavController *)self delegate];
  uint64_t v9 = [(CRAccNavController *)self routeGuidance];
  int v10 = [(CRAccNavController *)self uuid];
  [v8 sendInfo:v9 toComponentUID:v10];
}

- (void)delegateUpdatedManeuvers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(CRAccNavController *)self delegate];
    uint64_t v5 = [v4 maneuversProvidingIndexed];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [(CRAccNavController *)self routeGuidance];
    int v20 = 138543874;
    objc_super v21 = self;
    __int16 v22 = 2048;
    uint64_t v23 = v6;
    __int16 v24 = 1024;
    int v25 = [v7 guidanceState];
    _os_log_impl(&dword_24986C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated maneuvers count=%lu guidanceState=%hhu", (uint8_t *)&v20, 0x1Cu);
  }
  id v8 = [(CRAccNavController *)self routeGuidance];
  int v9 = [v8 guidanceState];

  if (!v9)
  {
    int v10 = [(CRAccNavController *)self component];
    int v11 = [(CRAccNavController *)self delegate];
    uint64_t v12 = [v11 sourceName];
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = @"Unknown";
    }
    v15 = [(CRAccNavController *)self delegate];
    v16 = +[CRAccNavRouteGuidance loadingForComponent:sourceName:sourceSupported:](CRAccNavRouteGuidance, "loadingForComponent:sourceName:sourceSupported:", v10, v14, [v15 sourceSupported]);
    [(CRAccNavController *)self setRouteGuidance:v16];

    uint64_t v17 = [(CRAccNavController *)self delegate];
    uint64_t v18 = [(CRAccNavController *)self routeGuidance];
    v19 = [(CRAccNavController *)self uuid];
    [v17 sendInfo:v18 toComponentUID:v19];
  }
  [(CRAccNavController *)self sendManeuvers];
}

- (void)delegateUpdatedManeuver:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CRAccNavController *)self sentManeuvers];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = CarNavLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = self;
      __int16 v17 = 1024;
      int v18 = [v4 index];
      _os_log_impl(&dword_24986C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated maneuver %d", (uint8_t *)&v15, 0x12u);
    }

    int v9 = [(CRAccNavController *)self component];
    int v10 = [v4 navInfoWithComponent:v9];

    int v11 = [(CRAccNavController *)self sentManeuvers];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
    [v11 setObject:v10 forKeyedSubscript:v12];

    uint64_t v13 = [(CRAccNavController *)self delegate];
    uint64_t v14 = [(CRAccNavController *)self uuid];
    [v13 sendInfo:v10 toComponentUID:v14];
  }
}

- (void)delegateUpdatedLaneGuidances
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = CarNavLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CRAccNavController *)self delegate];
    uint64_t v5 = [v4 laneGuidanceProvidingIndexed];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [(CRAccNavController *)self routeGuidance];
    int v20 = 138543874;
    objc_super v21 = self;
    __int16 v22 = 2048;
    uint64_t v23 = v6;
    __int16 v24 = 1024;
    int v25 = [v7 guidanceState];
    _os_log_impl(&dword_24986C000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated laneGuidances count=%lu guidanceState=%hhu", (uint8_t *)&v20, 0x1Cu);
  }
  id v8 = [(CRAccNavController *)self routeGuidance];
  int v9 = [v8 guidanceState];

  if (!v9)
  {
    int v10 = [(CRAccNavController *)self component];
    int v11 = [(CRAccNavController *)self delegate];
    uint64_t v12 = [v11 sourceName];
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = @"Unknown";
    }
    int v15 = [(CRAccNavController *)self delegate];
    v16 = +[CRAccNavRouteGuidance loadingForComponent:sourceName:sourceSupported:](CRAccNavRouteGuidance, "loadingForComponent:sourceName:sourceSupported:", v10, v14, [v15 sourceSupported]);
    [(CRAccNavController *)self setRouteGuidance:v16];

    __int16 v17 = [(CRAccNavController *)self delegate];
    int v18 = [(CRAccNavController *)self routeGuidance];
    uint64_t v19 = [(CRAccNavController *)self uuid];
    [v17 sendInfo:v18 toComponentUID:v19];
  }
  [(CRAccNavController *)self sendLaneGuidances];
}

- (void)delegateUpdatedLaneGuidance:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CRAccNavController *)self sentLaneGuidances];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = CarNavLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543618;
      v16 = self;
      __int16 v17 = 1024;
      int v18 = [v4 index];
      _os_log_impl(&dword_24986C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ delegate updated laneGuidance %d", (uint8_t *)&v15, 0x12u);
    }

    int v9 = [(CRAccNavController *)self component];
    int v10 = [v4 navInfoWithComponent:v9];

    int v11 = [(CRAccNavController *)self sentLaneGuidances];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v4, "index"));
    [v11 setObject:v10 forKeyedSubscript:v12];

    uint64_t v13 = [(CRAccNavController *)self delegate];
    uint64_t v14 = [(CRAccNavController *)self uuid];
    [v13 sendInfo:v10 toComponentUID:v14];
  }
}

- (void)sendManeuvers
{
  v2 = [a1 delegate];
  v3 = [v2 maneuversProvidingIndexed];
  [v3 count];
  id v4 = [a1 sentManeuvers];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24986C000, v5, v6, "%{public}@ sendManeuvers start source.count=%lu cache=%{public}@", v7, v8, v9, v10, v11);
}

- (void)sendLaneGuidances
{
  v2 = [a1 delegate];
  v3 = [v2 laneGuidanceProvidingIndexed];
  [v3 count];
  id v4 = [a1 sentLaneGuidances];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24986C000, v5, v6, "%{public}@ sendLaneGuidances done source.count=%lu cache=%{public}@", v7, v8, v9, v10, v11);
}

- (void)_sendNavInfoFromIndex:(id)a3 fromSource:(id)a4 cache:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  int v25 = v10;
  if (v10)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = v10;
    while (1)
    {
      if (v12 >= objc_msgSend(v9, "countLimit", v25)) {
        goto LABEL_12;
      }
      uint64_t v14 = [v9 objectForKeyedSubscript:v13];
      if (v14) {
        break;
      }
      v16 = [v8 objectForKeyedSubscript:v13];

      if (v16)
      {
        int v15 = [v8 objectForKeyedSubscript:v13];
        __int16 v17 = [(CRAccNavController *)self component];
        int v18 = [v15 navInfoWithComponent:v17];

        [v9 setObject:v18 forKeyedSubscript:v13];
        uint64_t v19 = [(CRAccNavController *)self delegate];
        [(CRAccNavController *)self component];
        objc_super v21 = v20 = v11;
        __int16 v22 = [v21 uuid];
        [v19 sendInfo:v18 toComponentUID:v22];

        uint64_t v11 = v20 + 1;
        goto LABEL_8;
      }
LABEL_9:
      ++v12;
      uint64_t v23 = [v8 keyAfter:v13];

      uint64_t v13 = (void *)v23;
      if (!v23) {
        goto LABEL_12;
      }
    }
    int v15 = (void *)v14;
LABEL_8:

    goto LABEL_9;
  }
  unint64_t v12 = 0;
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_12:
  __int16 v24 = CarNavLogging();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544642;
    uint64_t v28 = self;
    __int16 v29 = 2114;
    uint64_t v30 = v25;
    __int16 v31 = 2048;
    uint64_t v32 = v11;
    __int16 v33 = 2048;
    uint64_t v34 = [v8 count];
    __int16 v35 = 2048;
    unint64_t v36 = v12;
    __int16 v37 = 2048;
    uint64_t v38 = [v9 count];
    _os_log_debug_impl(&dword_24986C000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ sendNavInfo fromIndex=%{public}@ sentIndexes=%lu source=%lu cache=%lu/%lu", buf, 0x3Eu);
  }
}

- (CRAccNavComponent)component
{
  return self->_component;
}

- (CRAccNavControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRAccNavControllerDelegate *)WeakRetained;
}

- (CRAccNavRouteGuidance)routeGuidance
{
  return self->_routeGuidance;
}

- (void)setRouteGuidance:(id)a3
{
}

- (CRAccNavInfoCache)sentManeuvers
{
  return self->_sentManeuvers;
}

- (void)setSentManeuvers:(id)a3
{
}

- (CRAccNavInfoCache)sentLaneGuidances
{
  return self->_sentLaneGuidances;
}

- (void)setSentLaneGuidances:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentLaneGuidances, 0);
  objc_storeStrong((id *)&self->_sentManeuvers, 0);
  objc_storeStrong((id *)&self->_routeGuidance, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_component, 0);
}

@end