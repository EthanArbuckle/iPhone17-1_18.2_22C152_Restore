@interface CTCARoadsideConversationState
+ (BOOL)supportsSecureCoding;
- (BOOL)committed;
- (CTCARoadsideConversationState)initWithCoder:(id)a3;
- (NSNumber)conversationId;
- (NSNumber)providerId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)fromService;
- (void)encodeWithCoder:(id)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setConversationId:(id)a3;
- (void)setFromService:(int64_t)a3;
- (void)setProviderId:(id)a3;
@end

@implementation CTCARoadsideConversationState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCARoadsideConversationState *)self conversationId];
  [v3 appendFormat:@", conversationId=%@", v4];

  BOOL v5 = [(CTCARoadsideConversationState *)self committed];
  v6 = "no";
  if (v5) {
    v6 = "yes";
  }
  [v3 appendFormat:@", committed=%s", v6];
  v7 = [(CTCARoadsideConversationState *)self providerId];
  [v3 appendFormat:@", providerId=%@", v7];

  [v3 appendFormat:@", fromService=%ld", -[CTCARoadsideConversationState fromService](self, "fromService")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTCARoadsideConversationState *)self conversationId];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setConversationId:v7];

  objc_msgSend(v5, "setCommitted:", -[CTCARoadsideConversationState committed](self, "committed"));
  v8 = [(CTCARoadsideConversationState *)self providerId];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setProviderId:v9];

  objc_msgSend(v5, "setFromService:", -[CTCARoadsideConversationState fromService](self, "fromService"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(CTCARoadsideConversationState *)self conversationId];
  [v6 encodeObject:v4 forKey:@"conversationId"];

  objc_msgSend(v6, "encodeBool:forKey:", -[CTCARoadsideConversationState committed](self, "committed"), @"committed");
  BOOL v5 = [(CTCARoadsideConversationState *)self providerId];
  [v6 encodeObject:v5 forKey:@"providerId"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[CTCARoadsideConversationState fromService](self, "fromService"), @"fromService");
}

- (CTCARoadsideConversationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCARoadsideConversationState;
  BOOL v5 = [(CTCARoadsideConversationState *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationId"];
    conversationId = v5->_conversationId;
    v5->_conversationId = (NSNumber *)v6;

    v5->_committed = [v4 decodeBoolForKey:@"committed"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerId"];
    providerId = v5->_providerId;
    v5->_providerId = (NSNumber *)v8;

    v5->_fromService = [v4 decodeIntegerForKey:@"fromService"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (BOOL)committed
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (NSNumber)providerId
{
  return self->_providerId;
}

- (void)setProviderId:(id)a3
{
}

- (int64_t)fromService
{
  return self->_fromService;
}

- (void)setFromService:(int64_t)a3
{
  self->_fromService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);

  objc_storeStrong((id *)&self->_conversationId, 0);
}

@end