@interface CLEEDRequest
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateDerivedSessionSecrets:(id)a3 sharedInfoPrefix:(id)a4 partnerKeyConfirmation:(id)a5;
+ (id)createRequestFromCachedDict:(id)a3 error:(int64_t *)a4;
+ (id)createRequestFromDict:(id)a3 baseURL:(id)a4 sessionID:(id)a5 partnerAdrPublicKeyData:(id)a6 deviceSessionPrivateKey:(__SecKey *)a7 deviceSessionSecret:(id)a8 error:(int64_t *)a9;
+ (id)getCallIDFromDict:(id)a3;
+ (id)getDecryptedControlRequestData:(id)a3 sessionID:(id)a4 partnerAdrPublicKeyData:(id)a5 deviceSessionPrivateKey:(__SecKey *)a6 deviceSessionSecret:(id)a7 combinedSecret:(id *)a8 error:(int64_t *)a9;
+ (id)getDecryptedPartnerSessionSecret:(id)a3 sessionID:(id)a4 partnerID:(id)a5 partnerAdrPublicKeyData:(id)a6 deviceSessionPrivateKey:(__SecKey *)a7;
+ (id)getDecryptedRequestDict:(id)a3 requestID:(id)a4 combinedSecret:(id)a5 sharedInfoPrefix:(id)a6;
+ (id)getPartnerIDFromDict:(id)a3;
+ (id)getSharedInfoPrefixFromSessionID:(id)a3 partnerID:(id)a4 partnerAdrPublicKeyData:(id)a5 deviceSessionPrivateKey:(__SecKey *)a6;
+ (id)toCLEEDRequestString:(int64_t)a3;
+ (id)toEEDControlResponseStatus:(int64_t)a3;
+ (int64_t)getSessionStartTimeFromDict:(id)a3;
+ (int64_t)requestTypeFromDict:(id)a3;
+ (int64_t)toCLEEDRequestType:(id)a3;
- (CLEEDRequest)initWithCoder:(id)a3;
- (CLEEDRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6;
- (CLEEDRequest)initWithDictionary:(id)a3 error:(int64_t *)a4;
- (CLEEDRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 requestType:(int64_t)a8 state:(int64_t)a9;
- (NSDate)requestDate;
- (NSString)geofenceID;
- (NSString)partnerID;
- (NSString)psapID;
- (NSUUID)ID;
- (double)receivedTimeToAcceptTime;
- (double)receivedTimeToFirstUserResponse;
- (double)requestReceivedTime;
- (id)description;
- (id)getRequestDict;
- (id)getResponseDataDictionary;
- (int64_t)numMediaSelectIterations;
- (int64_t)requestStatusAtFirstUserResponse;
- (int64_t)requestTransmissionTime;
- (int64_t)state;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setNumMediaSelectIterations:(int64_t)a3;
- (void)setReceivedTimeToAcceptTime:(double)a3;
- (void)setReceivedTimeToFirstUserResponse:(double)a3;
- (void)setRequestReceivedTime:(double)a3;
- (void)setRequestStatusAtFirstUserResponse:(int64_t)a3;
- (void)setRequestTransmissionTime:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)updateDurationInformationForCA:(BOOL)a3;
@end

@implementation CLEEDRequest

- (CLEEDRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 requestType:(int64_t)a8 state:(int64_t)a9
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v15 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448002;
    v43 = "-[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:]";
    __int16 v44 = 2114;
    id v45 = a3;
    __int16 v46 = 2114;
    id v47 = a4;
    __int16 v48 = 2114;
    id v49 = a5;
    __int16 v50 = 2114;
    id v51 = a6;
    __int16 v52 = 2114;
    id v53 = a7;
    __int16 v54 = 2050;
    int64_t v55 = a8;
    __int16 v56 = 2050;
    int64_t v57 = a9;
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,type:%{public}lu,state:%{public}lu]", buf, 0x52u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v26 = 136448002;
    v27 = "-[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:]";
    __int16 v28 = 2114;
    id v29 = a3;
    __int16 v30 = 2114;
    id v31 = a4;
    __int16 v32 = 2114;
    id v33 = a5;
    __int16 v34 = 2114;
    id v35 = a6;
    __int16 v36 = 2114;
    id v37 = a7;
    __int16 v38 = 2050;
    int64_t v39 = a8;
    __int16 v40 = 2050;
    int64_t v41 = a9;
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)CLEEDRequest;
  v16 = [(CLEEDRequest *)&v25 init];
  if (v16)
  {
    v16->_ID = (NSUUID *)a3;
    v16->_psapID = (NSString *)a4;
    v16->_partnerID = (NSString *)a5;
    v16->_geofenceID = (NSString *)a6;
    v16->_requestDate = (NSDate *)a7;
    v16->_type = a8;
    v16->_state = a9;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&v16->_requestStatusAtFirstUserResponse = xmmword_1908821A0;
    *(_OWORD *)&v16->_requestReceivedTime = _Q1;
    v16->_receivedTimeToAcceptTime = -1.0;
    v16->_numMediaSelectIterations = 0;
  }
  return v16;
}

