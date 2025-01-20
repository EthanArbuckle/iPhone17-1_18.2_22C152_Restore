@interface ASDTIOServiceManager
+ (Class)ioServiceMatcherClass;
+ (id)dependencyForConfiguration:(id)a3;
+ (id)dependencyForID:(id)a3 andConfiguration:(id)a4;
+ (id)dependencyForIdentifier:(id)a3 andConfiguration:(id)a4;
+ (id)forIOServiceWithClassName:(id)a3;
+ (id)forIOServiceWithClassName:(id)a3 withIDProperty:(id)a4 managerClass:(Class)a5;
+ (id)get;
+ (id)ioServiceClassName;
+ (id)ioServiceIDProperty;
+ (id)matchedIOServiceForID:(id)a3;
+ (void)resetAll;
- (ASDTCondition)cond;
- (ASDTIOServiceMatcher)matcher;
- (BOOL)ioServiceCanBeAdded:(id)a3;
- (NSArray)delegateList;
- (NSMutableArray)delegates;
- (NSMutableDictionary)ioServices;
- (NSMutableDictionary)ioServicesByIdentifier;
- (NSString)idProperty;
- (NSString)ioServiceClassName;
- (NSString)name;
- (id)allocateMatcher;
- (id)createIOServiceForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (id)findOrAddIOServiceForID:(id)a3;
- (id)getIdentifierForIOObject:(unsigned int)a3 withProperties:(id)a4;
- (id)initForIOServiceWithClassName:(id)a3 andIDProperty:(id)a4;
- (id)matchedIOServiceForID:(id)a3;
- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (void)addDelegate:(id)a3 forIDValues:(id)a4;
- (void)ioServiceWillTerminate:(unsigned int)a3 withProperties:(id)a4;
- (void)matchedIOService:(unsigned int)a3 withProperties:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)reset;
- (void)setCond:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setIdProperty:(id)a3;
- (void)setIoServiceClassName:(id)a3;
- (void)setIoServices:(id)a3;
- (void)setIoServicesByIdentifier:(id)a3;
- (void)setMatcher:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ASDTIOServiceManager

+ (id)forIOServiceWithClassName:(id)a3 withIDProperty:(id)a4 managerClass:(Class)a5
{
  id v7 = a3;
  id v8 = a4;
  if (forIOServiceWithClassName_withIDProperty_managerClass__predicate == -1)
  {
    if (a5)
    {
LABEL_3:
      char v9 = [(objc_class *)a5 isSubclassOfClass:objc_opt_class()];
      v10 = 0;
      if (!v7 || (v9 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&forIOServiceWithClassName_withIDProperty_managerClass__predicate, &__block_literal_global_2);
    if (a5) {
      goto LABEL_3;
    }
  }
  if (!v7)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_15;
  }
LABEL_8:
  if ([v7 isEqualToString:&stru_26FCA6768]) {
    goto LABEL_9;
  }
  [(id)gServiceManagerLock lock];
  uint64_t v11 = [(id)gServiceManagerDictionary objectForKey:v7];
  v10 = (void *)v11;
  if (a5)
  {
    if (!v11)
    {
      v10 = (void *)[[a5 alloc] initForIOServiceWithClassName:v7 andIDProperty:v8];
      if (v10) {
        [(id)gServiceManagerDictionary setObject:v10 forKey:v7];
      }
    }
  }
  [(id)gServiceManagerLock unlock];
LABEL_15:

  return v10;
}

uint64_t __78__ASDTIOServiceManager_forIOServiceWithClassName_withIDProperty_managerClass___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08958]);
  v1 = (void *)gServiceManagerLock;
  gServiceManagerLock = (uint64_t)v0;

  [(id)gServiceManagerLock setName:@"com.apple.AudioServerDriverTransports.ASDTIOServiceManager"];
  gServiceManagerDictionary = [MEMORY[0x263EFF9A0] dictionary];
  return MEMORY[0x270F9A758]();
}

+ (id)ioServiceClassName
{
  return 0;
}

+ (id)ioServiceIDProperty
{
  return 0;
}

+ (id)get
{
  v3 = [a1 ioServiceClassName];
  v4 = [a1 ioServiceIDProperty];
  v5 = [a1 forIOServiceWithClassName:v3 withIDProperty:v4 managerClass:a1];

  return v5;
}

+ (id)forIOServiceWithClassName:(id)a3
{
  return (id)[a1 forIOServiceWithClassName:a3 withIDProperty:0 managerClass:0];
}

+ (Class)ioServiceMatcherClass
{
  return (Class)objc_opt_class();
}

