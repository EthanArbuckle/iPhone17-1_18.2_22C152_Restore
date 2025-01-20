@interface DTOSLogLoaderPrepareTicket
- (DTOSLogLoaderConfiguration)configuration;
- (void)_setupLoaderForLoggedEventStore:(id)a3 agent:(id)a4 setDatesBasedOnSource:(BOOL)a5 genericFailureReason:(id)a6;
- (void)holdAgent:(id)a3 loader:(id)a4;
- (void)setConfiguration:(id)a3;
@end

@implementation DTOSLogLoaderPrepareTicket

- (void)holdAgent:(id)a3 loader:(id)a4
{
  id v6 = a3;
  v7 = (char *)a4;
  uint64_t v8 = [(DTOSLogLoaderPrepareTicket *)self configuration];
  v9 = (void *)*((void *)v7 + 6);
  *((void *)v7 + 6) = v8;

  v10 = [(DTOSLogLoaderPrepareTicket *)self configuration];
  uint64_t v11 = [v10 mode];

  if (!v11)
  {
    v12 = [*((id *)v7 + 6) dynamicTracingEnabledSubsystems];
    sub_2308A92BC(v12, 1);

    v13 = [*((id *)v7 + 6) logSubsystemCategoryPairsToEnable];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = sub_2308ABC4C;
    v18 = &unk_264B8E8A8;
    char v20 = 1;
    uint64_t v19 = 0;
    [v13 enumerateKeysAndObjectsUsingBlock:&v15];

    v14 = [*((id *)v7 + 6) signpostSubsystemCategoryPairsToEnable];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = sub_2308ABC4C;
    v18 = &unk_264B8E8A8;
    char v20 = 1;
    uint64_t v19 = 1;
    [v14 enumerateKeysAndObjectsUsingBlock:&v15];
  }
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 184));
  sub_2308A3A4C(v7);
  operator new();
}

- (void)_setupLoaderForLoggedEventStore:(id)a3 agent:(id)a4 setDatesBasedOnSource:(BOOL)a5 genericFailureReason:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  *((void *)v9 + 14) = 0;
  v12 = (void *)*((void *)v9 + 7);
  if (v12)
  {
    [v12 setUpgradeConfirmationHandler:&unk_26E5155E8];
    [*((id *)v9 + 7) setProgressHandler:&unk_26E515F30];
    v13 = (void *)*((void *)v9 + 7);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_2308A9824;
    v16[3] = &unk_264B8E860;
    id v17 = v9;
    BOOL v19 = a5;
    id v18 = v10;
    [v13 prepareWithCompletionHandler:v16];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] dvtiuErrorWithFormat:@"%@", v11];
    uint64_t v15 = (void *)*((void *)v9 + 11);
    *((void *)v9 + 11) = v14;

    [v9 _welcomeAgent:v10];
  }
}

- (DTOSLogLoaderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end