- (CLEEDRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend(a3, "objectForKey:", @"request_ID", a4, a5);
  uint64_t v10 = [a3 objectForKey:@"partner_ID"];
  uint64_t v11 = [a3 objectForKey:@"psap_ID"];
  uint64_t v12 = [a3 objectForKey:@"geofence_ID"];
  v13 = (void *)[a3 valueForKey:@"timestamp"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v14 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    id v29 = "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v30 = 2114;
    uint64_t v31 = v9;
    __int16 v32 = 2114;
    uint64_t v33 = v10;
    __int16 v34 = 2114;
    uint64_t v35 = v11;
    __int16 v36 = 2114;
    uint64_t v37 = v12;
    __int16 v38 = 2050;
    uint64_t v39 = [v13 integerValue];
    _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [v13 integerValue];
    LODWORD(v27) = 62;
    objc_super v25 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
  if (v9) {
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
  }
  else {
    id v15 = (id)[MEMORY[0x1E4F29128] UUID];
  }
  id v16 = v15;
  if (v13) {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v13, "integerValue"));
  }
  else {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v18 = v17;
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v19 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v29 = "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v30 = 2114;
    uint64_t v31 = (uint64_t)v16;
    __int16 v32 = 2114;
    uint64_t v33 = v18;
    _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    LODWORD(v27) = 32;
    int v26 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
  }
  if (v11) {
    v20 = (__CFString *)v11;
  }
  else {
    v20 = @"UnknownPSAPID";
  }
  if (v10) {
    v21 = (__CFString *)v10;
  }
  else {
    v21 = @"UnknownPartnerID";
  }
  if (v12) {
    v22 = (__CFString *)v12;
  }
  else {
    v22 = @"UnknownGeofenceID";
  }
  uint64_t v23 = 7;
  if (*a6 == 9) {
    uint64_t v23 = 8;
  }
  return -[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:](self, "initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:", v16, v20, v21, v22, v18, 0, v23, v27);
}

- (CLEEDRequest)initWithDictionary:(id)a3 error:(int64_t *)a4
{
  uint64_t v7 = [a3 objectForKey:@"EEDRequestBaseURL"];

  return [(CLEEDRequest *)self initWithDictionary:a3 decryptedRequestData:0 baseURL:v7 error:a4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLEEDRequest;
  [(CLEEDRequest *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CLEEDRequest: ID, %@, psapID, %@, partnerID, %@, geofenceID, %@, requestDate, %@, type, %lu, state, %lu>", -[NSUUID UUIDString](-[CLEEDRequest ID](self, "ID"), "UUIDString"), -[CLEEDRequest psapID](self, "psapID"), -[CLEEDRequest partnerID](self, "partnerID"), -[CLEEDRequest geofenceID](self, "geofenceID"), -[CLEEDRequest requestDate](self, "requestDate"), -[CLEEDRequest type](self, "type"), -[CLEEDRequest state](self, "state")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    ID = self->_ID;
    psapID = self->_psapID;
    partnerID = self->_partnerID;
    geofenceID = self->_geofenceID;
    requestDate = self->_requestDate;
    int64_t type = self->_type;
    int64_t state = self->_state;
    *(_DWORD *)buf = 136448002;
    id v15 = "-[CLEEDRequest encodeWithCoder:]";
    __int16 v16 = 2114;
    uint64_t v17 = ID;
    __int16 v18 = 2114;
    v19 = psapID;
    __int16 v20 = 2114;
    v21 = partnerID;
    __int16 v22 = 2114;
    uint64_t v23 = geofenceID;
    __int16 v24 = 2114;
    objc_super v25 = requestDate;
    __int16 v26 = 2050;
    int64_t v27 = type;
    __int16 v28 = 2050;
    int64_t v29 = state;
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,type:%{public}lu,state:%{public}lu]", buf, 0x52u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest encodeWithCoder:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  [a3 encodeObject:self->_ID forKey:@"ID"];
  [a3 encodeObject:self->_psapID forKey:@"psapID"];
  [a3 encodeObject:self->_partnerID forKey:@"partnerID"];
  [a3 encodeObject:self->_geofenceID forKey:@"geofenceID"];
  [a3 encodeObject:self->_requestDate forKey:@"requestDate"];
  [a3 encodeInteger:self->_type forKey:@"type"];
  [a3 encodeInteger:self->_state forKey:@"state"];
}

- (CLEEDRequest)initWithCoder:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CLEEDRequest;
  v4 = [(CLEEDRequest *)&v22 init];
  if (v4)
  {
    v4->_ID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"ID"];
    v4->_psapID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"psapID"];
    v4->_partnerID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"partnerID"];
    v4->_geofenceID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"geofenceID"];
    v4->_requestDate = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestDate"];
    v4->_int64_t type = [a3 decodeIntegerForKey:@"type"];
    v4->_int64_t state = [a3 decodeIntegerForKey:@"state"];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v5 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
    {
      ID = v4->_ID;
      psapID = v4->_psapID;
      partnerID = v4->_partnerID;
      geofenceID = v4->_geofenceID;
      requestDate = v4->_requestDate;
      int64_t type = v4->_type;
      int64_t state = v4->_state;
      *(_DWORD *)buf = 136448002;
      uint64_t v40 = "-[CLEEDRequest initWithCoder:]";
      __int16 v41 = 2114;
      v42 = ID;
      __int16 v43 = 2114;
      __int16 v44 = psapID;
      __int16 v45 = 2114;
      __int16 v46 = partnerID;
      __int16 v47 = 2114;
      __int16 v48 = geofenceID;
      __int16 v49 = 2114;
      __int16 v50 = requestDate;
      __int16 v51 = 2050;
      int64_t v52 = type;
      __int16 v53 = 2050;
      int64_t v54 = state;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,type:%{public}lu,state:%{public}lu]", buf, 0x52u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v14 = v4->_ID;
      id v15 = v4->_psapID;
      uint64_t v17 = v4->_partnerID;
      __int16 v16 = v4->_geofenceID;
      __int16 v18 = v4->_requestDate;
      int64_t v19 = v4->_type;
      int64_t v20 = v4->_state;
      int v23 = 136448002;
      __int16 v24 = "-[CLEEDRequest initWithCoder:]";
      __int16 v25 = 2114;
      __int16 v26 = v14;
      __int16 v27 = 2114;
      __int16 v28 = v15;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      __int16 v31 = 2114;
      __int16 v32 = v16;
      __int16 v33 = 2114;
      __int16 v34 = v18;
      __int16 v35 = 2050;
      int64_t v36 = v19;
      __int16 v37 = 2050;
      int64_t v38 = v20;
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest initWithCoder:]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
  }
  return v4;
}

