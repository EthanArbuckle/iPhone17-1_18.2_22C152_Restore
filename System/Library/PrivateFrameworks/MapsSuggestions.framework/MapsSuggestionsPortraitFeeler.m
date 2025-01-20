@interface MapsSuggestionsPortraitFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (MapsSuggestionsPortraitFeeler)initWithDelegate:(id)a3 portrait:(id)a4;
- (MapsSuggestionsPortraitFeeler)initWithDelegate:(id)a3 portrait:(id)a4 name:(id)a5;
- (double)updateSignals;
- (id).cxx_construct;
@end

@implementation MapsSuggestionsPortraitFeeler

- (MapsSuggestionsPortraitFeeler)initWithDelegate:(id)a3 portrait:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsPortraitFeeler;
  v11 = [(MapsSuggestionsBaseFeeler *)&v23 initWithDelegate:v8 name:v10];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v21, @"MapsSuggestionsPortraitFeelerQueue", v12);
    dispatch_queue_t v13 = v21;
    dispatch_queue_t v21 = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = (OS_dispatch_queue *)v13;

    v15 = v22;
    v22 = 0;
    name = v11->_queue._name;
    v11->_queue._name = v15;

    objc_storeStrong((id *)&v11->_portrait, a4);
    GEOConfigGetDouble();
    v11->_pollingFrequency = v17;
    v18 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:2];
    signalPack = v11->_signalPack;
    v11->_signalPack = v18;
  }
  return v11;
}

- (MapsSuggestionsPortraitFeeler)initWithDelegate:(id)a3 portrait:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() description];
  id v9 = [(MapsSuggestionsPortraitFeeler *)self initWithDelegate:v6 portrait:v7 name:v8];

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 36;
}

- (double)updateSignals
{
  if (self)
  {
    v3 = self->_queue._innerQueue;
    v4 = self->_queue._name;
    portrait = self->_portrait;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3321888768;
    v21[2] = sub_100038644;
    v21[3] = &unk_1000721A0;
    id v6 = v3;
    v22 = v6;
    id v7 = v4;
    objc_super v23 = v7;
    v21[4] = self;
    unsigned int v8 = [(MapsSuggestionsPortrait *)portrait currentTripsWithHandler:v21];
    id v9 = self->_portrait;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3321888768;
    v18[2] = sub_100038B14;
    v18[3] = &unk_1000721A0;
    id v10 = v6;
    v19 = v10;
    v11 = v7;
    v20 = v11;
    v18[4] = self;
    unsigned int v12 = [(MapsSuggestionsPortrait *)v9 futureTripsWithHandler:v18];
    unsigned int v13 = v12;
    if (v8)
    {
      if (v12)
      {
LABEL_11:

        return self->_pollingFrequency;
      }
    }
    else
    {
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "For some reason, MapsSuggestionsPortrait does not want to call back with current trips.", v17, 2u);
      }

      if (v13) {
        goto LABEL_11;
      }
    }
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "For some reason, MapsSuggestionsPortrait does not want to call back with future trips.", v17, 2u);
    }

    goto LABEL_11;
  }
  return self->_pollingFrequency;
}

- (void).cxx_destruct
{
  v2 = self;
  objc_storeStrong((id *)&self->_signalPack, 0);
  objc_storeStrong((id *)&v2->_portrait, 0);
  v2 = (MapsSuggestionsPortraitFeeler *)((char *)v2 + 24);

  Class isa = v2->super.super.super.isa;
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end