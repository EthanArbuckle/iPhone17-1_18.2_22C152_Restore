@interface MapsExternalAccessoryState
+ (id)allKeys;
- ($294CB042FB18EDF8FD74FDF4F765ED39)engineTypes;
- (BOOL)destinationHandoffEnabled;
- (BOOL)isEqualToState:(id)a3;
- (BOOL)lowRangeWarning;
- (MapsExternalAccessoryState)initWithAccessory:(id)a3;
- (NSDictionary)engineStates;
- (NSNumber)range;
- (NSNumber)year;
- (NSString)bluetoothIdentifier;
- (NSString)carName;
- (NSString)identifier;
- (NSString)manufacturer;
- (NSString)mapsDisplayName;
- (NSString)model;
- (id)_augmentVehicleInfo:(id)a3;
- (id)descriptionForKey:(id)a3;
- (int)engineType;
- (unint64_t)connectionID;
- (void)_augmentMutableVehicleInfo:(id)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setCarName:(id)a3;
- (void)setConnectionID:(unint64_t)a3;
- (void)setDestinationHandoffEnabled:(BOOL)a3;
- (void)setEngineStates:(id)a3;
- (void)setEngineType:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setLowRangeWarning:(BOOL)a3;
- (void)setManufacturer:(id)a3;
- (void)setMapsDisplayName:(id)a3;
- (void)setModel:(id)a3;
- (void)setRange:(id)a3;
- (void)setYear:(id)a3;
- (void)updateWithInfo:(id)a3;
@end

@implementation MapsExternalAccessoryState

+ (id)allKeys
{
  if (qword_100081EC0 != -1) {
    dispatch_once(&qword_100081EC0, &stru_100072060);
  }
  v2 = (void *)qword_100081EB8;
  return v2;
}

- (id)descriptionForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"destinationHandoffEnabled"] & 1) != 0
    || [v4 isEqualToString:@"lowRangeWarning"])
  {
    v5 = [(MapsExternalAccessoryState *)self valueForKey:v4];
    unsigned int v6 = [v5 BOOLValue];
    v7 = @"NO";
    if (v6) {
      v7 = @"YES";
    }
    v8 = v7;
  }
  else
  {
    if ([v4 isEqualToString:@"engineTypes"])
    {
      uint64_t v9 = sub_100034948((int)[(MapsExternalAccessoryState *)self engineTypes]);
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)MapsExternalAccessoryState;
      uint64_t v9 = [(MapsExternalState *)&v11 descriptionForKey:v4];
    }
    v8 = (__CFString *)v9;
  }

  return v8;
}

- (MapsExternalAccessoryState)initWithAccessory:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MapsExternalAccessoryState;
  v5 = [(MapsExternalAccessoryState *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 serialNumber];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_connectionID = (unint64_t)[v4 connectionID];
    uint64_t v8 = [v4 manufacturer];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v8;

    uint64_t v10 = [v4 modelNumber];
    model = v5->_model;
    v5->_model = (NSString *)v10;

    uint64_t v12 = [v4 name];
    carName = v5->_carName;
    v5->_carName = (NSString *)v12;

    uint64_t v14 = [v4 macAddress];
    bluetoothIdentifier = v5->_bluetoothIdentifier;
    v5->_bluetoothIdentifier = (NSString *)v14;

    v5->_destinationHandoffEnabled = [v4 pointOfInterestHandoffEnabled];
    v16 = [v4 getVehicleInfoData];
    [(MapsExternalAccessoryState *)v5 updateWithInfo:v16];
    v17 = [v4 vehicleInfoInitialData];

    [(MapsExternalAccessoryState *)v5 updateWithInfo:v17];
  }

  return v5;
}

- (void)_augmentMutableVehicleInfo:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_1000357BC;
  uint64_t v8 = &unk_1000720B0;
  id v9 = a3;
  id v3 = v9;
  uint64_t v4 = 0;
  v10[0] = MapsEAVehicleConfig_RangeGasoline;
  v10[1] = MapsEAVehicleConfig_RangeDiesel;
  v10[2] = MapsEAVehicleConfig_RangeElectric;
  v10[3] = MapsEAVehicleConfig_RangeCNG;
  v10[4] = MapsEAVehicleConfig_HasLowDistanceRangeGasoline;
  v10[5] = MapsEAVehicleConfig_HasLowDistanceRangeDiesel;
  v10[6] = MapsEAVehicleConfig_HasLowDistanceRangeElectric;
  v10[7] = MapsEAVehicleConfig_HasLowDistanceRangeCNG;
  do
  {
    if (!((unsigned int (*)(void *, void, void))v7)(v6, *(void *)&v10[v4], *((void *)&v10[v4] + 1)))break; {
  }
    }
  while (v4++ != 7);
}

