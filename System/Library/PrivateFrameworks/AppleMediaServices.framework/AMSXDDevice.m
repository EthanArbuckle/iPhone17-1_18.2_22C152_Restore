@interface AMSXDDevice
+ (BOOL)supportsSecureCoding;
+ (id)activePairedDevices;
+ (id)allPairedDevices;
+ (id)deviceFromIdentifier:(id)a3;
- (AMSXDDevice)initWithCoder:(id)a3;
- (AMSXDDevice)initWithDeviceID:(id)a3 type:(int64_t)a4;
- (AMSXDDevice)initWithJSONDictionary:(id)a3;
- (NSDictionary)JSONDictionary;
- (NSString)identifier;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation AMSXDDevice

- (AMSXDDevice)initWithDeviceID:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSXDDevice;
  v8 = [(AMSXDDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (id)activePairedDevices
{
  v2 = [[AMSXDDevice alloc] initWithDeviceID:0 type:1];
  return v2;
}

+ (id)allPairedDevices
{
  v2 = [[AMSXDDevice alloc] initWithDeviceID:0 type:2];
  return v2;
}

+ (id)deviceFromIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[AMSXDDevice alloc] initWithDeviceID:v3 type:3];

  return v4;
}

- (AMSXDDevice)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v13.receiver = self;
    v13.super_class = (Class)AMSXDDevice;
    v5 = [(AMSXDDevice *)&v13 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"kJSONKeyIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }

      identifier = v5->_identifier;
      v5->_identifier = v7;

      v10 = [v4 objectForKeyedSubscript:@"kJSONKeyType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }

      v5->_type = [v11 integerValue];
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)JSONDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AMSXDDevice *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"kJSONKeyIdentifier"];

  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSXDDevice type](self, "type"));
  [v3 setObject:v5 forKeyedSubscript:@"kJSONKeyType"];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10 = [(AMSXDDevice *)self JSONDictionary];
  if (v10 && [MEMORY[0x1E4F28D90] isValidJSONObject:v10])
  {
    id v16 = 0;
    id v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:&v16];
    id v12 = v16;
    [v4 encodeObject:v11 forKey:@"kCodingKeyData"];

    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
    AMSErrorWithFormat(3, @"AMSXDDevice Error", @"Invalid JSON for device", v5, v6, v7, v8, v9, (uint64_t)self);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12) {
      goto LABEL_11;
    }
  }
  objc_super v13 = +[AMSLogConfig sharedConfig];
  if (!v13)
  {
    objc_super v13 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v15;
    __int16 v19 = 2114;
    id v20 = v12;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to encode message. Error: %{public}@", buf, 0x16u);
  }

LABEL_11:
}

- (AMSXDDevice)initWithCoder:(id)a3
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
      self = [(AMSXDDevice *)self initWithJSONDictionary:v6];
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

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end