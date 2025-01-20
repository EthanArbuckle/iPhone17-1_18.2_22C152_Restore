@interface DTOSLogLoaderStartTicket
- (BOOL)needsHold;
- (void)prepareAgent:(id)a3 loader:(id)a4;
@end

@implementation DTOSLogLoaderStartTicket

- (BOOL)needsHold
{
  return 0;
}

- (void)prepareAgent:(id)a3 loader:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  *((unsigned char *)v6 + 510) = 1;
  if (!*((void *)v6 + 12))
  {
    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v7;

    v9 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = 0;
  }
  v10 = (void *)*((void *)v6 + 10);
  if (v10)
  {
    [v10 activate];
    v11 = [*((id *)v6 + 6) dynamicTracingEnabledSubsystems];
    sub_2308A92BC(v11, 1);

    v12 = [*((id *)v6 + 6) logSubsystemCategoryPairsToEnable];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = sub_2308ABC4C;
    v17 = &unk_264B8E8A8;
    char v19 = 1;
    uint64_t v18 = 0;
    [v12 enumerateKeysAndObjectsUsingBlock:&v14];

    v13 = [*((id *)v6 + 6) signpostSubsystemCategoryPairsToEnable];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = sub_2308ABC4C;
    v17 = &unk_264B8E8A8;
    char v19 = 1;
    uint64_t v18 = 1;
    [v13 enumerateKeysAndObjectsUsingBlock:&v14];
  }
}

@end