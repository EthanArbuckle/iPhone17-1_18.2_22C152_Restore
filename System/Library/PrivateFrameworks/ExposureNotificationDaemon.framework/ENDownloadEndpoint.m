@interface ENDownloadEndpoint
- (BOOL)enabled;
- (ENDownloadEndpoint)initWithBaseURL:(id)a3 indexURL:(id)a4 interval:(double)a5 enabled:(BOOL)a6 region:(id)a7;
- (ENRegion)region;
- (NSURL)serverBaseURL;
- (NSURL)serverIndexURL;
- (double)downloadInterval;
- (id)serverURLForFileWithRelativePath:(id)a3;
@end

@implementation ENDownloadEndpoint

- (ENDownloadEndpoint)initWithBaseURL:(id)a3 indexURL:(id)a4 interval:(double)a5 enabled:(BOOL)a6 region:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ENDownloadEndpoint;
  v15 = [(ENDownloadEndpoint *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    serverBaseURL = v15->_serverBaseURL;
    v15->_serverBaseURL = (NSURL *)v16;

    uint64_t v18 = [v13 copy];
    serverIndexURL = v15->_serverIndexURL;
    v15->_serverIndexURL = (NSURL *)v18;

    v15->_downloadInterval = a5;
    v15->_enabled = a6;
    uint64_t v20 = [v14 copy];
    region = v15->_region;
    v15->_region = (ENRegion *)v20;
  }
  return v15;
}

- (id)serverURLForFileWithRelativePath:(id)a3
{
  return [(NSURL *)self->_serverBaseURL URLByAppendingPathComponent:a3];
}

- (double)downloadInterval
{
  return self->_downloadInterval;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSURL)serverBaseURL
{
  return self->_serverBaseURL;
}

- (NSURL)serverIndexURL
{
  return self->_serverIndexURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIndexURL, 0);
  objc_storeStrong((id *)&self->_serverBaseURL, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

@end