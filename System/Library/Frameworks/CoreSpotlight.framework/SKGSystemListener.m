@interface SKGSystemListener
+ (id)sharedClientListener;
+ (id)sharedProcessorListener;
- (BOOL)currentLocaleIsCJK;
- (BOOL)enableEmbeddingsHigherQoS;
- (BOOL)enableLanguageCheckForEmbedding;
- (BOOL)enableV2LanguageID;
- (BOOL)force;
- (BOOL)hasDiskCapacity;
- (BOOL)hasUpdatedLocale;
- (BOOL)hasUpdatedResources;
- (BOOL)isCJK;
- (BOOL)semanticSearchEnabled;
- (NSArray)currentPreferredLanguages;
- (NSArray)currentPreferredLocaleIdentifiers;
- (NSArray)currentPreferredLocales;
- (NSArray)doNotUpdateList;
- (NSArray)supportedSemanticLanguages;
- (NSLocale)currentLocale;
- (NSString)currentLanguage;
- (NSTimeZone)currentTimezone;
- (NSURL)geoIndexResourcesURL;
- (SKGSystemListener)init;
- (SKGSystemListener)initWithPreferredLanguages:(id)a3 locale:(id)a4;
- (id)currentRegion;
- (id)pathsForContentType:(id)a3 locale:(id)a4;
- (id)rootLocale;
- (unint64_t)currentFirstWeekDay;
- (void)dealloc;
- (void)setAutoUpdatingLocale:(BOOL)a3;
- (void)setAutoUpdatingTimezone:(BOOL)a3;
- (void)setForce:(BOOL)a3;
- (void)updateLocale;
- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5;
- (void)updateResources;
- (void)updateTimezone;
@end

@implementation SKGSystemListener

- (BOOL)hasDiskCapacity
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000047FC;
  v5[3] = &unk_1000DA150;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  char v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if (self->_autoUpdatingLocale)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, kCFLocaleCurrentLocaleDidChangeNotification, 0);
  }
  dispatch_sync((dispatch_queue_t)self->_queue, &stru_1000DA210);
  v5.receiver = self;
  v5.super_class = (Class)SKGSystemListener;
  [(SKGSystemListener *)&v5 dealloc];
}

- (NSArray)currentPreferredLanguages
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100012654;
  v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012744;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)doNotUpdateList
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_100012654;
  v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012804;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locked_currentResources, 0);
  objc_storeStrong((id *)&self->_locked_geoIndexPath, 0);
  objc_storeStrong((id *)&self->_locked_doNotUpdateList, 0);
  objc_storeStrong((id *)&self->_locked_supportedSemanticLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLanguages, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_locked_currentPreferredLocales, 0);
  objc_storeStrong((id *)&self->_locked_currentTimezone, 0);
  objc_storeStrong((id *)&self->_locked_currentRegion, 0);
  objc_storeStrong((id *)&self->_locked_currentLanguage, 0);

  objc_storeStrong((id *)&self->_locked_currentLocale, 0);
}

- (SKGSystemListener)init
{
  CFArrayRef v3 = sub_100005A04();
  CFLocaleRef v4 = sub_100003BAC();
  v17.receiver = self;
  v17.super_class = (Class)SKGSystemListener;
  objc_super v5 = [(SKGSystemListener *)&v17 init];
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C740;
    block[3] = &unk_1000DA128;
    CFLocaleRef v6 = v4;
    CFLocaleRef v16 = v6;
    if (qword_1000F8EC8 != -1) {
      dispatch_once(&qword_1000F8EC8, block);
    }
    v5->_force = 1;
    v5->_locked_hasDiskCapacity = 0;
    v5->_locked_lastDiskFlushDate = 0.0;
    v5->_autoUpdatingLocale = 0;
    v5->_locked_hasUpdatedLocale = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SpotlightKnowledge.SystemListener.locale", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    char v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    locked_currentResources = v5->_locked_currentResources;
    v5->_locked_currentResources = v9;

    *(_WORD *)&v5->_locked_semanticSearchEnabled = 0;
    v5->_locked_enableV2LanguageID = 0;
    locked_supportedSemanticLanguages = v5->_locked_supportedSemanticLanguages;
    v5->_locked_supportedSemanticLanguages = (NSArray *)&__NSArray0__struct;

    locked_doNotUpdateList = v5->_locked_doNotUpdateList;
    v5->_locked_doNotUpdateList = (NSArray *)&__NSArray0__struct;

    locked_geoIndexPath = v5->_locked_geoIndexPath;
    v5->_locked_geoIndexPath = 0;

    [(SKGSystemListener *)v5 setAutoUpdatingTimezone:1];
    [(SKGSystemListener *)v5 updateTimezone];
    [(SKGSystemListener *)v5 updateLocaleWithLocale:v6 preferredLanguages:v3 force:1];
    [(SKGSystemListener *)v5 hasDiskCapacity];
  }
  return v5;
}

