@interface _CLFAppAvailabilityObserver
- (APSubjectMonitorSubscription)subscription;
- (_CLFAppAvailabilityObserver)initWithHandler:(id)a3;
- (id)handler;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)invalidate;
- (void)setHandler:(id)a3;
- (void)setSubscription:(id)a3;
@end

@implementation _CLFAppAvailabilityObserver

- (_CLFAppAvailabilityObserver)initWithHandler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CLFAppAvailabilityObserver;
  v5 = [(_CLFAppAvailabilityObserver *)&v14 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x21D45DC70](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v8 = (void *)getAPSubjectClass_softClass;
    uint64_t v19 = getAPSubjectClass_softClass;
    if (!getAPSubjectClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getAPSubjectClass_block_invoke;
      v15[3] = &unk_2642F3758;
      v15[4] = &v16;
      __getAPSubjectClass_block_invoke((uint64_t)v15);
      v8 = (void *)v17[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v16, 8);
    v10 = [v9 subjectMonitorRegistry];
    uint64_t v11 = [v10 addMonitor:v5 subjectMask:1];
    subscription = v5->_subscription;
    v5->_subscription = (APSubjectMonitorSubscription *)v11;
  }
  return v5;
}

- (void)invalidate
{
  id v2 = [(_CLFAppAvailabilityObserver *)self subscription];
  [v2 invalidate];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end