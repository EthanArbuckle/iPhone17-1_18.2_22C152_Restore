@interface AVExternalDevice
+ (id)currentCarPlayExternalDevice;
+ (id)currentExternalDevice;
+ (id)sharedLocalDevice;
- (AVExternalDevice)init;
- (AVExternalDevice)initWithFigEndpoint:(OpaqueFigEndpoint *)a3;
- (AVExternalDeviceDelegate)delegate;
- (BOOL)OEMIconVisible;
- (BOOL)limitedUI;
- (BOOL)nightMode;
- (BOOL)nightModeSupported;
- (BOOL)ownsScreen;
- (BOOL)ownsTurnByTurnNavigation;
- (BOOL)recognizingSpeech;
- (BOOL)rightHandDrive;
- (NSArray)OEMIcons;
- (NSArray)externalDeviceHIDs;
- (NSArray)limitedUIElements;
- (NSArray)screenIDs;
- (NSArray)supportedFeatures;
- (NSData)MFiCertificateSerialNumber;
- (NSData)OEMIcon;
- (NSDictionary)screenInputCapabilities;
- (NSDictionary)screenPrimaryInputDevices;
- (NSDictionary)screenSafeAreas;
- (NSDictionary)screenViewAreas;
- (NSString)ID;
- (NSString)OEMIconLabel;
- (NSString)modelName;
- (NSString)name;
- (OpaqueFigEndpoint)figEndpoint;
- (id)_figEndpointPropertyValueForKey:(__CFString *)a3;
- (id)_screenInfo;
- (id)_weakReference;
- (id)borrowScreenForClient:(id)a3 reason:(id)a4;
- (id)externalDeviceHIDWithUUID:(id)a3;
- (id)requestTurnByTurnNavigationOwnership;
- (int64_t)electronicTollCollection;
- (int64_t)navigationAidedDriving;
- (int64_t)transportType;
- (void)_triggerFakeNotificationNamed:(id)a3 withPayload:(id)a4;
- (void)dealloc;
- (void)requestCarUI;
- (void)requestCarUIForURL:(id)a3;
- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4;
- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4;
- (void)sendCommand:(id)a3 withParameters:(id)a4;
- (void)setDelegate:(id)a3;
- (void)takeScreenForClient:(id)a3 reason:(id)a4;
- (void)takeScreenForConnection;
@end

@implementation AVExternalDevice

+ (id)currentCarPlayExternalDevice
{
  return 0;
}

+ (id)currentExternalDevice
{
  return +[AVExternalDevice currentCarPlayExternalDevice];
}

+ (id)sharedLocalDevice
{
  v2 = [[AVExternalDevice alloc] initWithFigEndpoint:0];
  return v2;
}

