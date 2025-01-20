@interface MSCRODBrailleDisplayManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)_brailleConfigMatch:(id)a3 withConfig:(id)a4;
- (BOOL)_hasActiveDisplay;
- (BOOL)_hasUserInteractedWithDeviceRecently;
- (BOOL)_registerSleepNotifications;
- (BOOL)airplaneMode;
- (BOOL)isBrailleSystemSleeping;
- (BOOL)isConfigured;
- (MSCRODBrailleDisplayManager)init;
- (RadiosPreferences)radiosPrefs;
- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5;
- (id)brailleInputManager;
- (id)driverConfiguration;
- (id)newBrailleDisplayCommandDispatcher;
- (unsigned)_rootPowerPort;
- (void)_delayedHandleSystemSleep;
- (void)_delayedPowerChangedNotification:(id)a3;
- (void)_delayedWakeFromSleep;
- (void)_eventQueue_begin;
- (void)_eventQueue_brailleDriverDisconnected:(id)a3;
- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3;
- (void)_eventQueue_setVirtualStatusAlignment:(int)a3;
- (void)_handleSystemSleep;
- (void)_loadBluetoothDriverFromPreferences;
- (void)_loadBluetoothDriverWithAddress:(id)a3;
- (void)_reallyDelayedWakeFromSleep;
- (void)_registerHasBlankedScreenNotification;
- (void)_removeBluetoothDriverWithAddress:(id)a3;
- (void)_removeBluetoothDriverWithIOElement:(id)a3 removeFromPreferences:(BOOL)a4;
- (void)_saveBluetoothDisplayConfiguration:(id)a3;
- (void)_setupBluetooth;
- (void)_updateScreenUILock:(int)a3 screenBlank:(int)a4;
- (void)_wakeFromSleep;
- (void)addToDisplays:(id)a3;
- (void)airplaneModeChanged;
- (void)handleSettingsChange:(id)a3;
- (void)invalidate;
- (void)loadBluetoothDriverWithAddress:(id)a3;
- (void)powerChangedNotification:(id)a3;
- (void)removeBluetoothDriverWithAddress:(id)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setIsBrailleSystemSleeping:(BOOL)a3;
- (void)setLastUserInteractionTime:(double)a3;
- (void)setRadiosPrefs:(id)a3;
@end

@implementation MSCRODBrailleDisplayManager

+ (id)sharedManager
{
  return (id)qword_100019C28;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [objc_allocWithZone((Class)MSCRODBrailleDisplayManager) init];
    v3 = (void *)qword_100019C28;
    qword_100019C28 = (uint64_t)v2;

    uint64_t v4 = qword_100019C28;
    +[SCROBrailleDisplayManager _setSharedManager:v4];
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if (qword_100019C28) {
    return 0;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MSCRODBrailleDisplayManager;
  return objc_msgSendSuper2(&v4, "allocWithZone:", a3);
}

- (MSCRODBrailleDisplayManager)init
{
  id v2 = self;
  if (!qword_100019C28)
  {
    v22.receiver = self;
    v22.super_class = (Class)MSCRODBrailleDisplayManager;
    v3 = [(MSCRODBrailleDisplayManager *)&v22 init];
    id v2 = v3;
    if (v3)
    {
      [*(id *)&v3->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__managedDisplayQueue] setActiveQueueMaximumSize:32];
      uint64_t v4 = objc_opt_new();
      displays = v2->_displays;
      v2->_displays = (NSMutableArray *)v4;

      v6 = (void *)_AXSVoiceOverTouchCopyBrailleTableIdentifier();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [objc_alloc((Class)BRLTTable) initWithIdentifier:v6];
        v8 = +[SCROBrailleTranslationManager sharedManager];
        v9 = [v7 serviceIdentifier];
        [v8 loadTranslatorWithServiceIdentifier:v9];

        v10 = [v7 language];
        [v8 setDefaultLanguage:v10];
      }
      *(_DWORD *)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__inputAccessMode] = 0;
      v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__showDotsSevenAndEight] = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000031A8, kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v12 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_1000031A8, kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v13 = _AXSVoiceOverTouchBrailleVirtualStatusAlignment();
      uint64_t v14 = OBJC_IVAR___SCROBrailleDisplayManager__status;
      [*(id *)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status] setVirtualAlignment:v13];
      [*(id *)&v2->SCROBrailleDisplayManager_opaque[v14] setMasterStatusCellIndex:_AXSVoiceOverTouchBrailleMasterStatusCellIndex()];
      v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__isValid] = 1;
      v15 = objc_opt_new();
      [(MSCRODBrailleDisplayManager *)v2 setRadiosPrefs:v15];

      v16 = [(MSCRODBrailleDisplayManager *)v2 radiosPrefs];
      [v16 setDelegate:v2];

      v17 = [(MSCRODBrailleDisplayManager *)v2 radiosPrefs];
      -[MSCRODBrailleDisplayManager setAirplaneMode:](v2, "setAirplaneMode:", [v17 airplaneMode]);

      v18 = *(NSObject **)&v2->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000031C0;
      block[3] = &unk_100014770;
      id v2 = v2;
      v21 = v2;
      dispatch_async(v18, block);
    }
  }
  return v2;
}

