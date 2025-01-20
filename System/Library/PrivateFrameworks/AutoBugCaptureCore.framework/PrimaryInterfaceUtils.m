@interface PrimaryInterfaceUtils
+ (PrimaryInterfaceUtils)sharedInstance;
- (BOOL)hasPrimaryInterface;
- (NSDate)estimatedInterfaceBecamePrimaryDate;
- (NSDate)interfaceBecamePrimaryDate;
- (NSString)primaryInterfaceTypeString;
- (PrimaryInterfaceUtils)init;
- (int64_t)primaryInterfaceType;
- (void)_setEstimatedInterfaceBecamePrimaryDate:(id)a3;
- (void)_setHasPrimaryInterface:(BOOL)a3;
- (void)_setInterfaceBecamePrimaryDate:(id)a3;
- (void)_setPrimaryInterfaceType:(int64_t)a3;
- (void)getDefaultPathInfoUsingSecondsSinceChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PrimaryInterfaceUtils

+ (PrimaryInterfaceUtils)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_primaryInterfaceUtil;

  return (PrimaryInterfaceUtils *)v2;
}

uint64_t __39__PrimaryInterfaceUtils_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PrimaryInterfaceUtils);
  uint64_t v1 = sharedInstance_primaryInterfaceUtil;
  sharedInstance_primaryInterfaceUtil = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (PrimaryInterfaceUtils)init
{
  v6.receiver = self;
  v6.super_class = (Class)PrimaryInterfaceUtils;
  v2 = [(PrimaryInterfaceUtils *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasPrimaryInterface = 0;
    v4 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
    [v4 addObserver:v3 forKeyPath:@"path" options:7 context:0];
  }
  return v3;
}

- (void)getDefaultPathInfoUsingSecondsSinceChange
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  v4 = [v3 path];
  uint64_t v5 = [v4 status];

  if (v5 == 1)
  {
    objc_super v6 = [v3 path];
    v7 = [v6 interface];
    uint64_t v8 = [v7 type];

    v9 = [v3 path];
    double v10 = (double)(unint64_t)[v9 secondsSinceInterfaceChange];

    v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-v10];
    v12 = [MEMORY[0x263EFF910] date];
    v13 = symptomsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = +[InterfaceUtils stringForInterfaceType:v8];
      int v17 = 138412802;
      v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = *(void *)&v10;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "PrimaryInterfaceUtils: Informed that interfaceType %@ became primary %.1fs ago at %@", (uint8_t *)&v17, 0x20u);
    }
    [(PrimaryInterfaceUtils *)self _setHasPrimaryInterface:(v8 & 0xFFFFFFFFFFFFFFFBLL) != 0];
    [(PrimaryInterfaceUtils *)self _setPrimaryInterfaceType:v8];
    [(PrimaryInterfaceUtils *)self _setInterfaceBecamePrimaryDate:v11];
    [(PrimaryInterfaceUtils *)self _setEstimatedInterfaceBecamePrimaryDate:v12];
  }
  else
  {
    v11 = symptomsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v15 = [v3 path];
      v16 = [v3 path];
      int v17 = 138412546;
      v18 = v15;
      __int16 v19 = 2048;
      uint64_t v20 = [v16 status];
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "PrimaryInterfaceUtils: path [%@] not satisfied (%ld)", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v15 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x263F081B8];
  id v11 = a5;
  v12 = [v11 objectForKeyedSubscript:v10];
  v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];

  int v14 = v13 == 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v14 = [v12 isEqualToPath:v13] ^ 1;
    }
  }
  if ([v15 isEqualToString:@"path"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & v14) == 1) {
      [(PrimaryInterfaceUtils *)self getDefaultPathInfoUsingSecondsSinceChange];
    }
  }
}

- (void)_setHasPrimaryInterface:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_hasPrimaryInterface != v3)
  {
    [(PrimaryInterfaceUtils *)obj willChangeValueForKey:@"hasPrimaryInterface"];
    obj->_hasPrimaryInterface = v3;
    [(PrimaryInterfaceUtils *)obj didChangeValueForKey:@"hasPrimaryInterface"];
  }
  objc_sync_exit(obj);
}

- (BOOL)hasPrimaryInterface
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL hasPrimaryInterface = v2->_hasPrimaryInterface;
  objc_sync_exit(v2);

  return hasPrimaryInterface;
}

- (void)_setPrimaryInterfaceType:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_primaryInterfaceType != a3)
  {
    [(PrimaryInterfaceUtils *)obj willChangeValueForKey:@"primaryInterfaceType"];
    obj->_primaryInterfaceType = a3;
    [(PrimaryInterfaceUtils *)obj didChangeValueForKey:@"primaryInterfaceType"];
  }
  objc_sync_exit(obj);
}

- (int64_t)primaryInterfaceType
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t primaryInterfaceType = v2->_primaryInterfaceType;
  objc_sync_exit(v2);

  return primaryInterfaceType;
}

- (void)_setInterfaceBecamePrimaryDate:(id)a3
{
  objc_super v6 = (NSDate *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_interfaceBecamePrimaryDate != v6)
  {
    [(PrimaryInterfaceUtils *)v5 willChangeValueForKey:@"interfaceBecamePrimaryDate"];
    objc_storeStrong((id *)&v5->_interfaceBecamePrimaryDate, a3);
    [(PrimaryInterfaceUtils *)v5 didChangeValueForKey:@"interfaceBecamePrimaryDate"];
  }
  objc_sync_exit(v5);
}

- (NSDate)interfaceBecamePrimaryDate
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_interfaceBecamePrimaryDate;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setEstimatedInterfaceBecamePrimaryDate:(id)a3
{
  objc_super v6 = (NSDate *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_estimatedInterfaceBecamePrimaryDate != v6)
  {
    [(PrimaryInterfaceUtils *)v5 willChangeValueForKey:@"estimatedInterfaceBecamePrimaryDate"];
    objc_storeStrong((id *)&v5->_estimatedInterfaceBecamePrimaryDate, a3);
    [(PrimaryInterfaceUtils *)v5 didChangeValueForKey:@"estimatedInterfaceBecamePrimaryDate"];
  }
  objc_sync_exit(v5);
}

- (NSDate)estimatedInterfaceBecamePrimaryDate
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_estimatedInterfaceBecamePrimaryDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)primaryInterfaceTypeString
{
  return (NSString *)+[InterfaceUtils stringForInterfaceType:self->_primaryInterfaceType];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedInterfaceBecamePrimaryDate, 0);

  objc_storeStrong((id *)&self->_interfaceBecamePrimaryDate, 0);
}

@end