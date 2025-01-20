@interface CKDDeviceCapabilityCheckPerRequestResult
- (CKDDeviceCapabilityCheckPerRequestResult)initWithZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 error:(id)a6;
- (CKDDeviceCapabilityCheckResult)result;
- (CKRecordZoneID)zoneID;
- (NSArray)capabilitySet;
- (NSError)error;
- (void)setCapabilitySet:(id)a3;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKDDeviceCapabilityCheckPerRequestResult

- (CKDDeviceCapabilityCheckPerRequestResult)initWithZoneID:(id)a3 capabilitySet:(id)a4 result:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKDDeviceCapabilityCheckPerRequestResult;
  v15 = [(CKDDeviceCapabilityCheckPerRequestResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_zoneID, a3);
    objc_storeStrong((id *)&v16->_capabilitySet, a4);
    objc_storeStrong((id *)&v16->_result, a5);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (NSArray)capabilitySet
{
  return self->_capabilitySet;
}

- (void)setCapabilitySet:(id)a3
{
}

- (CKDDeviceCapabilityCheckResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_capabilitySet, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end