@interface EMMessageRepositoryRemoteContentURLInfo
+ (BOOL)supportsSecureCoding;
- (EMMessageRepositoryRemoteContentURLInfo)initWithCoder:(id)a3;
- (EMMessageRepositoryRemoteContentURLInfo)initWithURL:(id)a3 requestCount:(unint64_t)a4 lastSeen:(id)a5 lastRequested:(id)a6;
- (NSDate)lastRequested;
- (NSDate)lastSeen;
- (NSURL)url;
- (unint64_t)requestCount;
- (void)_commonInitWithURL:(id)a3 requestCount:(unint64_t)a4 lastSeen:(id)a5 lastRequested:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageRepositoryRemoteContentURLInfo

- (EMMessageRepositoryRemoteContentURLInfo)initWithURL:(id)a3 requestCount:(unint64_t)a4 lastSeen:(id)a5 lastRequested:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EMMessageRepositoryRemoteContentURLInfo;
  v13 = [(EMMessageRepositoryRemoteContentURLInfo *)&v16 init];
  v14 = v13;
  if (v13) {
    [(EMMessageRepositoryRemoteContentURLInfo *)v13 _commonInitWithURL:v10 requestCount:a4 lastSeen:v11 lastRequested:v12];
  }

  return v14;
}

- (void)_commonInitWithURL:(id)a3 requestCount:(unint64_t)a4 lastSeen:(id)a5 lastRequested:(id)a6
{
  id v10 = (NSURL *)a3;
  id v11 = (NSDate *)a5;
  id v12 = (NSDate *)a6;
  url = self->_url;
  self->_url = v10;
  v17 = v10;

  lastSeen = self->_lastSeen;
  self->_requestCount = a4;
  self->_lastSeen = v11;
  v15 = v11;

  lastRequested = self->_lastRequested;
  self->_lastRequested = v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageRepositoryRemoteContentURLInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageRepositoryRemoteContentURLInfo;
  v5 = [(EMMessageRepositoryRemoteContentURLInfo *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_url"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"EFPropertyKey_requestCount"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_lastSeen"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_lastRequested"];
    [(EMMessageRepositoryRemoteContentURLInfo *)v5 _commonInitWithURL:v6 requestCount:v7 lastSeen:v8 lastRequested:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(EMMessageRepositoryRemoteContentURLInfo *)self url];
  [v7 encodeObject:v4 forKey:@"EFPropertyKey_url"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[EMMessageRepositoryRemoteContentURLInfo requestCount](self, "requestCount"), @"EFPropertyKey_requestCount");
  v5 = [(EMMessageRepositoryRemoteContentURLInfo *)self lastSeen];
  [v7 encodeObject:v5 forKey:@"EFPropertyKey_lastSeen"];

  v6 = [(EMMessageRepositoryRemoteContentURLInfo *)self lastRequested];
  [v7 encodeObject:v6 forKey:@"EFPropertyKey_lastRequested"];
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (NSDate)lastSeen
{
  return self->_lastSeen;
}

- (NSDate)lastRequested
{
  return self->_lastRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequested, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end