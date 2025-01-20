@interface ACDEventLedger
+ (id)sharedLedger;
- (ACDEventLedger)init;
- (NSMutableArray)eventLedger;
- (id)historyDescription;
- (void)recordEvent:(id)a3;
- (void)setEventLedger:(id)a3;
- (void)simulateCrashWithMessage:(id)a3;
@end

@implementation ACDEventLedger

+ (id)sharedLedger
{
  if (sharedLedger_onceToken != -1) {
    dispatch_once(&sharedLedger_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedLedger_sharedInstance;

  return v2;
}

uint64_t __30__ACDEventLedger_sharedLedger__block_invoke()
{
  sharedLedger_sharedInstance = objc_alloc_init(ACDEventLedger);

  return MEMORY[0x270F9A758]();
}

- (ACDEventLedger)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACDEventLedger;
  v2 = [(ACDEventLedger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    eventLedger = v2->_eventLedger;
    v2->_eventLedger = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)recordEvent:(id)a3
{
  id v4 = a3;
  v5 = [(ACDEventLedger *)self eventLedger];
  objc_sync_enter(v5);
  objc_super v6 = [(ACDEventLedger *)self eventLedger];
  [v6 addObject:v4];

  v7 = [(ACDEventLedger *)self eventLedger];
  unint64_t v8 = [v7 count];

  if (v8 >= 0xB)
  {
    v9 = [(ACDEventLedger *)self eventLedger];
    [v9 removeObjectAtIndex:0];
  }
  crashInfoString = self->_crashInfoString;
  if (crashInfoString)
  {
    free(crashInfoString);
    self->_crashInfoString = 0;
  }
  id v11 = [(ACDEventLedger *)self historyDescription];
  self->_crashInfoString = strdup((const char *)[v11 UTF8String]);

  qword_26ABED640 = (uint64_t)self->_crashInfoString;
  objc_sync_exit(v5);

  if (recordEvent__onceToken != -1) {
    dispatch_once(&recordEvent__onceToken, &__block_literal_global_3);
  }
  if (recordEvent__logDatabaseTransactions == 1)
  {
    v12 = _ACDSaveLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACDEventLedger recordEvent:]((uint64_t)v4, v12);
    }
  }
}

uint64_t __30__ACDEventLedger_recordEvent___block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result) {
    recordEvent__logDatabaseTransactions = 1;
  }
  return result;
}

- (id)historyDescription
{
  v2 = NSString;
  uint64_t v3 = [(ACDEventLedger *)self eventLedger];
  id v4 = [v3 description];
  v5 = [v2 stringWithFormat:@"Event history:\n%@", v4];

  return v5;
}

- (void)simulateCrashWithMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = getpid();
  id v5 = v3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  objc_super v6 = (void (*)(uint64_t, uint64_t, id))getSimulateCrashSymbolLoc_ptr;
  id v11 = getSimulateCrashSymbolLoc_ptr;
  if (!getSimulateCrashSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getSimulateCrashSymbolLoc_block_invoke;
    v7[3] = &unk_264321CF8;
    v7[4] = &v8;
    __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v7);
    objc_super v6 = (void (*)(uint64_t, uint64_t, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v6) {
    -[ACDEventLedger simulateCrashWithMessage:]();
  }
  v6(v4, 195939070, v5);
}

- (NSMutableArray)eventLedger
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventLedger:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)recordEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2183AD000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)simulateCrashWithMessage:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ACDEventLedger.m", 17, @"%s", dlerror());

  __break(1u);
}

@end