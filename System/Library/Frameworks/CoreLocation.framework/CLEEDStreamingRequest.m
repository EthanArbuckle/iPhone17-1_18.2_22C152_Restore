@interface CLEEDStreamingRequest
+ (BOOL)supportsSecureCoding;
- (CLEEDStreamingRequest)initWithCoder:(id)a3;
- (CLEEDStreamingRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6;
- (CLEEDStreamingRequest)initWithDictionary:(id)a3 error:(int64_t *)a4;
- (CLEEDStreamingRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 state:(int64_t)a8 baseURL:(id)a9 relativePath:(id)a10 token:(id)a11;
- (NSString)baseURL;
- (NSString)relativePath;
- (NSString)streamingURL;
- (NSString)token;
- (id)description;
- (id)getRequestDict;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)setStreamingURL:(id)a3;
@end

@implementation CLEEDStreamingRequest

- (CLEEDStreamingRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 state:(int64_t)a8 baseURL:(id)a9 relativePath:(id)a10 token:(id)a11
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v18 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448515;
    v45 = "-[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:]";
    __int16 v46 = 2114;
    id v47 = a3;
    __int16 v48 = 2114;
    id v49 = a4;
    __int16 v50 = 2114;
    id v51 = a5;
    __int16 v52 = 2114;
    id v53 = a6;
    __int16 v54 = 2114;
    id v55 = a7;
    __int16 v56 = 2050;
    int64_t v57 = a8;
    __int16 v58 = 2114;
    id v59 = a9;
    __int16 v60 = 2114;
    id v61 = a10;
    __int16 v62 = 2113;
    id v63 = a11;
    _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,state:%{public}lu,baseURL:%{public}@,relativePath:%{public}@,token:%{private}@]", buf, 0x66u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v24 = 136448515;
    v25 = "-[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:]";
    __int16 v26 = 2114;
    id v27 = a3;
    __int16 v28 = 2114;
    id v29 = a4;
    __int16 v30 = 2114;
    id v31 = a5;
    __int16 v32 = 2114;
    id v33 = a6;
    __int16 v34 = 2114;
    id v35 = a7;
    __int16 v36 = 2050;
    int64_t v37 = a8;
    __int16 v38 = 2114;
    id v39 = a9;
    __int16 v40 = 2114;
    id v41 = a10;
    __int16 v42 = 2113;
    id v43 = a11;
    int v22 = 102;
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf) {
      free(v21);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CLEEDStreamingRequest;
  v19 = -[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:](&v23, sel_initWithID_psapID_partnerID_geofenceID_requestDate_requestType_state_, a3, a4, a5, a6, a7, 1, a8, v22);
  if (v19)
  {
    v19->_baseURL = (NSString *)a9;
    v19->_relativePath = (NSString *)a10;
    v19->_token = (NSString *)a11;
  }
  return v19;
}

- (CLEEDStreamingRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  *a6 = 0;
  uint64_t v9 = [a3 objectForKey:@"request_ID"];
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
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v42 = 2114;
    uint64_t v43 = v9;
    __int16 v44 = 2114;
    uint64_t v45 = v10;
    __int16 v46 = 2114;
    uint64_t v47 = v11;
    __int16 v48 = 2114;
    uint64_t v49 = v12;
    __int16 v50 = 2050;
    uint64_t v51 = [v13 integerValue];
    _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  id v39 = a6;
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [v13 integerValue];
    id v33 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
  }
  uint64_t v15 = [a4 objectForKey:@"request_type"];
  int64_t v16 = +[CLEEDRequest toCLEEDRequestType:v15];
  uint64_t v17 = [a4 objectForKey:@"whip_endpoint_path"];
  uint64_t v18 = [a4 objectForKey:@"authentication_token"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v19 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v42 = 2114;
    uint64_t v43 = v15;
    __int16 v44 = 2050;
    uint64_t v45 = v16;
    __int16 v46 = 2113;
    uint64_t v47 = v17;
    __int16 v48 = 2113;
    uint64_t v49 = v18;
    _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativePath:%{private}@, authenticationToken:%{private}@", buf, 0x34u);
  }
  v20 = v39;
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v34 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v34);
    if (v34 != (char *)buf) {
      free(v34);
    }
    v20 = v39;
    if (!v9) {
      goto LABEL_19;
    }
  }
  else if (!v9)
  {
    goto LABEL_19;
  }
  if (v10 && v11 && v12 && v13 && v17 && v16 && v18)
  {
LABEL_25:
    id v22 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
    goto LABEL_26;
  }
LABEL_19:
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v21 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    _os_log_impl(&dword_1906B8000, v21, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not received or valid", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v36 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v36);
    if (v36 != (char *)buf) {
      free(v36);
    }
    v20 = v39;
  }
  int64_t *v20 = 1;
  if (v9) {
    goto LABEL_25;
  }
  id v22 = (id)[MEMORY[0x1E4F29128] UUID];
