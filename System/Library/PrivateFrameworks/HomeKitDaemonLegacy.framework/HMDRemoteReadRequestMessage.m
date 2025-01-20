@interface HMDRemoteReadRequestMessage
- (HMDRemoteReadRequestMessage)initWithReadMessage:(id)a3 accessoryUUID:(id)a4 responseQueue:(id)a5;
- (HMFMessage)readMessage;
- (NSUUID)accessoryUUID;
- (OS_dispatch_queue)responseQueue;
- (id)debugDescription;
- (id)description;
@end

@implementation HMDRemoteReadRequestMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_readMessage, 0);
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (HMFMessage)readMessage
{
  return self->_readMessage;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDRemoteReadRequestMessage *)self readMessage];
  v5 = [v4 identifier];
  v6 = [v5 UUIDString];
  v7 = [(HMDRemoteReadRequestMessage *)self accessoryUUID];
  v8 = [v7 UUIDString];
  v9 = [v3 stringWithFormat:@"[Read identifier: %@, accessory: %@]", v6, v8];

  return v9;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(HMDRemoteReadRequestMessage *)self readMessage];
  v5 = [v4 identifier];
  v6 = [v5 UUIDString];
  v7 = [(HMDRemoteReadRequestMessage *)self readMessage];
  v8 = [v7 messagePayload];
  v9 = [(HMDRemoteReadRequestMessage *)self accessoryUUID];
  v10 = [v9 UUIDString];
  v11 = [v3 stringWithFormat:@"[Read identifier: %@, payload: %@, accessory: %@]", v6, v8, v10];

  return v11;
}

- (HMDRemoteReadRequestMessage)initWithReadMessage:(id)a3 accessoryUUID:(id)a4 responseQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDRemoteReadRequestMessage;
  v12 = [(HMDRemoteReadRequestMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readMessage, a3);
    objc_storeStrong((id *)&v13->_accessoryUUID, a4);
    objc_storeStrong((id *)&v13->_responseQueue, a5);
  }

  return v13;
}

@end