@interface GEOConfigExpiringKey
+ (BOOL)supportsSecureCoding;
+ (id)expiringKey:(id)a3 withTime:(id)a4 osVersion:(id)a5;
- (BOOL)_isExpiredRelativeTo:(id)a3 osVersion:(id)a4;
- (BOOL)isExpired;
- (GEOConfigExpiringKey)initWithCoder:(id)a3;
- (GEOConfigExpiringKey)initWithKey:(id)a3 time:(id)a4 osVersion:(id)a5;
- (NSDate)expireTime;
- (NSString)expireOSVersion;
- (NSString)keyPath;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOConfigExpiringKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOConfigExpiringKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOConfigExpiringKey;
  v5 = [(GEOConfigExpiringKey *)&v14 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kp"];
  keyPath = v5->_keyPath;
  v5->_keyPath = (NSString *)v6;

  if (![(NSString *)v5->_keyPath length]) {
    goto LABEL_6;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
  expireTime = v5->_expireTime;
  v5->_expireTime = (NSDate *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osv"];
  expireOSVersion = v5->_expireOSVersion;
  v5->_expireOSVersion = (NSString *)v10;

  if (v5->_expireTime || [(NSString *)v5->_expireOSVersion length]) {
LABEL_5:
  }
    v12 = v5;
  else {
LABEL_6:
  }
    v12 = 0;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_keyPath forKey:@"kp"];
  expireTime = self->_expireTime;
  if (expireTime) {
    [v5 encodeObject:expireTime forKey:@"time"];
  }
  if ([(NSString *)self->_expireOSVersion length]) {
    [v5 encodeObject:self->_expireOSVersion forKey:@"osv"];
  }
}

- (GEOConfigExpiringKey)initWithKey:(id)a3 time:(id)a4 osVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_11:
      v18 = 0;
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E4F14500];
    v21 = "Assertion failed: key.length > 0";
LABEL_13:
    _os_log_fault_impl(&dword_188D96000, v20, OS_LOG_TYPE_FAULT, v21, buf, 2u);
    goto LABEL_11;
  }
  if (!v9 && ![v10 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E4F14500];
    v21 = "Assertion failed: date != ((void *)0) || osVersion.length > 0";
    goto LABEL_13;
  }
  v22.receiver = self;
  v22.super_class = (Class)GEOConfigExpiringKey;
  v11 = [(GEOConfigExpiringKey *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    keyPath = v11->_keyPath;
    v11->_keyPath = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    expireTime = v11->_expireTime;
    v11->_expireTime = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    expireOSVersion = v11->_expireOSVersion;
    v11->_expireOSVersion = (NSString *)v16;
  }
  self = v11;
  v18 = self;
LABEL_7:

  return v18;
}

+ (id)expiringKey:(id)a3 withTime:(id)a4 osVersion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[GEOConfigExpiringKey alloc] initWithKey:v9 time:v8 osVersion:v7];

  return v10;
}

- (BOOL)isExpired
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = +[GEOPlatform sharedPlatform];
  id v5 = [v4 buildVersion];
  LOBYTE(self) = [(GEOConfigExpiringKey *)self _isExpiredRelativeTo:v3 osVersion:v5];

  return (char)self;
}

- (BOOL)_isExpiredRelativeTo:(id)a3 osVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (expireTime = self->_expireTime) != 0
    && ([(NSDate *)expireTime timeIntervalSinceDate:v6], v9 <= 0.0))
  {
    BOOL v27 = 1;
  }
  else if (-[NSString length](self->_expireOSVersion, "length") && [v7 length])
  {
    expireOSVersion = self->_expireOSVersion;
    id v11 = v7;
    uint64_t v12 = [MEMORY[0x1E4F28FE8] scannerWithString:expireOSVersion];
    v29 = v11;
    v13 = [MEMORY[0x1E4F28FE8] scannerWithString:v11];
    uint64_t v14 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    v15 = [v14 invertedSet];
    if (([v12 isAtEnd] & 1) == 0)
    {
      while (1)
      {
        if ([v13 isAtEnd]) {
          goto LABEL_18;
        }
        id v33 = 0;
        int v16 = [v12 scanCharactersFromSet:v14 intoString:&v33];
        id v17 = v33;
        id v18 = 0;
        if (v16)
        {
          id v32 = 0;
          int v19 = [v13 scanCharactersFromSet:v14 intoString:&v32];
          id v18 = v32;
          if (v19)
          {
            uint64_t v20 = [v17 integerValue];
            uint64_t v21 = [v18 integerValue];
            if (v21)
            {
              if (v20 && v20 != v21) {
                break;
              }
            }
          }
        }
        id v31 = v17;
        int v22 = [v12 scanCharactersFromSet:v15 intoString:&v31];
        id v23 = v31;

        if (v22)
        {
          id v30 = v18;
          int v24 = [v13 scanCharactersFromSet:v15 intoString:&v30];
          id v25 = v30;

          if (v24)
          {
            uint64_t v26 = [v23 compare:v25];
            if (v26)
            {
              BOOL v27 = v26 == -1;
              goto LABEL_26;
            }
          }
          id v18 = v25;
        }

        if ([v12 isAtEnd]) {
          goto LABEL_18;
        }
      }
      BOOL v27 = v20 < v21;
      id v23 = v17;
      id v25 = v18;
LABEL_26:

      goto LABEL_27;
    }
LABEL_18:
    BOOL v27 = [v12 isAtEnd] && !objc_msgSend(v13, "isAtEnd");
LABEL_27:
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSDate)expireTime
{
  return self->_expireTime;
}

- (NSString)expireOSVersion
{
  return self->_expireOSVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireOSVersion, 0);
  objc_storeStrong((id *)&self->_expireTime, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end