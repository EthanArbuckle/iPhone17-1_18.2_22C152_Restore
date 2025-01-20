@interface ComponentButtonBase
- (ComponentButtonBase)init;
- (NSArray)buttonsDetected;
- (id)parseStringToArray:(char *)a3 length:(unint64_t)a4;
- (void)setButtonsDetected:(id)a3;
@end

@implementation ComponentButtonBase

- (ComponentButtonBase)init
{
  v7.receiver = self;
  v7.super_class = (Class)ComponentButtonBase;
  v2 = [(ComponentButtonBase *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(ComponentButtonBase *)v2 buttonsDetected];
    buttonsDetected = v3->_buttonsDetected;
    v3->_buttonsDetected = (NSArray *)v4;
  }
  return v3;
}

- (id)parseStringToArray:(char *)a3 length:(unint64_t)a4
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if (a4)
  {
    uint64_t v7 = 0;
    v8 = a3;
    do
    {
      if (a3[v7])
      {
        ++v7;
      }
      else
      {
        v9 = +[NSString stringWithUTF8String:v8];
        [v6 addObject:v9];

        v8 = &a3[++v7];
      }
    }
    while (v7 != a4);
  }

  return v6;
}

- (NSArray)buttonsDetected
{
  int v10 = 0;
  if (FindDevicesWithProp("IOService:name", "buttons", (uint64_t)entry, 30, &v10))
  {
LABEL_2:
    v3 = 0;
    goto LABEL_13;
  }
  if (!v10)
  {
    v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(properties) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: IOService:buttons is not found in IORegistry", (uint8_t *)&properties, 2u);
    }

    goto LABEL_2;
  }
  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryCreateCFProperties(entry[0], &properties, 0, 0))
  {
    uint64_t v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error: IORegistryEntryCreateCFProperties failed", v8, 2u);
    }
    v3 = 0;
  }
  else
  {
    id v6 = properties;
    uint64_t v4 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"button-names"];
    v3 = [(ComponentButtonBase *)self parseStringToArray:[v4 bytes] length:[v4 length]];
    CFRelease(properties);
  }
LABEL_13:

  return (NSArray *)v3;
}

- (void)setButtonsDetected:(id)a3
{
}

- (void).cxx_destruct
{
}

@end