+ (id)getDecryptedControlRequestData:(id)a3 sessionID:(id)a4 partnerAdrPublicKeyData:(id)a5 deviceSessionPrivateKey:(__SecKey *)a6 deviceSessionSecret:(id)a7 combinedSecret:(id *)a8 error:(int64_t *)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5 || !a6 || !a7 || !a8)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v29 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v45 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_52;
    }
    goto LABEL_66;
  }
  uint64_t v14 = [a3 valueForKey:@"call_ID"];
  int v15 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"session_start_time"), "intValue");
  uint64_t v16 = [a3 valueForKey:@"partner_ID"];
  id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBase64EncodedString:options:", objc_msgSend(a3, "valueForKey:", @"partner_session_secret"), 0);
  id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBase64EncodedString:options:", objc_msgSend(a3, "valueForKey:", @"partner_key_confirmation"), 0);
  uint64_t v41 = [a3 valueForKey:@"request_ID"];
  id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v19 = [a3 valueForKey:@"request"];
  uint64_t v20 = v16;
  uint64_t v21 = v14;
  id v22 = (id)[v18 initWithBase64EncodedString:v19 options:0];
  id v23 = v22;
  if (!v21 || !v42 || !v17 || !v41 || !v22 || !v20 || v15 <= 0)
  {
    id v30 = v22;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v31 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136448003;
      __int16 v45 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      __int16 v46 = 2113;
      uint64_t v47 = v21;
      __int16 v48 = 2050;
      uint64_t v49 = v15;
      __int16 v50 = 2113;
      id v51 = v42;
      __int16 v52 = 2113;
      id v53 = v17;
      __int16 v54 = 2113;
      uint64_t v55 = v41;
      __int16 v56 = 2113;
      id v57 = v30;
      __int16 v58 = 2114;
      uint64_t v59 = v20;
      _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,receivedPhoneNumber:%{private}@, receivedSessionStartTime:%{public}lld, encryptedPartnerSessionSecret:%{private}@, partnerKeyConfirmation:%{private}@,requestID:%{private}@,encryptedRequestData:%{private}@,partnerID:%{public}@", buf, 0x52u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      __int16 v37 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v37);
      if (v37 != (char *)buf) {
        free(v37);
      }
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v32 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v45 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of received data is nil,early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int64_t v38 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v38);
      if (v38 != (char *)buf) {
        free(v38);
      }
    }
    id result = 0;
    int64_t v33 = 1;
    goto LABEL_49;
  }
  __int16 v24 = (void *)[(id)objc_opt_class() getDecryptedPartnerSessionSecret:v42 sessionID:a4 partnerID:v20 partnerAdrPublicKeyData:a5 deviceSessionPrivateKey:a6];
  if (!v24)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v34 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v45 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_1906B8000, v34, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil partnerSessionSecret,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_52:
      int64_t v36 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
      return 0;
    }
LABEL_66:
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
    goto LABEL_52;
  }
  __int16 v25 = v24;
  id v43 = v23;
  __int16 v26 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v24, "length") + objc_msgSend(a7, "length"));
  [v26 appendData:a7];
  [v26 appendData:v25];
  *a8 = v26;
  uint64_t v27 = [(id)objc_opt_class() getSharedInfoPrefixFromSessionID:a4 partnerID:v20 partnerAdrPublicKeyData:a5 deviceSessionPrivateKey:a6];
  if ([(id)objc_opt_class() validateDerivedSessionSecrets:v26 sharedInfoPrefix:v27 partnerKeyConfirmation:v17])
  {
    id result = (id)[(id)objc_opt_class() getDecryptedRequestDict:v43 requestID:v41 combinedSecret:v26 sharedInfoPrefix:v27];
    if (result) {
      return result;
    }
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v35 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v45 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,validateDerivedSessionSecrets failed, reject request", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v39 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v39);
      if (v39 != (char *)buf) {
        free(v39);
      }
    }
    id result = 0;
  }
  int64_t v33 = 9;
LABEL_49:
  *a9 = v33;
  return result;
}

+ (int64_t)requestTypeFromDict:(id)a3
{
  uint64_t v3 = [a3 objectForKey:@"request_type"];

  return +[CLEEDRequest toCLEEDRequestType:v3];
}

+ (int64_t)toCLEEDRequestType:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ([a3 isEqualToString:@"video_streaming"])
    {
      int64_t v4 = 1;
    }
    else if ([a3 isEqualToString:@"media_upload"])
    {
      int64_t v4 = 2;
    }
    else
    {
      int64_t v4 = 0;
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v6 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "+[CLEEDRequest toCLEEDRequestType:]";
      __int16 v12 = 2114;
      id v13 = a3;
      __int16 v14 = 2050;
      int64_t v15 = v4;
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest toCLEEDRequestType:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v5 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,toCLEEDRequestType,nil requestTypeString", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest toCLEEDRequestType:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    return 0;
  }
  return v4;
}

+ (id)toCLEEDRequestString:(int64_t)a3
{
  uint64_t v3 = @"unknownRequest";
  if (a3 == 1) {
    uint64_t v3 = @"video_streaming";
  }
  if (a3 == 2) {
    return @"media_upload";
  }
  else {
    return v3;
  }
}