- (BOOL)force
{
  return self->_force;
}

- (void)updateLocaleWithLocale:(id)a3 preferredLanguages:(id)a4 force:(BOOL)a5
{
  id v8 = a3;
  CFArrayRef v9 = (const __CFArray *)a4;
  if (v8)
  {
    if ([(SKGSystemListener *)self force]) {
      goto LABEL_6;
    }
    if (a5) {
      goto LABEL_6;
    }
    uint64_t v10 = [(SKGSystemListener *)self currentLocale];
    if (!v10) {
      goto LABEL_6;
    }
    id v11 = (void *)v10;
    v12 = [v8 localeIdentifier];
    v13 = [v11 localeIdentifier];
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
LABEL_6:
      v38 = self;
      CFArrayRef v15 = sub_100005A40(v9);
      id v16 = objc_alloc((Class)NSLocale);
      id v39 = v8;
      objc_super v17 = [v8 localeIdentifier];
      id v18 = [v16 initWithLocaleIdentifier:v17];

      id v19 = objc_alloc_init((Class)NSMutableSet);
      id v20 = objc_alloc_init((Class)NSMutableSet);
      id v21 = objc_alloc_init((Class)NSMutableSet);
      v37 = v18;
      SILanguagesGetLanguageID();
      v36 = SILanguagesGetLanguage();
      char v35 = sub_10000366C(v36);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      CFArrayRef v22 = v15;
      id v23 = [(__CFArray *)v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v28 = +[NSLocale localeWithLocaleIdentifier:v27];
            if (SILanguagesGetLanguageID() - 2 <= 0x38)
            {
              [v21 addObject:SILanguagesGetLanguage()];
              [v19 addObject:v28];
              [v20 addObject:v27];
            }
          }
          id v24 = [(__CFArray *)v22 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v24);
      }

      queue = v38->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008844;
      block[3] = &unk_1000DA1F0;
      char v46 = v35;
      void block[4] = v38;
      id v41 = v37;
      id v42 = v36;
      id v43 = v19;
      id v44 = v20;
      id v45 = v21;
      id v30 = v21;
      id v31 = v20;
      id v32 = v19;
      id v33 = v36;
      id v34 = v37;
      dispatch_sync(queue, block);
      [(SKGSystemListener *)v38 updateResources];

      id v8 = v39;
    }
  }
}

- (void)updateTimezone
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012850;
  block[3] = &unk_1000DA128;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)updateResources
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005388;
  block[3] = &unk_1000DA128;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setAutoUpdatingTimezone:(BOOL)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"updateTimezone" name:NSSystemTimeZoneDidChangeNotification object:0];
}

+ (id)sharedClientListener
{
  if (qword_1000F8EB0 != -1) {
    dispatch_once(&qword_1000F8EB0, &stru_1000DA0E0);
  }
  v2 = (void *)qword_1000F8EA8;

  return v2;
}

+ (id)sharedProcessorListener
{
  if (qword_1000F8EC0 != -1) {
    dispatch_once(&qword_1000F8EC0, &stru_1000DA100);
  }
  v2 = (void *)qword_1000F8EB8;

  return v2;
}

