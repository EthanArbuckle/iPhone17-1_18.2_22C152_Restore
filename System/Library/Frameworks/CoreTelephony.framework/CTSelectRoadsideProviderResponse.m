@interface CTSelectRoadsideProviderResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)conversationResumed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTSelectRoadsideProviderResponse:(id)a3;
- (BOOL)success;
- (CTSelectRoadsideProviderResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationResumed:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation CTSelectRoadsideProviderResponse

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  if ([(CTSelectRoadsideProviderResponse *)self success]) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  [v3 appendFormat:@", success=%s", v4];
  if ([(CTSelectRoadsideProviderResponse *)self conversationResumed]) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  [v3 appendFormat:@", conversationResumed=%s", v5];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTSelectRoadsideProviderResponse:(id)a3
{
  id v4 = a3;
  int v5 = [(CTSelectRoadsideProviderResponse *)self success];
  if (v5 == [v4 success])
  {
    BOOL v7 = [(CTSelectRoadsideProviderResponse *)self conversationResumed];
    int v6 = v7 ^ [v4 conversationResumed] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTSelectRoadsideProviderResponse *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTSelectRoadsideProviderResponse *)self isEqualToCTSelectRoadsideProviderResponse:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSuccess:", -[CTSelectRoadsideProviderResponse success](self, "success"));
  objc_msgSend(v4, "setConversationResumed:", -[CTSelectRoadsideProviderResponse conversationResumed](self, "conversationResumed"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTSelectRoadsideProviderResponse success](self, "success"), @"success");
  objc_msgSend(v4, "encodeBool:forKey:", -[CTSelectRoadsideProviderResponse conversationResumed](self, "conversationResumed"), @"conversationResumed");
}

- (CTSelectRoadsideProviderResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSelectRoadsideProviderResponse;
  BOOL v5 = [(CTSelectRoadsideProviderResponse *)&v7 init];
  if (v5)
  {
    v5->_success = [v4 decodeBoolForKey:@"success"];
    v5->_conversationResumed = [v4 decodeBoolForKey:@"conversationResumed"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)conversationResumed
{
  return self->_conversationResumed;
}

- (void)setConversationResumed:(BOOL)a3
{
  self->_conversationResumed = a3;
}

@end