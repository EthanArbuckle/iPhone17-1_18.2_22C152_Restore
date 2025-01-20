@interface SOKerberosServer
+ (id)serverWithString:(id)a3;
- (NSString)host;
- (NSString)path;
- (NSString)port;
- (NSString)protocol;
- (SOKerberosServer)initWithHost:(id)a3 port:(id)a4 protocol:(id)a5 path:(id)a6;
@end

@implementation SOKerberosServer

+ (id)serverWithString:(id)a3
{
  v3 = [a3 lowercaseString];
  if ([v3 hasPrefix:@"tcp/"])
  {
    v4 = @"tcp";
LABEL_5:
    unint64_t v5 = 4;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"udp/"])
  {
    v4 = @"udp";
    goto LABEL_5;
  }
  if ([v3 hasPrefix:@"http://"])
  {
    v4 = @"http";
    unint64_t v5 = 7;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"http/"])
  {
    v4 = @"http";
    unint64_t v5 = 5;
    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"kkdcp://"])
  {
    v4 = @"kkdcp";
    unint64_t v5 = 8;
    goto LABEL_6;
  }
  v4 = 0;
  unint64_t v5 = 0;
  v16 = 0;
  if (([v3 containsString:@"://"] & 1) == 0)
  {
LABEL_6:
    if ([v3 length] <= v5)
    {
      v15 = SO_LOG_SOKerberosServer();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[SOKerberosServer serverWithString:].cold.4(v15);
      }
      v16 = 0;
      goto LABEL_38;
    }
    v50 = v4;
    v6 = [v3 substringFromIndex:v5];
    id v7 = objc_alloc(MEMORY[0x263F08BA0]);
    v8 = [@"host://" stringByAppendingString:v6];
    v9 = (void *)[v7 initWithString:v8];

    v10 = [v9 host];
    if ([v10 hasPrefix:@"["])
    {
      v11 = [v9 host];
      int v12 = [v11 hasSuffix:@"]"];

      if (v12)
      {
        v13 = [v9 host];
        v14 = [v9 host];
        v15 = objc_msgSend(v13, "substringWithRange:", 1, objc_msgSend(v14, "length") - 2);

        goto LABEL_17;
      }
    }
    else
    {
    }
    v15 = [v9 host];
LABEL_17:
    v17 = [v9 port];
    v18 = [v17 stringValue];

    v19 = [v9 path];
    if ([v19 isEqualToString:&stru_26D3372C0])
    {
      v20 = 0;
    }
    else
    {
      v20 = [v9 path];
    }

    v21 = [MEMORY[0x263F08708] URLHostAllowedCharacterSet];
    v22 = [v21 invertedSet];
    uint64_t v23 = [v15 rangeOfCharacterFromSet:v22];

    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v18
        && ([MEMORY[0x263F08708] decimalDigitCharacterSet],
            v24 = objc_claimAutoreleasedReturnValue(),
            [v24 invertedSet],
            v25 = objc_claimAutoreleasedReturnValue(),
            uint64_t v26 = [v18 rangeOfCharacterFromSet:v25],
            v25,
            v24,
            v26 != 0x7FFFFFFFFFFFFFFFLL))
      {
        v30 = SO_LOG_SOKerberosServer();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          +[SOKerberosServer serverWithString:]((uint64_t)v18, v30, v37, v38, v39, v40, v41, v42);
        }
      }
      else
      {
        if (!v20
          || ([MEMORY[0x263F08708] URLPathAllowedCharacterSet],
              v27 = objc_claimAutoreleasedReturnValue(),
              [v27 invertedSet],
              v28 = objc_claimAutoreleasedReturnValue(),
              uint64_t v29 = [v20 rangeOfCharacterFromSet:v28],
              v28,
              v27,
              v29 == 0x7FFFFFFFFFFFFFFFLL))
        {
          v16 = [[SOKerberosServer alloc] initWithHost:v15 port:v18 protocol:v50 path:v20];
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
        v30 = SO_LOG_SOKerberosServer();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          +[SOKerberosServer serverWithString:]((uint64_t)v20, v30, v43, v44, v45, v46, v47, v48);
        }
      }
    }
    else
    {
      v30 = SO_LOG_SOKerberosServer();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        +[SOKerberosServer serverWithString:]((uint64_t)v15, v30, v31, v32, v33, v34, v35, v36);
      }
    }

    v16 = 0;
    goto LABEL_37;
  }
LABEL_39:

  return v16;
}

- (SOKerberosServer)initWithHost:(id)a3 port:(id)a4 protocol:(id)a5 path:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SOKerberosServer;
  v15 = [(SOKerberosServer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_host, a3);
    objc_storeStrong((id *)&v16->_port, a4);
    objc_storeStrong((id *)&v16->_protocol, a5);
    objc_storeStrong((id *)&v16->_path, a6);
  }

  return v16;
}

- (NSString)host
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)protocol
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

+ (void)serverWithString:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)serverWithString:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)serverWithString:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)serverWithString:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_221304000, log, OS_LOG_TYPE_ERROR, "invalid input length", v1, 2u);
}

@end