- (void)handleSettingsChange:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kAXSVoiceOverTouchBrailleContractionModeChangedNotification])
  {
    [(MSCRODBrailleDisplayManager *)self setContractionMode:_AXSVoiceOverTouchBrailleContractionMode()];
  }
  else if ([v4 isEqualToString:kAXSVoiceOverTouchBrailleEightDotModeChangedNotification])
  {
    [(MSCRODBrailleDisplayManager *)self setShowEightDotBraille:_AXSVoiceOverTouchBrailleEightDotMode() != 0];
  }
  else if ([v4 isEqualToString:kAXSVoiceOverTouchBrailleVirtualStatusAlignmentChangedNotification])
  {
    [(MSCRODBrailleDisplayManager *)self setVirtualStatusAlignment:_AXSVoiceOverTouchBrailleVirtualStatusAlignment()];
  }
  else if ([v4 isEqualToString:kAXSVoiceOverTouchBrailleMasterStatusCellIndexChangedNotification])
  {
    [(MSCRODBrailleDisplayManager *)self setMasterStatusCellIndex:_AXSVoiceOverTouchBrailleMasterStatusCellIndex()];
  }
}

- (void)_eventQueue_begin
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue]);
  if (self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__isValid])
  {
    [(MSCRODBrailleDisplayManager *)self _registerHasBlankedScreenNotification];
    [(MSCRODBrailleDisplayManager *)self _registerSleepNotifications];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003378;
    block[3] = &unk_100014770;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [(MSCRODBrailleDisplayManager *)self _loadStealthDisplay];
  }
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)MSCRODBrailleDisplayManager;
  [(MSCRODBrailleDisplayManager *)&v4 invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_eventQueue_brailleDriverDisconnected:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MSCRODBrailleDisplayManager;
  [(MSCRODBrailleDisplayManager *)&v6 _eventQueue_brailleDriverDisconnected:v4];
  id v5 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (void)_eventQueue_setVirtualStatusAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = OBJC_IVAR___SCROBrailleDisplayManager__status;
  unsigned int v6 = [*(id *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status] virtualAlignment];
  v7.receiver = self;
  v7.super_class = (Class)MSCRODBrailleDisplayManager;
  [(MSCRODBrailleDisplayManager *)&v7 _eventQueue_setVirtualStatusAlignment:v3];
  if (v6 != v3
    && [*(id *)&self->SCROBrailleDisplayManager_opaque[v5] virtualAlignment] == v3)
  {
    _AXSVoiceOverTouchSetBrailleVirtualStatusAlignment();
  }
}

- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3
{
  uint64_t v5 = OBJC_IVAR___SCROBrailleDisplayManager__status;
  id v6 = [*(id *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__status] masterStatusCellIndex];
  v7.receiver = self;
  v7.super_class = (Class)MSCRODBrailleDisplayManager;
  [(MSCRODBrailleDisplayManager *)&v7 _eventQueue_setMasterStatusCellIndex:a3];
  if (v6 != (id)a3
    && [*(id *)&self->SCROBrailleDisplayManager_opaque[v5] masterStatusCellIndex] == (id)a3)
  {
    _AXSVoiceOverTouchSetBrailleMasterStatusCellIndex();
  }
}

- (void)_setupBluetooth
{
  id v3 = +[BluetoothManager sharedInstance];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"powerChangedNotification:" name:BluetoothPowerChangedNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"powerChangedNotification:" name:BluetoothAvailabilityChangedNotification object:0];
}

- (void)powerChangedNotification:(id)a3
{
}

- (void)_delayedPowerChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handing power change: %@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = +[BluetoothManager sharedInstance];
  if ([v6 enabled] && !self->_isScreenBlank)
  {
    unsigned __int8 v17 = [(MSCRODBrailleDisplayManager *)self airplaneMode];

    if ((v17 & 1) == 0)
    {
      [(MSCRODBrailleDisplayManager *)self _loadBluetoothDriverFromPreferences];
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v18 = v4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(NSMutableArray *)self->_displays copy];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 ioElement];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v15 = AXLogBrailleHW();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Call _removeBluetoothDriverWithIOElement for Display: %@", buf, 0xCu);
          }

          v16 = [v12 ioElement];
          [(MSCRODBrailleDisplayManager *)self _removeBluetoothDriverWithIOElement:v16 removeFromPreferences:0];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v4 = v18;
LABEL_18:
}

- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol])
  {
    uint64_t v10 = MSCRODMobileBrailleDisplay;
LABEL_5:
    v11 = [(__objc2_class *)v10 displayWithIOElement:v7 driverIdentifier:v8 delegate:v9];
    goto LABEL_7;
  }
  if (v7)
  {
    uint64_t v10 = (__objc2_class *)SCROBrailleDisplay;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (void)loadBluetoothDriverWithAddress:(id)a3
{
}

- (void)_loadBluetoothDriverWithAddress:(id)a3
{
  id v38 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v3 = +[BluetoothManager sharedInstance];
  id v4 = [v3 pairedDevices];

  id v5 = [v4 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v55;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v55 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v54 + 1) + 8 * v7);
      id v9 = [v8 address];
      unsigned __int8 v10 = [v9 isEqualToString:v38];

      if (v10) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v8;

    if (!v11) {
      goto LABEL_35;
    }
    id v37 = v11;
    v35 = +[NSBundle brailleDriverDeviceDetectionInfo];
    if ([v35 count])
    {
      v39 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v35 count]);
      v12 = [v37 name];
      v44 = +[NSExpression expressionForEvaluatedObject];
      long long v76 = 0u;
      long long v77 = 0u;
      *(_OWORD *)buf = 0u;
      long long v75 = 0u;
      id obj = v35;
      id v41 = [obj countByEnumeratingWithState:buf objects:&v68 count:16];
      if (v41)
      {
        uint64_t v40 = *(void *)v75;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v75 != v40) {
              objc_enumerationMutation(obj);
            }
            uint64_t v42 = *(void *)(*(void *)&buf[8] + 8 * i);
            uint64_t v14 = objc_msgSend(obj, "objectForKey:");
            v15 = [v14 objectForKey:kSCROBrailleDriverBluetoothSearchDictionary];

            if (v15)
            {
              if (v12)
              {
                v16 = [v15 objectForKey:kSCROBrailleDriverBluetoothDeviceNameRegexPatterns];
                long long v60 = 0u;
                long long v61 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                id v17 = v16;
                id v18 = [v17 countByEnumeratingWithState:&v58 objects:&v64 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v59;
                  while (2)
                  {
                    for (j = 0; j != v18; j = (char *)j + 1)
                    {
                      if (*(void *)v59 != v19) {
                        objc_enumerationMutation(v17);
                      }
                      id v21 = [objc_allocWithZone((Class)NSConstantValueExpression) initWithObject:*(void *)(*((void *)&v58 + 1) + 8 * (void)j)];
                      id v22 = [objc_allocWithZone((Class)NSComparisonPredicate) initWithLeftExpression:v44 rightExpression:v21 modifier:0 type:6 options:0];
                      unsigned __int8 v23 = [v22 evaluateWithObject:v12];

                      if (v23)
                      {

                        [v39 insertObject:v42 atIndex:0];
                        goto LABEL_31;
                      }
                    }
                    id v18 = [v17 countByEnumeratingWithState:&v58 objects:&v64 count:16];
                    if (v18) {
                      continue;
                    }
                    break;
                  }
                }

LABEL_31:
              }
              else
              {
                [v39 addObject:v42];
              }
            }
          }
          id v41 = [obj countByEnumeratingWithState:buf objects:&v68 count:16];
        }
        while (v41);
      }
    }
    else
    {
      v39 = 0;
    }

    if ([v39 count]
      && (id v24 = [objc_allocWithZone((Class)MSCRODIOBluetoothElement) initWithAddress:v38]) != 0)
    {
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x2020000000;
      char v67 = 0;
      uint64_t v68 = 0;
      v69 = &v68;
      uint64_t v70 = 0x3032000000;
      v71 = sub_10000420C;
      v72 = sub_10000421C;
      id v73 = 0;
      id v25 = *(NSObject **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004224;
      block[3] = &unk_1000147C0;
      void block[4] = self;
      id v26 = v24;
      id v50 = v26;
      v52 = &v64;
      v53 = &v68;
      id v51 = v39;
      dispatch_sync(v25, block);
      if (!*((unsigned char *)v65 + 24))
      {
        [(MSCRODBrailleDisplayManager *)self _loadNextDriverForIOElement:v26];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        v27 = [*(id *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__managedDisplayQueue] loadingDisplays];
        id v28 = [v27 countByEnumeratingWithState:&v45 objects:v62 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v46;
          while (2)
          {
            for (k = 0; k != v28; k = (char *)k + 1)
            {
              if (*(void *)v46 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = *(void **)(*((void *)&v45 + 1) + 8 * (void)k);
              v32 = [v31 ioElement];
              unsigned int v33 = [v32 isEqual:v26];

              if (v33)
              {
                [(NSMutableArray *)self->_displays addObject:v31];
                v34 = AXLogBrailleHW();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v31;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Adding BT display: %@", buf, 0xCu);
                }

                goto LABEL_53;
              }
            }
            id v28 = [v27 countByEnumeratingWithState:&v45 objects:v62 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }
LABEL_53:

        _updateNewlyActiveDisplay();
        [(id)v69[5] configurationDidChange];
      }

      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v64, 8);
    }
    else
    {
      id v26 = [(MSCRODBrailleDisplayManager *)self delegate];
      [v26 handleFailedToLoadBluetoothDevice:v38];
    }
  }
  else
  {
LABEL_9:

LABEL_35:
    id v37 = [(MSCRODBrailleDisplayManager *)self delegate];
    [v37 handleFailedToLoadBluetoothDevice:v38];
  }
}

