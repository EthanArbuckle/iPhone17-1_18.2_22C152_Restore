@interface HMMMClientRequestHandlerOptions
- (HMMMClientRequestHandlerOptions)initWithPeerDestination:(id)a3 messageName:(id)a4 user:(id)a5;
- (HMMMMessageDestination)peerDestination;
- (HMUser)user;
- (NSString)messageName;
- (id)attributeDescriptions;
@end

@implementation HMMMClientRequestHandlerOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_messageName, 0);

  objc_storeStrong((id *)&self->_peerDestination, 0);
}

- (HMUser)user
{
  return self->_user;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (HMMMMessageDestination)peerDestination
{
  return self->_peerDestination;
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMMClientRequestHandlerOptions *)self peerDestination];
  v5 = (void *)[v3 initWithName:@"PeerDestination" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMMMClientRequestHandlerOptions *)self messageName];
  v8 = (void *)[v6 initWithName:@"MessageName" value:v7];
  v15[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMMMClientRequestHandlerOptions *)self user];
  v11 = [v10 uniqueIdentifier];
  v12 = (void *)[v9 initWithName:@"UserUUID" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (HMMMClientRequestHandlerOptions)initWithPeerDestination:(id)a3 messageName:(id)a4 user:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMMClientRequestHandlerOptions;
  v12 = [(HMMMClientRequestHandlerOptions *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peerDestination, a3);
    objc_storeStrong((id *)&v13->_messageName, a4);
    objc_storeStrong((id *)&v13->_user, a5);
  }

  return v13;
}

@end