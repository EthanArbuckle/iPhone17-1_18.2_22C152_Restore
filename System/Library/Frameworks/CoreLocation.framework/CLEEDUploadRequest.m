@interface CLEEDUploadRequest
+ (BOOL)supportsSecureCoding;
- (CLEEDUploadRequest)initWithCoder:(id)a3;
- (CLEEDUploadRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6;
- (CLEEDUploadRequest)initWithDictionary:(id)a3 error:(int64_t *)a4;
- (CLEEDUploadRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 state:(int64_t)a8 baseURL:(id)a9 relativePath:(id)a10 token:(id)a11 sessionID:(id)a12 combinedSecret:(id)a13 mediaList:(id)a14;
- (NSData)combinedSecret;
- (NSData)sessionID;
- (NSMutableSet)mediaList;
- (NSString)baseURL;
- (NSString)relativePath;
- (NSString)token;
- (NSString)uploadURL;
- (id)description;
- (id)getRequestDict;
- (int64_t)numDuplicateMediaSelections;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCombinedSecret:(id)a3;
- (void)setMediaList:(id)a3;
- (void)setNumDuplicateMediaSelections:(int64_t)a3;
- (void)setRelativePath:(id)a3;
- (void)setUploadURL:(id)a3;
- (void)updateRequestWithMediaItemList:(id)a3;
@end

@implementation CLEEDUploadRequest

- (CLEEDUploadRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 state:(int64_t)a8 baseURL:(id)a9 relativePath:(id)a10 token:(id)a11 sessionID:(id)a12 combinedSecret:(id)a13 mediaList:(id)a14
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v20 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136449283;
    v54 = "-[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessi"
          "onID:combinedSecret:mediaList:]";
    __int16 v55 = 2114;
    id v56 = a3;
    __int16 v57 = 2114;
    id v58 = a4;
    __int16 v59 = 2114;
    id v60 = a5;
    __int16 v61 = 2114;
    id v62 = a6;
    __int16 v63 = 2114;
    id v64 = a7;
    __int16 v65 = 2050;
    int64_t v66 = a8;
    __int16 v67 = 2114;
    id v68 = a9;
    __int16 v69 = 2114;
    id v70 = a10;
    __int16 v71 = 2113;
    id v72 = a11;
    __int16 v73 = 2113;
    id v74 = a12;
    __int16 v75 = 2113;
    id v76 = a13;
    __int16 v77 = 2114;
    id v78 = a14;
    _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,state:%{public}lu,baseURL:%{public}@,relativePath:%{public}@,token:%{private}@,sessionID:%{private}@,combinedSecret:%{private}@,mediaList:%{public}@]", buf, 0x84u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v27 = 136449283;
    v28 = "-[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessi"
          "onID:combinedSecret:mediaList:]";
    __int16 v29 = 2114;
    id v30 = a3;
    __int16 v31 = 2114;
    id v32 = a4;
    __int16 v33 = 2114;
    id v34 = a5;
    __int16 v35 = 2114;
    id v36 = a6;
    __int16 v37 = 2114;
    id v38 = a7;
    __int16 v39 = 2050;
    int64_t v40 = a8;
    __int16 v41 = 2114;
    id v42 = a9;
    __int16 v43 = 2114;
    id v44 = a10;
    __int16 v45 = 2113;
    id v46 = a11;
    __int16 v47 = 2113;
    id v48 = a12;
    __int16 v49 = 2113;
    id v50 = a13;
    __int16 v51 = 2114;
    id v52 = a14;
    int v24 = 132;
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessionID:combinedSecret:mediaList:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)CLEEDUploadRequest;
  v21 = -[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:](&v26, sel_initWithID_psapID_partnerID_geofenceID_requestDate_requestType_state_, a3, a4, a5, a6, a7, 2, a8, v24);
  if (v21)
  {
    v21->_baseURL = (NSString *)a9;
    v21->_relativePath = (NSString *)a10;
    v21->_token = (NSString *)a11;
    v21->_sessionID = (NSData *)a12;
    v21->_combinedSecret = (NSData *)a13;
    v21->_mediaList = (NSMutableSet *)(id)[MEMORY[0x1E4F1CA80] setWithSet:a14];
    v21->_numDuplicateMediaSelections = 0;
  }
  return v21;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLEEDUploadRequest;
  [(CLEEDRequest *)&v3 dealloc];
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CLEEDUploadRequest;
  id v3 = [(CLEEDRequest *)&v15 description];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(CLEEDUploadRequest *)self mediaList];
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    v8 = @"MediaList";
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v8 = (__CFString *)-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", [*(id *)(*((void *)&v11 + 1) + 8 * i) description]);
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    v8 = @"MediaList";
  }
  return (id)[NSString stringWithFormat:@"%@\n <CLEEDUploadRequest: baseURL:%@, relativePath:%@, mediaListCount:%lu>\n %@", v3, self->_baseURL, self->_relativePath, -[NSMutableSet count](self->_mediaList, "count"), v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLEEDUploadRequest uploadURL](self, "uploadURL"), @"uploadURL");
  [a3 encodeObject:self->_token forKey:@"token"];
  [a3 encodeObject:self->_sessionID forKey:@"sessionID"];
  [a3 encodeObject:self->_combinedSecret forKey:@"combinedSecret"];
  [a3 encodeObject:self->_mediaList forKey:@"mediaList"];
  v5.receiver = self;
  v5.super_class = (Class)CLEEDUploadRequest;
  [(CLEEDRequest *)&v5 encodeWithCoder:a3];
}

