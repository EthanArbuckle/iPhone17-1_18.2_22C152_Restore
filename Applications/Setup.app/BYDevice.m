@interface BYDevice
+ (id)currentDevice;
- (BOOL)hasActionButton;
- (BOOL)hasCameraButton;
- (BOOL)hasDynamicIsland;
- (BOOL)hasHomeButton;
- (BOOL)isD33;
- (BOOL)isPowerButtonOppositeVolumeButtons;
- (BOOL)posedDeviceSelection_largeSizeDevice;
- (BYDevice)init;
- (NSString)deviceClass;
- (NSString)productType;
- (NSString)serialNumber;
- (id)currentDevice;
- (int)mainScreenClass;
- (int64_t)size;
- (int64_t)type;
@end

@implementation BYDevice

- (BOOL)posedDeviceSelection_largeSizeDevice
{
  int64_t v2 = [(BYDevice *)self size];
  char v7 = 0;
  BOOL v3 = 1;
  if (v2 != 5)
  {
    int64_t v4 = [(BYDevice *)self size];
    BOOL v3 = 1;
    if (v4 != 1)
    {
      unsigned __int8 v5 = [(BYDevice *)self isD33];
      BOOL v3 = 1;
      if ((v5 & 1) == 0)
      {
        v8 = +[UIDevice currentDevice];
        char v7 = 1;
        BOOL v3 = (id)[(UIDevice *)v8 userInterfaceIdiom] == (id)1;
      }
    }
  }
  BOOL v10 = v3;
  if (v7) {

  }
  return v10;
}

- (BOOL)isD33
{
  memcpy(__dst, &unk_100237018, sizeof(__dst));
  memcpy(v3, &unk_10023702C, sizeof(v3));
  return MGIsDeviceOneOfType() & 1;
}

+ (id)currentDevice
{
  unsigned __int8 v5 = (dispatch_once_t *)&unk_100321F58;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4C38);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  int64_t v2 = (void *)qword_100321F50;

  return v2;
}

- (id)currentDevice
{
  return self;
}

- (BYDevice)init
{
  SEL v18 = a2;
  id location = 0;
  v17.receiver = self;
  v17.super_class = (Class)BYDevice;
  id location = [(BYDevice *)&v17 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    theString1 = (__CFString *)MGGetStringAnswer();
    if (theString1)
    {
      if (CFStringCompare(theString1, @"iPad", 0)) {
        *((void *)location + 3) = 0;
      }
      else {
        *((void *)location + 3) = 1;
      }
      objc_storeStrong((id *)location + 5, theString1);
      CFRelease(theString1);
    }
    int v15 = MGGetSInt32Answer();
    uint64_t v14 = 0;
    if ([location type])
    {
      if (v15 == 11 || v15 == 14) {
        uint64_t v14 = 4;
      }
    }
    else
    {
      switch(v15)
      {
        case 5:
          uint64_t v14 = 2;
          break;
        case 9:
          uint64_t v14 = 1;
          break;
        case 15:
        case 30:
          uint64_t v14 = 3;
          break;
        case 18:
        case 31:
          uint64_t v14 = 6;
          break;
        case 19:
          uint64_t v14 = 5;
          break;
        case 22:
        case 24:
        case 25:
          uint64_t v14 = 0;
          break;
        default:
          break;
      }
    }
    *((void *)location + 4) = v14;
    *((_DWORD *)location + 4) = v15;
    BOOL v2 = MGGetSInt32Answer() != 2;
    *((unsigned char *)location + 8) = v2;
    uint64_t v3 = sub_1001EE380();
    char v4 = 0;
    if (v3) {
      char v4 = sub_1001EE0D8();
    }
    *((unsigned char *)location + 12) = v4 & 1;
    uint64_t v5 = MGCopyAnswer();
    v6 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v5;

    uint64_t v7 = *((void *)location + 3);
    if (v7)
    {
      if (v7 == 1) {
        *((unsigned char *)location + 9) = 0;
      }
    }
    else
    {
      *((unsigned char *)location + 9) = MGGetBoolAnswer() & 1;
    }
    char v13 = MGGetBoolAnswer() & 1;
    *((unsigned char *)location + 10) = v13;
    char v12 = MGGetBoolAnswer() & 1;
    *((unsigned char *)location + 11) = v12;
    uint64_t v8 = MGCopyAnswer();
    v9 = (void *)*((void *)location + 7);
    *((void *)location + 7) = v8;
  }
  BOOL v10 = (BYDevice *)location;
  objc_storeStrong(&location, 0);
  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)size
{
  return self->_size;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (BOOL)hasActionButton
{
  return self->_hasActionButton;
}

- (BOOL)hasCameraButton
{
  return self->_hasCameraButton;
}

- (BOOL)isPowerButtonOppositeVolumeButtons
{
  return self->_isPowerButtonOppositeVolumeButtons;
}

- (BOOL)hasDynamicIsland
{
  return self->_hasDynamicIsland;
}

- (int)mainScreenClass
{
  return self->_mainScreenClass;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
}

@end