@interface MSMailDefaultService
- (BOOL)_launchMobileMailSuspendedError:(id *)a3;
- (BOOL)shouldLaunchMobileMail;
- (MSMailDefaultService)init;
- (id)_createServiceOnQueue:(id)a3;
- (id)_handleMessageSendFailure:(id)a3 message:(id)a4 messageIndex:(int64_t)a5 context:(id *)a6;
- (void)setShouldLaunchMobileMail:(BOOL)a3;
@end

@implementation MSMailDefaultService

- (void)setShouldLaunchMobileMail:(BOOL)a3
{
  self->_shouldLaunch = a3;
}

- (MSMailDefaultService)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSMailDefaultService;
  v2 = [(MSService *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldLaunch = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_createServiceOnQueue:(id)a3
{
  v3 = a3;
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.mobilemail.services.xpc" UTF8String], v3, 0);

  return mach_service;
}

- (BOOL)_launchMobileMailSuspendedError:(id *)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F3B398] promise];
  uint64_t v11 = *MEMORY[0x263F3F598];
  v12[0] = MEMORY[0x263EFFA88];
  v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  objc_super v6 = [MEMORY[0x263F3F808] sharedService];
  v7 = [v4 errorOnlyCompletionHandlerAdapter];
  [v6 openApplication:*MEMORY[0x263F556D0] options:v5 withResult:v7];

  v8 = [v4 future];
  v9 = [v8 resultWithTimeout:a3 error:5.0];
  LOBYTE(a3) = v9 != 0;

  return (char)a3;
}

- (id)_handleMessageSendFailure:(id)a3 message:(id)a4 messageIndex:(int64_t)a5 context:(id *)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!a6) {
    __assert_rtn("-[MSMailDefaultService _handleMessageSendFailure:message:messageIndex:context:]", "MSMailDefaultService.m", 63, "context && \"we have to have a context passed in\"");
  }
  id v12 = *a6;
  if (!*a6)
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    *a6 = v12;
  }
  id v13 = v12;
  v14 = [v13 objectForKey:@"launchedMail"];
  char v15 = [v14 BOOLValue];

  v16 = [v13 objectForKey:@"elapsedTime"];
  [v16 doubleValue];
  double v18 = v17;

  if (v10 == (id)MEMORY[0x263EF86A8])
  {
    [(MSService *)self stop];
    [(MSService *)self start];
  }
  else if (v10 == (id)MEMORY[0x263EF86A0] || v10 == (id)MEMORY[0x263EF86C0])
  {
    [MEMORY[0x263F08B88] sleepForTimeInterval:0.100000001];
  }
  if (self->_shouldLaunch && MKBDeviceUnlockedSinceBoot())
  {
    if (v15)
    {
      if (v18 < 5.0)
      {
        if (5.0 - v18 <= 0.5) {
          double v19 = 5.0 - v18;
        }
        else {
          double v19 = 0.5;
        }
        v20 = [NSNumber numberWithDouble:v18 + v19];
        [v13 setObject:v20 forKey:@"elapsedTime"];

        [MEMORY[0x263F08B88] sleepForTimeInterval:v19];
        v21 = MFLogGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [(MSService *)self _connection];
          *(_DWORD *)buf = 138413058;
          v29 = self;
          __int16 v30 = 2048;
          int64_t v31 = a5;
          __int16 v32 = 2048;
          v33 = v22;
          __int16 v34 = 2048;
          id v35 = v11;
          _os_log_impl(&dword_215471000, v21, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> delayed send, message <dictionary: %p>", buf, 0x2Au);
        }
LABEL_22:

        v25 = 0;
        goto LABEL_25;
      }
    }
    else if ([(MSMailDefaultService *)self _launchMobileMailSuspendedError:0])
    {
      [v13 setObject:*MEMORY[0x263EFFB40] forKey:@"launchedMail"];
      v21 = MFLogGeneral();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v24 = [(MSService *)self _connection];
        *(_DWORD *)buf = 138413058;
        v29 = self;
        __int16 v30 = 2048;
        int64_t v31 = a5;
        __int16 v32 = 2048;
        v33 = v24;
        __int16 v34 = 2048;
        id v35 = v11;
        _os_log_impl(&dword_215471000, v21, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> launched Mail, message <dictionary: %p>", buf, 0x2Au);
      }
      goto LABEL_22;
    }
    v27.receiver = self;
    v27.super_class = (Class)MSMailDefaultService;
    uint64_t v23 = [(MSService *)&v27 _handleMessageSendFailure:v10 message:v11 messageIndex:a5 context:a6];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"MailServices" code:1 userInfo:0];
  }
  v25 = (void *)v23;
LABEL_25:

  return v25;
}

- (BOOL)shouldLaunchMobileMail
{
  return self->_shouldLaunch;
}

@end