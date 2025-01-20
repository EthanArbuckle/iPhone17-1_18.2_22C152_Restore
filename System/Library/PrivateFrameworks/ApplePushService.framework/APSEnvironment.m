@interface APSEnvironment
+ (id)environmentForName:(id)a3;
+ (void)_loadCachedProperties;
+ (void)_saveCachedProperties;
+ (void)initialize;
- (BOOL)debugHostname;
- (BOOL)isCertificateValidated;
- (BOOL)isLoadBalanced;
- (NSString)domain;
- (NSString)hostname;
- (NSString)name;
- (NSURL)configurationURL;
- (id)description;
- (unint64_t)alternatePort;
- (unint64_t)environmentType;
- (unint64_t)hash;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (unint64_t)port;
- (unint64_t)priority;
- (void)setAlternatePort:(unint64_t)a3;
- (void)setCertificateValidated:(BOOL)a3;
- (void)setConfigurationURL:(id)a3;
- (void)setDebugHostname:(BOOL)a3;
- (void)setDomain:(id)a3;
- (void)setEnvironmentType:(unint64_t)a3;
- (void)setHostname:(id)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setLoadBalanced:(BOOL)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPort:(unint64_t)a3;
@end

@implementation APSEnvironment

+ (void)initialize
{
  p_vtable = &OBJC_METACLASS___APSKeepAliveMetadata.vtable;
  v26 = objc_alloc_init(APSEnvironment);
  uint64_t v3 = APSEnvironmentProduction;
  [(APSEnvironment *)v26 setName:APSEnvironmentProduction];
  v4 = +[NSURL URLWithString:@"https://init.push.apple.com/bag"];
  [(APSEnvironment *)v26 setConfigurationURL:v4];

  [(APSEnvironment *)v26 setDomain:@"push.apple.com"];
  [(APSEnvironment *)v26 setHostname:@"courier"];
  [(APSEnvironment *)v26 setPort:5223];
  [(APSEnvironment *)v26 setAlternatePort:443];
  [(APSEnvironment *)v26 setCertificateValidated:1];
  [(APSEnvironment *)v26 setLoadBalanced:1];
  [(APSEnvironment *)v26 setEnvironmentType:0];
  v5 = (void *)sub_10007E420(@"APSDebugProductionHost", 1);
  if (v5)
  {
    [(APSEnvironment *)v26 setDebugHostname:1];
    [(APSEnvironment *)v26 setHostname:v5];
    [(APSEnvironment *)v26 setLoadBalanced:0];
    [(APSEnvironment *)v26 setCertificateValidated:0];
  }
  v6 = objc_alloc_init(APSEnvironment);
  uint64_t v7 = APSEnvironmentDevelopment;
  [(APSEnvironment *)v6 setName:APSEnvironmentDevelopment];
  v8 = +[NSURL URLWithString:@"https://init.sandbox.push.apple.com/bag"];
  [(APSEnvironment *)v6 setConfigurationURL:v8];

  [(APSEnvironment *)v6 setDomain:@"sandbox.push.apple.com"];
  [(APSEnvironment *)v6 setHostname:@"courier"];
  [(APSEnvironment *)v6 setPort:5223];
  [(APSEnvironment *)v6 setAlternatePort:443];
  [(APSEnvironment *)v6 setCertificateValidated:1];
  [(APSEnvironment *)v6 setLoadBalanced:1];
  [(APSEnvironment *)v6 setEnvironmentType:1];
  v9 = (void *)sub_10007E420(@"APSDebugSandboxHost", 1);

  if (v9)
  {
    [(APSEnvironment *)v6 setDebugHostname:1];
    [(APSEnvironment *)v6 setHostname:v9];
    [(APSEnvironment *)v6 setLoadBalanced:0];
    [(APSEnvironment *)v6 setCertificateValidated:0];
  }
  v10 = objc_alloc_init(APSEnvironment);
  uint64_t v11 = APSEnvironmentQA2;
  [(APSEnvironment *)v10 setName:APSEnvironmentQA2];
  v12 = +[NSURL URLWithString:@"https://init.qa2.push.apple.com:80/bag"];
  [(APSEnvironment *)v10 setConfigurationURL:v12];

  [(APSEnvironment *)v10 setDomain:@"qa2.push.apple.com"];
  [(APSEnvironment *)v10 setHostname:@"courier"];
  [(APSEnvironment *)v10 setPort:5223];
  [(APSEnvironment *)v10 setAlternatePort:443];
  [(APSEnvironment *)v10 setCertificateValidated:1];
  [(APSEnvironment *)v10 setLoadBalanced:1];
  [(APSEnvironment *)v10 setEnvironmentType:-1];
  v13 = (void *)sub_10007E420(@"APSQA2Environment", 1);

  if (v13)
  {
    [(APSEnvironment *)v10 setDebugHostname:1];
    [(APSEnvironment *)v10 setHostname:v13];
    [(APSEnvironment *)v10 setLoadBalanced:0];
    [(APSEnvironment *)v10 setCertificateValidated:0];
  }
  v14 = (void *)sub_10007E420(@"APSDemoEnvironment", 1);
  v15 = v14;
  if (v14)
  {
    uint64_t v25 = v7;
    uint64_t v16 = v3;
    v17 = [v14 componentsSeparatedByString:@"."];
    if ((unint64_t)[v15 length] < 3)
    {
      v21 = 0;
    }
    else
    {
      v18 = [v17 objectAtIndex:0];
      v19 = objc_msgSend(v17, "subarrayWithRange:", 1, (char *)objc_msgSend(v17, "count") - 1);
      v20 = [v19 componentsJoinedByString:@"."];

      v21 = objc_alloc_init(APSEnvironment);
      [(APSEnvironment *)v21 setName:APSEnvironmentDemo];
      [(APSEnvironment *)v21 setDomain:v20];
      [(APSEnvironment *)v21 setHostname:v18];
      [(APSEnvironment *)v21 setPort:5223];
      [(APSEnvironment *)v21 setCertificateValidated:0];
      [(APSEnvironment *)v21 setLoadBalanced:0];
      [(APSEnvironment *)v21 setEnvironmentType:-1];

      p_vtable = (void **)(&OBJC_METACLASS___APSKeepAliveMetadata + 24);
    }

    uint64_t v3 = v16;
    uint64_t v7 = v25;
  }
  else
  {
    v21 = 0;
  }
  id v22 = objc_alloc((Class)NSDictionary);
  id v23 = objc_msgSend(v22, "initWithObjectsAndKeys:", v26, v3, v6, v7, v10, v11, v21, APSEnvironmentDemo, 0);
  v24 = (void *)qword_10015A8A8;
  qword_10015A8A8 = (uint64_t)v23;

  [p_vtable + 162 _loadCachedProperties];
}