- (id)initForIOServiceWithClassName:(id)a3 andIDProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || [v7 isEqualToString:&stru_26FCA6768])
  {
    char v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOServiceManager initForIOServiceWithClassName:andIDProperty:](v9);
    }

    if (!v7 || [v7 isEqualToString:&stru_26FCA6768])
    {
      v36 = [MEMORY[0x263F08690] currentHandler];
      [v36 handleFailureInMethod:a2 object:self file:@"ASDTIOServiceManager.m" lineNumber:190 description:@"Bad argument."];
    }
  }
  v37.receiver = self;
  v37.super_class = (Class)ASDTIOServiceManager;
  v10 = [(ASDTIOServiceManager *)&v37 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_13;
  }
  [(ASDTIOServiceManager *)v10 setIdProperty:v8];
  [(ASDTIOServiceManager *)v11 setIoServiceClassName:v7];
  v12 = NSString;
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v15 = [(ASDTIOServiceManager *)v11 ioServiceClassName];
  v16 = [v12 stringWithFormat:@"%@.%@", v14, v15];
  [(ASDTIOServiceManager *)v11 setName:v16];

  v17 = NSString;
  v18 = [(ASDTIOServiceManager *)v11 name];
  v19 = [v17 stringWithFormat:@"%s.%@", "com.apple.AudioServerDriverTransports", v18];
  v20 = +[ASDTCondition conditionWithName:v19];
  [(ASDTIOServiceManager *)v11 setCond:v20];

  v21 = [MEMORY[0x263EFF980] array];
  [(ASDTIOServiceManager *)v11 setDelegates:v21];

  v22 = [MEMORY[0x263EFF9A0] dictionary];
  [(ASDTIOServiceManager *)v11 setIoServices:v22];

  v23 = [MEMORY[0x263EFF9A0] dictionary];
  [(ASDTIOServiceManager *)v11 setIoServicesByIdentifier:v23];

  uint64_t v24 = [(ASDTIOServiceManager *)v11 cond];
  if (!v24) {
    goto LABEL_16;
  }
  v25 = (void *)v24;
  uint64_t v26 = [(ASDTIOServiceManager *)v11 delegates];
  if (!v26) {
    goto LABEL_15;
  }
  v27 = (void *)v26;
  uint64_t v28 = [(ASDTIOServiceManager *)v11 ioServices];
  if (!v28)
  {

LABEL_15:
LABEL_16:
    v34 = ASDTBaseLogType();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMAction initWithConfig:forSequencer:](v11);
    }
    goto LABEL_18;
  }
  v29 = (void *)v28;
  v30 = [(ASDTIOServiceManager *)v11 ioServicesByIdentifier];

  if (!v30) {
    goto LABEL_16;
  }
  v31 = [(ASDTIOServiceManager *)v11 allocateMatcher];
  [(ASDTIOServiceManager *)v11 setMatcher:v31];

  v32 = [(ASDTIOServiceManager *)v11 matcher];

  if (!v32)
  {
    v34 = ASDTBaseLogType();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOServiceManager initForIOServiceWithClassName:andIDProperty:](v11);
    }
LABEL_18:

    v33 = 0;
    goto LABEL_19;
  }
LABEL_13:
  v33 = v11;
LABEL_19:

  return v33;
}

- (id)allocateMatcher
{
  id v3 = objc_alloc((Class)[(id)objc_opt_class() ioServiceMatcherClass]);
  v4 = [(ASDTIOServiceManager *)self ioServiceClassName];
  v5 = (void *)[v3 initForIOServiceWithClassName:v4 withDelegate:self];

  return v5;
}

- (NSArray)delegateList
{
  id v3 = [(ASDTIOServiceManager *)self cond];
  [v3 lock];

  v4 = [(ASDTIOServiceManager *)self delegates];
  v5 = (void *)[v4 copy];

  v6 = [(ASDTIOServiceManager *)self cond];
  [v6 unlock];

  return (NSArray *)v5;
}

- (id)createIOServiceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(ASDTIOServiceManager *)self serviceForIOObject:v4 andIDValue:v6];
  id v8 = ASDTBaseLogType();
  char v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(ASDTIOServiceManager *)self name];
      uint64_t v11 = [(ASDTIOServiceManager *)self idProperty];
      if (v11)
      {
        v12 = [(ASDTIOServiceManager *)self idProperty];
      }
      else
      {
        v12 = @"identifier";
      }
      int v17 = 138412802;
      v18 = v10;
      __int16 v19 = 2112;
      *(void *)v20 = v12;
      *(_WORD *)&v20[8] = 2112;
      *(void *)&v20[10] = v6;
      _os_log_impl(&dword_2489BC000, v9, OS_LOG_TYPE_DEFAULT, "%@: IOService with %@ '%@' is ready.", (uint8_t *)&v17, 0x20u);
      if (v11) {
    }
      }
    v13 = [(ASDTIOServiceManager *)self ioServices];
    [v13 setObject:v7 forKey:v6];

    id v14 = v7;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v16 = [(ASDTIOServiceManager *)self name];
      int v17 = 138412802;
      v18 = v16;
      __int16 v19 = 1024;
      *(_DWORD *)v20 = v4;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v6;
      _os_log_error_impl(&dword_2489BC000, v9, OS_LOG_TYPE_ERROR, "%@: Failed creating object for IOService: %x with ID: %@", (uint8_t *)&v17, 0x1Cu);
    }
  }

  return v7;
}