LABEL_26:
  id v23 = v22;
  if (v13) {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v13, "integerValue"));
  }
  else {
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v25 = v24;
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  __int16 v26 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v42 = 2114;
    uint64_t v43 = (uint64_t)v23;
    __int16 v44 = 2114;
    uint64_t v45 = v25;
    _os_log_impl(&dword_1906B8000, v26, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v35 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf) {
      free(v35);
    }
    v20 = v39;
  }
  if (v11) {
    id v27 = (__CFString *)v11;
  }
  else {
    id v27 = @"UnknownPSAPID";
  }
  if (v10) {
    __int16 v28 = (__CFString *)v10;
  }
  else {
    __int16 v28 = @"UnknownPartnerID";
  }
  if (v12) {
    id v29 = (__CFString *)v12;
  }
  else {
    id v29 = @"UnknownGeofenceID";
  }
  if (*v20) {
    uint64_t v30 = 7;
  }
  else {
    uint64_t v30 = 3;
  }
  id v31 = @"AuthenticationToken";
  if (v18) {
    id v31 = (__CFString *)v18;
  }
  return [(CLEEDStreamingRequest *)self initWithID:v23 psapID:v27 partnerID:v28 geofenceID:v29 requestDate:v25 state:v30 baseURL:a5 relativePath:v17 token:v31];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLEEDStreamingRequest;
  [(CLEEDRequest *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLEEDStreamingRequest;
  return (id)[NSString stringWithFormat:@"%@\n <CLEEDStreamingRequest: streamingURL, %@, token, %@>", -[CLEEDRequest description](&v3, sel_description), -[CLEEDStreamingRequest streamingURL](self, "streamingURL"), -[CLEEDStreamingRequest token](self, "token")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLEEDStreamingRequest streamingURL](self, "streamingURL"), @"streamingURL");
  [a3 encodeObject:self->_token forKey:@"token"];
  v5.receiver = self;
  v5.super_class = (Class)CLEEDStreamingRequest;
  [(CLEEDRequest *)&v5 encodeWithCoder:a3];
}

- (CLEEDStreamingRequest)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLEEDStreamingRequest;
  v4 = -[CLEEDRequest initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[CLEEDStreamingRequest setStreamingURL:](v4, "setStreamingURL:", (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"streamingURL"]);
    v4->_token = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
  }
  return v4;
}

- (NSString)streamingURL
{
  return (NSString *)[NSString stringWithFormat:@"https://%@/%@", -[CLEEDStreamingRequest baseURL](self, "baseURL"), -[CLEEDStreamingRequest relativePath](self, "relativePath")];
}

- (void)setStreamingURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:a3];
  -[CLEEDStreamingRequest setBaseURL:](self, "setBaseURL:", (id)[v4 host]);
  -[CLEEDStreamingRequest setRelativePath:](self, "setRelativePath:", (id)[v4 relativePath]);
  if ([(NSString *)[(CLEEDStreamingRequest *)self baseURL] hasSuffix:@"/"]) {
    [(CLEEDStreamingRequest *)self setBaseURL:[(NSString *)[(CLEEDStreamingRequest *)self baseURL] substringToIndex:[(NSString *)[(CLEEDStreamingRequest *)self baseURL] length] - 2]];
  }
  if ([(NSString *)[(CLEEDStreamingRequest *)self relativePath] hasPrefix:@"/"]) {
    [(CLEEDStreamingRequest *)self setRelativePath:[(NSString *)[(CLEEDStreamingRequest *)self relativePath] substringFromIndex:1]];
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v8 = "-[CLEEDStreamingRequest setStreamingURL:]";
    __int16 v9 = 2114;
    uint64_t v10 = [(CLEEDStreamingRequest *)self baseURL];
    __int16 v11 = 2114;
    uint64_t v12 = [(CLEEDStreamingRequest *)self relativePath];
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s,baseURL:%{public}@,relativePath:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [(CLEEDStreamingRequest *)self baseURL];
    [(CLEEDStreamingRequest *)self relativePath];
    objc_super v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest setStreamingURL:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (id)getRequestDict
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CLEEDStreamingRequest;
  id v3 = [(CLEEDRequest *)&v7 getRequestDict];
  if (v3)
  {
    objc_msgSend(v3, "setObject:forKey:", -[CLEEDStreamingRequest relativePath](self, "relativePath"), @"whip_endpoint_path");
    objc_msgSend(v3, "setObject:forKey:", -[CLEEDStreamingRequest token](self, "token"), @"authentication_token");
    objc_msgSend(v3, "setObject:forKey:", -[CLEEDStreamingRequest baseURL](self, "baseURL"), @"EEDRequestBaseURL");
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v4 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v11 = "-[CLEEDStreamingRequest getRequestDict]";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil streamingRequestDict, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      int v8 = 136446210;
      __int16 v9 = "-[CLEEDStreamingRequest getRequestDict]";
      objc_super v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDStreamingRequest getRequestDict]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v3;
}

