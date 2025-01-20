@interface HMMRTCSessionFactory
- (id)sessionWithUUID:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5 commonFields:(id)a6;
@end

@implementation HMMRTCSessionFactory

- (id)sessionWithUUID:(id)a3 serviceName:(id)a4 uploadImmediately:(BOOL)a5 commonFields:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = +[HMMQueuingRTCBackendSessionManager sharedSessionManager];
  v13 = [v12 logBackendSessionWithServiceName:v10 sessionUUID:v9 isRealtime:v7];

  if (v13) {
    v14 = [[HMMRTCSession alloc] initWithUUID:v9 serviceName:v10 commonFields:v11 backend:v13];
  }
  else {
    v14 = [[HMMNullRTCSession alloc] initWithUUID:v9 serviceName:v10];
  }
  v15 = v14;

  return v15;
}

@end