+ (id)createRequestFromDict:(id)a3 baseURL:(id)a4 sessionID:(id)a5 partnerAdrPublicKeyData:(id)a6 deviceSessionPrivateKey:(__SecKey *)a7 deviceSessionSecret:(id)a8 error:(int64_t *)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v22 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, empty message, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_39;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v48 = 136446210;
    uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceS"
          "essionSecret:error:]";
    goto LABEL_89;
  }
  if (!a4 || ![a4 length])
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v21 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_ERROR, "#EED2,%{public}s, nil or empty base URL, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_39;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v48 = 136446210;
    uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceS"
          "essionSecret:error:]";
    goto LABEL_89;
  }
  if (!a6 || !a7 || !a8)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v23 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      _os_log_impl(&dword_1906B8000, v23, OS_LOG_TYPE_ERROR, "#EED2,%{public}s, nil partnerAdrPublicKeyData or  deviceSessionPrivateKey or deviceSessionSecret, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_39;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v48 = 136446210;
    uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceS"
          "essionSecret:error:]";
LABEL_89:
    id v42 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n", v42);
    if (v42 != (char *)buf) {
      free(v42);
    }
LABEL_39:
    id v18 = 0;
    *a9 = 1;
    return v18;
  }
  uint64_t v47 = 0;
  uint64_t v15 = [(id)objc_opt_class() getDecryptedControlRequestData:a3 sessionID:a5 partnerAdrPublicKeyData:a6 deviceSessionPrivateKey:a7 deviceSessionSecret:a8 combinedSecret:&v47 error:a9];
  if (!v15)
  {
    *a9 = 9;
    id v18 = [[CLEEDRequest alloc] initWithDictionary:a3 decryptedRequestData:0 baseURL:a4 error:a9];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v25 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v26 = *a9;
      *(_DWORD *)buf = 136446722;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2114;
      uint64_t v57 = (uint64_t)v18;
      __int16 v58 = 2050;
      int64_t v59 = v26;
      _os_log_impl(&dword_1906B8000, v25, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, decryptedRequestData nil, constructed CLEEDRequest:%{public}@, error:%{public}ld", buf, 0x20u);
    }
    if (!sub_1906CB57C(115, 2)) {
      return v18;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_74;
    }
LABEL_99:
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
    goto LABEL_74;
  }
  uint64_t v16 = v15;
  uint64_t v17 = [(id)objc_opt_class() requestTypeFromDict:v15];
  if (v17 == 2)
  {
    uint64_t v27 = [[CLEEDUploadRequest alloc] initWithDictionary:a3 decryptedRequestData:v16 baseURL:a4 error:a9];
    id v18 = (CLEEDStreamingRequest *)v27;
    if (v27) {
      [(CLEEDUploadRequest *)v27 setCombinedSecret:v47];
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v28 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [(CLEEDStreamingRequest *)v18 uploadURL];
      *(_DWORD *)buf = 136446466;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2114;
      uint64_t v57 = v29;
      _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, uploadURL is: %{public}@", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v43 = [(CLEEDStreamingRequest *)v18 uploadURL];
      int v48 = 136446466;
      uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v50 = 2114;
      uint64_t v51 = v43;
      __int16 v44 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n", v44);
      if (v44 != (char *)buf) {
        free(v44);
      }
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v30 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v31 = *a9;
      *(_DWORD *)buf = 136446723;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2113;
      uint64_t v57 = (uint64_t)v18;
      __int16 v58 = 2050;
      int64_t v59 = v31;
      _os_log_impl(&dword_1906B8000, v30, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDRequestTypeMediaUpload:%{private}@, error:%{public}ld", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int64_t v32 = *a9;
      int v48 = 136446723;
      uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v50 = 2113;
      uint64_t v51 = (uint64_t)v18;
      __int16 v52 = 2050;
      int64_t v53 = v32;
      goto LABEL_75;
    }
    return v18;
  }
  if (v17 == 1)
  {
    id v18 = [[CLEEDStreamingRequest alloc] initWithDictionary:a3 decryptedRequestData:v16 baseURL:a4 error:a9];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v33 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [(CLEEDStreamingRequest *)v18 streamingURL];
      *(_DWORD *)buf = 136446466;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2114;
      uint64_t v57 = v34;
      _os_log_impl(&dword_1906B8000, v33, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, streamingURL is: %{public}@", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v45 = [(CLEEDStreamingRequest *)v18 streamingURL];
      int v48 = 136446466;
      uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v50 = 2114;
      uint64_t v51 = v45;
      __int16 v46 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n", v46);
      if (v46 != (char *)buf) {
        free(v46);
      }
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v35 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v36 = *a9;
      *(_DWORD *)buf = 136446722;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2114;
      uint64_t v57 = (uint64_t)v18;
      __int16 v58 = 2050;
      int64_t v59 = v36;
      _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDRequestTypeStreaming:%{public}@, error:%{public}ld", buf, 0x20u);
    }
    if (!sub_1906CB57C(115, 2)) {
      return v18;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_74:
      int64_t v37 = *a9;
      int v48 = 136446722;
      uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)v18;
      __int16 v52 = 2050;
      int64_t v53 = v37;
LABEL_75:
      int64_t v38 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n");
LABEL_76:
      if (v38 != buf) {
        free(v38);
      }
      return v18;
    }
    goto LABEL_99;
  }
  if (v17)
  {
    *a9 = 1;
    id v18 = [[CLEEDRequest alloc] initWithDictionary:a3 decryptedRequestData:v16 baseURL:a4 error:a9];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v39 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = [(id)objc_opt_class() requestTypeFromDict:a3];
      *(_DWORD *)buf = 136446466;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2050;
      uint64_t v57 = v40;
      _os_log_impl(&dword_1906B8000, v39, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,not handling the request type %{public}ld", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v41 = [(id)objc_opt_class() requestTypeFromDict:a3];
      int v48 = 136446466;
      uint64_t v49 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v50 = 2050;
      uint64_t v51 = v41;
      int64_t v38 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n");
      goto LABEL_76;
    }
  }
  else
  {
    *a9 = 1;
    id v18 = [[CLEEDRequest alloc] initWithDictionary:a3 decryptedRequestData:v16 baseURL:a4 error:a9];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v19 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v20 = *a9;
      *(_DWORD *)buf = 136446722;
      uint64_t v55 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      __int16 v56 = 2114;
      uint64_t v57 = (uint64_t)v18;
      __int16 v58 = 2050;
      int64_t v59 = v20;
      _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDRequest:%{public}@, error:%{public}ld", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 == -1) {
        goto LABEL_74;
      }
      goto LABEL_99;
    }
  }
  return v18;
}

