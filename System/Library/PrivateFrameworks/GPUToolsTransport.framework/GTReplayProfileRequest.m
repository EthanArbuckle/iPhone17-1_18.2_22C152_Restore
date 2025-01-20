@interface GTReplayProfileRequest
+ (BOOL)supportsSecureCoding;
- (GTReplayProfileRequest)initWithCoder:(id)a3;
- (NSData)profileData;
- (id)streamHandler;
- (int)profileDataVersion;
- (unsigned)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setProfileData:(id)a3;
- (void)setProfileDataVersion:(int)a3;
- (void)setStreamHandler:(id)a3;
@end

@implementation GTReplayProfileRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayProfileRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayProfileRequest;
  v5 = [(GTReplayRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileData"];
    profileData = v5->_profileData;
    v5->_profileData = (NSData *)v6;

    v5->_profileDataVersion = [v4 decodeInt32ForKey:@"profileDataVersion"];
    v5->_priority = [v4 decodeInt32ForKey:@"priority"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayProfileRequest;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_profileData, @"profileData", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_profileDataVersion forKey:@"profileDataVersion"];
  [v4 encodeInt32:self->_priority forKey:@"priority"];
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setStreamHandler:(id)a3
{
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (int)profileDataVersion
{
  return self->_profileDataVersion;
}

- (void)setProfileDataVersion:(int)a3
{
  self->_profileDataVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong(&self->_streamHandler, 0);
}

@end