- (AVExternalDevice)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVExternalDevice;
  v2 = [(AVExternalDevice *)&v4 init];
  if (v2)
  {
    v2->_externalDevice = objc_alloc_init(AVExternalDeviceInternal);
    v2->_externalDevice->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:v2];
    v2->_externalDevice->_currentViewAreas = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (AVExternalDevice)initWithFigEndpoint:(OpaqueFigEndpoint *)a3
{
  objc_super v4 = [(AVExternalDevice *)self init];
  if (v4)
  {
    v4->_externalDevice->_makeHIDsOnlyOnce = objc_alloc_init(AVDispatchOnce);
    v4->_externalDevice->_makeIconsOnlyOnce = objc_alloc_init(AVDispatchOnce);
    if (a3) {
      v5 = (OpaqueFigEndpoint *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_externalDevice->_figEndpoint = v5;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_externalDevice->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVFoundation.AVExternalDevice", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_externalDevice->_viewAreasQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVFoundation.AVExternalDevice.ViewAreas", v7);
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
    v8 = v4;
    viewAreasQueue = v4->_externalDevice->_viewAreasQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVExternalDevice_initWithFigEndpoint___block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = v4;
    dispatch_async(viewAreasQueue, block);
  }
  return v4;
}

void __40__AVExternalDevice_initWithFigEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = (void *)[*(id *)(a1 + 32) screenIDs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8);
        if (v7)
        {
          uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          FigEndpointExtendedGetClassID();
          if (CMBaseObjectIsMemberOfClass())
          {
            CFTypeRef cf = 0;
            uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 24);
            if (v9) {
              uint64_t v10 = v9;
            }
            else {
              uint64_t v10 = 0;
            }
            v11 = *(void (**)(uint64_t, uint64_t, CFTypeRef *))(v10 + 120);
            if (v11) {
              v11(v7, v8, &cf);
            }
            if (cf)
            {
              [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 88) setObject:cf forKeyedSubscript:v8];
              if (cf) {
                CFRelease(cf);
              }
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (id)_weakReference
{
  return self->_externalDevice->_weakReference;
}

- (void)dealloc
{
  externalDevice = self->_externalDevice;
  if (externalDevice)
  {

    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    uint64_t v4 = self->_externalDevice;
    figEndpoint = v4->_figEndpoint;
    if (figEndpoint)
    {
      CFRelease(figEndpoint);
      self->_externalDevice->_figEndpoint = 0;
      uint64_t v4 = self->_externalDevice;
    }

    v6 = (dispatch_object_t *)self->_externalDevice;
    if (v6[7])
    {
      dispatch_release(v6[7]);
      self->_externalDevice->_queue = 0;
      v6 = (dispatch_object_t *)self->_externalDevice;
    }
    if (v6[10])
    {
      dispatch_release(v6[10]);
      self->_externalDevice->_viewAreasQueue = 0;
      v6 = (dispatch_object_t *)self->_externalDevice;
    }
    CFRelease(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVExternalDevice;
  [(AVExternalDevice *)&v7 dealloc];
}

- (AVExternalDeviceDelegate)delegate
{
  return self->_externalDevice->_delegate;
}

- (void)setDelegate:(id)a3
{
  externalDevice = self->_externalDevice;
  if (externalDevice->_delegate != a3)
  {
    externalDevice->_delegate = (AVExternalDeviceDelegate *)a3;
    v6 = self;
    viewAreasQueue = self->_externalDevice->_viewAreasQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__AVExternalDevice_setDelegate___block_invoke;
    v8[3] = &unk_1E57B2098;
    v8[4] = a3;
    v8[5] = self;
    dispatch_async(viewAreasQueue, v8);
  }
}

void __32__AVExternalDevice_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector())
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v2 = objc_msgSend(*(id *)(a1 + 40), "screenIDs", 0);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v10 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
            uint64_t v8 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 88) objectForKeyedSubscript:v7];
            if (v8) {
              objc_msgSend(*(id *)(a1 + 32), "setViewAreaIndex:andAdjacentViewAreas:forScreenID:", objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"viewAreaIndex"), "integerValue"), objc_msgSend(v8, "objectForKeyedSubscript:", @"adjacentViewAreas"), v7);
            }
          }
          uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v4);
      }
    }
  }
}

- (id)_figEndpointPropertyValueForKey:(__CFString *)a3
{
  long long v10 = 0;
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(uint64_t, __CFString *, void, OpaqueFigEndpoint **))(v7 + 48);
    if (v8)
    {
      v8(CMBaseObject, a3, *MEMORY[0x1E4F1CF80], &v10);
      figEndpoint = v10;
    }
    else
    {
      figEndpoint = 0;
    }
  }
  return figEndpoint;
}

- (id)_screenInfo
{
  queue = self->_externalDevice->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVExternalDevice__screenInfo__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_externalDevice->_screenInfo;
}

void *__31__AVExternalDevice__screenInfo__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!*(void *)(result[1] + 72))
  {
    result = objc_msgSend((id)objc_msgSend(result, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E4F20F80]), "copy");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 72) = result;
  }
  return result;
}

- (NSArray)screenIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(AVExternalDevice *)self _screenInfo];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = *MEMORY[0x1E4F21168];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) objectForKey:v8];
        if (v10) {
          [(NSArray *)v3 addObject:v10];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)screenViewAreas
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(AVExternalDevice *)self _screenInfo];
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    uint64_t v19 = *MEMORY[0x1E4F21168];
    uint64_t v18 = *MEMORY[0x1E4F211C0];
    uint64_t v4 = *MEMORY[0x1E4F211E0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v7 = [v6 objectForKey:v19];
        if (v7)
        {
          uint64_t v8 = v7;
          -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F1CA48] array], v7);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v9 = (void *)[v6 objectForKey:v18];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                memset(&rect, 0, sizeof(rect));
                CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v14 objectForKeyedSubscript:v4], &rect);
                id v15 = [(NSDictionary *)v3 objectForKeyedSubscript:v8];
                objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
  return v3;
}

- (NSDictionary)screenSafeAreas
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(AVExternalDevice *)self _screenInfo];
  uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    uint64_t v19 = *MEMORY[0x1E4F21168];
    uint64_t v18 = *MEMORY[0x1E4F211C0];
    uint64_t v4 = *MEMORY[0x1E4F211D0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v7 = [v6 objectForKey:v19];
        if (v7)
        {
          uint64_t v8 = v7;
          -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F1CA48] array], v7);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v9 = (void *)[v6 objectForKey:v18];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                memset(&rect, 0, sizeof(rect));
                CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v14 objectForKeyedSubscript:v4], &rect);
                id v15 = [(NSDictionary *)v3 objectForKeyedSubscript:v8];
                objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
  return v3;
}