- (SKGSystemListener)initWithPreferredLanguages:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SKGSystemListener;
  id v8 = [(SKGSystemListener *)&v20 init];
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003C94C;
    block[3] = &unk_1000DA128;
    id v9 = v7;
    id v19 = v9;
    if (qword_1000F8ED0 != -1) {
      dispatch_once(&qword_1000F8ED0, block);
    }
    v8->_force = 0;
    v8->_locked_hasDiskCapacity = 0;
    v8->_locked_lastDiskFlushDate = 0.0;
    v8->_autoUpdatingLocale = 0;
    v8->_locked_hasUpdatedLocale = 0;
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.SpotlightKnowledge.SystemListener.locale", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    locked_currentResources = v8->_locked_currentResources;
    v8->_locked_currentResources = v12;

    *(_WORD *)&v8->_locked_semanticSearchEnabled = 0;
    v8->_locked_enableV2LanguageID = 0;
    locked_supportedSemanticLanguages = v8->_locked_supportedSemanticLanguages;
    v8->_locked_supportedSemanticLanguages = (NSArray *)&__NSArray0__struct;

    locked_doNotUpdateList = v8->_locked_doNotUpdateList;
    v8->_locked_doNotUpdateList = (NSArray *)&__NSArray0__struct;

    locked_geoIndexPath = v8->_locked_geoIndexPath;
    v8->_locked_geoIndexPath = 0;

    [(SKGSystemListener *)v8 setAutoUpdatingTimezone:1];
    [(SKGSystemListener *)v8 updateTimezone];
    [(SKGSystemListener *)v8 updateLocaleWithLocale:v9 preferredLanguages:v6 force:1];
    [(SKGSystemListener *)v8 hasDiskCapacity];
  }
  return v8;
}

- (void)setAutoUpdatingLocale:(BOOL)a3
{
  BOOL v3 = a3;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  if (v3)
  {
    if (!self->_autoUpdatingLocale) {
      CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_10003CA38, kCFLocaleCurrentLocaleDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  else if (self->_autoUpdatingLocale)
  {
    CFNotificationCenterRemoveObserver(LocalCenter, self, kCFLocaleCurrentLocaleDidChangeNotification, 0);
  }
  self->_autoUpdatingLocale = v3;
}

- (BOOL)isCJK
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CAF4;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasUpdatedLocale
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CBB4;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasUpdatedResources
{
  char v3 = [(SKGSystemListener *)self currentLocale];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CCE4;
  block[3] = &unk_1000DA1A0;
  id v5 = v3;
  id v9 = v5;
  dispatch_queue_t v10 = self;
  id v11 = &v12;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v13 + 24))
  {
    [(SKGSystemListener *)self updateResources];
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)rootLocale
{
  return +[NSLocale localeWithLocaleIdentifier:@"root"];
}

- (NSTimeZone)currentTimezone
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CE80;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSTimeZone *)v3;
}

- (NSLocale)currentLocale
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CF84;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSLocale *)v3;
}

- (NSString)currentLanguage
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D0C0;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)currentRegion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D1FC;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)currentFirstWeekDay
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D2F4;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)currentPreferredLocales
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D3F8;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)currentPreferredLocaleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D534;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSURL)geoIndexResourcesURL
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D670;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

- (NSArray)supportedSemanticLanguages
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100012654;
  dispatch_queue_t v10 = sub_100012548;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D7AC;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (BOOL)semanticSearchEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D8A4;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)enableEmbeddingsHigherQoS
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003D964;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)enableV2LanguageID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003DAB4;
  v5[3] = &unk_1000DA178;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)enableLanguageCheckForEmbedding
{
  return _os_feature_enabled_impl() ^ 1;
}

- (id)pathsForContentType:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(SKGSystemListener *)self currentLocale];
  }
  dispatch_queue_t v10 = v9;
  uint64_t v21 = 0;
  CFArrayRef v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100012654;
  uint64_t v25 = sub_100012548;
  id v26 = 0;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003DCE8;
  v16[3] = &unk_1000DA1C8;
  id v17 = v9;
  id v18 = self;
  id v19 = v6;
  objc_super v20 = &v21;
  id v12 = v6;
  id v13 = v10;
  dispatch_sync(queue, v16);
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v14;
}

- (void)updateLocale
{
  CFArrayRef v4 = sub_100005A04();
  CFLocaleRef v3 = sub_100003BAC();
  [(SKGSystemListener *)self updateLocaleWithLocale:v3 preferredLanguages:v4 force:0];
}

- (BOOL)currentLocaleIsCJK
{
  return self->_currentLocaleIsCJK;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

@end