- (void)_loadBluetoothDriverFromPreferences
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v2 = +[AXSettings sharedInstance];
  id obj = [v2 voiceOverBrailleDisplays];

  id v45 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v45)
  {
    uint64_t v44 = *(void *)v79;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v79 != v44)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v46 = v3;
        id v5 = *(void **)(*((void *)&v78 + 1) + 8 * v3);
        uint64_t v6 = AXLogBrailleHW();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v5;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processing BT device: %@", buf, 0xCu);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = [v5 objectForKey:kSCROBrailleDisplayBluetoothAddress];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = [v5 objectForKey:kSCROBrailleDisplayTransport];
            id v9 = [v8 intValue];

            unsigned __int8 v10 = AXLogBrailleHW();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              id v11 = +[NSNumber numberWithUnsignedInt:v9];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v11;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BT transport type: %@", buf, 0xCu);
            }
            if (v9 == 2)
            {
              id v47 = [objc_allocWithZone((Class)MSCRODIOBluetoothElement) initWithAddress:v7];
              if (!v47) {
                goto LABEL_35;
              }
LABEL_37:
              v30 = AXLogBrailleHW();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                displays = self->_displays;
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = displays;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "In _loadBluetoothDriverFromPreferences: _displays = %@", buf, 0xCu);
              }

              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              v32 = self->_displays;
              id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v66 objects:v90 count:16];
              if (v33)
              {
                uint64_t v34 = *(void *)v67;
                while (2)
                {
                  for (i = 0; i != v33; i = (char *)i + 1)
                  {
                    if (*(void *)v67 != v34) {
                      objc_enumerationMutation(v32);
                    }
                    v36 = [*(id *)(*((void *)&v66 + 1) + 8 * i) ioElement];
                    unsigned __int8 v37 = [v36 isEqual:v47];

                    if (v37)
                    {

                      id v41 = AXLogBrailleHW();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v7;
                        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Not remaking display, we already have a cached version: %@", buf, 0xCu);
                      }

                      goto LABEL_55;
                    }
                  }
                  id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v66 objects:v90 count:16];
                  if (v33) {
                    continue;
                  }
                  break;
                }
              }

              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x3032000000;
              v87 = sub_10000420C;
              v88 = sub_10000421C;
              id v89 = 0;
              uint64_t v62 = 0;
              v63 = &v62;
              uint64_t v64 = 0x2020000000;
              char v65 = 0;
              uint64_t v56 = 0;
              long long v57 = &v56;
              uint64_t v58 = 0x3032000000;
              long long v59 = sub_10000420C;
              long long v60 = sub_10000421C;
              id v61 = 0;
              id v38 = *(NSObject **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100004C10;
              block[3] = &unk_1000147E8;
              void block[4] = self;
              id v47 = v47;
              id v51 = v47;
              v52 = v5;
              v53 = buf;
              long long v54 = &v62;
              long long v55 = &v56;
              dispatch_sync(v38, block);
              v39 = AXLogBrailleHW();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v40 = +[NSNumber numberWithBool:*((unsigned __int8 *)v63 + 24)];
                *(_DWORD *)v82 = 138412546;
                v83 = v40;
                __int16 v84 = 2112;
                id v85 = v47;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Adding new display element? %@ %@", v82, 0x16u);
              }
              if (*((unsigned char *)v63 + 24))
              {
                [(NSMutableArray *)self->_displays addObject:*(void *)(*(void *)&buf[8] + 40)];
                [(id)v57[5] configurationDidChange];
              }

              _Block_object_dispose(&v56, 8);
              _Block_object_dispose(&v62, 8);
              _Block_object_dispose(buf, 8);

