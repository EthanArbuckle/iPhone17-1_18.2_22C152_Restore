@interface BLEMIDIAccessor
+ (BOOL)deviceIsLocalPeripheral:(unsigned int)a3;
+ (BOOL)deviceIsNullDevice:(unsigned int)a3;
+ (BOOL)deviceIsOnline:(unsigned int)a3;
+ (BOOL)deviceIsRemotePeripheral:(unsigned int)a3;
+ (BOOL)uuidIsForgettable:(id)a3;
+ (id)localPeripheralName;
+ (id)nameForMIDIDevice:(unsigned int)a3;
+ (id)uuidForMIDIDevice:(unsigned int)a3;
+ (unint64_t)timeStampWithEpoch:(unint64_t)a3 offset:(unsigned __int16)a4;
+ (unsigned)localPeripheral;
+ (unsigned)midiDeviceForUUID:(id)a3;
+ (unsigned)midiDeviceForUUID:(id)a3 isLocalPeripheral:(BOOL)a4 isRemotePeripheral:(BOOL)a5;
+ (unsigned)nullDevice;
+ (unsigned)reconstructWithHighByte:(unsigned __int8)a3 lowByte:(unsigned __int8)a4 overflow:(BOOL)a5;
+ (unsigned)timeStampOffset:(unint64_t)a3;
+ (void)logEvent:(char *)a3 length:(unsigned __int16)a4 timeStamp:(unint64_t)a5 intoBuffer:(char *)a6;
+ (void)splitOffset:(unsigned __int16)a3 intoHeaderByte:(char *)a4 timeStampByte:(char *)a5;
@end

@implementation BLEMIDIAccessor

+ (void)logEvent:(char *)a3 length:(unsigned __int16)a4 timeStamp:(unint64_t)a5 intoBuffer:(char *)a6
{
  unsigned int v7 = a4;
  unint64_t v9 = __udivti3();
  unsigned __int16 v10 = snprintf(a6, 0x7D0uLL, "Timestamp: %10.10llu ms MIDI:", v9 / 0xF4240);
  int v11 = v10;
  if (v10)
  {
    if (v7)
    {
      unsigned __int16 v12 = v10;
      unsigned __int16 v13 = 2000 - v10;
      uint64_t v14 = v7;
      do
      {
        unsigned __int16 v15 = v13;
        if (v13 < 4u) {
          break;
        }
        int v16 = (unsigned __int16)snprintf(&a6[v12], 2000 - v12, " %02.2X", *a3);
        if (!v16) {
          break;
        }
        v12 += v16;
        unsigned __int16 v13 = v15 - v16;
        ++a3;
        --v14;
      }
      while (v14);
      int v11 = v12;
    }
    a6[v11] = 0;
  }
}

+ (void)splitOffset:(unsigned __int16)a3 intoHeaderByte:(char *)a4 timeStampByte:(char *)a5
{
  *a4 = (a3 >> 7) & 0x3F | 0x80;
  *a5 = a3 | 0x80;
}

+ (unint64_t)timeStampWithEpoch:(unint64_t)a3 offset:(unsigned __int16)a4
{
  return a3 + a4;
}

+ (unsigned)reconstructWithHighByte:(unsigned __int8)a3 lowByte:(unsigned __int8)a4 overflow:(BOOL)a5
{
  return a4 | ((a5 + a3) << 7);
}

+ (unsigned)timeStampOffset:(unint64_t)a3
{
  return ((((unint64_t)__udivti3() * (unsigned __int128)0x431BDE82D7B634DBuLL) >> 64) >> 18) & 0x1FFF;
}

+ (BOOL)uuidIsForgettable:(id)a3
{
  uint64_t v3 = +[BLEMIDIAccessor midiDeviceForUUID:a3 isLocalPeripheral:0 isRemotePeripheral:1];
  if (v3) {
    LOBYTE(v3) = !+[BLEMIDIAccessor deviceIsOnline:v3];
  }
  return v3;
}

+ (BOOL)deviceIsOnline:(unsigned int)a3
{
  BOOL result = a3;
  SInt32 outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, kMIDIPropertyOffline, &outValue);
    return outValue == 0;
  }
  return result;
}

+ (BOOL)deviceIsNullDevice:(unsigned int)a3
{
  BOOL result = a3;
  SInt32 outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, @"is BLE MIDI null device", &outValue);
    return outValue != 0;
  }
  return result;
}

+ (BOOL)deviceIsLocalPeripheral:(unsigned int)a3
{
  BOOL result = a3;
  SInt32 outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, @"MIDI Local Peripheral", &outValue);
    return outValue != 0;
  }
  return result;
}

+ (BOOL)deviceIsRemotePeripheral:(unsigned int)a3
{
  BOOL result = a3;
  SInt32 outValue = 0;
  if (a3)
  {
    MIDIObjectGetIntegerProperty(a3, @"MIDI Remote Peripheral", &outValue);
    return outValue != 0;
  }
  return result;
}