- (CLEEDStreamingRequest)initWithDictionary:(id)a3 error:(int64_t *)a4
{
  v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v26 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
      _os_log_impl(&dword_1906B8000, v26, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil streamingRequestDict or CLEEDHelperError, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_64;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_72;
    }
    goto LABEL_79;
  }
  uint64_t v6 = [a3 objectForKey:@"request_ID"];
  uint64_t v39 = [a3 objectForKey:@"partner_ID"];
  uint64_t v38 = [a3 objectForKey:@"psap_ID"];
  uint64_t v7 = [a3 objectForKey:@"geofence_ID"];
  int v8 = (void *)[a3 valueForKey:@"timestamp"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  __int16 v9 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
    __int16 v42 = 2114;
    uint64_t v43 = v6;
    __int16 v44 = 2114;
    uint64_t v45 = v39;
    __int16 v46 = 2114;
    uint64_t v47 = v38;
    __int16 v48 = 2114;
    uint64_t v49 = v7;
    __int16 v50 = 2050;
    uint64_t v51 = [v8 integerValue];
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [v8 integerValue];
    id v29 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
  }
  uint64_t v10 = [a3 objectForKey:@"request_type"];
  int64_t v11 = +[CLEEDRequest toCLEEDRequestType:v10];
  uint64_t v12 = [a3 objectForKey:@"whip_endpoint_path"];
  uint64_t v13 = [a3 objectForKey:@"authentication_token"];
  uint64_t v14 = [a3 valueForKey:@"EEDRequestBaseURL"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v15 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447491;
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
    __int16 v42 = 2114;
    uint64_t v43 = v10;
    __int16 v44 = 2050;
    uint64_t v45 = v11;
    __int16 v46 = 2113;
    uint64_t v47 = v12;
    __int16 v48 = 2113;
    uint64_t v49 = v13;
    __int16 v50 = 2113;
    uint64_t v51 = v14;
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativePath:%{private}@, authenticationToken:%{private}@, baseURL:%{private}@", buf, 0x3Eu);
  }
  int64_t v16 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v30 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v30);
    if (v30 != (char *)buf) {
      free(v30);
    }
    int64_t v16 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
    if (!v6)
    {
LABEL_59:
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      v4 = a4;
      id v31 = qword_1E929F600;
      if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
        _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not received or valid", buf, 0xCu);
      }
      if (!sub_1906CB57C(115, 0)) {
        goto LABEL_64;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 == -1)
      {
LABEL_72:
        __int16 v34 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v34);
        if (v34 != (char *)buf) {
          free(v34);
        }
LABEL_64:
        v21 = 0;
        int64_t *v4 = 1;
        return v21;
      }
LABEL_79:
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
      goto LABEL_72;
    }
  }
  else if (!v6)
  {
    goto LABEL_59;
  }
  if (!v39 || !v38 || !v7 || !v8 || !v12 || !v11 || !v13 || !v14) {
    goto LABEL_59;
  }
  id v17 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v8, "integerValue"));
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v19 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
    __int16 v42 = 2114;
    uint64_t v43 = (uint64_t)v17;
    __int16 v44 = 2114;
    uint64_t v45 = v18;
    _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v33 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
    int64_t v16 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
  }
  v20 = -[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:](self, "initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:", v17, v38, v39, v7, v18, (int)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDRequestState"), "intValue"), v14, v12, v13);
  if (v20)
  {
    v21 = v20;
    -[CLEEDRequest setRequestStatusAtFirstUserResponse:](v20, "setRequestStatusAtFirstUserResponse:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EEDRequestStatusAtFirstUserResponse"), "integerValue"));
    -[CLEEDRequest setRequestTransmissionTime:](v21, "setRequestTransmissionTime:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EEDRequestTransmissionTime"), "integerValue"));
    objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDRequestReceivedTime"), "doubleValue");
    -[CLEEDRequest setRequestReceivedTime:](v21, "setRequestReceivedTime:");
    objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDReceivedTimeToFirstUserResponse"), "doubleValue");
    -[CLEEDRequest setReceivedTimeToFirstUserResponse:](v21, "setReceivedTimeToFirstUserResponse:");
    objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDReceivedTimeToAcceptTime"), "doubleValue");
    -[CLEEDRequest setReceivedTimeToAcceptTime:](v21, "setReceivedTimeToAcceptTime:");
    -[CLEEDRequest setNumMediaSelectIterations:](v21, "setNumMediaSelectIterations:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EEDNumMediaSelectIterations"), "integerValue"));
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v22 = *((void *)v16 + 192);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [(CLEEDRequest *)v21 state];
      int64_t v24 = *a4;
      *(_DWORD *)buf = 136446979;
      id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
      __int16 v42 = 2113;
      uint64_t v43 = (uint64_t)v21;
      __int16 v44 = 2050;
      uint64_t v45 = v23;
      __int16 v46 = 2050;
      uint64_t v47 = v24;
      _os_log_impl(&dword_1906B8000, v22, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDStreamingRequest:%{private}@, state:%{public}ld, error:%{public}ld", buf, 0x2Au);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      [(CLEEDRequest *)v21 state];
      uint64_t v25 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)buf) {
        free(v25);
      }
    }
  }
  else
  {
    id v27 = a4;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v28 = *((void *)v16 + 192);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v41 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
      _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil request, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      id v35 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
      id v27 = a4;
    }
    v21 = 0;
    *id v27 = 1;
  }
  return v21;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

@end