@interface MCPOIBusynessAnalytics
+ (id)shared;
+ (void)report:(unint64_t)a3;
+ (void)reportCompleteWithRTEnabled:(BOOL)a3 rtCollected:(BOOL)a4 rtError:(id)a5 dpEnabled:(BOOL)a6 dpCollected:(BOOL)a7 dpError:(id)a8 bpEnabled:(BOOL)a9 bpCollected:(BOOL)a10 bpError:(id)a11;
- (MCPOIBusynessAnalytics)init;
- (MCPOIBusynessCounters)counters;
@end

@implementation MCPOIBusynessAnalytics

+ (id)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009310;
  block[3] = &unk_10001D4D8;
  block[4] = a1;
  if (qword_100023A28 != -1) {
    dispatch_once(&qword_100023A28, block);
  }
  v2 = (void *)qword_100023A20;

  return v2;
}

- (MCPOIBusynessAnalytics)init
{
  v6.receiver = self;
  v6.super_class = (Class)MCPOIBusynessAnalytics;
  v2 = [(MCPOIBusynessAnalytics *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MCPOIBusynessCounters readFromDisk];
    counters = v2->_counters;
    v2->_counters = (MCPOIBusynessCounters *)v3;
  }
  return v2;
}

+ (void)report:(unint64_t)a3
{
  AnalyticsSendEventLazy();
  if (PLShouldLogRegisteredEvent())
  {
    v5 = [a1 shared];
    objc_super v6 = [v5 counters];
    [v6 incrementCounterForAnalytic:a3];
  }
}

+ (void)reportCompleteWithRTEnabled:(BOOL)a3 rtCollected:(BOOL)a4 rtError:(id)a5 dpEnabled:(BOOL)a6 dpCollected:(BOOL)a7 dpError:(id)a8 bpEnabled:(BOOL)a9 bpCollected:(BOOL)a10 bpError:(id)a11
{
  id v12 = a5;
  id v16 = a8;
  id v17 = a11;
  id v13 = v17;
  id v14 = v16;
  id v15 = v12;
  AnalyticsSendEventLazy();
}

- (MCPOIBusynessCounters)counters
{
  return self->_counters;
}

- (void).cxx_destruct
{
}

@end