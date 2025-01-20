@interface CMSContentFailureRecoveryEvent
- (CMSContentFailureRecoveryEvent)initWithSessionID:(id)a3 sessionIdentifier:(id)a4 recoveryDuration:(unint64_t)a5;
- (id)encoded;
- (unint64_t)recoveryDuration;
- (void)setRecoveryDuration:(unint64_t)a3;
@end

@implementation CMSContentFailureRecoveryEvent

- (CMSContentFailureRecoveryEvent)initWithSessionID:(id)a3 sessionIdentifier:(id)a4 recoveryDuration:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CMSContentFailureRecoveryEvent;
  v5 = -[CMSBaseContentFailureEvent initWithServiceID:sessionIdentifier:](&v8, sel_initWithServiceID_sessionIdentifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    [(CMSBaseContentFailureEvent *)v5 setEventName:@"com.apple.cloudmediaservices.contentFailureRecovery"];
    v6->_recoveryDuration = 0;
  }
  return v6;
}

- (id)encoded
{
  v7.receiver = self;
  v7.super_class = (Class)CMSContentFailureRecoveryEvent;
  v3 = [(CMSBaseContentFailureEvent *)&v7 encoded];
  v4 = (void *)[v3 mutableCopy];

  v5 = [NSNumber numberWithUnsignedLongLong:self->_recoveryDuration];
  [v4 setObject:v5 forKeyedSubscript:@"recoveryDuration"];

  return v4;
}

- (unint64_t)recoveryDuration
{
  return self->_recoveryDuration;
}

- (void)setRecoveryDuration:(unint64_t)a3
{
  self->_recoveryDuration = a3;
}

@end