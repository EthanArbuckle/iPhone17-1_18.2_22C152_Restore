@interface AMSBiometricsAvailabilityTask
- (AMSBiometricsAvailabilityTask)init;
- (AMSBiometricsAvailabilityTask)initWithAccount:(id)a3 forSignaturePurpose:(unint64_t)a4;
- (AMSDaemonConnection)connection;
- (id)perform;
@end

@implementation AMSBiometricsAvailabilityTask

- (AMSDaemonConnection)connection
{
  id v2 = sub_18D75B1BC();
  return (AMSDaemonConnection *)v2;
}

- (AMSBiometricsAvailabilityTask)initWithAccount:(id)a3 forSignaturePurpose:(unint64_t)a4
{
  return (AMSBiometricsAvailabilityTask *)sub_18D75B1CC(a3, a4);
}

- (id)perform
{
  id v2 = self;
  id v3 = sub_18D75B2A8();

  return v3;
}

- (AMSBiometricsAvailabilityTask)init
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSBiometricsAvailabilityTask_connection);
}

@end