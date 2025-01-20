@interface BCSecureUserDatum
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromUserDatum:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BCSecureUserDatum

- (id)mutableCopy
{
  v3 = [BCMutableSecureUserDatum alloc];
  return [(BCMutableSecureUserDatum *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BCSecureUserDatum *)self _configureFromUserDatum:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E905C();
    }
  }
}

- (void)_configureFromUserDatum:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCSecureUserDatum;
  [(BCCloudData *)&v15 configureFromCloudData:v6 withMergers:a4];
  v7 = [v6 key];
  [(BCSecureUserDatum *)self setDifferentString:v7 forKey:@"key"];

  v8 = [v6 value];
  [(BCSecureUserDatum *)self setDifferentString:v8 forKey:@"value"];

  v9 = +[BULogUtilities shared];
  unsigned int v10 = [v9 verboseLoggingEnabled];

  if (v10)
  {
    v11 = sub_10000CD80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(BCSecureUserDatum *)self key];
      v13 = [(BCSecureUserDatum *)self debugDescription];
      v14 = [v6 key];
      *(_DWORD *)buf = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "\"\\\"BCSecureUserDatum configured: %@ %@ from userDatum:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = BUProtocolCast();
  v13.receiver = self;
  v13.super_class = (Class)BCSecureUserDatum;
  LOBYTE(v4) = [(BCCloudData *)&v13 isEqualExceptForDate:v6 ignoringEmptySalt:v4];
  v7 = [(BCSecureUserDatum *)self key];
  uint64_t v8 = [v6 key];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  unsigned int v10 = [(BCSecureUserDatum *)self value];
  v11 = [v6 value];
  LOBYTE(v8) = [v10 isEqualToString:v11];

  return v4 & v9 & v8;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BCSecureUserDatum;
  [(BCCloudData *)&v40 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    v7 = +[BCCloudData localIdentifierFromRecord:v6];
    uint64_t v8 = [(BCSecureUserDatum *)self key];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      unsigned int v10 = sub_1000083A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E9128(self, (uint64_t)v7, v10);
      }

      [(BCSecureUserDatum *)self setKey:v7];
    }
    uint64_t v11 = [(BCSecureUserDatum *)self modificationDate];
    if (v11)
    {
      v12 = (void *)v11;
      objc_super v13 = [(BCSecureUserDatum *)self modificationDate];
      [v13 timeIntervalSinceReferenceDate];
      double v15 = v14;
      v16 = [v6 modificationDate];
      [v16 timeIntervalSinceReferenceDate];
      double v18 = v17;

      if (v15 > v18)
      {
        v19 = sub_1000083A0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          __int16 v20 = [(BCSecureUserDatum *)self key];
          v21 = [v6 recordID];
          v22 = [v21 recordName];
          v23 = [(BCSecureUserDatum *)self modificationDate];
          [v23 timeIntervalSinceReferenceDate];
          double v25 = v24;
          v26 = [v6 modificationDate];
          [v26 timeIntervalSinceReferenceDate];
          CFStringRef v27 = @"newer";
          *(_DWORD *)buf = 138412802;
          v42 = v20;
          if (v25 == v28) {
            CFStringRef v27 = @"the same";
          }
          __int16 v43 = 2112;
          v44 = v22;
          __int16 v45 = 2114;
          CFStringRef v46 = v27;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BCSecureUserDatum %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        [(BCCloudData *)self incrementEditGeneration];
        goto LABEL_25;
      }
    }
    v29 = [v6 objectForKey:@"value"];
    [(BCSecureUserDatum *)self setDifferentString:v29 forKey:@"value"];
    v30 = [v6 modificationDate];
    [(BCSecureUserDatum *)self setDifferentDate:v30 forKey:@"modificationDate"];
    unsigned int v31 = [(BCSecureUserDatum *)self hasChanges];
    v32 = +[BULogUtilities shared];
    unsigned int v33 = [v32 verboseLoggingEnabled];

    if (v31)
    {
      if (v33)
      {
        v34 = sub_10000CD80();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [(BCSecureUserDatum *)self key];
          v36 = [v6 recordID];
          v37 = [v36 recordName];
          v38 = [(BCSecureUserDatum *)self debugDescription];
          *(_DWORD *)buf = 138412802;
          v42 = v35;
          __int16 v43 = 2112;
          v44 = v37;
          __int16 v45 = 2112;
          CFStringRef v46 = v38;
          v39 = "\"\\\"BCSecureUserDatum %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v39, buf, 0x20u);

          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if (v33)
    {
      v34 = sub_10000CD80();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [(BCSecureUserDatum *)self key];
        v36 = [v6 recordID];
        v37 = [v36 recordName];
        v38 = [(BCSecureUserDatum *)self debugDescription];
        *(_DWORD *)buf = 138412802;
        v42 = v35;
        __int16 v43 = 2112;
        v44 = v37;
        __int16 v45 = 2112;
        CFStringRef v46 = v38;
        v39 = "\"\\\"BCSecureUserDatum %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_22;
      }
LABEL_23:
    }
    goto LABEL_25;
  }
  v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001E9090(self, v7);
  }
LABEL_25:
}

- (id)recordType
{
  return @"SecureUserData";
}

+ (id)propertyIDKey
{
  return @"key";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (NSString)debugDescription
{
  v3 = [(BCSecureUserDatum *)self key];
  BOOL v4 = [(BCSecureUserDatum *)self value];
  id v5 = +[NSString stringWithFormat:@"key: %@, value: %@", v3, v4];

  return (NSString *)v5;
}

@end