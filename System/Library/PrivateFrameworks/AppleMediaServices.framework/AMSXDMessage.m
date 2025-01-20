@interface AMSXDMessage
+ (BOOL)supportsSecureCoding;
+ (id)_allowedClassNamesForDecoding;
+ (id)_allowedClassesForDecoding;
+ (id)messageFromProtoMessage:(id)a3;
- (AMSXDDevice)destination;
- (AMSXDDevice)origin;
- (AMSXDMessage)initWithCoder:(id)a3;
- (AMSXDMessage)initWithIdentifier:(id)a3 destination:(id)a4 purpose:(int64_t)a5 object:(id)a6;
- (AMSXDMessage)initWithJSONDictionary:(id)a3;
- (BOOL)isExpired;
- (BOOL)isReply;
- (NSDate)receiptDate;
- (NSDictionary)JSONDictionary;
- (NSObject)object;
- (NSString)identifier;
- (NSString)logKey;
- (NSString)messageID;
- (NSString)objectClassName;
- (double)expirationInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createProtoMessage;
- (id)description;
- (int64_t)purpose;
- (void)encodeWithCoder:(id)a3;
- (void)setDestination:(id)a3;
- (void)setExpirationInterval:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsReply:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMessageID:(id)a3;
- (void)setObject:(id)a3;
- (void)setObjectClassName:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPurpose:(int64_t)a3;
- (void)setReceiptDate:(id)a3;
@end

@implementation AMSXDMessage

+ (id)_allowedClassesForDecoding
{
  if (_MergedGlobals_158 != -1) {
    dispatch_once(&_MergedGlobals_158, &__block_literal_global_143);
  }
  v2 = (void *)qword_1EB38E108;
  return v2;
}

uint64_t __42__AMSXDMessage__allowedClassesForDecoding__block_invoke()
{
  qword_1EB38E108 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", +[AMSDialogRequest classForKeyedUnarchiver](AMSDialogRequest, "classForKeyedUnarchiver"));
  return MEMORY[0x1F41817F8]();
}

+ (id)_allowedClassNamesForDecoding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AMSXDMessage__allowedClassNamesForDecoding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38E110 != -1) {
    dispatch_once(&qword_1EB38E110, block);
  }
  v2 = (void *)qword_1EB38E118;
  return v2;
}

void __45__AMSXDMessage__allowedClassNamesForDecoding__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _allowedClassesForDecoding];
  uint64_t v1 = objc_msgSend(v3, "ams_mapWithTransform:", &__block_literal_global_4);
  v2 = (void *)qword_1EB38E118;
  qword_1EB38E118 = v1;
}

NSString *__45__AMSXDMessage__allowedClassNamesForDecoding__block_invoke_2(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (AMSXDMessage)initWithIdentifier:(id)a3 destination:(id)a4 purpose:(int64_t)a5 object:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSXDMessage;
  v14 = [(AMSXDMessage *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_destination, a4);
    v15->_expirationInterval = 2678400.0;
    objc_storeStrong((id *)&v15->_identifier, a3);
    v15->_isReply = 0;
    uint64_t v16 = AMSSetLogKeyIfNeeded();
    logKey = v15->_logKey;
    v15->_logKey = (NSString *)v16;

    objc_storeStrong((id *)&v15->_object, a6);
    v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    objectClassName = v15->_objectClassName;
    v15->_objectClassName = (NSString *)v19;

    v15->_purpose = a5;
  }

  return v15;
}

+ (id)messageFromProtoMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 messageData];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = objc_opt_class();
    v8 = [v3 messageData];
    id v18 = 0;
    v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:&v18];
    id v10 = v18;

    if (!v10) {
      goto LABEL_14;
    }
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      v14 = [v3 logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v13;
      __int16 v21 = 2114;
      objc_super v22 = v14;
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode message with error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = [v3 logKey];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      objc_super v22 = v16;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode nil protoMessage data", buf, 0x16u);
    }
    v9 = 0;
  }

LABEL_14:
  return v9;
}

