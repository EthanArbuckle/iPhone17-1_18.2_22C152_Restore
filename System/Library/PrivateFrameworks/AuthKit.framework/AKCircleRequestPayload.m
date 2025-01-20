@interface AKCircleRequestPayload
+ (BOOL)supportsSecureCoding;
+ (id)_dictionaryWithPlistData:(id)a3;
+ (id)payloadWithMessage:(id)a3;
+ (id)payloadWithResponseData:(id)a3 forCircleStep:(unint64_t)a4;
- (AKCircleRequestPayload)initWithCoder:(id)a3;
- (AKPushMessage)responseMessage;
- (BOOL)isAcceptingPayload;
- (BOOL)isRequestingPayload;
- (BOOL)isURLResponse;
- (BOOL)presenceFallbackApproved;
- (BOOL)supportsPresence;
- (NSData)clientInfo;
- (NSDictionary)responseInfo;
- (NSNumber)localPresenceFound;
- (NSNumber)presenceCheckPassed;
- (NSString)altDSID;
- (NSString)serverInfo;
- (NSString)transactionId;
- (NSUUID)presenceSID;
- (id)description;
- (id)replyPayload;
- (int64_t)clientErrorCode;
- (int64_t)presenceMode;
- (unint64_t)circleStep;
- (unint64_t)piggybackingContext;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCircleStep:(unint64_t)a3;
- (void)setClientErrorCode:(int64_t)a3;
- (void)setClientInfo:(id)a3;
- (void)setLocalPresenceFound:(id)a3;
- (void)setPiggybackingContext:(unint64_t)a3;
- (void)setPresenceCheckPassed:(id)a3;
- (void)setPresenceFallbackApproved:(BOOL)a3;
- (void)setPresenceMode:(int64_t)a3;
- (void)setPresenceSID:(id)a3;
- (void)setResponseInfo:(id)a3;
- (void)setResponseMessage:(id)a3;
- (void)setServerInfo:(id)a3;
- (void)setSupportsPresence:(BOOL)a3;
- (void)setTransactionId:(id)a3;
- (void)setURLResponse:(BOOL)a3;
@end

@implementation AKCircleRequestPayload

+ (id)payloadWithMessage:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v5 + 11, a3);
  uint64_t v6 = [v4 userInfo];
  id v7 = v5[12];
  v5[12] = (id)v6;

  v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"idmsdata"];
  id v10 = v5[2];
  v5[2] = (id)v9;

  v11 = [v4 userInfo];
  v12 = [v11 objectForKeyedSubscript:@"ec"];
  v5[4] = (id)[v12 integerValue];

  v13 = [v4 userInfo];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"atxnid"];
  id v15 = v5[6];
  v5[6] = (id)v14;

  v16 = [v4 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"step"];
  v5[13] = (id)[v17 integerValue];

  uint64_t v18 = [v4 altDSID];
  id v19 = v5[5];
  v5[5] = (id)v18;

  *((unsigned char *)v5 + 9) = [v4 piggybackingIDMSFallbackApproved];
  id v20 = v5[13];
  if (v20 == (id)3)
  {
    *((unsigned char *)v5 + 8) = [v4 piggybackingPresenceMode] != 0;
    v5[8] = (id)[v4 piggybackingPresenceMode];
  }
  else
  {
    if (v20 == (id)2)
    {
      char v21 = [v4 piggybackingAcceptorSupportsPresence];
    }
    else
    {
      if (v20 != (id)1) {
        goto LABEL_8;
      }
      char v21 = [v4 piggybackingRequestorUsesPresence];
    }
    *((unsigned char *)v5 + 8) = v21;
    uint64_t v22 = [v4 piggybackingRequestorPresenceSID];
    id v23 = v5[7];
    v5[7] = (id)v22;
  }
LABEL_8:

  return v5;
}