- (id)_augmentVehicleInfo:(id)a3
{
  uint64_t v4 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  v5 = sub_100035A34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "pre-augment vehicleInfo=%@", (uint8_t *)&v8, 0xCu);
  }

  [(MapsExternalAccessoryState *)self _augmentMutableVehicleInfo:v4];
  [(MapsExternalAccessoryState *)self _augmentMutableVehicleInfo:v4];
  uint64_t v6 = sub_100035A34();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "post-augment vehicleInfo=%@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (void)updateWithInfo:(id)a3
{
  id v4 = a3;
  v5 = sub_100035A34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "vehicleInfo=%@", buf, 0xCu);
  }

  if (GEOConfigGetBOOL())
  {
    uint64_t v6 = [(MapsExternalAccessoryState *)self _augmentVehicleInfo:v4];

    id v4 = (id)v6;
  }
  uint64_t v7 = EAConnectionIDKey;
  uint64_t v8 = [v4 objectForKeyedSubscript:EAConnectionIDKey];
  if (!v8
    || (id v9 = (void *)v8,
        [v4 objectForKeyedSubscript:v7],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 unsignedIntegerValue],
        unint64_t v12 = [(MapsExternalAccessoryState *)self connectionID],
        v10,
        v9,
        v11 == (id)v12))
  {
    uint64_t v13 = EAVehicleInfoYearKey;
    uint64_t v14 = [v4 objectForKeyedSubscript:EAVehicleInfoYearKey];

    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:v13];
      [(MapsExternalAccessoryState *)self setYear:v15];
    }
    uint64_t v16 = EAVehicleInfoMapsDisplayNameKey;
    v17 = [v4 objectForKeyedSubscript:EAVehicleInfoMapsDisplayNameKey];

    if (v17)
    {
      v18 = [v4 objectForKeyedSubscript:v16];
      [(MapsExternalAccessoryState *)self setMapsDisplayName:v18];
    }
    uint64_t v19 = EAVehicleInfoEngineTypeBitmaskKey;
    v20 = [v4 objectForKeyedSubscript:EAVehicleInfoEngineTypeBitmaskKey];

    if (!v20) {
      goto LABEL_18;
    }
    v21 = [v4 objectForKeyedSubscript:v19];
    -[MapsExternalAccessoryState setEngineType:](self, "setEngineType:", [v21 longLongValue]);

    unsigned int v22 = [(MapsExternalAccessoryState *)self engineTypes];
    v23 = objc_opt_new();
    if (v22)
    {
      v37 = +[MapsCarEngineState engineStateGasoline];
      [v23 setObject:v37 forKeyedSubscript:&off_100074DE0];

      if ((v22 & 0x100) == 0)
      {
LABEL_14:
        if ((v22 & 0x10000) == 0) {
          goto LABEL_15;
        }
        goto LABEL_33;
      }
    }
    else if ((v22 & 0x100) == 0)
    {
      goto LABEL_14;
    }
    v38 = +[MapsCarEngineState engineStateDiesel];
    [v23 setObject:v38 forKeyedSubscript:&off_100074DF8];

    if ((v22 & 0x10000) == 0)
    {
LABEL_15:
      if ((v22 & 0x1000000) == 0)
      {
LABEL_17:
        [(MapsExternalAccessoryState *)self setEngineStates:v23];

LABEL_18:
        uint64_t v25 = EAVehicleInfoHasLowDistanceRangeKey;
        v26 = [v4 objectForKeyedSubscript:EAVehicleInfoHasLowDistanceRangeKey];

        if (v26)
        {
          v27 = [v4 objectForKeyedSubscript:v25];
          -[MapsExternalAccessoryState setLowRangeWarning:](self, "setLowRangeWarning:", [v27 BOOLValue]);
        }
        uint64_t v28 = EAVehicleInfoRangeKey;
        v29 = [v4 objectForKeyedSubscript:EAVehicleInfoRangeKey];

        if (v29)
        {
          v30 = [v4 objectForKeyedSubscript:v28];
          [(MapsExternalAccessoryState *)self setRange:v30];
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v31 = [(MapsExternalAccessoryState *)self engineStates];
        v32 = [v31 allValues];

        id v33 = [v32 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v41;
          do
          {
            v36 = 0;
            do
            {
              if (*(void *)v41 != v35) {
                objc_enumerationMutation(v32);
              }
              [*(id *)(*((void *)&v40 + 1) + 8 * (void)v36) updateWithVehicleInfo:v4];
              v36 = (char *)v36 + 1;
            }
            while (v34 != v36);
            id v34 = [v32 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v34);
        }

        goto LABEL_30;
      }
LABEL_16:
      v24 = +[MapsCarEngineState engineStateCNG];
      [v23 setObject:v24 forKeyedSubscript:&off_100074E28];

      goto LABEL_17;
    }
LABEL_33:
    v39 = +[MapsCarEngineState engineStateElectric];
    [v23 setObject:v39 forKeyedSubscript:&off_100074E10];

    if ((v22 & 0x1000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_30:
}

- ($294CB042FB18EDF8FD74FDF4F765ED39)engineTypes
{
  unsigned int v2 = [(MapsExternalAccessoryState *)self engineType];
  return ($294CB042FB18EDF8FD74FDF4F765ED39)(v2 & 1 | (((v2 >> 2) & 1) << 16) & 0xFEFFFEFF | (((v2 >> 3) & 1) << 24) | (((v2 >> 1) & 1) << 8));
}

- (BOOL)isEqualToState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsExternalAccessoryState;
  return [(MapsExternalState *)&v4 isEqualToState:a3];
}

- (unint64_t)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(unint64_t)a3
{
  self->_connectionID = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
}

- (NSNumber)year
{
  return self->_year;
}

- (void)setYear:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)carName
{
  return self->_carName;
}

- (void)setCarName:(id)a3
{
}

- (BOOL)destinationHandoffEnabled
{
  return self->_destinationHandoffEnabled;
}

- (void)setDestinationHandoffEnabled:(BOOL)a3
{
  self->_destinationHandoffEnabled = a3;
}

- (NSString)mapsDisplayName
{
  return self->_mapsDisplayName;
}

- (void)setMapsDisplayName:(id)a3
{
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (BOOL)lowRangeWarning
{
  return self->_lowRangeWarning;
}

- (void)setLowRangeWarning:(BOOL)a3
{
  self->_lowRangeWarning = a3;
}

- (NSNumber)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (NSDictionary)engineStates
{
  return self->_engineStates;
}

- (void)setEngineStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineStates, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_mapsDisplayName, 0);
  objc_storeStrong((id *)&self->_carName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end