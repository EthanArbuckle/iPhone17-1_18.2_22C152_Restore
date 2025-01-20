@interface TIHardwareKeyboardKeyboardTypeRemapController
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

@implementation TIHardwareKeyboardKeyboardTypeRemapController

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(TIHardwareKeyboardKeyboardTypeRemapController *)self newSpecifiers];
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
  v4.super_class = (Class)TIHardwareKeyboardKeyboardTypeRemapController;
  [(TIHardwareKeyboardKeyboardTypeRemapController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)TIHardwareKeyboardKeyboardTypeRemapController;
  [(TIHardwareKeyboardKeyboardTypeRemapController *)&v2 viewDidLoad];
}

- (__IOHIDServiceClient)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)reloadSpecifiersWithAnimation
{
  id v4 = [(TIHardwareKeyboardKeyboardTypeRemapController *)self specifiers];
  id v3 = [(TIHardwareKeyboardKeyboardTypeRemapController *)self newSpecifiers];
  -[TIHardwareKeyboardKeyboardTypeRemapController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", 0, [v4 count], v3);
}

- (void)loadKeyboards
{
  v73[2] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  if (!self->_eventSystemClient)
  {
    id v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
    self->_eventSystemClient = v3;
    if (v3)
    {
      CFRunLoopGetCurrent();
      IOHIDEventSystemClientScheduleWithRunLoop();
      v72[0] = @"DeviceUsagePage";
      v72[1] = @"DeviceUsage";
      v73[0] = &unk_26E2A7180;
      v73[1] = &unk_26E2A7198;
      id v4 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
      IOHIDEventSystemClientSetMatching();
      uint64_t v63 = MEMORY[0x263EF8330];
      uint64_t v64 = 3221225472;
      v65 = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke;
      v66 = &unk_264A00F90;
      objc_copyWeak(&v67, &location);
      IOHIDEventSystemClientRegisterDeviceMatchingBlock();
      objc_destroyWeak(&v67);
    }
  }
  [MEMORY[0x263EFF980] array];
  v38 = self;
  v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  CFArrayRef v5 = IOHIDEventSystemClientCopyServices(self->_eventSystemClient);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [(__CFArray *)obj countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v60;
    uint64_t v40 = *(void *)v60;
    do
    {
      uint64_t v9 = 0;
      uint64_t v41 = v7;
      do
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(obj);
        }
        service = *(__IOHIDServiceClient **)(*((void *)&v59 + 1) + 8 * v9);
        v10 = (void *)IOHIDServiceClientCopyProperty(service, @"DeviceUsagePairs");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v43 = v10;
          uint64_t v44 = v9;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v70 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v56;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v56 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v17 = [v16 objectForKey:@"DeviceUsagePage"];
                  v18 = [v16 objectForKey:@"DeviceUsage"];
                  if ([v17 isEqual:&unk_26E2A7180]
                    && [v18 isEqual:&unk_26E2A7198])
                  {
                    v19 = IOHIDServiceClientGetRegistryID(service);
                    [v19 unsignedLongLongValue];
                    if ((BKSHIDKeyboardWantsStandardTypeOverride() & 1) != 0
                      || CFPreferencesGetAppBooleanValue(@"KeyboardTypeCustomization", @"com.apple.keyboard.preferences", 0))
                    {
                      -[NSMutableArray addObject:](v39, "addObject:", service, v38);
                    }
                    uint64_t v50 = MEMORY[0x263EF8330];
                    uint64_t v51 = 3221225472;
                    v52 = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3;
                    v53 = &unk_264A00F90;
                    objc_copyWeak(&v54, &location);
                    IOHIDServiceClientRegisterRemovalBlock();
                    objc_destroyWeak(&v54);

                    goto LABEL_26;
                  }
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v70 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_26:

          uint64_t v8 = v40;
          uint64_t v7 = v41;
          v10 = v43;
          uint64_t v9 = v44;
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [(__CFArray *)obj countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v7);
  }

  if ([(NSMutableArray *)v39 count])
  {
    v20 = v38;
    if (!v38->_currentKeyboard || (-[NSMutableArray containsObject:](v39, "containsObject:") & 1) == 0)
    {
      v21 = BKSHIDKeyboardGetDeviceProperties();
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v22 = v39;
      uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v69 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v47;
        while (2)
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(__IOHIDServiceClient **)(*((void *)&v46 + 1) + 8 * j);
            v28 = (void *)IOHIDServiceClientCopyProperty(v27, @"StandardType");
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v29 = [v21 standardType];
              if (v29 == [v28 intValue])
              {
                v38->_currentKeyboard = v27;

                goto LABEL_46;
              }
            }
          }
          uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v46 objects:v69 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
LABEL_46:

      v20 = v38;
      if (v38->_currentKeyboard) {
        goto LABEL_49;
      }
      v35 = [(NSMutableArray *)v22 firstObject];
      v38->_currentKeyboard = v35;
LABEL_48:

LABEL_49:
    }
  }
  else
  {
    v20 = v38;
    v38->_currentKeyboard = 0;
    v30 = [(TIHardwareKeyboardKeyboardTypeRemapController *)v38 navigationController];
    v31 = [v30 viewControllers];
    uint64_t v32 = [v31 indexOfObject:v38];

    if (v32 && v32 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v33 = [(TIHardwareKeyboardKeyboardTypeRemapController *)v38 navigationController];
      v34 = [v33 viewControllers];
      v21 = [v34 objectAtIndex:v32 - 1];

      v35 = [(TIHardwareKeyboardKeyboardTypeRemapController *)v38 navigationController];
      id v36 = (id)[(__IOHIDServiceClient *)v35 popToViewController:v21 animated:1];
      goto LABEL_48;
    }
  }
  keyboards = v20->_keyboards;
  v20->_keyboards = v39;

  objc_destroyWeak(&location);
}

