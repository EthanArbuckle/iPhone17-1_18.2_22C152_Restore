@interface VirtualGarageMockPersister
- (NSString)selectedVehicleIdentifier;
- (VGVirtualGaragePersistingDelegate)delegate;
- (VirtualGarageMockPersister)init;
- (id)_dummyVehicles;
- (id)persistedVehicleForVehicle:(id)a3;
- (void)loadVehiclesWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedVehicleIdentifier:(id)a3;
@end

@implementation VirtualGarageMockPersister

- (VirtualGarageMockPersister)init
{
  v9.receiver = self;
  v9.super_class = (Class)VirtualGarageMockPersister;
  v2 = [(VirtualGarageMockPersister *)&v9 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.Navigation.persister.%@.%p", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)loadVehiclesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000332B4;
  v7[3] = &unk_10008AC40;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_dummyVehicles
{
  id v2 = objc_alloc((Class)VGVehicle);
  v34 = &off_1000907E0;
  id v3 = objc_alloc((Class)NSMeasurement);
  id v4 = +[NSUnitPower watts];
  id v5 = [v3 initWithDoubleValue:v4 unit:55000.0];
  id v35 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v26 = [v2 initWithDisplayName:@"Apple Maps EV-1" year:@"2022" manufacturer:@"Apple Maps" model:@"EV-1" colorHex:@"0F0F0F" headUnitIdentifier:0 headUnitBluetoothIdentifier:0 supportedConnectors:1 powerByConnector:v6];

  id v7 = objc_alloc((Class)VGVehicle);
  v32 = &off_1000907E0;
  id v8 = objc_alloc((Class)NSMeasurement);
  id v9 = +[NSUnitPower watts];
  id v10 = [v8 initWithDoubleValue:v9 unit:55000.0];
  id v33 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id v12 = [v7 initWithDisplayName:@"Apple Maps EV-2" year:@"2022" manufacturer:@"Apple Maps" model:@"EV-2" colorHex:@"0F0F0F" headUnitIdentifier:0 headUnitBluetoothIdentifier:0 supportedConnectors:1 powerByConnector:v11];

  id v13 = [objc_alloc((Class)VGVehicle) initWithDisplayName:@"Apple Maps LPR-1" year:@"2022" manufacturer:@"Apple Maps" model:@"LPR-1" colorHex:@"F0F0F0" headUnitIdentifier:0 headUnitBluetoothIdentifier:0 supportedConnectors:0 powerByConnector:0];
  [v13 setLicensePlate:@"3EEE333"];
  v14 = +[GEOResourceManager sharedManager];
  v15 = [v14 dataForResourceWithName:@"regional_vehicle_info.pb" fallbackBundle:0];

  if (v15)
  {
    id v16 = [objc_alloc((Class)GEOLPRRoot) initWithData:v15];
    v17 = [v16 powerTypes];
    v18 = [v17 allKeys];
    v19 = [v18 firstObject];
    [v13 setLprPowerType:v19];

    v20 = [v16 vehicleTypes];
    v21 = [v20 allKeys];
    v22 = [v21 firstObject];
    [v13 setLprVehicleType:v22];
  }
  v31[0] = v26;
  v31[1] = v12;
  v31[2] = v13;
  v23 = +[NSArray arrayWithObjects:v31 count:3];
  +[NSDate date];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100033814;
  v27[3] = &unk_10008AE38;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = @"{\"vehicle_parameters\":{},\"model_id\":0}";
  v30 = @"{\"vehicle_parameters\":{},\"model_id\":0}";
  id v24 = v28;
  [v23 enumerateObjectsUsingBlock:v27];

  return v23;
}

- (id)persistedVehicleForVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100033D38;
  v17 = sub_100033D48;
  id v18 = 0;
  id v5 = [v4 identifier];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033D50;
  block[3] = &unk_10008AE60;
  block[4] = self;
  id v11 = v5;
  id v12 = &v13;
  id v7 = v5;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (VGVirtualGaragePersistingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VGVirtualGaragePersistingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)selectedVehicleIdentifier
{
  return self->_selectedVehicleIdentifier;
}

- (void)setSelectedVehicleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVehicleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicles, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end