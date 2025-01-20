@interface PHAudioDeviceController
+ (AVSystemController)sharedSystemController;
+ (PHAudioDeviceController)sharedAudioDeviceController;
- (BOOL)_routeIsAirTunes:(id)a3;
- (BOOL)_routeIsDefault:(id)a3;
- (BOOL)_routeIsHandset:(id)a3;
- (BOOL)_routeIsReceiver:(id)a3;
- (BOOL)_routeIsSpeaker:(id)a3;
- (BOOL)handsetRouteAvailable;
- (BOOL)handsetRouteAvailableForUnformattedPickableRoutes:(id)a3;
- (BOOL)receiverRouteIsPicked;
- (BOOL)speakerRouteAvailable;
- (BOOL)speakerRouteAvailableForUnformattedPickableRoutes:(id)a3;
- (BOOL)speakerRouteIsPicked;
- (NSArray)_pickableRoutes;
- (NSArray)routes;
- (NSDictionary)pickedRoute;
- (OS_dispatch_semaphore)modifyingStateLock;
- (PHAudioDeviceController)init;
- (PHAudioDeviceControllerDelegate)delegate;
- (TUAudioRoute)currentRoute;
- (TUCallCenter)fetchRoutesBackgroundCallCenter;
- (id)_pickableRoutesForCategory:(id)a3 mode:(id)a4;
- (id)_pickableRoutesUsingAttribute;
- (id)_pickableRoutesUsingBackgroundQueue:(BOOL)a3;
- (id)_pickedRouteUsingBackgroundQueue:(BOOL)a3;
- (id)_unformattedPickableRoutesForAudioSessionCategory:(id)a3;
- (id)_unformattedPickableRoutesForAudioSessionCategory:(id)a3 usingBackgroundQueue:(BOOL)a4;
- (id)callForPickableRoutes;
- (id)callForPickableRoutesUsingBackgroundQueue:(BOOL)a3;
- (id)routesForUnformattedPickableRoutes:(id)a3;
- (void)_acquireLock;
- (void)_audioRouteInformationChanged;
- (void)_pickRoute:(id)a3;
- (void)_releaseLock;
- (void)clearCachedRoutes;
- (void)dealloc;
- (void)fetchCurrentRouteWithCompletionHandler:(id)a3;
- (void)fetchRoutesWithCompletionHandler:(id)a3;
- (void)pickHandsetRoute;
- (void)pickRouteWithUID:(id)a3;
- (void)pickSpeakerRoute;
- (void)restorePickedRoute;
- (void)setDelegate:(id)a3;
@end

@implementation PHAudioDeviceController

+ (AVSystemController)sharedSystemController
{
  v2 = (void *)CUTWeakLinkClass();
  if (!v2)
  {
    v3 = +[NSString stringWithFormat:@"Weak linking of AVSystemController failed"];
    NSLog(@"** TUAssertion failure: %@", v3);

    _TUAssertShouldCrashApplication();
  }
  v4 = [v2 sharedAVSystemController];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = (id)objc_opt_class();
      id v6 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] +[AVSystemController sharedAVSystemController] returned something that isn't an AVSystemController class: %@", buf, 0xCu);
    }
  }
  else
  {
    v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] +[AVSystemController sharedAVSystemController] returned nil value", buf, 2u);
    }
  }

LABEL_10:

  return (AVSystemController *)v4;
}

+ (PHAudioDeviceController)sharedAudioDeviceController
{
  if (qword_1003260C8 != -1) {
    dispatch_once(&qword_1003260C8, &stru_1002CF2D0);
  }
  v2 = (void *)qword_1003260C0;

  return (PHAudioDeviceController *)v2;
}

- (PHAudioDeviceController)init
{
  v13.receiver = self;
  v13.super_class = (Class)PHAudioDeviceController;
  v2 = [(PHAudioDeviceController *)&v13 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_audioRouteInformationChanged" name:TUAudioSystemAudioPickableRoutesChanged object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_audioRouteInformationChanged" name:TUCallAudioPropertiesChangedNotification object:0];

    id v5 = +[TUAudioSystemController sharedAudioSystemController];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(1);
    modifyingStateLock = v2->_modifyingStateLock;
    v2->_modifyingStateLock = (OS_dispatch_semaphore *)v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)2u, 0);
    dispatch_queue_t v9 = dispatch_queue_create("PHAudioDeviceController.serialQueue", v8);
    v10 = (TUCallCenter *)[objc_alloc((Class)TUCallCenter) initWithQueue:v9 wantsCallNotifications:0];
    fetchRoutesBackgroundCallCenter = v2->_fetchRoutesBackgroundCallCenter;
    v2->_fetchRoutesBackgroundCallCenter = v10;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHAudioDeviceController;
  [(PHAudioDeviceController *)&v4 dealloc];
}

