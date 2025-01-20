@interface AMSMetricsBatch
- (ACAccount)account;
- (BOOL)anonymous;
- (BOOL)containsLoadURL;
- (NSArray)droppedEvents;
- (NSArray)eventDictionaries;
- (NSArray)events;
- (NSArray)skippedEvents;
- (NSString)canaryIdentifier;
- (NSURL)reportURL;
- (void)setAccount:(id)a3;
- (void)setAnonymous:(BOOL)a3;
- (void)setCanaryIdentifier:(id)a3;
- (void)setContainsLoadURL:(BOOL)a3;
- (void)setDroppedEvents:(id)a3;
- (void)setEventDictionaries:(id)a3;
- (void)setEvents:(id)a3;
- (void)setReportURL:(id)a3;
- (void)setSkippedEvents:(id)a3;
@end

@implementation AMSMetricsBatch

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

- (NSString)canaryIdentifier
{
  return self->_canaryIdentifier;
}

- (void)setCanaryIdentifier:(id)a3
{
}

- (BOOL)containsLoadURL
{
  return self->_containsLoadURL;
}

- (void)setContainsLoadURL:(BOOL)a3
{
  self->_containsLoadURL = a3;
}

- (NSArray)droppedEvents
{
  return self->_droppedEvents;
}

- (void)setDroppedEvents:(id)a3
{
}

- (NSArray)eventDictionaries
{
  return self->_eventDictionaries;
}

- (void)setEventDictionaries:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (NSURL)reportURL
{
  return self->_reportURL;
}

- (void)setReportURL:(id)a3
{
}

- (NSArray)skippedEvents
{
  return self->_skippedEvents;
}

- (void)setSkippedEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skippedEvents, 0);
  objc_storeStrong((id *)&self->_reportURL, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_eventDictionaries, 0);
  objc_storeStrong((id *)&self->_droppedEvents, 0);
  objc_storeStrong((id *)&self->_canaryIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end