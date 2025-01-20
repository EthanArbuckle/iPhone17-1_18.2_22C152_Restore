@interface DestinationDaemon
- (void)_main;
- (void)start;
@end

@implementation DestinationDaemon

- (void)_main
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    v16 = "Nov 16 2024";
    __int16 v17 = 2080;
    v18 = "17:29:44";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "destinationd launched (built on %s %s).", (uint8_t *)&v15, 0x16u);
  }

  _set_user_dir_suffix();
  id v4 = NSTemporaryDirectory();
  v5 = objc_alloc_init(MapsSuggestionsDaemonMemory);
  memory = self->_memory;
  self->_memory = v5;

  v7 = [[MapsSuggestionsSourcesServer alloc] initWithMemory:self->_memory];
  sourcesServer = self->_sourcesServer;
  self->_sourcesServer = v7;

  v9 = [[MapsSuggestionsDonationsServer alloc] initWithMemory:self->_memory];
  donationsServer = self->_donationsServer;
  self->_donationsServer = v9;

  v11 = [[MapsSuggestionsSignalPipelineServer alloc] initWithMemory:self->_memory];
  signalPipelineServer = self->_signalPipelineServer;
  self->_signalPipelineServer = v11;

  v13 = [[MapsSuggestionsPredictionsServer alloc] initWithMemory:self->_memory];
  predictionsServer = self->_predictionsServer;
  self->_predictionsServer = v13;
}

- (void)start
{
  [(DestinationDaemon *)self _migrate];
  [(DestinationDaemon *)self _main];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsServer, 0);
  objc_storeStrong((id *)&self->_signalPipelineServer, 0);
  objc_storeStrong((id *)&self->_donationsServer, 0);
  objc_storeStrong((id *)&self->_sourcesServer, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

@end