- (NSArray)routes
{
  v3 = [(PHAudioDeviceController *)self _pickableRoutes];
  objc_super v4 = [(PHAudioDeviceController *)self routesForUnformattedPickableRoutes:v3];

  return (NSArray *)v4;
}

- (void)fetchRoutesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioDeviceController *)self fetchRoutesBackgroundCallCenter];
  dispatch_semaphore_t v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000813D0;
  v8[3] = &unk_1002CDCD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (id)routesForUnformattedPickableRoutes:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc((Class)TUAudioRoute);
        id v12 = [v11 initWithDictionary:v10];
        if (v12) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];

  return v13;
}

- (id)callForPickableRoutes
{
  return [(PHAudioDeviceController *)self callForPickableRoutesUsingBackgroundQueue:0];
}

- (id)callForPickableRoutesUsingBackgroundQueue:(BOOL)a3
{
  if (a3) {
    [(PHAudioDeviceController *)self fetchRoutesBackgroundCallCenter];
  }
  else {
  id v3 = +[TUCallCenter sharedInstance];
  }
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  id v5 = [v3 frontmostCall];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 currentVideoCall];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)speakerRouteAvailable
{
  v2 = self;
  id v3 = [(PHAudioDeviceController *)self _pickableRoutes];
  LOBYTE(v2) = [(PHAudioDeviceController *)v2 speakerRouteAvailableForUnformattedPickableRoutes:v3];

  return (char)v2;
}

- (BOOL)speakerRouteAvailableForUnformattedPickableRoutes:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[PHAudioDeviceController _routeIsSpeaker:](self, "_routeIsSpeaker:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)handsetRouteAvailable
{
  v2 = self;
  id v3 = [(PHAudioDeviceController *)self _pickableRoutes];
  LOBYTE(v2) = [(PHAudioDeviceController *)v2 handsetRouteAvailableForUnformattedPickableRoutes:v3];

  return (char)v2;
}

- (BOOL)handsetRouteAvailableForUnformattedPickableRoutes:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[PHAudioDeviceController _routeIsHandset:](self, "_routeIsHandset:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)pickSpeakerRoute
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to pick the speaker route", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(PHAudioDeviceController *)self _pickableRoutes];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([(PHAudioDeviceController *)self _routeIsSpeaker:v9])
        {
          [(PHAudioDeviceController *)self _pickRoute:v9];
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)pickHandsetRoute
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to pick the handset route", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(PHAudioDeviceController *)self _pickableRoutes];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([(PHAudioDeviceController *)self _routeIsHandset:v9])
        {
          [(PHAudioDeviceController *)self _pickRoute:v9];
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)pickRouteWithUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to pick route with UID %@", buf, 0xCu);
  }

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(PHAudioDeviceController *)self _pickableRoutes];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = [v11 objectForKey:AVSystemController_RouteDescriptionKey_RouteUID];
          unsigned int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            [(PHAudioDeviceController *)self _pickRoute:v11];

            goto LABEL_15;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    if ([v4 isEqualToString:TUCallSourceIdentifierSpeakerRoute]) {
      [(PHAudioDeviceController *)self pickSpeakerRoute];
    }
  }
LABEL_15:
}

- (TUAudioRoute)currentRoute
{
  id v3 = objc_alloc((Class)TUAudioRoute);
  id v4 = [(PHAudioDeviceController *)self _pickedRouteUsingBackgroundQueue:0];
  id v5 = [v3 initWithDictionary:v4];

  return (TUAudioRoute *)v5;
}

- (void)fetchCurrentRouteWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioDeviceController *)self fetchRoutesBackgroundCallCenter];
  id v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100081F20;
  v8[3] = &unk_1002CDCD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)restorePickedRoute
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restoring picked route", v4, 2u);
  }

  if (self->_pickedRoute) {
    [(PHAudioDeviceController *)self _pickRoute:"_pickRoute:"];
  }
}

- (void)clearCachedRoutes
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing cached routes", v5, 2u);
  }

  pickedRoute = self->_pickedRoute;
  self->_pickedRoute = 0;
}

- (BOOL)speakerRouteIsPicked
{
  v2 = self;
  id v3 = [(PHAudioDeviceController *)self _pickedRouteUsingBackgroundQueue:0];
  LOBYTE(v2) = [(PHAudioDeviceController *)v2 _routeIsSpeaker:v3];

  return (char)v2;
}

