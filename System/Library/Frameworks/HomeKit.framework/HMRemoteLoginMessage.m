@interface HMRemoteLoginMessage
+ (BOOL)supportsSecureCoding;
- (HMRemoteLoginMessage)initWithCoder:(id)a3;
- (HMRemoteLoginMessage)initWithSessionID:(id)a3;
- (NSError)error;
- (NSString)sessionID;
- (id)description;
- (id)initNewMessage;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation HMRemoteLoginMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (HMRemoteLoginMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMRemoteLoginMessage;
  v5 = [(HMRemoteLoginMessage *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMRemoteLoginMessage *)self sessionID];
  [v4 encodeObject:v5 forKey:@"sessionID"];

  id v6 = [(HMRemoteLoginMessage *)self error];
  [v4 encodeObject:v6 forKey:@"error"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMRemoteLoginMessage *)self sessionID];
  v5 = [(HMRemoteLoginMessage *)self error];
  id v6 = [v3 stringWithFormat:@"Session: %@, Error: %@", v4, v5];

  return v6;
}

- (HMRemoteLoginMessage)initWithSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMRemoteLoginMessage;
  id v6 = [(HMRemoteLoginMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionID, a3);
  }

  return v7;
}

- (id)initNewMessage
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  id v5 = [(HMRemoteLoginMessage *)self initWithSessionID:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end