@interface IDSServerBagConfig
+ (id)IDSConfig;
+ (id)courierConfig;
- (BOOL)bypassProcessChecks;
- (BOOL)requiresIDSHost;
- (BOOL)validateAgainstIDSPolicy;
- (IDSServerBagConfig)initWithURL:(id)a3 defaultsDomain:(id)a4 defaultBag:(id)a5 apsEnvironmentName:(id)a6 sosDomain:(unint64_t)a7 hashAlgorithm:(char)a8 requiresIDSHost:(BOOL)a9 validateAgainstIDSPolicy:(BOOL)a10 bagType:(int64_t)a11 bypassProcessChecks:(BOOL)a12 logCategory:(id)a13;
- (NSDictionary)defaultBag;
- (NSString)apsEnvironmentName;
- (NSString)defaultsDomain;
- (NSURL)url;
- (OS_os_log)logCategory;
- (char)hashAlgorithm;
- (id)debugDescription;
- (id)description;
- (int64_t)bagType;
- (unint64_t)sosDomain;
@end

@implementation IDSServerBagConfig

+ (id)IDSConfig
{
  int v3 = IMGetConferenceSettings();
  id v4 = 0;
  id v5 = 0;
  v6 = 0;
  if (v3)
  {
    if (qword_1EB2BB840 != -1) {
      dispatch_once(&qword_1EB2BB840, &unk_1EEFCD678);
    }
    id v7 = (id)qword_1EB2BB828;
    id v8 = objc_alloc((Class)a1);
    v6 = objc_msgSend_initWithURL_defaultsDomain_defaultBag_apsEnvironmentName_sosDomain_hashAlgorithm_requiresIDSHost_validateAgainstIDSPolicy_bagType_bypassProcessChecks_logCategory_(v8, v9, (uint64_t)v4, v10, @"com.apple.facetime.bag", &unk_1EF02B350, v5, 2, 1, 256, 0, 0, v7);
  }
  return v6;
}

+ (id)courierConfig
{
  int v3 = IMGetiMessageSettings();
  id v4 = 0;
  id v5 = 0;
  v6 = 0;
  if (v3)
  {
    if (qword_1EB2BB818 != -1) {
      dispatch_once(&qword_1EB2BB818, &unk_1EEFCE518);
    }
    id v7 = (id)qword_1EB2BB810;
    id v8 = objc_alloc((Class)a1);
    v6 = objc_msgSend_initWithURL_defaultsDomain_defaultBag_apsEnvironmentName_sosDomain_hashAlgorithm_requiresIDSHost_validateAgainstIDSPolicy_bagType_bypassProcessChecks_logCategory_(v8, v9, (uint64_t)v4, v10, @"com.apple.imessage.bag", 0, v5, 1, 1, 0, 1, 0, v7);
  }
  return v6;
}

- (id)description
{
  int v3 = NSString;
  uint64_t v6 = objc_opt_class();
  long long v7 = *(_OWORD *)&self->_url;
  long long v17 = v7;
  uint64_t hashAlgorithm = self->_hashAlgorithm;
  if (self->_requiresIDSHost) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if (self->_validateAgainstIDSPolicy) {
    double v10 = @"YES";
  }
  else {
    double v10 = @"NO";
  }
  unint64_t sosDomain = self->_sosDomain;
  int64_t bagType = self->_bagType;
  apsEnvironmentName = self->_apsEnvironmentName;
  uint64_t v14 = objc_msgSend_count(self->_defaultBag, v4, v5, *(double *)&v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v15, @"<%@:%p; url: %@; defaultsDomain: %@; apsName: %@; sosDomain: %d; hashAlgorithm: %d; requiresIDS: %@; IDSPolicy: %@; bagType: %d; defaultBag.count: %llu",
               *(double *)&v17,
               v6,
               self,
               v17,
               apsEnvironmentName,
               sosDomain,
               hashAlgorithm,
               v9,
               v10,
               bagType,
               v14);
}

- (int64_t)bagType
{
  return self->_bagType;
}

- (IDSServerBagConfig)initWithURL:(id)a3 defaultsDomain:(id)a4 defaultBag:(id)a5 apsEnvironmentName:(id)a6 sosDomain:(unint64_t)a7 hashAlgorithm:(char)a8 requiresIDSHost:(BOOL)a9 validateAgainstIDSPolicy:(BOOL)a10 bagType:(int64_t)a11 bypassProcessChecks:(BOOL)a12 logCategory:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a13;
  v33.receiver = self;
  v33.super_class = (Class)IDSServerBagConfig;
  v23 = [(IDSServerBagConfig *)&v33 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_url, a3);
    objc_storeStrong((id *)&v24->_defaultsDomain, a4);
    objc_storeStrong((id *)&v24->_defaultBag, a5);
    objc_storeStrong((id *)&v24->_apsEnvironmentName, a6);
    v24->_uint64_t hashAlgorithm = a8;
    v24->_requiresIDSHost = a9;
    v24->_validateAgainstIDSPolicy = a10;
    v24->_unint64_t sosDomain = a7;
    v24->_int64_t bagType = a11;
    v24->_bypassProcessChecks = a12;
    if (v22)
    {
      v28 = (OS_os_log *)v22;
    }
    else
    {
      objc_msgSend_serverBag(MEMORY[0x1E4F6C3B8], v25, v26, v27);
      v28 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
    }
    logCategory = v24->_logCategory;
    v24->_logCategory = v28;
  }
  return v24;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (OS_os_log)logCategory
{
  return self->_logCategory;
}

- (BOOL)validateAgainstIDSPolicy
{
  return self->_validateAgainstIDSPolicy;
}

- (NSURL)url
{
  return self->_url;
}

- (char)hashAlgorithm
{
  return self->_hashAlgorithm;
}

- (NSDictionary)defaultBag
{
  return self->_defaultBag;
}

- (id)debugDescription
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = @"YES";
  if (self->_requiresIDSHost) {
    long long v7 = @"YES";
  }
  else {
    long long v7 = @"NO";
  }
  if (!self->_validateAgainstIDSPolicy) {
    uint64_t v6 = @"NO";
  }
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@:%p; url: %@; defaultsDomain: %@; apsName: %@; sosDomain: %d; hashAlgorithm: %d; requiresIDS: %@; IDSPolicy: %@; bagType: %d; defaultBag: %@",
               *(double *)&self->_url,
               v4,
               self,
               *(_OWORD *)&self->_url,
               self->_apsEnvironmentName,
               self->_sosDomain,
               self->_hashAlgorithm,
               v7,
               v6,
               self->_bagType,
               self->_defaultBag);
}

- (NSString)apsEnvironmentName
{
  return self->_apsEnvironmentName;
}

- (unint64_t)sosDomain
{
  return self->_sosDomain;
}

- (BOOL)requiresIDSHost
{
  return self->_requiresIDSHost;
}

- (BOOL)bypassProcessChecks
{
  return self->_bypassProcessChecks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCategory, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentName, 0);
  objc_storeStrong((id *)&self->_defaultBag, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end