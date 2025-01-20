@interface KSHardwareKeyboardKeyboardTypeRemapController
- (__IOHIDServiceClient)currentKeyboard;
- (id)keyboardTypeSectionSpecifiers;
- (id)keyboardsSectionSpecifiers;
- (id)newSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)dealloc;
- (void)loadKeyboards;
- (void)reloadSpecifiersWithAnimation;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation KSHardwareKeyboardKeyboardTypeRemapController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(KSHardwareKeyboardKeyboardTypeRemapController *)self newSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)dealloc
{
  eventSystemClient = self->_eventSystemClient;
  if (eventSystemClient) {
    CFRelease(eventSystemClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)KSHardwareKeyboardKeyboardTypeRemapController;
  [(KSHardwareKeyboardKeyboardTypeRemapController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)KSHardwareKeyboardKeyboardTypeRemapController;
  [(KSHardwareKeyboardKeyboardTypeRemapController *)&v2 viewDidLoad];
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v4 = [(KSHardwareKeyboardKeyboardTypeRemapController *)self specifiers];
  id v3 = [(KSHardwareKeyboardKeyboardTypeRemapController *)self newSpecifiers];
  -[KSHardwareKeyboardKeyboardTypeRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, [v4 count], v3);
}

- (void)loadKeyboards
{
  v67[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  objc_super v2 = self;
  if (!self->_eventSystemClient)
  {
    id v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v66[0] = @"DeviceUsagePage";
      v66[1] = @"DeviceUsage";
      v67[0] = &unk_2703CE720;
      v67[1] = &unk_2703CE738;
      id v4 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
      IOHIDEventSystemClientSetMatching();
      uint64_t v57 = MEMORY[0x263EF8330];
      uint64_t v58 = 3221225472;
      v59 = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke;
      v60 = &unk_2653A9378;
      objc_copyWeak(&v61, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v61);

      objc_super v2 = self;
    }
  }
  v32 = objc_msgSend(MEMORY[0x263EFF980], "array", self);
  CFArrayRef v5 = IOHIDEventSystemClientCopyServices(v2->_eventSystemClient);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v5;
  uint64_t v35 = [(__CFArray *)obj countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v54 != v34) {
          objc_enumerationMutation(obj);
        }
        service = *(__IOHIDServiceClient **)(*((void *)&v53 + 1) + 8 * i);
        v38 = (void *)IOHIDServiceClientCopyProperty(service, @"DeviceUsagePairs");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v6 = v38;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v64 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v50;
            while (2)
            {
              for (uint64_t j = 0; j != v7; ++j)
              {
                if (*(void *)v50 != v8) {
                  objc_enumerationMutation(v6);
                }
                v10 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v11 = [v10 objectForKey:@"DeviceUsagePage"];
                  v12 = [v10 objectForKey:@"DeviceUsage"];
                  if ([v11 isEqual:&unk_2703CE720]
                    && [v12 isEqual:&unk_2703CE738])
                  {
                    v13 = IOHIDServiceClientGetRegistryID(service);
                    [v13 unsignedLongLongValue];
                    if ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
                      || CFPreferencesGetAppBooleanValue(@"KeyboardTypeCustomization", @"com.apple.keyboard.preferences", 0))
                    {
                      [v32 addObject:service];
                    }
                    uint64_t v44 = MEMORY[0x263EF8330];
                    uint64_t v45 = 3221225472;
                    v46 = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3;
                    v47 = &unk_2653A9378;
                    objc_copyWeak(&v48, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v48);

                    goto LABEL_26;
                  }
                }
              }
              uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v64 count:16];
              if (v7) {
                continue;
              }
              break;
            }
          }
LABEL_26:
        }
      }
      uint64_t v35 = [(__CFArray *)obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v35);
  }

  v14 = v31;
  if ([v32 count])
  {
    if (!v31[176] || (objc_msgSend(v32, "containsObject:") & 1) == 0)
    {
      v39 = BKSHIDKeyboardGetDeviceProperties();
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = v32;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v63 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v41;
        while (2)
        {
          for (uint64_t k = 0; k != v16; ++k)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(__IOHIDServiceClient **)(*((void *)&v40 + 1) + 8 * k);
            v20 = (void *)IOHIDServiceClientCopyProperty(v19, @"StandardType");
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v21 = [v39 standardType];
              if (v21 == [v20 intValue])
              {
                v31[176] = v19;

                goto LABEL_46;
              }
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v63 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_46:

      if (v31[176]) {
        goto LABEL_49;
      }
      v27 = [v15 firstObject];
      v31[176] = v27;
LABEL_48:

LABEL_49:
      v14 = v31;
    }
  }
  else
  {
    v31[176] = 0;
    v22 = [v31 navigationController];
    v23 = [v22 viewControllers];
    uint64_t v24 = [v23 indexOfObject:v31];

    v14 = v31;
    if (v24 && v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [v31 navigationController];
      v26 = [v25 viewControllers];
      v39 = [v26 objectAtIndex:v24 - 1];

      v27 = [v31 navigationController];
      id v28 = (id)[v27 popToViewController:v39 animated:1];
      goto LABEL_48;
    }
  }
  v29 = (void *)v14[174];
  v14[174] = v32;

  objc_destroyWeak(&location);
}

