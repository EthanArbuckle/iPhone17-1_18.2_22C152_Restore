@interface CRKFetchLogEventsRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchLogEventsRequest)initWithCoder:(id)a3;
- (NSDate)cursorDate;
- (NSString)sessionToken;
- (void)encodeWithCoder:(id)a3;
- (void)setCursorDate:(id)a3;
- (void)setSessionToken:(id)a3;
@end

@implementation CRKFetchLogEventsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchLogEventsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchLogEventsRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"cursorDate"];
    cursorDate = v5->_cursorDate;
    v5->_cursorDate = (NSDate *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sessionToken"];
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchLogEventsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchLogEventsRequest *)self cursorDate];
  [v4 encodeObject:v5 forKey:@"cursorDate"];

  v6 = [(CRKFetchLogEventsRequest *)self sessionToken];
  [v4 encodeObject:v6 forKey:@"sessionToken"];
}

- (NSDate)cursorDate
{
  return self->_cursorDate;
}

- (void)setCursorDate:(id)a3
{
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToken, 0);

  objc_storeStrong((id *)&self->_cursorDate, 0);
}

@end