- (CLEEDUploadRequest)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLEEDUploadRequest;
  v4 = -[CLEEDRequest initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    -[CLEEDUploadRequest setUploadURL:](v4, "setUploadURL:", (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"uploadURL"]);
    v4->_token = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    v4->_sessionID = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    v4->_combinedSecret = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"combinedSecret"];
    objc_super v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_mediaList = (NSMutableSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"mediaList");
  }
  return v4;
}

- (CLEEDUploadRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  *a6 = 0;
  uint64_t v9 = [a3 objectForKey:@"request_ID"];
  uint64_t v10 = [a3 objectForKey:@"partner_ID"];
  uint64_t v11 = [a3 objectForKey:@"psap_ID"];
  uint64_t v44 = [a3 objectForKey:@"geofence_ID"];
  long long v12 = (void *)[a3 valueForKey:@"timestamp"];
  int64_t v13 = +[CLEEDRequest getSessionStartTimeFromDict:a3];
  id v14 = +[CLEEDRequest getCallIDFromDict:a3];
  id v43 = +[CLEEDCryptoUtilities getSessionIDWithPhoneNumber:v14 sessionStartTime:v13];
  __int16 v39 = a6;
  uint64_t v42 = v11;
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v15 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136448259;
    id v46 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v47 = 2114;
    uint64_t v48 = v9;
    __int16 v49 = 2114;
    uint64_t v50 = v10;
    __int16 v51 = 2114;
    uint64_t v52 = v42;
    __int16 v53 = 2114;
    uint64_t v54 = v44;
    __int16 v55 = 2050;
    uint64_t v56 = [v12 integerValue];
    __int16 v57 = 2050;
    int64_t v58 = v13;
    __int16 v59 = 2081;
    uint64_t v60 = [v14 UTF8String];
    __int16 v61 = 2081;
    uint64_t v62 = objc_msgSend((id)objc_msgSend(v43, "base64EncodedStringWithOptions:", 0), "UTF8String");
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld, sessionStartTime:%{public}lld, receivedCallID:%{private}s, sessionID:%{private}s", buf, 0x5Cu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [v12 integerValue];
    [v14 UTF8String];
    objc_msgSend((id)objc_msgSend(v43, "base64EncodedStringWithOptions:", 0), "UTF8String");
    __int16 v35 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v35);
    if (v35 != (char *)buf) {
      free(v35);
    }
  }
  uint64_t v16 = [a4 objectForKey:@"request_type"];
  int64_t v17 = +[CLEEDRequest toCLEEDRequestType:v16];
  uint64_t v18 = [a4 objectForKey:@"media_upload_path"];
  uint64_t v19 = [a4 objectForKey:@"authentication_token"];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v20 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    id v46 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v47 = 2114;
    uint64_t v48 = v16;
    __int16 v49 = 2050;
    uint64_t v50 = v17;
    __int16 v51 = 2113;
    uint64_t v52 = v18;
    __int16 v53 = 2113;
    uint64_t v54 = v19;
    _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativeURL:%{private}@, authenticationToken:%{private}@", buf, 0x34u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v36 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v36);
    if (v36 != (char *)buf) {
      free(v36);
    }
  }
  v21 = (__CFString *)v42;
  v22 = (__CFString *)v10;
  if (v9 && v10 && v42 && v44 && v14 && v43 && v12 && v18 && v17 && v19) {
    goto LABEL_27;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v23 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    id v46 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    _os_log_impl(&dword_1906B8000, v23, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not received or valid,early return", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v38 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
  }
  *__int16 v39 = 1;
  if (v9) {
LABEL_27:
  }
    id v24 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
  else {
    id v24 = (id)[MEMORY[0x1E4F29128] UUID];
  }
  id v25 = v24;
  if (v12) {
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v12, "integerValue"));
  }
  else {
    uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v27 = v26;
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v28 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v46 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    __int16 v47 = 2114;
    uint64_t v48 = (uint64_t)v25;
    __int16 v49 = 2114;
    uint64_t v50 = v27;
    _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v37 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v37);
    if (v37 != (char *)buf) {
      free(v37);
    }
    v21 = (__CFString *)v42;
    v22 = (__CFString *)v10;
  }
  if (v21) {
    __int16 v29 = v21;
  }
  else {
    __int16 v29 = @"UnknownPSAPID";
  }
  if (v22) {
    id v30 = v22;
  }
  else {
    id v30 = @"UnknownPartnerID";
  }
  if (v44) {
    __int16 v31 = (__CFString *)v44;
  }
  else {
    __int16 v31 = @"UnknownGeofenceID";
  }
  if (*v39) {
    uint64_t v32 = 7;
  }
  else {
    uint64_t v32 = 3;
  }
  __int16 v33 = @"AuthenticationToken";
  if (v19) {
    __int16 v33 = (__CFString *)v19;
  }
  return [(CLEEDUploadRequest *)self initWithID:v25 psapID:v29 partnerID:v30 geofenceID:v31 requestDate:v27 state:v32 baseURL:a5 relativePath:v18 token:v33 sessionID:v43 combinedSecret:0 mediaList:0];
}

