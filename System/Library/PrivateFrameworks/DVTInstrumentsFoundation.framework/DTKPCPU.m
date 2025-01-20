@interface DTKPCPU
+ (id)cpuNamed:(id)a3 fromSerializedData:(id)a4 error:(id *)a5;
+ (id)localCPU:(id *)a3;
+ (void)initialize;
- (DTKPCPU)initWithName:(id)a3 database:(kpep_db *)a4;
- (NSMutableArray)events;
- (NSString)name;
- (id)_fixupAlias:(id)a3;
- (id)allAliasAndNameStrings;
- (id)description;
- (id)eventFromName:(id)a3;
- (id)eventFromNameOrAlias:(id)a3;
- (id)mnemonicToAliasMapping;
- (kpep_db)kpepDB;
- (void)dealloc;
- (void)setEvents:(id)a3;
@end

@implementation DTKPCPU

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DTKPSetupLogging();
    uint64_t v2 = objc_opt_new();
    v3 = (void *)qword_268707FC0;
    qword_268707FC0 = v2;

    dispatch_semaphore_t v4 = dispatch_semaphore_create(1);
    v5 = (void *)qword_268707FC8;
    qword_268707FC8 = (uint64_t)v4;
  }
}

+ (id)localCPU:(id *)a3
{
  if (CSTaskIsTranslated())
  {
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a3, 4294966596, @"CPU Counters are not supported when running under Rosetta.");
    dispatch_semaphore_t v4 = 0;
    goto LABEL_14;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_268707FC8, 0xFFFFFFFFFFFFFFFFLL);
  if (!qword_268707FD0)
  {
    uint64_t v5 = kpep_db_create();
    uint64_t v6 = v5;
    if (v5 == 7)
    {
      if (!DTCoreIs64BitCapable())
      {
LABEL_12:
        dispatch_semaphore_t v4 = 0;
        goto LABEL_13;
      }
    }
    else if (!v5)
    {
      uint64_t v7 = kpep_db_name();
      if (!v7)
      {
        uint64_t v10 = [NSString stringWithUTF8String:0];
        v11 = (void *)qword_268707FD0;
        qword_268707FD0 = v10;

        v12 = [DTKPCPU alloc];
        dispatch_semaphore_t v4 = [(DTKPCPU *)v12 initWithName:qword_268707FD0 database:0];
        [(id)qword_268707FC0 setObject:v4 forKeyedSubscript:qword_268707FD0];
        goto LABEL_13;
      }
      v8 = [NSString stringWithFormat:@"Error getting CPU database name local machine (%d).", v7];
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a3, 4294966596, v8);
      goto LABEL_11;
    }
    v8 = [NSString stringWithFormat:@"Error creating CPU database for local machine (%d).", v6];
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a3, 4294966596, v8);
LABEL_11:

    goto LABEL_12;
  }
  [qword_268707FC0 objectForKeyedSubscript:];
  dispatch_semaphore_t v4 = (DTKPCPU *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_268707FC8);
LABEL_14:
  return v4;
}

+ (id)cpuNamed:(id)a3 fromSerializedData:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_268707FC8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = [(id)qword_268707FC0 objectForKeyedSubscript:v7];
  if (!v9)
  {
    id v10 = v8;
    [v10 bytes];
    [v10 length];
    uint64_t v11 = kpep_db_deserialize();
    if (v11)
    {
      v12 = [NSString stringWithFormat:@"Error creating CPU database from serialized data for '%@' (%d).", v7, v11];
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", a5, 4294966596, v12);

      v9 = 0;
    }
    else
    {
      v9 = [[DTKPCPU alloc] initWithName:v7 database:0];
      [(id)qword_268707FC0 setObject:v9 forKeyedSubscript:v7];
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_268707FC8);

  return v9;
}

- (id)description
{
  BOOL v3 = [(NSString *)self->_lookupName isEqualToString:self->_name];
  name = self->_name;
  if (v3) {
    [NSString stringWithFormat:@"%@ CPU with %ld events", name, -[NSMutableArray count](self->_events, "count"), v7];
  }
  else {
  uint64_t v5 = [NSString stringWithFormat:@"%@ (%@) CPU with %ld events", name, self->_lookupName, -[NSMutableArray count](self->_events, "count")];
  }
  return v5;
}