LABEL_55:
            }
            else
            {
              if (v9 == 8)
              {
                long long v76 = 0u;
                long long v77 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                v12 = +[BluetoothManager sharedInstance];
                id v47 = [v12 pairedDevices];

                id v49 = [v47 countByEnumeratingWithState:&v74 objects:v92 count:16];
                if (v49)
                {
                  uint64_t v48 = *(void *)v75;
                  do
                  {
                    for (j = 0; j != v49; j = (char *)j + 1)
                    {
                      if (*(void *)v75 != v48) {
                        objc_enumerationMutation(v47);
                      }
                      uint64_t v14 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
                      v15 = [v14 address];
                      unsigned int v16 = [v15 isEqualToString:v7];

                      if (v16)
                      {
                        long long v72 = 0u;
                        long long v73 = 0u;
                        long long v70 = 0u;
                        long long v71 = 0u;
                        id v17 = +[BluetoothManager sharedInstance];
                        id v18 = [v17 connectingDevices];

                        int v19 = 0;
                        id v20 = [v18 countByEnumeratingWithState:&v70 objects:v91 count:16];
                        if (v20)
                        {
                          uint64_t v21 = *(void *)v71;
                          do
                          {
                            for (k = 0; k != v20; k = (char *)k + 1)
                            {
                              if (*(void *)v71 != v21) {
                                objc_enumerationMutation(v18);
                              }
                              unsigned __int8 v23 = [*(id *)(*((void *)&v70 + 1) + 8 * (void)k) address];
                              unsigned int v24 = [v23 isEqualToString:v7];

                              v19 |= v24;
                            }
                            id v20 = [v18 countByEnumeratingWithState:&v70 objects:v91 count:16];
                          }
                          while (v20);
                        }

                        if ((([v14 connected] | v19) & 1) == 0)
                        {
                          [v14 device];
                          uint64_t v25 = BTDeviceConnectServices();
                          id v26 = AXLogBrailleHW();
                          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                          {
                            v27 = +[NSNumber numberWithInt:v25];
                            *(_DWORD *)buf = 138412546;
                            *(void *)&uint8_t buf[4] = v27;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v14;
                            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Connected to device[%@]: %@", buf, 0x16u);
                          }
                        }
                      }
                    }
                    id v49 = [v47 countByEnumeratingWithState:&v74 objects:v92 count:16];
                  }
                  while (v49);
                }
                goto LABEL_55;
              }
LABEL_35:
              id v28 = +[BluetoothManager sharedInstance];
              unsigned __int8 v29 = [v28 available];

              if ((v29 & 1) == 0)
              {
                id v47 = 0;
                goto LABEL_37;
              }
            }
          }
        }
        uint64_t v3 = v46 + 1;
      }
      while ((id)(v46 + 1) != v45);
      id v45 = [obj countByEnumeratingWithState:&v78 objects:v93 count:16];
    }
    while (v45);
  }
}

- (void)removeBluetoothDriverWithAddress:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004EB0;
  v4[3] = &unk_100014798;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_removeBluetoothDriverWithAddress:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = [objc_allocWithZone((Class)MSCRODIOBluetoothElement) initWithAddress:v4];

  id v5 = v6;
  if (v6)
  {
    [(MSCRODBrailleDisplayManager *)self _removeBluetoothDriverWithIOElement:v6 removeFromPreferences:1];
    id v5 = v6;
  }
}

