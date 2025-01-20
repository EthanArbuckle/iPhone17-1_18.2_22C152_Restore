@interface AVExternalDeviceHID
- (AVExternalDeviceHID)initWithExternalDeviceAndHIDDictionary:(id)a3 hidDictionary:(id)a4;
- (NSString)UUID;
- (NSString)screenID;
- (id)_externalDevice;
- (id)_figEndpointHIDInputMode;
- (int64_t)inputMode;
- (void)dealloc;
- (void)setInputMode:(int64_t)a3;
@end

@implementation AVExternalDeviceHID

- (id)_figEndpointHIDInputMode
{
  v10 = 0;
  v3 = objc_msgSend(-[AVExternalDeviceHID _externalDevice](self, "_externalDevice"), "figEndpoint");
  if (v3)
  {
    v4 = v3;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass()
      && ((UUID = self->_externalDeviceHID->UUID, (uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24)) == 0)
        ? (uint64_t v7 = 0)
        : (uint64_t v7 = v6),
          (v8 = *(void (**)(void *, NSString *, void, void **))(v7 + 64)) != 0))
    {
      v8(v4, UUID, *MEMORY[0x1E4F1CF80], &v10);
      v3 = v10;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (AVExternalDeviceHID)initWithExternalDeviceAndHIDDictionary:(id)a3 hidDictionary:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVExternalDeviceHID;
  uint64_t v6 = [(AVExternalDeviceHID *)&v9 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(AVExternalDeviceHIDInternal);
    v6->_externalDeviceHID = v7;
    if (v7)
    {
      v6->_externalDeviceHID->weakReferenceToExternalDevice = (AVWeakReference *)(id)[a3 _weakReference];
      v6->_externalDeviceHID->UUID = (NSString *)(id)[a4 objectForKey:*MEMORY[0x1E4F20598]];
      v6->_externalDeviceHID->screenID = (NSString *)(id)[a4 objectForKey:*MEMORY[0x1E4F20590]];
      v6->_externalDeviceHID->inputMode = (NSNumber *)[(AVExternalDeviceHID *)v6 _figEndpointHIDInputMode];
      CFRetain(v6->_externalDeviceHID);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  externalDeviceHID = self->_externalDeviceHID;
  if (externalDeviceHID)
  {

    CFRelease(self->_externalDeviceHID);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVExternalDeviceHID;
  [(AVExternalDeviceHID *)&v4 dealloc];
}

- (NSString)screenID
{
  return self->_externalDeviceHID->screenID;
}

- (NSString)UUID
{
  return self->_externalDeviceHID->UUID;
}

- (int64_t)inputMode
{
  return [(NSNumber *)self->_externalDeviceHID->inputMode integerValue];
}

- (void)setInputMode:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(-[AVExternalDeviceHID _externalDevice](self, "_externalDevice"), "figEndpoint");
  if (v5)
  {
    uint64_t v6 = v5;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {

      self->_externalDeviceHID->inputMode = (NSNumber *)(id)[MEMORY[0x1E4F28ED0] numberWithInt:a3];
      externalDeviceHID = self->_externalDeviceHID;
      UUID = externalDeviceHID->UUID;
      inputMode = externalDeviceHID->inputMode;
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 24);
      uint64_t v11 = v10 ? v10 : 0;
      v12 = *(void (**)(uint64_t, NSString *, NSNumber *))(v11 + 56);
      if (v12)
      {
        v12(v6, UUID, inputMode);
      }
    }
  }
}

- (id)_externalDevice
{
  return [(AVWeakReference *)self->_externalDeviceHID->weakReferenceToExternalDevice referencedObject];
}

@end