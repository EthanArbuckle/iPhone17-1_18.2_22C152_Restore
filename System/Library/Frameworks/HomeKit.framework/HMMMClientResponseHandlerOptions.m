@interface HMMMClientResponseHandlerOptions
- (HMMMClientResponseHandlerOptions)initWithPeerDestination:(id)a3 messageName:(id)a4;
- (HMMMMessageDestination)peerDestination;
- (NSString)messageName;
- (id)attributeDescriptions;
@end

@implementation HMMMClientResponseHandlerOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageName, 0);

  objc_storeStrong((id *)&self->_peerDestination, 0);
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
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMMMClientResponseHandlerOptions *)self peerDestination];
  v5 = (void *)[v3 initWithName:@"PeerDestination" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMMMClientResponseHandlerOptions *)self messageName];
  v8 = (void *)[v6 initWithName:@"MessageName" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMMMClientResponseHandlerOptions)initWithPeerDestination:(id)a3 messageName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMMClientResponseHandlerOptions;
  v9 = [(HMMMClientResponseHandlerOptions *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peerDestination, a3);
    objc_storeStrong((id *)&v10->_messageName, a4);
  }

  return v10;
}

@end