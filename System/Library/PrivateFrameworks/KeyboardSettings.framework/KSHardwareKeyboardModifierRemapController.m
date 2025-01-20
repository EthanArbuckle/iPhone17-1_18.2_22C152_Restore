@interface KSHardwareKeyboardModifierRemapController
- (__IOHIDServiceClient)currentKeyboard;
- (id)keyboardsSectionSpecifiers;
- (id)keysSectionSpecifiers;
- (id)newSpecifiers;
- (id)specifiers;
- (id)subtitleForSpecifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)valueForRemappingKey:(id)a3;
- (void)dealloc;
- (void)loadKeyboards;
- (void)loadRemapping;
- (void)reloadSpecifiersWithAnimation;
- (void)resetRemapping;
- (void)saveRemapping;
- (void)setRemappingFromKey:(id)a3 toValue:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation KSHardwareKeyboardModifierRemapController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(KSHardwareKeyboardModifierRemapController *)self newSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)subtitleForSpecifier:(id)a3
{
  v4 = [a3 propertyForKey:*MEMORY[0x263F60138]];
  v5 = [(KSHardwareKeyboardModifierRemapController *)self valueForRemappingKey:v4];
  v6 = attributedTitleForKey(v5, self->_currentKeyboard, 0, 1);

  return v6;
}

- (void)dealloc
{
  eventSystemClient = self->_eventSystemClient;
  if (eventSystemClient) {
    CFRelease(eventSystemClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)KSHardwareKeyboardModifierRemapController;
  [(KSHardwareKeyboardModifierRemapController *)&v4 dealloc];
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v4 = [(KSHardwareKeyboardModifierRemapController *)self specifiers];
  id v3 = [(KSHardwareKeyboardModifierRemapController *)self newSpecifiers];
  -[KSHardwareKeyboardModifierRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, [v4 count], v3);
}

- (void)loadKeyboards
{
  v49[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v2 = self;
  if (!self->_eventSystemClient)
  {
    id v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v48[0] = @"DeviceUsagePage";
      v48[1] = @"DeviceUsage";
      v49[0] = &unk_2703CE798;
      v49[1] = &unk_2703CE7B0;
      id v4 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
      IOHIDEventSystemClientSetMatching();
      uint64_t v40 = MEMORY[0x263EF8330];
      uint64_t v41 = 3221225472;
      v42 = __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke;
      v43 = &unk_2653A9378;
      objc_copyWeak(&v44, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v44);

      v2 = self;
    }
  }
  v24 = [MEMORY[0x263EFF980] array];
  CFArrayRef v5 = IOHIDEventSystemClientCopyServices(v2->_eventSystemClient);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v5;
  uint64_t v27 = [(__CFArray *)obj countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        v6 = *(__IOHIDServiceClient **)(*((void *)&v36 + 1) + 8 * i);
        v30 = (void *)IOHIDServiceClientCopyProperty(v6, @"DeviceUsagePairs");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v28 = v6;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v7 = v30;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v46 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v33;
            while (2)
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v33 != v9) {
                  objc_enumerationMutation(v7);
                }
                v11 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v12 = [v11 objectForKey:@"DeviceUsagePage"];
                  v13 = [v11 objectForKey:@"DeviceUsage"];
                  if ([v12 isEqual:&unk_2703CE798]
                    && [v13 isEqual:&unk_2703CE7B0])
                  {
                    [(NSMutableArray *)v24 addObject:v28];
                    objc_copyWeak(&v31, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v31);

                    goto LABEL_23;
                  }
                }
              }
              uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v46 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
LABEL_23:
        }
      }
      uint64_t v27 = [(__CFArray *)obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v27);
  }

  if ([(NSMutableArray *)v24 count])
  {
    if (!self->_currentKeyboard || (-[NSMutableArray containsObject:](v24, "containsObject:") & 1) == 0)
    {
      v14 = [(NSMutableArray *)v24 firstObject];
      self->_currentKeyboard = v14;
LABEL_33:
    }
  }
  else
  {
    self->_currentKeyboard = 0;
    v15 = [(KSHardwareKeyboardModifierRemapController *)self navigationController];
    v16 = [v15 viewControllers];
    uint64_t v17 = [v16 indexOfObject:self];

    if (v17 && v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = [(KSHardwareKeyboardModifierRemapController *)self navigationController];
      v19 = [v18 viewControllers];
      v14 = [v19 objectAtIndex:v17 - 1];

      v20 = [(KSHardwareKeyboardModifierRemapController *)self navigationController];
      id v21 = (id)[v20 popToViewController:v14 animated:1];

      goto LABEL_33;
    }
  }
  keyboards = self->_keyboards;
  self->_keyboards = v24;

  objc_destroyWeak(&location);
}