- (id)findOrAddIOServiceForID:(id)a3
{
  id v4 = a3;
  v5 = [(ASDTIOServiceManager *)self ioServices];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(ASDTIOServiceManager *)self ioServicesByIdentifier];
    char v9 = [v4 identifier];
    v10 = [v8 objectForKey:v9];

    if (v10)
    {
      -[ASDTIOServiceManager createIOServiceForIOObject:andIDValue:](self, "createIOServiceForIOObject:andIDValue:", [v10 ioObject], v4);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (void)addDelegate:(id)a3 forIDValues:(id)a4
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = [(ASDTIOServiceManager *)self cond];
  [v9 lock];

  v10 = [(ASDTIOServiceManager *)self matcher];

  if (!v10)
  {
    uint64_t v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ASDTIOServiceManager addDelegate:forIDValues:].cold.4(self);
    }

    v12 = [(ASDTIOServiceManager *)self matcher];

    if (!v12)
    {
      v53 = [MEMORY[0x263F08690] currentHandler];
      v54 = [(ASDTIOServiceManager *)self name];
      [v53 handleFailureInMethod:a2, self, @"ASDTIOServiceManager.m", 275, @"%@: Failed to allocate ASDTIOServiceMatcher.", v54 object file lineNumber description];
    }
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v13 = [(ASDTIOServiceManager *)self delegates];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v69;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        id v19 = [v18 delegate];

        if (v19 == v7)
        {
          if (v8)
          {
            v22 = [MEMORY[0x263EFF9C0] set];
            v23 = [v18 idValues];
            uint64_t v24 = [v23 count];

            if (v24)
            {
              v25 = [v18 idValues];
              uint64_t v26 = [v25 allObjects];
              [v22 addObjectsFromArray:v26];
            }
            [v22 addObjectsFromArray:v8];
            v27 = (void *)[v22 copy];
            [v18 setIdValues:v27];
          }
          else
          {
            [v18 setIdValues:0];
          }
          goto LABEL_21;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v20 = +[ASDTIOServiceManagerDelegateProxy forDelegate:v7 andIDValues:v8];
  if (v20)
  {
    v13 = (void *)v20;
    uint64_t v21 = [(ASDTIOServiceManager *)self delegates];
    [v21 addObject:v13];

LABEL_21:
    v55 = v7;

    uint64_t v28 = ASDTBaseLogType();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[ASDTIOServiceManager addDelegate:forIDValues:]();
    }

    v29 = [MEMORY[0x263EFF980] array];
    v30 = [MEMORY[0x263EFF980] array];
    v31 = v30;
    if (v8)
    {
      [v30 addObjectsFromArray:v8];
    }
    else
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v32 = [(ASDTIOServiceManager *)self ioServicesByIdentifier];
      v33 = [v32 allKeys];

      uint64_t v34 = [v33 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v65 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = +[ASDTIOServiceID forIdentifier:*(void *)(*((void *)&v64 + 1) + 8 * j) andClientType:0];
            if (v38)
            {
              [v31 addObject:v38];
            }
            else
            {
              v39 = ASDTBaseLogType();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                -[ASDTIOServiceManager addDelegate:forIDValues:]((uint64_t)v74, (uint64_t)self);
              }
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v35);
      }

      id v8 = 0;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v40 = v31;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v60 objects:v73 count:16];
    id v7 = v55;
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v61 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [(ASDTIOServiceManager *)self findOrAddIOServiceForID:*(void *)(*((void *)&v60 + 1) + 8 * k)];
          if (v45) {
            [v29 addObject:v45];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v60 objects:v73 count:16];
      }
      while (v42);
    }

    v46 = [(ASDTIOServiceManager *)self cond];
    [v46 unlock];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v47 = v29;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v57 != v50) {
            objc_enumerationMutation(v47);
          }
          [v55 ioServiceAvailable:*(void *)(*((void *)&v56 + 1) + 8 * m) withManager:self];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v56 objects:v72 count:16];
      }
      while (v49);
    }
  }
  else
  {
    v52 = ASDTBaseLogType();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMAction initWithConfig:forSequencer:](self);
    }

    id v47 = [(ASDTIOServiceManager *)self cond];
    [v47 unlock];
  }
}