- (void)_removeBluetoothDriverWithIOElement:(id)a3 removeFromPreferences:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = AXLogBrailleHW();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing BT driver: %@", (uint8_t *)&buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v6)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v78 = 0x3032000000;
    long long v79 = sub_10000420C;
    long long v80 = sub_10000421C;
    id v81 = 0;
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    char v71 = 0;
    uint64_t v64 = 0;
    char v65 = &v64;
    uint64_t v66 = 0x3032000000;
    long long v67 = sub_10000420C;
    long long v68 = sub_10000421C;
    id v69 = 0;
    uint64_t v58 = 0;
    long long v59 = &v58;
    uint64_t v60 = 0x3032000000;
    id v61 = sub_10000420C;
    uint64_t v62 = sub_10000421C;
    id v63 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = sub_10000420C;
    v56[4] = sub_10000421C;
    id v57 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x2020000000;
    char v55 = 0;
    uint64_t v50 = 0;
    id v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    int v49 = 0;
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    int v46 = 2;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_10000420C;
    v43[4] = sub_10000421C;
    id v44 = 0;
    displays = self->_displays;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100005750;
    v41[3] = &unk_100014810;
    id v9 = v6;
    id v42 = v9;
    id v10 = [(NSMutableArray *)displays indexOfObjectPassingTest:v41];
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL && v10 < [(NSMutableArray *)self->_displays count])
    {
      uint64_t v11 = [(NSMutableArray *)self->_displays objectAtIndexedSubscript:v10];
      v12 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v11;

      uint64_t v13 = *(NSObject **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005794;
      block[3] = &unk_100014838;
      void block[4] = self;
      p_long long buf = &buf;
      v31 = &v50;
      v32 = v56;
      id v33 = v54;
      uint64_t v34 = v48;
      v35 = v47;
      v36 = v45;
      unsigned __int8 v37 = v43;
      id v38 = v70;
      id v29 = v9;
      v39 = &v64;
      uint64_t v40 = &v58;
      dispatch_sync(v13, block);
      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        -[NSMutableArray removeObject:](self->_displays, "removeObject:");
        uint64_t v14 = AXLogBrailleHW();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
          LODWORD(v74) = 138412290;
          *(void *)((char *)&v74 + 4) = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing BT display: %@", (uint8_t *)&v74, 0xCu);
        }

        *(void *)&long long v74 = 0;
        *((void *)&v74 + 1) = &v74;
        uint64_t v75 = 0x2020000000;
        uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
        unsigned int v16 = [*(id *)(*((void *)&buf + 1) + 40) configuration];
        id v17 = +[AXSettings sharedInstance];
        id v18 = [v17 voiceOverBrailleDisplays];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100005A38;
        v25[3] = &unk_100014860;
        v25[4] = self;
        id v19 = v16;
        id v26 = v19;
        v27 = &v74;
        [v18 enumerateObjectsUsingBlock:v25];

        if (v4 && *(void *)(*((void *)&v74 + 1) + 24) != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v20 = +[AXSettings sharedInstance];
          uint64_t v21 = [v20 voiceOverBrailleDisplays];
          id v22 = [v21 mutableCopy];

          [v22 removeObjectAtIndex:*(void *)(*((void *)&v74 + 1) + 24)];
          unsigned __int8 v23 = +[AXSettings sharedInstance];
          [v23 setVoiceOverBrailleDisplays:v22];

          unsigned int v24 = AXLogBrailleHW();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v72 = 138412290;
            id v73 = v19;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removed display from list: %@", v72, 0xCu);
          }
        }
        [*(id *)(*((void *)&buf + 1) + 40) invalidate];
        if (*((unsigned char *)v51 + 24))
        {
          _updateNewlyActiveDisplay();
        }
        else
        {
          [(MSCRODBrailleDisplayManager *)self setUIDisplayMode];
          [(MSCRODBrailleDisplayManager *)self performSelector:"_loadStealthDisplay" withObject:0 afterDelay:0.0];
        }

        _Block_object_dispose(&v74, 8);
      }
      [(id)v65[5] handleBrailleDriverDisconnected];
      [(id)v59[5] configurationDidChange];
    }
    _Block_object_dispose(v43, 8);

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v48, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(v54, 8);
    _Block_object_dispose(v56, 8);

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(v70, 8);
    _Block_object_dispose(&buf, 8);
  }
}

- (id)driverConfiguration
{
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue]);
  v6.receiver = self;
  v6.super_class = (Class)MSCRODBrailleDisplayManager;
  id v3 = [(MSCRODBrailleDisplayManager *)&v6 driverConfiguration];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B5C;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  return v3;
}

- (BOOL)_brailleConfigMatch:(id)a3 withConfig:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress];
  id v8 = [v6 objectForKeyedSubscript:kSCROBrailleDisplayBluetoothAddress];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId];
    v12 = [v6 objectForKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId];
    unsigned __int8 v10 = [v11 isEqualToString:v12];
  }
  return v10;
}

- (void)_saveBluetoothDisplayConfiguration:(id)a3
{
  id v4 = [a3 mutableCopyWithZone:0];
  [v4 removeObjectForKey:kSCROBrailleDisplayToken];
  id v20 = v4;
  id v5 = [v4 copyWithZone:0];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = +[AXSettings sharedInstance];
  uint64_t v7 = [v6 voiceOverBrailleDisplays];
  id v8 = [v7 mutableCopy];

  if (!v8)
  {
    id v8 = +[NSMutableArray array];
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000060B0;
  v25[3] = &unk_100014860;
  v25[4] = self;
  id v9 = v5;
  id v26 = v9;
  v27 = &v28;
  [v8 enumerateObjectsUsingBlock:v25];
  uint64_t v10 = v29[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    [v8 addObject:v9];
  }
  else {
    [v8 replaceObjectAtIndex:v10 withObject:v9];
  }
  uint64_t v11 = +[AXSettings sharedInstance];
  [v11 setVoiceOverBrailleDisplays:v8];

  v12 = AXLogBrailleHW();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Saving VO braille configs: %@", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v19 = AXLogBrailleHW();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v34 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "-- Braille configs: %@", buf, 0xCu);
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }
    while (v15);
  }

  _Block_object_dispose(&v28, 8);
}

- (BOOL)isConfigured
{
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue]);
  v6.receiver = self;
  v6.super_class = (Class)MSCRODBrailleDisplayManager;
  BOOL v3 = [(MSCRODBrailleDisplayManager *)&v6 isConfigured];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061C0;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return v3;
}

- (BOOL)_registerSleepNotifications
{
  p_sleepWake = &self->_sleepWake;
  p_notifyPortRef = &self->_sleepWake.notifyPortRef;
  io_connect_t v4 = IORegisterForSystemPower(0, &self->_sleepWake.notifyPortRef, (IOServiceInterestCallback)sub_100006358, &self->_sleepWake.notifierObject);
  p_sleepWake->rootPort = v4;
  if (v4)
  {
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPortRef);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
  }
  else
  {
    NSLog(@"Error: IORegisterForSystemPower failed");
  }
  return v4 != 0;
}

