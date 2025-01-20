@interface _DKSyncRapportStorage
- (BOOL)isAvailable;
- (BOOL)isTransportActiveForPeer:(id)a3;
- (_DKSyncRapportStorage)init;
- (id)client;
- (id)myDeviceID;
- (id)name;
- (id)transformCaughtObject:(id)a3 existingError:(id)a4;
- (id)transformResponseError:(id)a3;
- (int64_t)transportType;
- (void)cancelOutstandingOperations;
- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5;
- (void)handleAvailabilityFailureWithPeer:(id)a3 completion:(id)a4;
- (void)handshakeWithDuetSyncPeer:(id)a3 orError:(id)a4;
- (void)registerRequestIDsWithClient:(id)a3;
- (void)sendRequestID:(id)a3 request:(id)a4 peer:(id)a5 highPriority:(BOOL)a6 options:(id)a7 responseHandler:(id)a8;
- (void)setDeviceID:(id)a3;
- (void)start;
@end

@implementation _DKSyncRapportStorage

- (_DKSyncRapportStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKSyncRapportStorage;
  v2 = [(_DKSyncRapportStorage *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_DKSyncRapportCommonStorage sharedInstance];
    commonStorage = v2->_commonStorage;
    v2->_commonStorage = (_DKSyncRapportCommonStorage *)v3;
  }
  return v2;
}

- (BOOL)isAvailable
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage isAvailable];
}

- (void)registerRequestIDsWithClient:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should not be called" userInfo:0];
  objc_exception_throw(v4);
}

- (void)cancelOutstandingOperations
{
}

- (id)name
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage name];
}

- (void)start
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_6(&dword_18ECEB000, a2, v4, "%{public}@: Unable to register request ids with Rapport", v5);
}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
}

- (int64_t)transportType
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage transportType];
}

- (id)myDeviceID
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage myDeviceID];
}

- (void)setDeviceID:(id)a3
{
}

- (id)client
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage client];
}

- (BOOL)isTransportActiveForPeer:(id)a3
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage isTransportActiveForPeer:a3];
}

- (void)handleAvailabilityFailureWithPeer:(id)a3 completion:(id)a4
{
}

- (id)transformResponseError:(id)a3
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage transformResponseError:a3];
}

- (id)transformCaughtObject:(id)a3 existingError:(id)a4
{
  return [(_DKSyncRapportCommonStorage *)self->_commonStorage transformCaughtObject:a3 existingError:a4];
}

- (void)handshakeWithDuetSyncPeer:(id)a3 orError:(id)a4
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 peer:(id)a5 highPriority:(BOOL)a6 options:(id)a7 responseHandler:(id)a8
{
}

- (void).cxx_destruct
{
}

@end