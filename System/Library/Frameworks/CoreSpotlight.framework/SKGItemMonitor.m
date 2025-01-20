@interface SKGItemMonitor
- (BOOL)haveSeenItem:(id)a3 bundle:(id)a4 persona:(id)a5 protectionClass:(id)a6;
- (SKGItemMonitor)initWithResourceDirectoryPath:(id)a3;
- (int64_t)domainCount;
- (int64_t)personaCountOfDomain:(id)a3;
- (void)addSeenItem:(id)a3 bundle:(id)a4 persona:(id)a5 protectionClass:(id)a6;
- (void)clear;
- (void)flush;
- (void)load;
@end

@implementation SKGItemMonitor

- (SKGItemMonitor)initWithResourceDirectoryPath:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKGItemMonitor;
  v5 = [(SKGItemMonitor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@/oids", v4];
    resourcePath = v5->_resourcePath;
    v5->_resourcePath = (NSString *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    domains = v5->_domains;
    v5->_domains = v8;

    [(SKGItemMonitor *)v5 load];
  }

  return v5;
}

- (void)load
{
  v2 = +[NSURL URLWithString:self->_resourcePath];
  v3 = +[NSFileManager defaultManager];
  id v4 = [v2 path];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    uint64_t v6 = +[NSFileManager defaultManager];
    NSURLResourceKey v7 = NSURLNameKey;
    NSURLResourceKey v46 = NSURLNameKey;
    v8 = +[NSArray arrayWithObjects:&v46 count:1];
    v33 = v2;
    v9 = [v6 enumeratorAtURL:v2 includingPropertiesForKeys:v8 options:4 errorHandler:&stru_1000DAAF0];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    objc_super v11 = self;
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v42;
      uint64_t v34 = *(void *)v42;
      do
      {
        v14 = 0;
        id v35 = v12;
        do
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
          id v40 = 0;
          [v15 getResourceValue:&v40 forKey:v7 error:0];
          id v16 = v40;
          v17 = [v16 componentsSeparatedByString:@"."];
          if ([v17 count] == (id)3)
          {
            id v18 = [v15 path];
            int v19 = open((const char *)[v18 UTF8String], 256);

            off_t v39 = 0;
            if (v19 < 0 || (v20 = sub_100095DFC(kCFAllocatorDefault, v19, &v39)) == 0) {
              v20 = (const void *)sub_100095C9C(kCFAllocatorDefault);
            }
            v21 = [v17 objectAtIndexedSubscript:0];
            v22 = [v17 objectAtIndexedSubscript:1];
            v38 = [v17 objectAtIndexedSubscript:2];
            v23 = [(NSMutableDictionary *)v11->_domains objectForKeyedSubscript:v21];

            if (!v23)
            {
              domains = v11->_domains;
              v25 = +[NSMutableDictionary dictionary];
              [(NSMutableDictionary *)domains setObject:v25 forKey:v21];

              objc_super v11 = self;
            }
            v26 = [(NSMutableDictionary *)v11->_domains objectForKeyedSubscript:v21];
            [v26 objectForKeyedSubscript:v22];
            v28 = v27 = v11;

            if (!v28)
            {
              v29 = [(NSMutableDictionary *)v27->_domains objectForKeyedSubscript:v21];
              v30 = +[NSMutableDictionary dictionary];
              [v29 setObject:v30 forKey:v22];
            }
            v31 = [(NSMutableDictionary *)v27->_domains objectForKeyedSubscript:v21];
            v32 = [v31 objectForKeyedSubscript:v22];
            [v32 setObject:v20 forKey:v38];

            CFRelease(v20);
            if ((v19 & 0x80000000) == 0) {
              close(v19);
            }

            objc_super v11 = self;
            uint64_t v13 = v34;
            NSURLResourceKey v7 = NSURLNameKey;
            id v12 = v35;
          }

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v12);
    }

    v2 = v33;
  }
}

