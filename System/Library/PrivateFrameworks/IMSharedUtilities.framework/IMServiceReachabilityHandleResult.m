@interface IMServiceReachabilityHandleResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (IMServiceReachabilityHandleResult)initWithCoder:(id)a3;
- (IMServiceReachabilityHandleResult)initWithHandleID:(id)a3 service:(id)a4 isReachable:(BOOL)a5;
- (NSString)handleID;
- (NSString)service;
- (id)createDictionary;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHandleID:(id)a3;
- (void)setReachable:(BOOL)a3;
- (void)setService:(id)a3;
@end

@implementation IMServiceReachabilityHandleResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMServiceReachabilityHandleResult)initWithHandleID:(id)a3 service:(id)a4 isReachable:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMServiceReachabilityHandleResult;
  v11 = [(IMServiceReachabilityHandleResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_handleID, a3);
    objc_storeStrong((id *)&v12->_service, a4);
    v12->_reachable = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  handleID = self->_handleID;
  id v5 = a3;
  [v5 encodeObject:handleID forKey:@"i"];
  [v5 encodeObject:self->_service forKey:@"s"];
  [v5 encodeBool:self->_reachable forKey:@"r"];
}

- (IMServiceReachabilityHandleResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMServiceReachabilityHandleResult;
  id v5 = [(IMServiceReachabilityHandleResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    handleID = v5->_handleID;
    v5->_handleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    service = v5->_service;
    v5->_service = (NSString *)v8;

    v5->_reachable = [v4 decodeBoolForKey:@"r"];
  }

  return v5;
}

- (id)createDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"r";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[IMServiceReachabilityHandleResult isReachable](self, "isReachable"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 isReachable];
    if (v6 == [(IMServiceReachabilityHandleResult *)self isReachable])
    {
      uint64_t v8 = [v5 service];
      id v9 = [(IMServiceReachabilityHandleResult *)self service];
      if ([v8 isEqualToString:v9])
      {
        id v10 = [v5 handleID];
        objc_super v11 = [(IMServiceReachabilityHandleResult *)self handleID];
        char v7 = [v10 isEqualToString:v11];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(IMServiceReachabilityHandleResult *)self handleID];
  int v6 = [(IMServiceReachabilityHandleResult *)self service];
  BOOL v7 = [(IMServiceReachabilityHandleResult *)self isReachable];
  uint64_t v8 = @"NO";
  if (v7) {
    uint64_t v8 = @"YES";
  }
  id v9 = [v3 stringWithFormat:@"<%@ %p [ID: %@ service: %@ isReachable: %@]>", v4, self, v5, v6, v8];

  return v9;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void)setHandleID:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_handleID, 0);
}

@end