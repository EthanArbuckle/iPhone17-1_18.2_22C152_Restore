@interface MacOSTrackpadHIDEventProcessor
- (BOOL)checkForMomentumCancellation:(id)a3;
- (BOOL)checkForMomentumInitiation:(id)a3 triggerEvent:(id)a4;
- (BOOL)shouldDispatchEvent:(id)a3;
- (MacOSTrackpadHIDEventProcessor)initWithDeviceID:(unint64_t)a3;
- (id)debugDictionary;
- (id)getMomentumEnableEvent:(id)a3;
- (id)handleHIDEvent:(id)a3;
- (void)_handleMomentumStateEvent:(id)a3;
- (void)appendDeviceInfoTo:(id)a3;
- (void)cancelMomentum;
- (void)handleConsume:(id)a3;
- (void)startMomentumWithSubtype:(int)a3 event:(id)a4;
@end

@implementation MacOSTrackpadHIDEventProcessor

- (MacOSTrackpadHIDEventProcessor)initWithDeviceID:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MacOSTrackpadHIDEventProcessor;
  v3 = [(TrackpadHIDEventProcessor *)&v7 initWithDeviceID:a3];
  v4 = v3;
  if (v3)
  {
    v3->_momentumActive = 0;
    v3->_momentumDragButton = 0;
    v3->_momentumSubtype = 1;
    v5 = v3;
  }

  return v4;
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(MacOSTrackpadHIDEventProcessor *)self _handleMomentumStateEvent:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MacOSTrackpadHIDEventProcessor;
    [(TrackpadHIDEventProcessor *)&v6 handleConsume:v4];
  }
}

- (id)handleHIDEvent:(id)a3
{
  id v44 = a3;
  id v46 = (id)objc_opt_new();
  if ([v44 type] != 11)
  {
    id v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v53 = "[Error] ";
      __int16 v54 = 2080;
      v55 = "";
      __int16 v56 = 2080;
      v57 = "-[MacOSTrackpadHIDEventProcessor handleHIDEvent:]";
      __int16 v58 = 1024;
      unsigned int v59 = [v44 type];
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected event type: %u Eating it.", buf, 0x26u);
    }
    goto LABEL_12;
  }
  if ([v44 integerValueForField:720918] != (char *)&def_411C8 + 1)
  {
    id v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v53 = "[Error] ";
      __int16 v54 = 2080;
      v55 = "";
      __int16 v56 = 2080;
      v57 = "-[MacOSTrackpadHIDEventProcessor handleHIDEvent:]";
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected non-collection digitizer event. Eating it.", buf, 0x20u);
    }
    goto LABEL_12;
  }
  id v4 = [v44 parent];

  if (v4)
  {
    id v5 = MTLoggingPlugin();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v53 = "[Error] ";
      __int16 v54 = 2080;
      v55 = "";
      __int16 v56 = 2080;
      v57 = "-[MacOSTrackpadHIDEventProcessor handleHIDEvent:]";
      _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Unexpected child digitizer event. Eating it.", buf, 0x20u);
    }
