@interface PushDiagnostic
- (PushDiagnostic)initWithService:(id)a3;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4;
@end

@implementation PushDiagnostic

- (PushDiagnostic)initWithService:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PushDiagnostic;
  v5 = [(PushDiagnostic *)&v7 init];
  if (v5) {
    [v4 registerConsumer:v5 forActionType:99];
  }

  return v5;
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003A01C0 != -1) {
    dispatch_once(&qword_1003A01C0, &stru_100359CC8);
  }
  v8 = (void *)qword_1003A0198;
  if (os_log_type_enabled((os_log_t)qword_1003A0198, OS_LOG_TYPE_ERROR)) {
    sub_1002C9250(v8, (uint64_t)self, (uint64_t)v7);
  }
}

@end