void __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_2653A9350;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

void __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_2653A9350;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__KSHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

- (void)resetRemapping
{
  [(NSMutableDictionary *)self->_remapping removeAllObjects];
  [(KSHardwareKeyboardModifierRemapController *)self saveRemapping];
  [(KSHardwareKeyboardModifierRemapController *)self reloadSpecifiers];
}

- (void)loadRemapping
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (initializeDictionaries_onceToken != -1) {
    dispatch_once(&initializeDictionaries_onceToken, &__block_literal_global_4);
  }
  [(KSHardwareKeyboardModifierRemapController *)self loadKeyboards];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  remapping = self->_remapping;
  self->_remapping = v2;

  currentKeyboard = self->_currentKeyboard;
  if (currentKeyboard)
  {
    CFArrayRef v5 = (void *)IOHIDServiceClientCopyProperty(currentKeyboard, @"HIDKeyboardModifierMappingPairs");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v12 = (void *)_keyCodeToKey;
              v13 = [v11 objectForKeyedSubscript:@"HIDKeyboardModifierMappingSrc"];
              v14 = [v12 objectForKeyedSubscript:v13];

              v15 = (void *)_keyCodeToKey;
              v16 = [v11 objectForKeyedSubscript:@"HIDKeyboardModifierMappingDst"];
              uint64_t v17 = [v15 objectForKeyedSubscript:v16];

              if (v14) {
                BOOL v18 = v17 == 0;
              }
              else {
                BOOL v18 = 1;
              }
              if (!v18)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [(NSMutableDictionary *)self->_remapping setObject:v17 forKeyedSubscript:v14];
                  }
                }
              }
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)saveRemapping
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (self->_currentKeyboard)
  {
    v2 = self;
    v49 = [MEMORY[0x263EFF980] array];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v2->_remapping;
    uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v63;
      id v6 = @"HIDKeyboardModifierMappingSrc";
      uint64_t v7 = @"HIDKeyboardModifierMappingDst";
      unint64_t v8 = 0x263EFF000uLL;
      v48 = v2;
      uint64_t v45 = *(void *)v63;
      do
      {
        id v9 = 0;
        uint64_t v50 = v4;
        do
        {
          if (*(void *)v63 != v5) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v9);
          v11 = [(NSMutableDictionary *)v2->_remapping objectForKeyedSubscript:v10];
          if (([v10 isEqualToString:v11] & 1) == 0)
          {
            id v56 = v9;
            v12 = [(id)_keyToKeyCode objectForKeyedSubscript:v10];
            CFTypeRef property = v11;
            v13 = [(id)_keyToKeyCode objectForKeyedSubscript:v11];
            unint64_t v14 = v8;
            v15 = v7;
            v16 = v6;
            if ([v12 count])
            {
              unint64_t v17 = 0;
              do
              {
                BOOL v18 = [v12 objectAtIndexedSubscript:v17];
                uint64_t v19 = [v13 count];
                if (v17 >= v19 - 1) {
                  unint64_t v20 = v19 - 1;
                }
                else {
                  unint64_t v20 = v17;
                }
                long long v21 = [v13 objectAtIndexedSubscript:v20];
                v67[0] = v16;
                v67[1] = v15;
                v68[0] = v18;
                v68[1] = v21;
                long long v22 = [*(id *)(v14 + 2352) dictionaryWithObjects:v68 forKeys:v67 count:2];
                [v49 addObject:v22];

                ++v17;
              }
              while (v17 < [v12 count]);
            }

            v2 = v48;
            uint64_t v5 = v45;
            uint64_t v4 = v50;
            id v6 = v16;
            uint64_t v7 = v15;
            unint64_t v8 = v14;
            v11 = (void *)property;
            id v9 = v56;
          }

          id v9 = (char *)v9 + 1;
        }
        while (v9 != (id)v4);
        uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v4);
    }

    long long v23 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, @"ProductID");
    v24 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, @"VendorID");
    uint64_t v25 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, @"HIDVirtualDevice");
    uint64_t v26 = BKSHIDServicesProductIdentifierFromServiceProperties();
    uint64_t v27 = v26;
    if (v26)
    {
      v47 = v25;
      v51 = v24;
      id obja = v23;
      id v28 = v26;
      id v29 = v49;
      CFStringRef v30 = (const __CFString *)*MEMORY[0x263F297D8];
      id v31 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F297D8], @"com.apple.keyboard.preferences");
      if (v31)
      {
        long long v32 = v31;
        long long v33 = (void *)[v31 mutableCopy];
      }
      else
      {
        long long v33 = [MEMORY[0x263EFF9A0] dictionary];
      }
      v46 = v27;
      if ([v29 count]) {
        [v33 setObject:v29 forKeyedSubscript:v28];
      }
      else {
        [v33 removeObjectForKey:v28];
      }
      long long v35 = (void *)[v33 copy];

      CFPreferencesSetAppValue(v30, v35, @"com.apple.keyboard.preferences");
      CFTypeRef propertya = v29;

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v57 = v2->_keyboards;
      uint64_t v36 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v59 != v38) {
              objc_enumerationMutation(v57);
            }
            uint64_t v40 = *(__IOHIDServiceClient **)(*((void *)&v58 + 1) + 8 * i);
            uint64_t v41 = (void *)IOHIDServiceClientCopyProperty(v40, @"ProductID");
            v42 = (void *)IOHIDServiceClientCopyProperty(v40, @"VendorID");
            v43 = (void *)IOHIDServiceClientCopyProperty(v40, @"HIDVirtualDevice");
            id v44 = BKSHIDServicesProductIdentifierFromServiceProperties();
            if ([v28 isEqual:v44])
            {
              if (!IOHIDServiceClientSetProperty(v40, @"HIDKeyboardModifierMappingPairs", propertya)) {
                NSLog(&cfstr_ErrorCanNotSav.isa);
              }
            }
          }
          uint64_t v37 = [(NSMutableArray *)v57 countByEnumeratingWithState:&v58 objects:v66 count:16];
        }
        while (v37);
      }

      long long v34 = v49;
      v24 = v51;
      long long v23 = obja;
      uint64_t v27 = v46;
      uint64_t v25 = v47;
    }
    else
    {
      NSLog(&cfstr_CanNotSaveRema.isa);
      long long v34 = v49;
    }
  }
}

