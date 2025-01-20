@interface TIHardwareKeyboardModifierRemapController
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

@implementation TIHardwareKeyboardModifierRemapController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(TIHardwareKeyboardModifierRemapController *)self newSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)subtitleForSpecifier:(id)a3
{
  v4 = [a3 propertyForKey:*MEMORY[0x263F60138]];
  v5 = [(TIHardwareKeyboardModifierRemapController *)self valueForRemappingKey:v4];
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
  v4.super_class = (Class)TIHardwareKeyboardModifierRemapController;
  [(TIHardwareKeyboardModifierRemapController *)&v4 dealloc];
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v4 = [(TIHardwareKeyboardModifierRemapController *)self specifiers];
  id v3 = [(TIHardwareKeyboardModifierRemapController *)self newSpecifiers];
  -[TIHardwareKeyboardModifierRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, [v4 count], v3);
}

- (void)loadKeyboards
{
  v55[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  if (!self->_eventSystemClient)
  {
    id v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v54[0] = @"DeviceUsagePage";
      v54[1] = @"DeviceUsage";
      v55[0] = &unk_26E2A6F70;
      v55[1] = &unk_26E2A6F88;
      id v4 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
      IOHIDEventSystemClientSetMatching();
      uint64_t v46 = MEMORY[0x263EF8330];
      uint64_t v47 = 3221225472;
      v48 = __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke;
      v49 = &unk_264A00F90;
      objc_copyWeak(&v50, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v50);
    }
  }
  v31 = [MEMORY[0x263EFF980] array];
  v30 = self;
  CFArrayRef v5 = IOHIDEventSystemClientCopyServices(self->_eventSystemClient);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  CFArrayRef obj = v5;
  uint64_t v6 = [(__CFArray *)obj countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    uint64_t v32 = *(void *)v43;
    do
    {
      uint64_t v9 = 0;
      uint64_t v33 = v7;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(__IOHIDServiceClient **)(*((void *)&v42 + 1) + 8 * v9);
        v11 = (void *)IOHIDServiceClientCopyProperty(v10, @"DeviceUsagePairs");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v35 = v10;
          v36 = v11;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v52 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v39;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v39 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v18 = [v17 objectForKey:@"DeviceUsagePage"];
                  v19 = [v17 objectForKey:@"DeviceUsage"];
                  if ([v18 isEqual:&unk_26E2A6F70]
                    && [v19 isEqual:&unk_26E2A6F88])
                  {
                    [(NSMutableArray *)v31 addObject:v35];
                    objc_copyWeak(&v37, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v37);

                    goto LABEL_23;
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v52 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
LABEL_23:

          uint64_t v8 = v32;
          uint64_t v7 = v33;
          v11 = v36;
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [(__CFArray *)obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v7);
  }

  if ([(NSMutableArray *)v31 count])
  {
    v20 = v30;
    if (!v30->_currentKeyboard || (-[NSMutableArray containsObject:](v31, "containsObject:") & 1) == 0)
    {
      v21 = [(NSMutableArray *)v31 firstObject];
      v20->_currentKeyboard = v21;
LABEL_33:
    }
  }
  else
  {
    v20 = v30;
    v30->_currentKeyboard = 0;
    v22 = [(TIHardwareKeyboardModifierRemapController *)v30 navigationController];
    v23 = [v22 viewControllers];
    uint64_t v24 = [v23 indexOfObject:v30];

    if (v24 && v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [(TIHardwareKeyboardModifierRemapController *)v30 navigationController];
      v26 = [v25 viewControllers];
      v21 = [v26 objectAtIndex:v24 - 1];

      v27 = [(TIHardwareKeyboardModifierRemapController *)v30 navigationController];
      id v28 = (id)[v27 popToViewController:v21 animated:1];

      goto LABEL_33;
    }
  }
  keyboards = v20->_keyboards;
  v20->_keyboards = v31;

  objc_destroyWeak(&location);
}

void __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_264A00D78;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

void __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_264A00D78;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __58__TIHardwareKeyboardModifierRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

- (void)resetRemapping
{
  [(NSMutableDictionary *)self->_remapping removeAllObjects];
  [(TIHardwareKeyboardModifierRemapController *)self saveRemapping];

  [(TIHardwareKeyboardModifierRemapController *)self reloadSpecifiers];
}

- (void)loadRemapping
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (initializeDictionaries_onceToken != -1) {
    dispatch_once(&initializeDictionaries_onceToken, &__block_literal_global_2);
  }
  [(TIHardwareKeyboardModifierRemapController *)self loadKeyboards];
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
              id v12 = (void *)_keyCodeToKey;
              uint64_t v13 = [v11 objectForKeyedSubscript:@"HIDKeyboardModifierMappingSrc"];
              uint64_t v14 = [v12 objectForKeyedSubscript:v13];

              uint64_t v15 = (void *)_keyCodeToKey;
              v16 = [v11 objectForKeyedSubscript:@"HIDKeyboardModifierMappingDst"];
              v17 = [v15 objectForKeyedSubscript:v16];

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
    CFArrayRef obj = v2->_remapping;
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
            id v12 = [(id)_keyToKeyCode objectForKeyedSubscript:v10];
            CFTypeRef property = v11;
            uint64_t v13 = [(id)_keyToKeyCode objectForKeyedSubscript:v11];
            unint64_t v14 = v8;
            uint64_t v15 = v7;
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
    uint64_t v24 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, @"VendorID");
    uint64_t v25 = (void *)IOHIDServiceClientCopyProperty(v2->_currentKeyboard, @"HIDVirtualDevice");
    v26 = BKSHIDServicesProductIdentifierFromServiceProperties();
    v27 = v26;
    if (v26)
    {
      uint64_t v47 = v25;
      v51 = v24;
      id obja = v23;
      id v28 = v26;
      id v29 = v49;
      CFStringRef v30 = (const __CFString *)*MEMORY[0x263F297D8];
      v31 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F297D8], @"com.apple.keyboard.preferences");
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = (void *)[v31 mutableCopy];
      }
      else
      {
        uint64_t v33 = [MEMORY[0x263EFF9A0] dictionary];
      }
      uint64_t v46 = v27;
      if ([v29 count]) {
        [v33 setObject:v29 forKeyedSubscript:v28];
      }
      else {
        [v33 removeObjectForKey:v28];
      }
      v35 = (void *)[v33 copy];

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
            long long v40 = *(__IOHIDServiceClient **)(*((void *)&v58 + 1) + 8 * i);
            long long v41 = (void *)IOHIDServiceClientCopyProperty(v40, @"ProductID");
            long long v42 = (void *)IOHIDServiceClientCopyProperty(v40, @"VendorID");
            long long v43 = (void *)IOHIDServiceClientCopyProperty(v40, @"HIDVirtualDevice");
            long long v44 = BKSHIDServicesProductIdentifierFromServiceProperties();
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

      v34 = v49;
      uint64_t v24 = v51;
      long long v23 = obja;
      v27 = v46;
      uint64_t v25 = v47;
    }
    else
    {
      NSLog(&cfstr_CanNotSaveRema.isa);
      v34 = v49;
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
  [(TIHardwareKeyboardModifierRemapController *)self saveRemapping];

  [(TIHardwareKeyboardModifierRemapController *)self reloadSpecifiers];
}

