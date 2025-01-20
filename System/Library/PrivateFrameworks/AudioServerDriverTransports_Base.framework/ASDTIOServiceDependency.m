@interface ASDTIOServiceDependency
+ (BOOL)ioServiceMatched:(id)a3 withClassName:(id)a4 andIdentifier:(id)a5;
+ (id)forAnyInstanceOfClassName:(id)a3 andConfiguration:(id)a4;
+ (id)forClassName:(id)a3 idValue:(id)a4 andConfiguration:(id)a5;
- (ASDTIOService)ioService;
- (ASDTIOServiceID)ioServiceID;
- (ASDTIOServiceManager)ioServiceManager;
- (BOOL)ioServiceAvailable:(id)a3 withManager:(id)a4;
- (BOOL)ioServiceIdentifierMatches:(id)a3;
- (BOOL)ioServiceMatches:(id)a3 withManager:(id)a4;
- (NSDictionary)configuration;
- (NSString)ioServiceClassName;
- (id)description;
- (id)initForAnyInstanceOfClassName:(id)a3 andConfiguration:(id)a4;
- (id)initForClassName:(id)a3 idValue:(id)a4 andConfiguration:(id)a5;
- (void)addManagerDelegate:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setIoService:(id)a3;
- (void)setIoServiceClassName:(id)a3;
- (void)setIoServiceID:(id)a3;
- (void)setIoServiceManager:(id)a3;
@end

@implementation ASDTIOServiceDependency

+ (id)forClassName:(id)a3 idValue:(id)a4 andConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initForClassName:v10 idValue:v9 andConfiguration:v8];

  return v11;
}

+ (id)forAnyInstanceOfClassName:(id)a3 andConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initForAnyInstanceOfClassName:v7 andConfiguration:v6];

  return v8;
}

- (id)initForClassName:(id)a3 idValue:(id)a4 andConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = 0;
  if (v8 && v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)ASDTIOServiceDependency;
    v12 = [(ASDTIOServiceDependency *)&v15 init];
    v13 = v12;
    if (v12)
    {
      [(ASDTIOServiceDependency *)v12 setIoServiceClassName:v8];
      [(ASDTIOServiceDependency *)v13 setIoServiceID:v9];
      [(ASDTIOServiceDependency *)v13 setConfiguration:v10];
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (id)initForAnyInstanceOfClassName:(id)a3 andConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)ASDTIOServiceDependency;
    id v8 = [(ASDTIOServiceDependency *)&v12 init];
    id v9 = v8;
    if (v8)
    {
      [(ASDTIOServiceDependency *)v8 setIoServiceClassName:v6];
      [(ASDTIOServiceDependency *)v9 setConfiguration:v7];
    }
    self = v9;
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)addManagerDelegate:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ASDTIOServiceDependency *)self ioServiceManager];

  if (!v5)
  {
    id v6 = [(ASDTIOServiceDependency *)self ioServiceClassName];
    id v7 = +[ASDTIOServiceManager forIOServiceWithClassName:v6];
    [(ASDTIOServiceDependency *)self setIoServiceManager:v7];
  }
  id v8 = [(ASDTIOServiceDependency *)self ioServiceID];

  if (v8)
  {
    id v9 = [(ASDTIOServiceDependency *)self ioServiceID];
    v11[0] = v9;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  id v10 = [(ASDTIOServiceDependency *)self ioServiceManager];
  [v10 addDelegate:v4 forIDValues:v8];
}

- (BOOL)ioServiceIdentifierMatches:(id)a3
{
  id v4 = a3;
  v5 = [(ASDTIOServiceDependency *)self ioServiceID];
  if (v5)
  {
    id v6 = [(ASDTIOServiceDependency *)self ioServiceID];
    char v7 = [v6 isEqual:v4];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)ioServiceMatches:(id)a3 withManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASDTIOServiceDependency *)self ioServiceManager];

  if (v8 == v7
    && ([v6 idValue],
        id v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = [(ASDTIOServiceDependency *)self ioServiceIdentifierMatches:v9],
        v9,
        v10))
  {
    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ASDTIOServiceDependency ioServiceMatches:withManager:]((uint64_t)self, v11);
    }

    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)ioServiceAvailable:(id)a3 withManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASDTIOServiceDependency *)self ioService];

  if (!v8)
  {
    if (![(ASDTIOServiceDependency *)self ioServiceMatches:v6 withManager:v7])
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    [(ASDTIOServiceDependency *)self setIoService:v6];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (id)description
{
  v3 = [(ASDTIOServiceDependency *)self ioServiceID];

  if (v3)
  {
    id v4 = NSString;
    v5 = [(ASDTIOServiceDependency *)self ioServiceID];
    id v6 = [v4 stringWithFormat:@"('%@')", v5];
  }
  else
  {
    id v6 = &stru_26FCA6768;
  }
  id v7 = NSString;
  id v8 = [(ASDTIOServiceDependency *)self ioServiceClassName];
  BOOL v9 = [v7 stringWithFormat:@"%@%@", v8, v6];

  return v9;
}

+ (BOOL)ioServiceMatched:(id)a3 withClassName:(id)a4 andIdentifier:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "ioService", (void)v20);
        if (v15)
        {
          v16 = (void *)v15;
          v17 = [v14 ioServiceClassName];
          if ([v17 isEqualToString:v8])
          {
            char v18 = [v14 ioServiceIdentifierMatches:v9];

            if (v18)
            {
              LOBYTE(v11) = 1;
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
LABEL_13:

  return v11;
}

- (NSString)ioServiceClassName
{
  return self->_ioServiceClassName;
}

- (void)setIoServiceClassName:(id)a3
{
}

- (ASDTIOServiceID)ioServiceID
{
  return self->_ioServiceID;
}

- (void)setIoServiceID:(id)a3
{
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (ASDTIOServiceManager)ioServiceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioServiceManager);
  return (ASDTIOServiceManager *)WeakRetained;
}

- (void)setIoServiceManager:(id)a3
{
}

- (ASDTIOService)ioService
{
  return self->_ioService;
}

- (void)setIoService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioService, 0);
  objc_destroyWeak((id *)&self->_ioServiceManager);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_ioServiceID, 0);
  objc_storeStrong((id *)&self->_ioServiceClassName, 0);
}

- (void)ioServiceMatches:(uint64_t)a1 withManager:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2489BC000, a2, OS_LOG_TYPE_DEBUG, "Matched: %@", (uint8_t *)&v2, 0xCu);
}

@end