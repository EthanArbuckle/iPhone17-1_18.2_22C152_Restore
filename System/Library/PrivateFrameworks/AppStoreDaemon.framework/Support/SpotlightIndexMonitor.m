@interface SpotlightIndexMonitor
- (SpotlightIndexMonitor)init;
- (void)dealloc;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation SpotlightIndexMonitor

- (SpotlightIndexMonitor)init
{
  v3 = sub_10030B11C();
  id v4 = v3;
  v5 = &stru_100526E88;
  v6 = &stru_100526EA8;
  if (self)
  {
    v22.receiver = self;
    v22.super_class = (Class)SpotlightIndexMonitor;
    v7 = [(SpotlightIndexMonitor *)&v22 init];
    self = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_bag, v3);
      id v8 = [&stru_100526E88 copy];
      id arcadeInSpotlightEnabled = self->_arcadeInSpotlightEnabled;
      self->_id arcadeInSpotlightEnabled = v8;

      id v10 = [&stru_100526EA8 copy];
      id languageTag = self->_languageTag;
      self->_id languageTag = v10;

      v12 = (CSSearchableIndex *)[objc_alloc((Class)CSSearchableIndex) initWithName:@"com.apple.appstored.Navigation" bundleIdentifier:@"com.apple.AppStore"];
      navigationIndex = self->_navigationIndex;
      self->_navigationIndex = v12;

      [(CSSearchableIndex *)self->_navigationIndex setIndexDelegate:self];
      objc_initWeak(&location, self);
      v14 = +[NSNotificationCenter defaultCenter];
      uint64_t v15 = AMSBagChangedNotification;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002E944C;
      v19[3] = &unk_100522A18;
      objc_copyWeak(&v20, &location);
      v16 = [v14 addObserverForName:v15 object:0 queue:0 usingBlock:v19];
      id bagChangedObserver = self->_bagChangedObserver;
      self->_id bagChangedObserver = v16;

      sub_1002E95F4((uint64_t)self, 0);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

  return self;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_bagChangedObserver];

  [(CSSearchableIndex *)self->_navigationIndex setIndexDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SpotlightIndexMonitor;
  [(SpotlightIndexMonitor *)&v4 dealloc];
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  (*((void (**)(id, SEL, id))a4 + 2))(a4, a2, a3);
  sub_1002E95F4((uint64_t)self, &__kCFBooleanFalse);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  (*((void (**)(id, SEL, id, id))a5 + 2))(a5, a2, a3, a4);
  sub_1002E95F4((uint64_t)self, &__kCFBooleanFalse);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationIndex, 0);
  objc_storeStrong(&self->_bagChangedObserver, 0);
  objc_storeStrong(&self->_languageTag, 0);
  objc_storeStrong(&self->_arcadeInSpotlightEnabled, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end