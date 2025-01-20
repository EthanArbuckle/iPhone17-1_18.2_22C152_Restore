@interface NavdMapsSuggestionsController
- (NavdMapsSuggestionsController)init;
- (NavdMapsSuggestionsController)initWithResourceDepot:(id)a3 sharedRegister:(id)a4;
- (void)startDoomIfNotStarted;
@end

@implementation NavdMapsSuggestionsController

- (NavdMapsSuggestionsController)init
{
  id v3 = [objc_alloc((Class)MapsSuggestionsSelfBuildingResourceDepot) initWithName:@"NavdResourceDepot"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000242CC;
  block[3] = &unk_1000892D8;
  id v9 = v3;
  if (qword_1000A2520 != -1) {
    dispatch_once(&qword_1000A2520, block);
  }
  v4 = v9;
  id v5 = (id)qword_1000A2518;

  v6 = [(NavdMapsSuggestionsController *)self initWithResourceDepot:v3 sharedRegister:v5];
  return v6;
}

- (NavdMapsSuggestionsController)initWithResourceDepot:(id)a3 sharedRegister:(id)a4
{
  id v79 = a3;
  id v81 = a4;
  v82.receiver = self;
  v82.super_class = (Class)NavdMapsSuggestionsController;
  v7 = [(NavdMapsSuggestionsController *)&v82 init];
  v8 = v7;
  if (v7)
  {
    p_resourceDepot = (id *)&v7->_resourceDepot;
    objc_storeStrong((id *)&v7->_resourceDepot, a3);
    id v9 = objc_alloc_init(NavdRouteGeniusServer);
    routeGeniusServer = v8->_routeGeniusServer;
    v8->_routeGeniusServer = v9;

    v11 = [NavdRouteGenius alloc];
    v12 = v8->_routeGeniusServer;
    resourceDepot = v8->_resourceDepot;
    v14 = +[MapsSuggestionsNavdMapsAppLocationManager sharedLocationManager];
    v15 = [(NavdRouteGenius *)v11 initWithDelegate:v12 resourceDepot:resourceDepot locationUpdater:v14];
    routeGenius = v8->_routeGenius;
    v8->_routeGenius = v15;

    [(NavdRouteGeniusServer *)v8->_routeGeniusServer setActivatable:v8->_routeGenius];
    v17 = +[MapsSuggestionsDestinationdTrigger description];
    v80 = [v81 objectForKeyedSubscript:v17];

    if (v80) {
      [v80 addIgnoredClientProcess:@"GeneralMapsWidget"];
    }
    if (!v8->_venueAnnouncer)
    {
      v18 = [[NavdVenueAnnouncer alloc] initFromResourceDepot:*p_resourceDepot sharedRegister:v81];
      venueAnnouncer = v8->_venueAnnouncer;
      v8->_venueAnnouncer = v18;
    }
    if (!v8->_avocadoUpdater)
    {
      v20 = [[NavdAvocadoUpdater alloc] initFromResourceDepot:*p_resourceDepot sharedRegister:v81];
      avocadoUpdater = v8->_avocadoUpdater;
      v8->_avocadoUpdater = v20;
    }
    id v78 = [objc_alloc((Class)MapsSuggestionsBluetoothVehicleConnectionTrigger) initFireOnConnect:1 disconnect:0 exit:0];
    id v77 = [objc_alloc((Class)MapsSuggestionsBluetoothVehicleConnectionTrigger) initFireOnConnect:0 disconnect:1 exit:1];
    v70 = objc_alloc_init(NavdNavigationStartedTrigger);
    id v69 = objc_alloc_init((Class)MapsSuggestionsMapsAppVisibleChangedTrigger);
    id v22 = objc_alloc((Class)MapsSuggestionsCarplayDisconnectedCondition);
    GEOConfigGetDouble();
    id v76 = objc_msgSend(v22, "initWithDisconnectDelay:");
    v23 = (MapsSuggestionsCircuitBoard *)objc_alloc_init((Class)MapsSuggestionsCircuitBoard);
    circuitBoard = v8->_circuitBoard;
    v8->_circuitBoard = v23;

    v25 = [NavdVehicleBluetoothStatus alloc];
    v26 = v8->_circuitBoard;
    id v92 = v78;
    v27 = +[NSArray arrayWithObjects:&v92 count:1];
    id v91 = v77;
    v28 = +[NSArray arrayWithObjects:&v91 count:1];
    v29 = [(NavdVehicleBluetoothStatus *)v25 initWithCircuitBoard:v26 connectTriggers:v27 disconnectTriggers:v28];
    vehicleBluetoothStatus = v8->_vehicleBluetoothStatus;
    v8->_vehicleBluetoothStatus = v29;

    v31 = [NavdVehicleBluetoothNotificationHandler alloc];
    v32 = v8->_circuitBoard;
    v65 = [(NavdVehicleBluetoothStatus *)v8->_vehicleBluetoothStatus carConnectTrigger];
    v90 = v65;
    v73 = +[NSArray arrayWithObjects:&v90 count:1];
    v66 = [(NavdVehicleBluetoothStatus *)v8->_vehicleBluetoothStatus carConnectCondition];
    v89[0] = v66;
    v33 = v70;
    id v34 = objc_alloc((Class)NSString);
    v35 = [(NavdNavigationStartedTrigger *)v33 uniqueName];
    v36 = [v35 capitalizedString];
    v67 = v32;
    v68 = v31;
    id v37 = [v34 initWithFormat:@"negated%@", v36];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1000248DC;
    v85[3] = &unk_100089CA0;
    v74 = v33;
    v86 = v74;
    id v38 = v37;
    v39 = v85;
    id v75 = [objc_alloc((Class)MapsSuggestionsBlockCondition) initWithName:v38 block:v39];

    v89[1] = v75;
    id v40 = v69;
    id v41 = objc_alloc((Class)NSString);
    v42 = [v40 uniqueName];
    v43 = [v42 capitalizedString];
    id v44 = [v41 initWithFormat:@"negated%@", v43];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000248DC;
    v83[3] = &unk_100089CA0;
    id v45 = v40;
    id v84 = v45;
    id v46 = v44;
    v47 = v83;
    id v72 = [objc_alloc((Class)MapsSuggestionsBlockCondition) initWithName:v46 block:v47];

    v89[2] = v72;
    v64 = +[MapsSuggestionsSiri isAllowedOnHomeScreenCondition];
    v63 = [v64 uniqueName];
    v62 = objc_msgSend(v81, "objectForKeyedSubscript:");
    v89[3] = v62;
    v61 = +[MapsSuggestionsSiri isAllowedOnLockScreenCondition];
    v60 = [v61 uniqueName];
    v59 = objc_msgSend(v81, "objectForKeyedSubscript:");
    v89[4] = v59;
    v89[5] = v76;
    v48 = objc_alloc_init(NavdMapsSuggestionsLBALocationAccessAllowedCondition);
    v89[6] = v48;
    v49 = +[NSArray arrayWithObjects:v89 count:7];
    v50 = [(NavdVehicleBluetoothStatus *)v8->_vehicleBluetoothStatus carDisconnectTrigger];
    v88 = v50;
    v51 = +[NSArray arrayWithObjects:&v88 count:1];
    v52 = [(NavdVehicleBluetoothStatus *)v8->_vehicleBluetoothStatus carDisconnectCondition];
    v87 = v52;
    v53 = +[NSArray arrayWithObjects:&v87 count:1];
    v54 = [*p_resourceDepot oneNetworkRequester];
    v55 = objc_alloc_init(NavdRealVehicleBluetoothNotifier);
    v56 = [(NavdVehicleBluetoothNotificationHandler *)v68 initWithCiruitBoard:v67 connectTriggers:v73 connectConditions:v49 disconnectTriggers:v51 disconnectConditions:v53 networkRequester:v54 notifier:v55];
    bluetoothNotifier = v8->_bluetoothNotifier;
    v8->_bluetoothNotifier = v56;

    [(NavdMapsSuggestionsController *)v8 startDoomIfNotStarted];
  }

  return v8;
}

- (void)startDoomIfNotStarted
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(17, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100023EA8;
  v3[3] = &unk_1000896E8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGenius, 0);
  objc_storeStrong((id *)&self->_routeGeniusServer, 0);
  objc_storeStrong((id *)&self->_bluetoothNotifier, 0);
  objc_storeStrong((id *)&self->_avocadoUpdater, 0);
  objc_storeStrong((id *)&self->_venueAnnouncer, 0);
  objc_storeStrong((id *)&self->_doomHost, 0);
  objc_storeStrong((id *)&self->_resourceDepot, 0);
  objc_storeStrong((id *)&self->_vehicleBluetoothStatus, 0);

  objc_storeStrong((id *)&self->_circuitBoard, 0);
}

@end