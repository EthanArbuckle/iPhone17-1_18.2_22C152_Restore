@interface IMDClientRequestContext
+ (IMDClientRequestContext)currentContext;
+ (void)setCurrentContext:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (IMDClientRequestContext)initWithListenerID:(id)a3 auditToken:(id *)a4 capabilities:(unint64_t)a5 replyProxy:(id)a6;
- (IMDaemonListenerProtocol)replyProxy;
- (NSString)listenerID;
- (unint64_t)capabilities;
@end

@implementation IMDClientRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyProxy, 0);

  objc_storeStrong((id *)&self->_listenerID, 0);
}

+ (IMDClientRequestContext)currentContext
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKeyedSubscript:@"com.apple.messages.IMDClientRequestContext.currentContext"];

  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"No instance IMDClientRequestContext available for current thread, -currentContext caller may not be within a client request handler", 0 reason userInfo];
    objc_exception_throw(v6);
  }

  return (IMDClientRequestContext *)v4;
}

+ (void)setCurrentContext:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F29060];
  id v4 = a3;
  id v6 = [v3 currentThread];
  v5 = [v6 threadDictionary];
  [v5 setObject:v4 forKeyedSubscript:@"com.apple.messages.IMDClientRequestContext.currentContext"];
}

- (IMDClientRequestContext)initWithListenerID:(id)a3 auditToken:(id *)a4 capabilities:(unint64_t)a5 replyProxy:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = [(IMDClientRequestContext *)self init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    listenerID = v12->_listenerID;
    v12->_listenerID = (NSString *)v13;

    v12->_capabilities = a5;
    objc_storeStrong((id *)&v12->_replyProxy, a6);
    long long v15 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v12->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v12->_auditToken.val[4] = v15;
  }

  return v12;
}

- (IMDaemonListenerProtocol)replyProxy
{
  return self->_replyProxy;
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

@end