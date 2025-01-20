@interface CPSNavigator
- (BOOL)appSupportsInstrumentCluster;
- (BOOL)isCompleted;
- (BOOL)sendsNavigationMetadata;
- (CARNavigationOwnershipManagerDelegate)navigationOwnershipDelegate;
- (CARSession)currentSession;
- (CPSNavigationMetadataDelegate)metadataDelegate;
- (CPSNavigator)initWithIdentifier:(id)a3 currentSession:(id)a4 forTrip:(id)a5;
- (CPTrip)trip;
- (NSHashTable)displayDelegates;
- (void)_sync_displayUpdateManeuverTravelEstimates:(id)a3 forManeuver:(id)a4;
- (void)_sync_displayUpdateTripTravelEstimates:(id)a3;
- (void)addDisplayDelegate:(id)a3;
- (void)addLaneGuidances:(id)a3;
- (void)addManeuvers:(id)a3;
- (void)cancelTrip;
- (void)clearCurrentLaneGuidance;
- (void)dealloc;
- (void)finishTrip;
- (void)invalidate;
- (void)navigationOwnershipChangedToOwner:(unint64_t)a3;
- (void)pauseTripForReason:(unint64_t)a3 description:(id)a4 turnCardColor:(id)a5;
- (void)removeDisplayDelegate:(id)a3;
- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4;
- (void)setAppSupportsInstrumentCluster:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCurrentLaneGuidance:(id)a3;
- (void)setCurrentRoadNameVariants:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setDestinationNameVariants:(id)a3;
- (void)setDisplayDelegates:(id)a3;
- (void)setManeuverState:(int64_t)a3;
- (void)setMetadataDelegate:(id)a3;
- (void)setNavigationOwnershipDelegate:(id)a3;
- (void)setSendsNavigationMetadata:(BOOL)a3;
- (void)setTrip:(id)a3;
- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4;
- (void)startRerouting;
- (void)updateTravelEstimates:(id)a3 forManeuver:(id)a4;
- (void)updateTripTravelEstimates:(id)a3;
@end

@implementation CPSNavigator

- (CPSNavigator)initWithIdentifier:(id)a3 currentSession:(id)a4 forTrip:(id)a5
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)CPSNavigator;
  v12 = [(CPSNavigator *)&v13 init];
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    v6 = (NSHashTable *)(id)[MEMORY[0x263F088B0] weakObjectsHashTable];
    displayDelegates = v17->_displayDelegates;
    v17->_displayDelegates = v6;

    objc_storeStrong((id *)&v17->_currentSession, v15);
    objc_storeStrong((id *)&v17->_trip, v14);
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (void)setAppSupportsInstrumentCluster:(BOOL)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  if (self->_appSupportsInstrumentCluster != a3)
  {
    v9->_appSupportsInstrumentCluster = v7;
    if (v9->_appSupportsInstrumentCluster)
    {
      uint64_t v6 = [objc_alloc(NSURL) initWithString:@"maps:/car/instrumentcluster"];
      uint64_t v5 = [objc_alloc(NSURL) initWithString:@"maps:/car/instrumentcluster/map"];
      currentSession = v9->_currentSession;
      v10[0] = v6;
      v10[1] = v5;
      id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
      -[CARSession suggestUI:](currentSession, "suggestUI:");

      objc_storeStrong((id *)&v5, 0);
      objc_storeStrong((id *)&v6, 0);
    }
  }
}

- (void)invalidate
{
  [(CPSNavigator *)self setMetadataDelegate:0];
  v2 = [(CPSNavigator *)self displayDelegates];
  [(NSHashTable *)v2 removeAllObjects];
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  [(CPSNavigator *)self invalidate];
  v2.receiver = v4;
  v2.super_class = (Class)CPSNavigator;
  [(CPSNavigator *)&v2 dealloc];
}

- (void)setCompleted:(BOOL)a3
{
  if (self->_completed != a3) {
    self->_completed = a3;
  }
}

- (void)addDisplayDelegate:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = [(CPSNavigator *)v5 displayDelegates];
  [(NSHashTable *)v3 addObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)removeDisplayDelegate:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = [(CPSNavigator *)v5 displayDelegates];
  [(NSHashTable *)v3 removeObject:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setCurrentLaneGuidance:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = [(CPSNavigator *)v5 metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v3 setCurrentLaneGuidance:location[0]];

  objc_storeStrong(location, 0);
}