- (void)flush
{
  v2 = self->_resourcePath;
  v3 = +[NSFileManager defaultManager];
  v32 = v2;
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  if ((v4 & 1) != 0
    || (+[NSFileManager defaultManager],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        id v48 = 0,
        [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v48], uint64_t v6 = (NSMutableDictionary *)v48, v5, (obj = v6) == 0))
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = self->_domains;
    id v25 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v45;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v7;
          uint64_t v8 = *(void *)(*((void *)&v44 + 1) + 8 * v7);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v27 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v8];
          id v29 = [v27 countByEnumeratingWithState:&v40 objects:v50 count:16];
          if (v29)
          {
            uint64_t v28 = *(void *)v41;
            do
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v41 != v28) {
                  objc_enumerationMutation(v27);
                }
                uint64_t v30 = v9;
                uint64_t v10 = *(void *)(*((void *)&v40 + 1) + 8 * v9);
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                objc_super v11 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v8];
                id v12 = [v11 objectForKeyedSubscript:v10];

                id v31 = v12;
                id v13 = [v12 countByEnumeratingWithState:&v36 objects:v49 count:16];
                if (v13)
                {
                  id v14 = v13;
                  uint64_t v33 = *(void *)v37;
                  do
                  {
                    for (i = 0; i != v14; i = (char *)i + 1)
                    {
                      if (*(void *)v37 != v33) {
                        objc_enumerationMutation(v31);
                      }
                      uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                      v17 = +[NSString stringWithFormat:@"%@/%@.%@.%@", v32, v8, v10, v16];
                      id v18 = +[NSString stringWithFormat:@"/tmp/%@.%@.%@", v8, v10, v16];
                      int v19 = open((const char *)[v18 UTF8String], 1793, 384);
                      off_t v35 = 0;
                      v20 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v8];
                      v21 = [v20 objectForKeyedSubscript:v10];
                      v22 = [v21 objectForKeyedSubscript:v16];

                      if (v22)
                      {
                        sub_100095D10((uint64_t)v22, v19, 0, &v35);
                        renameat(v19, 0, -1, (const char *)[v17 UTF8String]);
                      }
                      if ((v19 & 0x80000000) == 0) {
                        close(v19);
                      }
                    }
                    id v14 = [v31 countByEnumeratingWithState:&v36 objects:v49 count:16];
                  }
                  while (v14);
                }

                uint64_t v9 = v30 + 1;
              }
              while ((id)(v30 + 1) != v29);
              id v29 = [v27 countByEnumeratingWithState:&v40 objects:v50 count:16];
            }
            while (v29);
          }

          uint64_t v7 = v26 + 1;
        }
        while ((id)(v26 + 1) != v25);
        id v25 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v25);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000A0CE0();
  }
}

- (void)clear
{
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  domains = self->_domains;
  self->_domains = v3;

  unsigned int v5 = self->_resourcePath;
  uint64_t v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    uint64_t v8 = +[NSFileManager defaultManager];
    uint64_t v9 = 0;
    [v8 removeItemAtPath:v5 error:&v9];
  }
}

- (BOOL)haveSeenItem:(id)a3 bundle:(id)a4 persona:(id)a5 protectionClass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v11];

  if (!v14) {
    goto LABEL_6;
  }
  v15 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v11];
  uint64_t v16 = [v15 objectForKeyedSubscript:v12];

  if (!v16) {
    goto LABEL_6;
  }
  v17 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v11];
  id v18 = [v17 objectForKeyedSubscript:v12];
  int v19 = [v18 objectForKeyedSubscript:v13];

  if (v19)
  {
    id v20 = [v10 longLongValue];
    v21 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v11];
    v22 = [v21 objectForKeyedSubscript:v12];
    v23 = [v22 objectForKeyedSubscript:v13];

    if (v23) {
      LOBYTE(v23) = RLEOIDArrayContainsOid((uint64_t)v23, (unint64_t)v20) != 0;
    }
  }
  else
  {
LABEL_6:
    LOBYTE(v23) = 0;
  }

  return (char)v23;
}

- (void)addSeenItem:(id)a3 bundle:(id)a4 persona:(id)a5 protectionClass:(id)a6
{
  id v28 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v10];

  if (!v13)
  {
    domains = self->_domains;
    v15 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)domains setObject:v15 forKey:v10];
  }
  uint64_t v16 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v10];
  v17 = [v16 objectForKeyedSubscript:v11];

  if (!v17)
  {
    id v18 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v10];
    int v19 = +[NSMutableDictionary dictionary];
    [v18 setObject:v19 forKey:v11];
  }
  id v20 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v10];
  v21 = [v20 objectForKeyedSubscript:v11];
  v22 = [v21 objectForKeyedSubscript:v12];

  if (!v22)
  {
    v23 = (const void *)sub_100095C9C(kCFAllocatorDefault);
    uint64_t v24 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v10];
    id v25 = [v24 objectForKeyedSubscript:v11];
    [v25 setObject:v23 forKey:v12];

    CFRelease(v23);
    uint64_t v26 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v10];
    id v27 = [v26 objectForKeyedSubscript:v11];
    v22 = [v27 objectForKeyedSubscript:v12];
  }
  RLEOIDArrayAddOid((uint64_t)v22, (unint64_t)[v28 longLongValue]);
}

- (int64_t)domainCount
{
  if (![(NSMutableDictionary *)self->_domains count]) {
    return -1;
  }
  domains = self->_domains;

  return (int64_t)[(NSMutableDictionary *)domains count];
}

- (int64_t)personaCountOfDomain:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v4];
  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_domains objectForKeyedSubscript:v4];
    int64_t v7 = (int64_t)[v6 count];
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);

  objc_storeStrong((id *)&self->_resourcePath, 0);
}

@end