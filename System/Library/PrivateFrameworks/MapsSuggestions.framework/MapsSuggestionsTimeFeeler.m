@interface MapsSuggestionsTimeFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (MapsSuggestionsTimeFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (double)updateSignals;
@end

@implementation MapsSuggestionsTimeFeeler

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (MapsSuggestionsTimeFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  id v7 = objc_loadWeakRetained(&location);
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsTimeFeeler;
  v8 = [(MapsSuggestionsBaseFeeler *)&v13 initWithDelegate:v7 name:v6];

  if (v8)
  {
    GEOConfigGetDouble();
    v8->_pollingFrequency = v9;
    v10 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:2];
    signalPack = v8->_signalPack;
    v8->_signalPack = v10;
  }
  objc_destroyWeak(&location);
  return v8;
}

- (double)updateSignals
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2)
  {
    v3 = MapsSuggestionsNow();
    signalPack = v2->_signalPack;
    MapsSuggestionsTimeSinceMidnightOfDate();
    double v6 = v5;
    [v3 timeIntervalSince1970];
    double v8 = 3600.0 - floor((v7 / 3600.0 - floor(v7 / 3600.0)) * 3600.0);
    if (v8 < 1.0) {
      double v8 = 3600.0;
    }
    double v9 = [v3 dateByAddingTimeInterval:v8];
    *(float *)&double v10 = v6;
    [(MapsSuggestionsMutableSignalPack *)signalPack writeSignalValue:10 forType:v3 gathered:v9 expires:v10];

    v11 = v2->_signalPack;
    id v12 = v3;
    id v13 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    v14 = MapsSuggestionsTimeZone();
    v15 = [v13 componentsInTimeZone:v14 fromDate:v12];

    id v16 = [v15 weekday];
    [v12 timeIntervalSince1970];
    double v18 = 86400.0 - floor((v17 / 24.0 * 3600.0 - floor(v17 / 24.0 * 3600.0)) * 24.0 * 3600.0);
    if (v18 < 1.0) {
      double v18 = 86400.0;
    }
    v19 = [v12 dateByAddingTimeInterval:v18];
    *(float *)&double v20 = (float)(uint64_t)v16;
    [(MapsSuggestionsMutableSignalPack *)v11 writeSignalValue:11 forType:v12 gathered:v19 expires:v20];

    v21 = [(MapsSuggestionsBaseFeeler *)v2 delegate];
    id v22 = [(MapsSuggestionsMutableSignalPack *)v2->_signalPack copy];
    [v21 feeler:v2 sendsSignalPack:v22];
  }
  double pollingFrequency = v2->_pollingFrequency;
  objc_sync_exit(v2);

  return pollingFrequency;
}

- (void).cxx_destruct
{
}

@end