- (void)clearCurrentLaneGuidance
{
  objc_super v2 = [(CPSNavigator *)self metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v2 setCurrentLaneGuidance:0];
}

- (void)setManeuverState:(int64_t)a3
{
  SEL v3 = [(CPSNavigator *)self metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v3 setManeuverState:a3];
}

- (void)setCurrentRoadNameVariants:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = [(CPSNavigator *)v5 metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v3 setCurrentRoadNameVariants:location[0]];

  objc_storeStrong(location, 0);
}

- (void)addManeuvers:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = [(CPSNavigator *)v5 metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v3 addManeuvers:location[0]];

  objc_storeStrong(location, 0);
}

- (void)addLaneGuidances:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = [(CPSNavigator *)v5 metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v3 addLaneGuidances:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setSendsNavigationMetadata:(BOOL)a3
{
  self->_sendsNavigationMetadata = a3;
  BOOL v3 = a3;
  id v4 = [(CPSNavigator *)self metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v4 setSendsNavigationMetadata:v3];
}

- (void)setDestinationNameVariants:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  id v4 = [(CPSNavigator *)v6 metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v4 setDestinationNameVariants:v3];

  objc_storeStrong(location, 0);
}

- (void)pauseTripForReason:(unint64_t)a3 description:(id)a4 turnCardColor:(id)a5
{
  v19 = self;
  SEL v18 = a2;
  v17 = (void *)a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  queue = MEMORY[0x263EF83A0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __61__CPSNavigator_pauseTripForReason_description_turnCardColor___block_invoke;
  v11 = &unk_2648A4C40;
  v12 = v19;
  v14[1] = v17;
  id v13 = location;
  v14[0] = v15;
  dispatch_sync(queue, &v7);

  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);
}

void __61__CPSNavigator_pauseTripForReason_description_turnCardColor___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  id v5 = (id)[*(id *)(a1 + 32) metadataDelegate];
  [v5 pauseTripForReason:*(void *)(a1 + 56)];

  memset(__b, 0, sizeof(__b));
  id obj = (id)[*(id *)(a1 + 32) displayDelegates];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    unint64_t v4 = v8;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v3);
      if (objc_opt_respondsToSelector()) {
        [v10 navigator:*(void *)(a1 + 32) pausedTripForReason:*(void *)(a1 + 56) description:*(void *)(a1 + 40) usingColor:*(void *)(a1 + 48)];
      }
      ++v3;
      if (v1 + 1 >= v4)
      {
        uint64_t v3 = 0;
        unint64_t v4 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

- (void)startRerouting
{
  uint64_t v2 = [(CPSNavigator *)self metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v2 startRerouting];
}

- (void)routeChangedWithReason:(unsigned __int8)a3 routeInfo:(id)a4
{
  v17 = self;
  SEL v16 = a2;
  unsigned __int8 v15 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v4 = [(CPSNavigator *)v17 metadataDelegate];
  [(CPSNavigationMetadataDelegate *)v4 routeChangedWithReason:v15 routeInfo:location];

  objc_initWeak(&v13, v17);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __49__CPSNavigator_routeChangedWithReason_routeInfo___block_invoke;
  id v10 = &unk_2648A4C68;
  objc_copyWeak(&v12, &v13);
  id v11 = location;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&location, 0);
}

void __49__CPSNavigator_routeChangedWithReason_routeInfo___block_invoke(id *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  v11[0] = objc_loadWeakRetained(a1 + 5);
  id v1 = v11[0];
  id v3 = (id)[a1[4] routeGuidance];
  id v2 = (id)[v3 tripTravelEstimates];
  objc_msgSend(v1, "_sync_displayUpdateTripTravelEstimates:");

  id v5 = v11[0];
  id v10 = (id)[a1[4] routeGuidance];
  id v9 = (id)[v10 maneuverTravelEstimates];
  id v8 = (id)[a1[4] routeGuidance];
  id v7 = (id)[v8 currentManeuvers];
  id v6 = (id)[v7 firstObject];
  objc_msgSend(v5, "_sync_displayUpdateManeuverTravelEstimates:forManeuver:", v9);

  objc_storeStrong(v11, 0);
}

- (void)finishTrip
{
  id v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __26__CPSNavigator_finishTrip__block_invoke;
  id v7 = &unk_2648A3BE0;
  v8[0] = v9;
  dispatch_sync(queue, &v3);

  objc_storeStrong(v8, 0);
}