+ (id)nameForMIDIDevice:(unsigned int)a3
{
  if (!a3) {
    return 0;
  }
  CFStringRef str = 0;
  MIDIObjectGetStringProperty(a3, kMIDIPropertyName, &str);
  if (!str) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(NSString, "stringWithString:");
  CFRelease(str);
  return v3;
}

+ (id)uuidForMIDIDevice:(unsigned int)a3
{
  if (!a3) {
    return 0;
  }
  CFStringRef str = 0;
  MIDIObjectGetStringProperty(a3, @"BLE MIDI Device UUID", &str);
  if (!str) {
    return 0;
  }
  uint64_t v3 = objc_msgSend(NSString, "stringWithString:");
  CFRelease(str);
  return v3;
}

+ (id)localPeripheralName
{
  uint64_t v2 = +[BLEMIDIAccessor localPeripheral];
  uint64_t v3 = @"Unknown";
  if (v2)
  {
    id v4 = +[BLEMIDIAccessor nameForMIDIDevice:v2];
    if (v4) {
      return v4;
    }
  }
  return v3;
}

+ (unsigned)localPeripheral
{
  ItemCount v2 = MIDIGetNumberOfDevices();
  if (v2)
  {
    ItemCount v3 = v2;
    for (ItemCount i = 0; v3 != i; ++i)
    {
      MIDIDeviceRef v5 = MIDIGetDevice(i);
      if (v5)
      {
        MIDIObjectRef v6 = v5;
        CFStringRef str = 0;
        MIDIObjectGetStringProperty(v5, kMIDIPropertyDriverOwner, &str);
        if (str)
        {
          if (CFEqual(str, @"com.apple.AppleMIDIBluetoothDriver"))
          {
            CFRelease(str);
            *(void *)SInt32 outValue = 0;
            MIDIObjectGetIntegerProperty(v6, @"MIDI Local Peripheral", &outValue[1]);
            MIDIObjectGetIntegerProperty(v6, kMIDIPropertyOffline, outValue);
            if (outValue[1] && !outValue[0]) {
              return v6;
            }
          }
          else if (str)
          {
            CFRelease(str);
          }
        }
      }
    }
  }
  return 0;
}

+ (unsigned)nullDevice
{
  ItemCount v2 = MIDIGetNumberOfDevices();
  if (v2)
  {
    ItemCount v3 = v2;
    for (ItemCount i = 0; i != v3; ++i)
    {
      MIDIDeviceRef v5 = MIDIGetDevice(i);
      if (v5)
      {
        MIDIObjectRef v6 = v5;
        CFStringRef str = 0;
        MIDIObjectGetStringProperty(v5, kMIDIPropertyDriverOwner, &str);
        if (str)
        {
          if (CFEqual(str, @"com.apple.AppleMIDIBluetoothDriver"))
          {
            CFRelease(str);
            SInt32 outValue = 0;
            MIDIObjectGetIntegerProperty(v6, @"is BLE MIDI null device", &outValue);
            if (outValue) {
              return v6;
            }
          }
          else if (str)
          {
            CFRelease(str);
          }
        }
      }
    }
  }
  return 0;
}

+ (unsigned)midiDeviceForUUID:(id)a3 isLocalPeripheral:(BOOL)a4 isRemotePeripheral:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = +[BLEMIDIAccessor midiDeviceForUUID:a3];
  if (!v7
    || (uint64_t v8 = v7,
        +[BLEMIDIAccessor deviceIsLocalPeripheral:v7] != v6)
    || +[BLEMIDIAccessor deviceIsRemotePeripheral:v8] != v5)
  {
    LODWORD(v8) = 0;
  }
  return v8;
}

+ (unsigned)midiDeviceForUUID:(id)a3
{
  ItemCount v4 = MIDIGetNumberOfDevices();
  LODWORD(v5) = 0;
  if (a3)
  {
    ItemCount v6 = v4;
    if (v4)
    {
      ItemCount v7 = 0;
      do
      {
        CFStringRef str = 0;
        uint64_t v5 = MIDIGetDevice(v7);
        if (!MIDIObjectGetStringProperty(v5, kMIDIPropertyDriverOwner, &str) && str)
        {
          if (CFEqual(str, @"com.apple.AppleMIDIBluetoothDriver"))
          {
            id v8 = +[BLEMIDIAccessor uuidForMIDIDevice:v5];
            if (v8)
            {
              if ([v8 isEqualToString:a3]) {
                goto LABEL_13;
              }
            }
          }
          if (str)
          {
            CFRelease(str);
            CFStringRef str = 0;
          }
        }
        ++v7;
      }
      while (v6 != v7);
      LODWORD(v5) = 0;
LABEL_13:
      if (str) {
        CFRelease(str);
      }
    }
  }
  return v5;
}

@end