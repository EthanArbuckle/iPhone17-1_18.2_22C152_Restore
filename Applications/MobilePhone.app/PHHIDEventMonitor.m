@interface PHHIDEventMonitor
+ (id)HIDEventMonitor;
- (OS_dispatch_queue)dispatchQueue;
- (PHHIDEventMonitor)init;
- (__IOHIDEventSystemClient)HIDEventSystemClient;
- (id)stringFromIOHIDUsage:(int64_t)a3;
- (id)stringFromIOHIDUsagePage:(int64_t)a3;
- (void)dealloc;
- (void)handleKeyboardEvent:(__IOHIDEvent *)a3;
- (void)setHIDEventSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)start;
- (void)stop;
@end

@implementation PHHIDEventMonitor

+ (id)HIDEventMonitor
{
  v2 = objc_alloc_init(PHHIDEventMonitor);

  return v2;
}

- (PHHIDEventMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHHIDEventMonitor;
  v2 = [(PHHIDEventMonitor *)&v7 init];
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v4 = dispatch_queue_create("PHHIDEventMonitor.serialQueue", v3);
  dispatchQueue = v2->_dispatchQueue;
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  v2->_HIDEventSystemClient = 0;
  return v2;
}

- (void)dealloc
{
  [(PHHIDEventMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __28__PHHIDEventMonitor_dealloc__block_invoke;
  block[3] = &unk_10027CA40;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v7 = [(PHHIDEventMonitor *)self HIDEventSystemClient];
  v3 = v6;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)PHHIDEventMonitor;
  [(PHHIDEventMonitor *)&v4 dealloc];
}

void __28__PHHIDEventMonitor_dealloc__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    IOHIDEventSystemClientUnscheduleFromDispatchQueue();
    v2 = *(const void **)(a1 + 40);
    CFRelease(v2);
  }
}

- (void)start
{
  v3 = [(PHHIDEventMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __26__PHHIDEventMonitor_start__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v3, block);
}

id __26__PHHIDEventMonitor_start__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) HIDEventSystemClient];
  if (!result)
  {
    id result = (id)IOHIDEventSystemClientCreate();
    if (result)
    {
      id v3 = result;
      v5[0] = @"DeviceUsagePage";
      v5[1] = @"DeviceUsage";
      v6[0] = &off_10028CEA8;
      v6[1] = &off_10028CEC0;
      +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
      IOHIDEventSystemClientSetMatching();
      IOHIDEventSystemClientRegisterEventBlock();
      objc_super v4 = [*(id *)(a1 + 32) dispatchQueue];
      IOHIDEventSystemClientScheduleWithDispatchQueue();

      return [*(id *)(a1 + 32) setHIDEventSystemClient:v3];
    }
  }
  return result;
}

void __26__PHHIDEventMonitor_start__block_invoke_54(id a1, void *a2, void *a3, void *a4, __IOHIDEvent *a5)
{
  if (a2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = a2;
      BOOL v8 = IOHIDEventGetType() == 3;
      v9 = v10;
      if (v8)
      {
        [v10 handleKeyboardEvent:a5];
        v9 = v10;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
}

- (void)stop
{
  id v3 = [(PHHIDEventMonitor *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __25__PHHIDEventMonitor_stop__block_invoke;
  block[3] = &unk_10027C670;
  void block[4] = self;
  dispatch_async(v3, block);
}

id __25__PHHIDEventMonitor_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHIDEventSystemClient:0];
}

- (void)setHIDEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  HIDEventSystemClient = self->_HIDEventSystemClient;
  if (HIDEventSystemClient != a3)
  {
    if (HIDEventSystemClient)
    {
      id v6 = [(PHHIDEventMonitor *)self dispatchQueue];
      IOHIDEventSystemClientUnscheduleFromDispatchQueue();

      CFRelease(self->_HIDEventSystemClient);
    }
    self->_HIDEventSystemClient = a3;
  }
}

- (void)handleKeyboardEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v5 = IOHIDEventGetIntegerValue();
  uint64_t v6 = IOHIDEventGetIntegerValue();
  objc_super v7 = [(PHHIDEventMonitor *)self stringFromIOHIDUsagePage:IntegerValue];
  BOOL v8 = [(PHHIDEventMonitor *)self stringFromIOHIDUsage:v5];
  if (v7)
  {
    v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134219010;
      uint64_t v11 = IntegerValue;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%li - %li keyDown: %li (%@ - %@)", (uint8_t *)&v10, 0x34u);
    }
  }
}

- (id)stringFromIOHIDUsage:(int64_t)a3
{
  if (a3 <= 175)
  {
    id result = 0;
    switch(a3)
    {
      case ' ':
        id result = @"kHIDUsage_Tfon_HookSwitch";
        break;
      case '!':
        id result = @"kHIDUsage_Tfon_Flash";
        break;
      case '""':
      case '#':
      case '$':
      case '%':
      case '\'':
      case '(':
      case ')':
      case '+':
      case ',':
      case '-':
        return result;
      case '&':
        id result = @"kHIDUsage_Tfon_Drop";
        break;
      case '*':
        id result = @"kHIDUsage_KeyboardDeleteOrBackspace";
        break;
      case '.':
        id result = @"kHIDUsage_Tfon_Ring";
        break;
      case '/':
        id result = @"kHIDUsage_Tfon_PhoneMute";
        break;
      case '0':
        id result = @"kHIDUsage_Csmr_Power";
        break;
      default:
        if (a3 == 64) {
          id result = @"kHIDUsage_Csmr_Menu";
        }
        else {
          id result = 0;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 176:
        id result = @"kHIDUsage_Tfon_PhoneKey0";
        break;
      case 177:
        id result = @"kHIDUsage_Tfon_PhoneKey1";
        break;
      case 178:
        id result = @"kHIDUsage_Tfon_PhoneKey2";
        break;
      case 179:
        id result = @"kHIDUsage_Tfon_PhoneKey3";
        break;
      case 180:
        id result = @"kHIDUsage_Tfon_PhoneKey4";
        break;
      case 181:
        id result = @"kHIDUsage_Tfon_PhoneKey5";
        break;
      case 182:
        id result = @"kHIDUsage_Tfon_PhoneKey6";
        break;
      case 183:
        id result = @"kHIDUsage_Tfon_PhoneKey7";
        break;
      case 184:
        id result = @"kHIDUsage_Tfon_PhoneKey8";
        break;
      case 185:
        id result = @"kHIDUsage_Tfon_PhoneKey9";
        break;
      case 186:
        id result = @"kHIDUsage_Tfon_PhoneKeyStar";
        break;
      case 187:
        id result = @"kHIDUsage_Tfon_PhoneKeyPound";
        break;
      default:
        objc_super v4 = @"kHIDUsage_Csmr_VolumeDecrement";
        if (a3 != 234) {
          objc_super v4 = 0;
        }
        if (a3 == 233) {
          id result = @"kHIDUsage_Csmr_VolumeIncrement";
        }
        else {
          id result = v4;
        }
        break;
    }
  }
  return result;
}

- (id)stringFromIOHIDUsagePage:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) > 5) {
    return 0;
  }
  else {
    return *(&off_10027D748 + a3 - 7);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (__IOHIDEventSystemClient)HIDEventSystemClient
{
  return self->_HIDEventSystemClient;
}

- (void).cxx_destruct
{
}

@end