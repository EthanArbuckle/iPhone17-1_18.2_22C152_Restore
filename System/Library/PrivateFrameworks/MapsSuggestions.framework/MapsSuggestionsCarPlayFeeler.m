@interface MapsSuggestionsCarPlayFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (BOOL)startUpdatingSignals;
- (BOOL)stopUpdatingSignals;
- (BOOL)updateSignals;
- (MapsSuggestionsCarPlayFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
@end

@implementation MapsSuggestionsCarPlayFeeler

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return a3 == 20;
}

- (MapsSuggestionsCarPlayFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  id v7 = objc_loadWeakRetained(&location);
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsCarPlayFeeler;
  v8 = [(MapsSuggestionsBaseFeeler *)&v16 initWithDelegate:v7 name:v6];

  if (v8)
  {
    v9 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:1];
    signalPack = v8->_signalPack;
    v8->_signalPack = v9;

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v11 = (void *)qword_100081E48;
    uint64_t v22 = qword_100081E48;
    if (!qword_100081E48)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001E888;
      v18[3] = &unk_100071988;
      v18[4] = &v19;
      sub_10001E888((uint64_t)v18);
      v11 = (void *)v20[3];
    }
    v12 = v11;
    _Block_object_dispose(&v19, 8);
    v13 = (CARSessionStatus *)objc_alloc_init(v12);
    carSessionStatus = v8->_carSessionStatus;
    v8->_carSessionStatus = v13;

    [(CARSessionStatus *)v8->_carSessionStatus addSessionObserver:v8];
  }

  objc_destroyWeak(&location);
  return v8;
}

- (BOOL)startUpdatingSignals
{
  return 0;
}

- (BOOL)stopUpdatingSignals
{
  return 1;
}

- (BOOL)updateSignals
{
  if (self)
  {
    v3 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
    unsigned int v4 = v3 != 0;
  }
  else
  {
    unsigned int v4 = 0;
  }
  sub_10001E53C(self, v4);
  return 1;
}

- (void)sessionDidConnect:(id)a3
{
  unsigned int v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[MapsSuggestionsCarPlayFeeler sessionDidConnect:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  sub_10001E53C(self, 1u);
}

- (void)sessionDidDisconnect:(id)a3
{
  unsigned int v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[MapsSuggestionsCarPlayFeeler sessionDidDisconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  sub_10001E53C(self, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
}

@end