@interface ENDownloadEndpointState
+ (BOOL)supportsSecureCoding;
- (ENDownloadEndpoint)endpoint;
- (ENDownloadEndpointState)initWithCoder:(id)a3;
- (ENDownloadEndpointState)initWithEndpoint:(id)a3;
- (NSDate)lastFetchAttemptDate;
- (NSDate)lastSuccessfulFetchDate;
- (NSString)lastDownloadedFilePath;
- (NSString)shortIdentifier;
- (NSUUID)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setLastDownloadedFilePath:(id)a3;
- (void)setLastFetchAttemptDate:(id)a3;
- (void)setLastSuccessfulFetchDate:(id)a3;
@end

@implementation ENDownloadEndpointState

- (ENDownloadEndpointState)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ENDownloadEndpointState;
  v6 = [(ENDownloadEndpointState *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    uint64_t v8 = [MEMORY[0x1E4F29120] UUID];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = [(NSUUID *)v7->_identifier UUIDString];
    uint64_t v11 = [v10 substringToIndex:8];
    shortIdentifier = v7->_shortIdentifier;
    v7->_shortIdentifier = (NSString *)v11;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  endpoint = self->_endpoint;
  id v10 = a3;
  id v5 = [(ENDownloadEndpoint *)endpoint serverBaseURL];
  v6 = [v5 absoluteString];
  [v10 encodeObject:v6 forKey:@"url"];

  v7 = [(ENDownloadEndpoint *)self->_endpoint serverIndexURL];
  uint64_t v8 = [v7 absoluteString];
  [v10 encodeObject:v8 forKey:@"indexURL"];

  [(ENDownloadEndpoint *)self->_endpoint downloadInterval];
  objc_msgSend(v10, "encodeDouble:forKey:", @"interval");
  objc_msgSend(v10, "encodeBool:forKey:", -[ENDownloadEndpoint enabled](self->_endpoint, "enabled"), @"enable");
  v9 = [(ENDownloadEndpoint *)self->_endpoint region];
  [v10 encodeObject:v9 forKey:@"region"];

  [v10 encodeObject:self->_identifier forKey:@"id"];
  [v10 encodeObject:self->_lastFetchAttemptDate forKey:@"lastAttempt"];
  [v10 encodeObject:self->_lastSuccessfulFetchDate forKey:@"lastSuccess"];
  [v10 encodeObject:self->_lastDownloadedFilePath forKey:@"lastFile"];
}

- (ENDownloadEndpointState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [MEMORY[0x1E4F1CB08] URLWithString:v5];
  if (v6)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"indexURL"];
    uint64_t v8 = [MEMORY[0x1E4F1CB08] URLWithString:v7];
    if (!v8)
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionPath"];
      if (!v9)
      {
        v25 = 0;
LABEL_12:

        goto LABEL_13;
      }
      id v10 = (void *)v9;
      uint64_t v11 = [v6 URLByAppendingPathComponent:v9];
      uint64_t v8 = [v11 URLByAppendingPathComponent:@"index.txt"];
    }
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    if (v12)
    {
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
      [v4 decodeDoubleForKey:@"interval"];
      v15 = -[ENDownloadEndpoint initWithBaseURL:indexURL:interval:enabled:region:]([ENDownloadEndpoint alloc], "initWithBaseURL:indexURL:interval:enabled:region:", v6, v8, [v4 decodeBoolForKey:@"enable"], v13, v14);
      v16 = [(ENDownloadEndpointState *)self initWithEndpoint:v15];
      if (v16)
      {
        uint64_t v17 = [v12 copy];
        identifier = v16->_identifier;
        v16->_identifier = (NSUUID *)v17;

        uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastAttempt"];
        lastFetchAttemptDate = v16->_lastFetchAttemptDate;
        v16->_lastFetchAttemptDate = (NSDate *)v19;

        uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSuccess"];
        lastSuccessfulFetchDate = v16->_lastSuccessfulFetchDate;
        v16->_lastSuccessfulFetchDate = (NSDate *)v21;

        uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFile"];
        lastDownloadedFilePath = v16->_lastDownloadedFilePath;
        v16->_lastDownloadedFilePath = (NSString *)v23;
      }
      self = v16;

      v25 = self;
    }
    else
    {
      v25 = 0;
    }

    goto LABEL_12;
  }
  v25 = 0;
LABEL_13:

  return v25;
}

- (ENDownloadEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)lastFetchAttemptDate
{
  return self->_lastFetchAttemptDate;
}

- (void)setLastFetchAttemptDate:(id)a3
{
}

- (NSDate)lastSuccessfulFetchDate
{
  return self->_lastSuccessfulFetchDate;
}

- (void)setLastSuccessfulFetchDate:(id)a3
{
}

- (NSString)lastDownloadedFilePath
{
  return self->_lastDownloadedFilePath;
}

- (void)setLastDownloadedFilePath:(id)a3
{
}

- (NSString)shortIdentifier
{
  return self->_shortIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortIdentifier, 0);
  objc_storeStrong((id *)&self->_lastDownloadedFilePath, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulFetchDate, 0);
  objc_storeStrong((id *)&self->_lastFetchAttemptDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end