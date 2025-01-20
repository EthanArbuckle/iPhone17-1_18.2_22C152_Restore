@interface MapsSuggestionsWalletSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (MapsSuggestionsWalletSource)initWithWallet:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6;
- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id).cxx_construct;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsWalletSource

+ (BOOL)isEnabled
{
  int BOOL = GEOConfigGetBOOL();
  if (BOOL)
  {
    LOBYTE(BOOL) = +[MapsSuggestionsWallet isAvailable];
  }
  return BOOL;
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsWalletSource)initWithWallet:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    v24.receiver = self;
    v24.super_class = (Class)MapsSuggestionsWalletSource;
    v15 = [(MapsSuggestionsWalletSource *)&v24 initWithDelegate:v12 name:v14];
    if (v15)
    {
      v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      sub_100014064((dispatch_queue_t *)buf, @"MapsSuggestionsWalletSourceQueue", v16);
      v17 = *(OS_dispatch_queue **)buf;
      *(void *)buf = 0;
      innerQueue = v15->_queue._innerQueue;
      v15->_queue._innerQueue = v17;

      v19 = *(NSString **)&buf[8];
      *(void *)&buf[8] = 0;
      name = v15->_queue._name;
      v15->_queue._name = v19;

      objc_storeStrong((id *)&v15->_wallet, a3);
      objc_storeStrong((id *)&v15->_guardian, a5);
    }
    self = v15;
    v21 = self;
  }
  else
  {
    v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWalletSource.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 53;
      __int16 v26 = 2082;
      v27 = "-[MapsSuggestionsWalletSource initWithWallet:delegate:guardian:name:]";
      __int16 v28 = 2082;
      v29 = "nil == (wallet)";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a wallet", buf, 0x26u);
    }

    v21 = 0;
  }

  return v21;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWalletSource.mm";
      __int16 v18 = 1024;
      int v19 = 68;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsWalletSource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", (uint8_t *)&v16, 0x26u);
    }
    goto LABEL_13;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWalletSource.mm";
      __int16 v18 = 1024;
      int v19 = 69;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsWalletSource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", (uint8_t *)&v16, 0x26u);
    }
    goto LABEL_13;
  }
  v9 = [v6 oneNetworkRequester];

  if (!v9)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsWalletSource.mm";
      __int16 v18 = 1024;
      int v19 = 70;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsWalletSource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot.oneNetworkRequester)";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Network!", (uint8_t *)&v16, 0x26u);
    }
LABEL_13:

    id v13 = 0;
    goto LABEL_14;
  }
  id v10 = [objc_alloc((Class)MapsSuggestionsWallet) initFromResourceDepot:v6];
  id v11 = [v6 oneSourceDelegate];
  id v12 = [v6 oneAppGuardian];
  self = [(MapsSuggestionsWalletSource *)self initWithWallet:v10 delegate:v11 guardian:v12 name:v7];

  id v13 = self;
LABEL_14:

  return v13;
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "start", v4, 2u);
  }

  [(MapsSuggestionsAppGuardian *)self->_guardian registerBundleID:MapsSuggestionsWalletAppBundleID withSource:self];
}

- (void)stop
{
  [(MapsSuggestionsAppGuardian *)self->_guardian unregisterBundleID:MapsSuggestionsWalletAppBundleID withSource:self];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "stop", v3, 2u);
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4 = a3;
  GEOFindOrCreateLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(MapsSuggestionsWalletSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v32 = v6;
    __int16 v33 = 2080;
    v34 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  objc_initWeak(&location, self);
  if ([(MapsSuggestionsAppGuardian *)self->_guardian isBundleIDLocked:MapsSuggestionsWalletAppBundleID forSource:self])
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003FEEC;
    v28[3] = &unk_1000723E8;
    id v29 = v4;
    sub_10003FD40((NSObject **)&self->_queue, self, v28);

LABEL_23:
    double v15 = 0.0;
    goto LABEL_24;
  }
  if ((+[MapsSuggestionsSiri isEnabled] & 1) == 0)
  {
    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", buf, 2u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004009C;
    v26[3] = &unk_1000723E8;
    id v27 = v4;
    sub_10003FD40((NSObject **)&self->_queue, self, v26);

    goto LABEL_23;
  }
  if ((+[MapsSuggestionsSiri canLearnFromBundleID:MapsSuggestionsWalletAppBundleID] & 1) == 0)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004024C;
    v24[3] = &unk_1000723E8;
    id v25 = v4;
    sub_10003FD40((NSObject **)&self->_queue, self, v24);

    goto LABEL_23;
  }
  wallet = self->_wallet;
  __int16 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  __int16 v20 = sub_1000403FC;
  v21 = &unk_100072438;
  objc_copyWeak(&v23, &location);
  v9 = (void (**)(void))v4;
  id v22 = v9;
  if (![(MapsSuggestionsWallet *)wallet entriesFromPassesBefore:0 handler:&v18])
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MapsSuggestionsWallet will not call back!", buf, 2u);
    }

    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [(MapsSuggestionsWalletSource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      __int16 v33 = 2080;
      v34 = "updateSuggestionEntriesWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    id v13 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
    }

    if (v9) {
      v9[2](v9);
    }
  }
  GEOConfigGetDouble();
  double v15 = v14;

  objc_destroyWeak(&v23);
LABEL_24:
  objc_destroyWeak(&location);

  return v15;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return [(MapsSuggestionsWallet *)self->_wallet canProduceEntriesOfType:a3];
}

- (char)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  v2 = self;
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&v2->_wallet, 0);
  v2 = (MapsSuggestionsWalletSource *)((char *)v2 + 8);

  v3 = *(void **)v2->MapsSuggestionsBaseSource_opaque;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end