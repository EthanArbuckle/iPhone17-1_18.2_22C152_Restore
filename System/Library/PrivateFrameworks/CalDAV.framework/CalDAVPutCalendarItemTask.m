@interface CalDAVPutCalendarItemTask
- (NSString)previousScheduleTag;
- (id)additionalHeaderValues;
- (id)description;
- (void)setPreviousScheduleTag:(id)a3;
@end

@implementation CalDAVPutCalendarItemTask

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CalDAVPutCalendarItemTask;
  v4 = [(CoreDAVPutTask *)&v8 description];
  v5 = [(CalDAVPutCalendarItemTask *)self previousScheduleTag];
  v6 = [v3 stringWithFormat:@"[%@], previousScheduleTag: [%@]", v4, v5];

  return v6;
}

- (id)additionalHeaderValues
{
  v7.receiver = self;
  v7.super_class = (Class)CalDAVPutCalendarItemTask;
  v3 = [(CoreDAVPostOrPutTask *)&v7 additionalHeaderValues];
  if (![(CoreDAVPostOrPutTask *)self forceToServer])
  {
    v4 = [(CalDAVPutCalendarItemTask *)self previousScheduleTag];
    uint64_t v5 = +[CalDAVUtils headersFromHeaders:v3 replacingPreconditionsWithScheduleTag:v4];

    v3 = (void *)v5;
  }
  return v3;
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