- (NSString)uploadURL
{
  return (NSString *)[NSString stringWithFormat:@"https://%@/%@", -[CLEEDUploadRequest baseURL](self, "baseURL"), -[CLEEDUploadRequest relativePath](self, "relativePath")];
}

- (void)setUploadURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:a3];
  -[CLEEDUploadRequest setBaseURL:](self, "setBaseURL:", (id)[v4 host]);
  -[CLEEDUploadRequest setRelativePath:](self, "setRelativePath:", (id)[v4 relativePath]);
  if ([(NSString *)[(CLEEDUploadRequest *)self baseURL] hasSuffix:@"/"]) {
    [(CLEEDUploadRequest *)self setBaseURL:[(NSString *)[(CLEEDUploadRequest *)self baseURL] substringToIndex:[(NSString *)[(CLEEDUploadRequest *)self baseURL] length] - 2]];
  }
  if ([(NSString *)[(CLEEDUploadRequest *)self relativePath] hasPrefix:@"/"]) {
    [(CLEEDUploadRequest *)self setRelativePath:[(NSString *)[(CLEEDUploadRequest *)self relativePath] substringFromIndex:1]];
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v5 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    objc_super v8 = "-[CLEEDUploadRequest setUploadURL:]";
    __int16 v9 = 2114;
    uint64_t v10 = [(CLEEDUploadRequest *)self baseURL];
    __int16 v11 = 2114;
    long long v12 = [(CLEEDUploadRequest *)self relativePath];
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s,baseURL:%{public}@,relativePath:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [(CLEEDUploadRequest *)self baseURL];
    [(CLEEDUploadRequest *)self relativePath];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest setUploadURL:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (id)getRequestDict
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CLEEDUploadRequest;
  id v3 = [(CLEEDRequest *)&v21 getRequestDict];
  if (!v3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v13 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = "-[CLEEDUploadRequest getRequestDict]";
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil uploadRequestDict, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v23 = 136446210;
    id v24 = "-[CLEEDUploadRequest getRequestDict]";
    goto LABEL_32;
  }
  v4 = v3;
  if (![(CLEEDUploadRequest *)self sessionID])
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    id v14 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v26 = "-[CLEEDUploadRequest getRequestDict]";
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil sessionID, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v23 = 136446210;
    id v24 = "-[CLEEDUploadRequest getRequestDict]";
LABEL_32:
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDUploadRequest getRequestDict]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
    return 0;
  }
  objc_msgSend(v4, "setObject:forKey:", -[CLEEDUploadRequest sessionID](self, "sessionID"), @"EEDSessionID");
  objc_msgSend(v4, "setObject:forKey:", -[CLEEDUploadRequest relativePath](self, "relativePath"), @"media_upload_path");
  objc_msgSend(v4, "setObject:forKey:", -[CLEEDUploadRequest token](self, "token"), @"authentication_token");
  objc_msgSend(v4, "setObject:forKey:", -[CLEEDUploadRequest baseURL](self, "baseURL"), @"EEDRequestBaseURL");
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDUploadRequest numDuplicateMediaSelections](self, "numDuplicateMediaSelections")), @"EEDNumDuplicateMediaSelections");
  if ([(CLEEDUploadRequest *)self combinedSecret]) {
    objc_msgSend(v4, "setObject:forKey:", -[CLEEDUploadRequest combinedSecret](self, "combinedSecret"), @"EEDCombinedSecret");
  }
  if ([(NSMutableSet *)[(CLEEDUploadRequest *)self mediaList] count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(CLEEDUploadRequest *)self mediaList];
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          __int16 v11 = (void *)[*(id *)(*((void *)&v17 + 1) + 8 * i) createMediaItemDict];
          id v12 = v11;
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v8);
    }
    [v4 setValue:v5 forKey:@"EEDMediaItemSet"];
  }
  return v4;
}