void __26__CPSNavigator_finishTrip__block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = a1;
  id v8 = (id)[a1[4] metadataDelegate];
  [v8 finishTrip];

  if (*((unsigned char *)a1[4] + 8)) {
    [*((id *)a1[4] + 6) suggestUI:MEMORY[0x263EFFA68]];
  }
  id v5 = (id)[a1[4] displayDelegates];
  location[0] = (id)[v5 copy];

  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    unint64_t v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v3);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v11, "showManeuvers:usingDisplayStyles:", MEMORY[0x263EFFA68]);
      }
      if (objc_opt_respondsToSelector()) {
        [v11 navigator:a1[4] didEndTrip:1];
      }
      ++v3;
      if (v1 + 1 >= v4)
      {
        uint64_t v3 = 0;
        unint64_t v4 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }

  objc_storeStrong((id *)a1[4] + 2, 0);
  [a1[4] setCompleted:1];
  objc_storeStrong(location, 0);
}

- (void)cancelTrip
{
  id v9 = self;
  v8[1] = (id)a2;
  queue = MEMORY[0x263EF83A0];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __26__CPSNavigator_cancelTrip__block_invoke;
  uint64_t v7 = &unk_2648A3BE0;
  v8[0] = v9;
  dispatch_sync(queue, &v3);

  objc_storeStrong(v8, 0);
}

void __26__CPSNavigator_cancelTrip__block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = a1;
  id v5 = (id)[a1[4] metadataDelegate];
  [v5 cancelTrip];

  id v7 = (id)[a1[4] displayDelegates];
  location[0] = (id)[v7 copy];

  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v9)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    unint64_t v4 = v9;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v3);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v11, "showManeuvers:usingDisplayStyles:", MEMORY[0x263EFFA68]);
      }
      if (objc_opt_respondsToSelector()) {
        [v11 navigator:a1[4] didEndTrip:0];
      }
      ++v3;
      if (v1 + 1 >= v4)
      {
        uint64_t v3 = 0;
        unint64_t v4 = [obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }

  [a1[4] setCompleted:1];
  objc_storeStrong(location, 0);
}

- (void)showManeuvers:(id)a3 usingDisplayStyles:(id)a4
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __49__CPSNavigator_showManeuvers_usingDisplayStyles___block_invoke;
  id v10 = &unk_2648A4AD0;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_sync(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __49__CPSNavigator_showManeuvers_usingDisplayStyles___block_invoke(NSObject *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  oslog[2] = a1;
  oslog[1] = a1;
  if ([(objc_class *)a1[4].isa isCompleted])
  {
    oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      log = oslog[0];
      os_log_type_t v15 = type;
      id v16 = (id)[(objc_class *)a1[4].isa trip];
      id v26 = v16;
      __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v26);
      _os_log_error_impl(&dword_22B689000, log, v15, "cannot update maneuvers for completed trip %@", v30, 0xCu);

      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    id v13 = (id)[(objc_class *)a1[4].isa metadataDelegate];
    [v13 setActiveManeuvers:a1[5].isa];

    id v25 = 0;
    id v24 = 0;
    if ((unint64_t)[(objc_class *)a1[5].isa count] <= 2)
    {
      objc_storeStrong(&v25, a1[5].isa);
      objc_storeStrong(&v24, a1[6].isa);
    }
    else
    {
      Class isa = a1[5].isa;
      oslog[8] = 0;
      oslog[7] = (os_log_t)2;
      oslog[9] = 0;
      oslog[10] = (os_log_t)2;
      uint64_t v22 = 0;
      uint64_t v23 = 2;
      id v2 = (id)-[objc_class subarrayWithRange:](isa, "subarrayWithRange:", 0, 2);
      id v3 = v25;
      id v25 = v2;

      Class v4 = a1[6].isa;
      oslog[4] = 0;
      oslog[3] = (os_log_t)2;
      oslog[5] = 0;
      oslog[6] = (os_log_t)2;
      uint64_t v20 = 0;
      uint64_t v21 = 2;
      id v5 = (id)-[objc_class subarrayWithRange:](v4, "subarrayWithRange:", 0, 2);
      id v6 = v24;
      id v24 = v5;
    }
    memset(__b, 0, sizeof(__b));
    id obj = (id)[(objc_class *)a1[4].isa displayDelegates];
    uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(__b[1] + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v19 showManeuvers:v25 usingDisplayStyles:v24];
        }
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
  }
}

