@interface CalDAVPostCalendarItemTask
- (NSString)previousScheduleTag;
- (id)additionalHeaderValues;
- (id)description;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setPreviousScheduleTag:(id)a3;
@end

@implementation CalDAVPostCalendarItemTask

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CalDAVPostCalendarItemTask;
  v4 = [(CoreDAVPostOrPutTask *)&v8 description];
  v5 = [(CalDAVPostCalendarItemTask *)self previousScheduleTag];
  v6 = [v3 stringWithFormat:@"[%@], previousScheduleTag: [%@]", v4, v5];

  return v6;
}

- (id)additionalHeaderValues
{
  v7.receiver = self;
  v7.super_class = (Class)CalDAVPostCalendarItemTask;
  v3 = [(CoreDAVPostOrPutTask *)&v7 additionalHeaderValues];
  if (![(CoreDAVPostOrPutTask *)self forceToServer])
  {
    v4 = [(CalDAVPostCalendarItemTask *)self previousScheduleTag];
    uint64_t v5 = +[CalDAVUtils headersFromHeaders:v3 replacingPreconditionsWithScheduleTag:v4];

    v3 = (void *)v5;
  }
  return v3;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CalDAVPostCalendarItemTask *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(CalDAVPostCalendarItemTask *)self delegate];
    [v7 postCalendarItemTask:self completedWithError:v4];
  }
  [(CalDAVPostCalendarItemTask *)self setDelegate:0];
  v8.receiver = self;
  v8.super_class = (Class)CalDAVPostCalendarItemTask;
  [(CoreDAVPostTask *)&v8 finishCoreDAVTaskWithError:v4];
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end