@interface DTOSLogLoaderFetchTicket
- (OSLogEventStreamPosition)currentPosition;
- (double)windowInSeconds;
- (void)holdAgent:(id)a3 loader:(id)a4;
- (void)prepareAgent:(id)a3 loader:(id)a4;
- (void)setCurrentPosition:(id)a3;
- (void)setWindowInSeconds:(double)a3;
@end

@implementation DTOSLogLoaderFetchTicket

- (void)holdAgent:(id)a3 loader:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = v7;
  unint64_t v9 = 0x268704000uLL;
  if (v7[7] || v7[4])
  {
    unint64_t v10 = 0x263EFF000uLL;
    while (1)
    {
      if (v8[4] && !*((unsigned char *)v8 + 40))
      {
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 23));
        v18 = (id *)((char *)v8 + *(int *)(v9 + 4060));
        if (*v18)
        {
          int v34 = 1972;
          goto LABEL_30;
        }
        objc_storeStrong(v18, a3);
        *((unsigned char *)v8 + 509) = 0;
        v17 = [v6 ticket];
        *((unsigned char *)v8 + 507) = 0;
        [v8 _setupCommonStreamParameters:v8[4]];
        [v8 _performResetOnOutputStream];
        *((unsigned char *)v8 + 506) = 0;
        if (v8[13] && ([v17 windowInSeconds], v19 > 0.0))
        {
          v20 = (void *)v8[13];
          [v17 windowInSeconds];
          id v22 = [v20 dateByAddingTimeInterval:-v21];
          if ([v22 compare:v8[12]] == -1)
          {
            id v23 = (id)v8[12];

            id v22 = v23;
          }
        }
        else
        {
          id v22 = (id)v8[12];
        }
        v27 = (void *)v8[4];
        id v28 = v27;
        [v28 activateStreamFromDate:v22];
        objc_storeStrong((id *)v8 + 8, v27);
        *((unsigned char *)v8 + 40) = 1;
        pthread_cond_signal((pthread_cond_t *)(v8 + 17));
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 23));

        unint64_t v9 = 0x268704000;
        unint64_t v10 = 0x263EFF000;
        goto LABEL_24;
      }
      v11 = (void *)v8[8];
      v12 = *(void **)(v10 + 2512);
      if (!v11) {
        break;
      }
      v13 = [v12 null];
      if (v11 != v13)
      {

LABEL_16:
        v17 = [v6 ticket];
        if (v17 == (void *)v8[16])
        {
          pthread_mutex_lock((pthread_mutex_t *)(v8 + 23));
          v29 = (id *)((char *)v8 + *(int *)(v9 + 4060));
          if (*v29) {
            __assert_rtn("-[DTOSLogLoaderFetchTicket holdAgent:loader:]", "DTOSLogLoader.mm", 2067, "loader->_agentWaitingForEvents == nil");
          }
          objc_storeStrong(v29, a3);
          if (*((unsigned char *)v8 + 509))
          {
            [v8 _welcomeAgent:*(void *)((char *)v8 + *(int *)(v9 + 4060))];
            uint64_t v30 = *(int *)(v9 + 4060);
            v31 = *(void **)((char *)v8 + v30);
            *(void *)((char *)v8 + v30) = 0;
          }
          pthread_cond_signal((pthread_cond_t *)(v8 + 17));
          pthread_mutex_unlock((pthread_mutex_t *)(v8 + 23));
        }
        else
        {
          [(id)v8[8] invalidate];
          v25 = (void *)v8[8];
          v8[8] = 0;

          v26 = (void *)v8[4];
          v8[4] = 0;

          objc_storeStrong((id *)v8 + 15, a3);
        }
LABEL_24:

        goto LABEL_25;
      }
      int v24 = *((unsigned __int8 *)v8 + 40);

      if (v24) {
        goto LABEL_16;
      }
LABEL_25:
      uint64_t v32 = [v6 ticket];
      v33 = (void *)v8[16];
      v8[16] = v32;

      if (v8[8]) {
        goto LABEL_26;
      }
    }
    uint64_t v14 = [v12 null];
    v15 = (void *)v8[8];
    v8[8] = v14;

    v16 = (void *)v8[7];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_2308AA2FC;
    v35[3] = &unk_264B8E888;
    v36 = v8;
    id v37 = v6;
    [v16 prepareWithCompletionHandler:v35];

    v17 = v36;
    goto LABEL_24;
  }
  if (v7[44])
  {
    int v34 = 2109;
LABEL_30:
    __assert_rtn("-[DTOSLogLoaderFetchTicket holdAgent:loader:]", "DTOSLogLoader.mm", v34, "loader->_agentWaitingForEvents == nil");
  }
  [v7 _welcomeAgent:v6];
LABEL_26:
}

- (void)prepareAgent:(id)a3 loader:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (char *)a4;
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 184));
  [*((id *)v6 + 45) setLength:*((void *)v6 + 35) - *((void *)v6 + 34)];
  [v5 setNextOutputBytes:*((void *)v6 + 45)];
  [v5 setLastMachContinuousTime:*((void *)v6 + 43)];
  [v5 setLostEventsSinceLastVisit:*((unsigned int *)v6 + 125)];
  [v5 setFailureReason:*((void *)v6 + 11)];
  sub_2308A3A4C(v6);
  unsigned int v7 = *(_DWORD *)(*(void *)(*((void *)v6 + 32) + 16) + 64);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    v8 = [v5 nextOutputBytes];
    uint64_t v9 = [v8 length];
    int v10 = *((_DWORD *)v6 + 124);
    int v11 = 134218496;
    uint64_t v12 = v9;
    __int16 v13 = 1024;
    int v14 = v10;
    __int16 v15 = 1024;
    unsigned int v16 = HIWORD(v7);
    _os_log_debug_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Data Size: %lu, Rows Sent: %d, Stack depth: %d", (uint8_t *)&v11, 0x18u);
  }
  *((_DWORD *)v6 + 124) = 0;
  v6[508] = 0;
  *((_DWORD *)v6 + 125) = 0;
  pthread_cond_signal((pthread_cond_t *)(v6 + 136));
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 184));
  if (*((void *)v6 + 10))
  {
    [v5 setFetchComplete:1];
  }
  else
  {
    [v5 setFetchComplete:v6[509]];
    if ([v5 isFetchComplete]
      && [*((id *)v6 + 6) trackPidToExecNameMapping]
      && *((void *)v6 + 64))
    {
      [v5 addPidToExecEntriesFromMapping];
    }
  }
  if (*((void *)v6 + 11)) {
    [v5 setFetchComplete:1];
  }
}

- (double)windowInSeconds
{
  return self->_windowInSeconds;
}

- (void)setWindowInSeconds:(double)a3
{
  self->_windowInSeconds = a3;
}

- (OSLogEventStreamPosition)currentPosition
{
  return self->_currentPosition;
}

- (void)setCurrentPosition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end