- (void)updateTravelEstimates:(id)a3 forManeuver:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __50__CPSNavigator_updateTravelEstimates_forManeuver___block_invoke;
  unint64_t v10 = &unk_2648A4AD0;
  id v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_sync(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSNavigator_updateTravelEstimates_forManeuver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8[2] = (id)a1;
  v8[1] = (id)a1;
  if ([*(id *)(a1 + 32) isCompleted])
  {
    v8[0] = CarPlaySupportGeneralLogging();
    char v7 = 16;
    if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_ERROR))
    {
      log = v8[0];
      os_log_type_t type = v7;
      id v4 = (id)[*(id *)(a1 + 32) trip];
      id v6 = v4;
      __os_log_helper_16_2_1_8_64((uint64_t)v9, (uint64_t)v6);
      _os_log_error_impl(&dword_22B689000, log, type, "cannot update maneuver travel estimates for completed trip %@", v9, 0xCu);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(v8, 0);
  }
  else
  {
    id v1 = (id)[*(id *)(a1 + 32) metadataDelegate];
    [v1 updateTravelEstimates:*(void *)(a1 + 40) forManeuver:*(void *)(a1 + 48)];

    objc_msgSend(*(id *)(a1 + 32), "_sync_displayUpdateManeuverTravelEstimates:forManeuver:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

- (void)updateTripTravelEstimates:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(CPSNavigator *)v11 isCompleted])
  {
    id v9 = CarPlaySupportGeneralLogging();
    char v8 = 16;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      log = v9;
      os_log_type_t type = v8;
      id v6 = [(CPSNavigator *)v11 trip];
      char v7 = v6;
      __os_log_helper_16_2_1_8_64((uint64_t)v12, (uint64_t)v7);
      _os_log_error_impl(&dword_22B689000, log, type, "cannot update trip travel estimates for completed trip %@", v12, 0xCu);

      objc_storeStrong((id *)&v7, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  else
  {
    id v3 = [(CPSNavigator *)v11 metadataDelegate];
    [(CPSNavigationMetadataDelegate *)v3 updateTripTravelEstimates:location[0]];

    [(CPSNavigator *)v11 _sync_displayUpdateTripTravelEstimates:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)_sync_displayUpdateManeuverTravelEstimates:(id)a3 forManeuver:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_log_type_t v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  memset(__b, 0, sizeof(__b));
  id v9 = [(CPSNavigator *)v15 displayDelegates];
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(v9);
      }
      id v12 = *(id *)(__b[1] + 8 * v6);
      if (objc_opt_respondsToSelector()) {
        [v12 updateEstimates:location[0] forManeuver:v13];
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSHashTable *)v9 countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_sync_displayUpdateTripTravelEstimates:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = [(CPSNavigator *)v12 displayDelegates];
  uint64_t v8 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      if (objc_opt_respondsToSelector()) {
        [v10 updateTripEstimates:location[0]];
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [(NSHashTable *)obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)navigationOwnershipChangedToOwner:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  id v9 = CarPlaySupportGeneralLogging();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    os_log_type_t type = v8;
    unint64_t v6 = NSStringFromNavigationOwner_0(v10);
    unint64_t v7 = v6;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v12, (uint64_t)v7);
    _os_log_impl(&dword_22B689000, log, type, "%@: Navigation ownership changed to %@", v13, 0x16u);

    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong(&v9, 0);
  uint64_t v3 = [(CPSNavigator *)v12 navigationOwnershipDelegate];
  [(CARNavigationOwnershipManagerDelegate *)v3 navigationOwnershipChangedToOwner:v10];
}

- (CPTrip)trip
{
  return self->_trip;
}

- (void)setTrip:(id)a3
{
}

- (CARNavigationOwnershipManagerDelegate)navigationOwnershipDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationOwnershipDelegate);

  return (CARNavigationOwnershipManagerDelegate *)WeakRetained;
}

- (void)setNavigationOwnershipDelegate:(id)a3
{
}

- (BOOL)appSupportsInstrumentCluster
{
  return self->_appSupportsInstrumentCluster;
}

- (BOOL)sendsNavigationMetadata
{
  return self->_sendsNavigationMetadata;
}

- (CPSNavigationMetadataDelegate)metadataDelegate
{
  return self->_metadataDelegate;
}

- (void)setMetadataDelegate:(id)a3
{
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (NSHashTable)displayDelegates
{
  return self->_displayDelegates;
}

- (void)setDisplayDelegates:(id)a3
{
}

- (CARSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end