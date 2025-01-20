@interface CTCAConversationState
+ (BOOL)supportsSecureCoding;
- (BOOL)committed;
- (CTCAConversationState)initWithCoder:(id)a3;
- (NSNumber)conversationId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)fromService;
- (int64_t)requestReason;
- (void)encodeWithCoder:(id)a3;
- (void)setCommitted:(BOOL)a3;
- (void)setConversationId:(id)a3;
- (void)setFromService:(int64_t)a3;
- (void)setRequestReason:(int64_t)a3;
@end

@implementation CTCAConversationState

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  unint64_t v4 = [(CTCAConversationState *)self requestReason];
  if (v4 > 5) {
    v5 = "???";
  }
  else {
    v5 = off_1E5266BE0[v4];
  }
  [v3 appendFormat:@", requestReason=%s", v5];
  v6 = [(CTCAConversationState *)self conversationId];
  [v3 appendFormat:@", conversationId=%@", v6];

  BOOL v7 = [(CTCAConversationState *)self committed];
  v8 = "no";
  if (v7) {
    v8 = "yes";
  }
  [v3 appendFormat:@", committed=%s", v8];
  [v3 appendFormat:@", fromService=%ld", -[CTCAConversationState fromService](self, "fromService")];
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setRequestReason:", -[CTCAConversationState requestReason](self, "requestReason"));
  v6 = [(CTCAConversationState *)self conversationId];
  BOOL v7 = (void *)[v6 copyWithZone:a3];
  [v5 setConversationId:v7];

  objc_msgSend(v5, "setCommitted:", -[CTCAConversationState committed](self, "committed"));
  objc_msgSend(v5, "setFromService:", -[CTCAConversationState fromService](self, "fromService"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTCAConversationState requestReason](self, "requestReason"), @"requestReason");
  unint64_t v4 = [(CTCAConversationState *)self conversationId];
  [v5 encodeObject:v4 forKey:@"conversationId"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CTCAConversationState committed](self, "committed"), @"committed");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTCAConversationState fromService](self, "fromService"), @"fromService");
}

- (CTCAConversationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTCAConversationState;
  id v5 = [(CTCAConversationState *)&v9 init];
  if (v5)
  {
    v5->_requestReason = [v4 decodeIntegerForKey:@"requestReason"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationId"];
    conversationId = v5->_conversationId;
    v5->_conversationId = (NSNumber *)v6;

    v5->_committed = [v4 decodeBoolForKey:@"committed"];
    v5->_fromService = [v4 decodeIntegerForKey:@"fromService"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
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
}

@end