- (void)removeDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ASDTIOServiceManager *)self cond];
  [v5 lock];

  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(ASDTIOServiceManager *)self delegates];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 delegate];
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          id v15 = [v12 delegate];

          if (v15 != v4) {
            continue;
          }
        }
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [(ASDTIOServiceManager *)self delegates];
  [v16 removeObjectsInArray:v6];

  int v17 = [(ASDTIOServiceManager *)self cond];
  [v17 unlock];
}

- (BOOL)ioServiceCanBeAdded:(id)a3
{
  return 1;
}

- (id)serviceForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  return +[ASDTIOService forIOObject:*(void *)&a3 andIDValue:a4];
}

- (id)matchedIOServiceForID:(id)a3
{
  id v4 = a3;
  v5 = [(ASDTIOServiceManager *)self cond];
  [v5 lock];

  id v6 = [(ASDTIOServiceManager *)self findOrAddIOServiceForID:v4];

  id v7 = [(ASDTIOServiceManager *)self cond];
  [v7 unlock];

  return v6;
}

+ (id)matchedIOServiceForID:(id)a3
{
  id v4 = a3;
  v5 = [a1 get];
  id v6 = [v5 matchedIOServiceForID:v4];

  return v6;
}

- (id)getIdentifierForIOObject:(unsigned int)a3 withProperties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(ASDTIOServiceManager *)self idProperty];

  if (v7)
  {
    uint64_t v8 = [(ASDTIOServiceManager *)self idProperty];
    uint64_t v9 = [v6 objectForKey:v8];

    if (!v9)
    {
      uint64_t v10 = ASDTBaseLogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ASDTIOServiceManager getIdentifierForIOObject:withProperties:](self);
      }

      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", v4);
  }

  return v9;
}