LABEL_12:

    objc_super v6 = v46;
    id v7 = v46;
    goto LABEL_13;
  }
  id v9 = v44;
  unsigned __int8 v10 = [v9 conformsToEventType:2];
  unsigned __int8 v11 = [v9 conformsToEventType:3];
  unsigned __int8 v12 = [(MacOSTrackpadHIDEventProcessor *)self checkForMomentumCancellation:v9];
  v13 = [v9 children];
  id v14 = [v13 copy];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v16) {
    goto LABEL_51;
  }
  char v17 = 0;
  uint64_t v18 = *(void *)v48;
  char v45 = v12 | (v10 | v11) ^ 1;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v48 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      if ([v20 type] == 17)
      {
        [v20 doubleValueForField:1114112];
        double v22 = v21;
        [v20 doubleValueForField:1114113];
        double v24 = v23;
        if (![(MacOSTrackpadHIDEventProcessor *)self checkForMomentumInitiation:v9 triggerEvent:v20]&& ![(TrackpadHIDEventProcessor *)self noPointing])
        {
          id v25 = (id)[(TrackpadHIDEventProcessor *)self previousButtonState];
          if ([(TrackpadHIDEventProcessor *)self hostClickControl]) {
            id v25 = [v20 integerValueForField:1114115];
          }
          uint64_t v26 = mach_absolute_time();
          float v27 = v22;
          float v28 = v24;
          v29 = [(TrackpadHIDEventProcessor *)self createPointingEventWithDeltaX:(int)v27 deltaY:(int)v28 buttonMask:v25 timestamp:v26];
          if (v29) {
LABEL_27:
          }
            [v46 addObject:v29];
LABEL_48:

          continue;
        }
      }
      else
      {
        if ([v20 type] == 6)
        {
          [v20 doubleValueForField:393216];
          double v31 = v30;
          [v20 doubleValueForField:393217];
          double v33 = v32;
          [v20 doubleValueForField:393218];
          double v35 = v34;
          IOHIDEventGetPhase();
          if (v17)
          {
            char v17 = 1;
            continue;
          }
          float v38 = v31;
          float v39 = v33;
          float v40 = v35;
          v29 = [(TrackpadHIDEventProcessor *)self createScrollEventWithDeltaX:(int)v38 deltaY:(int)v39 deltaZ:(int)v40 options:0];
          if (v29) {
            [v46 addObject:v29];
          }
          unsigned int v41 = [(MacOSTrackpadHIDEventProcessor *)self checkForMomentumInitiation:v9 triggerEvent:v20];
          if (v41)
          {
            v42 = [(TrackpadHIDEventProcessor *)self createScrollEventWithDeltaX:0 deltaY:0 deltaZ:0 options:0];
            if (v42)
            {
              if ([(TrackpadHIDEventProcessor *)self scrollMomentumEnabled]
                && !self->_momentumActive)
              {
                IOHIDEventSetScrollMomentum();
              }
              [v46 addObject:v42];
            }
          }
          if ((![(TrackpadHIDEventProcessor *)self gestureScrollsEnabled] | v41) == 1) {
            [v9 removeEvent:v20];
          }
          char v17 = 1;
          goto LABEL_48;
        }
        if ([v20 type] == 2)
        {
          id v36 = [v20 integerValueForField:0x20000];
          if ((v45 & 1) == 0)
          {
            id v37 = v36;
            if ([(TrackpadHIDEventProcessor *)self previousButtonState] != v36)
            {
              v29 = [(TrackpadHIDEventProcessor *)self createPointingEventWithDeltaX:0 deltaY:0 buttonMask:v37 timestamp:mach_absolute_time()];
              if (v29) {
                goto LABEL_27;
              }
              goto LABEL_48;
            }
          }
        }
      }
    }
    id v16 = [v15 countByEnumeratingWithState:&v47 objects:v51 count:16];
  }
  while (v16);
LABEL_51:

  if ([(MacOSTrackpadHIDEventProcessor *)self shouldDispatchEvent:v9])
  {
    [(MacOSTrackpadHIDEventProcessor *)self appendDeviceInfoTo:v9];
    [v46 addObject:v9];
  }
  id v43 = v46;

  objc_super v6 = v46;
LABEL_13:

  return v46;
}

- (void)_handleMomentumStateEvent:(id)a3
{
  id v4 = a3;
  self->_momentumActive = [v4 isMomentumActive];
  v5.receiver = self;
  v5.super_class = (Class)MacOSTrackpadHIDEventProcessor;
  [(TrackpadHIDEventProcessor *)&v5 handleConsume:v4];
}