- (NSString)ID
{
  return (NSString *)[(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E38]];
}

- (NSString)name
{
  if (self->_externalDevice->_figEndpoint) {
    return (NSString *)[(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F28]];
  }
  else {
    return (NSString *)@"My Device";
  }
}

- (NSDictionary)screenInputCapabilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AVExternalDevice *)self _screenInfo];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x1E4F21168];
    uint64_t v9 = *MEMORY[0x1E4F21178];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKey:v8];
        uint64_t v13 = [v11 objectForKey:v9];
        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14) {
          [(NSDictionary *)v3 setObject:v13 forKey:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)screenPrimaryInputDevices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(AVExternalDevice *)self _screenInfo];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F211B0];
    uint64_t v9 = *MEMORY[0x1E4F21168];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKey:v8];
        if (v12) {
          -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v12, [v11 objectForKey:v9]);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSArray)externalDeviceHIDs
{
  makeHIDsOnlyOnce = self->_externalDevice->_makeHIDsOnlyOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__AVExternalDevice_externalDeviceHIDs__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)makeHIDsOnlyOnce runBlockOnce:v5];
  return self->_externalDevice->_HIDs;
}

uint64_t __38__AVExternalDevice_externalDeviceHIDs__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20E10]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [[AVExternalDeviceHID alloc] initWithExternalDeviceAndHIDDictionary:*(void *)(a1 + 32) hidDictionary:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        if (v8)
        {
          uint64_t v9 = v8;
          [v2 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  uint64_t result = [v2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (id)externalDeviceHIDWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVExternalDevice *)self externalDeviceHIDs];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_4:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "UUID"), "isEqualToString:", a3)) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 0;
      if (v7) {
        goto LABEL_4;
      }
      return v10;
    }
  }
}

- (NSData)OEMIcon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(AVExternalDevice *)self OEMIcons];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = (NSData *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
        if (([v7 isPrerendered] & 1) == 0) {
          return (NSData *)[v7 imageData];
        }
        uint64_t v6 = (NSData *)((char *)v6 + 1);
      }
      while (v4 != v6);
      uint64_t result = (NSData *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (NSArray)OEMIcons
{
  makeIconsOnlyOnce = self->_externalDevice->_makeIconsOnlyOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__AVExternalDevice_OEMIcons__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)makeIconsOnlyOnce runBlockOnce:v5];
  return self->_externalDevice->_oemIcons;
}

uint64_t __28__AVExternalDevice_OEMIcons__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F48]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = [[AVExternalDeviceIcon alloc] initWithDictionary:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
        if (v8) {
          [v2 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  uint64_t result = [v2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 64) = result;
  return result;
}

- (NSString)OEMIconLabel
{
  return (NSString *)[(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F38]];
}

- (BOOL)OEMIconVisible
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F40]];
  return [v2 BOOLValue];
}

- (NSString)modelName
{
  return (NSString *)[(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F18]];
}

- (BOOL)nightMode
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F30]];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (BOOL)nightModeSupported
{
  return [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F30]] != 0;
}

- (BOOL)rightHandDrive
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20F70]];
  if (v2)
  {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  return (char)v2;
}

- (NSArray)limitedUIElements
{
  uint64_t result = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20EE0]];
  if (!result)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v3 array];
  }
  return result;
}

- (BOOL)limitedUI
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20ED8]];
  return [v2 BOOLValue];
}

- (BOOL)ownsTurnByTurnNavigation
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D28]];
  return [v2 BOOLValue];
}

- (BOOL)ownsScreen
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D40]];
  return [v2 BOOLValue];
}

- (BOOL)recognizingSpeech
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20D30]];
  return [v2 BOOLValue];
}

- (NSArray)supportedFeatures
{
  return (NSArray *)[(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F20DB0]];
}

- (int64_t)electronicTollCollection
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21070]];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = (void *)[v2 valueForKey:*MEMORY[0x1E4F21598]];
  if (!v3) {
    return 1;
  }
  if (objc_msgSend((id)objc_msgSend(v3, "valueForKey:", @"active"), "BOOLValue")) {
    return 2;
  }
  return 3;
}

- (int64_t)navigationAidedDriving
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21070]];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = (void *)[v2 valueForKey:*MEMORY[0x1E4F215A0]];
  if (!v3) {
    return 1;
  }
  if (objc_msgSend((id)objc_msgSend(v3, "valueForKey:", @"active"), "BOOLValue")) {
    return 2;
  }
  return 3;
}