- (void)matchedIOService:(unsigned int)a3 withProperties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unsigned int v71 = v4;
  id v7 = [(ASDTIOServiceManager *)self getIdentifierForIOObject:v4 withProperties:v6];
  if (v7 && [(ASDTIOServiceManager *)self ioServiceCanBeAdded:v6])
  {
    uint64_t v8 = [(ASDTIOServiceManager *)self cond];
    [v8 lock];

    uint64_t v9 = [(ASDTIOServiceManager *)self ioServicesByIdentifier];
    uint64_t v10 = [v9 objectForKey:v7];

    v72 = v7;
    if (v10)
    {
      uint64_t v11 = ASDTBaseLogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ASDTIOServiceManager matchedIOService:withProperties:]();
      }

      v12 = [(ASDTIOServiceManager *)self cond];
      [v12 unlock];
    }
    else
    {
      uint64_t v64 = +[ASDTIOServiceID forIdentifier:v7 andClientType:0];
      uint64_t v13 = +[ASDTIOService forIOObject:andIDValue:](ASDTIOService, "forIOObject:andIDValue:", v71);
      if (v13)
      {
        uint64_t v10 = (void *)v13;
        uint64_t v14 = [(ASDTIOServiceManager *)self ioServicesByIdentifier];
        [v14 setObject:v10 forKey:v7];

        id v15 = ASDTBaseLogType();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [(ASDTIOServiceManager *)self name];
          int v17 = [(ASDTIOServiceManager *)self idProperty];
          if (v17)
          {
            long long v18 = [(ASDTIOServiceManager *)self idProperty];
          }
          else
          {
            long long v18 = @"identifier";
          }
          *(_DWORD *)buf = 138412802;
          v100 = v16;
          __int16 v101 = 2112;
          v102 = v18;
          __int16 v103 = 2112;
          v104 = v7;
          _os_log_impl(&dword_2489BC000, v15, OS_LOG_TYPE_DEFAULT, "%@: IOServices with %@ '%@' ready to match.", buf, 0x20u);
          if (v17) {
        }
          }
        long long v92 = 0u;
        long long v93 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        obuint64_t j = [(ASDTIOServiceManager *)self delegates];
        uint64_t v68 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
        id v63 = v6;
        if (v68)
        {
          v73 = 0;
          long long v66 = 0;
          uint64_t v67 = *(void *)v91;
          long long v70 = self;
          do
          {
            for (uint64_t i = 0; i != v68; ++i)
            {
              if (*(void *)v91 != v67) {
                objc_enumerationMutation(obj);
              }
              v22 = *(void **)(*((void *)&v90 + 1) + 8 * i);
              uint64_t v23 = objc_msgSend(v22, "delegate", v63);

              if (v23)
              {
                uint64_t v69 = i;
                uint64_t v24 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
                v25 = [v22 idValues];
                uint64_t v26 = [v25 count];

                if (v26)
                {
                  long long v88 = 0u;
                  long long v89 = 0u;
                  long long v86 = 0u;
                  long long v87 = 0u;
                  v27 = [v22 idValues];
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v86 objects:v97 count:16];
                  if (v28)
                  {
                    uint64_t v29 = v28;
                    uint64_t v30 = *(void *)v87;
                    do
                    {
                      for (uint64_t j = 0; j != v29; ++j)
                      {
                        if (*(void *)v87 != v30) {
                          objc_enumerationMutation(v27);
                        }
                        v32 = *(void **)(*((void *)&v86 + 1) + 8 * j);
                        v33 = [v32 identifier];
                        int v34 = [v33 isEqual:v72];

                        if (v34) {
                          [v24 addObject:v32];
                        }
                      }
                      uint64_t v29 = [v27 countByEnumeratingWithState:&v86 objects:v97 count:16];
                    }
                    while (v29);
                  }

                  self = v70;
                }
                else
                {
                  [v24 addObject:v64];
                }
                long long v84 = 0u;
                long long v85 = 0u;
                long long v82 = 0u;
                long long v83 = 0u;
                id v36 = v24;
                uint64_t v37 = [v36 countByEnumeratingWithState:&v82 objects:v96 count:16];
                if (v37)
                {
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v83;
                  do
                  {
                    for (uint64_t k = 0; k != v38; ++k)
                    {
                      if (*(void *)v83 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      uint64_t v41 = *(void *)(*((void *)&v82 + 1) + 8 * k);
                      uint64_t v42 = [(ASDTIOServiceManager *)self ioServices];
                      uint64_t v43 = [v42 objectForKey:v41];

                      uint64_t v10 = (void *)v43;
                      if (!v43)
                      {
                        uint64_t v10 = [(ASDTIOServiceManager *)self createIOServiceForIOObject:v71 andIDValue:v41];
                        if (!v10) {
                          continue;
                        }
                      }
                      v44 = [v22 delegate];
                      v45 = +[ASDTIOServiceManagerDelegatePair forDelegate:v44 andIOService:v10];

                      if (v45)
                      {
                        v46 = v73;
                        if (!v73)
                        {
                          v46 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
                        }
                        v73 = v46;
                        [v46 addObject:v45];
                      }
                      else
                      {
                        id v47 = ASDTBaseLogType();
                        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                          -[ASDTIOServiceManager matchedIOService:withProperties:]((uint64_t)buf, (uint64_t)v70);
                        }

                        self = v70;
                      }
                    }
                    uint64_t v38 = [v36 countByEnumeratingWithState:&v82 objects:v96 count:16];
                  }
                  while (v38);
                }

                uint64_t i = v69;
              }
              else
              {
                uint64_t v35 = v66;
                if (!v66)
                {
                  uint64_t v35 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
                }
                long long v66 = v35;
                [v35 addObject:v22];
              }
            }
            uint64_t v68 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
          }
          while (v68);
        }
        else
        {
          long long v66 = 0;
          v73 = 0;
        }

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v48 = v66;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v78 objects:v95 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v79;
          do
          {
            for (uint64_t m = 0; m != v50; ++m)
            {
              if (*(void *)v79 != v51) {
                objc_enumerationMutation(v48);
              }
              uint64_t v53 = *(void *)(*((void *)&v78 + 1) + 8 * m);
              v54 = [(ASDTIOServiceManager *)self delegates];
              [v54 removeObject:v53];
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v78 objects:v95 count:16];
          }
          while (v50);
        }

        v55 = [(ASDTIOServiceManager *)self cond];
        [v55 unlock];

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v20 = v73;
        uint64_t v56 = [v20 countByEnumeratingWithState:&v74 objects:v94 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v75;
          do
          {
            for (uint64_t n = 0; n != v57; ++n)
            {
              if (*(void *)v75 != v58) {
                objc_enumerationMutation(v20);
              }
              long long v60 = *(void **)(*((void *)&v74 + 1) + 8 * n);
              long long v61 = objc_msgSend(v60, "delegate", v63);
              long long v62 = [v60 ioService];
              [v61 ioServiceAvailable:v62 withManager:self];
            }
            uint64_t v57 = [v20 countByEnumeratingWithState:&v74 objects:v94 count:16];
          }
          while (v57);
        }

        id v6 = v63;
      }
      else
      {
        long long v19 = ASDTBaseLogType();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[ASDTIOServiceManager matchedIOService:withProperties:]();
        }

        id v20 = [(ASDTIOServiceManager *)self cond];
        [v20 unlock];
        uint64_t v10 = 0;
      }

      v12 = (void *)v64;
    }

    id v7 = v72;
  }
}

