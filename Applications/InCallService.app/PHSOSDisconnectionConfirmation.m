@interface PHSOSDisconnectionConfirmation
+ (id)sharedInstance;
- (NSHashTable)delegates;
- (NSMutableArray)alertControllers;
- (PHSOSDisconnectionConfirmation)init;
- (void)addDelegate:(id)a3;
- (void)clearAllDelegates;
- (void)dealloc;
- (void)dismissAlertControllers;
- (void)removeDelegate:(id)a3;
- (void)setAlertControllers:(id)a3;
- (void)setDelegates:(id)a3;
- (void)showSOSDisconnectConfirmation:(id)a3;
@end

@implementation PHSOSDisconnectionConfirmation

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000802AC;
  block[3] = &unk_1002CD5C8;
  block[4] = a1;
  if (qword_1003260B8 != -1) {
    dispatch_once(&qword_1003260B8, block);
  }
  v2 = (void *)qword_1003260B0;

  return v2;
}

- (PHSOSDisconnectionConfirmation)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHSOSDisconnectionConfirmation;
  v2 = [(PHSOSDisconnectionConfirmation *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v3;

    uint64_t v5 = +[NSMutableArray array];
    alertControllers = v2->_alertControllers;
    v2->_alertControllers = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[TUCallCenter sharedInstance];
  [v3 setDisconnectCallPreflight:0];

  [(PHSOSDisconnectionConfirmation *)self dismissAlertControllers];
  v4.receiver = self;
  v4.super_class = (Class)PHSOSDisconnectionConfirmation;
  [(PHSOSDisconnectionConfirmation *)&v4 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHSOSDisconnectionConfirmation *)self delegates];
  [v5 addObject:v4];

  v6 = [(PHSOSDisconnectionConfirmation *)self delegates];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    objc_super v8 = +[TUCallCenter sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100080544;
    v9[3] = &unk_1002CF260;
    objc_copyWeak(&v10, &from);
    objc_copyWeak(&v11, &location);
    [v8 setDisconnectCallPreflight:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHSOSDisconnectionConfirmation *)self delegates];
  [v5 removeObject:v4];

  v6 = [(PHSOSDisconnectionConfirmation *)self delegates];
  id v7 = [v6 count];

  if (!v7)
  {
    id v8 = +[TUCallCenter sharedInstance];
    [v8 setDisconnectCallPreflight:0];
  }
}

- (void)clearAllDelegates
{
  uint64_t v3 = +[CNKFeatures sharedInstance];
  unsigned int v4 = [v3 isEnhancedEmergencyEnabled];

  if (v4)
  {
    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    [(PHSOSDisconnectionConfirmation *)self setDelegates:v5];

    id v6 = +[TUCallCenter sharedInstance];
    [v6 setDisconnectCallPreflight:0];
  }
}

- (void)showSOSDisconnectConfirmation:(id)a3
{
  id v19 = a3;
  [(PHSOSDisconnectionConfirmation *)self dismissAlertControllers];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(PHSOSDisconnectionConfirmation *)self delegates];
  id v20 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v31;
    do
    {
      unsigned int v4 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v4);
        objc_initWeak(&location, self);
        id v6 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
        id v7 = +[NSBundle mainBundle];
        id v8 = [v7 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100080C7C;
        v25[3] = &unk_1002CF288;
        id v9 = v19;
        id v27 = v9;
        objc_copyWeak(&v28, &location);
        id v10 = v6;
        id v26 = v10;
        id v11 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v25];
        [v10 addAction:v11];

        v12 = +[NSBundle mainBundle];
        v13 = [v12 localizedStringForKey:@"END_CALL_SOS" value:&stru_1002D6110 table:@"InCallService"];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100080CF8;
        v21[3] = &unk_1002CF2B0;
        id v23 = v9;
        v21[4] = self;
        objc_copyWeak(&v24, &location);
        id v14 = v10;
        id v22 = v14;
        v15 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v21];
        [v14 addAction:v15];

        v16 = [(PHSOSDisconnectionConfirmation *)self alertControllers];
        [v16 addObject:v14];

        [v5 presentDisconnectionAlert:v14];
        objc_destroyWeak(&v24);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        unsigned int v4 = (char *)v4 + 1;
      }
      while (v20 != v4);
      id v20 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }
}

- (void)dismissAlertControllers
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(PHSOSDisconnectionConfirmation *)self alertControllers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) dismissViewControllerAnimated:1 completion:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(PHSOSDisconnectionConfirmation *)self alertControllers];
  [v8 removeAllObjects];
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableArray)alertControllers
{
  return self->_alertControllers;
}

- (void)setAlertControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertControllers, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

@end