- (CLEEDUploadRequest)initWithDictionary:(id)a3 error:(int64_t *)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    __int16 v29 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
      _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil uploadRequestDict or CLEEDHelperError, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_91;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136446210;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    goto LABEL_101;
  }
  *a4 = 0;
  uint64_t v6 = [a3 objectForKey:@"request_ID"];
  uint64_t v57 = [a3 objectForKey:@"partner_ID"];
  uint64_t v56 = [a3 objectForKey:@"psap_ID"];
  uint64_t v55 = [a3 objectForKey:@"geofence_ID"];
  uint64_t v7 = (void *)[a3 objectForKey:@"timestamp"];
  uint64_t v8 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v9 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
  uint64_t v10 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v77 = 2114;
    uint64_t v78 = v6;
    __int16 v79 = 2114;
    uint64_t v80 = v57;
    __int16 v81 = 2114;
    uint64_t v82 = v56;
    __int16 v83 = 2114;
    uint64_t v84 = v55;
    __int16 v85 = 2050;
    uint64_t v86 = [v7 integerValue];
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136447490;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v65 = 2114;
    uint64_t v66 = v6;
    __int16 v67 = 2114;
    uint64_t v68 = v57;
    __int16 v69 = 2114;
    uint64_t v70 = v56;
    __int16 v71 = 2114;
    uint64_t v72 = v55;
    __int16 v73 = 2050;
    uint64_t v74 = [v7 integerValue];
    __int16 v41 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v41);
    if (v41 != (char *)buf) {
      free(v41);
    }
    uint64_t v8 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
  }
  uint64_t v11 = [a3 objectForKey:@"request_type"];
  int64_t v12 = +[CLEEDRequest toCLEEDRequestType:v11];
  uint64_t v54 = [a3 objectForKey:@"media_upload_path"];
  uint64_t v53 = [a3 objectForKey:@"authentication_token"];
  uint64_t v52 = [a3 objectForKey:@"EEDRequestBaseURL"];
  if (*((void *)v8 + 193) != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v13 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447491;
    id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v77 = 2114;
    uint64_t v78 = v11;
    __int16 v79 = 2050;
    uint64_t v80 = v12;
    __int16 v81 = 2113;
    uint64_t v82 = v54;
    __int16 v83 = 2113;
    uint64_t v84 = v53;
    __int16 v85 = 2113;
    uint64_t v86 = v52;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativeURL:%{private}@, authenticationToken:%{private}@, baseURL:%{private}@", buf, 0x3Eu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (*((void *)v8 + 193) != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136447491;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v65 = 2114;
    uint64_t v66 = v11;
    __int16 v67 = 2050;
    uint64_t v68 = v12;
    __int16 v69 = 2113;
    uint64_t v70 = v54;
    __int16 v71 = 2113;
    uint64_t v72 = v53;
    __int16 v73 = 2113;
    uint64_t v74 = v52;
    uint64_t v42 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v42);
    if (v42 != (char *)buf) {
      free(v42);
    }
    uint64_t v8 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
  }
  id v14 = (void *)[a3 objectForKey:@"EEDSessionID"];
  __int16 v51 = (void *)[a3 objectForKey:@"EEDCombinedSecret"];
  if (*((void *)v8 + 193) != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  objc_super v15 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "base64EncodedStringWithOptions:", 0), "UTF8String");
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v51, "base64EncodedStringWithOptions:", 0), "UTF8String");
    *(_DWORD *)buf = 136446723;
    id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v77 = 2081;
    uint64_t v78 = v16;
    uint64_t v8 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
    __int16 v79 = 2081;
    uint64_t v80 = v17;
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,sessionID:%{private}s, combinedSecret:%{private}s", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (*((void *)v8 + 193) != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136446723;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v65 = 2081;
    uint64_t v66 = objc_msgSend((id)objc_msgSend(v14, "base64EncodedStringWithOptions:", 0), "UTF8String");
    __int16 v67 = 2081;
    uint64_t v68 = objc_msgSend((id)objc_msgSend(v51, "base64EncodedStringWithOptions:", 0), "UTF8String");
    id v43 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v43);
    if (v43 != (char *)buf) {
      free(v43);
    }
    uint64_t v8 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
    if (!v6) {
      goto LABEL_86;
    }
  }
  else if (!v6)
  {
LABEL_86:
    if (*((void *)v8 + 193) != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v44 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
      _os_log_impl(&dword_1906B8000, v44, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not available", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_91;
    }
    bzero(buf, 0x65CuLL);
    if (*((void *)v8 + 193) != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136446210;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    goto LABEL_101;
  }
  if (!v57 || !v56 || !v55 || !v7 || !v54 || !v12 || !v53 || !v52 || !v14) {
    goto LABEL_86;
  }
  id v18 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v7, "integerValue"));
  if (*((void *)v8 + 193) != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  long long v20 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v77 = 2114;
    uint64_t v78 = (uint64_t)v18;
    __int16 v79 = 2114;
    uint64_t v80 = v19;
    _os_log_impl(&dword_1906B8000, v20, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (*((void *)v8 + 193) != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136446722;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v65 = 2114;
    uint64_t v66 = (uint64_t)v18;
    __int16 v67 = 2114;
    uint64_t v68 = v19;
    id v46 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v46);
    if (v46 != (char *)buf) {
      free(v46);
    }
  }
  objc_super v21 = (void *)[a3 valueForKey:@"EEDMediaItemSet"];
  if ([v21 count])
  {
    v22 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v48 = v19;
      id v49 = v18;
      uint64_t v25 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v59 != v25) {
            objc_enumerationMutation(v21);
          }
          id v27 = +[CLEEDMediaItem createMediaItemFromDict:*(void *)(*((void *)&v58 + 1) + 8 * i)];
          id v28 = v27;
          if (v27) {
            [v22 addObject:v27];
          }
        }
        uint64_t v24 = [v21 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v24);
      uint64_t v9 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
      uint64_t v19 = v48;
      id v18 = v49;
    }
  }
  else
  {
    v22 = 0;
  }
  id v30 = -[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessionID:combinedSecret:mediaList:](self, "initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessionID:combinedSecret:mediaList:", v18, v56, v57, v55, v19, (int)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDRequestState"), "intValue"), v52, v54, v53, v14, v51, v22);
  if (!v30)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int64_t v40 = *((void *)v9 + 192);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
      _os_log_impl(&dword_1906B8000, v40, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil request, early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      goto LABEL_91;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v63 = 136446210;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
LABEL_101:
    __int16 v47 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v47);
    if (v47 != (char *)buf) {
      free(v47);
    }
LABEL_91:
    __int16 v31 = 0;
    *a4 = 1;
    return v31;
  }
  __int16 v31 = v30;
  -[CLEEDRequest setRequestStatusAtFirstUserResponse:](v30, "setRequestStatusAtFirstUserResponse:", (int)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDRequestStatusAtFirstUserResponse"), "intValue"));
  -[CLEEDRequest setRequestTransmissionTime:](v31, "setRequestTransmissionTime:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EEDRequestTransmissionTime"), "integerValue"));
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDRequestReceivedTime"), "doubleValue");
  -[CLEEDRequest setRequestReceivedTime:](v31, "setRequestReceivedTime:");
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDReceivedTimeToFirstUserResponse"), "doubleValue");
  -[CLEEDRequest setReceivedTimeToFirstUserResponse:](v31, "setReceivedTimeToFirstUserResponse:");
  objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"EEDReceivedTimeToAcceptTime"), "doubleValue");
  -[CLEEDRequest setReceivedTimeToAcceptTime:](v31, "setReceivedTimeToAcceptTime:");
  -[CLEEDRequest setNumMediaSelectIterations:](v31, "setNumMediaSelectIterations:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EEDNumMediaSelectIterations"), "integerValue"));
  -[CLEEDUploadRequest setNumDuplicateMediaSelections:](v31, "setNumDuplicateMediaSelections:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"EEDNumDuplicateMediaSelections"), "integerValue"));
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v32 = *((void *)v9 + 192);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [(CLEEDRequest *)v31 state];
    uint64_t v34 = [(NSMutableSet *)[(CLEEDUploadRequest *)v31 mediaList] count];
    int64_t v35 = *a4;
    *(_DWORD *)buf = 136447235;
    id v76 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v77 = 2113;
    uint64_t v78 = (uint64_t)v31;
    __int16 v79 = 2050;
    uint64_t v80 = v33;
    __int16 v81 = 2050;
    uint64_t v82 = v34;
    __int16 v83 = 2050;
    uint64_t v84 = v35;
    _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDUploadRequest:%{private}@, state:%{public}ld, mediaListCount:%{public}lu, error:%{public}ld", buf, 0x34u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v36 = [(CLEEDRequest *)v31 state];
    uint64_t v37 = [(NSMutableSet *)[(CLEEDUploadRequest *)v31 mediaList] count];
    int64_t v38 = *a4;
    int v63 = 136447235;
    id v64 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    __int16 v65 = 2113;
    uint64_t v66 = (uint64_t)v31;
    __int16 v67 = 2050;
    uint64_t v68 = v36;
    __int16 v69 = 2050;
    uint64_t v70 = v37;
    __int16 v71 = 2050;
    uint64_t v72 = v38;
    __int16 v39 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v39);
    if (v39 != (char *)buf) {
      free(v39);
    }
  }
  return v31;
}