- (void)ioServiceWillTerminate:(unsigned int)a3 withProperties:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(ASDTIOServiceManager *)self getIdentifierForIOObject:v5 withProperties:v7];
  if (v8)
  {
    uint64_t v9 = [(ASDTIOServiceManager *)self cond];
    [v9 lock];

    uint64_t v10 = [(ASDTIOServiceManager *)self ioServicesByIdentifier];
    uint64_t v11 = [v10 objectForKey:v8];

    long long v92 = self;
    long long v81 = (void *)v11;
    if (v11)
    {
      id v80 = v7;
      long long v84 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
      long long v117 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      v12 = [(ASDTIOServiceManager *)self ioServices];
      uint64_t v13 = [v12 allKeys];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v117 objects:v135 count:16];
      long long v87 = v8;
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v118;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v118 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v117 + 1) + 8 * i);
            long long v19 = [v18 identifier];
            int v20 = [v19 isEqualToString:v87];

            if (v20) {
              [v84 addObject:v18];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v117 objects:v135 count:16];
        }
        while (v15);
      }

      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v21 = v92;
      obuint64_t j = [(ASDTIOServiceManager *)v92 delegates];
      uint64_t v22 = [obj countByEnumeratingWithState:&v113 objects:v134 count:16];
      if (!v22)
      {
        uint64_t v24 = 0;
        v25 = 0;
        goto LABEL_64;
      }
      uint64_t v23 = v22;
      uint64_t v24 = 0;
      v25 = 0;
      uint64_t v26 = *(void *)v114;
      uint64_t v82 = *(void *)v114;
      while (1)
      {
        uint64_t v27 = 0;
        uint64_t v83 = v23;
        do
        {
          if (*(void *)v114 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v113 + 1) + 8 * v27);
          uint64_t v29 = [v28 delegate];

          if (v29)
          {
            uint64_t v88 = v27;
            uint64_t v30 = [v28 delegate];
            char v31 = objc_opt_respondsToSelector();

            if ((v31 & 1) == 0)
            {
              uint64_t v27 = v88;
              goto LABEL_54;
            }
            id v90 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
            v32 = [v28 idValues];
            uint64_t v33 = [v32 count];

            long long v86 = v24;
            if (v33)
            {
              long long v111 = 0u;
              long long v112 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              int v34 = [v28 idValues];
              uint64_t v35 = [v34 countByEnumeratingWithState:&v109 objects:v132 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v110;
                do
                {
                  for (uint64_t j = 0; j != v36; ++j)
                  {
                    if (*(void *)v110 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    uint64_t v39 = *(void **)(*((void *)&v109 + 1) + 8 * j);
                    uint64_t v4 = [v39 identifier];
                    int v40 = [v4 isEqualToString:v87];

                    if (v40) {
                      [v90 addObject:v39];
                    }
                  }
                  uint64_t v36 = [v34 countByEnumeratingWithState:&v109 objects:v132 count:16];
                }
                while (v36);
                long long v21 = v92;
                uint64_t v24 = v86;
                uint64_t v26 = v82;
              }
LABEL_36:
              uint64_t v27 = v88;

              long long v107 = 0u;
              long long v108 = 0u;
              long long v105 = 0u;
              long long v106 = 0u;
              uint64_t v42 = v90;
              uint64_t v43 = [v42 countByEnumeratingWithState:&v105 objects:v131 count:16];
              if (v43)
              {
                uint64_t v44 = v43;
                uint64_t v45 = *(void *)v106;
                do
                {
                  for (uint64_t k = 0; k != v44; ++k)
                  {
                    if (*(void *)v106 != v45) {
                      objc_enumerationMutation(v42);
                    }
                    uint64_t v47 = *(void *)(*((void *)&v105 + 1) + 8 * k);
                    uint64_t v4 = [(ASDTIOServiceManager *)v21 ioServices];
                    id v48 = [v4 objectForKey:v47];

                    if (v48)
                    {
                      uint64_t v4 = ASDTIOServiceManagerDelegatePair;
                      uint64_t v49 = [v28 delegate];
                      uint64_t v50 = +[ASDTIOServiceManagerDelegatePair forDelegate:v49 andIOService:v48];

                      if (v50)
                      {
                        if (!v25)
                        {
                          v25 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
                        }
                        [v25 addObject:v50];
                        long long v21 = v92;
                      }
                      else
                      {
                        uint64_t v4 = ASDTBaseLogType();
                        long long v21 = v92;
                        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
                          -[ASDTIOServiceManager matchedIOService:withProperties:]((uint64_t)v130, (uint64_t)v92);
                        }
                      }
                    }
                  }
                  uint64_t v44 = [v42 countByEnumeratingWithState:&v105 objects:v131 count:16];
                }
                while (v44);
                uint64_t v24 = v86;
                uint64_t v26 = v82;
                uint64_t v27 = v88;
              }
            }
            else
            {
              uint64_t v41 = +[ASDTIOServiceID forIdentifier:v87 andClientType:0];
              if (v41)
              {
                int v34 = (void *)v41;
                [v90 addObject:v41];
                goto LABEL_36;
              }
              uint64_t v42 = ASDTBaseLogType();
              uint64_t v27 = v88;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                -[ASDTIOServiceManager matchedIOService:withProperties:]((uint64_t)v133, (uint64_t)v21);
              }
            }

            uint64_t v23 = v83;
            goto LABEL_54;
          }
          if (!v24)
          {
            uint64_t v24 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
          }
          [v24 addObject:v28];
