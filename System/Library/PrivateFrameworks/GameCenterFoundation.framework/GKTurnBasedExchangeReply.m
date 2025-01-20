@interface GKTurnBasedExchangeReply
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKTurnBasedExchangeReply)initWithDaemonProxy:(id)a3;
- (GKTurnBasedExchangeReply)initWithInternalRepresentation:(id)a3 daemonProxy:(id)a4;
- (GKTurnBasedExchangeReplyInternal)internal;
- (GKTurnBasedMatch)match;
- (GKTurnBasedParticipant)recipient;
- (NSString)message;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)setInternal:(id)a3;
- (void)setMatch:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKTurnBasedExchangeReply

- (GKTurnBasedExchangeReply)initWithInternalRepresentation:(id)a3 daemonProxy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[GKInternalRepresentation internalRepresentation];
  }
  v11.receiver = self;
  v11.super_class = (Class)GKTurnBasedExchangeReply;
  v8 = [(GKTurnBasedExchangeReply *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_internal, v6);
    objc_storeStrong((id *)&v9->_daemonProxy, a4);
  }

  return v9;
}

- (GKTurnBasedExchangeReply)initWithDaemonProxy:(id)a3
{
  return [(GKTurnBasedExchangeReply *)self initWithInternalRepresentation:0 daemonProxy:a3];
}

- (NSString)message
{
  daemonProxy = self->_daemonProxy;
  v4 = [(GKTurnBasedExchangeReplyInternal *)self->_internal localizableMessage];
  v5 = [(GKTurnBasedExchangeReply *)self match];
  id v6 = [v5 bundleID];
  id v7 = [(GKDaemonProxy *)daemonProxy localizedMessageFromDictionary:v4 forBundleID:v6];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v2 = [(GKTurnBasedExchangeReply *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GKTurnBasedExchangeReply *)self internal];
    id v6 = [v4 internal];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(GKTurnBasedExchangeReply *)self recipient];
  char v7 = [v6 internal];
  v8 = [v7 playerID];
  v9 = v8;
  if (!v8)
  {
    v9 = [(GKTurnBasedExchangeReply *)self recipient];
  }
  v10 = [(GKTurnBasedExchangeReply *)self message];
  objc_super v11 = [(GKTurnBasedExchangeReply *)self data];
  v12 = [v3 stringWithFormat:@"<%@ %p - recipient:%@ message:%@ data.length:%ld>", v5, self, v9, v10, objc_msgSend(v11, "length")];

  if (!v8) {

  }
  return v12;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedExchangeReply;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  char v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedExchangeReply;
  v5 = -[GKTurnBasedExchangeReply methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(GKTurnBasedExchangeReply *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedExchangeReply;
  if (-[GKTurnBasedExchangeReply respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKTurnBasedExchangeReply *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      int v4 = GKApplicationLinkedOnOrAfter(393216, 657920);
      if (v4)
      {
        LOBYTE(v4) = +[GKTurnBasedExchangeReplyInternal instancesRespondToSelector:a3];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  char v5 = [(GKTurnBasedExchangeReply *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKTurnBasedExchangeReply *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKTurnBasedParticipant)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (GKTurnBasedExchangeReplyInternal)internal
{
  return (GKTurnBasedExchangeReplyInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternal:(id)a3
{
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_recipient, 0);

  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

@end