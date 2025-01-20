@interface UIDevice(DOCDeviceSymbol)
- (__CFString)doc_symbolName;
- (void)doc_symbolName;
@end

@implementation UIDevice(DOCDeviceSymbol)

- (__CFString)doc_symbolName
{
  v0 = [MEMORY[0x263F1D928] _typeOfCurrentDevice];
  v1 = [v0 identifier];
  id v18 = 0;
  v2 = [MEMORY[0x263F4B560] symbolForTypeIdentifier:v1 error:&v18];
  id v3 = v18;
  v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    v6 = (NSObject **)MEMORY[0x263F3AC28];
    v7 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(UIDevice(DOCDeviceSymbol) *)(uint64_t)v1 doc_symbolName];
    }
  }
  v8 = [v2 name];

  if (!v8)
  {
    v9 = [MEMORY[0x263F82670] currentDevice];
    v10 = [v9 model];

    int HasHomeButton = DOCDeviceHasHomeButton();
    if (([v10 isEqualToString:@"iPhone"] & 1) != 0
      || [v10 isEqualToString:@"iPod touch"])
    {
      v12 = @"iphone.homebutton";
      if (!HasHomeButton) {
        v12 = @"iphone";
      }
    }
    else
    {
      if (![v10 isEqualToString:@"iPad"])
      {
        if ([v10 isEqualToString:@"Apple Vision"])
        {
          v13 = @"visionpro";
        }
        else
        {
          v16 = (NSObject **)MEMORY[0x263F3AC28];
          v17 = *MEMORY[0x263F3AC28];
          if (!*MEMORY[0x263F3AC28])
          {
            DOCInitLogging();
            v17 = *v16;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            [(UIDevice(DOCDeviceSymbol) *)(uint64_t)v10 doc_symbolName];
          }
          v13 = 0;
        }
        goto LABEL_15;
      }
      v12 = @"ipad";
      if (HasHomeButton) {
        v12 = @"ipad.homebutton";
      }
    }
    v13 = v12;
LABEL_15:
    if (v13) {
      v14 = v13;
    }
    else {
      v14 = @"iphone";
    }
    v8 = v14;
  }
  return v8;
}

- (void)doc_symbolName
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21361D000, log, OS_LOG_TYPE_ERROR, "Unable to get ISSymbol for UTI: %@ Error: %@", (uint8_t *)&v3, 0x16u);
}

@end