+ (id)environmentForName:(id)a3
{
  return [(id)qword_10015A8A8 objectForKey:a3];
}

+ (void)_loadCachedProperties
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)sub_10007E420(@"APSEnvironments", 1);
  id v16 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v25;
    *(void *)&long long v2 = 138412290;
    long long v14 = v2;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v5 = objc_msgSend((id)qword_10015A8A8, "objectForKey:", v4, v14);
        if (v5)
        {
          v18 = i;
          uint64_t v19 = (uint64_t)v4;
          v6 = [obj objectForKey:v4];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v7 = [v6 countByEnumeratingWithState:&v20 objects:v32 count:16];
          if (!v7) {
            goto LABEL_27;
          }
          id v8 = v7;
          uint64_t v9 = *(void *)v21;
          while (1)
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              v12 = [v6 objectForKey:v11];
              if ([v11 isEqualToString:@"APSMessageSize"])
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v5[8] = [v12 unsignedIntegerValue];
                  goto LABEL_25;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_23;
                }
              }
              else
              {
                if (![v11 isEqualToString:@"APSLargeMessageSize"])
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_25;
                  }
                  *(_DWORD *)buf = 138412546;
                  v29 = v11;
                  __int16 v30 = 2112;
                  uint64_t v31 = v19;
                  v13 = "Unknown key '%@' in environment '%@' preferences";
                  goto LABEL_24;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v5[9] = [v12 unsignedIntegerValue];
                  goto LABEL_25;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
LABEL_23:
                  *(_DWORD *)buf = 138412546;
                  v29 = v12;
                  __int16 v30 = 2112;
                  uint64_t v31 = v19;
                  v13 = "Invalid value '%@' in environment '%@' preferences";
LABEL_24:
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
                }
              }
LABEL_25:
            }
            id v8 = [v6 countByEnumeratingWithState:&v20 objects:v32 count:16];
            if (!v8)
            {
LABEL_27:

              i = v18;
              goto LABEL_30;
            }
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          v29 = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown environment name '%@' in preferences", buf, 0xCu);
        }
LABEL_30:
      }
      id v16 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v16);
  }
}

+ (void)_saveCachedProperties
{
  id v2 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)qword_10015A8A8;
  id v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [(id)qword_10015A8A8 objectForKey:v7];
        id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
        id v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInteger:", objc_msgSend(v8, "messageSize"));
        [v9 setObject:v10 forKey:@"APSMessageSize"];
        id v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInteger:", objc_msgSend(v8, "largeMessageSize"));
        [v9 setObject:v11 forKey:@"APSLargeMessageSize"];
        [v2 setObject:v9 forKey:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  sub_10007E524(@"APSEnvironments", v2, 1);
  sub_10007E648(1);
}

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_messageSize != a3)
  {
    self->_messageSize = a3;
    +[APSEnvironment _saveCachedProperties];
  }
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  if (self->_largeMessageSize != a3)
  {
    self->_largeMessageSize = a3;
    +[APSEnvironment _saveCachedProperties];
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (unint64_t)priority
{
  name = self->_name;
  if (name == (NSString *)APSEnvironmentProduction) {
    return 0;
  }
  if (name == (NSString *)APSEnvironmentDevelopment) {
    return 1;
  }
  if (name == (NSString *)APSEnvironmentDemo) {
    return 2;
  }
  return 3;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p: %@>", objc_opt_class(), self, self->_name];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (unint64_t)alternatePort
{
  return self->_alternatePort;
}

- (void)setAlternatePort:(unint64_t)a3
{
  self->_alternatePort = a3;
}

- (BOOL)isCertificateValidated
{
  return self->_certificateValidated;
}

- (void)setCertificateValidated:(BOOL)a3
{
  self->_certificateValidated = a3;
}

- (BOOL)isLoadBalanced
{
  return self->_loadBalanced;
}

- (void)setLoadBalanced:(BOOL)a3
{
  self->_loadBalanced = a3;
}

- (unint64_t)messageSize
{
  return self->_messageSize;
}

- (unint64_t)largeMessageSize
{
  return self->_largeMessageSize;
}

- (BOOL)debugHostname
{
  return self->_debugHostname;
}

- (void)setDebugHostname:(BOOL)a3
{
  self->_debugHostname = a3;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(id)a3
{
}

- (unint64_t)environmentType
{
  return self->_environmentType;
}

- (void)setEnvironmentType:(unint64_t)a3
{
  self->_environmentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end