- (unsigned)_rootPowerPort
{
  return self->_sleepWake.rootPort;
}

- (void)setLastUserInteractionTime:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSCRODBrailleDisplayManager;
  [(MSCRODBrailleDisplayManager *)&v7 setLastUserInteractionTime:a3];
  io_connect_t v4 = AXLogBrailleHW();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000D474(self, v4);
  }

  if ([(MSCRODBrailleDisplayManager *)self isBrailleSystemSleeping])
  {
    id v5 = AXLogBrailleHW();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received user interaction but system was asleep - rewaking", buf, 2u);
    }

    AXPerformBlockOnMainThreadAfterDelay();
  }
}

- (BOOL)_hasUserInteractedWithDeviceRecently
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(MSCRODBrailleDisplayManager *)self lastUserInteractionTime];
  double v5 = Current - v4;
  objc_super v6 = AXLogBrailleHW();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Last interaction time happened: %f", (uint8_t *)&v8, 0xCu);
  }

  return v5 < 2.0;
}

- (BOOL)_hasActiveDisplay
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = self->_displays;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
      int v8 = *(NSObject **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100006884;
      block[3] = &unk_100014888;
      void block[5] = v7;
      block[6] = &v16;
      void block[4] = self;
      dispatch_sync(v8, block);
      if (*((unsigned char *)v17 + 24)) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  char v9 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)_reallyDelayedWakeFromSleep
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v3 = AXLogBrailleHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Processing wake from sleep to auto detect", buf, 2u);
  }

  if ([(MSCRODBrailleDisplayManager *)self _hasActiveDisplay])
  {
    id v4 = *(NSObject **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000069DC;
    block[3] = &unk_100014770;
    void block[4] = self;
    dispatch_async(v4, block);
  }
  [(MSCRODBrailleDisplayManager *)self _enableAutoDetect];
  [(MSCRODBrailleDisplayManager *)self powerChangedNotification:0];
  [0 configurationDidChange];
  [(MSCRODBrailleDisplayManager *)self setIsBrailleSystemSleeping:0];
}

- (void)_delayedWakeFromSleep
{
}

- (void)_wakeFromSleep
{
}

- (void)_delayedHandleSystemSleep
{
  BOOL v3 = AXLogBrailleHW();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handled system sleep in Braille", buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reallyDelayedWakeFromSleep" object:0];
  [(MSCRODBrailleDisplayManager *)self _disableAutoDetect];
  unsigned int v4 = [(MSCRODBrailleDisplayManager *)self _hasActiveDisplay];
  uint64_t v5 = *(NSObject **)&self->SCROBrailleDisplayManager_opaque[OBJC_IVAR___SCROBrailleDisplayManager__eventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006F00;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async(v5, block);
  if (v4)
  {
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.25, 0);
    if (_AXSVoiceOverTouchBrailleDisplayDisconnectOnSleep())
    {
      uint64_t v6 = AXLogBrailleHW();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        displays = self->_displays;
        *(_DWORD *)long long buf = 138412290;
        v27 = displays;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "In _delayedHandleSystemSleep: remove certain drivers in _displays: %@", buf, 0xCu);
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = [(NSMutableArray *)self->_displays copy];
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v9)
      {
        id v11 = v9;
        uint64_t v12 = *(void *)v21;
        *(void *)&long long v10 = 138412290;
        long long v19 = v10;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v8);
            }
            long long v14 = *(NSMutableArray **)(*((void *)&v20 + 1) + 8 * i);
            if (([(NSMutableArray *)v14 requiresPersistentConnection] & 1) == 0)
            {
              long long v15 = [(NSMutableArray *)v14 ioElement];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                id v17 = [(NSMutableArray *)v14 ioElement];
                [(MSCRODBrailleDisplayManager *)self _removeBluetoothDriverWithIOElement:v17 removeFromPreferences:0];

                uint64_t v18 = AXLogBrailleHW();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = v19;
                  v27 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Call _removeBluetoothDriverWithIOElement for Display: %@", buf, 0xCu);
                }
              }
            }
          }
          id v11 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v11);
      }
    }
  }
  else
  {
    +[NSThread sleepForTimeInterval:0.25];
  }
  [(MSCRODBrailleDisplayManager *)self setIsBrailleSystemSleeping:1];
}

- (void)_handleSystemSleep
{
}

