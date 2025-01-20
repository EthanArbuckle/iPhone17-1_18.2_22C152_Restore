@interface AARemoteServerConfigurationCache
+ (id)cacheWithConfiguration:(id)a3 response:(id)a4;
- (AARemoteServerConfigurationCache)init;
- (AARemoteServerConfigurationCache)initWithConfiguration:(id)a3 response:(id)a4;
- (AAURLConfiguration)configuration;
- (NSDate)creationDate;
- (NSHTTPURLResponse)response;
@end

@implementation AARemoteServerConfigurationCache

+ (id)cacheWithConfiguration:(id)a3 response:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v7 response:v6];

  return v8;
}

- (AARemoteServerConfigurationCache)init
{
  return 0;
}

- (AARemoteServerConfigurationCache)initWithConfiguration:(id)a3 response:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AARemoteServerConfigurationCache.m", 32, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"AARemoteServerConfigurationCache.m", 33, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)AARemoteServerConfigurationCache;
  v11 = [(AARemoteServerConfigurationCache *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v12;

    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_storeStrong((id *)&v11->_response, a4);
  }

  return v11;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (AAURLConfiguration)configuration
{
  return self->_configuration;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end