LABEL_54:
          ++v27;
        }
        while (v27 != v23);
        uint64_t v51 = [obj countByEnumeratingWithState:&v113 objects:v134 count:16];
        uint64_t v23 = v51;
        if (!v51)
        {
LABEL_64:

          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v54 = v24;
          uint64_t v55 = [v54 countByEnumeratingWithState:&v101 objects:v129 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v102;
            do
            {
              for (uint64_t m = 0; m != v56; ++m)
              {
                if (*(void *)v102 != v57) {
                  objc_enumerationMutation(v54);
                }
                uint64_t v59 = *(void *)(*((void *)&v101 + 1) + 8 * m);
                long long v60 = [(ASDTIOServiceManager *)v92 delegates];
                [v60 removeObject:v59];
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v101 objects:v129 count:16];
            }
            while (v56);
          }
          long long v89 = v54;

          long long v61 = [(ASDTIOServiceManager *)v92 ioServicesByIdentifier];
          [v61 removeObjectForKey:v87];

          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          id v91 = v84;
          uint64_t v62 = [v91 countByEnumeratingWithState:&v97 objects:v128 count:16];
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v98;
            do
            {
              for (uint64_t n = 0; n != v63; ++n)
              {
                if (*(void *)v98 != v64) {
                  objc_enumerationMutation(v91);
                }
                uint64_t v66 = *(void *)(*((void *)&v97 + 1) + 8 * n);
                uint64_t v67 = ASDTBaseLogType();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v68 = [(ASDTIOServiceManager *)v92 name];
                  uint64_t v69 = [(ASDTIOServiceManager *)v92 idProperty];
                  if (v69)
                  {
                    uint64_t v4 = [(ASDTIOServiceManager *)v92 idProperty];
                    long long v70 = (__CFString *)v4;
                  }
                  else
                  {
                    long long v70 = @"identifier";
                  }
                  *(_DWORD *)buf = 138412802;
                  v123 = v68;
                  __int16 v124 = 2112;
                  v125 = v70;
                  __int16 v126 = 2112;
                  uint64_t v127 = v66;
                  _os_log_impl(&dword_2489BC000, v67, OS_LOG_TYPE_DEFAULT, "%@: IOService with %@ value '%@' will terminate.", buf, 0x20u);
                  if (v69) {
                }
                  }
                unsigned int v71 = [(ASDTIOServiceManager *)v92 ioServices];
                [v71 removeObjectForKey:v66];
              }
              uint64_t v63 = [v91 countByEnumeratingWithState:&v97 objects:v128 count:16];
            }
            while (v63);
          }

          v72 = [(ASDTIOServiceManager *)v92 cond];
          [v72 unlock];

          long long v95 = 0u;
          long long v96 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v53 = v25;
          uint64_t v73 = [v53 countByEnumeratingWithState:&v93 objects:v121 count:16];
          if (v73)
          {
            uint64_t v74 = v73;
            uint64_t v75 = *(void *)v94;
            do
            {
              for (iuint64_t i = 0; ii != v74; ++ii)
              {
                if (*(void *)v94 != v75) {
                  objc_enumerationMutation(v53);
                }
                long long v77 = *(void **)(*((void *)&v93 + 1) + 8 * ii);
                long long v78 = [v77 delegate];
                long long v79 = [v77 ioService];
                [v78 ioServiceWillTerminate:v79 withManager:v92];
              }
              uint64_t v74 = [v53 countByEnumeratingWithState:&v93 objects:v121 count:16];
            }
            while (v74);
          }

          id v7 = v80;
          uint64_t v8 = v87;
          goto LABEL_93;
        }
      }
    }
    v52 = ASDTBaseLogType();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[ASDTIOServiceManager ioServiceWillTerminate:withProperties:]();
    }

    id v53 = [(ASDTIOServiceManager *)self cond];
    [v53 unlock];
LABEL_93:
  }
}