- (id)valueForRemappingKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_remapping objectForKeyedSubscript:v4];
  if (!v5) {
    id v5 = v4;
  }

  return v5;
}

- (void)setRemappingFromKey:(id)a3 toValue:(id)a4
{
  [(NSMutableDictionary *)self->_remapping setObject:a4 forKeyedSubscript:a3];
  [(KSHardwareKeyboardModifierRemapController *)self saveRemapping];
  [(KSHardwareKeyboardModifierRemapController *)self reloadSpecifiers];
}

- (id)newSpecifiers
{
  [(KSHardwareKeyboardModifierRemapController *)self loadRemapping];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSMutableArray *)self->_keyboards count])
  {
    id v4 = [(KSHardwareKeyboardModifierRemapController *)self keyboardsSectionSpecifiers];
    [v3 addObjectsFromArray:v4];

    id v5 = [(KSHardwareKeyboardModifierRemapController *)self keysSectionSpecifiers];
    [v3 addObjectsFromArray:v5];

    id v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"Restore Defaults"];
    [v3 addObject:v6];
    uint64_t v7 = (void *)MEMORY[0x263F5FC40];
    unint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"MODIFIER_KEYS_RESTORE_DEFAULTS" value:&stru_2703C6C20 table:@"Keyboard"];
    v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v10 setButtonAction:sel_resetRemapping];
    [v3 addObject:v10];
  }
  return v3;
}

- (id)keyboardsSectionSpecifiers
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ((unint64_t)[(NSMutableArray *)self->_keyboards count] < 2)
  {
    self->_keysSectionStart = 0;
  }
  else
  {
    id v4 = (void *)MEMORY[0x263F5FC40];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"SELECT_KEYBOARD" value:&stru_2703C6C20 table:@"Keyboard"];
    uint64_t v7 = [v4 groupSpecifierWithName:v6];

    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    id v41 = v3;
    long long v34 = v7;
    [v3 addObject:v7];
    id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = self->_keyboards;
    uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v46 + 1) + 8 * i), @"Product");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [v40 objectForKey:v12];
            uint64_t v14 = [v13 integerValue];

            v15 = [NSNumber numberWithInteger:v14 + 1];
            [v40 setObject:v15 forKey:v12];
          }
        }
        uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v9);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v35 = self->_keyboards;
    uint64_t v16 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v36 = 0;
      uint64_t v37 = *MEMORY[0x263F60138];
      id obja = *(id *)v43;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(id *)v43 != obja) {
            objc_enumerationMutation(v35);
          }
          uint64_t v19 = *(__IOHIDServiceClient **)(*((void *)&v42 + 1) + 8 * j);
          unint64_t v20 = (void *)IOHIDServiceClientCopyProperty(v19, @"Product");
          long long v21 = (void *)IOHIDServiceClientCopyProperty(v19, @"ProductID");
          long long v22 = (void *)IOHIDServiceClientCopyProperty(v19, @"Transport");
          id v23 = v20;
          objc_opt_class();
          v24 = v23;
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = [v40 objectForKey:v23];
            uint64_t v26 = [v25 integerValue];

            v24 = v23;
            if (v26 >= 2)
            {
              uint64_t v27 = @"%@ (Smart Connector)";
              if (([v22 isEqual:@"AID"] & 1) != 0
                || (uint64_t v27 = @"%@ (Bluetooth)", ([v22 isEqual:@"Bluetooth"] & 1) != 0)
                || (uint64_t v27 = @"%@ (USB)", v24 = v23, [v22 isEqual:@"USB"]))
              {
                id v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v29 = [v28 localizedStringForKey:v27 value:&stru_2703C6C20 table:@"Keyboard"];

                v24 = objc_msgSend(NSString, "localizedStringWithFormat:", v29, v23);
              }
            }
          }
          if (self->_currentKeyboard) {
            BOOL v30 = v36 + j == -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:");
          }
          else {
            BOOL v30 = 0;
          }
          id v31 = [NSString stringWithFormat:@"%@:%@:%d", v23, v21, v30];
          long long v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:objc_opt_class() cell:3 edit:0];
          [v32 setProperty:v31 forKey:v37];
          [v41 addObject:v32];
        }
        uint64_t v17 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v50 count:16];
        v36 += j;
      }
      while (v17);
    }

    self->_keysSectionStart = 1;
    id v3 = v41;
  }
  return v3;
}

