@interface HMDHomeRemoteEventRouterClientFactory
- (id)primaryResidentClientWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12;
- (id)residentClientWithAccessoryUUID:(id)a3 homeUUID:(id)a4 queue:(id)a5 dataSource:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 storeReadHandle:(id)a12 storeWriteHandle:(id)a13;
@end

@implementation HMDHomeRemoteEventRouterClientFactory

- (id)residentClientWithAccessoryUUID:(id)a3 homeUUID:(id)a4 queue:(id)a5 dataSource:(id)a6 messageDispatcher:(id)a7 notificationCenter:(id)a8 requestMessageName:(id)a9 updateMessageName:(id)a10 multiHopFetchResponseMessageName:(id)a11 storeReadHandle:(id)a12 storeWriteHandle:(id)a13
{
  id v35 = a13;
  id v34 = a12;
  id v33 = a11;
  id v32 = a10;
  id v30 = a9;
  id v31 = a8;
  id v36 = a7;
  id v28 = a6;
  id v27 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [v20 UUIDString];
  v22 = [@"RemoteEventRouter.Resident.Client." stringByAppendingString:v21];

  v23 = [HMDRemoteEventRouterResidentClient alloc];
  v26 = +[HMDRemoteEventRouterClientRetryIntervals retryIntervalsForResidentClient];
  id v29 = v22;
  id v25 = -[HMDRemoteEventRouterResidentClient initWitAccessoryUUID:homeUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:](v23, "initWitAccessoryUUID:homeUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:", v20, v19, v27, v28, v36, v31, v30, v32, v33, v34, v35, v26, [v29 UTF8String]);

  return v25;
}

- (id)primaryResidentClientWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12
{
  id v18 = a12;
  id v33 = a11;
  id v32 = a10;
  id v30 = a9;
  id v31 = a8;
  id v29 = a7;
  id v28 = a6;
  id v19 = a5;
  id v26 = a4;
  id v20 = a3;
  v21 = [v20 UUIDString];
  v22 = [@"RemoteEventRouter.Primary.Client." stringByAppendingString:v21];

  v23 = [HMDRemoteEventRouterPrimaryResidentClient alloc];
  id v24 = v22;
  id v27 = -[HMDRemoteEventRouterClient initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:logCategory:](v23, "initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:storeReadHandle:storeWriteHandle:logCategory:", v20, v26, v19, v28, v29, v31, v30, v32, v33, v18, [v24 UTF8String]);

  return v27;
}

@end