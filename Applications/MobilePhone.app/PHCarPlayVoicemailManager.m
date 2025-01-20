@interface PHCarPlayVoicemailManager
+ (id)sharedVoicemailManager;
- ($1FF454C5B48E436092D281DABF654916)badge;
- (BOOL)isVisualVoicemailAvailable;
- (MPVoicemailController)voicemailController;
- (PHCarPlayVoicemailManager)init;
- (VMVoicemailManager)accountManager;
- (id)badgeObservation;
- (id)badgeString;
- (id)localizedSubtitleForMessage:(id)a3;
- (id)trashedVoicemails;
- (id)voicemails;
- (void)_phoneApplicationAddressBookChangedNotification:(id)a3;
- (void)dealloc;
- (void)onlineStateChangedNotification:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setBadge:(id)a3;
- (void)setBadgeObservation:(id)a3;
- (void)setVoicemailController:(id)a3;
- (void)subscribedStateChangedNotification:(id)a3;
- (void)voicemailWithID:(id)a3 completion:(id)a4;
- (void)voicemailsChangedNotification:(id)a3;
@end

@implementation PHCarPlayVoicemailManager

+ (id)sharedVoicemailManager
{
  if (sharedVoicemailManager_onceToken != -1) {
    dispatch_once(&sharedVoicemailManager_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)sharedVoicemailManager;

  return v2;
}

void __51__PHCarPlayVoicemailManager_sharedVoicemailManager__block_invoke(id a1)
{
  v1 = objc_alloc_init(PHCarPlayVoicemailManager);
  uint64_t v2 = sharedVoicemailManager;
  sharedVoicemailManager = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (BOOL)isVisualVoicemailAvailable
{
  uint64_t v2 = [(PHCarPlayVoicemailManager *)self accountManager];
  unsigned __int8 v3 = [v2 isSubscribed];

  return v3;
}

- (PHCarPlayVoicemailManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)PHCarPlayVoicemailManager;
  uint64_t v2 = [(PHCarPlayVoicemailManager *)&v19 init];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    v2->_badge = ($F9E988030E59B15A70831D416F884488)PhoneBadgeKnownZero;
    v4 = (VMVoicemailManager *)objc_alloc_init((Class)VMVoicemailManager);
    accountManager = v3->_accountManager;
    v3->_accountManager = v4;

    v6 = +[PHApplicationServices sharedInstance];
    uint64_t v7 = [v6 voicemailController];
    voicemailController = v3->_voicemailController;
    v3->_voicemailController = (MPVoicemailController *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v3 selector:"voicemailsChangedNotification:" name:@"MPVoicemailControllerMessagesDidChangeNotification" object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v3 selector:"_phoneApplicationAddressBookChangedNotification:" name:CNContactStoreDidChangeNotification object:0];

    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3042000000;
    v17[3] = __Block_byref_object_copy__8;
    v17[4] = __Block_byref_object_dispose__8;
    objc_initWeak(&v18, v3);
    v11 = +[PHApplicationServices sharedInstance];
    v12 = [v11 badgeCalculator];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __33__PHCarPlayVoicemailManager_init__block_invoke;
    v16[3] = &unk_10027E468;
    v16[4] = v17;
    uint64_t v13 = [v12 listenWithHandler:v16];
    id badgeObservation = v3->_badgeObservation;
    v3->_id badgeObservation = (id)v13;

    _Block_object_dispose(v17, 8);
    objc_destroyWeak(&v18);
  }
  return v3;
}

void __33__PHCarPlayVoicemailManager_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__PHCarPlayVoicemailManager_init__block_invoke_2;
  block[3] = &unk_10027E440;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __33__PHCarPlayVoicemailManager_init__block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[4] + 8) + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setBadge:a1[5], a1[6]];
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"PHCarPlayVoicemailManagerChangedNotification" object:0];

    id WeakRetained = v4;
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayVoicemailManager;
  [(PHCarPlayVoicemailManager *)&v4 dealloc];
}

- (void)voicemailsChangedNotification:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PHCarPlayVoicemailManagerChangedNotification" object:0 userInfo:0];
}

- (void)onlineStateChangedNotification:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PHCarPlayVoicemailManagerChangedNotification" object:0 userInfo:0];
}

- (void)subscribedStateChangedNotification:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PHCarPlayVoicemailManagerChangedNotification" object:0 userInfo:0];
}

- (void)_phoneApplicationAddressBookChangedNotification:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"PHCarPlayVoicemailManagerChangedNotification" object:0 userInfo:0];
}

- (id)voicemails
{
  uint64_t v2 = [(PHCarPlayVoicemailManager *)self voicemailController];
  id v3 = [v2 audioMessagesPassingTest:&__block_literal_global_71];

  return v3;
}

BOOL __39__PHCarPlayVoicemailManager_voicemails__block_invoke(id a1, MPMessage *a2)
{
  return [(MPMessage *)a2 folder] == (id)1;
}

- (id)trashedVoicemails
{
  uint64_t v2 = [(PHCarPlayVoicemailManager *)self voicemailController];
  id v3 = [v2 audioMessagesPassingTest:&__block_literal_global_73];

  return v3;
}

BOOL __46__PHCarPlayVoicemailManager_trashedVoicemails__block_invoke(id a1, MPMessage *a2)
{
  return [(MPMessage *)a2 folder] == (id)2;
}

- (void)voicemailWithID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PHCarPlayVoicemailManager *)self voicemailController];
  v9 = [v8 voicemailManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __56__PHCarPlayVoicemailManager_voicemailWithID_completion___block_invoke;
  v11[3] = &unk_10027E4D0;
  id v12 = v6;
  id v10 = v6;
  [v9 voicemailWithIdentifier:v7 completion:v11];
}

uint64_t __56__PHCarPlayVoicemailManager_voicemailWithID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)badgeString
{
  char v2 = [(PHCarPlayVoicemailManager *)self badge];

  return PhoneStringForBadgeValue(v2, v3);
}

- (id)localizedSubtitleForMessage:(id)a3
{
  id v4 = a3;
  v5 = [(PHCarPlayVoicemailManager *)self voicemailController];
  id v6 = [v5 localizedSubtitleForMessage:v4];

  return v6;
}

- (VMVoicemailManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (MPVoicemailController)voicemailController
{
  return self->_voicemailController;
}

- (void)setVoicemailController:(id)a3
{
}

- ($1FF454C5B48E436092D281DABF654916)badge
{
  unint64_t count = self->_badge.count;
  uint64_t v3 = *(void *)&self->_badge.known;
  result.var1 = count;
  result.var0 = v3;
  return result;
}

- (void)setBadge:(id)a3
{
  self->_badge = ($F9E988030E59B15A70831D416F884488)a3;
}

- (id)badgeObservation
{
  return self->_badgeObservation;
}

- (void)setBadgeObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_badgeObservation, 0);
  objc_storeStrong((id *)&self->_voicemailController, 0);

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end