- (id)getRequestDict
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (v3)
  {
    objc_msgSend(v3, "setObject:forKey:", -[NSUUID UUIDString](-[CLEEDRequest ID](self, "ID"), "UUIDString"), @"request_ID");
    objc_msgSend(v3, "setObject:forKey:", -[CLEEDRequest psapID](self, "psapID"), @"psap_ID");
    int64_t v4 = NSString;
    [(NSDate *)[(CLEEDRequest *)self requestDate] timeIntervalSince1970];
    [v3 setObject:objc_msgSend(v4, "stringWithFormat:", @"%f", v5), @"timestamp" forKey];
    objc_msgSend(v3, "setObject:forKey:", -[CLEEDRequest partnerID](self, "partnerID"), @"partner_ID");
    objc_msgSend(v3, "setObject:forKey:", -[CLEEDRequest geofenceID](self, "geofenceID"), @"geofence_ID");
    objc_msgSend(v3, "setObject:forKey:", +[CLEEDRequest toCLEEDRequestString:](CLEEDRequest, "toCLEEDRequestString:", -[CLEEDRequest type](self, "type")), @"request_type");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDRequest state](self, "state")), @"EEDRequestState");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDRequest requestStatusAtFirstUserResponse](self, "requestStatusAtFirstUserResponse")), @"EEDRequestStatusAtFirstUserResponse");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDRequest requestTransmissionTime](self, "requestTransmissionTime")), @"EEDRequestTransmissionTime");
    v6 = NSNumber;
    [(CLEEDRequest *)self requestReceivedTime];
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "numberWithDouble:"), @"EEDRequestReceivedTime");
    uint64_t v7 = NSNumber;
    [(CLEEDRequest *)self receivedTimeToFirstUserResponse];
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v7, "numberWithDouble:"), @"EEDReceivedTimeToFirstUserResponse");
    v8 = NSNumber;
    [(CLEEDRequest *)self receivedTimeToAcceptTime];
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v8, "numberWithDouble:"), @"EEDReceivedTimeToAcceptTime");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDRequest numMediaSelectIterations](self, "numMediaSelectIterations")), @"EEDNumMediaSelectIterations");
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v9 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v13 = "-[CLEEDRequest getRequestDict]";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil requestDict, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDRequest getRequestDict]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  return v3;
}

+ (id)createRequestFromCachedDict:(id)a3 error:(int64_t *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v6 = [(id)objc_opt_class() requestTypeFromDict:a3];
    if (v6 == 2)
    {
      uint64_t v10 = [[CLEEDUploadRequest alloc] initWithDictionary:a3 error:a4];
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v11 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = *a4;
        *(_DWORD *)buf = 136446723;
        int64_t v20 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
        __int16 v21 = 2113;
        id v22 = v10;
        __int16 v23 = 2050;
        int64_t v24 = v12;
        _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,constructed CLEEDRequestTypeMediaUpload:%{private}@, error:%{public}ld", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 == -1)
        {
LABEL_32:
          uint64_t v15 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n", v15);
          if (v15 != (char *)buf) {
            free(v15);
          }
          return v10;
        }
LABEL_50:
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
        goto LABEL_32;
      }
    }
    else
    {
      if (v6 != 1)
      {
        if (v6)
        {
          *a4 = 1;
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          uint64_t v16 = qword_1E929F600;
          if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            int64_t v20 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
            _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,unhandled request type, this should never happen", buf, 0xCu);
          }
          if (!sub_1906CB57C(115, 0)) {
            return [[CLEEDRequest alloc] initWithDictionary:a3 error:a4];
          }
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          v8 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n");
        }
        else
        {
          *a4 = 1;
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          uint64_t v7 = qword_1E929F600;
          if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            int64_t v20 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
            _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,CLEEDRequestTypeUnknown, this should never happen", buf, 0xCu);
          }
          if (!sub_1906CB57C(115, 2)) {
            return [[CLEEDRequest alloc] initWithDictionary:a3 error:a4];
          }
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          v8 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n");
        }
        if (v8 != buf) {
          free(v8);
        }
        return [[CLEEDRequest alloc] initWithDictionary:a3 error:a4];
      }
      uint64_t v10 = [[CLEEDStreamingRequest alloc] initWithDictionary:a3 error:a4];
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v13 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v14 = *a4;
        *(_DWORD *)buf = 136446723;
        int64_t v20 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
        __int16 v21 = 2113;
        id v22 = v10;
        __int16 v23 = 2050;
        int64_t v24 = v14;
        _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,constructed CLEEDRequestTypeStreaming:%{private}@, error:%{public}ld", buf, 0x20u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F608 == -1) {
          goto LABEL_32;
        }
        goto LABEL_50;
      }
    }
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v9 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int64_t v20 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, empty message, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v18 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    uint64_t v10 = 0;
    *a4 = 1;
  }
  return v10;
}

+ (id)toEEDControlResponseStatus:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) > 0x11) {
    uint64_t v3 = @"UnknownError";
  }
  else {
    uint64_t v3 = (__CFString *)*((void *)&off_1E56972C8 + a3 - 1);
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int64_t v4 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "+[CLEEDRequest toEEDControlResponseStatus:]";
    __int16 v9 = 2114;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,responseStatus:%{public}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest toEEDControlResponseStatus:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  return v3;
}

- (id)getResponseDataDictionary
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"request_ID";
  v4[1] = @"request_status";
  v5[0] = [(NSUUID *)[(CLEEDRequest *)self ID] UUIDString];
  v5[1] = +[CLEEDRequest toEEDControlResponseStatus:[(CLEEDRequest *)self state]];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
}

