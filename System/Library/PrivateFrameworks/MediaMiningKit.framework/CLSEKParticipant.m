@interface CLSEKParticipant
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (CLSEKParticipant)initWithCoder:(id)a3;
- (CLSEKParticipant)initWithEKParticipant:(id)a3;
- (NSString)emailAddress;
- (NSString)name;
- (NSURL)URL;
- (int64_t)participantStatus;
- (int64_t)participantType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSEKParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)participantType
{
  return self->_participantType;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSEKParticipant *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(CLSEKParticipant *)self hash];
      BOOL v6 = v5 == [(CLSEKParticipant *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_URL hash];
}

- (void)encodeWithCoder:(id)a3
{
  URL = self->_URL;
  id v5 = a3;
  [v5 encodeObject:URL forKey:@"URL"];
  [v5 encodeInteger:self->_participantStatus forKey:@"participantStatus"];
  [v5 encodeObject:self->_emailAddress forKey:@"emailAddress"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeBool:self->_isCurrentUser forKey:@"isCurrentUser"];
  [v5 encodeInteger:self->_participantType forKey:@"participantType"];
}

- (CLSEKParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSEKParticipant;
  id v5 = [(CLSEKParticipant *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v5->_participantStatus = [v4 decodeIntegerForKey:@"participantStatus"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v5->_isCurrentUser = [v4 decodeBoolForKey:@"isCurrentUser"];
    v5->_participantType = [v4 decodeIntegerForKey:@"participantType"];
  }

  return v5;
}

- (CLSEKParticipant)initWithEKParticipant:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)CLSEKParticipant;
    id v5 = [(CLSEKParticipant *)&v14 init];
    if (v5)
    {
      uint64_t v6 = [v4 URL];
      URL = v5->_URL;
      v5->_URL = (NSURL *)v6;

      v5->_participantStatus = [v4 participantStatus];
      uint64_t v8 = [v4 emailAddress];
      emailAddress = v5->_emailAddress;
      v5->_emailAddress = (NSString *)v8;

      uint64_t v10 = [v4 name];
      name = v5->_name;
      v5->_name = (NSString *)v10;

      v5->_isCurrentUser = [v4 isCurrentUser];
      v5->_participantType = [v4 participantType];
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end