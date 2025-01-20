@interface AVOutputDeviceHID
- (AVOutputDeviceHID)initWithUUID:(id)a3 screenUUID:(id)a4 endpoint:(OpaqueFigEndpoint *)a5;
- (NSString)UUID;
- (NSString)screenID;
- (int64_t)inputMode;
- (void)dealloc;
- (void)setInputMode:(int64_t)a3;
@end

@implementation AVOutputDeviceHID

- (AVOutputDeviceHID)initWithUUID:(id)a3 screenUUID:(id)a4 endpoint:(OpaqueFigEndpoint *)a5
{
  v18.receiver = self;
  v18.super_class = (Class)AVOutputDeviceHID;
  id v8 = [(AVOutputDeviceHID *)&v18 init];
  if (v8)
  {
    *((void *)v8 + 1) = [a3 copy];
    *((void *)v8 + 2) = [a4 copy];
    if (a5)
    {
      CFTypeRef v9 = CFRetain(a5);
      *((void *)v8 + 4) = v9;
      CFTypeRef cf = 0;
      if (v9)
      {
        CFTypeRef v10 = v9;
        FigEndpointExtendedGetClassID();
        if (CMBaseObjectIsMemberOfClass())
        {
          uint64_t v11 = *((void *)v8 + 1);
          uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 24);
          uint64_t v13 = v12 ? v12 : 0;
          v14 = *(void (**)(CFTypeRef, uint64_t, void, CFTypeRef *))(v13 + 64);
          if (v14) {
            v14(v10, v11, *MEMORY[0x1E4F1CF80], &cf);
          }
        }
      }
    }
    else
    {
      *((void *)v8 + 4) = 0;
      CFTypeRef cf = 0;
    }
    *((void *)v8 + 3) = [*((id *)v8 + 3) integerValue];
    if (cf) {
      CFRelease(cf);
    }
    v15 = (AVOutputDeviceHID *)v8;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  endpoint = self->_endpoint;
  if (endpoint) {
    CFRelease(endpoint);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVOutputDeviceHID;
  [(AVOutputDeviceHID *)&v4 dealloc];
}

- (int64_t)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(int64_t)a3
{
  endpoint = self->_endpoint;
  if (endpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:a3];
      if (dword_1EB2D3A40)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      UUID = self->_UUID;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 24);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = *(unsigned int (**)(OpaqueFigEndpoint *, NSString *, uint64_t))(v10 + 56);
      if (v11)
      {
        if (!v11(endpoint, UUID, v6)) {
          self->_inputMode = a3;
        }
      }
    }
  }
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)screenID
{
  return self->_screenID;
}

@end