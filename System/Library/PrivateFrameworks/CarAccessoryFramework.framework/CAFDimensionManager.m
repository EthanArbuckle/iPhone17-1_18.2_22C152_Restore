@interface CAFDimensionManager
- (CAFCar)car;
- (CAFDimensionManager)initWithCar:(id)a3;
- (CARObserverHashTable)observers;
- (NSLocale)locale;
- (NSUnitFuelEfficiency)vehicleFuelEfficiencyUnit;
- (NSUnitLength)vehicleRangeUnit;
- (NSUnitPower)vehicleChargePowerUnit;
- (NSUnitPressure)tirePressureUnit;
- (NSUnitSpeed)vehicleSpeedUnit;
- (NSUnitTemperature)unitTemperature;
- (id)observableCache;
- (unint64_t)measurementSystem;
- (void)currentLocaleChanged;
- (void)invalidate;
- (void)registerObserver:(id)a3;
- (void)setLocale:(id)a3;
- (void)setObservableCache:(id)a3;
- (void)setObservers:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFDimensionManager

- (CAFDimensionManager)initWithCar:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAFDimensionManager;
  v5 = [(CAFDimensionManager *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26FDAF7A0];
    observers = v5->_observers;
    v5->_observers = (CARObserverHashTable *)v8;

    objc_storeWeak((id *)&v5->_car, v4);
    objc_initWeak(&location, v5);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    v11 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v12 = *MEMORY[0x263EFF458];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __35__CAFDimensionManager_initWithCar___block_invoke;
    v15[3] = &unk_2652632E8;
    objc_copyWeak(&v16, &location);
    id v13 = (id)[v10 addObserverForName:v12 object:0 queue:v11 usingBlock:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __35__CAFDimensionManager_initWithCar___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained currentLocaleChanged];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFDimensionManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFDimensionManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (unint64_t)measurementSystem
{
  v2 = [(CAFDimensionManager *)self locale];
  v3 = [v2 objectForKey:*MEMORY[0x263EFF510]];

  if ([v3 isEqualToString:*MEMORY[0x263EFF518]])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFF520]])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (NSUnitTemperature)unitTemperature
{
  v2 = [(CAFDimensionManager *)self locale];
  v3 = [v2 objectForKey:*MEMORY[0x263EFF548]];
  char v4 = [v3 isEqualToString:*MEMORY[0x263EFF550]];

  if (v4) {
    [MEMORY[0x263F08D20] celsius];
  }
  else {
  id v5 = [MEMORY[0x263F08D20] fahrenheit];
  }
  return (NSUnitTemperature *)v5;
}

- (NSUnitPressure)tirePressureUnit
{
  unint64_t v2 = [(CAFDimensionManager *)self measurementSystem];
  if (v2 == 2)
  {
    v3 = [MEMORY[0x263F08D10] kilopascals];
  }
  else
  {
    if (v2) {
      [MEMORY[0x263F08D10] poundsForcePerSquareInch];
    }
    else {
    v3 = [MEMORY[0x263F08D10] bars];
    }
  }
  return (NSUnitPressure *)v3;
}

- (NSUnitSpeed)vehicleSpeedUnit
{
  if ([(CAFDimensionManager *)self measurementSystem]) {
    [MEMORY[0x263F08D18] milesPerHour];
  }
  else {
  unint64_t v2 = [MEMORY[0x263F08D18] kilometersPerHour];
  }
  return (NSUnitSpeed *)v2;
}

- (NSUnitLength)vehicleRangeUnit
{
  if ([(CAFDimensionManager *)self measurementSystem]) {
    [MEMORY[0x263F08CE8] miles];
  }
  else {
  unint64_t v2 = [MEMORY[0x263F08CE8] kilometers];
  }
  return (NSUnitLength *)v2;
}

- (NSUnitFuelEfficiency)vehicleFuelEfficiencyUnit
{
  unint64_t v2 = [(CAFDimensionManager *)self measurementSystem];
  if (v2 == 2)
  {
    v3 = [MEMORY[0x263F08CD0] milesPerImperialGallon];
  }
  else
  {
    if (v2) {
      [MEMORY[0x263F08CD0] milesPerGallon];
    }
    else {
    v3 = [MEMORY[0x263F08CD0] litersPer100Kilometers];
    }
  }
  return (NSUnitFuelEfficiency *)v3;
}

- (NSUnitPower)vehicleChargePowerUnit
{
  return (NSUnitPower *)[MEMORY[0x263F08D08] kilowatts];
}

- (void)invalidate
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_249710000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ time to invalidate", (uint8_t *)&v2, 0xCu);
}

- (void)currentLocaleChanged
{
  id v24 = [(CAFDimensionManager *)self locale];
  uint64_t v3 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v4 = *MEMORY[0x263EFF510];
  id v5 = [v24 objectForKey:*MEMORY[0x263EFF510]];
  uint64_t v6 = [v3 objectForKey:v4];
  uint64_t v7 = *MEMORY[0x263EFF548];
  uint64_t v8 = [v24 objectForKey:*MEMORY[0x263EFF548]];
  uint64_t v9 = *MEMORY[0x263EFF550];
  int v10 = [(id)v8 isEqualToString:*MEMORY[0x263EFF550]];

  v11 = [v3 objectForKey:v7];
  LODWORD(v8) = [v11 isEqualToString:v9];

  LODWORD(v11) = [v5 isEqualToString:v6];
  int v12 = v10 ^ v8;
  [(CAFDimensionManager *)self setLocale:v3];
  if (!v11)
  {
    v14 = [(CAFDimensionManager *)self observers];
    objc_msgSend(v14, "dimensionManager:didUpdateMeasurementSystem:", self, -[CAFDimensionManager measurementSystem](self, "measurementSystem"));

    v15 = [(CAFDimensionManager *)self observers];
    id v16 = [(CAFDimensionManager *)self tirePressureUnit];
    [v15 dimensionManager:self didUpdateTirePressureUnit:v16];

    v17 = [(CAFDimensionManager *)self observers];
    objc_super v18 = [(CAFDimensionManager *)self vehicleSpeedUnit];
    [v17 dimensionManager:self didUpdateVehicleSpeedUnit:v18];

    v19 = [(CAFDimensionManager *)self observers];
    v20 = [(CAFDimensionManager *)self vehicleRangeUnit];
    [v19 dimensionManager:self didUpdateVehicleRangeUnit:v20];

    v21 = [(CAFDimensionManager *)self observers];
    v22 = [(CAFDimensionManager *)self vehicleFuelEfficiencyUnit];
    [v21 dimensionManager:self didUpdateVehicleFuelEfficiencyUnit:v22];

    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v12)
  {
LABEL_5:
    id v13 = [(CAFDimensionManager *)self observers];
    v23 = [(CAFDimensionManager *)self unitTemperature];
    [v13 dimensionManager:self didUpdateTemperatureUnit:v23];

    goto LABEL_6;
  }
  id v13 = [(CAFDimensionManager *)self observers];
  [v13 dimensionManager:self didUpdateLocale:self->_locale];
LABEL_6:

LABEL_7:
}

- (id)observableCache
{
  return self->_observableCache;
}

- (void)setObservableCache:(id)a3
{
}

- (CAFCar)car
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_car);
  return (CAFCar *)WeakRetained;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocale:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_car);
  objc_storeStrong(&self->_observableCache, 0);
}

@end