- (BOOL)shouldDispatchEvent:(id)a3
{
  id v4 = a3;
  if ([(TrackpadHIDEventProcessor *)self isDigitizerCollectionHIDEvent:v4])
  {
    id v5 = [v4 integerValueForField:720903];
    unsigned __int8 v6 = [v4 integerValueForField:720920];
    LOBYTE(v7) = 1;
    if (!v5 && (v6 & 2) == 0 && (v6 & 1) == 0)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v8 = objc_msgSend(v4, "children", 0);
      id v7 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v8);
            }
            unsigned __int8 v11 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(*((void *)&v14 + 1) + 8 * i) type]);
            unsigned __int8 v12 = [&off_14A190 containsObject:v11];

            if (v12)
            {
              LOBYTE(v7) = 1;
              goto LABEL_16;
            }
          }
          id v7 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (void)appendDeviceInfoTo:(id)a3
{
  id v4 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  unint64_t v7 = [(TrackpadHIDEventProcessor *)self deviceID];
  LODWORD(v6) = 0;
  id v5 = +[HIDEvent vendorDefinedEvent:usagePage:usage:version:data:length:options:](HIDEvent, "vendorDefinedEvent:usagePage:usage:version:data:length:options:", [v4 timestamp], 65280, 6007, 1, &v7, 40, v6);
  if (v5) {
    [v4 appendEvent:v5];
  }
}

