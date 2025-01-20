@interface MapsSuggestionsMapsAppFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (BOOL)startUpdatingSignals;
- (BOOL)stopUpdatingSignals;
- (BOOL)updateSignals;
- (void)sendSignalPack:(id)a3;
@end

@implementation MapsSuggestionsMapsAppFeeler

- (void)sendSignalPack:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (MapsSuggestionsSignalPack *)[v4 copy];
  signalPack = v5->_signalPack;
  v5->_signalPack = v6;

  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (char *)(id)objc_opt_class();
    v10 = [(MapsSuggestionsSignalPack *)v5->_signalPack description];
    int v13 = 138412546;
    v14 = v9;
    __int16 v15 = 2112;
    v16[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ is streaming signal pack: %@ ", (uint8_t *)&v13, 0x16u);
  }
  v11 = [(MapsSuggestionsBaseFeeler *)v5 delegate];
  if (v11)
  {
    if (objc_opt_respondsToSelector()) {
      [v11 feeler:v5 sendsSignalPack:v5->_signalPack];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      v14 = "MapsSuggestionsMapsAppFeeler.m";
      __int16 v15 = 1026;
      LODWORD(v16[0]) = 30;
      WORD2(v16[0]) = 2082;
      *(void *)((char *)v16 + 6) = "-[MapsSuggestionsMapsAppFeeler sendSignalPack:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v13, 0x1Cu);
    }
  }
  objc_sync_exit(v5);
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  objc_sync_exit(v4);

  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 21;
}

- (BOOL)startUpdatingSignals
{
  v2 = self;
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  return 1;
}

- (BOOL)stopUpdatingSignals
{
  v2 = self;
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  return 1;
}

- (BOOL)updateSignals
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MapsSuggestionsSignalPack *)v2->_signalPack copy];
  [(MapsSuggestionsMapsAppFeeler *)v2 sendSignalPack:v3];

  objc_sync_exit(v2);
  return 1;
}

- (void).cxx_destruct
{
}

@end