- (void)reset
{
  id v3 = [(ASDTIOServiceManager *)self cond];
  [v3 lock];

  uint64_t v4 = [(ASDTIOServiceManager *)self ioServices];
  [v4 removeAllObjects];

  uint64_t v5 = [(ASDTIOServiceManager *)self ioServicesByIdentifier];
  [v5 removeAllObjects];

  id v6 = [(ASDTIOServiceManager *)self delegates];
  [v6 removeAllObjects];

  id v7 = [(ASDTIOServiceManager *)self allocateMatcher];
  [(ASDTIOServiceManager *)self setMatcher:v7];

  id v8 = [(ASDTIOServiceManager *)self cond];
  [v8 unlock];
}

+ (void)resetAll
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(id)gServiceManagerLock lock];
  v2 = [(id)gServiceManagerDictionary allValues];
  [(id)gServiceManagerLock unlock];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "reset", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (id)dependencyForID:(id)a3 andConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [a1 get];
  long long v9 = [v8 ioServiceClassName];
  long long v10 = +[ASDTIOServiceDependency forClassName:v9 idValue:v7 andConfiguration:v6];

  return v10;
}

+ (id)dependencyForIdentifier:(id)a3 andConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [a1 get];
  long long v9 = [v8 ioServiceClassName];
  long long v10 = +[ASDTIOServiceID forIdentifier:v7 andClientType:0];

  long long v11 = +[ASDTIOServiceDependency forClassName:v9 idValue:v10 andConfiguration:v6];

  return v11;
}

+ (id)dependencyForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 get];
  id v6 = [v5 ioServiceClassName];
  id v7 = +[ASDTIOServiceDependency forAnyInstanceOfClassName:v6 andConfiguration:v4];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)ioServiceClassName
{
  return self->_ioServiceClassName;
}

- (void)setIoServiceClassName:(id)a3
{
}

- (ASDTIOServiceMatcher)matcher
{
  return self->_matcher;
}

- (void)setMatcher:(id)a3
{
}

- (NSString)idProperty
{
  return self->_idProperty;
}

- (void)setIdProperty:(id)a3
{
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableDictionary)ioServices
{
  return self->_ioServices;
}

- (void)setIoServices:(id)a3
{
}

- (NSMutableDictionary)ioServicesByIdentifier
{
  return self->_ioServicesByIdentifier;
}

- (void)setIoServicesByIdentifier:(id)a3
{
}

- (ASDTCondition)cond
{
  return self->_cond;
}

- (void)setCond:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cond, 0);
  objc_storeStrong((id *)&self->_ioServicesByIdentifier, 0);
  objc_storeStrong((id *)&self->_ioServices, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_idProperty, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_ioServiceClassName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initForIOServiceWithClassName:(void *)a1 andIDProperty:.cold.2(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Failed to allocate matcher.", v4, v5, v6, v7, v8);
}

- (void)initForIOServiceWithClassName:(os_log_t)log andIDProperty:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Bad argument.", v1, 2u);
}

- (void)addDelegate:(uint64_t)a1 forIDValues:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "name");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_1(&dword_2489BC000, v3, v4, "%@: Memory allocation error while adding delegate.");
}

- (void)addDelegate:forIDValues:.cold.3()
{
  OUTLINED_FUNCTION_8();
  v1 = [v0 name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_2489BC000, v2, v3, "%@: Adding delegate for IDs: %@", v4, v5, v6, v7, v8);
}

- (void)addDelegate:(void *)a1 forIDValues:.cold.4(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Failed to allocate ASDTIOServiceMatcher.", v4, v5, v6, v7, v8);
}

- (void)getIdentifierForIOObject:(void *)a1 withProperties:.cold.1(void *a1)
{
  uint64_t v2 = [a1 name];
  long long v9 = [a1 idProperty];
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v3, v4, "%@: ioService missing property with key '%@'", v5, v6, v7, v8, 2u);
}

- (void)matchedIOService:withProperties:.cold.1()
{
  OUTLINED_FUNCTION_8();
  v1 = [v0 name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v2, v3, "%@: Failed to create IOService for identifier '%@'", v4, v5, v6, v7, v8);
}

- (void)matchedIOService:(uint64_t)a1 withProperties:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "name");
  OUTLINED_FUNCTION_6((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_3_1(&dword_2489BC000, v3, v4, "%@: Memory allocation error.");
}

- (void)matchedIOService:withProperties:.cold.3()
{
  OUTLINED_FUNCTION_8();
  v1 = [v0 name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v2, v3, "%@: Duplicate IOService for identifier '%@'", v4, v5, v6, v7, v8);
}

- (void)ioServiceWillTerminate:withProperties:.cold.1()
{
  OUTLINED_FUNCTION_8();
  v1 = [v0 name];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_1(&dword_2489BC000, v2, v3, "%@: Not managing IOService with identifier: %@", v4, v5, v6, v7, v8);
}

@end