- (DTKPCPU)initWithName:(id)a3 database:(kpep_db *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DTKPCPU;
  uint64_t v7 = [(DTKPCPU *)&v22 init];
  if (v7)
  {
    id v8 = (void *)sDTKPLogClient;
    if (os_log_type_enabled((os_log_t)sDTKPLogClient, OS_LOG_TYPE_INFO))
    {
      id v9 = v6;
      id v10 = v8;
      uint64_t v11 = [v9 UTF8String];
      buf[0] = 136315138;
      *(void *)&buf[1] = v11;
      _os_log_impl(&dword_23087D000, v10, OS_LOG_TYPE_INFO, "DTKPCPU: Loading KPEP database for %s", (uint8_t *)buf, 0xCu);
    }
    if (!a4) {
      sub_23093E3EC();
    }
    uint64_t v12 = [v6 copy];
    lookupName = v7->_lookupName;
    v7->_lookupName = (NSString *)v12;

    v7->_kpepDB = a4;
    uint64_t v14 = objc_opt_new();
    events = v7->_events;
    v7->_events = (NSMutableArray *)v14;

    v16 = objc_opt_new();
    uint64_t v21 = 0;
    if (kpep_db_name())
    {
      uint64_t v17 = [(NSString *)v7->_lookupName copy];
    }
    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:v21];
    }
    name = v7->_name;
    v7->_name = (NSString *)v17;

    size_t count = 0;
    if (kpep_db_events_count())
    {
      DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPCPU", 0, 4294966496, @"Error fetching events count from counters database.");

      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  if (self->_kpepDB)
  {
    kpep_db_free();
    self->_kpepDB = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)DTKPCPU;
  [(DTKPCPU *)&v3 dealloc];
}

- (kpep_db)kpepDB
{
  return self->_kpepDB;
}

- (id)eventFromName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_2308E12B4;
  v16 = sub_2308E12C4;
  id v17 = 0;
  events = self->_events;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2308E12CC;
  v9[3] = &unk_264B8F850;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableArray *)events enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_fixupAlias:(id)a3
{
  if ([a3 isEqualToString:@"CORE_ACTIVE_CYCLE"]) {
    return @"Cycles";
  }
  else {
    return 0;
  }
}

- (id)eventFromNameOrAlias:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_2308E12B4;
  uint64_t v21 = sub_2308E12C4;
  id v22 = 0;
  events = self->_events;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = sub_2308E150C;
  uint64_t v14 = &unk_264B8F850;
  id v6 = v4;
  id v15 = v6;
  v16 = &v17;
  [(NSMutableArray *)events enumerateObjectsUsingBlock:&v11];
  id v7 = (void *)v18[5];
  if (v7) {
    goto LABEL_2;
  }
  id v9 = -[DTKPCPU _fixupAlias:](self, "_fixupAlias:", v6, v11, v12, v13, v14);
  if (!v9)
  {
    id v7 = (void *)v18[5];
LABEL_2:
    id v8 = v7;
    goto LABEL_5;
  }
  id v8 = [(DTKPCPU *)self eventFromNameOrAlias:v9];

LABEL_5:
  _Block_object_dispose(&v17, 8);

  return v8;
}

- (id)allAliasAndNameStrings
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  events = self->_events;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2308E1730;
  v10[3] = &unk_264B8F878;
  id v11 = v3;
  id v5 = v3;
  [(NSMutableArray *)events enumerateObjectsUsingBlock:v10];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v12[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)mnemonicToAliasMapping
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_events;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 alias:v16];
        if (v10)
        {
          id v11 = (void *)v10;
          uint64_t v12 = [v9 name];

          if (v12)
          {
            v13 = [v9 alias];
            uint64_t v14 = [v9 name];
            [v3 setObject:v13 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lookupName, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end