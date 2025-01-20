@interface CMSContentFailureEvent
- (BOOL)didReachMaxRetries;
- (BOOL)doesServiceSupportPlaybackFailureRecovery;
- (CMSContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4 errorCode:(int64_t)a5;
- (CMSContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4 errorCode:(int64_t)a5 doesServiceSupportPlaybackFailureRecovery:(BOOL)a6;
- (id)encoded;
- (int64_t)errorCode;
- (void)setDidReachMaxRetries:(BOOL)a3;
- (void)setDoesServiceSupportPlaybackFailureRecovery:(BOOL)a3;
- (void)setErrorCode:(int64_t)a3;
@end

@implementation CMSContentFailureEvent

- (CMSContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4 errorCode:(int64_t)a5 doesServiceSupportPlaybackFailureRecovery:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CMSContentFailureEvent;
  v8 = [(CMSBaseContentFailureEvent *)&v11 initWithServiceID:a3 sessionIdentifier:a4];
  v9 = v8;
  if (v8)
  {
    [(CMSBaseContentFailureEvent *)v8 setEventName:@"com.apple.cloudmediaservices.contentFailure"];
    v9->_errorCode = a5;
    v9->_doesServiceSupportPlaybackFailureRecovery = a6;
    v9->_didReachMaxRetries = 0;
  }
  return v9;
}

- (CMSContentFailureEvent)initWithServiceID:(id)a3 sessionIdentifier:(id)a4 errorCode:(int64_t)a5
{
  return [(CMSContentFailureEvent *)self initWithServiceID:a3 sessionIdentifier:a4 errorCode:a5 doesServiceSupportPlaybackFailureRecovery:0];
}

- (id)encoded
{
  v9.receiver = self;
  v9.super_class = (Class)CMSContentFailureEvent;
  v3 = [(CMSBaseContentFailureEvent *)&v9 encoded];
  v4 = (void *)[v3 mutableCopy];

  v5 = [NSNumber numberWithInteger:self->_errorCode];
  [v4 setObject:v5 forKeyedSubscript:@"errorCode"];

  v6 = [NSNumber numberWithBool:self->_didReachMaxRetries];
  [v4 setObject:v6 forKeyedSubscript:@"didReachMaxRetries"];

  v7 = [NSNumber numberWithBool:self->_doesServiceSupportPlaybackFailureRecovery];
  [v4 setObject:v7 forKeyedSubscript:@"doesServiceSupportPlaybackFailureRecovery"];

  return v4;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (BOOL)didReachMaxRetries
{
  return self->_didReachMaxRetries;
}

- (void)setDidReachMaxRetries:(BOOL)a3
{
  self->_didReachMaxRetries = a3;
}

- (BOOL)doesServiceSupportPlaybackFailureRecovery
{
  return self->_doesServiceSupportPlaybackFailureRecovery;
}

- (void)setDoesServiceSupportPlaybackFailureRecovery:(BOOL)a3
{
  self->_doesServiceSupportPlaybackFailureRecovery = a3;
}

@end