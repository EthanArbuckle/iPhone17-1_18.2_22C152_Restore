@interface CKPendingConversationStatusRefreshContext
- (BOOL)isForPendingConversation;
- (CKPendingConversationStatusRefreshContext)init;
- (CKPendingConversationStatusRefreshContext)initWithAvailabilities:(id)a3;
- (CKRecipientAvailabilities)availabilities;
- (IMServiceReachabilityContext)customContext;
- (NSSet)preconditionsIgnoredForServices;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAvailabilities:(id)a3;
- (void)setCustomContext:(id)a3;
- (void)setIsForPendingConversation:(BOOL)a3;
- (void)setPreconditionsIgnoredForServices:(id)a3;
@end

@implementation CKPendingConversationStatusRefreshContext

- (CKPendingConversationStatusRefreshContext)initWithAvailabilities:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPendingConversationStatusRefreshContext;
  v6 = [(CKPendingConversationStatusRefreshContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_availabilities, a3);
  }

  return v7;
}

- (CKPendingConversationStatusRefreshContext)init
{
  return [(CKPendingConversationStatusRefreshContext *)self initWithAvailabilities:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CKPendingConversationStatusRefreshContext);
  [(CKPendingConversationStatusRefreshContext *)v4 setAvailabilities:self->_availabilities];
  [(CKPendingConversationStatusRefreshContext *)v4 setIsForPendingConversation:self->_isForPendingConversation];
  id v5 = (void *)[(IMServiceReachabilityContext *)self->_customContext copy];
  [(CKPendingConversationStatusRefreshContext *)v4 setCustomContext:v5];

  v6 = (void *)[(NSSet *)self->_preconditionsIgnoredForServices copy];
  [(CKPendingConversationStatusRefreshContext *)v4 setPreconditionsIgnoredForServices:v6];

  return v4;
}

- (BOOL)isForPendingConversation
{
  return self->_isForPendingConversation;
}

- (void)setIsForPendingConversation:(BOOL)a3
{
  self->_isForPendingConversation = a3;
}

- (IMServiceReachabilityContext)customContext
{
  return self->_customContext;
}

- (void)setCustomContext:(id)a3
{
}

- (NSSet)preconditionsIgnoredForServices
{
  return self->_preconditionsIgnoredForServices;
}

- (void)setPreconditionsIgnoredForServices:(id)a3
{
}

- (CKRecipientAvailabilities)availabilities
{
  return self->_availabilities;
}

- (void)setAvailabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilities, 0);
  objc_storeStrong((id *)&self->_preconditionsIgnoredForServices, 0);

  objc_storeStrong((id *)&self->_customContext, 0);
}

@end