- (BOOL)receiverRouteIsPicked
{
  v2 = self;
  id v3 = [(PHAudioDeviceController *)self _pickedRouteUsingBackgroundQueue:0];
  LOBYTE(v2) = [(PHAudioDeviceController *)v2 _routeIsReceiver:v3];

  return (char)v2;
}

- (id)_pickedRouteUsingBackgroundQueue:(BOOL)a3
{
  p_pickedRoute = &self->_pickedRoute;
  pickedRoute = self->_pickedRoute;
  if (pickedRoute)
  {
    id v5 = pickedRoute;
  }
  else
  {
    BOOL v6 = a3;
    id v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(PHAudioDeviceController *)self callForPickableRoutesUsingBackgroundQueue:v6];
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Refreshing picked route based on call: %@", buf, 0xCu);
    }
    long long v10 = +[TUAudioSystemController sharedAudioSystemController];
    unsigned __int8 v11 = [v10 isTTY];

    if ((v11 & 1) == 0)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v12 = -[PHAudioDeviceController _pickableRoutesUsingBackgroundQueue:](self, "_pickableRoutesUsingBackgroundQueue:", v6, 0);
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
LABEL_8:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
          long long v18 = [v17 valueForKey:AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked];
          unsigned __int8 v19 = [v18 BOOLValue];

          if (v19) {
            break;
          }
          if (v14 == (id)++v16)
          {
            id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v14) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
        id v20 = v17;

        if (v20) {
          goto LABEL_17;
        }
      }
      else
      {
LABEL_14:
      }
    }
    v21 = +[PHAudioDeviceController sharedSystemController];
    id v20 = [v21 attributeForKey:AVSystemController_PickedRouteAttribute];

LABEL_17:
    objc_storeStrong((id *)p_pickedRoute, v20);
    v22 = sub_1000D5130();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *p_pickedRoute;
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Refreshed picked route: %@", buf, 0xCu);
    }

    id v5 = *p_pickedRoute;
  }

  return v5;
}

- (id)_pickableRoutesUsingAttribute
{
  if (!qword_1003260D0)
  {
    v2 = (void *)CUTWeakLinkSymbol();
    id v3 = v2 ? (void *)*v2 : 0;
    objc_storeStrong((id *)&qword_1003260D0, v3);
    if (!qword_1003260D0)
    {
      id v4 = +[NSString stringWithFormat:@"Failed to weak link AVSystemController_PickableRoutesAttribute"];
      NSLog(@"** TUAssertion failure: %@", v4);

      _TUAssertShouldCrashApplication();
    }
  }
  id v5 = +[PHAudioDeviceController sharedSystemController];
  BOOL v6 = [v5 attributeForKey:qword_1003260D0];

  return v6;
}

- (NSArray)_pickableRoutes
{
  return (NSArray *)[(PHAudioDeviceController *)self _pickableRoutesUsingBackgroundQueue:0];
}

- (id)_pickableRoutesUsingBackgroundQueue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PHAudioDeviceController *)self delegate];
  if (v5
    && (BOOL v6 = (void *)v5,
        [(PHAudioDeviceController *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isPendingAudioSessionActivation],
        v7,
        v6,
        v8))
  {
    id v9 = [(PHAudioDeviceController *)self _pickableRoutesUsingAttribute];
  }
  else
  {
    long long v10 = +[AVAudioSession sharedInstance];
    unsigned __int8 v11 = [v10 category];
    id v9 = [(PHAudioDeviceController *)self _unformattedPickableRoutesForAudioSessionCategory:v11 usingBackgroundQueue:v3];
  }

  return v9;
}

- (id)_unformattedPickableRoutesForAudioSessionCategory:(id)a3
{
  return [(PHAudioDeviceController *)self _unformattedPickableRoutesForAudioSessionCategory:a3 usingBackgroundQueue:0];
}