+ (id)getPartnerIDFromDict:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a3 objectForKey:@"partner_ID"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int64_t v4 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "#EED2,getPartnerIDFromDict,partnerID:%{public}@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getPartnerIDFromDict:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  if (v3) {
    return v3;
  }
  else {
    return @"UnknownPartnerID";
  }
}

+ (id)getCallIDFromDict:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a3 objectForKey:@"call_ID"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int64_t v4 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "#EED2,getCallIDFromDict,callID:%{public}@", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getCallIDFromDict:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  if (v3) {
    return v3;
  }
  else {
    return @"UnknownCallID";
  }
}

+ (int64_t)getSessionStartTimeFromDict:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"session_start_time"), "intValue");
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int64_t v4 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "#EED2,getSessionStartTimeFromDict,SessionStartTime:%{public}lld", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getSessionStartTimeFromDict:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  return v3;
}

+ (id)getSharedInfoPrefixFromSessionID:(id)a3 partnerID:(id)a4 partnerAdrPublicKeyData:(id)a5 deviceSessionPrivateKey:(__SecKey *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5 || !a6)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v15 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v21 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
  uint64_t v9 = +[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:a6];
  if (!v9)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v17 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v21 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,nil deviceSessionPublicKey, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 2)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v16 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n");
    goto LABEL_31;
  }
  uint64_t v10 = v9;
  id v11 = +[CLEEDCryptoUtilities createKeyExternalRepresentation:v9];
  CFRelease(v10);
  if (!v11)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v18 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v21 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil deviceSessionPublicKeyData, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_22;
    }
LABEL_42:
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
LABEL_22:
    uint64_t v16 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n");
LABEL_31:
    if (v16 != buf) {
      free(v16);
    }
    return 0;
  }
  int64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(a4, "length")+ objc_msgSend(a3, "length")+ objc_msgSend(a5, "length")+ objc_msgSend(v11, "length"));
  [v12 appendData:a3];
  objc_msgSend(v12, "appendData:", objc_msgSend(a4, "dataUsingEncoding:", 4));
  [v12 appendData:a5];
  [v12 appendData:v11];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v13 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447491;
    __int16 v21 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
    __int16 v22 = 2114;
    id v23 = a3;
    __int16 v24 = 2114;
    id v25 = a4;
    __int16 v26 = 2114;
    id v27 = a5;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2113;
    int64_t v31 = v12;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,session ID = %{public}@, partner ID = %{public}@, ADR public key = %{public}@,device session public key = %{public}@, sharedInfoPrefix = %{private}@", buf, 0x3Eu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  return v12;
}

+ (id)getDecryptedPartnerSessionSecret:(id)a3 sessionID:(id)a4 partnerID:(id)a5 partnerAdrPublicKeyData:(id)a6 deviceSessionPrivateKey:(__SecKey *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 && a5 && a6 && a7)
  {
    int64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(a3, "length") + objc_msgSend(a6, "length"));
    [v12 appendData:a6];
    [v12 appendData:a3];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v13 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v27 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      __int16 v28 = 2114;
      id v29 = a6;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,partner ADR public key = %{public}@\n", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      __int16 v22 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v14 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      id v27 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      __int16 v28 = 2113;
      id v29 = v12;
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,full encrypted partner session secret blob = %{private}@\n", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v23 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v23);
      if (v23 != (char *)buf) {
        free(v23);
      }
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(a5, "length") + objc_msgSend(a4, "length"));
    [v15 appendData:a4];
    objc_msgSend(v15, "appendData:", objc_msgSend(a5, "dataUsingEncoding:", 4));
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v16 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      id v27 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      __int16 v28 = 2113;
      id v29 = v12;
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,shared info = %{private}@\n", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      __int16 v24 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
    id v17 = +[CLEEDCryptoUtilities getECIESDecryptedData:v12 key:a7 sharedInfo:v15];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v18 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      id v27 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      __int16 v28 = 2113;
      id v29 = v17;
      _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,partner session secret = %{private}@\n", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      uint64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v20 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v27 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v25 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
    return 0;
  }
  return v17;
}

+ (BOOL)validateDerivedSessionSecrets:(id)a3 sharedInfoPrefix:(id)a4 partnerKeyConfirmation:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v8 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    __int16 v33 = 2113;
    id v34 = a3;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,combined secret = %{private}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v26 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
  }
  uint64_t v9 = [@"partner key confirmation" dataUsingEncoding:4];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA58] dataWithCapacity:objc_msgSend(@"partner key confirmation", "length") + objc_msgSend(a4, "length")];
  [v10 appendData:a4];
  [v10 appendData:v9];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v11 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    __int16 v33 = 2113;
    id v34 = v10;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, shared info =%{private}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v27 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v27);
    if (v27 != (char *)buf) {
      free(v27);
    }
  }
  id v12 = +[CLEEDCryptoUtilities getDerivedKeyWithLength:48 secretData:a3 additionalInfo:v10];
  if (!v12)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v20 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
      _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKeyBlob,early return", buf, 0xCu);
    }
    int v21 = sub_1906CB57C(115, 0);
    BOOL result = 0;
    if (!v21) {
      return result;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      goto LABEL_67;
    }
    goto LABEL_64;
  }
  id v13 = v12;
  uint64_t v14 = objc_msgSend(v12, "subdataWithRange:", 0, 32);
  uint64_t v15 = objc_msgSend(v13, "subdataWithRange:", 32, 16);
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v16 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    __int16 v33 = 2113;
    id v34 = v13;
    __int16 v35 = 2113;
    uint64_t v36 = v14;
    __int16 v37 = 2113;
    uint64_t v38 = v15;
    _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,derived key blob = %{private}@,derived key = %{private}@, derived IV blob = %{private}@", buf, 0x2Au);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v28 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
  if (!v14 || !v15)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v22 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
      _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKey or derivedIV,early return", buf, 0xCu);
    }
    int v23 = sub_1906CB57C(115, 0);
    BOOL result = 0;
    if (!v23) {
      return result;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      goto LABEL_67;
    }