- (id)newSpecifiers
{
  [(TIHardwareKeyboardModifierRemapController *)self loadRemapping];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(NSMutableArray *)self->_keyboards count])
  {
    id v4 = [(TIHardwareKeyboardModifierRemapController *)self keyboardsSectionSpecifiers];
    [v3 addObjectsFromArray:v4];

    id v5 = [(TIHardwareKeyboardModifierRemapController *)self keysSectionSpecifiers];
    [v3 addObjectsFromArray:v5];

    id v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"Restore Defaults"];
    [v3 addObject:v6];
    uint64_t v7 = (void *)MEMORY[0x263F5FC40];
    unint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"MODIFIER_KEYS_RESTORE_DEFAULTS" value:&stru_26E29DC78 table:@"Keyboard"];
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
    id v6 = [v5 localizedStringForKey:@"SELECT_KEYBOARD" value:&stru_26E29DC78 table:@"Keyboard"];
    uint64_t v7 = [v4 groupSpecifierWithName:v6];

    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    id v41 = v3;
    v34 = v7;
    [v3 addObject:v7];
    id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    CFArrayRef obj = self->_keyboards;
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
          id v12 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v46 + 1) + 8 * i), @"Product");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v40 objectForKey:v12];
            uint64_t v14 = [v13 integerValue];

            uint64_t v15 = [NSNumber numberWithInteger:v14 + 1];
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
    v35 = self->_keyboards;
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
          uint64_t v24 = v23;
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = [v40 objectForKey:v23];
            uint64_t v26 = [v25 integerValue];

            uint64_t v24 = v23;
            if (v26 >= 2)
            {
              v27 = @"%@ (Smart Connector)";
              if (([v22 isEqual:@"AID"] & 1) != 0
                || (v27 = @"%@ (Bluetooth)", ([v22 isEqual:@"Bluetooth"] & 1) != 0)
                || (v27 = @"%@ (USB)", uint64_t v24 = v23, [v22 isEqual:@"USB"]))
              {
                id v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v29 = [v28 localizedStringForKey:v27 value:&stru_26E29DC78 table:@"Keyboard"];

                uint64_t v24 = objc_msgSend(NSString, "localizedStringWithFormat:", v29, v23);
              }
            }
          }
          if (self->_currentKeyboard) {
            BOOL v30 = v36 + j == -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:");
          }
          else {
            BOOL v30 = 0;
          }
          v31 = [NSString stringWithFormat:@"%@:%@:%d", v23, v21, v30];
          uint64_t v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:objc_opt_class() cell:3 edit:0];
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
    id v5 = [v4 localizedStringForKey:@"MODIFIER_KEYS_FOOTER_TEXT" value:&stru_26E29DC78 table:@"Keyboard"];
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
          v34 = v10;
          v35 = v8;
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
                      uint64_t v24 = [v22 objectForKeyedSubscript:v23];

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
            uint64_t v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
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
  v15.super_class = (Class)TIHardwareKeyboardModifierRemapController;
  uint64_t v7 = [(TIHardwareKeyboardModifierRemapController *)&v15 tableView:a3 cellForRowAtIndexPath:v6];
  if ([v6 section] == self->_keysSectionStart - 1)
  {
    if (self->_currentKeyboard) {
      objc_msgSend(v7, "setChecked:", -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:") == objc_msgSend(v6, "row"));
    }
  }
  else if ([v6 section] == self->_keysSectionStart)
  {
    uint64_t v8 = [(TIHardwareKeyboardModifierRemapController *)self specifierAtIndexPath:v6];
    unint64_t v9 = [v8 propertyForKey:*MEMORY[0x263F60138]];
    uint64_t v10 = attributedTitleForKey(v9, self->_currentKeyboard, @" Key", 1);
    id v11 = [v7 titleLabel];
    [v11 setAttributedText:v10];

    uint64_t v12 = [(TIHardwareKeyboardModifierRemapController *)self subtitleForSpecifier:v8];
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

      [(TIHardwareKeyboardModifierRemapController *)self reloadSpecifiers];
      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIHardwareKeyboardModifierRemapController;
    [(TIHardwareKeyboardModifierRemapController *)&v10 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remapping, 0);

  objc_storeStrong((id *)&self->_keyboards, 0);
}

@end