- (AMSXDMessage)initWithJSONDictionary:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kJSONKeyIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  uint64_t v7 = [v4 objectForKeyedSubscript:@"kJSONKeyLogKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
LABEL_12:
    v9 = 0;
    goto LABEL_64;
  }
  id v8 = v7;

  v9 = 0;
  if (v6 && v8)
  {
    v55.receiver = self;
    v55.super_class = (Class)AMSXDMessage;
    self = [(AMSXDMessage *)&v55 init];
    if (!self) {
      goto LABEL_63;
    }
    destination = [v4 objectForKeyedSubscript:@"kJSONKeyDestination"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = destination;

      if (!v11)
      {
        v53 = 0;
LABEL_15:
        uint64_t v13 = [v4 objectForKeyedSubscript:@"kJSONKeyExpirationInterval"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }

        self->_expirationInterval = (double)[v14 integerValue];
        objc_storeStrong((id *)&self->_identifier, v6);
        uint64_t v15 = [v4 objectForKeyedSubscript:@"kJSONKeyIsReply"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v16 = v15;
        }
        else {
          id v16 = 0;
        }

        self->_isReply = [v16 BOOLValue];
        objc_storeStrong((id *)&self->_logKey, v7);
        v17 = [v4 objectForKeyedSubscript:@"kJSONKeyMessageID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v18 = v17;
        }
        else {
          id v18 = 0;
        }

        messageID = self->_messageID;
        self->_messageID = v18;

        uint64_t v20 = [v4 objectForKeyedSubscript:@"kJSONKeyObject"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = 0;
          id v36 = 0;
          goto LABEL_41;
        }
        id v21 = v20;

        if (!v21)
        {
          id v36 = 0;
          goto LABEL_42;
        }
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v21 options:0];
        objc_super v22 = [v4 objectForKeyedSubscript:@"kJSONKeyObjectClassName"];
        objc_opt_class();
        __int16 v23 = 0;
        if (objc_opt_isKindOfClass()) {
          __int16 v23 = v22;
        }

        objectClassName = self->_objectClassName;
        self->_objectClassName = v23;

        if (v20)
        {
          v30 = self->_objectClassName;
          if (!v30) {
            goto LABEL_39;
          }
          v31 = [(id)objc_opt_class() _allowedClassNamesForDecoding];
          int v32 = [v31 containsObject:self->_objectClassName];

          if (v32)
          {
            v33 = (void *)MEMORY[0x1E4F28DC0];
            v34 = [(id)objc_opt_class() _allowedClassesForDecoding];
            id v54 = 0;
            v35 = [v33 unarchivedObjectOfClasses:v34 fromData:v20 error:&v54];
            id v36 = v54;
            object = self->_object;
            self->_object = v35;

LABEL_41:
LABEL_42:
            origin = [v4 objectForKeyedSubscript:@"kJSONKeyOrigin"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v41 = origin;

              if (!v41) {
                goto LABEL_47;
              }
              v42 = [[AMSXDDevice alloc] initWithJSONDictionary:v41];
              origin = self->_origin;
              self->_origin = v42;
            }
            else
            {
              id v41 = 0;
            }

LABEL_47:
            v43 = [v4 objectForKeyedSubscript:@"kJSONKeyObjectPurpose"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v44 = v43;
            }
            else {
              id v44 = 0;
            }

            self->_purpose = [v44 integerValue];
            receiptDate = [v4 objectForKeyedSubscript:@"kJSONKeyReceiptDate"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v46 = receiptDate;

              if (!v46 || ![v46 longLongValue]) {
                goto LABEL_56;
              }
              objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v46, "longLongValue"));
              v47 = (NSDate *)objc_claimAutoreleasedReturnValue();
              receiptDate = self->_receiptDate;
              self->_receiptDate = v47;
            }
            else
            {
              id v46 = 0;
            }

LABEL_56:
            if (v36)
            {
              v48 = +[AMSLogConfig sharedConfig];
              if (!v48)
              {
                v48 = +[AMSLogConfig sharedConfig];
              }
              v49 = [v48 OSLogObject];
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                uint64_t v50 = objc_opt_class();
                logKey = self->_logKey;
                *(_DWORD *)buf = 138543874;
                uint64_t v57 = v50;
                __int16 v58 = 2114;
                v59 = logKey;
                __int16 v60 = 2114;
                id v61 = v36;
                _os_log_impl(&dword_18D554000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode JSON with error: %{public}@", buf, 0x20u);
              }

              goto LABEL_12;
            }

LABEL_63:
            self = self;
            v9 = self;
            goto LABEL_64;
          }
        }
        v30 = self->_objectClassName;
        if (v30)
        {
          v38 = [(id)objc_opt_class() _allowedClassNamesForDecoding];
          char v39 = [v38 containsObject:self->_objectClassName];

          v30 = self->_objectClassName;
          if ((v39 & 1) == 0)
          {
            AMSErrorWithFormat(4, @"AMSXDMessage Error", @"Failed to decode JSON dictionary: Unexpected class name: %@", v25, v26, v27, v28, v29, (uint64_t)self->_objectClassName);
LABEL_40:
            id v36 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_41;
          }
        }
