@interface CalDAVScheduleTask
- (CalDAVScheduleResponseItem)scheduleResponse;
- (CalDAVScheduleTask)initWithOriginator:(id)a3 attendees:(id)a4 outboxURL:(id)a5 payload:(id)a6;
- (NSArray)attendees;
- (NSString)originator;
- (id)copyDefaultParserForContentType:(id)a3;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setAttendees:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setScheduleResponse:(id)a3;
@end

@implementation CalDAVScheduleTask

- (CalDAVScheduleTask)initWithOriginator:(id)a3 attendees:(id)a4 outboxURL:(id)a5 payload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVScheduleTask;
  v12 = [(CoreDAVPostTask *)&v15 initWithDataPayload:a6 dataContentType:@"text/calendar" atURL:a5 previousETag:0];
  v13 = v12;
  if (v12)
  {
    [(CalDAVScheduleTask *)v12 setOriginator:v10];
    [(CalDAVScheduleTask *)v13 setAttendees:v11];
  }

  return v13;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34BC0]);
  uint64_t v5 = *MEMORY[0x263F34CD8];
  uint64_t v6 = objc_opt_class();
  v7 = [(CalDAVScheduleTask *)self url];
  v8 = (void *)[v4 initWithRootElementNameSpace:v5 name:@"schedule-response" parseClass:v6 baseURL:v7];

  return v8;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    v7 = [MEMORY[0x263F34B30] sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F34C50]));
    v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v18 = (id)objc_opt_class();
          id v11 = v18;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_10:
          _os_log_impl(&dword_213CEC000, v13, v14, v12, buf, v15);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else if (v9)
    {
      id v10 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2112;
        v20 = v5;
        id v11 = v18;
        v12 = "%{public}@ failed: %@";
        v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 22;
        goto LABEL_10;
      }
LABEL_11:
    }
  }
  else
  {
    v7 = [(CalDAVScheduleTask *)self responseBodyParser];
    v9 = [v7 rootElement];
    [(CalDAVScheduleTask *)self setScheduleResponse:v9];
  }

  v16.receiver = self;
  v16.super_class = (Class)CalDAVScheduleTask;
  [(CoreDAVPostTask *)&v16 finishCoreDAVTaskWithError:v5];
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
}

- (CalDAVScheduleResponseItem)scheduleResponse
{
  return self->_scheduleResponse;
}

- (void)setScheduleResponse:(id)a3
{
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_scheduleResponse, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
}

@end