void __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2;
    block[3] = &unk_264A00D78;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

void __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4;
    block[3] = &unk_264A00D78;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__TIHardwareKeyboardKeyboardTypeRemapController_loadKeyboards__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiersWithAnimation];
}

- (id)newSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  keyboards = self->_keyboards;
  if (!keyboards)
  {
    [(TIHardwareKeyboardKeyboardTypeRemapController *)self loadKeyboards];
    keyboards = self->_keyboards;
  }
  if ([(NSMutableArray *)keyboards count])
  {
    CFArrayRef v5 = [(TIHardwareKeyboardKeyboardTypeRemapController *)self keyboardsSectionSpecifiers];
    [v3 addObjectsFromArray:v5];

    uint64_t v6 = [(TIHardwareKeyboardKeyboardTypeRemapController *)self keyboardTypeSectionSpecifiers];
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
    uint64_t v6 = [v5 localizedStringForKey:@"SELECT_KEYBOARD" value:&stru_26E29DC78 table:@"Keyboard"];
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
          uint64_t v12 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)&v46 + 1) + 8 * i), @"Product");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [v40 objectForKey:v12];
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
          v19 = *(__IOHIDServiceClient **)(*((void *)&v42 + 1) + 8 * j);
          v20 = (void *)IOHIDServiceClientCopyProperty(v19, @"Product");
          v21 = (void *)IOHIDServiceClientCopyProperty(v19, @"ProductID");
          v22 = (void *)IOHIDServiceClientCopyProperty(v19, @"Transport");
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
                v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                int v29 = [v28 localizedStringForKey:v27 value:&stru_26E29DC78 table:@"Keyboard"];

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
          uint64_t v32 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v24 target:self set:0 get:0 detail:0 cell:3 edit:0];
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
    v15 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"Keys"];
    objc_msgSend(v3, "addObject:");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = [&unk_26E2A6DF0 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
            objc_enumerationMutation(&unk_26E2A6DF0);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = (void *)MEMORY[0x263F5FC40];
          id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v12 = [v11 localizedStringForKey:v9 value:&stru_26E29DC78 table:@"Keyboard"];
          uint64_t v13 = [v10 preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setProperty:v9 forKey:v7];
          [v3 addObject:v13];
        }
        uint64_t v5 = [&unk_26E2A6DF0 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
  v12.super_class = (Class)TIHardwareKeyboardKeyboardTypeRemapController;
  uint64_t v7 = [(TIHardwareKeyboardKeyboardTypeRemapController *)&v12 tableView:a3 cellForRowAtIndexPath:v6];
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

      [(TIHardwareKeyboardKeyboardTypeRemapController *)self reloadSpecifiers];
      [v12 deselectRowAtIndexPath:v6 animated:1];
    }
  }
  else
  {
    id v11 = IOHIDServiceClientGetRegistryID(self->_currentKeyboard);
    [v11 unsignedLongLongValue];
    BKSHIDServicesSetStandardType();
    [(TIHardwareKeyboardKeyboardTypeRemapController *)self reloadSpecifiers];
    [v12 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (void).cxx_destruct
{
}

@end