LABEL_39:
        AMSErrorWithFormat(4, @"AMSXDMessage Error", @"Failed to decode JSON dictionary: Either object or objectClassName is nil. Class name: %@", v25, v26, v27, v28, v29, (uint64_t)v30);
        goto LABEL_40;
      }
      v53 = v11;
      id v12 = [[AMSXDDevice alloc] initWithJSONDictionary:v11];
      destination = self->_destination;
      self->_destination = v12;
    }
    else
    {
      v53 = 0;
    }

    goto LABEL_15;
  }
LABEL_64:

  return v9;
}

- (NSDictionary)JSONDictionary
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSXDMessage *)self object];

  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F28DB0];
  id v6 = [(AMSXDMessage *)self object];
  id v31 = 0;
  uint64_t v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v31];
  id v8 = v31;

  if (v7)
  {
    v9 = [v7 base64EncodedStringWithOptions:0];
    [v3 setObject:v9 forKeyedSubscript:@"kJSONKeyObject"];
    id v10 = [(AMSXDMessage *)self objectClassName];
    [v3 setObject:v10 forKeyedSubscript:@"kJSONKeyObjectClassName"];

LABEL_4:
    id v11 = [(AMSXDMessage *)self destination];
    id v12 = [v11 JSONDictionary];
    [v3 setObject:v12 forKeyedSubscript:@"kJSONKeyDestination"];

    uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
    [(AMSXDMessage *)self expirationInterval];
    id v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"kJSONKeyExpirationInterval"];

    uint64_t v15 = [(AMSXDMessage *)self identifier];
    [v3 setObject:v15 forKeyedSubscript:@"kJSONKeyIdentifier"];

    id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSXDMessage isReply](self, "isReply"));
    [v3 setObject:v16 forKeyedSubscript:@"kJSONKeyIsReply"];

    v17 = [(AMSXDMessage *)self logKey];
    [v3 setObject:v17 forKeyedSubscript:@"kJSONKeyLogKey"];

    id v18 = [(AMSXDMessage *)self messageID];
    [v3 setObject:v18 forKeyedSubscript:@"kJSONKeyMessageID"];

    uint64_t v19 = [(AMSXDMessage *)self origin];
    uint64_t v20 = [v19 JSONDictionary];
    [v3 setObject:v20 forKeyedSubscript:@"kJSONKeyOrigin"];

    id v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSXDMessage purpose](self, "purpose"));
    [v3 setObject:v21 forKeyedSubscript:@"kJSONKeyObjectPurpose"];

    objc_super v22 = (void *)MEMORY[0x1E4F28ED0];
    __int16 v23 = [(AMSXDMessage *)self receiptDate];
    [v23 timeIntervalSinceReferenceDate];
    id v24 = objc_msgSend(v22, "numberWithDouble:");
    [v3 setObject:v24 forKeyedSubscript:@"kJSONKeyReceiptDate"];

    uint64_t v25 = (void *)[v3 copy];
    goto LABEL_10;
  }
  uint64_t v26 = +[AMSLogConfig sharedConfig];
  if (!v26)
  {
    uint64_t v26 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = [(AMSXDMessage *)self logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v28;
    __int16 v34 = 2114;
    v35 = v29;
    __int16 v36 = 2114;
    v37 = self;
    _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode message: %{public}@", buf, 0x20u);
  }
  uint64_t v25 = 0;
LABEL_10:

  return (NSDictionary *)v25;
}