void __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_2653A9350;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

void __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_2653A9350;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__KSHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

- (id)newSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  keyboards = self->_keyboards;
  if (!keyboards)
  {
    [(KSHardwareKeyboardKeyboardTypeRemapController *)self loadKeyboards];
    keyboards = self->_keyboards;
  }
  if ([(NSMutableArray *)keyboards count])
  {
    CFArrayRef v5 = [(KSHardwareKeyboardKeyboardTypeRemapController *)self keyboardsSectionSpecifiers];
    [v3 addObjectsFromArray:v5];

    id v6 = [(KSHardwareKeyboardKeyboardTypeRemapController *)self keyboardTypeSectionSpecifiers];
    [v3 addObjectsFromArray:v6];
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
    CFArrayRef v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"SELECT_KEYBOARD" value:&stru_2703C6C20 table:@"Keyboard"];
    uint64_t v7 = [v4 groupSpecifierWithName:v6];

    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60168]];
    id v41 = v3;
    uint64_t v34 = v7;
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

            id v15 = [NSNumber numberWithInteger:v14 + 1];
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
    uint64_t v35 = self->_keyboards;
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
          v19 = *(__IOHIDServiceClient **)(*((void *)&v42 + 1) + 8 * j);
          v20 = (void *)IOHIDServiceClientCopyProperty(v19, @"Product");
          int v21 = (void *)IOHIDServiceClientCopyProperty(v19, @"ProductID");
          v22 = (void *)IOHIDServiceClientCopyProperty(v19, @"Transport");
          id v23 = v20;
          objc_opt_class();
          uint64_t v24 = v23;
          if (objc_opt_isKindOfClass())
          {
            v25 = [v40 objectForKey:v23];
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
                v29 = [v28 localizedStringForKey:v27 value:&stru_2703C6C20 table:@"Keyboard"];

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
          v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:3 edit:0];
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

- (id)keyboardTypeSectionSpecifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_currentKeyboard)
  {
    id v15 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"Keys"];
    objc_msgSend(v3, "addObject:");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = [&unk_2703CE498 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      uint64_t v7 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(&unk_2703CE498);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x263F5FC40];
          v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v12 = [v11 localizedStringForKey:v9 value:&stru_2703C6C20 table:@"Keyboard"];
          v13 = [v10 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setProperty:v9 forKey:v7];
          [v3 addObject:v13];
        }
        uint64_t v5 = [&unk_2703CE498 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KSHardwareKeyboardKeyboardTypeRemapController;
  uint64_t v7 = [(KSHardwareKeyboardKeyboardTypeRemapController *)&v12 tableView:a3 cellForRowAtIndexPath:v6];
  if ([v6 section] == self->_keysSectionStart - 1)
  {
    if (self->_currentKeyboard) {
      objc_msgSend(v7, "setChecked:", -[NSMutableArray indexOfObject:](self->_keyboards, "indexOfObject:") == objc_msgSend(v6, "row"));
    }
  }
  else if ([v6 section] == self->_keysSectionStart)
  {
    uint64_t v8 = IOHIDServiceClientGetRegistryID(self->_currentKeyboard);
    [v8 unsignedLongLongValue];
    uint64_t v9 = BKSHIDKeyboardGetDeviceProperties();
    int v10 = [v9 standardType];
    if (v10 == -1) {
      int v10 = 2 * ([v9 countryCode] == 15);
    }
    objc_msgSend(v7, "setChecked:", objc_msgSend(v6, "row") == v10);
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 section];
  unint64_t v8 = self->_keysSectionStart - 1;
  unint64_t v9 = [v6 row];
  if (v7 == v8)
  {
    if (v9 < [(NSMutableArray *)self->_keyboards count])
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_keyboards, "objectAtIndexedSubscript:", [v6 row]);
      int v10 = (__IOHIDServiceClient *)objc_claimAutoreleasedReturnValue();
      self->_currentKeyboard = v10;

      [(KSHardwareKeyboardKeyboardTypeRemapController *)self reloadSpecifiers];
      [v12 deselectRowAtIndexPath:v6 animated:1];
    }
  }
  else
  {
    v11 = IOHIDServiceClientGetRegistryID(self->_currentKeyboard);
    [v11 unsignedLongLongValue];
    BKSHIDServicesSetStandardType();
    [(KSHardwareKeyboardKeyboardTypeRemapController *)self reloadSpecifiers];
    [v12 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (void).cxx_destruct
{
}

@end