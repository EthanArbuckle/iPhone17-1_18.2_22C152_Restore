@interface APSSymptomReporter
- (APSSymptomReporter)init;
- (void)reportClientIPAddress:(id)a3 forInterfaceOfName:(id)a4;
- (void)reportConnectionFailureOnConnectionType:(int64_t)a3;
- (void)reportConnectionSuccessOnConnectionType:(int64_t)a3;
- (void)reportSymptomToAutoBugCapture:(id)a3 subType:(id)a4;
@end

@implementation APSSymptomReporter

- (APSSymptomReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)APSSymptomReporter;
  v2 = [(APSSymptomReporter *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.aps.symptom-reporter-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    v6 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v5, v6);

    v7 = v2;
  }

  return v2;
}

- (void)reportSymptomToAutoBugCapture:(id)a3 subType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005ADC;
  block[3] = &unk_100129B68;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)reportConnectionFailureOnConnectionType:(int64_t)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C8C;
  block[3] = &unk_100129C08;
  block[4] = a3;
  dispatch_async(queue, block);
}

- (void)reportConnectionSuccessOnConnectionType:(int64_t)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EBC;
  block[3] = &unk_100129C08;
  block[4] = a3;
  dispatch_async(queue, block);
}

- (void)reportClientIPAddress:(id)a3 forInterfaceOfName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006140;
  v11[3] = &unk_100129D10;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_diagnosticReporter, 0);
}

@end