- (void)_updateScreenUILock:(int)a3 screenBlank:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = sub_1000074C4();
  id v8 = _SCROD_LOG();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithInt:v5];
    long long v10 = +[NSNumber numberWithInt:v4];
    id v11 = +[NSNumber numberWithBool:v7];
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating system ui lock status: %@, screen blank status: %@, system lock: %@", buf, 0x20u);
  }
  self->_BOOL isScreenUILocked = v5 != 0;
  self->_isScreenBlank = v4 != 0;
  BOOL isScreenUILocked = self->_isScreenUILocked;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  if (!v4) {
    BOOL isScreenUILocked = 0;
  }
  int v13 = isScreenUILocked & v7;
  LOBYTE(v26) = v13;
  if (byte_100019C30 != 1 || self->_isInDisconnectedState != v13)
  {
    long long v14 = _SCROD_LOG();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = +[NSNumber numberWithBool:byte_100019C30];
      uint64_t v16 = +[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
      id v17 = +[NSNumber numberWithBool:self->_isInDisconnectedState];
      *(_DWORD *)long long v19 = 138412802;
      long long v20 = v15;
      __int16 v21 = 2112;
      long long v22 = v16;
      __int16 v23 = 2112;
      long long v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initialized: %@, should disconnected %@, is disconnected: %@", v19, 0x20u);
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
    else
    {
      [(MSCRODBrailleDisplayManager *)self _wakeFromSleep];
      uint64_t v18 = _SCROD_LOG();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Braille Device: Waking", v19, 2u);
      }
    }
    byte_100019C30 = 1;
    self->_isInDisconnectedState = *(unsigned char *)(*(void *)&buf[8] + 24);
  }
  _Block_object_dispose(buf, 8);
}

- (void)_registerHasBlankedScreenNotification
{
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100007B34;
  v26[3] = &unk_1000148D8;
  objc_copyWeak(&v27, &location);
  BOOL v3 = objc_retainBlock(v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100007C3C;
  v24[3] = &unk_1000148D8;
  objc_copyWeak(&v25, &location);
  uint64_t v4 = objc_retainBlock(v24);
  long long v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  __int16 v21 = sub_100007D4C;
  long long v22 = &unk_1000148D8;
  objc_copyWeak(&v23, &location);
  uint64_t v5 = objc_retainBlock(&v19);
  p_keybagLockStateToken = &self->_keybagLockStateToken;
  id v7 = &_dispatch_main_q;
  BOOL v8 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_keybagLockStateToken, (dispatch_queue_t)&_dispatch_main_q, v3) == 0;

  if (v8)
  {
    ((void (*)(void *, void))v3[2])(v3, *p_keybagLockStateToken);
    id v9 = AXLogBrailleHW();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *p_keybagLockStateToken, v19, v20, v21, v22);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered keybag lock state: %@ %@", buf, 0x16u);
    }
  }
  else
  {
    int *p_keybagLockStateToken = -1;
  }
  p_notifyLockStateToken = &self->_notifyLockStateToken;
  BOOL v12 = notify_register_dispatch("com.apple.springboard.lockstate", &self->_notifyLockStateToken, (dispatch_queue_t)&_dispatch_main_q, v4) == 0;

  if (v12)
  {
    ((void (*)(void *, void))v4[2])(v4, *p_notifyLockStateToken);
    int v13 = AXLogBrailleHW();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = +[NSNumber numberWithInt:*p_notifyLockStateToken];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Registered lock state: %@ %@", buf, 0x16u);
    }
  }
  else
  {
    int *p_notifyLockStateToken = -1;
  }
  p_blankScreenToken = &self->_blankScreenToken;
  BOOL v16 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &self->_blankScreenToken, (dispatch_queue_t)&_dispatch_main_q, v5) == 0;

  if (v16)
  {
    ((void (*)(void ***, void))v5[2])(v5, *p_blankScreenToken);
    id v17 = AXLogBrailleHW();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = +[NSNumber numberWithInt:*p_blankScreenToken];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Registered blank screen state: %@ %@", buf, 0x16u);
    }
  }
  else
  {
    int *p_blankScreenToken = -1;
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)airplaneModeChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007ED0;
  block[3] = &unk_100014770;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)newBrailleDisplayCommandDispatcher
{
  id v2 = objc_allocWithZone((Class)SCROBrailleDisplayCommandDispatcher);

  return [v2 init];
}

- (id)brailleInputManager
{
  return +[SCROMobileBrailleDisplayInputManager sharedManager];
}

- (void)addToDisplays:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008020;
  v4[3] = &unk_100014798;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (BOOL)airplaneMode
{
  return self->_airplaneMode;
}

- (void)setAirplaneMode:(BOOL)a3
{
  self->_airplaneMode = a3;
}

- (RadiosPreferences)radiosPrefs
{
  return self->_radiosPrefs;
}

- (void)setRadiosPrefs:(id)a3
{
}

- (BOOL)isBrailleSystemSleeping
{
  return self->_isBrailleSystemSleeping;
}

- (void)setIsBrailleSystemSleeping:(BOOL)a3
{
  self->_isBrailleSystemSleeping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radiosPrefs, 0);

  objc_storeStrong((id *)&self->_displays, 0);
}

@end