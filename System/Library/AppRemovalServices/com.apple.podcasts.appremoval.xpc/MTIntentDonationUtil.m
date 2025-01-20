@interface MTIntentDonationUtil
- (BOOL)canContinueIntentWithUserActivityType:(id)a3;
- (Class)interactionClass;
- (MTDefaultsChangeNotifier)defaultsObserver;
- (MTIntentDonationUtil)init;
- (MTPlaybackIdentifierComposing)identifierComposer;
- (NSMutableDictionary)cachedScores;
- (OS_dispatch_queue)donationQueue;
- (id)defaultPodcastArtworkData;
- (void)prepareImageDataForPodcastUuid:(id)a3 completion:(id)a4;
- (void)removeAllDonations;
- (void)removeDonationForEpisodeUuid:(id)a3;
- (void)removeDonationForPodcastUuid:(id)a3;
- (void)removeDonationsForEpisodeUuids:(id)a3;
- (void)removeDonationsForPodcastUuids:(id)a3;
- (void)setCachedScores:(id)a3;
- (void)setDefaultsObserver:(id)a3;
- (void)setDonationQueue:(id)a3;
- (void)setIdentifierComposer:(id)a3;
- (void)setInteractionClass:(Class)a3;
@end

@implementation MTIntentDonationUtil

- (MTIntentDonationUtil)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTIntentDonationUtil;
  v2 = [(MTIntentDonationUtil *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, -15);
    dispatch_queue_t v5 = dispatch_queue_create("MTIntentDonationUtil.donation_queue", v4);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_class();
    Class interactionClass = v2->_interactionClass;
    v2->_Class interactionClass = (Class)v7;

    uint64_t v9 = +[MTPlaybackIdentifierUtil sharedInstance];
    identifierComposer = v2->_identifierComposer;
    v2->_identifierComposer = (MTPlaybackIdentifierComposing *)v9;

    v11 = +[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults];
    uint64_t v12 = kMTShowSiriSuggestionsKey;
    uint64_t v20 = kMTShowSiriSuggestionsKey;
    v13 = +[NSArray arrayWithObjects:&v20 count:1];
    v14 = +[NSSet setWithArray:v13];

    v15 = [[MTDefaultsChangeNotifier alloc] initWithProperties:v14 defaults:v11];
    defaultsObserver = v2->_defaultsObserver;
    v2->_defaultsObserver = v15;

    [(MTDictionaryDiff *)v2->_defaultsObserver addCallback:&stru_100010798];
    [(MTDefaultsChangeNotifier *)v2->_defaultsObserver start];
    int v17 = [v11 BOOLForKey:v12];
    sub_100009944(kMTApplicationBundleIdentifier, v17);
  }
  return v2;
}

- (void)removeDonationForPodcastUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(objc_class *)[(MTIntentDonationUtil *)self interactionClass] deleteInteractionsWithGroupIdentifier:v4 completion:0];
  }
}

- (void)removeDonationsForPodcastUuids:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MTIntentDonationUtil *)self removeDonationForPodcastUuid:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeDonationForEpisodeUuid:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(MTIntentDonationUtil *)self interactionClass];
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(objc_class *)v5 deleteInteractionsWithIdentifiers:v6 completion:0];
  }
}

- (void)removeDonationsForEpisodeUuids:(id)a3
{
  id v4 = a3;
  [(objc_class *)[(MTIntentDonationUtil *)self interactionClass] deleteInteractionsWithIdentifiers:v4 completion:0];
}

- (void)removeAllDonations
{
  v2 = [(MTIntentDonationUtil *)self interactionClass];
  [(objc_class *)v2 deleteAllInteractionsWithCompletion:0];
}

- (BOOL)canContinueIntentWithUserActivityType:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unsigned __int8 v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)prepareImageDataForPodcastUuid:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PUIObjCArtworkProvider shared];
  double v9 = kMTIntentsArtworkSize;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009E08;
  v11[3] = &unk_1000107C0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  objc_msgSend(v8, "artworkPathForShow:size:completionHandler:", v7, v11, v9, v9);
}

- (id)defaultPodcastArtworkData
{
  if (qword_100016D90 != -1) {
    dispatch_once(&qword_100016D90, &stru_1000107E0);
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_100009FE8;
  double v9 = sub_100009FF8;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A000;
  block[3] = &unk_100010718;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100016D98, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (Class)interactionClass
{
  return self->_interactionClass;
}

- (void)setInteractionClass:(Class)a3
{
}

- (MTPlaybackIdentifierComposing)identifierComposer
{
  return self->_identifierComposer;
}

- (void)setIdentifierComposer:(id)a3
{
}

- (OS_dispatch_queue)donationQueue
{
  return self->_donationQueue;
}

- (void)setDonationQueue:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsObserver
{
  return self->_defaultsObserver;
}

- (void)setDefaultsObserver:(id)a3
{
}

- (NSMutableDictionary)cachedScores
{
  return self->_cachedScores;
}

- (void)setCachedScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScores, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_identifierComposer, 0);
  objc_storeStrong((id *)&self->_interactionClass, 0);
}

@end