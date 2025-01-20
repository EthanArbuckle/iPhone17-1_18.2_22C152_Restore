@interface HMDXPCMessageCountersLogEvent
+ (id)XPCMessageCountersLogEventWithType:(id)a3 peerInformation:(id)a4 messageName:(id)a5 count:(id)a6;
- (NSNumber)count;
- (NSString)messageName;
- (NSString)peerInformation;
- (NSString)type;
- (id)__initWithType:(id)a3 peerInformation:(id)a4 messageName:(id)a5 count:(id)a6;
@end

@implementation HMDXPCMessageCountersLogEvent

- (NSString)type
{
  return self->_type;
}

- (NSString)peerInformation
{
  return self->_peerInformation;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (NSNumber)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_peerInformation, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (id)XPCMessageCountersLogEventWithType:(id)a3 peerInformation:(id)a4 messageName:(id)a5 count:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)a1), "__initWithType:peerInformation:messageName:count:", v13, v12, v11, v10);

  return v14;
}

- (id)__initWithType:(id)a3 peerInformation:(id)a4 messageName:(id)a5 count:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDXPCMessageCountersLogEvent;
  v14 = [(HMMLogEvent *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    type = v14->_type;
    v14->_type = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    peerInformation = v14->_peerInformation;
    v14->_peerInformation = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    messageName = v14->_messageName;
    v14->_messageName = (NSString *)v19;

    objc_storeStrong((id *)&v14->_count, a6);
  }

  return v14;
}

@end