LABEL_64:
    uint64_t v30 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v30);
    if (v30 != (char *)buf) {
      free(v30);
    }
    return 0;
  }
  id v17 = +[CLEEDCryptoUtilities getGMACWithAuthData:v9 key:v14 iv:v15];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v18 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    __int16 v33 = 2113;
    id v34 = v17;
    _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,partner key confirmation tag = %{private}@\n", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v29 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
  }
  if (v17 && ([v17 isEqualToData:a5] & 1) != 0) {
    return 1;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  __int16 v24 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v32 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    _os_log_impl(&dword_1906B8000, v24, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil computedPartnerKeyConfirmation or partner key confirmation does not match\n", buf, 0xCu);
  }
  int v25 = sub_1906CB57C(115, 0);
  BOOL result = 0;
  if (v25)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_64;
    }
LABEL_67:
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
    goto LABEL_64;
  }
  return result;
}

+ (id)getDecryptedRequestDict:(id)a3 requestID:(id)a4 combinedSecret:(id)a5 sharedInfoPrefix:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v10 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446723;
    __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v47 = 2113;
    *(void *)int v48 = a5;
    *(_WORD *)&v48[8] = 2113;
    *(void *)&v48[10] = a6;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,combined secret = %{private}@, sharedInfoPrefix = %{private}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446723;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v43 = 2113;
    *(void *)__int16 v44 = a5;
    *(_WORD *)&v44[8] = 2113;
    *(void *)&v44[10] = a6;
    __int16 v37 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf) {
      free(v37);
    }
  }
  if (!a3 || !a4 || !a5 || !a6)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v29 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one ore more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446210;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    goto LABEL_89;
  }
  uint64_t v11 = [@"partner request" dataUsingEncoding:4];
  id v12 = (void *)[MEMORY[0x1E4F1CA58] dataWithCapacity:objc_msgSend(a4, "length")+ objc_msgSend(a6, "length")+ objc_msgSend(@"partner request", "length")];
  [v12 appendData:a6];
  objc_msgSend(v12, "appendData:", objc_msgSend(a4, "dataUsingEncoding:", 4));
  [v12 appendData:v11];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v13 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v47 = 2113;
    *(void *)int v48 = v12;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, shared info =%{private}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446467;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v43 = 2113;
    *(void *)__int16 v44 = v12;
    uint64_t v38 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
  }
  id v14 = +[CLEEDCryptoUtilities getDerivedKeyWithLength:48 secretData:a5 additionalInfo:v12];
  if (!v14)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v30 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_1906B8000, v30, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKeyBlob,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446210;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    goto LABEL_89;
  }
  uint64_t v15 = v14;
  uint64_t v16 = objc_msgSend(v14, "subdataWithRange:", 0, 32);
  uint64_t v17 = objc_msgSend(v15, "subdataWithRange:", 32, 16);
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  id v18 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v47 = 2113;
    *(void *)int v48 = v15;
    *(_WORD *)&v48[8] = 2113;
    *(void *)&v48[10] = v16;
    *(_WORD *)&v48[18] = 2113;
    *(void *)&v48[20] = v17;
    _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,derived key blob = %{private}@,derived key = %{private}@, derived IV blob = %{private}@", buf, 0x2Au);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446979;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v43 = 2113;
    *(void *)__int16 v44 = v15;
    *(_WORD *)&v44[8] = 2113;
    *(void *)&v44[10] = v16;
    *(_WORD *)&v44[18] = 2113;
    *(void *)&v44[20] = v17;
    uint64_t v39 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v39);
    if (v39 != (char *)buf) {
      free(v39);
    }
  }
  if (!v16 || !v17)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v31 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKey or derivedIV,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446210;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    goto LABEL_89;
  }
  id v19 = +[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:](CLEEDCryptoUtilities, "getAESGCMDecryptedData:key:iv:authTag:", objc_msgSend(a3, "subdataWithRange:", 0, objc_msgSend(a3, "length") - 16), v16, v17, objc_msgSend(a3, "subdataWithRange:", objc_msgSend(a3, "length") - 16, 16));
  if (!v19)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v32 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,getAESGCMDecryptedData returned nil request data, early return\n", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446210;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
LABEL_89:
    __int16 v28 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v28);
    if (v28 == (char *)buf) {
      return 0;
    }
LABEL_90:
    free(v28);
    return 0;
  }
  id v40 = 0;
  uint64_t v20 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v19 options:1 error:&v40];
  if (v40)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v21 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      int v22 = [v40 code];
      uint64_t v23 = objc_msgSend((id)objc_msgSend(v40, "domain"), "UTF8String");
      uint64_t v24 = objc_msgSend((id)objc_msgSend(v40, "localizedDescription"), "UTF8String");
      *(_DWORD *)buf = 136446978;
      __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      __int16 v47 = 1026;
      *(_DWORD *)int v48 = v22;
      *(_WORD *)&v48[4] = 2082;
      *(void *)&v48[6] = v23;
      *(_WORD *)&v48[14] = 2082;
      *(void *)&v48[16] = v24;
      _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to deserialize json dictionary,error code,%{public}d,domain,%{public}s,reason,%{public}s\n", buf, 0x26u);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v25 = [v40 code];
    uint64_t v26 = objc_msgSend((id)objc_msgSend(v40, "domain"), "UTF8String");
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v40, "localizedDescription"), "UTF8String");
    int v41 = 136446978;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v43 = 1026;
    *(_DWORD *)__int16 v44 = v25;
    *(_WORD *)&v44[4] = 2082;
    *(void *)&v44[6] = v26;
    *(_WORD *)&v44[14] = 2082;
    *(void *)&v44[16] = v27;
    __int16 v28 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v28);
    if (v28 == (char *)buf) {
      return 0;
    }
    goto LABEL_90;
  }
  __int16 v33 = (void *)v20;
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  __int16 v35 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v46 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v47 = 2114;
    *(void *)int v48 = v33;
    _os_log_impl(&dword_1906B8000, v35, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,request dict:%{public}@", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v41 = 136446466;
    id v42 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    __int16 v43 = 2114;
    *(void *)__int16 v44 = v33;
    uint64_t v36 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v36);
    if (v36 != (char *)buf) {
      free(v36);
    }
  }
  return v33;
}

