@interface HMDMutableUserMessagePolicy
+ (id)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5;
+ (id)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMDMutableUserMessagePolicy

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HMDUserMessagePolicy *)self home];
  v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:[(HMDUserMessagePolicy *)self userPrivilege] remoteAccessRequired:[(HMDUserMessagePolicy *)self requiresRemoteAccess] requiresCameraStreamingAccess:[(HMDUserMessagePolicy *)self requiresCameraStreamingAccess]];

  return v5;
}

+ (id)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5
{
  return (id)[a1 userMessagePolicyWithHome:a3 userPrivilege:a4 remoteAccessRequired:a5 requiresCameraStreamingAccess:0];
}

+ (id)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = [v10 uuid];
  v13 = objc_msgSend(v11, "__initWithHome:homeUUID:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v10, v12, a4, v7, v6);

  return v13;
}

@end