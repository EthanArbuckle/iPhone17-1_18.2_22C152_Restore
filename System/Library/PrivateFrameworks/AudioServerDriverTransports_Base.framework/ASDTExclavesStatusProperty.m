@interface ASDTExclavesStatusProperty
+ (id)configForMic;
- (ASDTExclavesSensorManager)sensorManager;
- (ASDTExclavesStatusProperty)initWithConfig:(id)a3;
- (NSString)sensorName;
- (id)retrievePropertyValue;
- (void)setSensorManager:(id)a3;
- (void)setSensorName:(id)a3;
@end

@implementation ASDTExclavesStatusProperty

+ (id)configForMic
{
  v6[5] = *MEMORY[0x263EF8340];
  v6[0] = @"ASDTExclavesStatusProperty";
  v5[0] = @"Subclass";
  v5[1] = @"Name";
  v2 = [NSString stringWithUTF8String:"com.apple.sensors.mic"];
  v6[1] = v2;
  v5[2] = @"Selector";
  v5[3] = @"Scope";
  v6[2] = &unk_26FCAD3C8;
  v6[3] = &unk_26FCAD3E0;
  v5[4] = @"Element";
  v6[4] = &unk_26FCAD3F8;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];

  return v3;
}

- (ASDTExclavesStatusProperty)initWithConfig:(id)a3
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDTExclavesStatusProperty;
  v5 = [(ASDTCustomProperty *)&v21 initWithConfig:v4 propertyDataType:1886155636 qualifierDataType:0];
  v6 = v5;
  if (!v5) {
    goto LABEL_13;
  }
  [(ASDTCustomProperty *)v5 setCacheMode:0];
  [(ASDCustomProperty *)v6 setSettable:0];
  v7 = [v4 asdtName];
  [(ASDTExclavesStatusProperty *)v6 setSensorName:v7];

  v8 = [(ASDTExclavesStatusProperty *)v6 sensorName];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    v14 = ASDTBaseLogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ASDTExclavesStatusProperty initWithConfig:](v14);
    }
  }
  else
  {
    v10 = [(ASDTExclavesStatusProperty *)v6 sensorName];
    v11 = +[ASDTExclavesSensorManager forSensorName:v10];
    [(ASDTExclavesStatusProperty *)v6 setSensorManager:v11];

    v12 = [(ASDTExclavesStatusProperty *)v6 sensorManager];
    uint64_t v13 = [v12 statusTracker];

    if (v13)
    {
      objc_initWeak(location, v6);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__ASDTExclavesStatusProperty_initWithConfig___block_invoke;
      aBlock[3] = &unk_2652439D8;
      objc_copyWeak(&v20, location);
      ASDT::Exclaves::StatusTracker::SetSignalBlock(v13, aBlock);
      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
LABEL_13:
      v17 = v6;
      goto LABEL_14;
    }
    if (!asdt_exclaves_available()) {
      goto LABEL_13;
    }
    v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(ASDTExclavesStatusProperty *)v6 sensorName];
      [(ASDTExclavesStatusProperty *)v16 initWithConfig:v15];
    }
  }
  v17 = 0;
LABEL_14:

  return v17;
}

void __45__ASDTExclavesStatusProperty_initWithConfig___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sensorStatusChanged];
}

- (id)retrievePropertyValue
{
  v16[4] = *MEMORY[0x263EF8340];
  v2 = [(ASDTExclavesStatusProperty *)self sensorManager];
  v3 = (ASDT::Exclaves::StatusTracker *)[v2 statusTracker];

  if (v3)
  {
    ASDT::Exclaves::StatusTracker::Pop(v3, 0, (uint64_t)&__p);
    id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((v14 - (unsigned char *)__p) >> 3)];
    v5 = __p;
    v6 = v14;
    if (__p != v14)
    {
      do
      {
        v15[0] = @"machAbsoluteTime";
        v7 = [NSNumber numberWithLongLong:v5[2]];
        v16[0] = v7;
        v15[1] = @"timeNanoseconds";
        v8 = [NSNumber numberWithLongLong:v5[1]];
        v16[1] = v8;
        v15[2] = @"statusRawValue";
        BOOL v9 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v5 + 8)];
        v16[2] = v9;
        v15[3] = @"operation";
        v10 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v5 + 9)];
        v16[3] = v10;
        v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
        [v4 addObject:v11];

        v5 += 5;
      }
      while (v5 != (void *)v6);
    }
    if (__p)
    {
      v14 = __p;
      operator delete(__p);
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  return v4;
}

- (NSString)sensorName
{
  return self->_sensorName;
}

- (void)setSensorName:(id)a3
{
}

- (ASDTExclavesSensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorManager, 0);
  objc_storeStrong((id *)&self->_sensorName, 0);
}

- (void)initWithConfig:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "ASDTExclavesStatusProperty: The sensor name must be specified.", v1, 2u);
}

- (void)initWithConfig:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "ASDTExclavesStatusProperty(%@): Failed to create sensor manager.", buf, 0xCu);
}

@end