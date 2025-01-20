@interface CARInputDeviceManager
- (BOOL)touchpadCharacterRecognitionSupported;
- (CARInputDeviceManager)initWithEndpointInputDevices:(id)a3 screenIDs:(id)a4 vehicleInformation:(id)a5 session:(id)a6;
- (CARSession)session;
- (NSArray)inputDevices;
- (NSString)description;
- (id)_generateInputDevicesWithEndpointInputDevices:(id)a3 screenIDs:(id)a4 vehicleInformation:(id)a5;
- (id)_initWithInputDevices:(id)a3 session:(id)a4;
- (id)_inputDeviceWithSenderID:(unint64_t)a3;
- (id)_touchpadSettingsFromVehicleInformation:(id)a3;
- (id)touchpadWithSenderID:(unint64_t)a3;
- (void)_enumerateTouchpadsUsingBlock:(id)a3;
- (void)_updateTouchpadSettings:(id)a3;
- (void)performHapticType:(unint64_t)a3 deviceUUID:(id)a4;
- (void)vehicleInformationChanged:(id)a3;
@end

@implementation CARInputDeviceManager

- (CARInputDeviceManager)initWithEndpointInputDevices:(id)a3 screenIDs:(id)a4 vehicleInformation:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CARInputDeviceManager;
  v14 = [(CARInputDeviceManager *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_session, v13);
    uint64_t v16 = [(CARInputDeviceManager *)v15 _generateInputDevicesWithEndpointInputDevices:v10 screenIDs:v11 vehicleInformation:v12];
    inputDevices = v15->_inputDevices;
    v15->_inputDevices = (NSArray *)v16;
  }
  return v15;
}

- (id)_generateInputDevicesWithEndpointInputDevices:(id)a3 screenIDs:(id)a4 vehicleInformation:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v7 = a4;
  id v43 = a5;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cf = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    uint64_t v11 = *MEMORY[0x1E4F1CFC8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v47 setObject:v14 forKey:v13];
        v57[0] = @"Built-In";
        v57[1] = @"displayUUID";
        v58[0] = v11;
        v58[1] = v13;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
        IOHIDEventSystemClientSetMatching();
        CFArrayRef v15 = IOHIDEventSystemClientCopyServices(cf);
        if ([(__CFArray *)v15 count])
        {
          unint64_t v16 = 0;
          do
          {
            v17 = (__IOHIDServiceClient *)[(__CFArray *)v15 objectAtIndex:v16];
            v18 = (void *)IOHIDServiceClientCopyProperty(v17, @"SerialNumber");
            if (v18) {
              [v14 setObject:v17 forKey:v18];
            }

            ++v16;
          }
          while (v16 < [(__CFArray *)v15 count]);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v9);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v19 = v40;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v49;
    uint64_t v23 = *MEMORY[0x1E4F20598];
    uint64_t v39 = *(void *)v49;
    id v41 = v19;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "objectForKey:", v23, v39);
        v27 = [v25 objectForKey:@"displayUUID"];
        v28 = [v47 objectForKey:v27];

        v29 = (__IOHIDServiceClient *)[v28 objectForKey:v26];
        if (v29)
        {
          v30 = v29;
          v31 = (void *)IOHIDServiceClientCopyProperty(v29, @"PrimaryUsagePage");
          v32 = (void *)IOHIDServiceClientCopyProperty(v30, @"PrimaryUsage");
          if ([v31 integerValue] == 13 && objc_msgSend(v32, "integerValue") == 5)
          {
            if (v43)
            {
              v33 = -[CARInputDeviceManager _touchpadSettingsFromVehicleInformation:](self, "_touchpadSettingsFromVehicleInformation:");
              v34 = v33;
              if (v33)
              {
                v35 = [v33 objectForKey:v26];
              }
              else
              {
                v35 = 0;
              }
            }
            else
            {
              v35 = 0;
            }
            v36 = [[CARInputDeviceTouchpad alloc] initWithServiceClient:v30 UUID:v26 settings:v35 delegate:self];
            [v42 addObject:v36];

            uint64_t v22 = v39;
            id v19 = v41;
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v21);
  }

  CFRelease(cf);
  v37 = (void *)[v42 copy];

  return v37;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CARInputDeviceManager *)self inputDevices];
  v6 = [v3 stringWithFormat:@"<%@: %p, input devices: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)vehicleInformationChanged:(id)a3
{
  uint64_t v4 = [(CARInputDeviceManager *)self _touchpadSettingsFromVehicleInformation:a3];
  if (v4) {
    [(CARInputDeviceManager *)self _updateTouchpadSettings:v4];
  }
  MEMORY[0x1F41817F8]();
}

- (BOOL)touchpadCharacterRecognitionSupported
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__CARInputDeviceManager_touchpadCharacterRecognitionSupported__block_invoke;
  v4[3] = &unk_1E5E3C288;
  v4[4] = &v5;
  [(CARInputDeviceManager *)self _enumerateTouchpadsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __62__CARInputDeviceManager_touchpadCharacterRecognitionSupported__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 characterRecognitionSupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)touchpadWithSenderID:(unint64_t)a3
{
  v3 = [(CARInputDeviceManager *)self _inputDeviceWithSenderID:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)performHapticType:(unint64_t)a3 deviceUUID:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(CARInputDeviceManager *)self session];
  v10[0] = @"hapticFeedbackType";
  char v8 = [NSNumber numberWithUnsignedInteger:a3];
  v10[1] = @"uuid";
  v11[0] = v8;
  v11[1] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [v7 sendCommand:@"performHapticFeedback" withParameters:v9];
}

- (void)_enumerateTouchpadsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CARInputDeviceManager *)self inputDevices];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CARInputDeviceManager__enumerateTouchpadsUsingBlock___block_invoke;
  v7[3] = &unk_1E5E3C2B0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __55__CARInputDeviceManager__enumerateTouchpadsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_inputDeviceWithSenderID:(unint64_t)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__9;
  id v12 = __Block_byref_object_dispose__9;
  id v13 = 0;
  id v4 = [(CARInputDeviceManager *)self inputDevices];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CARInputDeviceManager__inputDeviceWithSenderID___block_invoke;
  v7[3] = &unk_1E5E3C2D8;
  void v7[4] = &v8;
  v7[5] = a3;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __50__CARInputDeviceManager__inputDeviceWithSenderID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 senderID] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_updateTouchpadSettings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CARInputDeviceManager__updateTouchpadSettings___block_invoke;
  v6[3] = &unk_1E5E3C300;
  id v7 = v4;
  id v5 = v4;
  [(CARInputDeviceManager *)self _enumerateTouchpadsUsingBlock:v6];
}

void __49__CARInputDeviceManager__updateTouchpadSettings___block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 UUID];
  id v5 = [v2 objectForKey:v4];

  [v3 updateSettingsWithSettings:v5];
}

- (id)_touchpadSettingsFromVehicleInformation:(id)a3
{
  id v3 = [a3 objectForKey:@"userPreferences"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKey:@"touchpadSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  id v4 = 0;
LABEL_5:

  return v4;
}

- (id)_initWithInputDevices:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARInputDeviceManager;
  uint64_t v9 = [(CARInputDeviceManager *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_session, v8);
    objc_storeStrong(p_isa + 1, a3);
  }

  return p_isa;
}

- (NSArray)inputDevices
{
  return self->_inputDevices;
}

- (CARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (CARSession *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_inputDevices, 0);
}

@end