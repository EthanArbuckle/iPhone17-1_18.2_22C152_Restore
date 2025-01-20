@interface CFXNotificationCenterSetupConnection
@end

@implementation CFXNotificationCenterSetupConnection

void ____CFXNotificationCenterSetupConnection_block_invoke(uint64_t a1, id a2)
{
  if (object_getClass(a2) == (Class)off_1ECE0A690)
  {
    string = xpc_dictionary_get_string(a2, "method");
    if (string && !strcmp("post_token", string) && xpc_dictionary_get_uint64(a2, "version") == 1)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(a2, "token");
      v17 = xpc_dictionary_get_string(a2, "name");
      size_t v18 = strlen(v17);
      v19 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)v17, v18, 0x8000100u, 0);
      v20 = xpc_dictionary_get_string(a2, "object");
      v21 = v20;
      if (v20)
      {
        if (!strcmp(v20, "kCFNotificationAnyObject"))
        {
          v21 = 0;
        }
        else
        {
          size_t v22 = strlen(v21);
          v21 = (const char *)CFStringCreateWithBytes((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)v21, v22, 0x8000100u, 0);
        }
      }
      xpc_object_t value = xpc_dictionary_get_value(a2, "userinfo");
      if (value)
      {
        v24 = value;
        bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(value);
        size_t length = xpc_data_get_length(v24);
        CFDataRef v27 = CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, bytes_ptr, length);
        CFPropertyListRef v28 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v27, 0, 0, 0);
        CFRelease(v27);
        __CFXNotificationPostToken(*(uint64_t **)(a1 + 32), uint64, v19, (uint64_t)v21, (uint64_t)v28);
        if (v28) {
          CFRelease(v28);
        }
      }
      else
      {
        __CFXNotificationPostToken(*(uint64_t **)(a1 + 32), uint64, v19, (uint64_t)v21, 0);
      }
      if (v21) {
        CFRelease(v21);
      }
      CFRelease(v19);
    }
  }
  else if (object_getClass(a2) == (Class)off_1ECE0A6A0)
  {
    if (a2 != off_1ECE0A660 && a2 != off_1ECE0A658 && a2 != off_1ECE0A650)
    {
      uint64_t v6 = MEMORY[0x185313310](a2);
      v13 = (void *)v6;
      v14 = "(null)";
      if (v6) {
        LOWORD(v14) = v6;
      }
      CFLog(3, @"Unknown or mysterious error received: %s", v7, v8, v9, v10, v11, v12, (__int16)v14);
      if (v13)
      {
        free(v13);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

@end