- (id)getMomentumEnableEvent:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToEventType:1])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(v3, "children", 0);
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          long long v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v9 = [v8 integerValueForField:0x10000];
          unsigned __int8 v10 = (char *)[v8 integerValueForField:65537];
          if ([v8 type] == 1 && v9 == &loc_FF00 && v10 == (unsigned char *)&def_411C8 + 1)
          {
            id v5 = v8;
            goto LABEL_19;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)checkForMomentumInitiation:(id)a3 triggerEvent:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(MacOSTrackpadHIDEventProcessor *)self getMomentumEnableEvent:a3];
  long long v8 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  id v9 = [v7 dataValueForField:65540];
  if ((uint64_t)[v8 integerValueForField:65539] < 3 || *v9 != 1) {
    goto LABEL_8;
  }
  BOOL v10 = 0;
  uint64_t v11 = v9[1];
  if (v11 <= 4 && ((1 << v11) & 0x16) != 0)
  {
    if (v9[2] == 1)
    {
      [(MacOSTrackpadHIDEventProcessor *)self cancelMomentum];
      [(MacOSTrackpadHIDEventProcessor *)self startMomentumWithSubtype:v11 event:v6];
      BOOL v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (BOOL)checkForMomentumCancellation:(id)a3
{
  id v4 = a3;
  if (self->_momentumActive)
  {
    id v5 = [(MacOSTrackpadHIDEventProcessor *)self getMomentumEnableEvent:v4];
    id v6 = v5;
    if (v5
      && (unint64_t v7 = [v5 dataValueForField:65540],
          (uint64_t)[v6 integerValueForField:65539] >= 3)
      && *v7 == 1
      && !v7[2])
    {
      BOOL v8 = 0;
      unsigned int v17 = v7[1];
      if (v17 <= 4 && ((1 << v17) & 0x16) != 0)
      {
        [(MacOSTrackpadHIDEventProcessor *)self cancelMomentum];
        BOOL v8 = 1;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    unsigned int v9 = [v4 conformsToEventType:17];
    unsigned int v10 = [v4 conformsToEventType:2];
    unsigned int v11 = [v4 conformsToEventType:3];
    if (!v8 && v9 | v10 | v11)
    {
      if (v9)
      {
        if (self->_momentumSubtype != 1
          && [v4 integerValueForField:1114115] == self->_momentumDragButton)
        {
          unsigned int v12 = [v4 integerValueForField:1114112];
          unsigned int v13 = [v4 integerValueForField:1114113];
          long long v14 = (_DWORD *)objc_opt_new();
          v14[2] = 1;
          v14[4] = v12;
          v14[5] = v13;
          long long v15 = MTLoggingPlugin();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v20 = "";
            __int16 v21 = 2080;
            double v22 = "";
            __int16 v23 = 2080;
            double v24 = "-[MacOSTrackpadHIDEventProcessor checkForMomentumCancellation:]";
            _os_log_impl(&def_411C8, v15, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Requesting to decay point / drag momentum", buf, 0x20u);
          }

          v18.receiver = self;
          v18.super_class = (Class)MacOSTrackpadHIDEventProcessor;
          [(TrackpadHIDEventProcessor *)&v18 handleConsume:v14];
        }
      }
      else
      {
        [(MacOSTrackpadHIDEventProcessor *)self cancelMomentum];
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)startMomentumWithSubtype:(int)a3 event:(id)a4
{
  id v6 = a4;
  if ([v6 type] == 6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  unint64_t v8 = v7;
  if ([v6 type] == 17) {
    unsigned int v9 = v6;
  }
  else {
    unsigned int v9 = 0;
  }
  unint64_t v10 = v9;
  if (v8 | v10
    && (!v8
     || [(TrackpadHIDEventProcessor *)self scrollMomentumEnabled]
     && [(TrackpadHIDEventProcessor *)self gestureScrollsEnabled]))
  {
    unsigned int v11 = (_DWORD *)objc_opt_new();
    unsigned int v12 = v11;
    v11[2] = 0;
    v11[3] = a3;
    if (v8)
    {
      v11[6] = 0;
      v11[4] = [(id)v8 integerValueForField:393216];
      unsigned int v13 = [(id)v8 integerValueForField:393217];
    }
    else
    {
      v11[6] = [(id)v10 integerValueForField:1114115];
      v12[4] = [(id)v10 integerValueForField:1114112];
      unsigned int v13 = [(id)v10 integerValueForField:1114113];
    }
    v12[5] = v13;
    self->_momentumDragButton = v12[6];
    self->_momentumSubtype = a3;
    long long v14 = (id *)objc_opt_new();
    objc_storeStrong(v14 + 2, v12);
    long long v15 = MTLoggingPlugin();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      objc_super v18 = "";
      __int16 v19 = 2080;
      v20 = "";
      __int16 v21 = 2080;
      double v22 = "-[MacOSTrackpadHIDEventProcessor startMomentumWithSubtype:event:]";
      _os_log_impl(&def_411C8, v15, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Requesting to start momentum", buf, 0x20u);
    }

    v16.receiver = self;
    v16.super_class = (Class)MacOSTrackpadHIDEventProcessor;
    [(TrackpadHIDEventProcessor *)&v16 handleConsume:v14];
  }
}

- (void)cancelMomentum
{
  if (self->_momentumActive)
  {
    id v3 = (_DWORD *)objc_opt_new();
    v3[2] = 2;
    id v4 = MTLoggingPlugin();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v7 = "";
      __int16 v8 = 2080;
      unsigned int v9 = "";
      __int16 v10 = 2080;
      unsigned int v11 = "-[MacOSTrackpadHIDEventProcessor cancelMomentum]";
      _os_log_impl(&def_411C8, v4, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Requesting to interrupt momentum", buf, 0x20u);
    }

    v5.receiver = self;
    v5.super_class = (Class)MacOSTrackpadHIDEventProcessor;
    [(TrackpadHIDEventProcessor *)&v5 handleConsume:v3];
  }
}

- (id)debugDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)MacOSTrackpadHIDEventProcessor;
  id v3 = [(TrackpadHIDEventProcessor *)&v9 debugDictionary];
  id v4 = [v3 mutableCopy];

  objc_super v5 = +[NSNumber numberWithBool:self->_momentumActive];
  [v4 setObject:v5 forKeyedSubscript:@"MomentumActive"];

  id v6 = +[NSNumber numberWithInt:self->_momentumDragButton];
  [v4 setObject:v6 forKeyedSubscript:@"MomentumDragButton"];

  unint64_t v7 = +[NSNumber numberWithUnsignedInt:self->_momentumSubtype];
  [v4 setObject:v7 forKeyedSubscript:@"MomentumSubType"];

  return v4;
}

@end