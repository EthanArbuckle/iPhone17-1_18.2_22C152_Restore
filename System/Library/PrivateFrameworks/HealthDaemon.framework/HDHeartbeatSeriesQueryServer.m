@interface HDHeartbeatSeriesQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (void)_queue_start;
@end

@implementation HDHeartbeatSeriesQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_queue_start
{
  v9.receiver = self;
  v9.super_class = (Class)HDHeartbeatSeriesQueryServer;
  [(HDQueryServer *)&v9 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [(HDQueryServer *)self objectType];
  id v8 = 0;
  v5 = [(HDQueryServer *)self readAuthorizationStatusForType:v4 error:&v8];
  id v6 = v8;

  if (v5)
  {
    objc_msgSend(v3, "client_deliverHeartbeats");
  }
  else
  {
    v7 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v3, "client_deliverError:forQuery:", v6, v7);
  }
}

@end