+ (id)payloadWithResponseData:(id)a3 forCircleStep:(unint64_t)a4
{
  v5 = +[AKCircleRequestPayload _dictionaryWithPlistData:a3];
  uint64_t v6 = _AKLogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:].cold.4((uint64_t)v5, v7);
    }

    objc_opt_class();
    id v8 = [v5 objectForKeyedSubscript:@"cmd"];
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    uint64_t v11 = [v9 unsignedIntegerValue];
    objc_opt_class();
    id v12 = [v5 objectForKeyedSubscript:@"ec"];
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    uint64_t v14 = [v13 integerValue];
    objc_opt_class();
    id v15 = [v5 objectForKeyedSubscript:@"txnid"];
    if (objc_opt_isKindOfClass()) {
      id v7 = v15;
    }
    else {
      id v7 = 0;
    }

    if (v11 != 700 || !v7)
    {
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:]((uint64_t)v5, v17);
      }
      id v10 = 0;
      goto LABEL_31;
    }
    v16 = [v5 objectForKeyedSubscript:@"sid"];
    objc_opt_class();
    v17 = v16;
    if (objc_opt_isKindOfClass())
    {
      if (v17)
      {
        uint64_t v18 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
        id v19 = v17;
        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v18 = 0;
    id v19 = 0;
    if (!v17)
    {
LABEL_30:
      id v10 = objc_alloc_init(AKCircleRequestPayload);
      v10->_circleStep = a4;
      v10->_clientErrorCode = v14;
      objc_storeStrong((id *)&v10->_transactionId, v7);
      presenceSID = v10->_presenceSID;
      v10->_presenceSID = (NSUUID *)v18;

      v10->_URLResponse = 1;
LABEL_31:

      goto LABEL_32;
    }
LABEL_26:
    if (!v18)
    {
      id v20 = _AKLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:]((uint64_t)v17, v20);
      }
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[AKCircleRequestPayload payloadWithResponseData:forCircleStep:](v7);
  }
  id v10 = 0;
LABEL_32:

  return v10;
}

+ (id)_dictionaryWithPlistData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v10];
    v5 = v10;
    objc_opt_class();
    id v6 = v4;
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if (v6)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_193494000, v8, OS_LOG_TYPE_ERROR, "AKCircleRequestPayload: Failed to parse plist (%@) from plist data (%@) with error (%@)", buf, 0x20u);
    }

    id v7 = 0;
    goto LABEL_12;
  }
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[AKCircleRequestPayload _dictionaryWithPlistData:](v5);
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

- (BOOL)isRequestingPayload
{
  return (self->_circleStep < 7) & (0x54u >> self->_circleStep);
}

- (BOOL)isAcceptingPayload
{
  return (self->_circleStep < 6) & self->_circleStep;
}

- (NSData)clientInfo
{
  if (!self->_clientInfo)
  {
    id v3 = [(NSDictionary *)self->_responseInfo objectForKeyedSubscript:@"pake"];

    if (v3)
    {
      id v4 = [(NSDictionary *)self->_responseInfo objectForKeyedSubscript:@"pake"];
      v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
      clientInfo = self->_clientInfo;
      self->_clientInfo = v5;
    }
  }
  id v7 = self->_clientInfo;

  return v7;
}

- (id)replyPayload
{
  id v3 = objc_opt_new();
  id v4 = [(AKCircleRequestPayload *)self transactionId];
  [v3 setTransactionId:v4];

  v5 = [(AKCircleRequestPayload *)self altDSID];
  [v3 setAltDSID:v5];

  id v6 = [(AKCircleRequestPayload *)self serverInfo];
  [v3 setServerInfo:v6];

  int64_t v7 = [(AKCircleRequestPayload *)self clientErrorCode];
  unint64_t v8 = [(AKCircleRequestPayload *)self circleStep];
  if (v7) {
    unint64_t v9 = v8 - 2;
  }
  else {
    unint64_t v9 = v8;
  }
  [v3 setCircleStep:v9];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> transaction: %@, step: %ld, errorCode: %ld", objc_opt_class(), self, self->_transactionId, self->_circleStep, self->_clientErrorCode];
}