- (id)_unformattedPickableRoutesForAudioSessionCategory:(id)a3 usingBackgroundQueue:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isEqualToString:AVAudioSessionCategoryVoiceMail])
  {
    BOOL v6 = [(PHAudioDeviceController *)self _pickableRoutesForCategory:@"Voicemail" mode:0];
  }
  else
  {
    id v7 = +[TUAudioSystemController sharedAudioSystemController];
    unsigned int v8 = [v7 isTTY];

    if (v8)
    {
      id v9 = +[TUAudioSystemController sharedAudioSystemController];
      BOOL v6 = [v9 pickableRoutesForTTY];
    }
    else
    {
      id v9 = [(PHAudioDeviceController *)self callForPickableRoutesUsingBackgroundQueue:v4];
      long long v10 = [v9 audioCategory];

      if (v10)
      {
        unsigned __int8 v11 = [v9 audioCategory];
        long long v12 = [v9 audioMode];
        BOOL v6 = [(PHAudioDeviceController *)self _pickableRoutesForCategory:v11 mode:v12];
      }
      else
      {
        unsigned __int8 v11 = +[TUAudioSystemController sharedAudioSystemController];
        BOOL v6 = [v11 bestGuessPickableRoutesForAnyCall];
      }
    }
  }
  id v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ([(PHAudioDeviceController *)self _routeIsAirTunes:v19])
        {
          id v20 = sub_1000D5130();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PHAudioDeviceController: Filtering out AirTunes audio route until better support is available within the app", v23, 2u);
          }
        }
        else
        {
          [v13 addObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  id v21 = v13;

  return v21;
}

- (id)_pickableRoutesForCategory:(id)a3 mode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100082A14;
  id v16 = sub_100082A24;
  id v17 = 0;
  unsigned int v8 = +[TUAudioSystemController sharedAudioSystemController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100082A2C;
  v11[3] = &unk_1002CF2F8;
  v11[4] = self;
  v11[5] = &v12;
  [v8 getPickableRoutesForCategory:v6 mode:v7 completion:v11];

  [(PHAudioDeviceController *)self _acquireLock];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)_pickRoute:(id)a3
{
  BOOL v4 = (NSDictionary *)a3;
  [(PHAudioDeviceController *)self clearCachedRoutes];
  uint64_t v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHAudioDeviceController: Picking new route = %@", buf, 0xCu);
  }

  id v6 = +[PHAudioDeviceController sharedSystemController];
  id v12 = 0;
  unsigned __int8 v7 = [v6 setAttribute:v4 forKey:AVSystemController_PickedRouteAttribute error:&v12];
  id v8 = v12;

  if ((v7 & 1) == 0)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001EAD50((uint64_t)v8, v9);
    }
  }
  pickedRoute = self->_pickedRoute;
  self->_pickedRoute = v4;
  unsigned __int8 v11 = v4;

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002CF318);
}

- (BOOL)_routeIsAirTunes:(id)a3
{
  BOOL v3 = [a3 valueForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v4 = [v3 isEqual:@"AirTunes"];

  return v4;
}

- (BOOL)_routeIsSpeaker:(id)a3
{
  BOOL v3 = [a3 valueForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v4 = [v3 isEqual:@"Speaker"];

  return v4;
}

- (BOOL)_routeIsReceiver:(id)a3
{
  BOOL v3 = [a3 valueForKey:AVSystemController_RouteDescriptionKey_AVAudioRouteName];
  unsigned __int8 v4 = [v3 isEqual:@"Receiver"];

  return v4;
}

- (BOOL)_routeIsDefault:(id)a3
{
  BOOL v3 = [a3 valueForKey:AVSystemController_RouteDescriptionKey_RouteType];
  unsigned __int8 v4 = [v3 isEqual:AVSystemController_PickableRouteType_Default];

  return v4;
}

- (BOOL)_routeIsHandset:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(PHAudioDeviceController *)self _routeIsReceiver:v4];
  unsigned __int8 v6 = [(PHAudioDeviceController *)self _routeIsDefault:v4];
  unsigned __int8 v7 = [(PHAudioDeviceController *)self _routeIsSpeaker:v4];

  if (v5) {
    return 1;
  }
  else {
    return v6 & (v7 ^ 1);
  }
}

- (void)_acquireLock
{
  v2 = [(PHAudioDeviceController *)self modifyingStateLock];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_releaseLock
{
  v2 = [(PHAudioDeviceController *)self modifyingStateLock];
  dispatch_semaphore_signal(v2);
}

- (void)_audioRouteInformationChanged
{
  [(PHAudioDeviceController *)self clearCachedRoutes];

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002CF338);
}

- (NSDictionary)pickedRoute
{
  return self->_pickedRoute;
}

- (OS_dispatch_semaphore)modifyingStateLock
{
  return self->_modifyingStateLock;
}

- (TUCallCenter)fetchRoutesBackgroundCallCenter
{
  return self->_fetchRoutesBackgroundCallCenter;
}

- (PHAudioDeviceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAudioDeviceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetchRoutesBackgroundCallCenter, 0);
  objc_storeStrong((id *)&self->_modifyingStateLock, 0);

  objc_storeStrong((id *)&self->_pickedRoute, 0);
}

@end