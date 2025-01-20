@interface MapsSuggestionsGeoServicesFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (MapsSuggestionsGeoServicesFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (double)updateSignals;
@end

@implementation MapsSuggestionsGeoServicesFeeler

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return a3 == 19;
}

- (MapsSuggestionsGeoServicesFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  id v7 = objc_loadWeakRetained(&location);
  v13.receiver = self;
  v13.super_class = (Class)MapsSuggestionsGeoServicesFeeler;
  v8 = [(MapsSuggestionsBaseFeeler *)&v13 initWithDelegate:v7 name:v6];

  if (v8)
  {
    GEOConfigGetDouble();
    v8->_pollingFrequency = v9;
    v10 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:1];
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
    signalPack = v2->_signalPack;
    *(float *)&double v4 = (float)GEOGetUserTransportTypePreference();
    [(MapsSuggestionsMutableSignalPack *)signalPack writeSignalValue:19 forType:v4];
    v5 = [(MapsSuggestionsBaseFeeler *)v2 delegate];
    id v6 = [(MapsSuggestionsMutableSignalPack *)v2->_signalPack copy];
    [v5 feeler:v2 sendsSignalPack:v6];
  }
  double pollingFrequency = v2->_pollingFrequency;
  objc_sync_exit(v2);

  return pollingFrequency;
}

- (void).cxx_destruct
{
}

@end