- (void)updateRequestWithMediaItemList:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(CLEEDRequest *)self setNumMediaSelectIterations:[(CLEEDRequest *)self numMediaSelectIterations] + 1];
    uint64_t v5 = [a3 count];
    objc_msgSend(a3, "minusSet:", -[CLEEDUploadRequest mediaList](self, "mediaList"));
    uint64_t v6 = v5 - [a3 count];
    [(NSMutableSet *)[(CLEEDUploadRequest *)self mediaList] unionSet:a3];
    [(CLEEDUploadRequest *)self setNumDuplicateMediaSelections:v6 + [(CLEEDUploadRequest *)self numDuplicateMediaSelections]];
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v7 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447490;
      uint64_t v11 = "-[CLEEDUploadRequest updateRequestWithMediaItemList:]";
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = [a3 count];
      __int16 v16 = 1024;
      int v17 = [(CLEEDUploadRequest *)self numDuplicateMediaSelections];
      __int16 v18 = 2048;
      uint64_t v19 = [(NSMutableSet *)[(CLEEDUploadRequest *)self mediaList] count];
      __int16 v20 = 1024;
      int v21 = [(CLEEDRequest *)self numMediaSelectIterations];
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,itemsBeforeRemovingDuplicates:%lu, mediaItemList.count:%lu, numDuplicateMediaSelections:%d, totalItems:%ld, numMediaSelectIterations:%d", buf, 0x36u);
    }
    if (!sub_1906CB57C(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    [a3 count];
    [(CLEEDUploadRequest *)self numDuplicateMediaSelections];
    [(NSMutableSet *)[(CLEEDUploadRequest *)self mediaList] count];
    [(CLEEDRequest *)self numMediaSelectIterations];
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDUploadRequest updateRequestWithMediaItemList:]", "CoreLocation: %s\n", v8);
    if (v8 == (char *)buf) {
      return;
    }
LABEL_20:
    free(v8);
    return;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  uint64_t v9 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = "-[CLEEDUploadRequest updateRequestWithMediaItemList:]";
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil input parameter(s), early return", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDUploadRequest updateRequestWithMediaItemList:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      goto LABEL_20;
    }
  }
}

- (NSMutableSet)mediaList
{
  return self->_mediaList;
}

- (void)setMediaList:(id)a3
{
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

- (NSString)token
{
  return self->_token;
}

- (NSData)sessionID
{
  return self->_sessionID;
}

- (NSData)combinedSecret
{
  return self->_combinedSecret;
}

- (void)setCombinedSecret:(id)a3
{
}

- (int64_t)numDuplicateMediaSelections
{
  return self->_numDuplicateMediaSelections;
}

- (void)setNumDuplicateMediaSelections:(int64_t)a3
{
  self->_numDuplicateMediaSelections = a3;
}

@end