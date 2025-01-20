@interface HMDAccessCodeWriteRequestModificationRequestPair
- (HMDAccessCodeWriteRequestModificationRequestPair)initWithWriteRequest:(id)a3 modificationRequests:(id)a4;
- (HMDCharacteristicWriteRequest)writeRequest;
- (NSArray)modificationRequests;
@end

@implementation HMDAccessCodeWriteRequestModificationRequestPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationRequests, 0);
  objc_storeStrong((id *)&self->_writeRequest, 0);
}

- (NSArray)modificationRequests
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCharacteristicWriteRequest)writeRequest
{
  return (HMDCharacteristicWriteRequest *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessCodeWriteRequestModificationRequestPair)initWithWriteRequest:(id)a3 modificationRequests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessCodeWriteRequestModificationRequestPair;
  v9 = [(HMDAccessCodeWriteRequestModificationRequestPair *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_writeRequest, a3);
    uint64_t v11 = [v8 copy];
    modificationRequests = v10->_modificationRequests;
    v10->_modificationRequests = (NSArray *)v11;
  }
  return v10;
}

@end