- (id)createProtoMessage
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v12];
  id v4 = v12;
  if (v4 || ![v3 length])
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = [(AMSXDMessage *)self logKey];
      *(_DWORD *)buf = 138544130;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode proto message: %{public}@ error: %{public}@", buf, 0x2Au);
    }
    v9 = 0;
  }
  else
  {
    v9 = objc_alloc_init(AMSXDProtoMessage);
    id v10 = [(AMSXDMessage *)self logKey];
    [(AMSXDProtoMessage *)v9 setLogKey:v10];

    [(AMSXDProtoMessage *)v9 setMessageData:v3];
  }

  return v9;
}

- (id)description
{
  id v3 = NSString;
  int64_t v4 = [(AMSXDMessage *)self purpose];
  uint64_t v5 = [(AMSXDMessage *)self identifier];
  id v6 = [(AMSXDMessage *)self logKey];
  BOOL v7 = [(AMSXDMessage *)self isReply];
  id v8 = [(AMSXDMessage *)self messageID];
  [(AMSXDMessage *)self expirationInterval];
  uint64_t v10 = v9;
  id v11 = [(AMSXDMessage *)self receiptDate];
  objc_msgSend(v3, "stringWithFormat:", @"[AMSXDMessage purpose:%ld; id:%@; logKey:%@; reply:%d; msgID:%@; expInt: %lf; received:%@]",
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
  id v12 = v11);

  return v12;
}

- (BOOL)isExpired
{
  uint64_t v3 = [(AMSXDMessage *)self receiptDate];
  if (!v3) {
    return 0;
  }
  int64_t v4 = (void *)v3;
  [(AMSXDMessage *)self expirationInterval];
  double v6 = v5;

  if (v6 == -1.0) {
    return 0;
  }
  id v8 = [(AMSXDMessage *)self receiptDate];
  [(AMSXDMessage *)self expirationInterval];
  uint64_t v9 = objc_msgSend(v8, "dateByAddingTimeInterval:");

  [v9 timeIntervalSinceNow];
  BOOL v7 = v10 <= 0.0;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [(AMSXDMessage *)self JSONDictionary];
  if (v4) {
    double v5 = [+[AMSXDMessage allocWithZone:a3] initWithJSONDictionary:v4];
  }
  else {
    double v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v10 = [(AMSXDMessage *)self JSONDictionary];
  if (v10 && [MEMORY[0x1E4F28D90] isValidJSONObject:v10])
  {
    id v17 = 0;
    id v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:&v17];
    id v12 = v17;
    [v4 encodeObject:v11 forKey:@"kCodingKeyData"];

    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
    AMSErrorWithFormat(3, @"AMSXDMessage Error", @"Invalid JSON for message: %@", v5, v6, v7, v8, v9, (uint64_t)self);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12) {
      goto LABEL_11;
    }
  }
  uint64_t v13 = +[AMSLogConfig sharedConfig];
  if (!v13)
  {
    uint64_t v13 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = [(AMSXDMessage *)self logKey];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v15;
    __int16 v20 = 2114;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode message. Error: %{public}@", buf, 0x20u);
  }
LABEL_11:
}

- (AMSXDMessage)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyData"];

  if (v5)
  {
    id v12 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v12];
    id v7 = v12;
    if (v6)
    {
      self = [(AMSXDMessage *)self initWithJSONDictionary:v6];
      uint64_t v8 = self;
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    uint64_t v6 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v10;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode JSON. Error: %{public}@", buf, 0x16u);
  }

  uint64_t v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)objectClassName
{
  return self->_objectClassName;
}

- (void)setObjectClassName:(id)a3
{
}

- (BOOL)isReply
{
  return self->_isReply;
}

- (void)setIsReply:(BOOL)a3
{
  self->_isReply = a3;
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
}

- (NSDate)receiptDate
{
  return self->_receiptDate;
}

- (void)setReceiptDate:(id)a3
{
}

- (AMSXDDevice)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (double)expirationInterval
{
  return self->_expirationInterval;
}

- (void)setExpirationInterval:(double)a3
{
  self->_expirationInterval = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (AMSXDDevice)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_receiptDate, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_objectClassName, 0);
}

@end