- (id)keysSectionSpecifiers
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_currentKeyboard)
  {
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"Keys"];
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"MODIFIER_KEYS_FOOTER_TEXT" value:&stru_2703C6C20 table:@"Keyboard"];
    [v3 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

    uint64_t v36 = v3;
    [v38 addObject:v3];
    currentKeyboard = self->_currentKeyboard;
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    if (currentKeyboard)
    {
      uint64_t v8 = (void *)IOHIDServiceClientCopyProperty(currentKeyboard, @"Keyboard");
      unint64_t v9 = 0x263EFF000uLL;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v8 objectForKeyedSubscript:@"Elements"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v34 = v10;
          long long v35 = v8;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v44;
            id v37 = v11;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v44 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v17 = [v16 objectForKeyedSubscript:@"Usage"];
                  BOOL v18 = [v16 objectForKeyedSubscript:@"UsagePage"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      unint64_t v19 = v9;
                      uint64_t v20 = [v17 unsignedLongLongValue];
                      uint64_t v21 = v20 | ([v18 unsignedLongLongValue] << 32);
                      long long v22 = (void *)_keyCodeToKey;
                      id v23 = [NSNumber numberWithUnsignedLongLong:v21];
                      v24 = [v22 objectForKeyedSubscript:v23];

                      if (v24) {
                        [v7 addObject:v24];
                      }

                      unint64_t v9 = v19;
                      id v11 = v37;
                    }
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
            }
            while (v13);
          }

          uint64_t v10 = v34;
          uint64_t v8 = v35;
        }
      }
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v25 = (id)_srcKeys;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      uint64_t v29 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          if ([v7 containsObject:v31])
          {
            long long v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
            [v32 setProperty:v31 forKey:v29];
            [v38 addObject:v32];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v27);
    }
  }
  return v38;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)KSHardwareKeyboardModifierRemapController;
  uint64_t v7 = [(KSHardwareKeyboardModifierRemapController *)&v15 tableView:a3 cellForRowAtIndexPath:v6];
  if ([v6 section] == self->_keysSectionStart - 1)
  {
    if (self->_currentKeyboard) {
      objc_msgSend(v7, "setChecked:", -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:") == objc_msgSend(v6, "row"));
    }
  }
  else if ([v6 section] == self->_keysSectionStart)
  {
    uint64_t v8 = [(KSHardwareKeyboardModifierRemapController *)self specifierAtIndexPath:v6];
    unint64_t v9 = [v8 propertyForKey:*MEMORY[0x263F60138]];
    uint64_t v10 = attributedTitleForKey(v9, self->_currentKeyboard, @" Key", 1);
    id v11 = [v7 titleLabel];
    [v11 setAttributedText:v10];

    uint64_t v12 = [(KSHardwareKeyboardModifierRemapController *)self subtitleForSpecifier:v8];
    uint64_t v13 = [v7 valueLabel];
    [v13 setAttributedText:v12];
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == self->_keysSectionStart - 1)
  {
    unint64_t v8 = [v7 row];
    if (v8 < [(NSMutableArray *)self->_keyboards count])
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_keyboards, "objectAtIndexedSubscript:", [v7 row]);
      unint64_t v9 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      self->_currentKeyboard = v9;

      [(KSHardwareKeyboardModifierRemapController *)self reloadSpecifiers];
      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)KSHardwareKeyboardModifierRemapController;
    [(KSHardwareKeyboardModifierRemapController *)&v10 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remapping, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
}

@end