- (void)updateDurationInformationForCA:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(CLEEDRequest *)self requestReceivedTime];
  if (v5 > 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v7 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446723;
      int v25 = "-[CLEEDRequest updateDurationInformationForCA:]";
      __int16 v26 = 2049;
      int64_t v27 = [(CLEEDRequest *)self state];
      __int16 v28 = 1026;
      LODWORD(v29) = v3;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,state:%{private}ld, response:%{public}d", buf, 0x1Cu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      [(CLEEDRequest *)self state];
      int v22 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    if ([(CLEEDRequest *)self state] == 3)
    {
      [(CLEEDRequest *)self receivedTimeToFirstUserResponse];
      if (v8 <= 0.0)
      {
        [(CLEEDRequest *)self requestReceivedTime];
        [(CLEEDRequest *)self setReceivedTimeToFirstUserResponse:vabdd_f64(Current, v9)];
        if (qword_1E929F608 != -1) {
          dispatch_once(&qword_1E929F608, &unk_1EE005660);
        }
        uint64_t v10 = qword_1E929F600;
        if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
        {
          [(CLEEDRequest *)self requestReceivedTime];
          int64_t v12 = v11;
          [(CLEEDRequest *)self receivedTimeToFirstUserResponse];
          *(_DWORD *)buf = 136446979;
          int v25 = "-[CLEEDRequest updateDurationInformationForCA:]";
          __int16 v26 = 2049;
          int64_t v27 = v12;
          __int16 v28 = 2049;
          double v29 = Current;
          __int16 v30 = 2049;
          uint64_t v31 = v13;
          _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestReceivedTime:%{private}f, currentTime:%{private}f, receivedTimeToFirstUserResponse:%{private}f", buf, 0x2Au);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929F608 != -1) {
            dispatch_once(&qword_1E929F608, &unk_1EE005660);
          }
          [(CLEEDRequest *)self requestReceivedTime];
          [(CLEEDRequest *)self receivedTimeToFirstUserResponse];
          uint64_t v23 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v23);
          if (v23 != (char *)buf) {
            free(v23);
          }
        }
      }
    }
    if (!v3) {
      return;
    }
    [(CLEEDRequest *)self receivedTimeToAcceptTime];
    if (v14 > 0.0) {
      return;
    }
    [(CLEEDRequest *)self requestReceivedTime];
    [(CLEEDRequest *)self setReceivedTimeToAcceptTime:vabdd_f64(Current, v15)];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v16 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      [(CLEEDRequest *)self requestReceivedTime];
      int64_t v18 = v17;
      [(CLEEDRequest *)self receivedTimeToAcceptTime];
      *(_DWORD *)buf = 136446979;
      int v25 = "-[CLEEDRequest updateDurationInformationForCA:]";
      __int16 v26 = 2049;
      int64_t v27 = v18;
      __int16 v28 = 2049;
      double v29 = Current;
      __int16 v30 = 2049;
      uint64_t v31 = v19;
      _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestReceivedTime:%{private}f, currentTime:%{private}f,receivedTimeToAcceptTime:%{private}f", buf, 0x2Au);
    }
    if (!sub_1906CB57C(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [(CLEEDRequest *)self requestReceivedTime];
    [(CLEEDRequest *)self receivedTimeToAcceptTime];
    uint64_t v20 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v20);
    if (v20 == (char *)buf) {
      return;
    }
LABEL_38:
    free(v20);
    return;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  int v21 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v25 = "-[CLEEDRequest updateDurationInformationForCA:]";
    _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestReceivedTime is invalid, early return", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v20 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf) {
      goto LABEL_38;
    }
  }
}

- (NSUUID)ID
{
  return self->_ID;
}

- (NSString)psapID
{
  return self->_psapID;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSString)partnerID
{
  return self->_partnerID;
}

- (NSString)geofenceID
{
  return self->_geofenceID;
}

- (int64_t)requestStatusAtFirstUserResponse
{
  return self->_requestStatusAtFirstUserResponse;
}

- (void)setRequestStatusAtFirstUserResponse:(int64_t)a3
{
  self->_requestStatusAtFirstUserResponse = a3;
}

- (int64_t)requestTransmissionTime
{
  return self->_requestTransmissionTime;
}

- (void)setRequestTransmissionTime:(int64_t)a3
{
  self->_requestTransmissionTime = a3;
}

- (double)requestReceivedTime
{
  return self->_requestReceivedTime;
}

- (void)setRequestReceivedTime:(double)a3
{
  self->_requestReceivedTime = a3;
}

- (double)receivedTimeToFirstUserResponse
{
  return self->_receivedTimeToFirstUserResponse;
}

- (void)setReceivedTimeToFirstUserResponse:(double)a3
{
  self->_receivedTimeToFirstUserResponse = a3;
}

- (double)receivedTimeToAcceptTime
{
  return self->_receivedTimeToAcceptTime;
}

- (void)setReceivedTimeToAcceptTime:(double)a3
{
  self->_receivedTimeToAcceptTime = a3;
}

- (int64_t)numMediaSelectIterations
{
  return self->_numMediaSelectIterations;
}

- (void)setNumMediaSelectIterations:(int64_t)a3
{
  self->_numMediaSelectIterations = a3;
}

@end