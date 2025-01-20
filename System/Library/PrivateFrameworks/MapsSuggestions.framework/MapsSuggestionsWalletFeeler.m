@interface MapsSuggestionsWalletFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (MapsSuggestionsWalletFeeler)initWithDelegate:(id)a3 wallet:(id)a4;
- (MapsSuggestionsWalletFeeler)initWithDelegate:(id)a3 wallet:(id)a4 name:(id)a5;
- (double)updateSignals;
- (id).cxx_construct;
@end

@implementation MapsSuggestionsWalletFeeler

- (MapsSuggestionsWalletFeeler)initWithDelegate:(id)a3 wallet:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsWalletFeeler;
  v11 = [(MapsSuggestionsBaseFeeler *)&v23 initWithDelegate:v8 name:v10];
  if (v11)
  {
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v21, @"MapsSuggestionsWalletFeelerQueue", v12);
    dispatch_queue_t v13 = v21;
    dispatch_queue_t v21 = 0;
    innerQueue = v11->_queue._innerQueue;
    v11->_queue._innerQueue = (OS_dispatch_queue *)v13;

    v15 = v22;
    v22 = 0;
    name = v11->_queue._name;
    v11->_queue._name = v15;

    objc_storeStrong((id *)&v11->_wallet, a4);
    GEOConfigGetDouble();
    v11->_pollingFrequency = v17;
    v18 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:3];
    signalPack = v11->_signalPack;
    v11->_signalPack = v18;
  }
  return v11;
}

- (MapsSuggestionsWalletFeeler)initWithDelegate:(id)a3 wallet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() description];
  id v9 = [(MapsSuggestionsWalletFeeler *)self initWithDelegate:v6 wallet:v7 name:v8];

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return a3 == 28 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 34;
}

- (double)updateSignals
{
  if (self)
  {
    v3 = self->_queue._innerQueue;
    v4 = self->_queue._name;
    wallet = self->_wallet;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3321888768;
    v28[2] = sub_10001C3F8;
    v28[3] = &unk_1000718D8;
    id v6 = v3;
    v29 = v6;
    id v7 = v4;
    v30 = v7;
    v28[4] = self;
    unsigned int v8 = [(MapsSuggestionsWallet *)wallet hasTransitPassWithHandler:v28];
    id v9 = self->_wallet;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3321888768;
    v25[2] = sub_10001C908;
    v25[3] = &unk_1000718D8;
    id v10 = v6;
    v26 = v10;
    v11 = v7;
    v27 = v11;
    v25[4] = self;
    unsigned int v12 = [(MapsSuggestionsWallet *)v9 hasExpressPaymentCardWithHandler:v25];
    dispatch_queue_t v13 = self->_wallet;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3321888768;
    v22[2] = sub_10001CB50;
    v22[3] = &unk_1000718D8;
    v14 = v10;
    objc_super v23 = v14;
    v15 = v11;
    v24 = v15;
    v22[4] = self;
    unsigned int v16 = [(MapsSuggestionsWallet *)v13 hasPaymentCardWithHandler:v22];
    if (v8)
    {
      if (v12) {
        goto LABEL_4;
      }
    }
    else
    {
      double v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_queue_t v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "We cannot load Transit Pass from Wallet", v21, 2u);
      }

      if (v12)
      {
LABEL_4:
        if (v16)
        {
LABEL_15:

          return self->_pollingFrequency;
        }
LABEL_12:
        v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)dispatch_queue_t v21 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "We cannot load payment cards from Wallet", v21, 2u);
        }

        goto LABEL_15;
      }
    }
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)dispatch_queue_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "We cannot load express payment cards from Wallet", v21, 2u);
    }

    if (v16) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  return self->_pollingFrequency;
}

- (void).cxx_destruct
{
  v2 = self;
  objc_storeStrong((id *)&self->_signalPack, 0);
  objc_storeStrong((id *)&v2->_wallet, 0);
  v2 = (MapsSuggestionsWalletFeeler *)((char *)v2 + 24);

  Class isa = v2->super.super.super.isa;
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end