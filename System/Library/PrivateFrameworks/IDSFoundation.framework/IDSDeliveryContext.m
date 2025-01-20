@interface IDSDeliveryContext
+ (int64_t)_endpointStateForServerDeliveryStatus:(id)a3;
- (BOOL)lastCall;
- (BOOL)lastCourierAck;
- (IDSDeliveryContext)initWithError:(id)a3;
- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 deviceID:(id)a4;
- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 deviceID:(id)a4 currentAverageRTT:(id)a5 isDeviceBlackedOut:(id)a6 localMessageState:(id)a7;
- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 error:(id)a4 lastCall:(BOOL)a5;
- (IDSDeliveryContext)initWithServerResponseDictionary:(id)a3;
- (IDSPushToken)responseToken;
- (NSArray)displayURIs;
- (NSDictionary)wpConnectionErrorUserInfo;
- (NSError)deliveryError;
- (NSError)responseError;
- (NSNumber)currentAverageRTT;
- (NSNumber)endpointState;
- (NSNumber)failureReason;
- (NSNumber)isDeviceBlackedOut;
- (NSNumber)localMessageState;
- (NSNumber)responseCommand;
- (NSNumber)responseTimeStamp;
- (NSNumber)wpConnectionErrorCode;
- (NSString)deviceID;
- (NSString)wpConnectionErrorDomain;
- (int64_t)idsResponseCode;
- (int64_t)responseCode;
- (void)setCurrentAverageRTT:(id)a3;
- (void)setDeliveryError:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setDisplayURIs:(id)a3;
- (void)setEndpointState:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setIdsResponseCode:(int64_t)a3;
- (void)setIsDeviceBlackedOut:(id)a3;
- (void)setLastCall:(BOOL)a3;
- (void)setLastCourierAck:(BOOL)a3;
- (void)setLocalMessageState:(id)a3;
- (void)setResponseCode:(int64_t)a3;
- (void)setResponseCommand:(id)a3;
- (void)setResponseError:(id)a3;
- (void)setResponseTimeStamp:(id)a3;
- (void)setResponseToken:(id)a3;
- (void)setWpConnectionErrorCode:(id)a3;
- (void)setWpConnectionErrorDomain:(id)a3;
- (void)setWpConnectionErrorUserInfo:(id)a3;
@end

@implementation IDSDeliveryContext

+ (int64_t)_endpointStateForServerDeliveryStatus:(id)a3
{
  if (!a3) {
    return 2;
  }
  if (objc_msgSend_isEqualToNumber_(a3, a2, (uint64_t)&unk_1EF028A68, v3)) {
    return 3;
  }
  return 0;
}

- (IDSDeliveryContext)initWithServerResponseDictionary:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)IDSDeliveryContext;
  v6 = [(IDSDeliveryContext *)&v44 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend__numberForKey_(v4, v5, @"c", v7);
    responseCommand = v6->_responseCommand;
    v6->_responseCommand = (NSNumber *)v8;

    uint64_t v12 = objc_msgSend__numberForKey_(v4, v10, @"e", v11);
    responseTimeStamp = v6->_responseTimeStamp;
    v6->_responseTimeStamp = (NSNumber *)v12;

    v16 = objc_msgSend__numberForKey_(v4, v14, @"s", v15);
    v6->_responseCode = objc_msgSend_integerValue(v16, v17, v18, v19);

    v22 = objc_msgSend__dataForKey_(v4, v20, @"t", v21);
    uint64_t v25 = objc_msgSend_pushTokenWithData_(IDSPushToken, v23, (uint64_t)v22, v24);
    responseToken = v6->_responseToken;
    v6->_responseToken = (IDSPushToken *)v25;

    v27 = NSNumber;
    v28 = objc_opt_class();
    v31 = objc_msgSend__numberForKey_(v4, v29, @"O", v30);
    uint64_t v34 = objc_msgSend__endpointStateForServerDeliveryStatus_(v28, v32, (uint64_t)v31, v33);
    uint64_t v37 = objc_msgSend_numberWithInteger_(v27, v35, v34, v36);
    endpointState = v6->_endpointState;
    v6->_endpointState = (NSNumber *)v37;

    uint64_t v41 = objc_msgSend__numberForKey_(v4, v39, @"fR", v40);
    failureReason = v6->_failureReason;
    v6->_failureReason = (NSNumber *)v41;
  }
  return v6;
}

- (IDSDeliveryContext)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDeliveryContext;
  v6 = [(IDSDeliveryContext *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_responseError, a3);
  }

  return v7;
}

- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 error:(id)a4 lastCall:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSDeliveryContext;
  v10 = [(IDSDeliveryContext *)&v14 init];
  double v11 = v10;
  if (v10)
  {
    v10->_idsResponseCode = a3;
    objc_storeStrong((id *)&v10->_responseError, a4);
    v11->_lastCall = a5;
    endpointState = v11->_endpointState;
    v11->_endpointState = (NSNumber *)&unk_1EF028A80;
  }
  return v11;
}

- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 deviceID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSDeliveryContext;
  uint64_t v8 = [(IDSDeliveryContext *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    v8->_idsResponseCode = a3;
    objc_storeStrong((id *)&v8->_deviceID, a4);
  }

  return v9;
}

- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 deviceID:(id)a4 currentAverageRTT:(id)a5 isDeviceBlackedOut:(id)a6 localMessageState:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IDSDeliveryContext;
  v17 = [(IDSDeliveryContext *)&v21 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_idsResponseCode = a3;
    objc_storeStrong((id *)&v17->_deviceID, a4);
    objc_storeStrong((id *)&v18->_currentAverageRTT, a5);
    objc_storeStrong((id *)&v18->_isDeviceBlackedOut, a6);
    objc_storeStrong((id *)&v18->_localMessageState, a7);
    endpointState = v18->_endpointState;
    v18->_endpointState = (NSNumber *)&unk_1EF028A80;
  }
  return v18;
}

- (NSNumber)responseCommand
{
  return self->_responseCommand;
}

- (void)setResponseCommand:(id)a3
{
}

- (NSNumber)responseTimeStamp
{
  return self->_responseTimeStamp;
}

- (void)setResponseTimeStamp:(id)a3
{
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

- (IDSPushToken)responseToken
{
  return self->_responseToken;
}

- (void)setResponseToken:(id)a3
{
}

- (NSError)deliveryError
{
  return self->_deliveryError;
}

- (void)setDeliveryError:(id)a3
{
}

- (NSNumber)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
}

- (NSArray)displayURIs
{
  return self->_displayURIs;
}

- (void)setDisplayURIs:(id)a3
{
}

- (int64_t)idsResponseCode
{
  return self->_idsResponseCode;
}

- (void)setIdsResponseCode:(int64_t)a3
{
  self->_idsResponseCode = a3;
}

- (BOOL)lastCall
{
  return self->_lastCall;
}

- (void)setLastCall:(BOOL)a3
{
  self->_lastCall = a3;
}

- (BOOL)lastCourierAck
{
  return self->_lastCourierAck;
}

- (void)setLastCourierAck:(BOOL)a3
{
  self->_lastCourierAck = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSNumber)currentAverageRTT
{
  return self->_currentAverageRTT;
}

- (void)setCurrentAverageRTT:(id)a3
{
}

- (NSNumber)isDeviceBlackedOut
{
  return self->_isDeviceBlackedOut;
}

- (void)setIsDeviceBlackedOut:(id)a3
{
}

- (NSNumber)localMessageState
{
  return self->_localMessageState;
}

- (void)setLocalMessageState:(id)a3
{
}

- (NSNumber)endpointState
{
  return self->_endpointState;
}

- (void)setEndpointState:(id)a3
{
}

- (NSString)wpConnectionErrorDomain
{
  return self->_wpConnectionErrorDomain;
}

- (void)setWpConnectionErrorDomain:(id)a3
{
}

- (NSNumber)wpConnectionErrorCode
{
  return self->_wpConnectionErrorCode;
}

- (void)setWpConnectionErrorCode:(id)a3
{
}

- (NSDictionary)wpConnectionErrorUserInfo
{
  return self->_wpConnectionErrorUserInfo;
}

- (void)setWpConnectionErrorUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_endpointState, 0);
  objc_storeStrong((id *)&self->_wpConnectionErrorUserInfo, 0);
  objc_storeStrong((id *)&self->_wpConnectionErrorCode, 0);
  objc_storeStrong((id *)&self->_wpConnectionErrorDomain, 0);
  objc_storeStrong((id *)&self->_localMessageState, 0);
  objc_storeStrong((id *)&self->_isDeviceBlackedOut, 0);
  objc_storeStrong((id *)&self->_currentAverageRTT, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deliveryError, 0);
  objc_storeStrong((id *)&self->_displayURIs, 0);
  objc_storeStrong((id *)&self->_responseToken, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseTimeStamp, 0);
  objc_storeStrong((id *)&self->_responseCommand, 0);
}

@end