- (AKCircleRequestPayload)initWithCoder:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKCircleRequestPayload;
  v5 = [(AKCircleRequestPayload *)&v26 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    unint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_responseInfo"];
    responseInfo = v5->_responseInfo;
    v5->_responseInfo = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverInfo"];
    serverInfo = v5->_serverInfo;
    v5->_serverInfo = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transactionId"];
    transactionId = v5->_transactionId;
    v5->_transactionId = (NSString *)v17;

    v5->_clientErrorCode = [v4 decodeIntegerForKey:@"_clientErrorCode"];
    v5->_circleStep = [v4 decodeIntegerForKey:@"_circleStep"];
    v5->_supportsPresence = [v4 decodeBoolForKey:@"_supportsPresence"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_presenceSID"];
    presenceSID = v5->_presenceSID;
    v5->_presenceSID = (NSUUID *)v19;

    v5->_presenceMode = [v4 decodeIntegerForKey:@"_presenceMode"];
    v5->_presenceFallbackApproved = [v4 decodeBoolForKey:@"_presenceFallbackApproved"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_presenceCheckPassed"];
    presenceCheckPassed = v5->_presenceCheckPassed;
    v5->_presenceCheckPassed = (NSNumber *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_localPresenceFound"];
    localPresenceFound = v5->_localPresenceFound;
    v5->_localPresenceFound = (NSNumber *)v23;

    v5->_URLResponse = [v4 decodeBoolForKey:@"_URLResponse"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  responseInfo = self->_responseInfo;
  id v5 = a3;
  [v5 encodeObject:responseInfo forKey:@"_responseInfo"];
  [v5 encodeObject:self->_serverInfo forKey:@"_serverInfo"];
  [v5 encodeObject:self->_clientInfo forKey:@"_clientInfo"];
  [v5 encodeObject:self->_altDSID forKey:@"_altDSID"];
  [v5 encodeObject:self->_transactionId forKey:@"_transactionId"];
  [v5 encodeInteger:self->_clientErrorCode forKey:@"_clientErrorCode"];
  [v5 encodeInteger:self->_circleStep forKey:@"_circleStep"];
  [v5 encodeBool:self->_supportsPresence forKey:@"_supportsPresence"];
  [v5 encodeObject:self->_presenceSID forKey:@"_presenceSID"];
  [v5 encodeInteger:self->_presenceMode forKey:@"_presenceMode"];
  [v5 encodeBool:self->_presenceFallbackApproved forKey:@"_presenceFallbackApproved"];
  [v5 encodeObject:self->_presenceCheckPassed forKey:@"_presenceCheckPassed"];
  [v5 encodeObject:self->_localPresenceFound forKey:@"_localPresenceFound"];
  [v5 encodeBool:self->_URLResponse forKey:@"_URLResponse"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
}

- (void)setClientInfo:(id)a3
{
}

- (int64_t)clientErrorCode
{
  return self->_clientErrorCode;
}

- (void)setClientErrorCode:(int64_t)a3
{
  self->_clientErrorCode = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (void)setTransactionId:(id)a3
{
}

- (BOOL)supportsPresence
{
  return self->_supportsPresence;
}

- (void)setSupportsPresence:(BOOL)a3
{
  self->_supportsPresence = a3;
}

- (NSUUID)presenceSID
{
  return self->_presenceSID;
}

- (void)setPresenceSID:(id)a3
{
}

- (int64_t)presenceMode
{
  return self->_presenceMode;
}

- (void)setPresenceMode:(int64_t)a3
{
  self->_presenceMode = a3;
}

- (BOOL)presenceFallbackApproved
{
  return self->_presenceFallbackApproved;
}

- (void)setPresenceFallbackApproved:(BOOL)a3
{
  self->_presenceFallbackApproved = a3;
}

- (NSNumber)presenceCheckPassed
{
  return self->_presenceCheckPassed;
}

- (void)setPresenceCheckPassed:(id)a3
{
}

- (NSNumber)localPresenceFound
{
  return self->_localPresenceFound;
}

- (void)setLocalPresenceFound:(id)a3
{
}

- (AKPushMessage)responseMessage
{
  return self->_responseMessage;
}

- (void)setResponseMessage:(id)a3
{
}

- (NSDictionary)responseInfo
{
  return self->_responseInfo;
}

- (void)setResponseInfo:(id)a3
{
}

- (unint64_t)circleStep
{
  return self->_circleStep;
}

- (void)setCircleStep:(unint64_t)a3
{
  self->_circleStep = a3;
}

- (unint64_t)piggybackingContext
{
  return self->_piggybackingContext;
}

- (void)setPiggybackingContext:(unint64_t)a3
{
  self->_piggybackingContext = a3;
}

- (BOOL)isURLResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(BOOL)a3
{
  self->_URLResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseInfo, 0);
  objc_storeStrong((id *)&self->_responseMessage, 0);
  objc_storeStrong((id *)&self->_localPresenceFound, 0);
  objc_storeStrong((id *)&self->_presenceCheckPassed, 0);
  objc_storeStrong((id *)&self->_presenceSID, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);

  objc_storeStrong((id *)&self->_serverInfo, 0);
}

+ (void)payloadWithResponseData:(os_log_t)log forCircleStep:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "AKCircleRequestPayload: Unable to parse payload from invalid response", v1, 2u);
}

+ (void)payloadWithResponseData:(uint64_t)a1 forCircleStep:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "AKCircleRequestPayload: Unable to parse response dictionary (%@)", (uint8_t *)&v2, 0xCu);
}

+ (void)payloadWithResponseData:(uint64_t)a1 forCircleStep:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_193494000, a2, OS_LOG_TYPE_ERROR, "AKCircleRequestPayload: Unable to parse presence SID (%@) as valid UUIDv4", (uint8_t *)&v2, 0xCu);
}

+ (void)payloadWithResponseData:(uint64_t)a1 forCircleStep:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "AKCircleRequestPayload: Processing parsed response dictionary (%@)", (uint8_t *)&v2, 0xCu);
}

+ (void)_dictionaryWithPlistData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "AKCircleRequestPayload: Unable to parse plistData (nil)", v1, 2u);
}

@end