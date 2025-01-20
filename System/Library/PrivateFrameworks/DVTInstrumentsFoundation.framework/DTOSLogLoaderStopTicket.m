@interface DTOSLogLoaderStopTicket
- (void)holdAgent:(id)a3 loader:(id)a4;
- (void)prepareAgent:(id)a3 loader:(id)a4;
@end

@implementation DTOSLogLoaderStopTicket

- (void)holdAgent:(id)a3 loader:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  v8 = (void *)*((void *)v6 + 13);
  *((void *)v6 + 13) = v7;

  v9 = (void *)*((void *)v6 + 8);
  if (v9)
  {
    [v9 invalidate];
LABEL_5:
    objc_storeStrong((id *)v6 + 15, a3);
    goto LABEL_6;
  }
  v10 = (void *)*((void *)v6 + 10);
  if (v10)
  {
    [v10 invalidate];
    +[DTOSLogLoader heartbeat];
    goto LABEL_5;
  }
  [v6 _welcomeAgent:v11];
LABEL_6:
}

- (void)prepareAgent:(id)a3 loader:(id)a4
{
  id v5 = a3;
  id v6 = (id *)a4;
  uint64_t v7 = v6;
  if (v6[8] || v6[10]) {
    __assert_rtn("-[DTOSLogLoaderStopTicket prepareAgent:loader:]", "DTOSLogLoader.mm", 1950, "loader->_loggedStream == nil && loader->_liveStream == nil");
  }
  *((unsigned char *)v6 + 510) = 0;
  [v6[6] mode];
  v8 = [v7[6] dynamicTracingEnabledSubsystems];
  sub_2308A92BC(v8, 0);

  v9 = [v7[6] logSubsystemCategoryPairsToEnable];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = sub_2308ABC4C;
  v14 = &unk_264B8E8A8;
  char v16 = 0;
  uint64_t v15 = 0;
  [v9 enumerateKeysAndObjectsUsingBlock:&v11];

  v10 = [v7[6] signpostSubsystemCategoryPairsToEnable];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = sub_2308ABC4C;
  v14 = &unk_264B8E8A8;
  char v16 = 0;
  uint64_t v15 = 1;
  [v10 enumerateKeysAndObjectsUsingBlock:&v11];
}

@end