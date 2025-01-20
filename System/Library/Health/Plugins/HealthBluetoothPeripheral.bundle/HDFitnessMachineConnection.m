@interface HDFitnessMachineConnection
- (HDFitnessMachineConnection)initWithUUID:(id)a3 client:(id)a4;
- (HKFitnessMachineConnectionClientInterface)client;
- (NSUUID)uuid;
@end

@implementation HDFitnessMachineConnection

- (HDFitnessMachineConnection)initWithUUID:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDFitnessMachineConnection;
  v9 = [(HDFitnessMachineConnection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_client, a4);
  }

  return v10;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HKFitnessMachineConnectionClientInterface)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end