@interface RTEventAgentHelper
+ (BOOL)launchdManaged;
+ (id)signingIdentifierFromSelf;
- (NSString)restorationIdentifier;
- (RTEventAgentHelper)initWithRestorationIdentifier:(id)a3;
- (void)setRestorationIdentifier:(id)a3;
@end

@implementation RTEventAgentHelper

- (RTEventAgentHelper)initWithRestorationIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && +[RTEventAgentHelper launchdManaged])
  {
    v21.receiver = self;
    v21.super_class = (Class)RTEventAgentHelper;
    v5 = [(RTEventAgentHelper *)&v21 init];
    if (v5)
    {
      id v6 = [NSString alloc];
      v7 = +[RTEventAgentHelper signingIdentifierFromSelf];
      uint64_t v8 = [v6 initWithFormat:@"%@-%@", v7, v4];
      restorationIdentifier = v5->_restorationIdentifier;
      v5->_restorationIdentifier = (NSString *)v8;

      if (v5->_restorationIdentifier)
      {
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        if (v10)
        {
          v11 = v10;
          xpc_object_t v12 = xpc_string_create([(NSString *)v5->_restorationIdentifier UTF8String]);
          if (v12)
          {
            v13 = v12;
            xpc_dictionary_set_value(v11, "RestorationIdentifier", v12);
            [@"com.apple.routined-events" UTF8String];
            xpc_set_event();
            v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = [(RTEventAgentHelper *)v5 restorationIdentifier];
              *(_DWORD *)buf = 138412290;
              v23 = v15;
              _os_log_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_INFO, "setup client with restorationIdentifier, %@", buf, 0xCu);
            }
            v16 = (const char *)[@"com.apple.routined-events" UTF8String];
            handler[0] = MEMORY[0x1E4F143A8];
            handler[1] = 3221225472;
            handler[2] = __52__RTEventAgentHelper_initWithRestorationIdentifier___block_invoke;
            handler[3] = &unk_1E5D745A0;
            v20 = v5;
            xpc_set_event_stream_handler(v16, MEMORY[0x1E4F14428], handler);
          }
        }
      }
    }
    self = v5;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
}

+ (BOOL)launchdManaged
{
  return 0;
}

+ (id)signingIdentifierFromSelf
{
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    id v4 = (__CFString *)SecTaskCopySigningIdentifier(v2, 0);
    CFRelease(v3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __52__RTEventAgentHelper_initWithRestorationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [*(id *)(a1 + 32) restorationIdentifier];
    int v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A8FEF000, v2, OS_LOG_TYPE_INFO, "client with restorationIdentifier, %@, woken up by CoreRoutine", (uint8_t *)&v4, 0xCu);
  }
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (void)setRestorationIdentifier:(id)a3
{
}

@end