- (int64_t)transportType
{
  id v2 = [(AVExternalDevice *)self _figEndpointPropertyValueForKey:*MEMORY[0x1E4F21040]];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  if (([v2 isEqualToString:*MEMORY[0x1E4F21528]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F21540]] & 1) != 0)
  {
    return 3;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F21530]]) {
    return 2;
  }
  return ([v3 isEqualToString:*MEMORY[0x1E4F21538]] & 1) != 0;
}

- (NSData)MFiCertificateSerialNumber
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3052000000;
  long long v10 = __Block_byref_object_copy__42;
  long long v11 = __Block_byref_object_dispose__42;
  uint64_t v12 = 0;
  queue = self->_externalDevice->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVExternalDevice_MFiCertificateSerialNumber__block_invoke;
  v6[3] = &unk_1E57B2160;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v3 = (id)v8[5];
  if (!v3)
  {
    id v3 = (id)[MEMORY[0x1E4F1C9B8] data];
    v8[5] = (uint64_t)v3;
  }
  uint64_t v4 = (NSData *)v3;
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __46__AVExternalDevice_MFiCertificateSerialNumber__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (!v2)
  {
    uint64_t v12 = 0;
    CFTypeRef cf = 0;
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v5 + 48);
    if (v6) {
      v6(CMBaseObject, *MEMORY[0x1E4F20D00], 0, &cf);
    }
    if (FigCFEqual() || FigCFEqual())
    {
      uint64_t v7 = FigEndpointGetCMBaseObject();
      uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v9 = v8 ? v8 : 0;
      long long v10 = *(void (**)(uint64_t, void, void, uint64_t *))(v9 + 48);
      if (v10)
      {
        v10(v7, *MEMORY[0x1E4F20CF8], 0, &v12);
        if (v12) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = v12;
        }
      }
    }
    if (cf) {
      CFRelease(cf);
    }
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  }
  id result = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)requestCarUI
{
}

- (void)requestCarUIForURL:(id)a3
{
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v8 = v7 ? v7 : 0;
      uint64_t v9 = *(void (**)(OpaqueFigEndpoint *, id, id))(v8 + 8);
      if (v9)
      {
        v9(figEndpoint, a4, a3);
      }
    }
  }
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v8 = v7 ? v7 : 0;
      uint64_t v9 = *(void (**)(OpaqueFigEndpoint *, id, int64_t))(v8 + 112);
      if (v9)
      {
        v9(figEndpoint, a4, a3);
      }
    }
  }
}

- (id)requestTurnByTurnNavigationOwnership
{
  id v2 = [[AVExternalDeviceTurnByTurnToken alloc] initWithExternalDevice:self];
  return v2;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  uint64_t v4 = [[AVExternalDeviceScreenBorrowToken alloc] initWithExternalDevice:self client:a3 reason:a4];
  return v4;
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v8 = v7 ? v7 : 0;
      uint64_t v9 = *(void (**)(OpaqueFigEndpoint *, id, id))(v8 + 32);
      if (v9)
      {
        v9(figEndpoint, a3, a4);
      }
    }
  }
}

- (void)takeScreenForConnection
{
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v4 = v3 ? v3 : 0;
      uint64_t v5 = *(void (**)(OpaqueFigEndpoint *, __CFString *, __CFString *))(v4 + 32);
      if (v5)
      {
        v5(figEndpoint, @"com.apple.springboard", @"InitialCarPlayConnection");
      }
    }
  }
}

- (void)sendCommand:(id)a3 withParameters:(id)a4
{
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v8 = v7 ? v7 : 0;
      uint64_t v9 = *(void (**)(OpaqueFigEndpoint *, id, id, void, void))(v8 + 72);
      if (v9)
      {
        v9(figEndpoint, a3, a4, 0, 0);
      }
    }
  }
}

- (void)_triggerFakeNotificationNamed:(id)a3 withPayload:(id)a4
{
  if ([a3 isEqualToString:@"ExternalDevice_ScreenBecameUnavailable"])
  {
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    long long v14 = *(void (**)(uint64_t, __CFString *, uint64_t))(v8 + 56);
    if (v14)
    {
      uint64_t v15 = @"TestTakeScreenAway";
      uint64_t v16 = CMBaseObject;
      uint64_t v17 = 0;
LABEL_14:
      v14(v16, v15, v17);
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    if (!a4) {
      a4 = (id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    uint64_t v10 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", a3, @"name", a4, @"payload", 0);
    uint64_t v11 = FigEndpointGetCMBaseObject();
    uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    long long v14 = *(void (**)(uint64_t, __CFString *, uint64_t))(v13 + 56);
    if (v14)
    {
      uint64_t v15 = @"TestNotification";
      uint64_t v16 = v11;
      uint64_t v17 = v10;
      goto LABEL_14;
    }
  }
}

- (OpaqueFigEndpoint)figEndpoint
{
  return self->_externalDevice->_figEndpoint;
}

@end